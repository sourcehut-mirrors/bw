
/*
 * obs_point.c    Push around the various math functions to trace a
 *                trivial ray of light.
 *
 * Copyright (C) Dennis Clarke 2019
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */



/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>

#include "v.h"

int cplex_mat3x3_print( vec_type *row1, vec_type *row2, vec_type *row3 );

int main ( int argc, char **argv)
{

    /* We will need a whole collection of temporary vectors
     * as intermediate values in the computation. */
    vec_type tmp[12];

    /* also some complex values */
    cplex_type c_tmp[4];

    vec_type grad, grad_norm, reflect;
    double vec_T_mag, theta_i;
    int intercept_cnt = -1;

    /* In the repo we have some math notes :
     *
     *   lastmiles/ray_trace/math_notes/notes_rt_math_006.png
     *
     * per our diagrams we are just solving for k in the complex
     * coefficient quadratic */
    cplex_type k_val[2];

    /* If we actually do get an intercept then we need to determine
     * the closest forward looking point which is our actual point
     * of intercept H.
     * We can call that the hit_point just to be consistent with
     * the diagrams thus far where we use H and hit_point to mean
     * the actual intercept. */
    vec_type hit_point;

    /* We must first define where our observation plane is in R3
     * as a point and a normal direction. The obs_normal direction
     * will be the direction of all rays that we trace. */
    vec_type obs_origin, obs_normal;

    /* The observation plane has its own coordinate system and
     * thus we have x_prime_hat_vec and y_prime_hat_vec as ortogonal
     * and normalized vectors. See notes_rt_math_004_m.png */
    vec_type x_prime_hat_vec, y_prime_hat_vec;

    /* To locate a given point L_0 on the observation plane we will
     * need scalar distances away from the observation plane
     * center along the directions x_prime_hat_vec and
     * y_prime_hat_vec */
    double x_prime, y_prime;

    /* All of the above merely allows us to compute a starting
     * point for our ray to trace along the direction of the
     * vector obs_normal. In the diagrams this may be called L_0
     * on the observation plane. */
    vec_type obs_point;

    /* the ellipsoid is described by an equation that requires
     * a location and values for the axi as well as other
     * parameters. All of these are described in the math notes
     * at https://www.genunix.com/dclarke/math_notes/
     */
    vec_type sign_data, object_location, semi_major_axi, ray_direct;

    /* Test case will be an observation plane at ( 12, 0, 0 ) */
    cplex_vec_set( &obs_origin, 12.0, 0.0, 0.0, 0.0, 0.0, 0.0);

    printf("\nINFO : viewport O obs_origin = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                      obs_origin.x.r, obs_origin.y.r, obs_origin.z.r );

    /* Observation direction is along negative i_hat basis vector
     * and this becomes the Ri later. */
    cplex_vec_set( &obs_normal, -1.0, 0.0, 0.0, 0.0, 0.0, 0.0);

    printf("\nINFO : viewport direction obs_normal = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                      obs_normal.x.r, obs_normal.y.r, obs_normal.z.r );

    /* we arbitrarily choose the x_prime_hat_vec and y_prime_hat_vec
     * x_prime_hat_vec is < 0, 1, 0 > 
     * y_prime_hat_vec is < 0, 0, 1 >
     */
    cplex_vec_set( &x_prime_hat_vec, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0);
    cplex_vec_set( &y_prime_hat_vec, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

    printf("     : viewport x_prime basis vector = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
       x_prime_hat_vec.x.r, x_prime_hat_vec.y.r, x_prime_hat_vec.z.r );

    printf("     : viewport y_prime basis vector = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
       y_prime_hat_vec.x.r, y_prime_hat_vec.y.r, y_prime_hat_vec.z.r );

    /* Look closely at the diagram on page 4 of the math notes
     *     https://www.genunix.com/dclarke/math_notes
     *
     * See the yz observation plane that hangs in space at the
     * x = 12 distance from the origin where we select a point
     * on that plane. */
    x_prime = 1.7;
    y_prime = -2.0;

    /* Some more curious test data examples : 
     *
     * (1) manually calculated to be sqrt(0.5) distance
     *     from the center of a sphere in the yz-plane
     *         x_prime =  0.54772255750516611345;
     *         y_prime = -0.44721359549995793928;
     *
     * (2) far more trivial
     *     x_prime = M_SQRT1_2;
     *     y_prime = M_SQRT1_2;
     */


    printf("INFO : initial x' and y' : ( %-+18.12e, %-+18.12e )\n\n",
                                                    x_prime, y_prime );

    /* All of the above allows us to compute a starting point on
     * the observation plane in R3 and in the coordinate system
     * of the observation object.  This is also called L_0 in the
     * various diagrams.
     *
     * obs_point = x_prime * x_prime_hat_vec
     *           + y_prime * y_prime_hat_vec
     *           + obs_origin
     *
     * Note that the call to cplex_vec_scale() will multiply
     * the vector by a scalar value.
     */
    cplex_vec_scale( tmp,   &x_prime_hat_vec, x_prime );
    cplex_vec_scale( tmp+1, &y_prime_hat_vec, y_prime );

    /* add those two vectors */
    cplex_vec_add( tmp+2, tmp, tmp+1);

    /* add the obs_origin vector */
    cplex_vec_add( tmp, tmp+2, &obs_origin );

    /* copy the result into the obs_point vector */
    cplex_vec_copy( &obs_point, tmp );

    printf("\nINFO : L obs_point = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                      obs_point.x.r, obs_point.y.r, obs_point.z.r );
    printf("\n\n");

    /* At this moment we have the observation point and the direction
     * of the plane within obs_normal. What we need is to pass all
     * this to an intercept function that will determine a
     * k index value on the ray trace line.
     *
     * See page 4, 5 and 6 of the notes :
     *     https://www.genunix.com/dclarke/math_notes/notes_rt_math_004_m.png
     *
     * So clearly we need :
     *
     *     Our L point is obs_point along with a ray_direction.
     *     We shall need the sign_data, object_location and the
     *     semi_major_axi of that ellipsoid.
     *
     *     At the moment for this test we shall use :
     *
     *         sign_data = < 1, 1, 1 >
     *
     *         object_location = < 0, 0, 0 >
     *
     *         semi_major_axi = < 5, 2, 6 >
     *
     *         ray_direct = obs_normal where this must be a
     *                           normalized vector
     *
     * That ellipsoid can be seen in the diagram on page 4.
     *
     * Within the set of signs Sx, Sy, and Sz we do not care about
     * the complex component and merely want the real. The same
     * may be said for object_location, semi_major_axi and the
     * direction of our ray called ray_direct */
    cplex_vec_set( &sign_data, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0);

    /* By default we were using an object at the origin but we can
     * shift around for testing purposes. */
    cplex_vec_set( &object_location, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    printf("INFO : object_location = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                  object_location.x.r,
                  object_location.y.r,
                  object_location.z.r );

    /* In the diagrams we used had a=5, b=2 and c=6 for the length
     * of each semi-major axi on the x, y and z directions.
     *
     * Note that this cplex_vec_set() accepts six FP64 values
     * wherein they are Xr, Xi, Yr, Yi, Zr, Zi for the X, Y, Z
     * coordinates and both real and imaginary values. */
    cplex_vec_set( &semi_major_axi, 5.0, 0.0, 2.0, 0.0, 6.0, 0.0);
    printf("INFO : semi_major_axi = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                    semi_major_axi.x.r, 
                    semi_major_axi.y.r,
                    semi_major_axi.z.r );

    /* the ray direction must be normalized */
    if ( cplex_vec_normalize( &ray_direct, &obs_normal ) == MATH_OP_FAIL ) {
        fprintf(stderr,"FAIL : normalize obs_normal vector\n");
        fprintf(stderr,"     : at %s : %d\n" __FILE__, __LINE__ );
    }

    printf("INFO : R_hat ray_direct = ");
    printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                      ray_direct.x.r, ray_direct.y.r, ray_direct.z.r );
    printf("\n\n");

    /* Now we call our intercept function. 
     *
     * Correction from Paul in May 2023 wherein he smartly notes we
     * should be using the normalized observation vector. Damn it,
     * Janet, we just did that computation above! So use it.
     */
    if ( icept( k_val, &intercept_cnt, &sign_data, &object_location,
                        &semi_major_axi, &obs_point,
                        &ray_direct ) == MATH_OP_FAIL ) {

        fprintf(stderr,"FAIL : icept returns MATH_OP_FAIL\n");

        return EXIT_FAILURE;
    }

    /* We will always have two possible intercepts even if
     * they are complex values or two values that are the 
     * same. However the actual real intercepts are actually
     * useful here. Complex values would indicate that there
     * was no intercept at all with the ellipsoid. */
    printf("intercept_cnt = %i\n", intercept_cnt );

    printf("INFO : k_val[0] = ( %-+18.12e, %-+18.12e )\n",
                           k_val[0].r, k_val[0].i );
    printf("     : k_val[1] = ( %-+18.12e, %-+18.12e )\n",
                           k_val[1].r, k_val[1].i );

    if ( intercept_cnt > 0 ) {

        /* If we have non-zero intercept_cnt number of real roots to the
         * complex coefficient quadratic.
         *
         * See page 5 of the math notes at : 
         * 
         *     https://www.genunix.com/dclarke/math_notes
         *
         *
         * We may now compute the actual hit point H and return it in pt.
         *
         * The k_val is a position on the sight line L as measured from
         * the observation plane. A value of zero would be the point L_0
         * on the observation plane. A negative value would indicate a
         * location "behind" the observation plane where we consider the
         * direction of the plane normal vector to be positive. If there
         * is no valid forward looking points of intercept then a call
         * to surface_icept_pt() will return a null vector and the status
         * MATH_OP_FAIL. Otherwise we return a MATH_OP_SUCCESS along with
         * the point of interception in pt */

        if ( surface_icept_pt( &hit_point, intercept_cnt,
                               &k_val[0], &obs_point,
                               &ray_direct) == MATH_OP_SUCCESS ) {

            printf("\nDBUG : We have a good intercept point\n");
            printf("INFO : H hit_point = ");
            printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                      hit_point.x.r, hit_point.y.r, hit_point.z.r );
            printf("\n");

            printf("DBUG : object_location = ");
            printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                          object_location.x.r,
                          object_location.y.r,
                          object_location.z.r );

            gradient( &grad,
                      &sign_data, &object_location,
                      &semi_major_axi, &hit_point );

            printf("\n------------------------------------------\n");
            printf("INFO : N gradient = ");
            printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                              grad.x.r, grad.y.r, grad.z.r );

            if ( cplex_vec_normalize( &grad_norm, &grad ) == MATH_OP_FAIL ) {
                fprintf(stderr,"FAIL : normalize obs_normal vector\n");
                fprintf(stderr,"     : at %s : %d\n" __FILE__, __LINE__ );
            }

            printf("     : normalized = ");
            printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                       grad_norm.x.r, grad_norm.y.r, grad_norm.z.r );

            /* We should attempt to compute the T tangent vector in
             * the plane of incidence if and only if N is not parallel
             * to the incident ray_direct. We use -Ri for our vector
             * due to right-hand rule of the supposedly physical
             * universe. So T == -Ri X N here.
             *
             * See page 1 at https://www.genunix.com/dclarke/math_notes
             *
             *
             * Note that tmp[3] will be -Ri
             */
            cplex_vec_scale( tmp+3, &ray_direct, -1.0 );
            printf("\nINFO : -Ri = < %-+18.12e, %-+18.12e, %-+18.12e >\n",
                               tmp[3].x.r, tmp[3].y.r, tmp[3].z.r );

            /* What is the angle of incidence ?
             *
             * This is a complex vector dot product however we are not
             * going to bother with Hermitian angle issues. Please see
             * a full discussion in the PDF doc hermitian_angle_9904077.pdf
             *
             *     https://www.genunix.com/dclarke/math_notes/
             *
             * Here we can take advantage of IEEE754-2008 specification
             * just to check for a zero that is positive or negative. A
             * proper angle between two real vectors in R3 space will
             * never return a non-zero imaginary value. */
            cplex_vec_dot( c_tmp, &grad_norm, tmp+3);
            if ( !(c_tmp->i == 0.0) ) {
                /* this should never happen */
                fprintf(stderr,"FAIL : bizarre complex dot product");
                fprintf(stderr," dot( N, -Ri )\n");
                fprintf(stderr,"     :  = ( %-+18.12e, %-+18.12e )\n",
                                                   c_tmp->r, c_tmp->i );
                fprintf(stderr,"BAIL : we are done.\n\n");
                return EXIT_FAILURE;
            } else {
                printf("     : dot( N, -Ri ) = %-+18.12e\n", c_tmp->r );
            }

            /* Clearly the arc-cosine of the real value will be our
             * vector angle in radians. */
            theta_i = acos(c_tmp->r);
            printf("     : theta_i = %-+18.12e radians\n", theta_i );
            printf("     :         = %-+18.12e degrees\n", theta_i * 180.0/M_PI );

            /* here we check for an angle that is so small as to be
             * considered effectively zero. */
            if ( fabs(theta_i) < RT_ANGLE_EPSILON ) {
                if ( theta_i == 0.0 ) {
                    fprintf(stderr,"WARN : theta_i is zero!\n");
                } else {
                    fprintf(stderr,"WARN : theta_i too small.\n");
                }
            }

            /* As mentioned above we now need T == -Ri X N where
             * we left -ri in the vector tmp[3] */
            cplex_vec_cross( tmp+4, tmp+3, &grad_norm );

            if ( cplex_vec_normalize( &ray_direct, &obs_normal ) == MATH_OP_FAIL ) {
                fprintf(stderr,"FAIL : normalize obs_normal vector\n");
                fprintf(stderr,"     : at %s : %d\n" __FILE__, __LINE__ );
            }

            printf("\n\nINFO : -Ri X N = ");
            printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                               tmp[4].x.r, tmp[4].y.r, tmp[4].z.r );

            vec_T_mag = cplex_vec_mag( tmp+4 );
            if ( ( vec_T_mag < RT_EPSILON )
                    ||
                 ( fabs(theta_i) < RT_ANGLE_EPSILON ) ) {

                if ( vec_T_mag == 0.0 ) {
                    printf("WARN : null vector result from -Ri x N\n");
                } else {
                    printf("WARN : tiny vector result from -Ri x N\n");
                }

                /* At this point there will be no solution using Cramer's
                 * method as the denominator matrix will be determinant
                 * of zero. However geometrically we may say that the
                 * reflected vector is the same as the normal N. */
                 cplex_vec_copy( &reflect, &grad_norm );
                 printf("INFO : Rr = < %-+18.12e, %-+18.12e, %-+18.12e > ??\n",
                                 reflect.x.r, reflect.y.r, reflect.z.r);
                 printf("     : this is just the surface gradient N\n");

            } else {

                /* Cramer's Method and may as well embrace it */
                if ( cplex_vec_normalize( tmp+5, tmp+4 ) == MATH_OP_FAIL ) {
                    fprintf(stderr,"FAIL : normalize obs_normal vector\n");
                    fprintf(stderr,"     : at %s : %d\n" __FILE__, __LINE__ );
                }

                printf("     : this is the plane of incidence tangent\n");
                printf("     : T = ");
                printf("< %-+18.12e, %-+18.12e, %-+18.12e >\n",
                               tmp[5].x.r, tmp[5].y.r, tmp[5].z.r );
                printf("     : Cramer\'s Method needed from here\n");

                /*****************************************************
                 * We need a left hand 3x3 matrix of rows T, N, -Ri
                 *
                 *          T   is in tmp[5]        normalized
                 *          N   is in grad_norm     normalized
                 *        -Ri   is in tmp[3]        normalized
                 *
                 * Right hand column needs 0,  Cos ( theta_i )  and
                 * lastly cos ( 2 x theta_i ).
                 *
                 * Note that theta_i = acos( dot( -Ri, N ) )
                 * and also we have c_tmp[0] = dot( -Ri, N ) wherein
                 * we only need the real component.
                 *
                 * Thus we need rt hand column 0, c_tmp[0], 2*c_tmp[0]
                 *
                 **/

                /* begin by copying the required data into tmp vectors
                 * for the left hand 3x3 matrix */

                 cplex_vec_copy( tmp+6, tmp+5 );  /*  T  */
                 cplex_vec_copy( tmp+7, &grad_norm );  /*  N  */
                 cplex_vec_copy( tmp+8, tmp+3 );  /* -Ri */

                 /* lets print out a simplified 3x3 matrix here */
                 printf ("\nLeft hand 3x3 matrix is :\n");
                 cplex_mat3x3_print( tmp+6, tmp+7, tmp+8 );

                 cplex_det( c_tmp+1, tmp+6, tmp+7, tmp+8 );

                 printf ("\nDET == ( %-+18.12e, %-+18.12e )\n\n", c_tmp[1].r, c_tmp[1].i );

                 /* slam together a right hand column with
                  * 0, cos(theta_i), cos(2 * theta_i) 
                  *
                  * 18 Nov 2020 can not fucking believe this slipped
                  * past me. While drinking Crown Royal and also some
                  * amazing Rochefort 8 we discover the right hand
                  * column is slightly trash.  Do we really need to
                  * toss in cos( theta_i ) or can we not use the result
                  * from the earlier dot product of two normalized 
                  * vectors? WTF bat man ?  In this case the c_tmp->r
                  * is the damn angle. See above.
                  * */
                 cplex_vec_set( tmp+9, 0.0, 0.0,
                                       c_tmp->r, 0.0,
                                       cos(2 * theta_i), 0.0);

                 printf ("     : rh_col = %-+18.12e, %-+18.12e, %-+18.12e\n",
                         tmp[9].x.r, tmp[9].y.r, tmp[9].z.r );

                 /* let us now call cramer */
                 if ( cplex_cramer( tmp+10, tmp+6, tmp+7, tmp+8, tmp+9 ) == MATH_OP_FAIL ) {
                     printf("dbug : There is no valid solution.\n");
                 } else {

                     if (    ( fabs(tmp[10].x.i) > 0.0 )
                          || ( fabs(tmp[10].x.i) > 0.0 )
                          || ( fabs(tmp[10].x.i) > 0.0 ) ) {

                         printf("     : result col = < ( %-+18.12e, %-+18.12e ),\n",
                                     tmp[10].x.r, tmp[10].x.i );
                         printf("                      ( %-+18.12e, %-+18.12e ),\n",
                                     tmp[10].y.r, tmp[10].y.i );
                         printf("                      ( %-+18.12e, %-+18.12e ) >\n",
                                     tmp[10].z.r, tmp[10].z.i);
                         printf("    W A R N I N G : complex vector solution\n\n");

                     } else {
                         printf("     : result col = < %-+18.12e , %-+18.12e , %-+18.12e >\n\n",
                                     tmp[10].x.r, tmp[10].y.r, tmp[10].z.r );
                     }
                 }
            }
        } else {
            printf("INFO : no intercept point\n");
        }

    } else {
        printf("INFO : no real solutions\n");
    }

    return EXIT_SUCCESS;

}

