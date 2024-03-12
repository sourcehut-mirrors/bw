
/*
 * cat_qsort.c  read a SHA512 hash catalog file and then sort
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <errno.h>
#include <locale.h>
#include <limits.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <fcntl.h>

#define VERBOSE 1
int sysinfo(int verbose);

typedef struct node_element {
    /* 128 chars for the sha512 hash plus the nul char */
    char sha512[129];
    char *filename;
    struct node_element *next;
    struct node_element *prev;
} node_element;

/* find last node */
struct node_element *lastnode_element(struct node_element *root)
{
    /* this is verbose but also really clear. */
    while ( (root != NULL) && ( (root->next) != NULL) ) {
        root = root->next;
    }
    return root;
}

void swap_data(struct node_element **this, struct node_element **that) {
    /* swap the data between nodes this and that */
    char *tmp_filename = (*this)->filename;
    char tmp[_POSIX_PATH_MAX+128+3];

    strncpy(tmp,(*this)->sha512,129);
    strncpy((*this)->sha512,(*that)->sha512,129);
    strncpy((*that)->sha512,tmp,129);

    /* swap the filename pointers */
    (*this)->filename = (*that)->filename;
    (*that)->filename = tmp_filename;
}

/* suppose that the last element is the pivot.
 * get the pivot element to the correct location in sort order
 * move all smaller elements to left
 * move bigger elements to right */
struct node_element *partition(struct node_element *l, struct node_element *h)
{
    char pivot_sha512[129];

    /* look at previous element */
    struct node_element *i = l->prev;

    /* init the node j for our loop */
    struct node_element *j = l;

    strncpy(pivot_sha512, h->sha512, 129);

    /* walk through the left of the list */
    for ( ; j != h; j = j->next) {

        if ( strncmp(j->sha512, pivot_sha512, 128) < 0 ) {
            /* move to next node if we can */
            i = ( (i == NULL) ? l : i->next );
            if ( i != j ) swap_data(&i,&j);
        }
    }

    /* again move to the next node if we can */
    i = ( (i == NULL) ? l : i->next );
    if ( i != h ) swap_data(&i,&h);
    return i;
}

/* recursive quicksort */
void recursive_qs(struct node_element *l, struct node_element *h)
{
    if (h != NULL && l != h && l != h->next) {
        struct node_element *p = partition(l, h);
        recursive_qs(l, p->prev);
        recursive_qs(p->next, h);
    }
}

/* quick sort a linked list by calling recursive_qs()  */
void qs(struct node_element *head)
{
    /* Find last node */
    struct node_element *h = lastnode_element(head);

    /* Call the recursive QuickSort */
    recursive_qs(head, h);
}

/* print the whole list */
void printout(struct node_element *head)
{
    while (head) {
        printf("%s  %s\n", head->sha512, head->filename);
        head = head->next;
    }
    printf("\n");
}

