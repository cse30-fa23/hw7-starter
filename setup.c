// version 1.0 11/12/2022
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include "cipher.h"
#include "setup.h"

int
setup(int argc, char *argv[], FILE **fpbook)
{
    int opt;
    char *bookname = NULL;  // name of bookfile to open

    /*
     * set parameters to default value to reduce segfaults when called
     * by faulty code
     */
    *fpbook = NULL;
    
    while ((opt = getopt(argc, argv, "b:")) != -1) {
        switch (opt) {
        case 'b':
            bookname = optarg;
            break;
        case '?':
            /* FALL THROUGH */
        default:
            fprintf(stderr, "Usage: %s -b <bookfile>\n", *argv);
            return EXIT_FAIL;
            /* NOT REACHED */
            break;
        }
    }

    if (optind != argc) {
        fprintf(stderr, "Usage: %s -b <bookfile>\n", *argv);
        return EXIT_FAIL;
    }

    if (bookname == NULL) {
        fprintf(stderr, "%s: -b bookfile must be specified\n", *argv);
        fprintf(stderr, "Usage: %s -b <bookfile>\n", *argv);
        return EXIT_FAIL;
    }

    /* open the bookfile */
    if ((*fpbook = fopen(bookname, "r")) == NULL) {
        fprintf(stderr, "%s: Unable to open bookfile %s\n", *argv, bookname);
        return EXIT_FAIL;
    }
    return EXIT_OK;
}