int cplex_mat3x3_print( vec_type *row1,
                        vec_type *row2,
                        vec_type *row3 )
{

    printf ("    +------------------------");
    printf ("+------------------------");
    printf ("+------------------------+\n");

    printf ("    |                        ");
    printf ("|                        ");
    printf ("|                        |\n");

    printf (" T  |  %-+18.12e   ", row1->x.r );
    printf ("|  %-+18.12e   ", row1->y.r );
    printf ("|  %-+18.12e   |\n", row1->z.r );

    printf ("    |                        ");
    printf ("|                        ");
    printf ("|                        |\n");

    printf ("    +------------------------");
    printf ("+------------------------");
    printf ("+------------------------+\n");

    printf ("    |                        ");
    printf ("|                        ");
    printf ("|                        |\n");

    printf (" N  |  %-+18.12e   ", row2->x.r );
    printf ("|  %-+18.12e   ", row2->y.r );
    printf ("|  %-+18.12e   |\n", row2->z.r );

    printf ("    |                        ");
    printf ("|                        ");
    printf ("|                        |\n");

    printf ("    +------------------------");
    printf ("+------------------------");
    printf ("+------------------------+\n");

    printf ("    |                        ");
    printf ("|                        ");
    printf ("|                        |\n");

    printf ("-Ri |  %-+18.12e   ", row3->x.r );
    printf ("|  %-+18.12e   ", row3->y.r );
    printf ("|  %-+18.12e   |\n", row3->z.r );

    printf ("    |                        ");
    printf ("|                        ");
    printf ("|                        |\n");

    printf ("    +------------------------");
    printf ("+------------------------");
    printf ("+------------------------+\n\n");

    return ( EXIT_SUCCESS );

}

