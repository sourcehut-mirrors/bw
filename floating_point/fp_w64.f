C     FORTRAN FOO TEST 25 AUG 2026 WITH OPENVMS 8.4
      PROGRAM FOO
      DOUBLE PRECISION U
      INTEGER J
      DIMENSION U(48)
      U(1)= 2.0
      U(2)= -4
      U(3)= 111.0 - 1130.0 / U(2) + 3000.0 / ( U(1) * U(2) )
      WRITE(*,10) U(1)
C     FORMAT FOR OUTPUT OF FLOATING POINT
10    FORMAT(3x,'set     u[ 0] = ', G24.16)
      WRITE(*,20) U(2)
20    FORMAT(3x,'and     u[ 1] = ', G24.16)
      WRITE(*,30) U(3)
30    FORMAT(3x,'compute u[ 2] = ', G24.16)
C
C     WE NEED A BETTER FORMAT METHOD FOR INDEX J IN LOOP
      DO 40 J = 4, 32
          U(J) = 111.0 - 1130.0 / U(J-1)
     &           + 3000.0 / ( U(J-2) * U(J-1) )
          WRITE(*,50) J-1, U(J)
40    CONTINUE
C     THIS SHOULD ALLOW ME TO USE THE INDEX J
50    FORMAT(11x,'u[', I2, '] = ', G24.16)
C
C       ***** FOR SOME REASON THIS IS BETTER ??? *****
C50    FORMAT(11X, 'u[', I2, '] = ', G24.16, 1X, A4)
C       ***** BUT I DO NOT GET IT ??? ****************
      END
