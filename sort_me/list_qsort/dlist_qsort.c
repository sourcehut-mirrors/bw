
/*
 * dlist_qsort.c try to quick sort a linked list
 * Copyright (C) Dennis Clarke 2021
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

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>

typedef struct node_element {
    int    num_dat;
    struct node_element *next;
    struct node_element *prev;
} node_element;

void switch_around(int *this, int *that) {
    int tmp = *this;
    *this = *that;
    *that = tmp;
}

/* find last node */
struct node_element *lastnode_element(struct node_element *root)
{
    /* this is verbose but also really clear. */
    while ( (root != NULL) && ( (root->next) != NULL) ) {
        root = root->next;
    }

    return root;
}

/* suppose that the last element is the pivot.
 * get the pivot element to the correct location in sort order
 * move all smaller elements to left
 * move bigger elements to right */
struct node_element *partition(struct node_element *l, struct node_element *h)
{
    /* set pivot as h element */
    int x = h->num_dat;

    /* look at previous element */
    struct node_element *i = l->prev;

    /* walk through the left of the list */
    for (struct node_element *j = l; j != h; j = j->next) {
        if ( (j->num_dat) <= x) {
            /* move to next node if we can */
            i = ( (i == NULL) ? l : i->next );

            switch_around(&(i->num_dat), &(j->num_dat));

        }
    }

    /* again move to the next node if we can */
    i = ( (i == NULL) ? l : i->next );

    switch_around(&(i->num_dat), &(h->num_dat));

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
        printf("%d ", head->num_dat);
        head = head->next;
    }
    printf("\n");
}

/* insert a node at the head of the list */
void push(struct node_element **head_of_list, int some_integer) {
    struct node_element *new_node = (struct node_element *)calloc(1, sizeof(struct node_element ));
    /* TODO would be nice to check if the calloc worked */
    new_node->num_dat = some_integer;

    /* prev is NULL because this is the new head of list element */
    new_node->prev = NULL;

    /* place the rest of the list after this new node */
    new_node->next = *head_of_list;

    /* make sure the old head node points to new node as prev */
    if ( *head_of_list != NULL) {
        (*head_of_list)->prev = new_node;
    } else {
        /* should only ever happen once */
        fprintf (stderr,"INFO : head_of_list is NULL\n");
    }

    /* overwrite the head pointer to our new node */
    *head_of_list = new_node;
}

int main(int argc, char **argv) {

    struct node_element *foo = NULL;
    push(&foo, 5);
    push(&foo, 20);
    push(&foo, -4);
    push(&foo, 3);
    push(&foo, 30);

    printf("* * * before sort * * *\n");
    printout(foo);

    qs(foo);

    printf("\n* * * after sort * * *\n");
    printout(foo);

    foo = lastnode_element(foo);
    while ( (foo->prev) != NULL ) {
        foo = foo->prev;
        free ( foo->next );
        foo->next = NULL;
    }
    free ( foo );
    foo = NULL;

    return EXIT_SUCCESS;
}