/* insert a node at the head of the list */
void push(struct node_element **head_of_list, char *line_data) {
    size_t j;
    struct node_element *new_node = (struct node_element *)calloc(1, sizeof(struct node_element ));
    if ( new_node == NULL ) {
        /* really? a memory fault? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        exit(EXIT_FAILURE);
    }

    for (j = 0; (line_data[j]!=' '); ++j) {
        new_node->sha512[j] = line_data[j];
    }
    new_node->sha512[j] = '\0';
    fprintf(stdout,"%3zu  %s ", j, new_node->sha512);

    while (line_data[j] == ' ') j++;

    /* we need enough room for the filename minus the sha512 hash string */
    new_node->filename=calloc(strlen(line_data) - j, sizeof(unsigned char));
    if ( new_node->filename == NULL ) {
        /* really? a memory fault? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        exit(EXIT_FAILURE);
    }

    /* lets try to avoid the copy of the trailing 0x0ah NL char */
    strncpy(new_node->filename, line_data+j, strlen(line_data)-j-1);
    fprintf(stdout,"%s\n", new_node->filename);

    /* prev is NULL because this is the new head of list element */
    new_node->prev = NULL;

    /* place the rest of the list after this new node */
    new_node->next = *head_of_list;

    /* make sure the old head node points to new node as prev */
    if (*head_of_list != NULL) {
        (*head_of_list)->prev = new_node;
    } else {
        /* this should only ever happen once */
        fprintf (stderr,"INFO  : head_of_list is NULL\n");
        fprintf (stderr,"      : we are building a new linked list\n");
    }

    /* overwrite the head pointer to our new node */
    *head_of_list = new_node;
}

int main(int argc, char **argv) {

    struct node_element *foo = NULL;
    struct stat status_buffer;
    int status;
    size_t q, p;

    /* we need enough room for the SHA512 hash string as well
     * as the entire filename and then intermediate space or
     * two spaces and a terminating nul char
     *
     * n.b.: most compilers will optimize the next line
     *        into just being a memset */
    char cat_line[ _POSIX_PATH_MAX + 128 + 3 ] = {0};

    /* we will need a file pointer */
    FILE *cat_file;

    char *cat_fid = calloc(q+1,sizeof(unsigned char));
    if ( cat_fid == NULL ) {
        /* really? a memory fault? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        exit(EXIT_FAILURE);
    }

    setlocale (LC_ALL, "POSIX");
    sysinfo(VERBOSE);

    if ( argc < 2 ) {
usage:
        fprintf(stderr,"USAGE : %s sha512_catalog_filename\n",argv[0]);
        return EXIT_FAILURE;
    }

    q = strlen(argv[1]);
    /* if q > 240 or so then we have a major problem. The path is
     * too long. Or check for _POSIX_PATH_MAX for example.
     */
    if ( q > _POSIX_PATH_MAX ) {
        fprintf(stderr,"FAIL  : filename is too long\n");
        goto usage;
    }

    /* we could have just done strncpy here */
    for ( p=0; (argv[1][p]!='\0'); ++p) {
        cat_fid[p] = argv[1][p];
    }

    /* Is the last character a forward slash "/" ?
     * This is easy to check before we call stat() and
     * check the st_mode. */
    if ( (argv[1][q-1]) == '/' ) {
dir_name:
        free(cat_fid);
        fprintf(stderr,"FAIL  : filename is a directory?\n");
        goto usage;
    }

    errno = 0;
    status = stat(cat_fid, &status_buffer);
    if (status != 0) {
        perror("FAIL ");
        free(cat_fid);
        goto usage;
    }

    /* now we check the st_mode for a few things
     * yes this conditional is verbose on purpose
     * also any sequence of octal digits after a leading 0 is valid */
    printf("INFO  : status_buffer.st_mode = %o octal\n",status_buffer.st_mode);
    if ( (status_buffer.st_mode & 040000) == 040000) {
        /* S_IFDIR  0040000  directory */
        /* yes that conditional is verbose as hell on purpose */
        goto dir_name;
    }

    /* check if we have a regular file S_IFREG  0100000 */
    if ( (status_buffer.st_mode & 0100000) != 0100000) {
        free(cat_fid);
        fprintf(stderr,"FAIL  : not a regular file?\n");
        goto usage;
    }

    printf("\n----- Read the SHA512 Catalog -----\n");
    cat_file = fopen(cat_fid, "r" );
    if (cat_file != NULL) {
        while( fgets(cat_line,sizeof(cat_line),cat_file)!= NULL) {
            fprintf(stdout,"%s",cat_line);
            push(&foo, cat_line);
        }
        fclose(cat_file);
    } else {
        /* TODO a bit of handling here and provide the usual
         * error messages etc */
        perror(cat_fid);
    }
    printf("\n----- Before QSort ----------------\n");

    qs(foo);

    printf("\n----- After QSort -----------------\n");
    printout(foo);

    /* free up all that stuff we calloc'd */
    foo = lastnode_element(foo);
    while ( (foo->prev) != NULL ) {
        free(foo->filename);
        foo->filename = NULL;
        foo = foo->prev;
        free(foo->next);
        foo->next = NULL;
    }
    free(foo->filename);
    foo->filename = NULL;
    free(foo);
    foo = NULL;
    free(cat_fid);
    cat_fid = NULL;

    return EXIT_SUCCESS;
}

