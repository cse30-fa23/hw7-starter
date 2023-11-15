// version 1.0 11/12/2022
#ifndef CIPHER_H
#define CIPHER_H 1
#define	EXIT_OK		    0
#define	EXIT_FAIL	    -1
#define BITS            8
#ifndef __ASSEMBLER__
int encrypt(char *, char *, int);
#define DO_PRAGMA(x) _Pragma (#x)
#define TODO(x) DO_PRAGMA(message ("WARNING - " #x))
#else
.extern encrypt
#endif
#endif
