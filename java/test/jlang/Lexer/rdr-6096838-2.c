/* RUN: jlang-cc -pedantic -std=gnu89 -fsyntax-only -verify %s
 rdar://6096838
 */

long double d = 0x0.0000003ffffffff00000p-16357L; /* expected-warning {{ hexadecimal floating constants are a C99 feature }} */
