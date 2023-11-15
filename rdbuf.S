#ifndef MYRDBUF_S
#else
// version 1.1 11/29/2022 //
    .arch   armv6
    .arm
    .fpu    vfp
    .syntax unified

    // global constants
    #include "cipher.h"

    .extern fread
    .extern feof
    .extern ferror
    .text

    // int rdbuf(r0=FILE *in, r1=FILE *fpbook, r2=int cnt, r3=char *iobuf, 
    //            on the stack at ARG5 offset=char *bookbuf)
    // returns number of bytes read EXIT_FAIL otherwise
    // you can change or remove any comments in this file

    .type   rdbuf, %function
    .global rdbuf
    .equ    ARG5,  4 
    .equ    FP_OFF, 28
 
rdbuf:
    push    {r4-r9, fp, lr}
    add     fp, sp, FP_OFF

    // save the register args (r0-r3) into preserved registers
    // as there are many function calls
    
    // check for end of file feof(in)
    // if r0 is not zero at EOF, set r0 to 0 and return
    // otherwise check for read errors
    // check for error ferror(in)
    // if r0 is zero, no errors, do the reads
    // if r0 is not zero, set r0 to EXIT_FAIL and return

    // bytes = fread(r0=iobuf, r1=1, r2=cnt, r3=in)
    // save bytes so we can check that we read same bytes from bookfile
    // if r0 <= 0 return with r0 = 0

    // r0 = fread(r0=bookbuf, r1=1, r2=bytes, r3=fpbook)
    // the pointer to bookbuf is passed on the stack so
    // you need to do a ldr from ARG5 offset to get the address
    // to pass to the fread
    // if r0 on the return from fread is not equal to bytes 
    // (bytes is the value returned in r0 from the fread into iobuf above),
    // then return EXIT fail
    // otherwise set r0 = bytes and return

.Ldone:
    sub     sp, fp, FP_OFF
    pop     {r4-r9, fp, lr}
    bx      lr

    .size   rdbuf, (. - rdbuf)
    .section .note.GNU-stack,"",%progbits
.end
#endif
