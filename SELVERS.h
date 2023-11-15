/*
 * Uncomment a line to use YOUR version
 */

//
// at most one of the following two should be uncommented
// if both are commented out, use the solution code
//
//#define MYENCRYPT_C       // when defined will use your encrypt.c for Part 1
//#define MYENCRYPT_S       // when defined will use your encrypt.S for Part 1 

#if defined MYENCRYPT_S  && defined MYENCRYPT_C
#error "You can only have one of MYENCRYPT_S and MYENCRYPT_C defined"
#endif

//
// only one of the following two must be uncommented
//
#define MAIN_C            // Must be uncommented to use Cmain.c for Part 1
//#define MYMAIN_S          // when defined will use your main.S for Part 2

#if defined MYMAIN_S  && defined MAIN_C
#error "You can only have one of MYMAIN_S and MAIN_C defined"
#endif
#if !defined MYMAIN_S  && !defined MAIN_C
#error "You must have one of MYMAIN_S and MAIN_C defined"
#endif

//
// only one of the following two must be uncommented
//
#define RDBUF_C           // Must be uncommented to use Crdbuf.c for Part 1
//#define MYRDBUF_S         // when defined will use your rdbuf.S for Part 2

#if defined MYRDBUF_S  && defined RDBUF_C
#error "You can only have one of MYRDBUF_S and RDBUF_C defined"
#endif
#if !defined MYRDBUF_S  && !defined RDBUF_C
#error "You must have one of MYRDBUF_S and RDBUF_C defined"
#endif
