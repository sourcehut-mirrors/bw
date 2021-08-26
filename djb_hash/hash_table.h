
/* DJB Bernstein hash table */
/* this has been used every damn where for a long time but be
 * damned if I know the license. I will research that */

#include <inttypes.h>
#include <stdbool.h> 
#include <stdio.h>   
#include <stdlib.h>  
#include <string.h>  

/* An item inserted into a hash table.
 * As hash collisions can occur, multiple items can exist in one bucket.
 * Therefore, each bucket is a linked list of items that hashes to that bucket. */
typedef struct item item_t;
struct item
{
    char *key;
    char *value;
    item_t *next;
};

void item_print(item_t *i)
{
    printf("key=%s value=%s", i->key, i->value);
}

/* A hash table mapping a string to an integer. */
typedef struct htab htab_t;
struct htab
{
    item_t **buckets;
    size_t size;
};

/* Initialise a new hash table with n buckets.
 * pre: true
 * post: (return == false AND allocation of table failed)
 *       OR (all buckets are null pointers) */
bool htab_init(htab_t *h, size_t n)
{
    h->size = n;
    h->buckets = (item_t **)calloc(n, sizeof(item_t *));
    return h->buckets != 0;
}

/* The Bernstein hash function. */
size_t djb_hash(char *s)
{
    size_t hash = 5381;
    int c;
    while ((c = *s++) != '\0')
    {
        /* hash = hash * 33 + c */
        hash = ((hash << 5) + hash) + c;
    }
    return hash;
}


/*
 * DJBX33A (Daniel J. Bernstein, Times 33 with Addition)
 *
 * This is Daniel J. Bernstein's popular `times 33' hash function as
 * posted by him years ago on comp.lang.c. It basically uses a function
 * like ``hash(i) = hash(i-1) * 33 + str[i]''. This is one of the best
 * known hash functions for strings. Because it is both computed very
 * fast and distributes very well.
 *
 * The magic of number 33, i.e. why it works better than many other
 * constants, prime or not, has never been adequately explained by
 * anyone. So I try an explanation: if one experimentally tests all
 * multipliers between 1 and 256 (as RSE did now) one detects that even
 * numbers are not useable at all. The remaining 128 odd numbers
 * (except for the number 1) work more or less all equally well. They
 * all distribute in an acceptable way and this way fill a hash table
 * with an average percent of approx. 86%.
 *
 * If one compares the Chi^2 values of the variants, the number 33 not
 * even has the best value. But the number 33 and a few other equally
 * good numbers like 17, 31, 63, 127 and 129 have nevertheless a great
 * advantage to the remaining numbers in the large set of possible
 * multipliers: their multiply operation can be replaced by a faster
 * operation based on just one shift plus either a single addition
 * or subtraction operation. And because a hash function has to both
 * distribute good _and_ has to be very fast to compute, those few
 * numbers should be preferred and seems to be the reason why Daniel J.
 * Bernstein also preferred it.
 *
 *
 * -- Ralf S. Engelschall <rse@engelschall.com>
 */
unsigned long djb(unsigned char *str)
{
    unsigned long hash = 5381;
    int c;
    while (c = *str++)
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
    return hash;
}

/* Calculate the offset for the bucket for key in hash table. */
size_t htab_index(htab_t *h, char *key)
{
    return (size_t)djb(key) % h->size;
}

/* Find pointer to head of list for key in hash table. */
item_t *htab_bucket(htab_t *h, char *key)
{
    return h->buckets[htab_index(h, key)];
}

/* Find an item for key in hash table.
 * pre: true
 * post: (return == NULL AND item not found)
 *       OR (strcmp(return->key, key) == 0)   */
item_t *htab_find(htab_t *h, char *key)
{
    for (item_t *itm = htab_bucket(h, key); itm != NULL; itm = itm->next)
    {
        if (strcmp(itm->key, key) == 0)
        { // found the key */
            return itm;
        }
    }
    return NULL;
}

/* Add a key with value to the hash table.
 * pre: htab_find(h, key) == NULL
 * post: (return == false AND allocation of new item failed)
 *       OR (htab_find(h, key) != NULL)  */
bool old_htab_add(htab_t *h, char *key, char *value)
{
    /* allocate new item */
    item_t *newhead = (item_t *)calloc(1,sizeof(item_t));
    if (newhead == NULL)
    {
        /* fer fucks sake a better way to handle this
         * please ? */
        return false;
    }
    newhead->key = key;
    newhead->value = value;

    /* hash key and place item in appropriate bucket */
    size_t bucket = htab_index(h, key);
    newhead->next = h->buckets[bucket];
    h->buckets[bucket] = newhead;
    return true;
}

bool htab_add(htab_t *h, char *key, char *value)
{
    /* allocate new item */
    item_t *newhead = (item_t *)malloc(sizeof(item_t));
    if (newhead == NULL)
    {
        return false;
    }
    /* because we are using memory on the heap it may
     * be better to do strcpy here for the key and value
     * in order to assure that a free() in the calling
     * routine does not destroy our data */
    char *newkey = calloc(strlen(key)+1,(size_t)sizeof(unsigned char));
    char *newvalue = calloc(strlen(value)+1,(size_t)sizeof(unsigned char));
    strncpy(newkey,key,strlen(key));
    strncpy(newvalue,value,strlen(value));

    newhead->key = newkey;
    newhead->value = newvalue;

    /* hash key and place item in appropriate bucket */
    size_t bucket = htab_index(h, newkey);
    newhead->next = h->buckets[bucket];
    h->buckets[bucket] = newhead;
    return true;
}

/* Print the hash table.
   pre: true
   post: hash table is printed to screen */
void htab_print(htab_t *h)
{
    printf("hash table with %lu buckets\n", h->size);
    for (size_t i = 0; i < h->size; ++i)
    {
        printf("bucket %lu: ", i);
        if (h->buckets[i] == NULL)
        {
            printf("empty\n");
        }
        else
        {
            for (item_t *itm = h->buckets[i]; itm != NULL; itm = itm->next)
            {
                item_print(itm);
                if (itm->next != NULL)
                {
                    printf("\n       -> ");
                }
            }
            printf("\n");
        }
    }
}

/* Delete an item with key from the hash table.
   pre: htab_find(h, key) != NULL
   post: htab_find(h, key) == NULL */
void htab_delete(htab_t *h, char *key)
{
    item_t *head = htab_bucket(h, key);
    item_t *current = head;
    item_t *previous = NULL;
    while (current != NULL)
    {
        if (strcmp(current->key, key) == 0)
        {
            if (previous == NULL)
            { /* first item in list */
                h->buckets[htab_index(h, key)] = current->next;
            }
            else
            {
                previous->next = current->next;
            }
            free(current);
            break;
        }
        previous = current;
        current = current->next;
    }
}

/* Destroy an initialised hash table.
 * pre: htab_init(h)
 * post: all memory for hash table is released */
void htab_destroy(htab_t *h)
{
    /* free linked lists */
    for (size_t i = 0; i < h->size; ++i)
    {
        item_t *bucket = h->buckets[i];
        while (bucket != NULL)
        {
            item_t *next = bucket->next;
            free(bucket);
            bucket = next;
        }
    }

    /* free buckets array */
    free(h->buckets);
    h->buckets = NULL;
    h->size = 0;
}

