
#include <openssl/evp.h>
#include <openssl/objects.h>
#include <stdio.h>
#include <stdlib.h>

void my_callback(const OBJ_NAME *obj, void *arg)
{
    /* 
     *  receives objects of OBJ_NAME type:
     *
     *  typedef struct obj_name_st {
     *      int type;
     *      int alias;
     *      const char *name;
     *      const char *data;
     *  } OBJ_NAME;
     *
     */

    printf("Digest: %s\n", obj->name);
}

int main(int argc, char **argv)
{
    void *my_arg;
    OpenSSL_add_all_digests();

    my_arg = NULL;
    OBJ_NAME_do_all(OBJ_NAME_TYPE_MD_METH, my_callback, my_arg);

    return EXIT_SUCCESS;
}

