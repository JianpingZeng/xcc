# 1 "dlist.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "dlist.c"
# 66 "dlist.c"
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/assert.h" 1 3 4
# 37 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/assert.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 1 3 4
# 313 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/predefs.h" 1 3 4
# 314 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 2 3 4
# 346 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/cdefs.h" 1 3 4
# 353 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/cdefs.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/wordsize.h" 1 3 4
# 354 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/cdefs.h" 2 3 4
# 347 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 2 3 4
# 378 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/gnu/stubs.h" 1 3 4
# 379 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h" 2 3 4
# 38 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/assert.h" 2 3 4
# 66 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/assert.h" 3 4



extern void __assert_fail (__const char *__assertion, __const char *__file,
      unsigned int __line, __const char *__function)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, __const char *__file,
      unsigned int __line,
      __const char *__function)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));



# 67 "dlist.c" 2
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 1 3 4
# 30 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4




# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 1 3 4
# 211 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 3 4
typedef unsigned int size_t;
# 35 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 2 3 4

# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/types.h" 1 3 4
# 28 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/types.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/wordsize.h" 1 3 4
# 29 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;




__extension__ typedef signed long long int __int64_t;
__extension__ typedef unsigned long long int __uint64_t;







__extension__ typedef long long int __quad_t;
__extension__ typedef unsigned long long int __u_quad_t;
# 131 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/types.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/typesizes.h" 1 3 4
# 132 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/types.h" 2 3 4


__extension__ typedef __u_quad_t __dev_t;
__extension__ typedef unsigned int __uid_t;
__extension__ typedef unsigned int __gid_t;
__extension__ typedef unsigned long int __ino_t;
__extension__ typedef __u_quad_t __ino64_t;
__extension__ typedef unsigned int __mode_t;
__extension__ typedef unsigned int __nlink_t;
__extension__ typedef long int __off_t;
__extension__ typedef __quad_t __off64_t;
__extension__ typedef int __pid_t;
__extension__ typedef struct { int __val[2]; } __fsid_t;
__extension__ typedef long int __clock_t;
__extension__ typedef unsigned long int __rlim_t;
__extension__ typedef __u_quad_t __rlim64_t;
__extension__ typedef unsigned int __id_t;
__extension__ typedef long int __time_t;
__extension__ typedef unsigned int __useconds_t;
__extension__ typedef long int __suseconds_t;

__extension__ typedef int __daddr_t;
__extension__ typedef long int __swblk_t;
__extension__ typedef int __key_t;


__extension__ typedef int __clockid_t;


__extension__ typedef void * __timer_t;


__extension__ typedef long int __blksize_t;




__extension__ typedef long int __blkcnt_t;
__extension__ typedef __quad_t __blkcnt64_t;


__extension__ typedef unsigned long int __fsblkcnt_t;
__extension__ typedef __u_quad_t __fsblkcnt64_t;


__extension__ typedef unsigned long int __fsfilcnt_t;
__extension__ typedef __u_quad_t __fsfilcnt64_t;

__extension__ typedef int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


__extension__ typedef int __intptr_t;


__extension__ typedef unsigned int __socklen_t;
# 37 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 2 3 4
# 45 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 65 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 75 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 1 3 4
# 32 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/_G_config.h" 1 3 4
# 15 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/_G_config.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 1 3 4
# 16 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/_G_config.h" 2 3 4




# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/wchar.h" 1 3 4
# 83 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/_G_config.h" 2 3 4

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 53 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
# 33 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 2 3 4
# 53 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stdarg.h" 1 3 4
# 40 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 54 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 2 3 4
# 170 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 180 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 203 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 271 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 319 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
  __off64_t _offset;
# 328 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 364 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 416 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 460 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__));
# 490 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__));
# 76 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 2 3 4
# 89 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;




# 141 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/stdio_lim.h" 1 3 4
# 142 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (__const char *__filename) __attribute__ ((__nothrow__));

extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__));




extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) __attribute__ ((__nothrow__));








extern FILE *tmpfile (void) ;
# 186 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__)) ;
# 204 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 229 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 243 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4






extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) ;




extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 272 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4

# 283 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__)) ;
# 296 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes)
  __attribute__ ((__nothrow__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__));








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 394 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;




extern int scanf (__const char *__restrict __format, ...) ;

extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__));
# 425 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, __const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (__const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (__const char *__restrict __s, __const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf")

                          __attribute__ ((__nothrow__));
# 445 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 476 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (__const char *__restrict __s, __const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf")



     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 504 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 532 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 543 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 576 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;






extern char *gets (char *__s) ;

# 638 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);





extern int puts (__const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;

# 710 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream) ;








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 746 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 765 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
# 788 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4

# 797 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;








extern void perror (__const char *__s);






# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sys_errlist.h" 1 3 4
# 27 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern __const char *__const sys_errlist[];
# 827 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
# 846 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern FILE *popen (__const char *__command, __const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
# 886 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__));
# 916 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4

# 68 "dlist.c" 2
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 1 3 4
# 33 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 1 3 4
# 323 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 34 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 2 3 4


# 96 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 140 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__)) ;




extern double atof (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

# 311 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__)) ;


extern long int a64l (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 1 3 4
# 29 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 62 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 100 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
typedef __pid_t pid_t;




typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 133 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h" 1 3 4
# 74 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h" 3 4


typedef __time_t time_t;



# 92 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 104 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 134 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 2 3 4
# 147 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 1 3 4
# 148 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 195 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 217 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/endian.h" 1 3 4
# 37 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/endian.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/endian.h" 1 3 4
# 38 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/endian.h" 2 3 4
# 61 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/endian.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/byteswap.h" 1 3 4
# 62 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/endian.h" 2 3 4
# 218 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 2 3 4


# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 1 3 4
# 31 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/select.h" 1 3 4
# 32 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 2 3 4


# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigset.h" 1 3 4
# 24 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 35 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h" 1 3 4
# 120 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
# 45 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 2 3 4

# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/time.h" 1 3 4
# 69 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 47 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 67 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 99 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 3 4

# 109 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 121 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);



# 221 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 2 3 4


# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/sysmacros.h" 1 3 4
# 30 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/sysmacros.h" 3 4
__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__));
# 224 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 2 3 4
# 235 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 270 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/pthreadtypes.h" 1 3 4
# 38 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


typedef union
{
  char __size[36];
  long int __align;
} pthread_attr_t;


typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;




typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;


    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      int __spins;
      __pthread_slist_t __list;
    };
  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  long int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  long int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
# 141 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/pthreadtypes.h" 3 4
    unsigned char __flags;
    unsigned char __shared;
    unsigned char __pad1;
    unsigned char __pad2;

    int __writer;
  } __data;
  char __size[32];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[20];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h" 2 3 4



# 321 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__));







extern double drand48 (void) __attribute__ ((__nothrow__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__));



# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/alloca.h" 1 3 4
# 25 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/alloca.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 1 3 4
# 26 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__));






# 498 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 2 3 4




extern void *valloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




extern void abort (void) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 530 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4





extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
# 553 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4






extern void _Exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));






extern char *getenv (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




extern char *__secure_getenv (__const char *__name)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern int putenv (char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (__const char *__name, __const char *__value, int __replace)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (__const char *__name) __attribute__ ((__nothrow__));






extern int clearenv (void) __attribute__ ((__nothrow__));
# 604 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 615 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 637 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 658 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 707 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4





extern int system (__const char *__command) ;

# 729 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__)) ;






typedef int (*__compar_fn_t) (__const void *, __const void *);
# 747 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4



extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 766 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;

# 802 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));







extern int mblen (__const char *__s, size_t __n) __attribute__ ((__nothrow__)) ;


extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__)) ;


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__)) ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__));

extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__));








extern int rpmatch (__const char *__response) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 907 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern int posix_openpt (int __oflag) ;
# 942 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 958 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h" 3 4

# 69 "dlist.c" 2
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 1 3 4
# 28 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4





# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h" 1 3 4
# 34 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 94 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 125 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));






# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/xlocale.h" 1 3 4
# 28 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 162 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 2 3 4


extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 208 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4

# 233 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 260 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 279 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4



extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 312 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 340 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));
# 395 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4


extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (__const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__));

# 425 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__))

                        __attribute__ ((__nonnull__ (2)));
# 443 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 487 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 515 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
# 534 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 557 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__));


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 644 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h" 3 4

# 70 "dlist.c" 2
# 1 "accum.h" 1
# 39 "accum.h"
# 1 "types.h" 1
# 90 "types.h"
# 1 "../include/GL/gl.h" 1
# 94 "../include/GL/gl.h"
typedef enum {

 GL_FALSE = 0,
 GL_TRUE = 1,


 GL_BYTE = 0x1400,
 GL_UNSIGNED_BYTE = 0x1401,
 GL_SHORT = 0x1402,
 GL_UNSIGNED_SHORT = 0x1403,
 GL_INT = 0x1404,
 GL_UNSIGNED_INT = 0x1405,
 GL_FLOAT = 0x1406,
 GL_DOUBLE = 0x140A,
 GL_2_BYTES = 0x1407,
 GL_3_BYTES = 0x1408,
 GL_4_BYTES = 0x1409,


 GL_LINES = 0x0001,
 GL_POINTS = 0x0000,
 GL_LINE_STRIP = 0x0003,
 GL_LINE_LOOP = 0x0002,
 GL_TRIANGLES = 0x0004,
 GL_TRIANGLE_STRIP = 0x0005,
 GL_TRIANGLE_FAN = 0x0006,
 GL_QUADS = 0x0007,
 GL_QUAD_STRIP = 0x0008,
 GL_POLYGON = 0x0009,
 GL_EDGE_FLAG = 0x0B43,


 GL_VERTEX_ARRAY = 0x8074,
 GL_NORMAL_ARRAY = 0x8075,
 GL_COLOR_ARRAY = 0x8076,
 GL_INDEX_ARRAY = 0x8077,
 GL_TEXTURE_COORD_ARRAY = 0x8078,
 GL_EDGE_FLAG_ARRAY = 0x8079,
 GL_VERTEX_ARRAY_SIZE = 0x807A,
 GL_VERTEX_ARRAY_TYPE = 0x807B,
 GL_VERTEX_ARRAY_STRIDE = 0x807C,
 GL_NORMAL_ARRAY_TYPE = 0x807E,
 GL_NORMAL_ARRAY_STRIDE = 0x807F,
 GL_COLOR_ARRAY_SIZE = 0x8081,
 GL_COLOR_ARRAY_TYPE = 0x8082,
 GL_COLOR_ARRAY_STRIDE = 0x8083,
 GL_INDEX_ARRAY_TYPE = 0x8085,
 GL_INDEX_ARRAY_STRIDE = 0x8086,
 GL_TEXTURE_COORD_ARRAY_SIZE = 0x8088,
 GL_TEXTURE_COORD_ARRAY_TYPE = 0x8089,
 GL_TEXTURE_COORD_ARRAY_STRIDE = 0x808A,
 GL_EDGE_FLAG_ARRAY_STRIDE = 0x808C,
 GL_VERTEX_ARRAY_POINTER = 0x808E,
 GL_NORMAL_ARRAY_POINTER = 0x808F,
 GL_COLOR_ARRAY_POINTER = 0x8090,
 GL_INDEX_ARRAY_POINTER = 0x8091,
 GL_TEXTURE_COORD_ARRAY_POINTER = 0x8092,
 GL_EDGE_FLAG_ARRAY_POINTER = 0x8093,
        GL_V2F = 0x2A20,
 GL_V3F = 0x2A21,
 GL_C4UB_V2F = 0x2A22,
 GL_C4UB_V3F = 0x2A23,
 GL_C3F_V3F = 0x2A24,
 GL_N3F_V3F = 0x2A25,
 GL_C4F_N3F_V3F = 0x2A26,
 GL_T2F_V3F = 0x2A27,
 GL_T4F_V4F = 0x2A28,
 GL_T2F_C4UB_V3F = 0x2A29,
 GL_T2F_C3F_V3F = 0x2A2A,
 GL_T2F_N3F_V3F = 0x2A2B,
 GL_T2F_C4F_N3F_V3F = 0x2A2C,
 GL_T4F_C4F_N3F_V4F = 0x2A2D,


 GL_MATRIX_MODE = 0x0BA0,
 GL_MODELVIEW = 0x1700,
 GL_PROJECTION = 0x1701,
 GL_TEXTURE = 0x1702,


 GL_POINT_SMOOTH = 0x0B10,
 GL_POINT_SIZE = 0x0B11,
 GL_POINT_SIZE_GRANULARITY = 0x0B13,
 GL_POINT_SIZE_RANGE = 0x0B12,


 GL_LINE_SMOOTH = 0x0B20,
 GL_LINE_STIPPLE = 0x0B24,
 GL_LINE_STIPPLE_PATTERN = 0x0B25,
 GL_LINE_STIPPLE_REPEAT = 0x0B26,
 GL_LINE_WIDTH = 0x0B21,
 GL_LINE_WIDTH_GRANULARITY = 0x0B23,
 GL_LINE_WIDTH_RANGE = 0x0B22,


 GL_POINT = 0x1B00,
 GL_LINE = 0x1B01,
 GL_FILL = 0x1B02,
 GL_CCW = 0x0901,
 GL_CW = 0x0900,
 GL_FRONT = 0x0404,
 GL_BACK = 0x0405,
 GL_CULL_FACE = 0x0B44,
 GL_CULL_FACE_MODE = 0x0B45,
 GL_POLYGON_SMOOTH = 0x0B41,
 GL_POLYGON_STIPPLE = 0x0B42,
 GL_FRONT_FACE = 0x0B46,
 GL_POLYGON_MODE = 0x0B40,
 GL_POLYGON_OFFSET_FACTOR = 0x8038,
 GL_POLYGON_OFFSET_UNITS = 0x2A00,
 GL_POLYGON_OFFSET_POINT = 0x2A01,
 GL_POLYGON_OFFSET_LINE = 0x2A02,
 GL_POLYGON_OFFSET_FILL = 0x8037,


 GL_COMPILE = 0x1300,
 GL_COMPILE_AND_EXECUTE = 0x1301,
 GL_LIST_BASE = 0x0B32,
 GL_LIST_INDEX = 0x0B33,
 GL_LIST_MODE = 0x0B30,


 GL_NEVER = 0x0200,
 GL_LESS = 0x0201,
 GL_GEQUAL = 0x0206,
 GL_LEQUAL = 0x0203,
 GL_GREATER = 0x0204,
 GL_NOTEQUAL = 0x0205,
 GL_EQUAL = 0x0202,
 GL_ALWAYS = 0x0207,
 GL_DEPTH_TEST = 0x0B71,
 GL_DEPTH_BITS = 0x0D56,
 GL_DEPTH_CLEAR_VALUE = 0x0B73,
 GL_DEPTH_FUNC = 0x0B74,
 GL_DEPTH_RANGE = 0x0B70,
 GL_DEPTH_WRITEMASK = 0x0B72,
 GL_DEPTH_COMPONENT = 0x1902,


 GL_LIGHTING = 0x0B50,
 GL_LIGHT0 = 0x4000,
 GL_LIGHT1 = 0x4001,
 GL_LIGHT2 = 0x4002,
 GL_LIGHT3 = 0x4003,
 GL_LIGHT4 = 0x4004,
 GL_LIGHT5 = 0x4005,
 GL_LIGHT6 = 0x4006,
 GL_LIGHT7 = 0x4007,
 GL_SPOT_EXPONENT = 0x1205,
 GL_SPOT_CUTOFF = 0x1206,
 GL_CONSTANT_ATTENUATION = 0x1207,
 GL_LINEAR_ATTENUATION = 0x1208,
 GL_QUADRATIC_ATTENUATION = 0x1209,
 GL_AMBIENT = 0x1200,
 GL_DIFFUSE = 0x1201,
 GL_SPECULAR = 0x1202,
 GL_SHININESS = 0x1601,
 GL_EMISSION = 0x1600,
 GL_POSITION = 0x1203,
 GL_SPOT_DIRECTION = 0x1204,
 GL_AMBIENT_AND_DIFFUSE = 0x1602,
 GL_COLOR_INDEXES = 0x1603,
 GL_LIGHT_MODEL_TWO_SIDE = 0x0B52,
 GL_LIGHT_MODEL_LOCAL_VIEWER = 0x0B51,
 GL_LIGHT_MODEL_AMBIENT = 0x0B53,
 GL_FRONT_AND_BACK = 0x0408,
 GL_SHADE_MODEL = 0x0B54,
 GL_FLAT = 0x1D00,
 GL_SMOOTH = 0x1D01,
 GL_COLOR_MATERIAL = 0x0B57,
 GL_COLOR_MATERIAL_FACE = 0x0B55,
 GL_COLOR_MATERIAL_PARAMETER = 0x0B56,
 GL_NORMALIZE = 0x0BA1,


 GL_CLIP_PLANE0 = 0x3000,
 GL_CLIP_PLANE1 = 0x3001,
 GL_CLIP_PLANE2 = 0x3002,
 GL_CLIP_PLANE3 = 0x3003,
 GL_CLIP_PLANE4 = 0x3004,
 GL_CLIP_PLANE5 = 0x3005,


 GL_ACCUM_RED_BITS = 0x0D58,
 GL_ACCUM_GREEN_BITS = 0x0D59,
 GL_ACCUM_BLUE_BITS = 0x0D5A,
 GL_ACCUM_ALPHA_BITS = 0x0D5B,
 GL_ACCUM_CLEAR_VALUE = 0x0B80,
 GL_ACCUM = 0x0100,
 GL_ADD = 0x0104,
 GL_LOAD = 0x0101,
 GL_MULT = 0x0103,
 GL_RETURN = 0x0102,


 GL_ALPHA_TEST = 0x0BC0,
 GL_ALPHA_TEST_REF = 0x0BC2,
 GL_ALPHA_TEST_FUNC = 0x0BC1,


 GL_BLEND = 0x0BE2,
 GL_BLEND_SRC = 0x0BE1,
 GL_BLEND_DST = 0x0BE0,
 GL_ZERO = 0,
 GL_ONE = 1,
 GL_SRC_COLOR = 0x0300,
 GL_ONE_MINUS_SRC_COLOR = 0x0301,
 GL_DST_COLOR = 0x0306,
 GL_ONE_MINUS_DST_COLOR = 0x0307,
 GL_SRC_ALPHA = 0x0302,
 GL_ONE_MINUS_SRC_ALPHA = 0x0303,
 GL_DST_ALPHA = 0x0304,
 GL_ONE_MINUS_DST_ALPHA = 0x0305,
 GL_SRC_ALPHA_SATURATE = 0x0308,
 GL_CONSTANT_COLOR = 0x8001,
 GL_ONE_MINUS_CONSTANT_COLOR = 0x8002,
 GL_CONSTANT_ALPHA = 0x8003,
 GL_ONE_MINUS_CONSTANT_ALPHA = 0x8004,


 GL_FEEDBACK = 0x1C01,
 GL_RENDER = 0x1C00,
 GL_SELECT = 0x1C02,


 GL_2D = 0x0600,
 GL_3D = 0x0601,
 GL_3D_COLOR = 0x0602,
 GL_3D_COLOR_TEXTURE = 0x0603,
 GL_4D_COLOR_TEXTURE = 0x0604,
 GL_POINT_TOKEN = 0x0701,
 GL_LINE_TOKEN = 0x0702,
 GL_LINE_RESET_TOKEN = 0x0707,
 GL_POLYGON_TOKEN = 0x0703,
 GL_BITMAP_TOKEN = 0x0704,
 GL_DRAW_PIXEL_TOKEN = 0x0705,
 GL_COPY_PIXEL_TOKEN = 0x0706,
 GL_PASS_THROUGH_TOKEN = 0x0700,
 GL_FEEDBACK_BUFFER_POINTER = 0x0DF0,
 GL_FEEDBACK_BUFFER_SIZE = 0x0DF1,
 GL_FEEDBACK_BUFFER_TYPE = 0x0DF2,



 GL_FOG = 0x0B60,
 GL_FOG_MODE = 0x0B65,
 GL_FOG_DENSITY = 0x0B62,
 GL_FOG_COLOR = 0x0B66,
 GL_FOG_INDEX = 0x0B61,
 GL_FOG_START = 0x0B63,
 GL_FOG_END = 0x0B64,
 GL_LINEAR = 0x2601,
 GL_EXP = 0x0800,
 GL_EXP2 = 0x0801,


 GL_LOGIC_OP = 0x0BF1,
 GL_INDEX_LOGIC_OP = 0x0BF1,
 GL_COLOR_LOGIC_OP = 0x0BF2,
 GL_LOGIC_OP_MODE = 0x0BF0,
 GL_CLEAR = 0x1500,
 GL_SET = 0x150F,
 GL_COPY = 0x1503,
 GL_COPY_INVERTED = 0x150C,
 GL_NOOP = 0x1505,
 GL_INVERT = 0x150A,
 GL_AND = 0x1501,
 GL_NAND = 0x150E,
 GL_OR = 0x1507,
 GL_NOR = 0x1508,
 GL_XOR = 0x1506,
 GL_EQUIV = 0x1509,
 GL_AND_REVERSE = 0x1502,
 GL_AND_INVERTED = 0x1504,
 GL_OR_REVERSE = 0x150B,
 GL_OR_INVERTED = 0x150D,


 GL_STENCIL_TEST = 0x0B90,
 GL_STENCIL_WRITEMASK = 0x0B98,
 GL_STENCIL_BITS = 0x0D57,
 GL_STENCIL_FUNC = 0x0B92,
 GL_STENCIL_VALUE_MASK = 0x0B93,
 GL_STENCIL_REF = 0x0B97,
 GL_STENCIL_FAIL = 0x0B94,
 GL_STENCIL_PASS_DEPTH_PASS = 0x0B96,
 GL_STENCIL_PASS_DEPTH_FAIL = 0x0B95,
 GL_STENCIL_CLEAR_VALUE = 0x0B91,
 GL_STENCIL_INDEX = 0x1901,
 GL_KEEP = 0x1E00,
 GL_REPLACE = 0x1E01,
 GL_INCR = 0x1E02,
 GL_DECR = 0x1E03,


 GL_NONE = 0,
 GL_LEFT = 0x0406,
 GL_RIGHT = 0x0407,



 GL_FRONT_LEFT = 0x0400,
 GL_FRONT_RIGHT = 0x0401,
 GL_BACK_LEFT = 0x0402,
 GL_BACK_RIGHT = 0x0403,
 GL_AUX0 = 0x0409,
 GL_AUX1 = 0x040A,
 GL_AUX2 = 0x040B,
 GL_AUX3 = 0x040C,
 GL_COLOR_INDEX = 0x1900,
 GL_RED = 0x1903,
 GL_GREEN = 0x1904,
 GL_BLUE = 0x1905,
 GL_ALPHA = 0x1906,
 GL_LUMINANCE = 0x1909,
 GL_LUMINANCE_ALPHA = 0x190A,
 GL_ALPHA_BITS = 0x0D55,
 GL_RED_BITS = 0x0D52,
 GL_GREEN_BITS = 0x0D53,
 GL_BLUE_BITS = 0x0D54,
 GL_INDEX_BITS = 0x0D51,
 GL_SUBPIXEL_BITS = 0x0D50,
 GL_AUX_BUFFERS = 0x0C00,
 GL_READ_BUFFER = 0x0C02,
 GL_DRAW_BUFFER = 0x0C01,
 GL_DOUBLEBUFFER = 0x0C32,
 GL_STEREO = 0x0C33,
 GL_BITMAP = 0x1A00,
 GL_COLOR = 0x1800,
 GL_DEPTH = 0x1801,
 GL_STENCIL = 0x1802,
 GL_DITHER = 0x0BD0,
 GL_RGB = 0x1907,
 GL_RGBA = 0x1908,


 GL_MAX_LIST_NESTING = 0x0B31,
 GL_MAX_ATTRIB_STACK_DEPTH = 0x0D35,
 GL_MAX_MODELVIEW_STACK_DEPTH = 0x0D36,
 GL_MAX_NAME_STACK_DEPTH = 0x0D37,
 GL_MAX_PROJECTION_STACK_DEPTH = 0x0D38,
 GL_MAX_TEXTURE_STACK_DEPTH = 0x0D39,
 GL_MAX_EVAL_ORDER = 0x0D30,
 GL_MAX_LIGHTS = 0x0D31,
 GL_MAX_CLIP_PLANES = 0x0D32,
 GL_MAX_TEXTURE_SIZE = 0x0D33,
 GL_MAX_PIXEL_MAP_TABLE = 0x0D34,
 GL_MAX_VIEWPORT_DIMS = 0x0D3A,
 GL_MAX_CLIENT_ATTRIB_STACK_DEPTH= 0x0D3B,


 GL_ATTRIB_STACK_DEPTH = 0x0BB0,
 GL_CLIENT_ATTRIB_STACK_DEPTH = 0x0BB1,
 GL_COLOR_CLEAR_VALUE = 0x0C22,
 GL_COLOR_WRITEMASK = 0x0C23,
 GL_CURRENT_INDEX = 0x0B01,
 GL_CURRENT_COLOR = 0x0B00,
 GL_CURRENT_NORMAL = 0x0B02,
 GL_CURRENT_RASTER_COLOR = 0x0B04,
 GL_CURRENT_RASTER_DISTANCE = 0x0B09,
 GL_CURRENT_RASTER_INDEX = 0x0B05,
 GL_CURRENT_RASTER_POSITION = 0x0B07,
 GL_CURRENT_RASTER_TEXTURE_COORDS = 0x0B06,
 GL_CURRENT_RASTER_POSITION_VALID = 0x0B08,
 GL_CURRENT_TEXTURE_COORDS = 0x0B03,
 GL_INDEX_CLEAR_VALUE = 0x0C20,
 GL_INDEX_MODE = 0x0C30,
 GL_INDEX_WRITEMASK = 0x0C21,
 GL_MODELVIEW_MATRIX = 0x0BA6,
 GL_MODELVIEW_STACK_DEPTH = 0x0BA3,
 GL_NAME_STACK_DEPTH = 0x0D70,
 GL_PROJECTION_MATRIX = 0x0BA7,
 GL_PROJECTION_STACK_DEPTH = 0x0BA4,
 GL_RENDER_MODE = 0x0C40,
 GL_RGBA_MODE = 0x0C31,
 GL_TEXTURE_MATRIX = 0x0BA8,
 GL_TEXTURE_STACK_DEPTH = 0x0BA5,
 GL_VIEWPORT = 0x0BA2,



 GL_AUTO_NORMAL = 0x0D80,
 GL_MAP1_COLOR_4 = 0x0D90,
 GL_MAP1_GRID_DOMAIN = 0x0DD0,
 GL_MAP1_GRID_SEGMENTS = 0x0DD1,
 GL_MAP1_INDEX = 0x0D91,
 GL_MAP1_NORMAL = 0x0D92,
 GL_MAP1_TEXTURE_COORD_1 = 0x0D93,
 GL_MAP1_TEXTURE_COORD_2 = 0x0D94,
 GL_MAP1_TEXTURE_COORD_3 = 0x0D95,
 GL_MAP1_TEXTURE_COORD_4 = 0x0D96,
 GL_MAP1_VERTEX_3 = 0x0D97,
 GL_MAP1_VERTEX_4 = 0x0D98,
 GL_MAP2_COLOR_4 = 0x0DB0,
 GL_MAP2_GRID_DOMAIN = 0x0DD2,
 GL_MAP2_GRID_SEGMENTS = 0x0DD3,
 GL_MAP2_INDEX = 0x0DB1,
 GL_MAP2_NORMAL = 0x0DB2,
 GL_MAP2_TEXTURE_COORD_1 = 0x0DB3,
 GL_MAP2_TEXTURE_COORD_2 = 0x0DB4,
 GL_MAP2_TEXTURE_COORD_3 = 0x0DB5,
 GL_MAP2_TEXTURE_COORD_4 = 0x0DB6,
 GL_MAP2_VERTEX_3 = 0x0DB7,
 GL_MAP2_VERTEX_4 = 0x0DB8,
 GL_COEFF = 0x0A00,
 GL_DOMAIN = 0x0A02,
 GL_ORDER = 0x0A01,


 GL_FOG_HINT = 0x0C54,
 GL_LINE_SMOOTH_HINT = 0x0C52,
 GL_PERSPECTIVE_CORRECTION_HINT = 0x0C50,
 GL_POINT_SMOOTH_HINT = 0x0C51,
 GL_POLYGON_SMOOTH_HINT = 0x0C53,
 GL_DONT_CARE = 0x1100,
 GL_FASTEST = 0x1101,
 GL_NICEST = 0x1102,


 GL_SCISSOR_TEST = 0x0C11,
 GL_SCISSOR_BOX = 0x0C10,


 GL_MAP_COLOR = 0x0D10,
 GL_MAP_STENCIL = 0x0D11,
 GL_INDEX_SHIFT = 0x0D12,
 GL_INDEX_OFFSET = 0x0D13,
 GL_RED_SCALE = 0x0D14,
 GL_RED_BIAS = 0x0D15,
 GL_GREEN_SCALE = 0x0D18,
 GL_GREEN_BIAS = 0x0D19,
 GL_BLUE_SCALE = 0x0D1A,
 GL_BLUE_BIAS = 0x0D1B,
 GL_ALPHA_SCALE = 0x0D1C,
 GL_ALPHA_BIAS = 0x0D1D,
 GL_DEPTH_SCALE = 0x0D1E,
 GL_DEPTH_BIAS = 0x0D1F,
 GL_PIXEL_MAP_S_TO_S_SIZE = 0x0CB1,
 GL_PIXEL_MAP_I_TO_I_SIZE = 0x0CB0,
 GL_PIXEL_MAP_I_TO_R_SIZE = 0x0CB2,
 GL_PIXEL_MAP_I_TO_G_SIZE = 0x0CB3,
 GL_PIXEL_MAP_I_TO_B_SIZE = 0x0CB4,
 GL_PIXEL_MAP_I_TO_A_SIZE = 0x0CB5,
 GL_PIXEL_MAP_R_TO_R_SIZE = 0x0CB6,
 GL_PIXEL_MAP_G_TO_G_SIZE = 0x0CB7,
 GL_PIXEL_MAP_B_TO_B_SIZE = 0x0CB8,
 GL_PIXEL_MAP_A_TO_A_SIZE = 0x0CB9,
 GL_PIXEL_MAP_S_TO_S = 0x0C71,
 GL_PIXEL_MAP_I_TO_I = 0x0C70,
 GL_PIXEL_MAP_I_TO_R = 0x0C72,
 GL_PIXEL_MAP_I_TO_G = 0x0C73,
 GL_PIXEL_MAP_I_TO_B = 0x0C74,
 GL_PIXEL_MAP_I_TO_A = 0x0C75,
 GL_PIXEL_MAP_R_TO_R = 0x0C76,
 GL_PIXEL_MAP_G_TO_G = 0x0C77,
 GL_PIXEL_MAP_B_TO_B = 0x0C78,
 GL_PIXEL_MAP_A_TO_A = 0x0C79,
 GL_PACK_ALIGNMENT = 0x0D05,
 GL_PACK_LSB_FIRST = 0x0D01,
 GL_PACK_ROW_LENGTH = 0x0D02,
 GL_PACK_SKIP_PIXELS = 0x0D04,
 GL_PACK_SKIP_ROWS = 0x0D03,
 GL_PACK_SWAP_BYTES = 0x0D00,
 GL_UNPACK_ALIGNMENT = 0x0CF5,
 GL_UNPACK_LSB_FIRST = 0x0CF1,
 GL_UNPACK_ROW_LENGTH = 0x0CF2,
 GL_UNPACK_SKIP_PIXELS = 0x0CF4,
 GL_UNPACK_SKIP_ROWS = 0x0CF3,
 GL_UNPACK_SWAP_BYTES = 0x0CF0,
 GL_ZOOM_X = 0x0D16,
 GL_ZOOM_Y = 0x0D17,


 GL_TEXTURE_ENV = 0x2300,
 GL_TEXTURE_ENV_MODE = 0x2200,
 GL_TEXTURE_1D = 0x0DE0,
 GL_TEXTURE_2D = 0x0DE1,
 GL_TEXTURE_WRAP_S = 0x2802,
 GL_TEXTURE_WRAP_T = 0x2803,
 GL_TEXTURE_MAG_FILTER = 0x2800,
 GL_TEXTURE_MIN_FILTER = 0x2801,
 GL_TEXTURE_ENV_COLOR = 0x2201,
 GL_TEXTURE_GEN_S = 0x0C60,
 GL_TEXTURE_GEN_T = 0x0C61,
 GL_TEXTURE_GEN_MODE = 0x2500,
 GL_TEXTURE_BORDER_COLOR = 0x1004,
 GL_TEXTURE_WIDTH = 0x1000,
 GL_TEXTURE_HEIGHT = 0x1001,
 GL_TEXTURE_BORDER = 0x1005,
 GL_TEXTURE_COMPONENTS = 0x1003,
 GL_TEXTURE_RED_SIZE = 0x805C,
 GL_TEXTURE_GREEN_SIZE = 0x805D,
 GL_TEXTURE_BLUE_SIZE = 0x805E,
 GL_TEXTURE_ALPHA_SIZE = 0x805F,
 GL_TEXTURE_LUMINANCE_SIZE = 0x8060,
 GL_TEXTURE_INTENSITY_SIZE = 0x8061,
 GL_NEAREST_MIPMAP_NEAREST = 0x2700,
 GL_NEAREST_MIPMAP_LINEAR = 0x2702,
 GL_LINEAR_MIPMAP_NEAREST = 0x2701,
 GL_LINEAR_MIPMAP_LINEAR = 0x2703,
 GL_OBJECT_LINEAR = 0x2401,
 GL_OBJECT_PLANE = 0x2501,
 GL_EYE_LINEAR = 0x2400,
 GL_EYE_PLANE = 0x2502,
 GL_SPHERE_MAP = 0x2402,
 GL_DECAL = 0x2101,
 GL_MODULATE = 0x2100,
 GL_NEAREST = 0x2600,
 GL_REPEAT = 0x2901,
 GL_CLAMP = 0x2900,
 GL_S = 0x2000,
 GL_T = 0x2001,
 GL_R = 0x2002,
 GL_Q = 0x2003,
 GL_TEXTURE_GEN_R = 0x0C62,
 GL_TEXTURE_GEN_Q = 0x0C63,

 GL_PROXY_TEXTURE_1D = 0x8063,
 GL_PROXY_TEXTURE_2D = 0x8064,
 GL_TEXTURE_PRIORITY = 0x8066,
 GL_TEXTURE_RESIDENT = 0x8067,
 GL_TEXTURE_BINDING_1D = 0x8068,
 GL_TEXTURE_BINDING_2D = 0x8069,


 GL_ALPHA4 = 0x803B,
 GL_ALPHA8 = 0x803C,
 GL_ALPHA12 = 0x803D,
 GL_ALPHA16 = 0x803E,
 GL_LUMINANCE4 = 0x803F,
 GL_LUMINANCE8 = 0x8040,
 GL_LUMINANCE12 = 0x8041,
 GL_LUMINANCE16 = 0x8042,
 GL_LUMINANCE4_ALPHA4 = 0x8043,
 GL_LUMINANCE6_ALPHA2 = 0x8044,
 GL_LUMINANCE8_ALPHA8 = 0x8045,
 GL_LUMINANCE12_ALPHA4 = 0x8046,
 GL_LUMINANCE12_ALPHA12 = 0x8047,
 GL_LUMINANCE16_ALPHA16 = 0x8048,
 GL_INTENSITY = 0x8049,
 GL_INTENSITY4 = 0x804A,
 GL_INTENSITY8 = 0x804B,
 GL_INTENSITY12 = 0x804C,
 GL_INTENSITY16 = 0x804D,
 GL_R3_G3_B2 = 0x2A10,
 GL_RGB4 = 0x804F,
 GL_RGB5 = 0x8050,
 GL_RGB8 = 0x8051,
 GL_RGB10 = 0x8052,
 GL_RGB12 = 0x8053,
 GL_RGB16 = 0x8054,
 GL_RGBA2 = 0x8055,
 GL_RGBA4 = 0x8056,
 GL_RGB5_A1 = 0x8057,
 GL_RGBA8 = 0x8058,
 GL_RGB10_A2 = 0x8059,
 GL_RGBA12 = 0x805A,
 GL_RGBA16 = 0x805B,


 GL_VENDOR = 0x1F00,
 GL_RENDERER = 0x1F01,
 GL_VERSION = 0x1F02,
 GL_EXTENSIONS = 0x1F03,


 GL_INVALID_VALUE = 0x0501,
 GL_INVALID_ENUM = 0x0500,
 GL_INVALID_OPERATION = 0x0502,
 GL_STACK_OVERFLOW = 0x0503,
 GL_STACK_UNDERFLOW = 0x0504,
 GL_OUT_OF_MEMORY = 0x0505,





 GL_CONSTANT_COLOR_EXT = 0x8001,
 GL_ONE_MINUS_CONSTANT_COLOR_EXT = 0x8002,
 GL_CONSTANT_ALPHA_EXT = 0x8003,
 GL_ONE_MINUS_CONSTANT_ALPHA_EXT = 0x8004,
 GL_BLEND_EQUATION_EXT = 0x8009,
 GL_MIN_EXT = 0x8007,
 GL_MAX_EXT = 0x8008,
 GL_FUNC_ADD_EXT = 0x8006,
 GL_FUNC_SUBTRACT_EXT = 0x800A,
 GL_FUNC_REVERSE_SUBTRACT_EXT = 0x800B,
 GL_BLEND_COLOR_EXT = 0x8005,


        GL_POLYGON_OFFSET_EXT = 0x8037,
        GL_POLYGON_OFFSET_FACTOR_EXT = 0x8038,
        GL_POLYGON_OFFSET_BIAS_EXT = 0x8039,


 GL_VERTEX_ARRAY_EXT = 0x8074,
 GL_NORMAL_ARRAY_EXT = 0x8075,
 GL_COLOR_ARRAY_EXT = 0x8076,
 GL_INDEX_ARRAY_EXT = 0x8077,
 GL_TEXTURE_COORD_ARRAY_EXT = 0x8078,
 GL_EDGE_FLAG_ARRAY_EXT = 0x8079,
 GL_VERTEX_ARRAY_SIZE_EXT = 0x807A,
 GL_VERTEX_ARRAY_TYPE_EXT = 0x807B,
 GL_VERTEX_ARRAY_STRIDE_EXT = 0x807C,
 GL_VERTEX_ARRAY_COUNT_EXT = 0x807D,
 GL_NORMAL_ARRAY_TYPE_EXT = 0x807E,
 GL_NORMAL_ARRAY_STRIDE_EXT = 0x807F,
 GL_NORMAL_ARRAY_COUNT_EXT = 0x8080,
 GL_COLOR_ARRAY_SIZE_EXT = 0x8081,
 GL_COLOR_ARRAY_TYPE_EXT = 0x8082,
 GL_COLOR_ARRAY_STRIDE_EXT = 0x8083,
 GL_COLOR_ARRAY_COUNT_EXT = 0x8084,
 GL_INDEX_ARRAY_TYPE_EXT = 0x8085,
 GL_INDEX_ARRAY_STRIDE_EXT = 0x8086,
 GL_INDEX_ARRAY_COUNT_EXT = 0x8087,
 GL_TEXTURE_COORD_ARRAY_SIZE_EXT = 0x8088,
 GL_TEXTURE_COORD_ARRAY_TYPE_EXT = 0x8089,
 GL_TEXTURE_COORD_ARRAY_STRIDE_EXT= 0x808A,
 GL_TEXTURE_COORD_ARRAY_COUNT_EXT= 0x808B,
 GL_EDGE_FLAG_ARRAY_STRIDE_EXT = 0x808C,
 GL_EDGE_FLAG_ARRAY_COUNT_EXT = 0x808D,
 GL_VERTEX_ARRAY_POINTER_EXT = 0x808E,
 GL_NORMAL_ARRAY_POINTER_EXT = 0x808F,
 GL_COLOR_ARRAY_POINTER_EXT = 0x8090,
 GL_INDEX_ARRAY_POINTER_EXT = 0x8091,
 GL_TEXTURE_COORD_ARRAY_POINTER_EXT= 0x8092,
 GL_EDGE_FLAG_ARRAY_POINTER_EXT = 0x8093,


 GL_TEXTURE_PRIORITY_EXT = 0x8066,
 GL_TEXTURE_RESIDENT_EXT = 0x8067,
 GL_TEXTURE_1D_BINDING_EXT = 0x8068,
 GL_TEXTURE_2D_BINDING_EXT = 0x8069,


 GL_PACK_SKIP_IMAGES_EXT = 0x806B,
 GL_PACK_IMAGE_HEIGHT_EXT = 0x806C,
 GL_UNPACK_SKIP_IMAGES_EXT = 0x806D,
 GL_UNPACK_IMAGE_HEIGHT_EXT = 0x806E,
 GL_TEXTURE_3D_EXT = 0x806F,
 GL_PROXY_TEXTURE_3D_EXT = 0x8070,
 GL_TEXTURE_DEPTH_EXT = 0x8071,
 GL_TEXTURE_WRAP_R_EXT = 0x8072,
 GL_MAX_3D_TEXTURE_SIZE_EXT = 0x8073,
 GL_TEXTURE_3D_BINDING_EXT = 0x806A

}






  GLenum;
# 756 "../include/GL/gl.h"
enum {
 GL_CURRENT_BIT = 0x00000001,
 GL_POINT_BIT = 0x00000002,
 GL_LINE_BIT = 0x00000004,
 GL_POLYGON_BIT = 0x00000008,
 GL_POLYGON_STIPPLE_BIT = 0x00000010,
 GL_PIXEL_MODE_BIT = 0x00000020,
 GL_LIGHTING_BIT = 0x00000040,
 GL_FOG_BIT = 0x00000080,
 GL_DEPTH_BUFFER_BIT = 0x00000100,
 GL_ACCUM_BUFFER_BIT = 0x00000200,
 GL_STENCIL_BUFFER_BIT = 0x00000400,
 GL_VIEWPORT_BIT = 0x00000800,
 GL_TRANSFORM_BIT = 0x00001000,
 GL_ENABLE_BIT = 0x00002000,
 GL_COLOR_BUFFER_BIT = 0x00004000,
 GL_HINT_BIT = 0x00008000,
 GL_EVAL_BIT = 0x00010000,
 GL_LIST_BIT = 0x00020000,
 GL_TEXTURE_BIT = 0x00040000,
 GL_SCISSOR_BIT = 0x00080000,
 GL_ALL_ATTRIB_BITS = 0x000fffff
};


enum {
 GL_CLIENT_PIXEL_STORE_BIT = 0x00000001,
 GL_CLIENT_VERTEX_ARRAY_BIT = 0x00000002,
 GL_CLIENT_ALL_ATTRIB_BITS = 0x0000FFFF
};



typedef unsigned int GLbitfield;
# 805 "../include/GL/gl.h"
typedef void GLvoid;
typedef unsigned char GLboolean;
typedef signed char GLbyte;
typedef short GLshort;
typedef int GLint;
typedef unsigned char GLubyte;
typedef unsigned short GLushort;
typedef unsigned int GLuint;
typedef int GLsizei;
typedef float GLfloat;
typedef float GLclampf;
typedef double GLdouble;
typedef double GLclampd;
# 830 "../include/GL/gl.h"
extern void glClearIndex( GLfloat c );

extern void glClearColor( GLclampf red,
     GLclampf green,
     GLclampf blue,
     GLclampf alpha );

extern void glClear( GLbitfield mask );

extern void glIndexMask( GLuint mask );

extern void glColorMask( GLboolean red, GLboolean green,
    GLboolean blue, GLboolean alpha );

extern void glAlphaFunc( GLenum func, GLclampf ref );

extern void glBlendFunc( GLenum sfactor, GLenum dfactor );

extern void glLogicOp( GLenum opcode );

extern void glCullFace( GLenum mode );

extern void glFrontFace( GLenum mode );

extern void glPointSize( GLfloat size );

extern void glLineWidth( GLfloat width );

extern void glLineStipple( GLint factor, GLushort pattern );

extern void glPolygonMode( GLenum face, GLenum mode );

extern void glPolygonOffset( GLfloat factor, GLfloat units );

extern void glPolygonStipple( const GLubyte *mask );

extern void glGetPolygonStipple( GLubyte *mask );

extern void glEdgeFlag( GLboolean flag );

extern void glEdgeFlagv( const GLboolean *flag );

extern void glScissor( GLint x, GLint y, GLsizei width, GLsizei height);

extern void glClipPlane( GLenum plane, const GLdouble *equation );

extern void glGetClipPlane( GLenum plane, GLdouble *equation );

extern void glDrawBuffer( GLenum mode );

extern void glReadBuffer( GLenum mode );

extern void glEnable( GLenum cap );

extern void glDisable( GLenum cap );

extern GLboolean glIsEnabled( GLenum cap );


extern void glGetBooleanv( GLenum pname, GLboolean *params );

extern void glGetDoublev( GLenum pname, GLdouble *params );

extern void glGetFloatv( GLenum pname, GLfloat *params );

extern void glGetIntegerv( GLenum pname, GLint *params );


extern void glPushAttrib( GLbitfield mask );

extern void glPopAttrib( void );


extern void glPushClientAttrib( GLbitfield mask );

extern void glPopClientAttrib( void );


extern GLint glRenderMode( GLenum mode );

extern GLenum glGetError( void );

extern const GLubyte *glGetString( GLenum name );

extern void glFinish( void );

extern void glFlush( void );

extern void glHint( GLenum target, GLenum mode );







extern void glClearDepth( GLclampd depth );

extern void glDepthFunc( GLenum func );

extern void glDepthMask( GLboolean flag );

extern void glDepthRange( GLclampd near_val, GLclampd far_val );






extern void glClearAccum( GLfloat red, GLfloat green,
     GLfloat blue, GLfloat alpha );

extern void glAccum( GLenum op, GLfloat value );







extern void glMatrixMode( GLenum mode );

extern void glOrtho( GLdouble left, GLdouble right,
       GLdouble bottom, GLdouble top,
       GLdouble near_val, GLdouble far_val );

extern void glFrustum( GLdouble left, GLdouble right,
         GLdouble bottom, GLdouble top,
         GLdouble near_val, GLdouble far_val );

extern void glViewport( GLint x, GLint y, GLsizei width, GLsizei height );

extern void glPushMatrix( void );

extern void glPopMatrix( void );

extern void glLoadIdentity( void );

extern void glLoadMatrixd( const GLdouble *m );
extern void glLoadMatrixf( const GLfloat *m );

extern void glMultMatrixd( const GLdouble *m );
extern void glMultMatrixf( const GLfloat *m );

extern void glRotated( GLdouble angle, GLdouble x, GLdouble y, GLdouble z );
extern void glRotatef( GLfloat angle, GLfloat x, GLfloat y, GLfloat z );

extern void glScaled( GLdouble x, GLdouble y, GLdouble z );
extern void glScalef( GLfloat x, GLfloat y, GLfloat z );

extern void glTranslated( GLdouble x, GLdouble y, GLdouble z );
extern void glTranslatef( GLfloat x, GLfloat y, GLfloat z );







extern GLboolean glIsList( GLuint list );

extern void glDeleteLists( GLuint list, GLsizei range );

extern GLuint glGenLists( GLsizei range );

extern void glNewList( GLuint list, GLenum mode );

extern void glEndList( void );

extern void glCallList( GLuint list );

extern void glCallLists( GLsizei n, GLenum type, const GLvoid *lists );

extern void glListBase( GLuint base );







extern void glBegin( GLenum mode );

extern void glEnd( void );


extern void glVertex2d( GLdouble x, GLdouble y );
extern void glVertex2f( GLfloat x, GLfloat y );
extern void glVertex2i( GLint x, GLint y );
extern void glVertex2s( GLshort x, GLshort y );

extern void glVertex3d( GLdouble x, GLdouble y, GLdouble z );
extern void glVertex3f( GLfloat x, GLfloat y, GLfloat z );
extern void glVertex3i( GLint x, GLint y, GLint z );
extern void glVertex3s( GLshort x, GLshort y, GLshort z );

extern void glVertex4d( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
extern void glVertex4f( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
extern void glVertex4i( GLint x, GLint y, GLint z, GLint w );
extern void glVertex4s( GLshort x, GLshort y, GLshort z, GLshort w );

extern void glVertex2dv( const GLdouble *v );
extern void glVertex2fv( const GLfloat *v );
extern void glVertex2iv( const GLint *v );
extern void glVertex2sv( const GLshort *v );

extern void glVertex3dv( const GLdouble *v );
extern void glVertex3fv( const GLfloat *v );
extern void glVertex3iv( const GLint *v );
extern void glVertex3sv( const GLshort *v );

extern void glVertex4dv( const GLdouble *v );
extern void glVertex4fv( const GLfloat *v );
extern void glVertex4iv( const GLint *v );
extern void glVertex4sv( const GLshort *v );


extern void glNormal3b( GLbyte nx, GLbyte ny, GLbyte nz );
extern void glNormal3d( GLdouble nx, GLdouble ny, GLdouble nz );
extern void glNormal3f( GLfloat nx, GLfloat ny, GLfloat nz );
extern void glNormal3i( GLint nx, GLint ny, GLint nz );
extern void glNormal3s( GLshort nx, GLshort ny, GLshort nz );

extern void glNormal3bv( const GLbyte *v );
extern void glNormal3dv( const GLdouble *v );
extern void glNormal3fv( const GLfloat *v );
extern void glNormal3iv( const GLint *v );
extern void glNormal3sv( const GLshort *v );


extern void glIndexd( GLdouble c );
extern void glIndexf( GLfloat c );
extern void glIndexi( GLint c );
extern void glIndexs( GLshort c );
extern void glIndexub( GLubyte c );

extern void glIndexdv( const GLdouble *c );
extern void glIndexfv( const GLfloat *c );
extern void glIndexiv( const GLint *c );
extern void glIndexsv( const GLshort *c );
extern void glIndexubv( const GLubyte *c );

extern void glColor3b( GLbyte red, GLbyte green, GLbyte blue );
extern void glColor3d( GLdouble red, GLdouble green, GLdouble blue );
extern void glColor3f( GLfloat red, GLfloat green, GLfloat blue );
extern void glColor3i( GLint red, GLint green, GLint blue );
extern void glColor3s( GLshort red, GLshort green, GLshort blue );
extern void glColor3ub( GLubyte red, GLubyte green, GLubyte blue );
extern void glColor3ui( GLuint red, GLuint green, GLuint blue );
extern void glColor3us( GLushort red, GLushort green, GLushort blue );

extern void glColor4b( GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha );
extern void glColor4d( GLdouble red, GLdouble green,
         GLdouble blue, GLdouble alpha );
extern void glColor4f( GLfloat red, GLfloat green,
         GLfloat blue, GLfloat alpha );
extern void glColor4i( GLint red, GLint green, GLint blue, GLint alpha );
extern void glColor4s( GLshort red, GLshort green,
         GLshort blue, GLshort alpha );
extern void glColor4ub( GLubyte red, GLubyte green,
   GLubyte blue, GLubyte alpha );
extern void glColor4ui( GLuint red, GLuint green, GLuint blue, GLuint alpha );
extern void glColor4us( GLushort red, GLushort green,
   GLushort blue, GLushort alpha );


extern void glColor3bv( const GLbyte *v );
extern void glColor3dv( const GLdouble *v );
extern void glColor3fv( const GLfloat *v );
extern void glColor3iv( const GLint *v );
extern void glColor3sv( const GLshort *v );
extern void glColor3ubv( const GLubyte *v );
extern void glColor3uiv( const GLuint *v );
extern void glColor3usv( const GLushort *v );

extern void glColor4bv( const GLbyte *v );
extern void glColor4dv( const GLdouble *v );
extern void glColor4fv( const GLfloat *v );
extern void glColor4iv( const GLint *v );
extern void glColor4sv( const GLshort *v );
extern void glColor4ubv( const GLubyte *v );
extern void glColor4uiv( const GLuint *v );
extern void glColor4usv( const GLushort *v );


extern void glTexCoord1d( GLdouble s );
extern void glTexCoord1f( GLfloat s );
extern void glTexCoord1i( GLint s );
extern void glTexCoord1s( GLshort s );

extern void glTexCoord2d( GLdouble s, GLdouble t );
extern void glTexCoord2f( GLfloat s, GLfloat t );
extern void glTexCoord2i( GLint s, GLint t );
extern void glTexCoord2s( GLshort s, GLshort t );

extern void glTexCoord3d( GLdouble s, GLdouble t, GLdouble r );
extern void glTexCoord3f( GLfloat s, GLfloat t, GLfloat r );
extern void glTexCoord3i( GLint s, GLint t, GLint r );
extern void glTexCoord3s( GLshort s, GLshort t, GLshort r );

extern void glTexCoord4d( GLdouble s, GLdouble t, GLdouble r, GLdouble q );
extern void glTexCoord4f( GLfloat s, GLfloat t, GLfloat r, GLfloat q );
extern void glTexCoord4i( GLint s, GLint t, GLint r, GLint q );
extern void glTexCoord4s( GLshort s, GLshort t, GLshort r, GLshort q );

extern void glTexCoord1dv( const GLdouble *v );
extern void glTexCoord1fv( const GLfloat *v );
extern void glTexCoord1iv( const GLint *v );
extern void glTexCoord1sv( const GLshort *v );

extern void glTexCoord2dv( const GLdouble *v );
extern void glTexCoord2fv( const GLfloat *v );
extern void glTexCoord2iv( const GLint *v );
extern void glTexCoord2sv( const GLshort *v );

extern void glTexCoord3dv( const GLdouble *v );
extern void glTexCoord3fv( const GLfloat *v );
extern void glTexCoord3iv( const GLint *v );
extern void glTexCoord3sv( const GLshort *v );

extern void glTexCoord4dv( const GLdouble *v );
extern void glTexCoord4fv( const GLfloat *v );
extern void glTexCoord4iv( const GLint *v );
extern void glTexCoord4sv( const GLshort *v );


extern void glRasterPos2d( GLdouble x, GLdouble y );
extern void glRasterPos2f( GLfloat x, GLfloat y );
extern void glRasterPos2i( GLint x, GLint y );
extern void glRasterPos2s( GLshort x, GLshort y );

extern void glRasterPos3d( GLdouble x, GLdouble y, GLdouble z );
extern void glRasterPos3f( GLfloat x, GLfloat y, GLfloat z );
extern void glRasterPos3i( GLint x, GLint y, GLint z );
extern void glRasterPos3s( GLshort x, GLshort y, GLshort z );

extern void glRasterPos4d( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
extern void glRasterPos4f( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
extern void glRasterPos4i( GLint x, GLint y, GLint z, GLint w );
extern void glRasterPos4s( GLshort x, GLshort y, GLshort z, GLshort w );

extern void glRasterPos2dv( const GLdouble *v );
extern void glRasterPos2fv( const GLfloat *v );
extern void glRasterPos2iv( const GLint *v );
extern void glRasterPos2sv( const GLshort *v );

extern void glRasterPos3dv( const GLdouble *v );
extern void glRasterPos3fv( const GLfloat *v );
extern void glRasterPos3iv( const GLint *v );
extern void glRasterPos3sv( const GLshort *v );

extern void glRasterPos4dv( const GLdouble *v );
extern void glRasterPos4fv( const GLfloat *v );
extern void glRasterPos4iv( const GLint *v );
extern void glRasterPos4sv( const GLshort *v );


extern void glRectd( GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2 );
extern void glRectf( GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2 );
extern void glRecti( GLint x1, GLint y1, GLint x2, GLint y2 );
extern void glRects( GLshort x1, GLshort y1, GLshort x2, GLshort y2 );


extern void glRectdv( const GLdouble *v1, const GLdouble *v2 );
extern void glRectfv( const GLfloat *v1, const GLfloat *v2 );
extern void glRectiv( const GLint *v1, const GLint *v2 );
extern void glRectsv( const GLshort *v1, const GLshort *v2 );







extern void glVertexPointer( GLint size, GLenum type, GLsizei stride,
                             const GLvoid *ptr );

extern void glNormalPointer( GLenum type, GLsizei stride,
                             const GLvoid *ptr );

extern void glColorPointer( GLint size, GLenum type, GLsizei stride,
                            const GLvoid *ptr );

extern void glIndexPointer( GLenum type, GLsizei stride, const GLvoid *ptr );

extern void glTexCoordPointer( GLint size, GLenum type, GLsizei stride,
                               const GLvoid *ptr );

extern void glEdgeFlagPointer( GLsizei stride, const GLboolean *ptr );

extern void glGetPointerv( GLenum pname, void **params );

extern void glArrayElement( GLint i );

extern void glDrawArrays( GLenum mode, GLint first, GLsizei count );

extern void glDrawElements( GLenum mode, GLsizei count,
                            GLenum type, const GLvoid *indices );

extern void glInterleavedArrays( GLenum format, GLsizei stride,
                                 const GLvoid *pointer );






extern void glShadeModel( GLenum mode );

extern void glLightf( GLenum light, GLenum pname, GLfloat param );
extern void glLighti( GLenum light, GLenum pname, GLint param );
extern void glLightfv( GLenum light, GLenum pname, const GLfloat *params );
extern void glLightiv( GLenum light, GLenum pname, const GLint *params );

extern void glGetLightfv( GLenum light, GLenum pname, GLfloat *params );
extern void glGetLightiv( GLenum light, GLenum pname, GLint *params );

extern void glLightModelf( GLenum pname, GLfloat param );
extern void glLightModeli( GLenum pname, GLint param );
extern void glLightModelfv( GLenum pname, const GLfloat *params );
extern void glLightModeliv( GLenum pname, const GLint *params );

extern void glMaterialf( GLenum face, GLenum pname, GLfloat param );
extern void glMateriali( GLenum face, GLenum pname, GLint param );
extern void glMaterialfv( GLenum face, GLenum pname, const GLfloat *params );
extern void glMaterialiv( GLenum face, GLenum pname, const GLint *params );

extern void glGetMaterialfv( GLenum face, GLenum pname, GLfloat *params );
extern void glGetMaterialiv( GLenum face, GLenum pname, GLint *params );

extern void glColorMaterial( GLenum face, GLenum mode );
# 1269 "../include/GL/gl.h"
extern void glPixelZoom( GLfloat xfactor, GLfloat yfactor );

extern void glPixelStoref( GLenum pname, GLfloat param );
extern void glPixelStorei( GLenum pname, GLint param );

extern void glPixelTransferf( GLenum pname, GLfloat param );
extern void glPixelTransferi( GLenum pname, GLint param );

extern void glPixelMapfv( GLenum map, GLint mapsize, const GLfloat *values );
extern void glPixelMapuiv( GLenum map, GLint mapsize, const GLuint *values );
extern void glPixelMapusv( GLenum map, GLint mapsize, const GLushort *values );

extern void glGetPixelMapfv( GLenum map, GLfloat *values );
extern void glGetPixelMapuiv( GLenum map, GLuint *values );
extern void glGetPixelMapusv( GLenum map, GLushort *values );

extern void glBitmap( GLsizei width, GLsizei height,
        GLfloat xorig, GLfloat yorig,
        GLfloat xmove, GLfloat ymove,
        const GLubyte *bitmap );

extern void glReadPixels( GLint x, GLint y, GLsizei width, GLsizei height,
     GLenum format, GLenum type, GLvoid *pixels );

extern void glDrawPixels( GLsizei width, GLsizei height,
     GLenum format, GLenum type, const GLvoid *pixels );

extern void glCopyPixels( GLint x, GLint y, GLsizei width, GLsizei height,
     GLenum type );







extern void glStencilFunc( GLenum func, GLint ref, GLuint mask );

extern void glStencilMask( GLuint mask );

extern void glStencilOp( GLenum fail, GLenum zfail, GLenum zpass );

extern void glClearStencil( GLint s );







extern void glTexGend( GLenum coord, GLenum pname, GLdouble param );
extern void glTexGenf( GLenum coord, GLenum pname, GLfloat param );
extern void glTexGeni( GLenum coord, GLenum pname, GLint param );

extern void glTexGendv( GLenum coord, GLenum pname, const GLdouble *params );
extern void glTexGenfv( GLenum coord, GLenum pname, const GLfloat *params );
extern void glTexGeniv( GLenum coord, GLenum pname, const GLint *params );

extern void glGetTexGendv( GLenum coord, GLenum pname, GLdouble *params );
extern void glGetTexGenfv( GLenum coord, GLenum pname, GLfloat *params );
extern void glGetTexGeniv( GLenum coord, GLenum pname, GLint *params );


extern void glTexEnvf( GLenum target, GLenum pname, GLfloat param );
extern void glTexEnvi( GLenum target, GLenum pname, GLint param );

extern void glTexEnvfv( GLenum target, GLenum pname, const GLfloat *params );
extern void glTexEnviv( GLenum target, GLenum pname, const GLint *params );

extern void glGetTexEnvfv( GLenum target, GLenum pname, GLfloat *params );
extern void glGetTexEnviv( GLenum target, GLenum pname, GLint *params );


extern void glTexParameterf( GLenum target, GLenum pname, GLfloat param );
extern void glTexParameteri( GLenum target, GLenum pname, GLint param );

extern void glTexParameterfv( GLenum target, GLenum pname,
         const GLfloat *params );
extern void glTexParameteriv( GLenum target, GLenum pname,
         const GLint *params );

extern void glGetTexParameterfv( GLenum target, GLenum pname, GLfloat *params);
extern void glGetTexParameteriv( GLenum target, GLenum pname, GLint *params );

extern void glGetTexLevelParameterfv( GLenum target, GLint level,
          GLenum pname, GLfloat *params );
extern void glGetTexLevelParameteriv( GLenum target, GLint level,
          GLenum pname, GLint *params );


extern void glTexImage1D( GLenum target, GLint level, GLint components,
     GLsizei width, GLint border,
     GLenum format, GLenum type, const GLvoid *pixels );

extern void glTexImage2D( GLenum target, GLint level, GLint components,
     GLsizei width, GLsizei height, GLint border,
     GLenum format, GLenum type, const GLvoid *pixels );

extern void glGetTexImage( GLenum target, GLint level, GLenum format,
      GLenum type, GLvoid *pixels );





extern void glGenTextures( GLsizei n, GLuint *textures );

extern void glDeleteTextures( GLsizei n, const GLuint *textures);

extern void glBindTexture( GLenum target, GLuint texture );

extern void glPrioritizeTextures( GLsizei n, const GLuint *textures,
                                  const GLclampf *priorities );

extern GLboolean glAreTexturesResident( GLsizei n,
                                       const GLuint *textures,
                                        GLboolean *residences );

extern GLboolean glIsTexture( GLuint texture );


extern void glTexSubImage1D( GLenum target, GLint level, GLint xoffset,
                             GLsizei width, GLenum format,
                             GLenum type, const GLvoid *pixels );


extern void glTexSubImage2D( GLenum target, GLint level,
                             GLint xoffset, GLint yoffset,
                             GLsizei width, GLsizei height,
                             GLenum format, GLenum type,
                             const GLvoid *pixels );


extern void glCopyTexImage1D( GLenum target, GLint level,
                              GLenum internalformat,
                              GLint x, GLint y,
                              GLsizei width, GLint border );


extern void glCopyTexImage2D( GLenum target, GLint level,
                              GLenum internalformat,
                              GLint x, GLint y,
                              GLsizei width, GLsizei height, GLint border );


extern void glCopyTexSubImage1D( GLenum target, GLint level,
                                 GLint xoffset, GLint x, GLint y,
                                 GLsizei width );


extern void glCopyTexSubImage2D( GLenum target, GLint level,
                                 GLint xoffset, GLint yoffset,
                                 GLint x, GLint y,
                                 GLsizei width, GLsizei height );
# 1431 "../include/GL/gl.h"
extern void glMap1d( GLenum target, GLdouble u1, GLdouble u2, GLint stride,
       GLint order, const GLdouble *points );
extern void glMap1f( GLenum target, GLfloat u1, GLfloat u2, GLint stride,
       GLint order, const GLfloat *points );

extern void glMap2d( GLenum target,
       GLdouble u1, GLdouble u2, GLint ustride, GLint uorder,
       GLdouble v1, GLdouble v2, GLint vstride, GLint vorder,
       const GLdouble *points );
extern void glMap2f( GLenum target,
       GLfloat u1, GLfloat u2, GLint ustride, GLint uorder,
       GLfloat v1, GLfloat v2, GLint vstride, GLint vorder,
       const GLfloat *points );

extern void glGetMapdv( GLenum target, GLenum query, GLdouble *v );
extern void glGetMapfv( GLenum target, GLenum query, GLfloat *v );
extern void glGetMapiv( GLenum target, GLenum query, GLint *v );

extern void glEvalCoord1d( GLdouble u );
extern void glEvalCoord1f( GLfloat u );

extern void glEvalCoord1dv( const GLdouble *u );
extern void glEvalCoord1fv( const GLfloat *u );

extern void glEvalCoord2d( GLdouble u, GLdouble v );
extern void glEvalCoord2f( GLfloat u, GLfloat v );

extern void glEvalCoord2dv( const GLdouble *u );
extern void glEvalCoord2fv( const GLfloat *u );

extern void glMapGrid1d( GLint un, GLdouble u1, GLdouble u2 );
extern void glMapGrid1f( GLint un, GLfloat u1, GLfloat u2 );

extern void glMapGrid2d( GLint un, GLdouble u1, GLdouble u2,
    GLint vn, GLdouble v1, GLdouble v2 );
extern void glMapGrid2f( GLint un, GLfloat u1, GLfloat u2,
    GLint vn, GLfloat v1, GLfloat v2 );

extern void glEvalPoint1( GLint i );

extern void glEvalPoint2( GLint i, GLint j );

extern void glEvalMesh1( GLenum mode, GLint i1, GLint i2 );

extern void glEvalMesh2( GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2 );







extern void glFogf( GLenum pname, GLfloat param );

extern void glFogi( GLenum pname, GLint param );

extern void glFogfv( GLenum pname, const GLfloat *params );

extern void glFogiv( GLenum pname, const GLint *params );







extern void glFeedbackBuffer( GLsizei size, GLenum type, GLfloat *buffer );

extern void glPassThrough( GLfloat token );

extern void glSelectBuffer( GLsizei size, GLuint *buffer );

extern void glInitNames( void );

extern void glLoadName( GLuint name );

extern void glPushName( GLuint name );

extern void glPopName( void );
# 1518 "../include/GL/gl.h"
extern void glBlendEquationEXT( GLenum mode );




extern void glBlendColorEXT( GLclampf red, GLclampf green,
        GLclampf blue, GLclampf alpha );




extern void glPolygonOffsetEXT( GLfloat factor, GLfloat bias );





extern void glVertexPointerEXT( GLint size, GLenum type, GLsizei stride,
                              GLsizei count, const GLvoid *ptr );

extern void glNormalPointerEXT( GLenum type, GLsizei stride,
    GLsizei count, const GLvoid *ptr );

extern void glColorPointerEXT( GLint size, GLenum type, GLsizei stride,
                               GLsizei count, const GLvoid *ptr );

extern void glIndexPointerEXT( GLenum type, GLsizei stride,
          GLsizei count, const GLvoid *ptr );

extern void glTexCoordPointerEXT( GLint size, GLenum type, GLsizei stride,
                                  GLsizei count, const GLvoid *ptr );

extern void glEdgeFlagPointerEXT( GLsizei stride,
      GLsizei count, const GLboolean *ptr );

extern void glGetPointervEXT( GLenum pname, void **params );

extern void glArrayElementEXT( GLint i );

extern void glDrawArraysEXT( GLenum mode, GLint first, GLsizei count );





extern void glGenTexturesEXT( GLsizei n, GLuint *textures );

extern void glDeleteTexturesEXT( GLsizei n, const GLuint *textures);

extern void glBindTextureEXT( GLenum target, GLuint texture );

extern void glPrioritizeTexturesEXT( GLsizei n, const GLuint *textures,
                                     const GLclampf *priorities );

extern GLboolean glAreTexturesResidentEXT( GLsizei n,
                                           const GLuint *textures,
                                           GLboolean *residences );

extern GLboolean glIsTextureEXT( GLuint texture );





extern void glTexImage3DEXT( GLenum target, GLint level, GLenum internalformat,
                             GLsizei width, GLsizei height, GLsizei depth,
                             GLint border, GLenum format, GLenum type,
                             const GLvoid *pixels );

extern void glTexSubImage3DEXT( GLenum target, GLint level, GLint xoffset,
                                GLint yoffset, GLint zoffset, GLsizei width,
                                GLsizei height, GLsizei depth, GLenum format,
                                GLenum type, const GLvoid *pixels );

extern void glCopyTexSubImage3DEXT( GLenum target, GLint level, GLint xoffset,
                                    GLint yoffset, GLint zoffset,
                                    GLint x, GLint y, GLsizei width,
                                    GLsizei height );




extern void glWindowPos2iMESA( GLint x, GLint y );
extern void glWindowPos2sMESA( GLshort x, GLshort y );
extern void glWindowPos2fMESA( GLfloat x, GLfloat y );
extern void glWindowPos2dMESA( GLdouble x, GLdouble y );

extern void glWindowPos2ivMESA( const GLint *p );
extern void glWindowPos2svMESA( const GLshort *p );
extern void glWindowPos2fvMESA( const GLfloat *p );
extern void glWindowPos2dvMESA( const GLdouble *p );

extern void glWindowPos3iMESA( GLint x, GLint y, GLint z );
extern void glWindowPos3sMESA( GLshort x, GLshort y, GLshort z );
extern void glWindowPos3fMESA( GLfloat x, GLfloat y, GLfloat z );
extern void glWindowPos3dMESA( GLdouble x, GLdouble y, GLdouble z );

extern void glWindowPos3ivMESA( const GLint *p );
extern void glWindowPos3svMESA( const GLshort *p );
extern void glWindowPos3fvMESA( const GLfloat *p );
extern void glWindowPos3dvMESA( const GLdouble *p );

extern void glWindowPos4iMESA( GLint x, GLint y, GLint z, GLint w );
extern void glWindowPos4sMESA( GLshort x, GLshort y, GLshort z, GLshort w );
extern void glWindowPos4fMESA( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
extern void glWindowPos4dMESA( GLdouble x, GLdouble y, GLdouble z, GLdouble w);

extern void glWindowPos4ivMESA( const GLint *p );
extern void glWindowPos4svMESA( const GLshort *p );
extern void glWindowPos4fvMESA( const GLfloat *p );
extern void glWindowPos4dvMESA( const GLdouble *p );




extern void glResizeBuffersMESA();
# 91 "types.h" 2
# 1 "config.h" 1
# 92 "types.h" 2
# 101 "types.h"
   typedef GLshort GLaccum;
# 111 "types.h"
   typedef GLubyte GLstencil;
# 122 "types.h"
   typedef GLushort GLdepth;
# 131 "types.h"
# 1 "fixed.h" 1
# 39 "fixed.h"
typedef int GLfixed;
# 132 "types.h" 2



typedef struct gl_visual GLvisual;

typedef struct gl_context GLcontext;

typedef struct gl_frame_buffer GLframebuffer;






typedef void (*points_func)( GLcontext *ctx, GLuint first, GLuint last );

typedef void (*line_func)( GLcontext *ctx, GLuint v1, GLuint v2, GLuint pv );

typedef void (*polygon_func)( GLcontext *ctx,
                              GLuint n, GLuint vlist[], GLuint pv );

typedef void (*triangle_func)( GLcontext *ctx,
                               GLuint v1, GLuint v2, GLuint v3, GLuint pv );





struct gl_image {
 GLint Width;
 GLint Height;
 GLint Depth;
 GLint Components;
        GLenum Format;
 GLenum Type;
 GLvoid *Data;
 GLboolean Interleaved;





 GLint RefCount;
};




struct gl_texture_image {
 GLenum Format;


 GLuint Border;
 GLuint Width;
 GLuint Height;
 GLuint Depth;
 GLuint Width2;
 GLuint Height2;
 GLuint Depth2;
 GLuint WidthLog2;
 GLuint HeightLog2;
 GLuint DepthLog2;
 GLuint MaxLog2;
 GLubyte *Data;
};






struct api_function_table {
   void (*Accum)( GLcontext *, GLenum, GLfloat );
   void (*AlphaFunc)( GLcontext *, GLenum, GLclampf );
   GLboolean (*AreTexturesResident)( GLcontext *, GLsizei,
                                     const GLuint *, GLboolean * );
   void (*ArrayElement)( GLcontext *, GLint );
   void (*Begin)( GLcontext *, GLenum );
   void (*BindTexture)( GLcontext *, GLenum, GLuint );
   void (*Bitmap)( GLcontext *, GLsizei, GLsizei, GLfloat, GLfloat,
       GLfloat, GLfloat, const struct gl_image *bitmap );
   void (*BlendColor)( GLcontext *, GLclampf, GLclampf, GLclampf, GLclampf);
   void (*BlendEquation)( GLcontext *, GLenum );
   void (*BlendFunc)( GLcontext *, GLenum, GLenum );
   void (*CallList)( GLcontext *, GLuint list );
   void (*CallLists)( GLcontext *, GLsizei, GLenum, const GLvoid * );
   void (*Clear)( GLcontext *, GLbitfield );
   void (*ClearAccum)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );
   void (*ClearColor)( GLcontext *, GLclampf, GLclampf, GLclampf, GLclampf );
   void (*ClearDepth)( GLcontext *, GLclampd );
   void (*ClearIndex)( GLcontext *, GLfloat );
   void (*ClearStencil)( GLcontext *, GLint );
   void (*ClipPlane)( GLcontext *, GLenum, const GLfloat * );
   void (*Color4f)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );
   void (*Color4ub)( GLcontext *, GLubyte, GLubyte, GLubyte, GLubyte );
   void (*ColorMask)( GLcontext *,
   GLboolean, GLboolean, GLboolean, GLboolean );
   void (*ColorMaterial)( GLcontext *, GLenum, GLenum );
   void (*ColorPointer)( GLcontext *, GLint, GLenum, GLsizei, const GLvoid * );
   void (*CopyPixels)( GLcontext *, GLint, GLint, GLsizei, GLsizei, GLenum );
   void (*CopyTexImage1D)( GLcontext *, GLenum, GLint, GLenum,
                           GLint, GLint, GLsizei, GLint );
   void (*CopyTexImage2D)( GLcontext *, GLenum, GLint, GLenum,
                           GLint, GLint, GLsizei, GLsizei, GLint );
   void (*CopyTexSubImage1D)( GLcontext *, GLenum, GLint, GLint,
                              GLint, GLint, GLsizei );
   void (*CopyTexSubImage2D)( GLcontext *, GLenum, GLint, GLint, GLint,
                              GLint, GLint, GLsizei, GLsizei );
   void (*CopyTexSubImage3DEXT)(GLcontext *,
                                GLenum , GLint ,
                                GLint , GLint , GLint ,
                                GLint , GLint ,
                                GLsizei , GLsizei );
   void (*CullFace)( GLcontext *, GLenum );
   void (*DeleteLists)( GLcontext *, GLuint, GLsizei );
   void (*DeleteTextures)( GLcontext *, GLsizei, const GLuint *);
   void (*DepthFunc)( GLcontext *, GLenum );
   void (*DepthMask)( GLcontext *, GLboolean );
   void (*DepthRange)( GLcontext *, GLclampd, GLclampd );
   void (*Disable)( GLcontext *, GLenum );
   void (*DisableClientState)( GLcontext *, GLenum );
   void (*DrawArrays)( GLcontext *, GLenum, GLint, GLsizei );
   void (*DrawBuffer)( GLcontext *, GLenum );
   void (*DrawElements)( GLcontext *, GLenum, GLsizei, GLenum, const GLvoid *);
   void (*DrawPixels)( GLcontext *,
                       GLsizei, GLsizei, GLenum, GLenum, const GLvoid * );
   void (*EdgeFlag)( GLcontext *, GLboolean );
   void (*EdgeFlagPointer)( GLcontext *, GLsizei, const GLboolean * );
   void (*Enable)( GLcontext *, GLenum );
   void (*EnableClientState)( GLcontext *, GLenum );
   void (*End)( GLcontext * );
   void (*EndList)( GLcontext * );
   void (*EvalCoord1f)( GLcontext *, GLfloat );
   void (*EvalCoord2f)( GLcontext *, GLfloat , GLfloat );
   void (*EvalMesh1)( GLcontext *, GLenum, GLint, GLint );
   void (*EvalMesh2)( GLcontext *, GLenum, GLint, GLint, GLint, GLint );
   void (*EvalPoint1)( GLcontext *, GLint );
   void (*EvalPoint2)( GLcontext *, GLint, GLint );
   void (*FeedbackBuffer)( GLcontext *, GLsizei, GLenum, GLfloat * );
   void (*Finish)( GLcontext * );
   void (*Flush)( GLcontext * );
   void (*Fogfv)( GLcontext *, GLenum, const GLfloat * );
   void (*FrontFace)( GLcontext *, GLenum );
   void (*Frustum)( GLcontext *, GLdouble, GLdouble, GLdouble, GLdouble,
        GLdouble, GLdouble );
   GLuint (*GenLists)( GLcontext *, GLsizei );
   void (*GenTextures)( GLcontext *, GLsizei, GLuint * );
   void (*GetBooleanv)( GLcontext *, GLenum, GLboolean * );
   void (*GetClipPlane)( GLcontext *, GLenum, GLdouble * );
   void (*GetDoublev)( GLcontext *, GLenum, GLdouble * );
   GLenum (*GetError)( GLcontext * );
   void (*GetFloatv)( GLcontext *, GLenum, GLfloat * );
   void (*GetIntegerv)( GLcontext *, GLenum, GLint * );
   const GLubyte* (*GetString)( GLcontext *, GLenum name );
   void (*GetLightfv)( GLcontext *, GLenum light, GLenum, GLfloat * );
   void (*GetLightiv)( GLcontext *, GLenum light, GLenum, GLint * );
   void (*GetMapdv)( GLcontext *, GLenum, GLenum, GLdouble * );
   void (*GetMapfv)( GLcontext *, GLenum, GLenum, GLfloat * );
   void (*GetMapiv)( GLcontext *, GLenum, GLenum, GLint * );
   void (*GetMaterialfv)( GLcontext *, GLenum, GLenum, GLfloat * );
   void (*GetMaterialiv)( GLcontext *, GLenum, GLenum, GLint * );
   void (*GetPixelMapfv)( GLcontext *, GLenum, GLfloat * );
   void (*GetPixelMapuiv)( GLcontext *, GLenum, GLuint * );
   void (*GetPixelMapusv)( GLcontext *, GLenum, GLushort * );
   void (*GetPointerv)( GLcontext *, GLenum, GLvoid ** );
   void (*GetPolygonStipple)( GLcontext *, GLubyte * );
   void (*PrioritizeTextures)( GLcontext *, GLsizei, const GLuint *,
                               const GLclampf * );
   void (*GetTexEnvfv)( GLcontext *, GLenum, GLenum, GLfloat * );
   void (*GetTexEnviv)( GLcontext *, GLenum, GLenum, GLint * );
   void (*GetTexGendv)( GLcontext *, GLenum coord, GLenum, GLdouble * );
   void (*GetTexGenfv)( GLcontext *, GLenum coord, GLenum, GLfloat * );
   void (*GetTexGeniv)( GLcontext *, GLenum coord, GLenum, GLint * );
   void (*GetTexImage)( GLcontext *, GLenum, GLint level, GLenum, GLenum,
                        GLvoid * );
   void (*GetTexLevelParameterfv)( GLcontext *,
         GLenum, GLint, GLenum, GLfloat * );
   void (*GetTexLevelParameteriv)( GLcontext *,
         GLenum, GLint, GLenum, GLint * );
   void (*GetTexParameterfv)( GLcontext *, GLenum, GLenum, GLfloat *);
   void (*GetTexParameteriv)( GLcontext *, GLenum, GLenum, GLint * );
   void (*Hint)( GLcontext *, GLenum, GLenum );
   void (*IndexMask)( GLcontext *, GLuint );
   void (*Indexf)( GLcontext *, GLfloat c );
   void (*Indexi)( GLcontext *, GLint c );
   void (*IndexPointer)( GLcontext *, GLenum, GLsizei, const GLvoid * );
   void (*InitNames)( GLcontext * );
   void (*InterleavedArrays)( GLcontext *, GLenum, GLsizei, const GLvoid * );
   GLboolean (*IsEnabled)( GLcontext *, GLenum );
   GLboolean (*IsList)( GLcontext *, GLuint );
   GLboolean (*IsTexture)( GLcontext *, GLuint );
   void (*LightModelfv)( GLcontext *, GLenum, const GLfloat * );
   void (*Lightfv)( GLcontext *, GLenum light, GLenum, const GLfloat *, GLint);
   void (*LineStipple)( GLcontext *, GLint factor, GLushort );
   void (*LineWidth)( GLcontext *, GLfloat );
   void (*ListBase)( GLcontext *, GLuint );


   void (*LoadMatrixf)( GLcontext *, const GLfloat * );
   void (*LoadName)( GLcontext *, GLuint );
   void (*LogicOp)( GLcontext *, GLenum );
   void (*Map1f)( GLcontext *, GLenum, GLfloat, GLfloat, GLint, GLint,
    const GLfloat *, GLboolean );
   void (*Map2f)( GLcontext *, GLenum, GLfloat, GLfloat, GLint, GLint,
    GLfloat, GLfloat, GLint, GLint, const GLfloat *,
    GLboolean );
   void (*MapGrid1f)( GLcontext *, GLint, GLfloat, GLfloat );
   void (*MapGrid2f)( GLcontext *, GLint, GLfloat, GLfloat,
   GLint, GLfloat, GLfloat );
   void (*Materialfv)( GLcontext *, GLenum, GLenum, const GLfloat * );
   void (*MatrixMode)( GLcontext *, GLenum );

   void (*MultMatrixf)( GLcontext *, const GLfloat * );
   void (*NewList)( GLcontext *, GLuint list, GLenum );
   void (*Normal3f)( GLcontext *, GLfloat, GLfloat, GLfloat );
   void (*Normal3fv)( GLcontext *, const GLfloat * );
   void (*NormalPointer)( GLcontext *, GLenum, GLsizei, const GLvoid * );

   void (*PassThrough)( GLcontext *, GLfloat );
   void (*PixelMapfv)( GLcontext *, GLenum, GLint, const GLfloat * );
   void (*PixelStorei)( GLcontext *, GLenum, GLint );
   void (*PixelTransferf)( GLcontext *, GLenum, GLfloat );
   void (*PixelZoom)( GLcontext *, GLfloat, GLfloat );
   void (*PointSize)( GLcontext *, GLfloat );
   void (*PolygonMode)( GLcontext *, GLenum, GLenum );
   void (*PolygonOffset)( GLcontext *, GLfloat, GLfloat );
   void (*PolygonStipple)( GLcontext *, const GLubyte * );
   void (*PopAttrib)( GLcontext * );
   void (*PopClientAttrib)( GLcontext * );
   void (*PopMatrix)( GLcontext * );
   void (*PopName)( GLcontext * );
   void (*PushAttrib)( GLcontext *, GLbitfield );
   void (*PushClientAttrib)( GLcontext *, GLbitfield );
   void (*PushMatrix)( GLcontext * );
   void (*PushName)( GLcontext *, GLuint );
   void (*RasterPos4f)( GLcontext *,
                        GLfloat x, GLfloat y, GLfloat z, GLfloat w );
   void (*ReadBuffer)( GLcontext *, GLenum );
   void (*ReadPixels)( GLcontext *, GLint, GLint, GLsizei, GLsizei, GLenum,
    GLenum, GLvoid * );
   void (*Rectf)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );
   GLint (*RenderMode)( GLcontext *, GLenum );
   void (*Rotatef)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );
   void (*Scalef)( GLcontext *, GLfloat, GLfloat, GLfloat );
   void (*Scissor)( GLcontext *, GLint, GLint, GLsizei, GLsizei);
   void (*SelectBuffer)( GLcontext *, GLsizei, GLuint * );
   void (*ShadeModel)( GLcontext *, GLenum );
   void (*StencilFunc)( GLcontext *, GLenum, GLint, GLuint );
   void (*StencilMask)( GLcontext *, GLuint );
   void (*StencilOp)( GLcontext *, GLenum, GLenum, GLenum );
   void (*TexCoord4f)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );
   void (*TexCoordPointer)( GLcontext *, GLint, GLenum, GLsizei,
                            const GLvoid *);
   void (*TexEnvfv)( GLcontext *, GLenum, GLenum, const GLfloat * );
   void (*TexGenfv)( GLcontext *, GLenum coord, GLenum, const GLfloat * );
   void (*TexImage1D)( GLcontext *, GLenum, GLint, GLint, GLsizei,
                       GLint, GLenum, GLenum, struct gl_image * );
   void (*TexImage2D)( GLcontext *, GLenum, GLint, GLint, GLsizei, GLsizei,
                       GLint, GLenum, GLenum, struct gl_image * );
   void (*TexSubImage1D)( GLcontext *, GLenum, GLint, GLint, GLsizei,
                          GLenum, GLenum, struct gl_image * );
   void (*TexSubImage2D)( GLcontext *, GLenum, GLint, GLint, GLint,
                          GLsizei, GLsizei, GLenum, GLenum,
                          struct gl_image * );
   void (*TexImage3DEXT)(GLcontext *,
                         GLenum , GLint , GLint ,
                         GLsizei , GLsizei , GLsizei ,
                         GLint ,
                         GLenum , GLenum ,
                         struct gl_image * );
   void (*TexSubImage3DEXT)(GLcontext *,
                            GLenum , GLint ,
                            GLint , GLint , GLint,
                            GLsizei , GLsizei , GLsizei ,
                            GLenum , GLenum ,
                            struct gl_image * );
   void (*TexParameterfv)( GLcontext *, GLenum, GLenum, const GLfloat * );

   void (*Translatef)( GLcontext *, GLfloat, GLfloat, GLfloat );
   void (*Vertex4f)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );
   void (*VertexPointer)( GLcontext *, GLint, GLenum, GLsizei, const GLvoid *);
   void (*Viewport)( GLcontext *, GLint, GLint, GLsizei, GLsizei );


   void (*WindowPos4fMESA)( GLcontext *, GLfloat, GLfloat, GLfloat, GLfloat );


   void (*ResizeBuffersMESA)( GLcontext * );
};



# 1 "dd.h" 1
# 120 "dd.h"
struct dd_function_table {






   void (*UpdateState)( GLcontext *ctx );






   void (*ClearIndex)( GLcontext *ctx, GLuint index );





   void (*ClearColor)( GLcontext *ctx, GLubyte red, GLubyte green,
                                        GLubyte blue, GLubyte alpha );





   void (*Clear)( GLcontext *ctx,
                  GLboolean all, GLint x, GLint y, GLint width, GLint height );





   void (*Index)( GLcontext *ctx, GLuint index );




   void (*Color)( GLcontext *ctx,
                  GLubyte red, GLubyte green, GLubyte glue, GLubyte alpha );




   GLboolean (*SetBuffer)( GLcontext *ctx, GLenum mode );





   void (*GetBufferSize)( GLcontext *ctx,
                          GLuint *width, GLuint *height );
# 181 "dd.h"
   void (*WriteColorSpan)( GLcontext *ctx,
                           GLuint n, GLint x, GLint y,
      const GLubyte red[], const GLubyte green[],
      const GLubyte blue[], const GLubyte alpha[],
      const GLubyte mask[] );




   void (*WriteMonocolorSpan)( GLcontext *ctx,
                               GLuint n, GLint x, GLint y,
          const GLubyte mask[] );




   void (*WriteColorPixels)( GLcontext *ctx,
                             GLuint n, const GLint x[], const GLint y[],
        const GLubyte red[], const GLubyte green[],
        const GLubyte blue[], const GLubyte alpha[],
        const GLubyte mask[] );




   void (*WriteMonocolorPixels)( GLcontext *ctx,
                                 GLuint n, const GLint x[], const GLint y[],
     const GLubyte mask[] );




   void (*WriteIndexSpan)( GLcontext *ctx,
                           GLuint n, GLint x, GLint y, const GLuint index[],
                           const GLubyte mask[] );




   void (*WriteMonoindexSpan)( GLcontext *ctx,
                               GLuint n, GLint x, GLint y,
          const GLubyte mask[] );




   void (*WriteIndexPixels)( GLcontext *ctx,
                             GLuint n, const GLint x[], const GLint y[],
                             const GLuint index[], const GLubyte mask[] );




   void (*WriteMonoindexPixels)( GLcontext *ctx,
                                 GLuint n, const GLint x[], const GLint y[],
     const GLubyte mask[] );







   void (*ReadIndexSpan)( GLcontext *ctx,
                          GLuint n, GLint x, GLint y, GLuint index[] );




   void (*ReadColorSpan)( GLcontext *ctx,
                          GLuint n, GLint x, GLint y,
     GLubyte red[], GLubyte green[],
     GLubyte blue[], GLubyte alpha[] );




   void (*ReadIndexPixels)( GLcontext *ctx,
                            GLuint n, const GLint x[], const GLint y[],
       GLuint indx[], const GLubyte mask[] );




   void (*ReadColorPixels)( GLcontext *ctx,
                            GLuint n, const GLint x[], const GLint y[],
       GLubyte red[], GLubyte green[],
       GLubyte blue[], GLubyte alpha[],
                            const GLubyte mask[] );
# 283 "dd.h"
   void (*Finish)( GLcontext *ctx );




   void (*Flush)( GLcontext *ctx );




   GLboolean (*IndexMask)( GLcontext *ctx, GLuint mask );




   GLboolean (*ColorMask)( GLcontext *ctx,
                           GLboolean rmask, GLboolean gmask,
                           GLboolean bmask, GLboolean amask );




   GLboolean (*LogicOp)( GLcontext *ctx, GLenum op );




   void (*Dither)( GLcontext *ctx, GLboolean enable );




   void (*Error)( GLcontext *ctx );
# 326 "dd.h"
   void (*AllocDepthBuffer)( GLcontext *ctx );




   void (*ClearDepthBuffer)( GLcontext *ctx );




   GLuint (*DepthTestSpan)( GLcontext *ctx,
                            GLuint n, GLint x, GLint y, const GLdepth z[],
                            GLubyte mask[] );
   void (*DepthTestPixels)( GLcontext *ctx,
                            GLuint n, const GLint x[], const GLint y[],
                            const GLdepth z[], GLubyte mask[] );






   void (*ReadDepthSpanFloat)( GLcontext *ctx,
                               GLuint n, GLint x, GLint y, GLfloat depth[]);
   void (*ReadDepthSpanInt)( GLcontext *ctx,
                             GLuint n, GLint x, GLint y, GLdepth depth[] );
# 363 "dd.h"
   points_func PointsFunc;




   line_func LineFunc;




   triangle_func TriangleFunc;
# 383 "dd.h"
   GLboolean (*DrawPixels)( GLcontext *ctx,
                            GLint x, GLint y, GLsizei width, GLsizei height,
                            GLenum format, GLenum type, GLboolean packed,
                            const GLvoid *pixels );




   GLboolean (*Bitmap)( GLcontext *ctx, GLsizei width, GLsizei height,
                        GLfloat xorig, GLfloat yorig,
                        GLfloat xmove, GLfloat ymove,
                        const struct gl_image *bitmap );




   void (*Begin)( GLcontext *ctx, GLenum mode );
   void (*End)( GLcontext *ctx );
# 411 "dd.h"
   void (*TexEnv)( GLcontext *ctx, GLenum pname, const GLfloat *param );







   void (*TexImage)( GLcontext *ctx, GLenum target,
                     GLuint texObject, GLint level, GLint internalFormat,
                     const struct gl_texture_image *image );
# 431 "dd.h"
   void (*TexParameter)( GLcontext *ctx, GLenum target, GLuint texObject,
                         GLenum pname, const GLfloat *params );
# 442 "dd.h"
   void (*BindTexture)( GLcontext *ctx, GLenum target, GLuint texObject );





   void (*DeleteTexture)( GLcontext *ctx, GLuint texObject );




};
# 425 "types.h" 2
# 461 "types.h"
struct gl_light {
 GLfloat Ambient[4];
 GLfloat Diffuse[4];
 GLfloat Specular[4];
 GLfloat Position[4];
 GLfloat Direction[4];
 GLfloat SpotExponent;
 GLfloat SpotCutoff;
        GLfloat CosCutoff;
 GLfloat ConstantAttenuation;
 GLfloat LinearAttenuation;
 GLfloat QuadraticAttenuation;
 GLboolean Enabled;

 struct gl_light *NextEnabled;


 GLfloat VP_inf_norm[3];
 GLfloat h_inf_norm[3];
        GLfloat NormDirection[3];
        GLfloat SpotExpTable[512][2];
 GLfloat MatAmbient[3];
 GLfloat MatDiffuse[3];
 GLfloat MatSpecular[3];
 GLfloat dli;
 GLfloat sli;
};


struct gl_lightmodel {
 GLfloat Ambient[4];
 GLboolean LocalViewer;
 GLboolean TwoSide;
};


struct gl_material {
 GLfloat Ambient[4];
 GLfloat Diffuse[4];
 GLfloat Specular[4];
 GLfloat Emission[4];
 GLfloat Shininess;
 GLfloat AmbientIndex;
 GLfloat DiffuseIndex;
 GLfloat SpecularIndex;
        GLfloat ShineTable[200];
};
# 518 "types.h"
struct gl_accum_attrib {
 GLfloat ClearColor[4];
};


struct gl_colorbuffer_attrib {
 GLuint ClearIndex;
 GLfloat ClearColor[4];

 GLuint IndexMask;
 GLuint ColorMask;
        GLboolean SWmasking;

 GLenum DrawBuffer;


 GLboolean AlphaEnabled;
 GLenum AlphaFunc;
 GLfloat AlphaRef;
 GLubyte AlphaRefUbyte;


 GLboolean BlendEnabled;
 GLenum BlendSrc;
 GLenum BlendDst;
 GLenum BlendEquation;
 GLfloat BlendColor[4];


 GLenum LogicOp;
 GLboolean IndexLogicOpEnabled;
 GLboolean ColorLogicOpEnabled;
 GLboolean SWLogicOpEnabled;

 GLboolean DitherFlag;
};


struct gl_current_attrib {
 GLint IntColor[4];
 GLuint Index;
 GLfloat Normal[3];
 GLfloat TexCoord[4];
 GLfloat RasterPos[4];
 GLfloat RasterDistance;
 GLfloat RasterColor[4];
 GLuint RasterIndex;
 GLfloat RasterTexCoord[4];
 GLboolean RasterPosValid;
 GLboolean EdgeFlag;
};


struct gl_depthbuffer_attrib {
 GLenum Func;
 GLfloat Clear;
 GLboolean Test;
 GLboolean Mask;
};


struct gl_enable_attrib {
 GLboolean AlphaTest;
 GLboolean AutoNormal;
 GLboolean Blend;
 GLboolean ClipPlane[6];
 GLboolean ColorMaterial;
 GLboolean CullFace;
 GLboolean DepthTest;
 GLboolean Dither;
 GLboolean Fog;
 GLboolean Light[8];
 GLboolean Lighting;
 GLboolean LineSmooth;
 GLboolean LineStipple;
 GLboolean IndexLogicOp;
 GLboolean ColorLogicOp;
 GLboolean Map1Color4;
 GLboolean Map1Index;
 GLboolean Map1Normal;
 GLboolean Map1TextureCoord1;
 GLboolean Map1TextureCoord2;
 GLboolean Map1TextureCoord3;
 GLboolean Map1TextureCoord4;
 GLboolean Map1Vertex3;
 GLboolean Map1Vertex4;
 GLboolean Map2Color4;
 GLboolean Map2Index;
 GLboolean Map2Normal;
 GLboolean Map2TextureCoord1;
 GLboolean Map2TextureCoord2;
 GLboolean Map2TextureCoord3;
 GLboolean Map2TextureCoord4;
 GLboolean Map2Vertex3;
 GLboolean Map2Vertex4;
 GLboolean Normalize;
 GLboolean PointSmooth;
 GLboolean PolygonOffsetPoint;
 GLboolean PolygonOffsetLine;
 GLboolean PolygonOffsetFill;
 GLboolean PolygonSmooth;
 GLboolean PolygonStipple;
 GLboolean Scissor;
 GLboolean Stencil;
 GLuint Texture;
 GLuint TexGen;
};


struct gl_eval_attrib {

 GLboolean Map1Color4;
 GLboolean Map1Index;
 GLboolean Map1Normal;
 GLboolean Map1TextureCoord1;
 GLboolean Map1TextureCoord2;
 GLboolean Map1TextureCoord3;
 GLboolean Map1TextureCoord4;
 GLboolean Map1Vertex3;
 GLboolean Map1Vertex4;
 GLboolean Map2Color4;
 GLboolean Map2Index;
 GLboolean Map2Normal;
 GLboolean Map2TextureCoord1;
 GLboolean Map2TextureCoord2;
 GLboolean Map2TextureCoord3;
 GLboolean Map2TextureCoord4;
 GLboolean Map2Vertex3;
 GLboolean Map2Vertex4;
 GLboolean AutoNormal;

 GLuint MapGrid1un;
 GLfloat MapGrid1u1, MapGrid1u2;
 GLuint MapGrid2un, MapGrid2vn;
 GLfloat MapGrid2u1, MapGrid2u2;
 GLfloat MapGrid2v1, MapGrid2v2;
};


struct gl_fog_attrib {
 GLboolean Enabled;
 GLfloat Color[4];
 GLfloat Density;
 GLfloat Start;
 GLfloat End;
 GLfloat Index;
 GLenum Mode;
};


struct gl_hint_attrib {

 GLenum PerspectiveCorrection;
 GLenum PointSmooth;
 GLenum LineSmooth;
 GLenum PolygonSmooth;
 GLenum Fog;
};


struct gl_light_attrib {
   struct gl_light Light[8];
   struct gl_lightmodel Model;
   struct gl_material Material[2];
   GLboolean Enabled;
   GLenum ShadeModel;
   GLenum ColorMaterialFace;
   GLenum ColorMaterialMode;
   GLuint ColorMaterialBitmask;
   GLboolean ColorMaterialEnabled;


   struct gl_light *FirstEnabled;
   GLboolean Fast;
   GLfloat BaseColor[4];
};


struct gl_line_attrib {
 GLboolean SmoothFlag;
 GLboolean StippleFlag;
 GLushort StipplePattern;
 GLint StippleFactor;
 GLfloat Width;
};


struct gl_list_attrib {
 GLuint ListBase;
};


struct gl_pixel_attrib {
 GLenum ReadBuffer;
 GLfloat RedBias, RedScale;
 GLfloat GreenBias, GreenScale;
 GLfloat BlueBias, BlueScale;
 GLfloat AlphaBias, AlphaScale;
 GLfloat DepthBias, DepthScale;
 GLint IndexShift;
 GLint IndexOffset;
 GLboolean MapColorFlag;
 GLboolean MapStencilFlag;
 GLfloat ZoomX;
 GLfloat ZoomY;

 GLint MapStoSsize;
 GLint MapItoIsize;
 GLint MapItoRsize;
 GLint MapItoGsize;
 GLint MapItoBsize;
 GLint MapItoAsize;
 GLint MapRtoRsize;
 GLint MapGtoGsize;
 GLint MapBtoBsize;
 GLint MapAtoAsize;
 GLint MapStoS[256];
 GLint MapItoI[256];
 GLfloat MapItoR[256];
 GLfloat MapItoG[256];
 GLfloat MapItoB[256];
 GLfloat MapItoA[256];
 GLfloat MapRtoR[256];
 GLfloat MapGtoG[256];
 GLfloat MapBtoB[256];
 GLfloat MapAtoA[256];
};


struct gl_point_attrib {
 GLboolean SmoothFlag;
 GLfloat Size;
};


struct gl_polygon_attrib {
 GLenum FrontFace;
 GLenum FrontMode;
 GLenum BackMode;
 GLboolean Unfilled;
 GLboolean CullFlag;
 GLenum CullFaceMode;
        GLuint CullBits;
 GLboolean SmoothFlag;
 GLboolean StippleFlag;
        GLfloat OffsetFactor;
        GLfloat OffsetUnits;
        GLboolean OffsetPoint;
        GLboolean OffsetLine;
        GLboolean OffsetFill;
        GLboolean OffsetAny;
};


struct gl_scissor_attrib {
 GLboolean Enabled;
 GLint X, Y;
 GLsizei Width, Height;
};


struct gl_stencil_attrib {
 GLboolean Enabled;
 GLenum Function;
 GLenum FailFunc;
 GLenum ZPassFunc;
 GLenum ZFailFunc;
 GLstencil Ref;
 GLstencil ValueMask;
 GLstencil Clear;
 GLstencil WriteMask;
};
# 802 "types.h"
struct gl_texture_attrib {
 GLuint Enabled;
 GLenum EnvMode;
 GLfloat EnvColor[4];
 GLuint TexGenEnabled;
 GLenum GenModeS;
 GLenum GenModeT;
 GLenum GenModeR;
 GLenum GenModeQ;
 GLfloat ObjectPlaneS[4];
 GLfloat ObjectPlaneT[4];
 GLfloat ObjectPlaneR[4];
 GLfloat ObjectPlaneQ[4];
 GLfloat EyePlaneS[4];
 GLfloat EyePlaneT[4];
 GLfloat EyePlaneR[4];
 GLfloat EyePlaneQ[4];
 struct gl_texture_object *Current1D;
 struct gl_texture_object *Current2D;
 struct gl_texture_object *Current3D;

 struct gl_texture_object *Proxy1D;
 struct gl_texture_object *Proxy2D;
 struct gl_texture_object *Proxy3D;

};


struct gl_transform_attrib {
 GLenum MatrixMode;
 GLfloat ClipEquation[6][4];
 GLboolean ClipEnabled[6];
 GLboolean AnyClip;
 GLboolean Normalize;
};


struct gl_viewport_attrib {
 GLint X, Y;
 GLsizei Width, Height;
 GLfloat Near, Far;
 GLfloat Sx, Sy, Sz;
 GLfloat Tx, Ty, Tz;
};



struct gl_attrib_node {
 GLbitfield kind;
 void *data;
 struct gl_attrib_node *next;
};






struct gl_pixelstore_attrib {
 GLint Alignment;
 GLint RowLength;
 GLint SkipPixels;
 GLint SkipRows;
 GLint ImageHeight;
 GLint SkipImages;
 GLboolean SwapBytes;
 GLboolean LsbFirst;
};





struct gl_array_attrib {
 GLint VertexSize;
 GLenum VertexType;
 GLsizei VertexStride;
 GLsizei VertexStrideB;
 void *VertexPtr;
 GLboolean VertexEnabled;

 GLenum NormalType;
 GLsizei NormalStride;
 GLsizei NormalStrideB;
 void *NormalPtr;
 GLboolean NormalEnabled;

 GLint ColorSize;
 GLenum ColorType;
 GLsizei ColorStride;
 GLsizei ColorStrideB;
 void *ColorPtr;
 GLboolean ColorEnabled;

 GLenum IndexType;
 GLsizei IndexStride;
 GLsizei IndexStrideB;
 void *IndexPtr;
 GLboolean IndexEnabled;

 GLint TexCoordSize;
 GLenum TexCoordType;
 GLsizei TexCoordStride;
 GLsizei TexCoordStrideB;
 void *TexCoordPtr;
 GLboolean TexCoordEnabled;

 GLsizei EdgeFlagStride;
 GLsizei EdgeFlagStrideB;
 GLboolean *EdgeFlagPtr;
 GLboolean EdgeFlagEnabled;
};



struct gl_feedback {
 GLenum Type;
 GLuint Mask;
 GLfloat *Buffer;
 GLuint BufferSize;
 GLuint Count;
};



struct gl_selection {
 GLuint *Buffer;
 GLuint BufferSize;
 GLuint BufferCount;
 GLuint Hits;
 GLuint NameStackDepth;
 GLuint NameStack[64];
 GLboolean HitFlag;
 GLfloat HitMinZ, HitMaxZ;
};






struct gl_1d_map {
 GLuint Order;
 GLfloat u1, u2;
 GLfloat *Points;
 GLboolean Retain;
};





struct gl_2d_map {
 GLuint Uorder;
 GLuint Vorder;
 GLfloat u1, u2;
 GLfloat v1, v2;
 GLfloat *Points;
 GLboolean Retain;
};





struct gl_evaluators {

 struct gl_1d_map Map1Vertex3;
 struct gl_1d_map Map1Vertex4;
 struct gl_1d_map Map1Index;
 struct gl_1d_map Map1Color4;
 struct gl_1d_map Map1Normal;
 struct gl_1d_map Map1Texture1;
 struct gl_1d_map Map1Texture2;
 struct gl_1d_map Map1Texture3;
 struct gl_1d_map Map1Texture4;


 struct gl_2d_map Map2Vertex3;
 struct gl_2d_map Map2Vertex4;
 struct gl_2d_map Map2Index;
 struct gl_2d_map Map2Color4;
 struct gl_2d_map Map2Normal;
 struct gl_2d_map Map2Texture1;
 struct gl_2d_map Map2Texture2;
 struct gl_2d_map Map2Texture3;
 struct gl_2d_map Map2Texture4;
};




struct gl_texture_object {
 GLint RefCount;
 GLuint Name;
 GLuint Dimensions;
 GLfloat Priority;
 GLint BorderColor[4];
 GLenum WrapS;
 GLenum WrapT;
 GLenum WrapR;
 GLenum MinFilter;
 GLenum MagFilter;
 struct gl_texture_image *Image[11];
 GLboolean Complete;
 struct gl_texture_object *Next;
};





union node;





struct gl_shared_state {
 GLint RefCount;
 union node *List[7000];
 struct gl_texture_object *TexObjectList;
};




struct gl_list_group {
 union node *List[7000];
 GLint RefCount;
};







struct gl_visual {
 GLboolean RGBAflag;
 GLboolean DBflag;

 GLfloat RedScale;
 GLfloat GreenScale;
 GLfloat BlueScale;
 GLfloat AlphaScale;


 GLboolean EightBitColor;


        GLfloat InvRedScale;
        GLfloat InvGreenScale;
        GLfloat InvBlueScale;
        GLfloat InvAlphaScale;

 GLint IndexBits;

 GLint AccumBits;
 GLint DepthBits;
 GLint StencilBits;


 GLboolean FrontAlphaEnabled;
 GLboolean BackAlphaEnabled;
};







struct gl_frame_buffer {
 GLvisual *Visual;

 GLint Width;
 GLint Height;

 GLdepth *Depth;


 GLstencil *Stencil;


 GLaccum *Accum;


 GLubyte *FrontAlpha;
 GLubyte *BackAlpha;
 GLubyte *Alpha;


 GLint Xmin, Xmax, Ymin, Ymax;




};
# 1146 "types.h"
struct gl_context {

 struct gl_shared_state *Shared;


 struct api_function_table API;
 struct api_function_table Save;
 struct api_function_table Exec;

        GLvisual *Visual;
        GLframebuffer *Buffer;


 struct dd_function_table Driver;


 void *DriverCtx;


 GLfloat ModelViewMatrix[16];
 GLfloat ModelViewInv[16];
 GLboolean ModelViewInvValid;
 GLuint ModelViewStackDepth;
 GLfloat ModelViewStack[32][16];


 GLfloat ProjectionMatrix[16];
 GLuint ProjectionStackDepth;
 GLfloat ProjectionStack[32][16];


 GLfloat TextureMatrix[16];
        GLboolean IdentityTexMat;
 GLuint TextureStackDepth;
 GLfloat TextureStack[10][16];


 GLuint CallDepth;
 GLboolean ExecuteFlag;
 GLboolean CompileFlag;


 GLuint AttribStackDepth;
 struct gl_attrib_node *AttribStack[16];


 struct gl_accum_attrib Accum;
 struct gl_colorbuffer_attrib Color;
 struct gl_current_attrib Current;
 struct gl_depthbuffer_attrib Depth;
 struct gl_eval_attrib Eval;
 struct gl_fog_attrib Fog;
 struct gl_hint_attrib Hint;
 struct gl_light_attrib Light;
 struct gl_line_attrib Line;
 struct gl_list_attrib List;
 struct gl_pixel_attrib Pixel;
 struct gl_point_attrib Point;
 struct gl_polygon_attrib Polygon;
 GLuint PolygonStipple[32];
 struct gl_scissor_attrib Scissor;
 struct gl_stencil_attrib Stencil;
 struct gl_texture_attrib Texture;
 struct gl_transform_attrib Transform;
 struct gl_viewport_attrib Viewport;


 GLuint ClientAttribStackDepth;
 struct gl_attrib_node *ClientAttribStack[16];

 struct gl_array_attrib Array;
 struct gl_pixelstore_attrib Pack;
 struct gl_pixelstore_attrib Unpack;

 struct gl_evaluators EvalMap;
 struct gl_feedback Feedback;
 struct gl_selection Select;

 GLenum ErrorValue;


        GLuint NewState;
 GLenum RenderMode;
 GLenum Primitive;
 GLuint StippleCounter;
 GLuint ClipMask;
 GLuint RasterMask;
 GLuint LightTwoSide;
 GLboolean DirectTriangles;
 GLfloat PolygonZoffset;
 GLfloat LineZoffset;
 GLfloat PointZoffset;
 GLboolean NeedNormals;
        GLboolean FastDrawPixels;
        GLboolean MutablePixels;
        GLboolean MonoPixels;
        GLint ColorShift;



        points_func PointsFunc;
        line_func LineFunc;



        polygon_func PolygonFunc;
        polygon_func AuxPolygonFunc;
        triangle_func TriangleFunc;


 struct vertex_buffer* VB;


 struct pixel_buffer* PB;
# 1280 "types.h"
        GLboolean NoRaster;
};
# 40 "accum.h" 2


extern void gl_alloc_accum_buffer( GLcontext *ctx );


extern void gl_Accum( GLcontext* ctx, GLenum op, GLfloat value );


extern void gl_ClearAccum( GLcontext* ctx, GLfloat red, GLfloat green,
                           GLfloat blue, GLfloat alpha );


extern void gl_clear_accum_buffer( GLcontext* ctx );
# 71 "dlist.c" 2
# 1 "alpha.h" 1
# 39 "alpha.h"
extern GLint gl_alpha_test( GLcontext* ctx,
                            GLuint n, const GLubyte alpha[], GLubyte mask[] );


extern void gl_AlphaFunc( GLcontext* ctx, GLenum func, GLclampf ref );
# 72 "dlist.c" 2
# 1 "attrib.h" 1
# 39 "attrib.h"
extern void gl_PushAttrib( GLcontext* ctx, GLbitfield mask );

extern void gl_PopAttrib( GLcontext* ctx );

extern void gl_PushClientAttrib( GLcontext *ctx, GLbitfield mask );

extern void gl_PopClientAttrib( GLcontext *ctx );
# 73 "dlist.c" 2
# 1 "bitmap.h" 1
# 39 "bitmap.h"
extern struct gl_image *gl_unpack_bitmap( GLcontext* ctx,
                                          GLsizei width, GLsizei height,
                                          const GLubyte *bitmap );



extern void gl_render_bitmap( GLcontext* ctx,
                              GLsizei width, GLsizei height,
                              GLfloat xorig, GLfloat yorig,
                              GLfloat xmove, GLfloat ymove,
                              const struct gl_image *bitmap );


extern void gl_Bitmap( GLcontext* ctx,
                       GLsizei width, GLsizei height,
                       GLfloat xorig, GLfloat yorig,
                       GLfloat xmove, GLfloat ymove,
                       const struct gl_image *bitmap );
# 74 "dlist.c" 2
# 1 "blend.h" 1
# 40 "blend.h"
extern void gl_blend_span( GLcontext* ctx, GLuint n, GLint x, GLint y,
      GLubyte red[], GLubyte green[],
      GLubyte blue[], GLubyte alpha[],
      GLubyte mask[] );


extern void gl_blend_pixels( GLcontext* ctx,
                             GLuint n, const GLint x[], const GLint y[],
        GLubyte red[], GLubyte green[],
        GLubyte blue[], GLubyte alpha[],
        GLubyte mask[] );

extern void gl_BlendFunc( GLcontext* ctx, GLenum sfactor, GLenum dfactor );

extern void gl_BlendEquation( GLcontext* ctx, GLenum mode );

extern void gl_BlendColor( GLcontext* ctx, GLclampf red, GLclampf green,
                              GLclampf blue, GLclampf alpha );
# 75 "dlist.c" 2
# 1 "clip.h" 1
# 52 "clip.h"
extern GLuint gl_viewclip_point( const GLfloat v[] );

extern GLuint gl_viewclip_line( GLcontext* ctx, GLuint *i, GLuint *j );

extern GLuint gl_viewclip_polygon( GLcontext* ctx, GLuint n, GLuint vlist[] );



extern GLuint gl_userclip_point( GLcontext* ctx, const GLfloat v[] );

extern GLuint gl_userclip_line( GLcontext* ctx, GLuint *i, GLuint *j );

extern GLuint gl_userclip_polygon( GLcontext* ctx, GLuint n, GLuint vlist[] );


extern void gl_ClipPlane( GLcontext* ctx,
                          GLenum plane, const GLfloat *equation );

extern void gl_GetClipPlane( GLcontext* ctx,
                             GLenum plane, GLdouble *equation );
# 76 "dlist.c" 2
# 1 "context.h" 1
# 61 "context.h"
   extern GLcontext *CC;
# 87 "context.h"
extern GLvisual *gl_create_visual( GLboolean rgb_flag,
                                   GLboolean alpha_flag,
                                   GLboolean db_flag,
                                   GLint depth_bits,
                                   GLint stencil_bits,
                                   GLint accum_bits,
                                   GLint index_bits,
                                   GLfloat red_scale,
                                   GLfloat green_scale,
                                   GLfloat blue_scale,
                                   GLfloat alpha_scale );

extern void gl_destroy_visual( GLvisual *vis );






extern GLcontext *gl_create_context( GLvisual *visual,
                                     GLcontext *share_list,
                                     void *driver_ctx );

extern void gl_destroy_context( GLcontext *ctx );







extern GLframebuffer *gl_create_framebuffer( GLvisual *visual );

extern void gl_destroy_framebuffer( GLframebuffer *buffer );



extern void gl_make_current( GLcontext *ctx, GLframebuffer *buffer );

extern void gl_copy_context( GLcontext *src, GLcontext *dst, GLuint mask );






extern void gl_ResizeBuffersMESA( GLcontext *ctx );







extern void gl_problem( GLcontext *ctx, const char *s );

extern void gl_warning( GLcontext *ctx, const char *s );

extern void gl_error( GLcontext *ctx, GLenum error, const char *s );

extern GLenum gl_GetError( GLcontext *ctx );


extern void gl_update_state( GLcontext *ctx );
# 77 "dlist.c" 2
# 1 "copypix.h" 1
# 39 "copypix.h"
extern void gl_CopyPixels( GLcontext* ctx,
                           GLint srcx, GLint srcy,
                           GLsizei width, GLsizei height,
      GLenum type );
# 78 "dlist.c" 2
# 1 "depth.h" 1
# 51 "depth.h"
extern GLuint
gl_depth_test_span_generic( GLcontext* ctx, GLuint n, GLint x, GLint y,
                            const GLdepth z[], GLubyte mask[] );

extern GLuint
gl_depth_test_span_less( GLcontext* ctx, GLuint n, GLint x, GLint y,
                         const GLdepth z[], GLubyte mask[] );

extern GLuint
gl_depth_test_span_greater( GLcontext* ctx, GLuint n, GLint x, GLint y,
                            const GLdepth z[], GLubyte mask[] );



extern void
gl_depth_test_pixels_generic( GLcontext* ctx,
                              GLuint n, const GLint x[], const GLint y[],
                              const GLdepth z[], GLubyte mask[] );

extern void
gl_depth_test_pixels_less( GLcontext* ctx,
                           GLuint n, const GLint x[], const GLint y[],
                           const GLdepth z[], GLubyte mask[] );

extern void
gl_depth_test_pixels_greater( GLcontext* ctx,
                              GLuint n, const GLint x[], const GLint y[],
                              const GLdepth z[], GLubyte mask[] );


extern void gl_read_depth_span_float( GLcontext* ctx,
                                      GLuint n, GLint x, GLint y,
                                      GLfloat depth[] );


extern void gl_read_depth_span_int( GLcontext* ctx, GLuint n, GLint x, GLint y,
                                    GLdepth depth[] );


extern void gl_alloc_depth_buffer( GLcontext* ctx );


extern void gl_clear_depth_buffer( GLcontext* ctx );


extern void gl_ClearDepth( GLcontext* ctx, GLclampd depth );
extern void gl_DepthFunc( GLcontext* ctx, GLenum func );
extern void gl_DepthMask( GLcontext* ctx, GLboolean flag );
extern void gl_DepthRange( GLcontext* ctx, GLclampd nearval, GLclampd farval );
# 79 "dlist.c" 2
# 1 "draw.h" 1
# 42 "draw.h"
extern void gl_transform_vb_part2( GLcontext *ctx, GLboolean alldone );

extern void gl_transform_vb_part1( GLcontext *ctx, GLboolean alldone );

extern void gl_render_vb( GLcontext *ctx, GLboolean alldone );


extern void gl_save_and_execute_vertex( GLcontext *ctx, GLfloat x, GLfloat y,
            GLfloat z, GLfloat w );


extern void gl_nop_vertex( GLcontext *ctx,
                           GLfloat x, GLfloat y, GLfloat z, GLfloat w );


extern void gl_set_vertex_function( GLcontext *ctx );


extern void gl_eval_vertex( GLcontext *ctx,
                            const GLfloat vertex[4], const GLfloat normal[3],
       const GLint color[4], GLuint index,
                            const GLfloat texcoord[4] );


extern void gl_RasterPos4f( GLcontext *ctx,
                            GLfloat x, GLfloat y, GLfloat z, GLfloat w );


extern void gl_windowpos( GLcontext *ctx,
                          GLfloat x, GLfloat y, GLfloat z, GLfloat w );


extern void gl_Begin( GLcontext *ctx, GLenum p );

extern void gl_End( GLcontext *ctx );
# 80 "dlist.c" 2
# 1 "drawpix.h" 1
# 42 "drawpix.h"
extern void gl_DrawPixels( GLcontext* ctx, GLsizei width, GLsizei height,
                           GLenum format, GLenum type, const GLvoid *pixels );
# 81 "dlist.c" 2
# 1 "enable.h" 1
# 39 "enable.h"
extern void gl_Disable( GLcontext* ctx, GLenum cap );

extern void gl_Enable( GLcontext* ctx, GLenum cap );

extern GLboolean gl_IsEnabled( GLcontext* ctx, GLenum cap );

extern void gl_EnableClientState( GLcontext *ctx, GLenum cap );

extern void gl_DisableClientState( GLcontext *ctx, GLenum cap );
# 82 "dlist.c" 2
# 1 "eval.h" 1
# 39 "eval.h"
extern void gl_init_eval( GLcontext* ctx );


extern void gl_free_control_points( GLcontext* ctx,
                                    GLenum target, GLfloat *data );


extern GLfloat *gl_copy_map_points1f( GLenum target,
                                      GLint ustride, GLint uorder,
                                      const GLfloat *points );

extern GLfloat *gl_copy_map_points1d( GLenum target,
                                      GLint ustride, GLint uorder,
                                      const GLdouble *points );

extern GLfloat *gl_copy_map_points2f( GLenum target,
                                      GLint ustride, GLint uorder,
                                      GLint vstride, GLint vorder,
                                      const GLfloat *points );

extern GLfloat *gl_copy_map_points2d(GLenum target,
                                     GLint ustride, GLint uorder,
                                     GLint vstride, GLint vorder,
                                     const GLdouble *points );


extern void gl_Map1f( GLcontext* ctx,
                      GLenum target, GLfloat u1, GLfloat u2, GLint stride,
                      GLint order, const GLfloat *points, GLboolean retain );

extern void gl_Map2f( GLcontext* ctx, GLenum target,
                      GLfloat u1, GLfloat u2, GLint ustride, GLint uorder,
                      GLfloat v1, GLfloat v2, GLint vstride, GLint vorder,
                      const GLfloat *points, GLboolean retain );


extern void gl_EvalCoord1f( GLcontext* ctx, GLfloat u );

extern void gl_EvalCoord2f( GLcontext* ctx, GLfloat u, GLfloat v );


extern void gl_MapGrid1f( GLcontext* ctx, GLint un, GLfloat u1, GLfloat u2 );

extern void gl_MapGrid2f( GLcontext* ctx,
                          GLint un, GLfloat u1, GLfloat u2,
                          GLint vn, GLfloat v1, GLfloat v2 );


extern void gl_GetMapdv( GLcontext* ctx,
                         GLenum target, GLenum query, GLdouble *v );

extern void gl_GetMapfv( GLcontext* ctx,
                         GLenum target, GLenum query, GLfloat *v );

extern void gl_GetMapiv( GLcontext* ctx,
                         GLenum target, GLenum query, GLint *v );

extern void gl_EvalPoint1( GLcontext* ctx, GLint i );

extern void gl_EvalPoint2( GLcontext* ctx, GLint i, GLint j );

extern void gl_EvalMesh1( GLcontext* ctx, GLenum mode, GLint i1, GLint i2 );

extern void gl_EvalMesh2( GLcontext* ctx, GLenum mode,
                          GLint i1, GLint i2, GLint j1, GLint j2 );
# 83 "dlist.c" 2
# 1 "feedback.h" 1
# 46 "feedback.h"
extern void gl_feedback_vertex( GLcontext *ctx,
                                GLfloat x, GLfloat y, GLfloat z, GLfloat w,
                                const GLfloat color[4], GLfloat index,
                                const GLfloat texcoord[4] );


extern void gl_update_hitflag( GLcontext *ctx, GLfloat z );


extern void gl_PassThrough( GLcontext *ctx, GLfloat token );

extern void gl_FeedbackBuffer( GLcontext *ctx, GLsizei size,
                               GLenum type, GLfloat *buffer );

extern void gl_SelectBuffer( GLcontext *ctx, GLsizei size, GLuint *buffer );

extern void gl_InitNames( GLcontext *ctx );

extern void gl_LoadName( GLcontext *ctx, GLuint name );

extern void gl_PushName( GLcontext *ctx, GLuint name );

extern void gl_PopName( GLcontext *ctx );

extern GLint gl_RenderMode( GLcontext *ctx, GLenum mode );
# 84 "dlist.c" 2
# 1 "fog.h" 1
# 40 "fog.h"
extern void gl_Fogfv( GLcontext *ctx, GLenum pname, const GLfloat *params );


extern void gl_fog_color_vertices( GLcontext *ctx, GLuint n,
                                   GLfloat v[][4], GLfixed color[][4] );

extern void gl_fog_index_vertices( GLcontext *ctx, GLuint n,
                                   GLfloat v[][4], GLuint indx[] );


extern void gl_fog_color_pixels( GLcontext *ctx,
                                 GLuint n, const GLdepth z[],
     GLubyte red[], GLubyte green[],
     GLubyte blue[], GLubyte alpha[] );

extern void gl_fog_index_pixels( GLcontext *ctx,
                                 GLuint n, const GLdepth z[], GLuint indx[] );
# 85 "dlist.c" 2
# 1 "image.h" 1
# 48 "image.h"
extern void gl_flip_bytes( GLubyte *p, GLuint n );


extern void gl_swap2( GLushort *p, GLuint n );

extern void gl_swap4( GLuint *p, GLuint n );


extern GLint gl_sizeof_type( GLenum type );


extern GLint gl_components_in_format( GLenum format );


extern GLvoid *gl_pixel_addr_in_image( struct gl_pixelstore_attrib *packing,
                                const GLvoid *image, GLsizei width,
                                GLsizei height, GLenum format, GLenum type,
                                GLint img, GLint row, GLint column );


extern struct gl_image *gl_unpack_image( GLcontext *ctx,
                                  GLint width, GLint height,
                                  GLenum srcFormat, GLenum srcType,
                                  GLenum destType,
                                  const GLvoid *pixels,
                                  GLboolean interleave );


struct gl_image *gl_unpack_image3D( GLcontext *ctx,
                                    GLint width, GLint height,GLint depth,
                                    GLenum srcFormat, GLenum srcType,
                                    GLenum destType,
                                    const GLvoid *pixels,
                                    GLboolean interleave );


extern void gl_free_image( struct gl_image *image );
# 86 "dlist.c" 2
# 1 "light.h" 1
# 46 "light.h"
extern void gl_ShadeModel( GLcontext *ctx, GLenum mode );

extern void gl_ColorMaterial( GLcontext *ctx, GLenum face, GLenum mode );

extern void gl_Lightfv( GLcontext *ctx,
                        GLenum light, GLenum pname, const GLfloat *params,
                        GLint nparams );

extern void gl_LightModelfv( GLcontext *ctx,
                             GLenum pname, const GLfloat *params );


extern GLuint gl_material_bitmask( GLenum face, GLenum pname );

extern void gl_set_material( GLcontext *ctx, GLuint bitmask,
                             const GLfloat *params);

extern void gl_Materialfv( GLcontext *ctx,
                           GLenum face, GLenum pname, const GLfloat *params );



extern void gl_GetLightfv( GLcontext *ctx,
                           GLenum light, GLenum pname, GLfloat *params );

extern void gl_GetLightiv( GLcontext *ctx,
                           GLenum light, GLenum pname, GLint *params );


extern void gl_GetMaterialfv( GLcontext *ctx,
                              GLenum face, GLenum pname, GLfloat *params );

extern void gl_GetMaterialiv( GLcontext *ctx,
                              GLenum face, GLenum pname, GLint *params );


extern void gl_compute_spot_exp_table( struct gl_light *l );

extern void gl_compute_material_shine_table( struct gl_material *m );

extern void gl_update_lighting( GLcontext *ctx );



extern void gl_color_shade_vertices( GLcontext *ctx,
                                     GLuint n,
                                     GLfloat vertex[][4],
                                     GLfloat normal[][3],
                                     GLuint twoside,
                                     GLfixed frontcolor[][4],
                                     GLfixed backcolor[][4] );


extern void gl_color_shade_vertices_fast( GLcontext *ctx,
                                          GLuint n,
                                          GLfloat vertex[][4],
                                          GLfloat normal[][3],
                                          GLuint twoside,
                                          GLfixed frontcolor[][4],
                                          GLfixed backcolor[][4] );


extern void gl_index_shade_vertices( GLcontext *ctx,
                                     GLuint n,
                                     GLfloat vertex[][4],
                                     GLfloat normal[][3],
                                     GLuint twoside,
                                     GLuint frontindex[],
                                     GLuint backindex[] );
# 87 "dlist.c" 2
# 1 "lines.h" 1
# 39 "lines.h"
extern void gl_LineWidth( GLcontext *ctx, GLfloat width );

extern void gl_LineStipple( GLcontext *ctx, GLint factor, GLushort pattern );

extern void gl_set_line_function( GLcontext *ctx );
# 88 "dlist.c" 2
# 1 "dlist.h" 1
# 46 "dlist.h"
extern void gl_init_lists( void );

extern GLint gl_list_index( void );




extern void gl_CallList( GLcontext *ctx, GLuint list );

extern void gl_CallLists( GLcontext *ctx,
                          GLsizei n, GLenum type, const GLvoid *lists );

extern void gl_DeleteLists( GLcontext *ctx, GLuint list, GLsizei range );

extern void gl_EndList( GLcontext *ctx );

extern GLuint gl_GenLists( GLcontext *ctx, GLsizei range );

extern GLboolean gl_IsList( GLcontext *ctx, GLuint list );

extern void gl_ListBase( GLcontext *ctx, GLuint base );

extern void gl_NewList( GLcontext *ctx, GLuint list, GLenum mode );




extern void gl_save_Accum( GLcontext *ctx, GLenum op, GLfloat value );

extern void gl_save_AlphaFunc( GLcontext *ctx, GLenum func, GLclampf ref );

extern void gl_save_BlendColor( GLcontext *ctx, GLfloat red, GLfloat green,
                                GLfloat blue, GLfloat alpha );

extern void gl_save_BlendEquation( GLcontext *ctx, GLenum mode );

extern void gl_save_BlendFunc( GLcontext *ctx,
                               GLenum sfactor, GLenum dfactor );

extern void gl_save_Begin( GLcontext *ctx, GLenum mode );

extern void gl_save_BindTexture( GLcontext *ctx,
                                 GLenum target, GLuint texture );

extern void gl_save_Bitmap( GLcontext *ctx, GLsizei width, GLsizei height,
       GLfloat xorig, GLfloat yorig,
       GLfloat xmove, GLfloat ymove,
                            const struct gl_image *bitmap );

extern void gl_save_CallList( GLcontext *ctx, GLuint list );

extern void gl_save_CallLists( GLcontext *ctx,
                               GLsizei n, GLenum type, const GLvoid *lists );

extern void gl_save_Clear( GLcontext *ctx, GLbitfield mask );

extern void gl_save_ClearAccum( GLcontext *ctx, GLfloat red, GLfloat green,
           GLfloat blue, GLfloat alpha );

extern void gl_save_ClearColor( GLcontext *ctx, GLclampf red, GLclampf green,
           GLclampf blue, GLclampf alpha );

extern void gl_save_ClearDepth( GLcontext *ctx, GLclampd depth );

extern void gl_save_ClearIndex( GLcontext *ctx, GLfloat c );

extern void gl_save_ClearStencil( GLcontext *ctx, GLint s );

extern void gl_save_ClipPlane( GLcontext *ctx,
                               GLenum plane, const GLfloat *equ );

extern void gl_save_Color4f( GLcontext *ctx, GLfloat r, GLfloat g,
                             GLfloat b, GLfloat a );

extern void gl_save_Color4ub( GLcontext *ctx, GLubyte r, GLubyte g,
                              GLubyte b, GLubyte a );

extern void gl_save_ColorMask( GLcontext *ctx, GLboolean red, GLboolean green,
          GLboolean blue, GLboolean alpha );

extern void gl_save_ColorMaterial( GLcontext *ctx, GLenum face, GLenum mode );

extern void gl_save_CopyPixels( GLcontext *ctx, GLint x, GLint y,
    GLsizei width, GLsizei height, GLenum type );

extern void gl_save_CopyTexImage1D( GLcontext *ctx,
                                    GLenum target, GLint level,
                                    GLenum internalformat,
                                    GLint x, GLint y, GLsizei width,
                                    GLint border );

extern void gl_save_CopyTexImage2D( GLcontext *ctx,
                                    GLenum target, GLint level,
                                    GLenum internalformat,
                                    GLint x, GLint y, GLsizei width,
                                    GLsizei height, GLint border );

extern void gl_save_CopyTexSubImage1D( GLcontext *ctx,
                                       GLenum target, GLint level,
                                       GLint xoffset, GLint x, GLint y,
                                       GLsizei width );

extern void gl_save_CopyTexSubImage2D( GLcontext *ctx,
                                       GLenum target, GLint level,
                                       GLint xoffset, GLint yoffset,
                                       GLint x, GLint y,
                                       GLsizei width, GLint height );

extern void gl_save_CopyTexSubImage3DEXT( GLcontext *ctx,
                                          GLenum target, GLint level,
                                          GLint xoffset, GLint yoffset, GLint zoffset,
                                          GLint x, GLint y,
                                          GLsizei width, GLint height );

extern void gl_save_CullFace( GLcontext *ctx, GLenum mode );

extern void gl_save_DepthFunc( GLcontext *ctx, GLenum func );

extern void gl_save_DepthMask( GLcontext *ctx, GLboolean mask );

extern void gl_save_DepthRange( GLcontext *ctx,
                                GLclampd nearval, GLclampd farval );

extern void gl_save_Disable( GLcontext *ctx, GLenum cap );

extern void gl_save_DrawBuffer( GLcontext *ctx, GLenum mode );

extern void gl_save_DrawPixels( GLcontext *ctx,
                                GLsizei width, GLsizei height, GLenum format,
           GLenum type, const GLvoid *pixels );

extern void gl_save_EdgeFlag( GLcontext *ctx, GLboolean flag );

extern void gl_save_Enable( GLcontext *ctx, GLenum cap );

extern void gl_save_End( GLcontext *ctx );

extern void gl_save_EvalCoord1f( GLcontext *ctx, GLfloat u );

extern void gl_save_EvalCoord2f( GLcontext *ctx, GLfloat u, GLfloat v );

extern void gl_save_EvalMesh1( GLcontext *ctx,
                               GLenum mode, GLint i1, GLint i2 );

extern void gl_save_EvalMesh2( GLcontext *ctx, GLenum mode, GLint i1, GLint i2,
          GLint j1, GLint j2 );

extern void gl_save_EvalPoint1( GLcontext *ctx, GLint i );

extern void gl_save_EvalPoint2( GLcontext *ctx, GLint i, GLint j );

extern void gl_save_Fogfv( GLcontext *ctx,
                           GLenum pname, const GLfloat *params );

extern void gl_save_FrontFace( GLcontext *ctx, GLenum mode );

extern void gl_save_Frustum( GLcontext *ctx, GLdouble left, GLdouble right,
                             GLdouble bottom, GLdouble top,
                             GLdouble nearval, GLdouble farval );

extern void gl_save_Hint( GLcontext *ctx, GLenum target, GLenum mode );

extern void gl_save_Indexf( GLcontext *ctx, GLfloat index );

extern void gl_save_Indexi( GLcontext *ctx, GLint index );

extern void gl_save_IndexMask( GLcontext *ctx, GLuint mask );

extern void gl_save_InitNames( GLcontext *ctx );

extern void gl_save_Lightfv( GLcontext *ctx, GLenum light, GLenum pname,
                             const GLfloat *params, GLint numparams );

extern void gl_save_LightModelfv( GLcontext *ctx, GLenum pname,
                                const GLfloat *params );

extern void gl_save_LineWidth( GLcontext *ctx, GLfloat width );

extern void gl_save_LineStipple( GLcontext *ctx, GLint factor,
                                 GLushort pattern );

extern void gl_save_ListBase( GLcontext *ctx, GLuint base );

extern void gl_save_LoadMatrixf( GLcontext *ctx, const GLfloat *m );

extern void gl_save_LoadName( GLcontext *ctx, GLuint name );

extern void gl_save_LogicOp( GLcontext *ctx, GLenum opcode );

extern void gl_save_Map1f( GLcontext *ctx, GLenum target,
                           GLfloat u1, GLfloat u2, GLint stride,
      GLint order, const GLfloat *points,
                           GLboolean retain );

extern void gl_save_Map2f( GLcontext *ctx, GLenum target,
      GLfloat u1, GLfloat u2, GLint ustride, GLint uorder,
      GLfloat v1, GLfloat v2, GLint vstride, GLint vorder,
      const GLfloat *points,
                           GLboolean retain );

extern void gl_save_MapGrid1f( GLcontext *ctx, GLint un,
                               GLfloat u1, GLfloat u2 );

extern void gl_save_MapGrid2f( GLcontext *ctx,
                               GLint un, GLfloat u1, GLfloat u2,
                               GLint vn, GLfloat v1, GLfloat v2 );

extern void gl_save_Materialfv( GLcontext *ctx, GLenum face, GLenum pname,
                                const GLfloat *params );

extern void gl_save_MatrixMode( GLcontext *ctx, GLenum mode );

extern void gl_save_MultMatrixf( GLcontext *ctx, const GLfloat *m );

extern void gl_save_NewList( GLcontext *ctx, GLuint list, GLenum mode );

extern void gl_save_Normal3fv( GLcontext *ctx, const GLfloat n[3] );

extern void gl_save_Normal3f( GLcontext *ctx,
                              GLfloat nx, GLfloat ny, GLfloat nz );

extern void gl_save_PassThrough( GLcontext *ctx, GLfloat token );

extern void gl_save_PixelMapfv( GLcontext *ctx, GLenum map, GLint mapsize,
                                const GLfloat *values );

extern void gl_save_PixelTransferf( GLcontext *ctx,
                                    GLenum pname, GLfloat param );

extern void gl_save_PixelZoom( GLcontext *ctx,
                               GLfloat xfactor, GLfloat yfactor );

extern void gl_save_PointSize( GLcontext *ctx, GLfloat size );

extern void gl_save_PolygonMode( GLcontext *ctx, GLenum face, GLenum mode );

extern void gl_save_PolygonStipple( GLcontext *ctx, const GLubyte *mask );

extern void gl_save_PolygonOffset( GLcontext *ctx,
                                   GLfloat factor, GLfloat units );

extern void gl_save_PopAttrib( GLcontext *ctx );

extern void gl_save_PopMatrix( GLcontext *ctx );

extern void gl_save_PopName( GLcontext *ctx );

extern void gl_save_PrioritizeTextures( GLcontext *ctx,
                                        GLsizei n, const GLuint *textures,
                                        const GLclampf *priorities );

extern void gl_save_PushAttrib( GLcontext *ctx, GLbitfield mask );

extern void gl_save_PushMatrix( GLcontext *ctx );

extern void gl_save_PushName( GLcontext *ctx, GLuint name );

extern void gl_save_RasterPos4f( GLcontext *ctx,
                                 GLfloat x, GLfloat y, GLfloat z, GLfloat w );

extern void gl_save_ReadBuffer( GLcontext *ctx, GLenum mode );

extern void gl_save_Rotatef( GLcontext *ctx, GLfloat angle,
                             GLfloat x, GLfloat y, GLfloat z );

extern void gl_save_Scalef( GLcontext *ctx, GLfloat x, GLfloat y, GLfloat z );

extern void gl_save_Scissor( GLcontext *ctx,
                             GLint x, GLint y, GLsizei width, GLsizei height );

extern void gl_save_ShadeModel( GLcontext *ctx, GLenum mode );

extern void gl_save_StencilFunc( GLcontext *ctx,
                                 GLenum func, GLint ref, GLuint mask );

extern void gl_save_StencilMask( GLcontext *ctx, GLuint mask );

extern void gl_save_StencilOp( GLcontext *ctx,
                               GLenum fail, GLenum zfail, GLenum zpass );

extern void gl_save_TexCoord4f( GLcontext *ctx, GLfloat s, GLfloat t,
                                GLfloat r, GLfloat q );

extern void gl_save_TexEnvfv( GLcontext *ctx, GLenum target, GLenum pname,
                              const GLfloat *params );

extern void gl_save_TexParameterfv( GLcontext *ctx, GLenum target,
                                    GLenum pname, const GLfloat *params );

extern void gl_save_TexGenfv( GLcontext *ctx, GLenum coord, GLenum pname,
                              const GLfloat *params );

extern void gl_save_TexImage1D( GLcontext *ctx, GLenum target,
                                GLint level, GLint components,
           GLsizei width, GLint border,
                                GLenum format, GLenum type,
                                struct gl_image *teximage );

extern void gl_save_TexImage2D( GLcontext *ctx, GLenum target,
                                GLint level, GLint components,
           GLsizei width, GLsizei height, GLint border,
                                GLenum format, GLenum type,
                                struct gl_image *teximage );

extern void gl_save_TexImage3DEXT( GLcontext *ctx, GLenum target,
                                   GLint level, GLint components,
                                   GLsizei width, GLsizei height, GLsizei depth,
                                   GLint border,
                                   GLenum format, GLenum type,
                                   struct gl_image *teximage );

extern void gl_save_TexSubImage1D( GLcontext *ctx,
                                   GLenum target, GLint level,
                                   GLint xoffset, GLsizei width,
                                   GLenum format, GLenum type,
                                   struct gl_image *image );


extern void gl_save_TexSubImage2D( GLcontext *ctx,
                                   GLenum target, GLint level,
                                   GLint xoffset, GLint yoffset,
                                   GLsizei width, GLsizei height,
                                   GLenum format, GLenum type,
                                   struct gl_image *image );

extern void gl_save_TexSubImage3DEXT( GLcontext *ctx,
                                      GLenum target, GLint level,
                                      GLint xoffset, GLint yoffset, GLint zoffset,
                                      GLsizei width, GLsizei height, GLsizei depth,
                                      GLenum format, GLenum type,
                                      struct gl_image *image );

extern void gl_save_Translatef( GLcontext *ctx,
                                GLfloat x, GLfloat y, GLfloat z );

extern void gl_save_Vertex4f( GLcontext *ctx,
                              GLfloat x, GLfloat y, GLfloat z, GLfloat w );

extern void gl_save_Viewport( GLcontext *ctx, GLint x, GLint y,
                              GLsizei width, GLsizei height );

extern void gl_save_WindowPos4fMESA( GLcontext *ctx,
                                     GLfloat x, GLfloat y,
                                     GLfloat z, GLfloat w );
# 89 "dlist.c" 2
# 1 "logic.h" 1
# 42 "logic.h"
extern void gl_LogicOp( GLcontext *ctx, GLenum opcode );


extern void gl_logicop_ci_span( GLcontext *ctx,
                                GLuint n, GLint x, GLint y, GLuint index[],
                                GLubyte mask[] );


extern void gl_logicop_ci_pixels( GLcontext *ctx,
                                  GLuint n, const GLint x[], const GLint y[],
                                  GLuint index[], GLubyte mask[] );


extern void gl_logicop_rgba_span( GLcontext *ctx,
                                  GLuint n, GLint x, GLint y,
                                  GLubyte red[], GLubyte green[],
                                  GLubyte blue[], GLubyte alpha[],
                                  GLubyte mask[] );


extern void gl_logicop_rgba_pixels( GLcontext *ctx,
                                    GLuint n, const GLint x[], const GLint y[],
                                    GLubyte red[], GLubyte green[],
                                    GLubyte blue[], GLubyte alpha[],
                                    GLubyte mask[] );
# 90 "dlist.c" 2
# 1 "macros.h" 1
# 50 "macros.h"
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 1 3 4
# 30 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4




# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/huge_val.h" 1 3 4
# 35 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4

# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/huge_valf.h" 1 3 4
# 37 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/huge_vall.h" 1 3 4
# 38 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4


# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/inf.h" 1 3 4
# 41 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4


# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/nan.h" 1 3 4
# 44 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4



# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathdef.h" 1 3 4
# 28 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathdef.h" 3 4
typedef float float_t;

typedef double double_t;
# 48 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4
# 71 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern double acos (double __x) __attribute__ ((__nothrow__)); extern double __acos (double __x) __attribute__ ((__nothrow__));

extern double asin (double __x) __attribute__ ((__nothrow__)); extern double __asin (double __x) __attribute__ ((__nothrow__));

extern double atan (double __x) __attribute__ ((__nothrow__)); extern double __atan (double __x) __attribute__ ((__nothrow__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__));


extern double cos (double __x) __attribute__ ((__nothrow__)); extern double __cos (double __x) __attribute__ ((__nothrow__));

extern double sin (double __x) __attribute__ ((__nothrow__)); extern double __sin (double __x) __attribute__ ((__nothrow__));

extern double tan (double __x) __attribute__ ((__nothrow__)); extern double __tan (double __x) __attribute__ ((__nothrow__));




extern double cosh (double __x) __attribute__ ((__nothrow__)); extern double __cosh (double __x) __attribute__ ((__nothrow__));

extern double sinh (double __x) __attribute__ ((__nothrow__)); extern double __sinh (double __x) __attribute__ ((__nothrow__));

extern double tanh (double __x) __attribute__ ((__nothrow__)); extern double __tanh (double __x) __attribute__ ((__nothrow__));

# 87 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern double acosh (double __x) __attribute__ ((__nothrow__)); extern double __acosh (double __x) __attribute__ ((__nothrow__));

extern double asinh (double __x) __attribute__ ((__nothrow__)); extern double __asinh (double __x) __attribute__ ((__nothrow__));

extern double atanh (double __x) __attribute__ ((__nothrow__)); extern double __atanh (double __x) __attribute__ ((__nothrow__));







extern double exp (double __x) __attribute__ ((__nothrow__)); extern double __exp (double __x) __attribute__ ((__nothrow__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__));


extern double log (double __x) __attribute__ ((__nothrow__)); extern double __log (double __x) __attribute__ ((__nothrow__));


extern double log10 (double __x) __attribute__ ((__nothrow__)); extern double __log10 (double __x) __attribute__ ((__nothrow__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__));

# 127 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern double expm1 (double __x) __attribute__ ((__nothrow__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__));


extern double log1p (double __x) __attribute__ ((__nothrow__)); extern double __log1p (double __x) __attribute__ ((__nothrow__));


extern double logb (double __x) __attribute__ ((__nothrow__)); extern double __logb (double __x) __attribute__ ((__nothrow__));






extern double exp2 (double __x) __attribute__ ((__nothrow__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__));


extern double log2 (double __x) __attribute__ ((__nothrow__)); extern double __log2 (double __x) __attribute__ ((__nothrow__));








extern double pow (double __x, double __y) __attribute__ ((__nothrow__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__));


extern double sqrt (double __x) __attribute__ ((__nothrow__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__));





extern double hypot (double __x, double __y) __attribute__ ((__nothrow__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__));






extern double cbrt (double __x) __attribute__ ((__nothrow__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__));








extern double ceil (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__));




extern int __isinf (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int isinf (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int finite (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__));



extern double significand (double __x) __attribute__ ((__nothrow__)); extern double __significand (double __x) __attribute__ ((__nothrow__));





extern double copysign (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));






extern double nan (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __nan (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int __isnan (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern int isnan (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double j0 (double) __attribute__ ((__nothrow__)); extern double __j0 (double) __attribute__ ((__nothrow__));
extern double j1 (double) __attribute__ ((__nothrow__)); extern double __j1 (double) __attribute__ ((__nothrow__));
extern double jn (int, double) __attribute__ ((__nothrow__)); extern double __jn (int, double) __attribute__ ((__nothrow__));
extern double y0 (double) __attribute__ ((__nothrow__)); extern double __y0 (double) __attribute__ ((__nothrow__));
extern double y1 (double) __attribute__ ((__nothrow__)); extern double __y1 (double) __attribute__ ((__nothrow__));
extern double yn (int, double) __attribute__ ((__nothrow__)); extern double __yn (int, double) __attribute__ ((__nothrow__));






extern double erf (double) __attribute__ ((__nothrow__)); extern double __erf (double) __attribute__ ((__nothrow__));
extern double erfc (double) __attribute__ ((__nothrow__)); extern double __erfc (double) __attribute__ ((__nothrow__));
extern double lgamma (double) __attribute__ ((__nothrow__)); extern double __lgamma (double) __attribute__ ((__nothrow__));






extern double tgamma (double) __attribute__ ((__nothrow__)); extern double __tgamma (double) __attribute__ ((__nothrow__));





extern double gamma (double) __attribute__ ((__nothrow__)); extern double __gamma (double) __attribute__ ((__nothrow__));






extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__));







extern double rint (double __x) __attribute__ ((__nothrow__)); extern double __rint (double __x) __attribute__ ((__nothrow__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern double remainder (double __x, double __y) __attribute__ ((__nothrow__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__));



extern int ilogb (double __x) __attribute__ ((__nothrow__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__));




extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__));



extern double round (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__));






extern long int lrint (double __x) __attribute__ ((__nothrow__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__));
extern long long int llrint (double __x) __attribute__ ((__nothrow__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__));



extern long int lround (double __x) __attribute__ ((__nothrow__)); extern long int __lround (double __x) __attribute__ ((__nothrow__));
extern long long int llround (double __x) __attribute__ ((__nothrow__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__));



extern int __fpclassify (double __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__));








extern double scalb (double __x, double __n) __attribute__ ((__nothrow__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__));
# 72 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4
# 94 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern float acosf (float __x) __attribute__ ((__nothrow__)); extern float __acosf (float __x) __attribute__ ((__nothrow__));

extern float asinf (float __x) __attribute__ ((__nothrow__)); extern float __asinf (float __x) __attribute__ ((__nothrow__));

extern float atanf (float __x) __attribute__ ((__nothrow__)); extern float __atanf (float __x) __attribute__ ((__nothrow__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__));


extern float cosf (float __x) __attribute__ ((__nothrow__)); extern float __cosf (float __x) __attribute__ ((__nothrow__));

extern float sinf (float __x) __attribute__ ((__nothrow__)); extern float __sinf (float __x) __attribute__ ((__nothrow__));

extern float tanf (float __x) __attribute__ ((__nothrow__)); extern float __tanf (float __x) __attribute__ ((__nothrow__));




extern float coshf (float __x) __attribute__ ((__nothrow__)); extern float __coshf (float __x) __attribute__ ((__nothrow__));

extern float sinhf (float __x) __attribute__ ((__nothrow__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__));

extern float tanhf (float __x) __attribute__ ((__nothrow__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__));

# 87 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern float acoshf (float __x) __attribute__ ((__nothrow__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__));

extern float asinhf (float __x) __attribute__ ((__nothrow__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__));

extern float atanhf (float __x) __attribute__ ((__nothrow__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__));







extern float expf (float __x) __attribute__ ((__nothrow__)); extern float __expf (float __x) __attribute__ ((__nothrow__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__));


extern float logf (float __x) __attribute__ ((__nothrow__)); extern float __logf (float __x) __attribute__ ((__nothrow__));


extern float log10f (float __x) __attribute__ ((__nothrow__)); extern float __log10f (float __x) __attribute__ ((__nothrow__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__));

# 127 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern float expm1f (float __x) __attribute__ ((__nothrow__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__));


extern float log1pf (float __x) __attribute__ ((__nothrow__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__));


extern float logbf (float __x) __attribute__ ((__nothrow__)); extern float __logbf (float __x) __attribute__ ((__nothrow__));






extern float exp2f (float __x) __attribute__ ((__nothrow__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__));


extern float log2f (float __x) __attribute__ ((__nothrow__)); extern float __log2f (float __x) __attribute__ ((__nothrow__));








extern float powf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__));





extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__));






extern float cbrtf (float __x) __attribute__ ((__nothrow__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__));








extern float ceilf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__));




extern int __isinff (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int isinff (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int finitef (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__));



extern float significandf (float __x) __attribute__ ((__nothrow__)); extern float __significandf (float __x) __attribute__ ((__nothrow__));





extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));






extern float nanf (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __nanf (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int __isnanf (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern int isnanf (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float j0f (float) __attribute__ ((__nothrow__)); extern float __j0f (float) __attribute__ ((__nothrow__));
extern float j1f (float) __attribute__ ((__nothrow__)); extern float __j1f (float) __attribute__ ((__nothrow__));
extern float jnf (int, float) __attribute__ ((__nothrow__)); extern float __jnf (int, float) __attribute__ ((__nothrow__));
extern float y0f (float) __attribute__ ((__nothrow__)); extern float __y0f (float) __attribute__ ((__nothrow__));
extern float y1f (float) __attribute__ ((__nothrow__)); extern float __y1f (float) __attribute__ ((__nothrow__));
extern float ynf (int, float) __attribute__ ((__nothrow__)); extern float __ynf (int, float) __attribute__ ((__nothrow__));






extern float erff (float) __attribute__ ((__nothrow__)); extern float __erff (float) __attribute__ ((__nothrow__));
extern float erfcf (float) __attribute__ ((__nothrow__)); extern float __erfcf (float) __attribute__ ((__nothrow__));
extern float lgammaf (float) __attribute__ ((__nothrow__)); extern float __lgammaf (float) __attribute__ ((__nothrow__));






extern float tgammaf (float) __attribute__ ((__nothrow__)); extern float __tgammaf (float) __attribute__ ((__nothrow__));





extern float gammaf (float) __attribute__ ((__nothrow__)); extern float __gammaf (float) __attribute__ ((__nothrow__));






extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__));







extern float rintf (float __x) __attribute__ ((__nothrow__)); extern float __rintf (float __x) __attribute__ ((__nothrow__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__));




extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__));



extern float roundf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__));
extern long long int llrintf (float __x) __attribute__ ((__nothrow__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__));
extern long long int llroundf (float __x) __attribute__ ((__nothrow__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__));



extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__));








extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__));
# 95 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4
# 145 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) __asm__ ("" "acos") __attribute__ ((__nothrow__)); extern long double __acosl (long double __x) __asm__ ("" "__acos") __attribute__ ((__nothrow__));

extern long double asinl (long double __x) __asm__ ("" "asin") __attribute__ ((__nothrow__)); extern long double __asinl (long double __x) __asm__ ("" "__asin") __attribute__ ((__nothrow__));

extern long double atanl (long double __x) __asm__ ("" "atan") __attribute__ ((__nothrow__)); extern long double __atanl (long double __x) __asm__ ("" "__atan") __attribute__ ((__nothrow__));

extern long double atan2l (long double __y, long double __x) __asm__ ("" "atan2") __attribute__ ((__nothrow__)); extern long double __atan2l (long double __y, long double __x) __asm__ ("" "__atan2") __attribute__ ((__nothrow__));


extern long double cosl (long double __x) __asm__ ("" "cos") __attribute__ ((__nothrow__)); extern long double __cosl (long double __x) __asm__ ("" "__cos") __attribute__ ((__nothrow__));

extern long double sinl (long double __x) __asm__ ("" "sin") __attribute__ ((__nothrow__)); extern long double __sinl (long double __x) __asm__ ("" "__sin") __attribute__ ((__nothrow__));

extern long double tanl (long double __x) __asm__ ("" "tan") __attribute__ ((__nothrow__)); extern long double __tanl (long double __x) __asm__ ("" "__tan") __attribute__ ((__nothrow__));




extern long double coshl (long double __x) __asm__ ("" "cosh") __attribute__ ((__nothrow__)); extern long double __coshl (long double __x) __asm__ ("" "__cosh") __attribute__ ((__nothrow__));

extern long double sinhl (long double __x) __asm__ ("" "sinh") __attribute__ ((__nothrow__)); extern long double __sinhl (long double __x) __asm__ ("" "__sinh") __attribute__ ((__nothrow__));

extern long double tanhl (long double __x) __asm__ ("" "tanh") __attribute__ ((__nothrow__)); extern long double __tanhl (long double __x) __asm__ ("" "__tanh") __attribute__ ((__nothrow__));

# 87 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern long double acoshl (long double __x) __asm__ ("" "acosh") __attribute__ ((__nothrow__)); extern long double __acoshl (long double __x) __asm__ ("" "__acosh") __attribute__ ((__nothrow__));

extern long double asinhl (long double __x) __asm__ ("" "asinh") __attribute__ ((__nothrow__)); extern long double __asinhl (long double __x) __asm__ ("" "__asinh") __attribute__ ((__nothrow__));

extern long double atanhl (long double __x) __asm__ ("" "atanh") __attribute__ ((__nothrow__)); extern long double __atanhl (long double __x) __asm__ ("" "__atanh") __attribute__ ((__nothrow__));







extern long double expl (long double __x) __asm__ ("" "exp") __attribute__ ((__nothrow__)); extern long double __expl (long double __x) __asm__ ("" "__exp") __attribute__ ((__nothrow__));


extern long double frexpl (long double __x, int *__exponent) __asm__ ("" "frexp") __attribute__ ((__nothrow__)); extern long double __frexpl (long double __x, int *__exponent) __asm__ ("" "__frexp") __attribute__ ((__nothrow__));


extern long double ldexpl (long double __x, int __exponent) __asm__ ("" "ldexp") __attribute__ ((__nothrow__)); extern long double __ldexpl (long double __x, int __exponent) __asm__ ("" "__ldexp") __attribute__ ((__nothrow__));


extern long double logl (long double __x) __asm__ ("" "log") __attribute__ ((__nothrow__)); extern long double __logl (long double __x) __asm__ ("" "__log") __attribute__ ((__nothrow__));


extern long double log10l (long double __x) __asm__ ("" "log10") __attribute__ ((__nothrow__)); extern long double __log10l (long double __x) __asm__ ("" "__log10") __attribute__ ((__nothrow__));


extern long double modfl (long double __x, long double *__iptr) __asm__ ("" "modf") __attribute__ ((__nothrow__)); extern long double __modfl (long double __x, long double *__iptr) __asm__ ("" "__modf") __attribute__ ((__nothrow__));

# 127 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mathcalls.h" 3 4


extern long double expm1l (long double __x) __asm__ ("" "expm1") __attribute__ ((__nothrow__)); extern long double __expm1l (long double __x) __asm__ ("" "__expm1") __attribute__ ((__nothrow__));


extern long double log1pl (long double __x) __asm__ ("" "log1p") __attribute__ ((__nothrow__)); extern long double __log1pl (long double __x) __asm__ ("" "__log1p") __attribute__ ((__nothrow__));


extern long double logbl (long double __x) __asm__ ("" "logb") __attribute__ ((__nothrow__)); extern long double __logbl (long double __x) __asm__ ("" "__logb") __attribute__ ((__nothrow__));






extern long double exp2l (long double __x) __asm__ ("" "exp2") __attribute__ ((__nothrow__)); extern long double __exp2l (long double __x) __asm__ ("" "__exp2") __attribute__ ((__nothrow__));


extern long double log2l (long double __x) __asm__ ("" "log2") __attribute__ ((__nothrow__)); extern long double __log2l (long double __x) __asm__ ("" "__log2") __attribute__ ((__nothrow__));








extern long double powl (long double __x, long double __y) __asm__ ("" "pow") __attribute__ ((__nothrow__)); extern long double __powl (long double __x, long double __y) __asm__ ("" "__pow") __attribute__ ((__nothrow__));


extern long double sqrtl (long double __x) __asm__ ("" "sqrt") __attribute__ ((__nothrow__)); extern long double __sqrtl (long double __x) __asm__ ("" "__sqrt") __attribute__ ((__nothrow__));





extern long double hypotl (long double __x, long double __y) __asm__ ("" "hypot") __attribute__ ((__nothrow__)); extern long double __hypotl (long double __x, long double __y) __asm__ ("" "__hypot") __attribute__ ((__nothrow__));






extern long double cbrtl (long double __x) __asm__ ("" "cbrt") __attribute__ ((__nothrow__)); extern long double __cbrtl (long double __x) __asm__ ("" "__cbrt") __attribute__ ((__nothrow__));








extern long double ceill (long double __x) __asm__ ("" "ceil") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __asm__ ("" "__ceil") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __asm__ ("" "fabs") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __asm__ ("" "__fabs") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __asm__ ("" "floor") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __asm__ ("" "__floor") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __asm__ ("" "fmod") __attribute__ ((__nothrow__)); extern long double __fmodl (long double __x, long double __y) __asm__ ("" "__fmod") __attribute__ ((__nothrow__));




extern int __isinfl (long double __value) __asm__ ("" "__isinf") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __asm__ ("" "__finite") __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int isinfl (long double __value) __asm__ ("" "isinf") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int finitel (long double __value) __asm__ ("" "finite") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __asm__ ("" "drem") __attribute__ ((__nothrow__)); extern long double __dreml (long double __x, long double __y) __asm__ ("" "__drem") __attribute__ ((__nothrow__));



extern long double significandl (long double __x) __asm__ ("" "significand") __attribute__ ((__nothrow__)); extern long double __significandl (long double __x) __asm__ ("" "__significand") __attribute__ ((__nothrow__));





extern long double copysignl (long double __x, long double __y) __asm__ ("" "copysign") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __asm__ ("" "__copysign") __attribute__ ((__nothrow__)) __attribute__ ((__const__));






extern long double nanl (__const char *__tagb) __asm__ ("" "nan") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __nanl (__const char *__tagb) __asm__ ("" "__nan") __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int __isnanl (long double __value) __asm__ ("" "__isnan") __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern int isnanl (long double __value) __asm__ ("" "isnan") __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double j0l (long double) __asm__ ("" "j0") __attribute__ ((__nothrow__)); extern long double __j0l (long double) __asm__ ("" "__j0") __attribute__ ((__nothrow__));
extern long double j1l (long double) __asm__ ("" "j1") __attribute__ ((__nothrow__)); extern long double __j1l (long double) __asm__ ("" "__j1") __attribute__ ((__nothrow__));
extern long double jnl (int, long double) __asm__ ("" "jn") __attribute__ ((__nothrow__)); extern long double __jnl (int, long double) __asm__ ("" "__jn") __attribute__ ((__nothrow__));
extern long double y0l (long double) __asm__ ("" "y0") __attribute__ ((__nothrow__)); extern long double __y0l (long double) __asm__ ("" "__y0") __attribute__ ((__nothrow__));
extern long double y1l (long double) __asm__ ("" "y1") __attribute__ ((__nothrow__)); extern long double __y1l (long double) __asm__ ("" "__y1") __attribute__ ((__nothrow__));
extern long double ynl (int, long double) __asm__ ("" "yn") __attribute__ ((__nothrow__)); extern long double __ynl (int, long double) __asm__ ("" "__yn") __attribute__ ((__nothrow__));






extern long double erfl (long double) __asm__ ("" "erf") __attribute__ ((__nothrow__)); extern long double __erfl (long double) __asm__ ("" "__erf") __attribute__ ((__nothrow__));
extern long double erfcl (long double) __asm__ ("" "erfc") __attribute__ ((__nothrow__)); extern long double __erfcl (long double) __asm__ ("" "__erfc") __attribute__ ((__nothrow__));
extern long double lgammal (long double) __asm__ ("" "lgamma") __attribute__ ((__nothrow__)); extern long double __lgammal (long double) __asm__ ("" "__lgamma") __attribute__ ((__nothrow__));






extern long double tgammal (long double) __asm__ ("" "tgamma") __attribute__ ((__nothrow__)); extern long double __tgammal (long double) __asm__ ("" "__tgamma") __attribute__ ((__nothrow__));





extern long double gammal (long double) __asm__ ("" "gamma") __attribute__ ((__nothrow__)); extern long double __gammal (long double) __asm__ ("" "__gamma") __attribute__ ((__nothrow__));






extern long double lgammal_r (long double, int *__signgamp) __asm__ ("" "lgamma_r") __attribute__ ((__nothrow__)); extern long double __lgammal_r (long double, int *__signgamp) __asm__ ("" "__lgamma_r") __attribute__ ((__nothrow__));







extern long double rintl (long double __x) __asm__ ("" "rint") __attribute__ ((__nothrow__)); extern long double __rintl (long double __x) __asm__ ("" "__rint") __attribute__ ((__nothrow__));


extern long double nextafterl (long double __x, long double __y) __asm__ ("" "nextafter") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __asm__ ("" "__nextafter") __attribute__ ((__nothrow__)) __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __asm__ ("" "nexttoward") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __asm__ ("" "__nexttoward") __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) __asm__ ("" "remainder") __attribute__ ((__nothrow__)); extern long double __remainderl (long double __x, long double __y) __asm__ ("" "__remainder") __attribute__ ((__nothrow__));



extern long double scalbnl (long double __x, int __n) __asm__ ("" "scalbn") __attribute__ ((__nothrow__)); extern long double __scalbnl (long double __x, int __n) __asm__ ("" "__scalbn") __attribute__ ((__nothrow__));



extern int ilogbl (long double __x) __asm__ ("" "ilogb") __attribute__ ((__nothrow__)); extern int __ilogbl (long double __x) __asm__ ("" "__ilogb") __attribute__ ((__nothrow__));




extern long double scalblnl (long double __x, long int __n) __asm__ ("" "scalbln") __attribute__ ((__nothrow__)); extern long double __scalblnl (long double __x, long int __n) __asm__ ("" "__scalbln") __attribute__ ((__nothrow__));



extern long double nearbyintl (long double __x) __asm__ ("" "nearbyint") __attribute__ ((__nothrow__)); extern long double __nearbyintl (long double __x) __asm__ ("" "__nearbyint") __attribute__ ((__nothrow__));



extern long double roundl (long double __x) __asm__ ("" "round") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __asm__ ("" "__round") __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __asm__ ("" "trunc") __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __asm__ ("" "__trunc") __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __asm__ ("" "remquo") __attribute__ ((__nothrow__)); extern long double __remquol (long double __x, long double __y, int *__quo) __asm__ ("" "__remquo") __attribute__ ((__nothrow__));






extern long int lrintl (long double __x) __asm__ ("" "lrint") __attribute__ ((__nothrow__)); extern long int __lrintl (long double __x) __asm__ ("" "__lrint") __attribute__ ((__nothrow__));
extern long long int llrintl (long double __x) __asm__ ("" "llrint") __attribute__ ((__nothrow__)); extern long long int __llrintl (long double __x) __asm__ ("" "__llrint") __attribute__ ((__nothrow__));



extern long int lroundl (long double __x) __asm__ ("" "lround") __attribute__ ((__nothrow__)); extern long int __lroundl (long double __x) __asm__ ("" "__lround") __attribute__ ((__nothrow__));
extern long long int llroundl (long double __x) __asm__ ("" "llround") __attribute__ ((__nothrow__)); extern long long int __llroundl (long double __x) __asm__ ("" "__llround") __attribute__ ((__nothrow__));



extern long double fdiml (long double __x, long double __y) __asm__ ("" "fdim") __attribute__ ((__nothrow__)); extern long double __fdiml (long double __x, long double __y) __asm__ ("" "__fdim") __attribute__ ((__nothrow__));


extern long double fmaxl (long double __x, long double __y) __asm__ ("" "fmax") __attribute__ ((__nothrow__)); extern long double __fmaxl (long double __x, long double __y) __asm__ ("" "__fmax") __attribute__ ((__nothrow__));


extern long double fminl (long double __x, long double __y) __asm__ ("" "fmin") __attribute__ ((__nothrow__)); extern long double __fminl (long double __x, long double __y) __asm__ ("" "__fmin") __attribute__ ((__nothrow__));



extern int __fpclassifyl (long double __value) __asm__ ("" "__fpclassify") __attribute__ ((__nothrow__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __asm__ ("" "__signbit") __attribute__ ((__nothrow__))
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __asm__ ("" "fma") __attribute__ ((__nothrow__)); extern long double __fmal (long double __x, long double __y, long double __z) __asm__ ("" "__fma") __attribute__ ((__nothrow__));








extern long double scalbl (long double __x, long double __n) __asm__ ("" "scalb") __attribute__ ((__nothrow__)); extern long double __scalbl (long double __x, long double __n) __asm__ ("" "__scalb") __attribute__ ((__nothrow__));
# 146 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 2 3 4
# 161 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
extern int signgam;
# 202 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
enum
  {
    FP_NAN,

    FP_INFINITE,

    FP_ZERO,

    FP_SUBNORMAL,

    FP_NORMAL

  };
# 295 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 320 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);
# 476 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/math.h" 3 4

# 51 "macros.h" 2
# 91 "dlist.c" 2
# 1 "masking.h" 1
# 40 "masking.h"
extern void gl_IndexMask( GLcontext *ctx, GLuint mask );

extern void gl_ColorMask( GLcontext *ctx, GLboolean red, GLboolean green,
                          GLboolean blue, GLboolean alpha );





extern void gl_mask_color_span( GLcontext *ctx,
                                GLuint n, GLint x, GLint y,
                                GLubyte red[], GLubyte green[],
                                GLubyte blue[], GLubyte alpha[] );






extern void gl_mask_color_pixels( GLcontext *ctx,
                                  GLuint n, const GLint x[], const GLint y[],
                                  GLubyte red[], GLubyte green[],
                                  GLubyte blue[], GLubyte alpha[],
                                  const GLubyte mask[] );






extern void gl_mask_index_span( GLcontext *ctx,
                                GLuint n, GLint x, GLint y, GLuint index[] );






extern void gl_mask_index_pixels( GLcontext *ctx,
                                  GLuint n, const GLint x[], const GLint y[],
                                  GLuint index[], const GLubyte mask[] );
# 92 "dlist.c" 2
# 1 "matrix.h" 1
# 40 "matrix.h"
extern void gl_compute_modelview_inverse( GLcontext *ctx );


extern void gl_rotation_matrix( GLfloat angle, GLfloat x, GLfloat y, GLfloat z,
                                GLfloat m[] );



extern void gl_Frustum( GLcontext *ctx,
                        GLdouble left, GLdouble right,
                        GLdouble bottom, GLdouble top,
                        GLdouble nearval, GLdouble farval );

extern void gl_PushMatrix( GLcontext *ctx );

extern void gl_PopMatrix( GLcontext *ctx );

extern void gl_LoadMatrixf( GLcontext *ctx, const GLfloat *m );

extern void gl_MatrixMode( GLcontext *ctx, GLenum mode );

extern void gl_MultMatrixf( GLcontext *ctx, const GLfloat *m );

extern void gl_Viewport( GLcontext *ctx,
                         GLint x, GLint y, GLsizei width, GLsizei height );

extern void gl_Rotatef( GLcontext *ctx,
                        GLfloat angle, GLfloat x, GLfloat y, GLfloat z );

extern void gl_Scalef( GLcontext *ctx, GLfloat x, GLfloat y, GLfloat z );

extern void gl_Translatef( GLcontext *ctx, GLfloat x, GLfloat y, GLfloat z );
# 93 "dlist.c" 2
# 1 "misc.h" 1
# 42 "misc.h"
extern void gl_ClearIndex( GLcontext *ctx, GLfloat c );

extern void gl_ClearColor( GLcontext *ctx, GLclampf red, GLclampf green,
                           GLclampf blue, GLclampf alpha );

extern void gl_Clear( GLcontext *ctx, GLbitfield mask );


extern const GLubyte *gl_GetString( GLcontext *ctx, GLenum name );

extern void gl_Finish( GLcontext *ctx );

extern void gl_Flush( GLcontext *ctx );

extern void gl_Hint( GLcontext *ctx, GLenum target, GLenum mode );

extern void gl_DrawBuffer( GLcontext *ctx, GLenum mode );

extern void gl_ReadBuffer( GLcontext *ctx, GLenum mode );

extern void gl_Rectf( GLcontext *ctx,
                      GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2 );
# 94 "dlist.c" 2
# 1 "pixel.h" 1
# 39 "pixel.h"
extern void gl_GetPixelMapfv( GLcontext *ctx, GLenum map, GLfloat *values );

extern void gl_GetPixelMapuiv( GLcontext *ctx, GLenum map, GLuint *values );

extern void gl_GetPixelMapusv( GLcontext *ctx, GLenum map, GLushort *values );


extern void gl_PixelMapfv( GLcontext *ctx,
                           GLenum map, GLint mapsize, const GLfloat *values );

extern void gl_PixelStorei( GLcontext *ctx, GLenum pname, GLint param );

extern void gl_PixelTransferf( GLcontext *ctx, GLenum pname, GLfloat param );

extern void gl_PixelZoom( GLcontext *ctx, GLfloat xfactor, GLfloat yfactor );


extern GLvoid *gl_unpack_pixels( GLcontext *ctx,
                                 GLsizei width, GLsizei height,
                                 GLenum format, GLenum type,
                                 const GLvoid *pixels );


extern void
gl_write_zoomed_color_span( GLcontext *ctx,
                            GLuint n, GLint x, GLint y, const GLdepth z[],
                            const GLubyte red[], const GLubyte green[],
                            const GLubyte blue[], const GLubyte alpha[],
                            GLint y0 );


extern void
gl_write_zoomed_index_span( GLcontext *ctx,
                            GLuint n, GLint x, GLint y, const GLdepth z[],
                            const GLuint indexes[], GLint y0 );


extern void
gl_write_zoomed_stencil_span( GLcontext *ctx,
                              GLuint n, GLint x, GLint y,
                              const GLubyte stencil[], GLint y0 );
# 95 "dlist.c" 2
# 1 "points.h" 1
# 39 "points.h"
extern void gl_PointSize( GLcontext *ctx, GLfloat size );

extern void gl_set_point_function( GLcontext *ctx );
# 96 "dlist.c" 2
# 1 "polygon.h" 1
# 39 "polygon.h"
extern void gl_CullFace( GLcontext *ctx, GLenum mode );

extern void gl_FrontFace( GLcontext *ctx, GLenum mode );

extern void gl_PolygonMode( GLcontext *ctx, GLenum face, GLenum mode );

extern void gl_PolygonOffset( GLcontext *ctx,
                              GLfloat factor, GLfloat units );

extern void gl_PolygonStipple( GLcontext *ctx, const GLubyte *mask );

extern void gl_GetPolygonStipple( GLcontext *ctx, GLubyte *mask );
# 97 "dlist.c" 2
# 1 "scissor.h" 1
# 39 "scissor.h"
extern void gl_Scissor( GLcontext *ctx,
                        GLint x, GLint y, GLsizei width, GLsizei height );


extern GLint gl_scissor_span( GLcontext *ctx,
                              GLuint n, GLint x, GLint y, GLubyte mask[] );


extern GLuint gl_scissor_pixels( GLcontext *ctx,
                                 GLuint n, const GLint x[], const GLint y[],
                                 GLubyte mask[] );
# 98 "dlist.c" 2
# 1 "stencil.h" 1
# 39 "stencil.h"
extern void gl_ClearStencil( GLcontext *ctx, GLint s );


extern void gl_StencilFunc( GLcontext *ctx, GLenum func,
                            GLint ref, GLuint mask );


extern void gl_StencilMask( GLcontext *ctx, GLuint mask );


extern void gl_StencilOp( GLcontext *ctx, GLenum fail,
                          GLenum zfail, GLenum zpass );



extern GLint gl_stencil_span( GLcontext *ctx,
                              GLuint n, GLint x, GLint y, GLubyte mask[] );


extern void gl_depth_stencil_span( GLcontext *ctx, GLuint n, GLint x, GLint y,
       const GLdepth z[], GLubyte mask[] );


extern GLint gl_stencil_pixels( GLcontext *ctx,
                                GLuint n, const GLint x[], const GLint y[],
           GLubyte mask[] );


extern void gl_depth_stencil_pixels( GLcontext *ctx,
                                     GLuint n, const GLint x[],
         const GLint y[], const GLdepth z[],
         GLubyte mask[] );


extern void gl_read_stencil_span( GLcontext *ctx,
                                  GLuint n, GLint x, GLint y,
      GLubyte stencil[] );


extern void gl_write_stencil_span( GLcontext *ctx,
                                   GLuint n, GLint x, GLint y,
       const GLubyte stencil[] );


extern void gl_alloc_stencil_buffer( GLcontext *ctx );


extern void gl_clear_stencil_buffer( GLcontext *ctx );
# 99 "dlist.c" 2
# 1 "texobj.h" 1
# 40 "texobj.h"
extern struct gl_texture_object *gl_alloc_texture_object( void );


extern void gl_free_texture_object( struct gl_texture_object *t );



extern void gl_GenTextures( GLcontext *ctx, GLsizei n, GLuint *textures );


extern void gl_DeleteTextures( GLcontext *ctx,
                               GLsizei n, const GLuint *textures);


extern void gl_BindTexture( GLcontext *ctx, GLenum target, GLuint texture );


extern void gl_PrioritizeTextures( GLcontext *ctx,
                                   GLsizei n, const GLuint *textures,
                                   const GLclampf *priorities );


extern GLboolean gl_AreTexturesResident( GLcontext *ctx, GLsizei n,
                                         const GLuint *textures,
                                         GLboolean *residences );


extern GLboolean gl_IsTexture( GLcontext *ctx, GLuint texture );
# 100 "dlist.c" 2
# 1 "teximage.h" 1
# 48 "teximage.h"
extern struct gl_texture_image *gl_alloc_texture_image( void );


extern void gl_free_texture_image( struct gl_texture_image *teximage );


extern struct gl_image *
gl_unpack_texsubimage( GLcontext *ctx, GLint width, GLint height,
                       GLenum format, GLenum type, const GLvoid *pixels );


extern struct gl_image *
gl_unpack_texsubimage3D( GLcontext *ctx, GLint width, GLint height,GLint depth,
                         GLenum format, GLenum type, const GLvoid *pixels );


extern struct gl_texture_image *
gl_unpack_texture( GLcontext *ctx,
                   GLint dimensions,
                   GLenum target,
                   GLint level,
                   GLint internalformat,
                   GLsizei width, GLsizei height,
                   GLint border,
                   GLenum format, GLenum type,
                   const GLvoid *pixels );

extern struct gl_texture_image *
gl_unpack_texture3D( GLcontext *ctx,
                     GLint dimensions,
                     GLenum target,
                     GLint level,
                     GLint internalformat,
                     GLsizei width, GLsizei height, GLsizei depth,
                     GLint border,
                     GLenum format, GLenum type,
                     const GLvoid *pixels );


extern void gl_tex_image_1D( GLcontext *ctx,
                             GLenum target, GLint level, GLint internalformat,
                             GLsizei width, GLint border, GLenum format,
                             GLenum type, const GLvoid *pixels );


extern void gl_tex_image_2D( GLcontext *ctx,
                             GLenum target, GLint level, GLint internalformat,
                             GLsizei width, GLint height, GLint border,
                             GLenum format, GLenum type,
                             const GLvoid *pixels );

extern void gl_tex_image_3D( GLcontext *ctx,
                             GLenum target, GLint level, GLint internalformat,
                             GLsizei width, GLint height, GLint depth,
                             GLint border,
                             GLenum format, GLenum type,
                             const GLvoid *pixels );





extern void gl_TexImage1D( GLcontext *ctx,
                           GLenum target, GLint level, GLint internalformat,
                           GLsizei width, GLint border, GLenum format,
                           GLenum type, struct gl_image *teximage );


extern void gl_TexImage2D( GLcontext *ctx,
                           GLenum target, GLint level, GLint internalformat,
                           GLsizei width, GLsizei height, GLint border,
                           GLenum format, GLenum type,
                           struct gl_image *teximage );


extern void gl_TexImage3DEXT( GLcontext *ctx,
                              GLenum target, GLint level, GLint internalformat,
                              GLsizei width, GLsizei height, GLsizei depth,
                              GLint border,
                              GLenum format, GLenum type,
                              struct gl_image *teximage );


extern void gl_GetTexImage( GLcontext *ctx, GLenum target, GLint level,
                            GLenum format, GLenum type, GLvoid *pixels );



extern void gl_TexSubImage1D( GLcontext *ctx,
                              GLenum target, GLint level, GLint xoffset,
                              GLsizei width, GLenum format, GLenum type,
                              struct gl_image *image );


extern void gl_TexSubImage2D( GLcontext *ctx,
                              GLenum target, GLint level,
                              GLint xoffset, GLint yoffset,
                              GLsizei width, GLsizei height,
                              GLenum format, GLenum type,
                              struct gl_image *image );


extern void gl_TexSubImage3DEXT( GLcontext *ctx,
                                 GLenum target, GLint level,
                                 GLint xoffset, GLint yoffset, GLint zoffset,
                                 GLsizei width, GLsizei height, GLsizei depth,
                                 GLenum format, GLenum type,
                                 struct gl_image *image );


extern void gl_CopyTexImage1D( GLcontext *ctx,
                               GLenum target, GLint level,
                               GLenum internalformat,
                               GLint x, GLint y,
                               GLsizei width, GLint border );


extern void gl_CopyTexImage2D( GLcontext *ctx,
                               GLenum target, GLint level,
                               GLenum internalformat, GLint x, GLint y,
                               GLsizei width, GLsizei height,
                               GLint border );


extern void gl_CopyTexSubImage1D( GLcontext *ctx,
                                  GLenum target, GLint level,
                                  GLint xoffset, GLint x, GLint y,
                                  GLsizei width );


extern void gl_CopyTexSubImage2D( GLcontext *ctx,
                                  GLenum target, GLint level,
                                  GLint xoffset, GLint yoffset,
                                  GLint x, GLint y,
                                  GLsizei width, GLsizei height );


extern void gl_CopyTexSubImage3DEXT( GLcontext *ctx,
                                     GLenum target, GLint level,
                                     GLint xoffset, GLint yoffset,
                                     GLint zoffset,
                                     GLint x, GLint y,
                                     GLsizei width, GLsizei height );
# 101 "dlist.c" 2
# 1 "texture.h" 1
# 53 "texture.h"
extern void gl_GetTexEnvfv( GLcontext *ctx,
                            GLenum target, GLenum pname, GLfloat *params );

extern void gl_GetTexEnviv( GLcontext *ctx,
                            GLenum target, GLenum pname, GLint *params );

extern void gl_GetTexGendv( GLcontext *ctx,
                            GLenum coord, GLenum pname, GLdouble *params );

extern void gl_GetTexGenfv( GLcontext *ctx,
                            GLenum coord, GLenum pname, GLfloat *params );

extern void gl_GetTexGeniv( GLcontext *ctx,
                            GLenum coord, GLenum pname, GLint *params );

extern void gl_GetTexLevelParameterfv( GLcontext *ctx,
                                       GLenum target, GLint level,
                                       GLenum pname, GLfloat *params );

extern void gl_GetTexLevelParameteriv( GLcontext *ctx,
                                       GLenum target, GLint level,
                                       GLenum pname, GLint *params );

extern void gl_GetTexParameterfv( GLcontext *ctx, GLenum target,
                                  GLenum pname, GLfloat *params );

extern void gl_GetTexParameteriv( GLcontext *ctx,
                                  GLenum target, GLenum pname, GLint *params );


extern void gl_TexEnvfv( GLcontext *ctx,
                         GLenum target, GLenum pname, const GLfloat *param );


extern void gl_TexParameterfv( GLcontext *ctx, GLenum target, GLenum pname,
                               const GLfloat *params );


extern void gl_TexGenfv( GLcontext *ctx,
                         GLenum coord, GLenum pname, const GLfloat *params );






extern void gl_texgen( GLcontext *ctx, GLint n,
                       GLfloat obj[][4], GLfloat eye[][4],
                       GLfloat normal[][3], GLfloat texcoord[][4] );


extern void gl_texture_pixels_1d( GLcontext *ctx,
                                  GLuint n,
                                  GLfloat s[], GLfloat lambda[],
      GLubyte red[], GLubyte green[],
      GLubyte blue[], GLubyte alpha[] );


extern void gl_texture_pixels_2d( GLcontext *ctx,
                                  GLuint n,
                                  GLfloat s[], GLfloat t[], GLfloat lambda[],
      GLubyte red[], GLubyte green[],
      GLubyte blue[], GLubyte alpha[] );


extern void gl_texture_pixels_3d( GLcontext *ctx,
                                  GLuint n,
                                  GLfloat s[], GLfloat t[],
                                  GLfloat r[], GLfloat lambda[],
                                  GLubyte red[], GLubyte green[],
                                  GLubyte blue[], GLubyte alpha[] );


extern void gl_update_texture_state( GLcontext *ctx );


extern GLboolean gl_texturing_enabled( GLcontext *ctx );
# 102 "dlist.c" 2

# 1 "vb.h" 1
# 63 "vb.h"
struct vertex_buffer {
        GLfloat Obj[(480 + 2 * (6 + 6))][4];
 GLfloat Eye[(480 + 2 * (6 + 6))][4];
 GLfloat Clip[(480 + 2 * (6 + 6))][4];
 GLfloat Win[(480 + 2 * (6 + 6))][3];





        GLfloat Normal[(480 + 2 * (6 + 6))][3];





 GLfixed Fcolor[(480 + 2 * (6 + 6))][4];
 GLfixed Bcolor[(480 + 2 * (6 + 6))][4];
 GLfixed (*Color)[4];

 GLuint Findex[(480 + 2 * (6 + 6))];
 GLuint Bindex[(480 + 2 * (6 + 6))];
 GLuint *Index;

 GLboolean Edgeflag[(480 + 2 * (6 + 6))];

        GLfloat TexCoord[(480 + 2 * (6 + 6))][4];

        GLubyte Unclipped[(480 + 2 * (6 + 6))];
        GLboolean AnyClipped;

 GLuint Start;
 GLuint Count;
 GLuint Free;


 GLboolean MaterialChanges;
        GLuint MaterialMask[(480 + 2 * (6 + 6))];
 struct gl_material Material[(480 + 2 * (6 + 6))][2];

        GLboolean MonoColor;
};



extern void gl_init_vb( struct vertex_buffer* VB );
# 104 "dlist.c" 2
# 1 "vertex.h" 1
# 39 "vertex.h"
extern void gl_Normal3f( GLcontext *ctx, GLfloat nx, GLfloat ny, GLfloat nz );

extern void gl_Normal3fv( GLcontext *ctx, const GLfloat *normal );

extern void gl_Indexf( GLcontext *ctx, GLfloat c );

extern void gl_Indexi( GLcontext *ctx, GLint c );

extern void gl_Color4f( GLcontext *ctx,
                        GLfloat red, GLfloat green,
                        GLfloat blue, GLfloat alpha );

extern void gl_ColorMat4f( GLcontext *ctx,
                           GLfloat red, GLfloat green,
                           GLfloat blue, GLfloat alpha );


extern void gl_Color4ub( GLcontext *ctx,
                         GLubyte red, GLubyte green,
                         GLubyte blue, GLubyte alpha );

extern void gl_Color4ub8bit( GLcontext *ctx,
                             GLubyte red, GLubyte green,
                             GLubyte blue, GLubyte alpha );

extern void gl_ColorMat4ub( GLcontext *ctx,
                            GLubyte red, GLubyte green,
                            GLubyte blue, GLubyte alpha );


extern void gl_TexCoord4f( GLcontext *ctx,
                           GLfloat s, GLfloat t, GLfloat r, GLfloat q );


extern void gl_EdgeFlag( GLcontext *ctx, GLboolean flag );
# 105 "dlist.c" 2
# 1 "winpos.h" 1
# 70 "winpos.h"
extern void gl_WindowPos4fMESA( GLcontext *ctx,
                                GLfloat x, GLfloat y, GLfloat z, GLfloat w );
# 106 "dlist.c" 2
# 157 "dlist.c"
typedef enum {
 OPCODE_ACCUM,
 OPCODE_ALPHA_FUNC,
        OPCODE_BEGIN,
        OPCODE_BIND_TEXTURE,
 OPCODE_BITMAP,
 OPCODE_BLEND_COLOR,
 OPCODE_BLEND_EQUATION,
 OPCODE_BLEND_FUNC,
        OPCODE_CALL_LIST,
        OPCODE_CALL_LIST_OFFSET,
 OPCODE_CLEAR,
 OPCODE_CLEAR_ACCUM,
 OPCODE_CLEAR_COLOR,
 OPCODE_CLEAR_DEPTH,
 OPCODE_CLEAR_INDEX,
 OPCODE_CLEAR_STENCIL,
        OPCODE_CLIP_PLANE,
 OPCODE_COLOR_4F,
 OPCODE_COLOR_4UB,
 OPCODE_COLOR_MASK,
 OPCODE_COLOR_MATERIAL,
 OPCODE_COPY_PIXELS,
        OPCODE_COPY_TEX_IMAGE1D,
        OPCODE_COPY_TEX_IMAGE2D,
        OPCODE_COPY_TEX_IMAGE3D,
        OPCODE_COPY_TEX_SUB_IMAGE1D,
        OPCODE_COPY_TEX_SUB_IMAGE2D,
        OPCODE_COPY_TEX_SUB_IMAGE3D,
 OPCODE_CULL_FACE,
 OPCODE_DEPTH_FUNC,
 OPCODE_DEPTH_MASK,
 OPCODE_DEPTH_RANGE,
 OPCODE_DISABLE,
 OPCODE_DRAW_BUFFER,
 OPCODE_DRAW_PIXELS,
        OPCODE_EDGE_FLAG,
 OPCODE_ENABLE,
        OPCODE_END,
 OPCODE_EVALCOORD1,
 OPCODE_EVALCOORD2,
 OPCODE_EVALMESH1,
 OPCODE_EVALMESH2,
 OPCODE_EVALPOINT1,
 OPCODE_EVALPOINT2,
 OPCODE_FOG,
 OPCODE_FRONT_FACE,
 OPCODE_FRUSTUM,
 OPCODE_HINT,
 OPCODE_INDEX,
 OPCODE_INDEX_MASK,
 OPCODE_INIT_NAMES,
 OPCODE_LIGHT,
 OPCODE_LIGHT_MODEL,
 OPCODE_LINE_STIPPLE,
 OPCODE_LINE_WIDTH,
 OPCODE_LIST_BASE,
 OPCODE_LOAD_MATRIX,
 OPCODE_LOAD_NAME,
 OPCODE_LOGIC_OP,
 OPCODE_MAP1,
 OPCODE_MAP2,
 OPCODE_MAPGRID1,
 OPCODE_MAPGRID2,
 OPCODE_MATERIAL,
 OPCODE_MATRIX_MODE,
 OPCODE_MULT_MATRIX,
        OPCODE_NORMAL,
 OPCODE_PASSTHROUGH,
 OPCODE_PIXEL_MAP,
 OPCODE_PIXEL_TRANSFER,
 OPCODE_PIXEL_ZOOM,
 OPCODE_POINTSIZE,
 OPCODE_POLYGON_MODE,
        OPCODE_POLYGON_STIPPLE,
 OPCODE_POLYGON_OFFSET,
 OPCODE_POP_ATTRIB,
 OPCODE_POP_MATRIX,
 OPCODE_POP_NAME,
 OPCODE_PRIORITIZE_TEXTURE,
 OPCODE_PUSH_ATTRIB,
 OPCODE_PUSH_MATRIX,
 OPCODE_PUSH_NAME,
 OPCODE_RASTER_POS,
 OPCODE_READ_BUFFER,
        OPCODE_SCALE,
 OPCODE_SCISSOR,
 OPCODE_SHADE_MODEL,
 OPCODE_STENCIL_FUNC,
 OPCODE_STENCIL_MASK,
 OPCODE_STENCIL_OP,
 OPCODE_TEXCOORD,
        OPCODE_TEXENV,
        OPCODE_TEXGEN,
        OPCODE_TEXPARAMETER,
 OPCODE_TEX_IMAGE1D,
 OPCODE_TEX_IMAGE2D,
 OPCODE_TEX_IMAGE3D,
 OPCODE_TEX_SUB_IMAGE1D,
 OPCODE_TEX_SUB_IMAGE2D,
 OPCODE_TEX_SUB_IMAGE3D,
        OPCODE_TRANSLATE,
        OPCODE_VERTEX,
 OPCODE_VIEWPORT,
 OPCODE_WINDOW_POS,

 OPCODE_CONTINUE,
 OPCODE_END_OF_LIST
} OpCode;







typedef union node {
 OpCode opcode;
 GLboolean b;
 GLbitfield bf;
 GLubyte ub;
 GLshort s;
 GLushort us;
 GLint i;
 GLuint ui;
 GLenum e;
 GLfloat f;
 GLvoid *data;
 void *next;
} Node;




static GLuint InstSize[ OPCODE_END_OF_LIST+1 ];



static Node *CurrentListPtr;
static GLuint CurrentListNum;
static Node *CurrentBlock;
static GLuint CurrentPos;
# 314 "dlist.c"
static Node *alloc_instruction( GLcontext *ctx, OpCode opcode, GLint argcount )
{
   Node *n, *newblock;
   GLuint count = InstSize[opcode];

   ((count == argcount+1) ? (void) (0) : __assert_fail ("count == argcount+1", "dlist.c", 319, __PRETTY_FUNCTION__));

   if (CurrentPos + count + 2 > 500) {

      n = CurrentBlock + CurrentPos;
      n[0].opcode = OPCODE_CONTINUE;
      newblock = (Node *) malloc( sizeof(Node) * 500 );
      if (!newblock) {
         gl_error( ctx, GL_OUT_OF_MEMORY, "Building display list" );
         return ((void *)0);
      }
      n[1].next = (Node *) newblock;
      CurrentBlock = newblock;
      CurrentPos = 0;
   }

   n = CurrentBlock + CurrentPos;
   CurrentPos += count;

   n[0].opcode = opcode;

   return n;
}







static Node *make_empty_list( void )
{
   Node *n = (Node *) malloc( sizeof(Node) );
   n[0].opcode = OPCODE_END_OF_LIST;
   return n;
}







static void destroy_list( GLcontext *ctx, GLuint list )
{
   Node *n, *block;
   GLboolean done;

   block = n = ctx->Shared->List[list];

   done = GL_FALSE;
   while (!done) {
      switch (n[0].opcode) {

  case OPCODE_MAP1:
     gl_free_control_points( ctx, n[1].e, (GLfloat *) n[6].data );
     n += InstSize[n[0].opcode];
     break;
  case OPCODE_MAP2:
     gl_free_control_points( ctx, n[1].e, (GLfloat *) n[10].data );
     n += InstSize[n[0].opcode];
     break;
  case OPCODE_DRAW_PIXELS:
     free( n[5].data );
     n += InstSize[n[0].opcode];
     break;
  case OPCODE_BITMAP:
     gl_free_image( (struct gl_image *) n[7].data );
     n += InstSize[n[0].opcode];
     break;
         case OPCODE_POLYGON_STIPPLE:
            free( n[1].data );
     n += InstSize[n[0].opcode];
            break;
  case OPCODE_TEX_IMAGE1D:
            gl_free_image( (struct gl_image *) n[8].data );
            n += InstSize[n[0].opcode];
     break;
  case OPCODE_TEX_IMAGE2D:
            gl_free_image( (struct gl_image *) n[9].data );
            n += InstSize[n[0].opcode];
     break;
         case OPCODE_TEX_SUB_IMAGE1D:
            {
               struct gl_image *image;
               image = (struct gl_image *) n[7].data;
               gl_free_image( image );
            }
            break;
         case OPCODE_TEX_SUB_IMAGE2D:
            {
               struct gl_image *image;
               image = (struct gl_image *) n[9].data;
               gl_free_image( image );
            }
            break;
  case OPCODE_CONTINUE:
     n = (Node *) n[1].next;
     free( block );
     block = n;
     break;
  case OPCODE_END_OF_LIST:
     free( block );
     done = GL_TRUE;
     break;
  default:

     n += InstSize[n[0].opcode];
     break;
      }
   }

   ctx->Shared->List[list] = ((void *)0);
}






static GLuint translate_id( GLsizei n, GLenum type, const GLvoid *list )
{
   GLbyte *bptr;
   GLubyte *ubptr;
   GLshort *sptr;
   GLushort *usptr;
   GLint *iptr;
   GLuint *uiptr;
   GLfloat *fptr;

   switch (type) {
      case GL_BYTE:
         bptr = (GLbyte *) list;
         return (GLuint) *(bptr+n);
      case GL_UNSIGNED_BYTE:
         ubptr = (GLubyte *) list;
         return (GLuint) *(ubptr+n);
      case GL_SHORT:
         sptr = (GLshort *) list;
         return (GLuint) *(sptr+n);
      case GL_UNSIGNED_SHORT:
         usptr = (GLushort *) list;
         return (GLuint) *(usptr+n);
      case GL_INT:
         iptr = (GLint *) list;
         return (GLuint) *(iptr+n);
      case GL_UNSIGNED_INT:
         uiptr = (GLuint *) list;
         return (GLuint) *(uiptr+n);
      case GL_FLOAT:
         fptr = (GLfloat *) list;
         return (GLuint) *(fptr+n);
      case GL_2_BYTES:
         ubptr = ((GLubyte *) list) + 2*n;
         return (GLuint) *ubptr * 256 + (GLuint) *(ubptr+1);
      case GL_3_BYTES:
         ubptr = ((GLubyte *) list) + 3*n;
         return (GLuint) *ubptr * 65536
              + (GLuint) *(ubptr+1) * 256
              + (GLuint) *(ubptr+2);
      case GL_4_BYTES:
         ubptr = ((GLubyte *) list) + 4*n;
         return (GLuint) *ubptr * 16777216
              + (GLuint) *(ubptr+1) * 65536
              + (GLuint) *(ubptr+2) * 256
              + (GLuint) *(ubptr+3);
      default:
         return 0;
   }
}
# 497 "dlist.c"
void gl_init_lists( void )
{
   static int init_flag = 0;

   if (init_flag==0) {
      CurrentListPtr = CurrentBlock = ((void *)0);
      CurrentListNum = 0;

      InstSize[OPCODE_ACCUM] = 3;
      InstSize[OPCODE_ALPHA_FUNC] = 3;
      InstSize[OPCODE_BEGIN] = 2;
      InstSize[OPCODE_BIND_TEXTURE] = 3;
      InstSize[OPCODE_BITMAP] = 8;
      InstSize[OPCODE_BLEND_COLOR] = 5;
      InstSize[OPCODE_BLEND_EQUATION] = 2;
      InstSize[OPCODE_BLEND_FUNC] = 3;
      InstSize[OPCODE_CALL_LIST] = 2;
      InstSize[OPCODE_CALL_LIST_OFFSET] = 2;
      InstSize[OPCODE_CLEAR] = 2;
      InstSize[OPCODE_CLEAR_ACCUM] = 5;
      InstSize[OPCODE_CLEAR_COLOR] = 5;
      InstSize[OPCODE_CLEAR_DEPTH] = 2;
      InstSize[OPCODE_CLEAR_INDEX] = 2;
      InstSize[OPCODE_CLEAR_STENCIL] = 2;
      InstSize[OPCODE_CLIP_PLANE] = 6;
      InstSize[OPCODE_COLOR_4F] = 5;
      InstSize[OPCODE_COLOR_4UB] = 5;
      InstSize[OPCODE_COLOR_MASK] = 5;
      InstSize[OPCODE_COLOR_MATERIAL] = 3;
      InstSize[OPCODE_COPY_PIXELS] = 6;
      InstSize[OPCODE_COPY_TEX_IMAGE1D] = 8;
      InstSize[OPCODE_COPY_TEX_IMAGE2D] = 9;
      InstSize[OPCODE_COPY_TEX_SUB_IMAGE1D] = 7;
      InstSize[OPCODE_COPY_TEX_SUB_IMAGE2D] = 9;
      InstSize[OPCODE_COPY_TEX_SUB_IMAGE3D] = 10;
      InstSize[OPCODE_CULL_FACE] = 2;
      InstSize[OPCODE_DEPTH_FUNC] = 2;
      InstSize[OPCODE_DEPTH_MASK] = 2;
      InstSize[OPCODE_DEPTH_RANGE] = 3;
      InstSize[OPCODE_DISABLE] = 2;
      InstSize[OPCODE_DRAW_BUFFER] = 2;
      InstSize[OPCODE_DRAW_PIXELS] = 6;
      InstSize[OPCODE_ENABLE] = 2;
      InstSize[OPCODE_EDGE_FLAG] = 2;
      InstSize[OPCODE_END] = 1;
      InstSize[OPCODE_EVALCOORD1] = 2;
      InstSize[OPCODE_EVALCOORD2] = 3;
      InstSize[OPCODE_EVALMESH1] = 4;
      InstSize[OPCODE_EVALMESH2] = 6;
      InstSize[OPCODE_EVALPOINT1] = 2;
      InstSize[OPCODE_EVALPOINT2] = 3;
      InstSize[OPCODE_FOG] = 6;
      InstSize[OPCODE_FRONT_FACE] = 2;
      InstSize[OPCODE_FRUSTUM] = 7;
      InstSize[OPCODE_HINT] = 3;
      InstSize[OPCODE_INDEX] = 2;
      InstSize[OPCODE_INDEX_MASK] = 2;
      InstSize[OPCODE_INIT_NAMES] = 1;
      InstSize[OPCODE_LIGHT] = 7;
      InstSize[OPCODE_LIGHT_MODEL] = 6;
      InstSize[OPCODE_LINE_STIPPLE] = 3;
      InstSize[OPCODE_LINE_WIDTH] = 2;
      InstSize[OPCODE_LIST_BASE] = 2;
      InstSize[OPCODE_LOAD_MATRIX] = 17;
      InstSize[OPCODE_LOAD_NAME] = 2;
      InstSize[OPCODE_LOGIC_OP] = 2;
      InstSize[OPCODE_MAP1] = 7;
      InstSize[OPCODE_MAP2] = 11;
      InstSize[OPCODE_MAPGRID1] = 4;
      InstSize[OPCODE_MAPGRID2] = 7;
      InstSize[OPCODE_MATERIAL] = 7;
      InstSize[OPCODE_MATRIX_MODE] = 2;
      InstSize[OPCODE_MULT_MATRIX] = 17;
      InstSize[OPCODE_NORMAL] = 4;
      InstSize[OPCODE_PASSTHROUGH] = 2;
      InstSize[OPCODE_PIXEL_MAP] = 4;
      InstSize[OPCODE_PIXEL_TRANSFER] = 3;
      InstSize[OPCODE_PIXEL_ZOOM] = 3;
      InstSize[OPCODE_POINTSIZE] = 2;
      InstSize[OPCODE_POLYGON_MODE] = 3;
      InstSize[OPCODE_POLYGON_STIPPLE] = 2;
      InstSize[OPCODE_POLYGON_OFFSET] = 3;
      InstSize[OPCODE_POP_ATTRIB] = 1;
      InstSize[OPCODE_POP_MATRIX] = 1;
      InstSize[OPCODE_POP_NAME] = 1;
      InstSize[OPCODE_PRIORITIZE_TEXTURE] = 3;
      InstSize[OPCODE_PUSH_ATTRIB] = 2;
      InstSize[OPCODE_PUSH_MATRIX] = 1;
      InstSize[OPCODE_PUSH_NAME] = 2;
      InstSize[OPCODE_RASTER_POS] = 5;
      InstSize[OPCODE_READ_BUFFER] = 2;
      InstSize[OPCODE_SCALE] = 4;
      InstSize[OPCODE_SCISSOR] = 5;
      InstSize[OPCODE_STENCIL_FUNC] = 4;
      InstSize[OPCODE_STENCIL_MASK] = 2;
      InstSize[OPCODE_STENCIL_OP] = 4;
      InstSize[OPCODE_SHADE_MODEL] = 2;
      InstSize[OPCODE_TEXCOORD] = 5;
      InstSize[OPCODE_TEXENV] = 7;
      InstSize[OPCODE_TEXGEN] = 7;
      InstSize[OPCODE_TEXPARAMETER] = 7;
      InstSize[OPCODE_TEX_IMAGE1D] = 9;
      InstSize[OPCODE_TEX_IMAGE2D] = 10;
      InstSize[OPCODE_TEX_IMAGE3D] = 11;
      InstSize[OPCODE_TEX_SUB_IMAGE1D] = 8;
      InstSize[OPCODE_TEX_SUB_IMAGE2D] = 10;
      InstSize[OPCODE_TEX_SUB_IMAGE3D] = 12;
      InstSize[OPCODE_TRANSLATE] = 4;
      InstSize[OPCODE_VERTEX] = 5;
      InstSize[OPCODE_VIEWPORT] = 5;
      InstSize[OPCODE_WINDOW_POS] = 5;
      InstSize[OPCODE_CONTINUE] = 2;
      InstSize[OPCODE_END_OF_LIST] = 1;
   }
   init_flag = 1;
}







GLint gl_list_index( void )
{
   return CurrentListNum;
}
# 632 "dlist.c"
void gl_save_Accum( GLcontext *ctx, GLenum op, GLfloat value )
{
   Node *n = alloc_instruction( ctx, OPCODE_ACCUM, 2 );
   if (n) {
      n[1].e = op;
      n[2].f = value;
   }
   if (ctx->ExecuteFlag) {
      gl_Accum( ctx, op, value );
   }
}


void gl_save_AlphaFunc( GLcontext *ctx, GLenum func, GLclampf ref )
{
   Node *n = alloc_instruction( ctx, OPCODE_ALPHA_FUNC, 2 );
   if (n) {
      n[1].e = func;
      n[2].f = (GLfloat) ref;
   }
   if (ctx->ExecuteFlag) {
      gl_AlphaFunc( ctx, func, ref );
   }
}


void gl_save_Begin( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_BEGIN, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_Begin( ctx, mode );
   }
}


void gl_save_BindTexture( GLcontext *ctx, GLenum target, GLuint texture )
{
   Node *n = alloc_instruction( ctx, OPCODE_BIND_TEXTURE, 2 );
   if (n) {
      n[1].e = target;
      n[2].ui = texture;
   }
   if (ctx->ExecuteFlag) {
      gl_BindTexture( ctx, target, texture );
   }
}


void gl_save_Bitmap( GLcontext *ctx,
                     GLsizei width, GLsizei height,
       GLfloat xorig, GLfloat yorig,
       GLfloat xmove, GLfloat ymove,
       const struct gl_image *bitmap )
{
   Node *n = alloc_instruction( ctx, OPCODE_BITMAP, 7 );
   if (n) {
      n[1].i = (GLint) width;
      n[2].i = (GLint) height;
      n[3].f = xorig;
      n[4].f = yorig;
      n[5].f = xmove;
      n[6].f = ymove;
      n[7].data = (void *) bitmap;
   }
   if (ctx->ExecuteFlag) {
      gl_Bitmap( ctx, width, height,
                    xorig, yorig, xmove, ymove, bitmap );
   }
}


void gl_save_BlendEquation( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_BLEND_EQUATION, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_BlendEquation( ctx, mode );
   }
}


void gl_save_BlendFunc( GLcontext *ctx, GLenum sfactor, GLenum dfactor )
{
   Node *n = alloc_instruction( ctx, OPCODE_BLEND_FUNC, 2 );
   if (n) {
      n[1].e = sfactor;
      n[2].e = dfactor;
   }
   if (ctx->ExecuteFlag) {
      gl_BlendFunc( ctx, sfactor, dfactor );
   }
}


void gl_save_BlendColor( GLcontext *ctx, GLfloat red, GLfloat green,
                         GLfloat blue, GLfloat alpha )
{
   Node *n = alloc_instruction( ctx, OPCODE_BLEND_COLOR, 4 );
   if (n) {
      n[1].f = red;
      n[2].f = green;
      n[3].f = blue;
      n[4].f = alpha;
   }
   if (ctx->ExecuteFlag) {
      gl_BlendColor( ctx, red, green, blue, alpha );
   }
}


void gl_save_CallList( GLcontext *ctx, GLuint list )
{
   Node *n = alloc_instruction( ctx, OPCODE_CALL_LIST, 1 );
   if (n) {
      n[1].ui = list;
   }
   if (ctx->ExecuteFlag) {
      gl_CallList( ctx, list );
   }
}


void gl_save_CallLists( GLcontext *ctx,
                        GLsizei n, GLenum type, const GLvoid *lists )
{
   GLuint i;

   for (i=0;i<n;i++) {
      GLuint list = translate_id( i, type, lists );
      Node *n = alloc_instruction( ctx, OPCODE_CALL_LIST_OFFSET, 1 );
      if (n) {
         n[1].ui = list;
      }
   }
   if (ctx->ExecuteFlag) {
      gl_CallLists( ctx, n, type, lists );
   }
}


void gl_save_Clear( GLcontext *ctx, GLbitfield mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLEAR, 1 );
   if (n) {
      n[1].bf = mask;
   }
   if (ctx->ExecuteFlag) {
      gl_Clear( ctx, mask );
   }
}


void gl_save_ClearAccum( GLcontext *ctx, GLfloat red, GLfloat green,
    GLfloat blue, GLfloat alpha )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLEAR_ACCUM, 4 );
   if (n) {
      n[1].f = red;
      n[2].f = green;
      n[3].f = blue;
      n[4].f = alpha;
   }
   if (ctx->ExecuteFlag) {
      gl_ClearAccum( ctx, red, green, blue, alpha );
   }
}


void gl_save_ClearColor( GLcontext *ctx, GLclampf red, GLclampf green,
    GLclampf blue, GLclampf alpha )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLEAR_COLOR, 4 );
   if (n) {
      n[1].f = red;
      n[2].f = green;
      n[3].f = blue;
      n[4].f = alpha;
   }
   if (ctx->ExecuteFlag) {
      gl_ClearColor( ctx, red, green, blue, alpha );
   }
}


void gl_save_ClearDepth( GLcontext *ctx, GLclampd depth )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLEAR_DEPTH, 1 );
   if (n) {
      n[1].f = (GLfloat) depth;
   }
   if (ctx->ExecuteFlag) {
      gl_ClearDepth( ctx, depth );
   }
}


void gl_save_ClearIndex( GLcontext *ctx, GLfloat c )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLEAR_INDEX, 1 );
   if (n) {
      n[1].f = c;
   }
   if (ctx->ExecuteFlag) {
      gl_ClearIndex( ctx, c );
   }
}


void gl_save_ClearStencil( GLcontext *ctx, GLint s )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLEAR_STENCIL, 1 );
   if (n) {
      n[1].i = s;
   }
   if (ctx->ExecuteFlag) {
      gl_ClearStencil( ctx, s );
   }
}


void gl_save_ClipPlane( GLcontext *ctx, GLenum plane, const GLfloat *equ )
{
   Node *n = alloc_instruction( ctx, OPCODE_CLIP_PLANE, 5 );
   if (n) {
      n[1].e = plane;
      n[2].f = equ[0];
      n[3].f = equ[1];
      n[4].f = equ[2];
      n[5].f = equ[3];
   }
   if (ctx->ExecuteFlag) {
      gl_ClipPlane( ctx, plane, equ );
   }
}


void gl_save_Color4f( GLcontext *ctx, GLfloat r, GLfloat g,
                                      GLfloat b, GLfloat a )
{
   Node *n = alloc_instruction( ctx, OPCODE_COLOR_4F, 4 );
   if (n) {
      n[1].f = r;
      n[2].f = g;
      n[3].f = b;
      n[4].f = a;
   }
   if (ctx->ExecuteFlag) {
      gl_Color4f( ctx, r, g, b, a );
   }
}


void gl_save_Color4ub( GLcontext *ctx, GLubyte r, GLubyte g,
                                       GLubyte b, GLubyte a )
{
   Node *n = alloc_instruction( ctx, OPCODE_COLOR_4UB, 4 );
   if (n) {
      n[1].ub = r;
      n[2].ub = g;
      n[3].ub = b;
      n[4].ub = a;
   }
   if (ctx->ExecuteFlag) {
      gl_Color4ub( ctx, r, g, b, a );
   }
}


void gl_save_ColorMask( GLcontext *ctx, GLboolean red, GLboolean green,
                        GLboolean blue, GLboolean alpha )
{
   Node *n = alloc_instruction( ctx, OPCODE_COLOR_MASK, 4 );
   if (n) {
      n[1].b = red;
      n[2].b = green;
      n[3].b = blue;
      n[4].b = alpha;
   }
   if (ctx->ExecuteFlag) {
      gl_ColorMask( ctx, red, green, blue, alpha );
   }
}


void gl_save_ColorMaterial( GLcontext *ctx, GLenum face, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_COLOR_MATERIAL, 2 );
   if (n) {
      n[1].e = face;
      n[2].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_ColorMaterial( ctx, face, mode );
   }
}


void gl_save_CopyPixels( GLcontext *ctx, GLint x, GLint y,
    GLsizei width, GLsizei height, GLenum type )
{
   Node *n = alloc_instruction( ctx, OPCODE_COPY_PIXELS, 5 );
   if (n) {
      n[1].i = x;
      n[2].i = y;
      n[3].i = (GLint) width;
      n[4].i = (GLint) height;
      n[5].e = type;
   }
   if (ctx->ExecuteFlag) {
      gl_CopyPixels( ctx, x, y, width, height, type );
   }
}



void gl_save_CopyTexImage1D( GLcontext *ctx,
                             GLenum target, GLint level,
                             GLenum internalformat,
                             GLint x, GLint y, GLsizei width,
                             GLint border )
{
   Node *n = alloc_instruction( ctx, OPCODE_COPY_TEX_IMAGE1D, 7 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].e = internalformat;
      n[4].i = x;
      n[5].i = y;
      n[6].i = width;
      n[7].i = border;
   }
   if (ctx->ExecuteFlag) {
      gl_CopyTexImage1D( ctx, target, level, internalformat,
                            x, y, width, border );
   }
}


void gl_save_CopyTexImage2D( GLcontext *ctx,
                             GLenum target, GLint level,
                             GLenum internalformat,
                             GLint x, GLint y, GLsizei width,
                             GLsizei height, GLint border )
{
   Node *n = alloc_instruction( ctx, OPCODE_COPY_TEX_IMAGE2D, 8 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].e = internalformat;
      n[4].i = x;
      n[5].i = y;
      n[6].i = width;
      n[7].i = height;
      n[8].i = border;
   }
   if (ctx->ExecuteFlag) {
      gl_CopyTexImage2D( ctx, target, level, internalformat,
                            x, y, width, height, border );
   }
}



void gl_save_CopyTexSubImage1D( GLcontext *ctx,
                                GLenum target, GLint level,
                                GLint xoffset, GLint x, GLint y,
                                GLsizei width )
{
   Node *n = alloc_instruction( ctx, OPCODE_COPY_TEX_SUB_IMAGE1D, 6 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = xoffset;
      n[4].i = x;
      n[5].i = y;
      n[6].i = width;
   }
   if (ctx->ExecuteFlag) {
      gl_CopyTexSubImage1D( ctx, target, level, xoffset, x, y, width );
   }
}


void gl_save_CopyTexSubImage2D( GLcontext *ctx,
                                GLenum target, GLint level,
                                GLint xoffset, GLint yoffset,
                                GLint x, GLint y,
                                GLsizei width, GLint height )
{
   Node *n = alloc_instruction( ctx, OPCODE_COPY_TEX_SUB_IMAGE2D, 8 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = xoffset;
      n[4].i = yoffset;
      n[5].i = x;
      n[6].i = y;
      n[7].i = width;
      n[8].i = height;
   }
   if (ctx->ExecuteFlag) {
      gl_CopyTexSubImage2D( ctx, target, level, xoffset, yoffset,
                               x, y, width, height );
   }
}


void gl_save_CopyTexSubImage3DEXT( GLcontext *ctx,
                                   GLenum target, GLint level,
                                   GLint xoffset, GLint yoffset, GLint zoffset,
                                   GLint x, GLint y,
                                   GLsizei width, GLint height )
{
   Node *n = alloc_instruction( ctx, OPCODE_COPY_TEX_SUB_IMAGE3D, 9 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = xoffset;
      n[4].i = yoffset;
      n[5].i = zoffset;
      n[6].i = x;
      n[7].i = y;
      n[8].i = width;
      n[9].i = height;
   }
   if (ctx->ExecuteFlag) {
      gl_CopyTexSubImage3DEXT( ctx, target, level, xoffset, yoffset, zoffset,
                               x, y, width, height );
   }
}


void gl_save_CullFace( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_CULL_FACE, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_CullFace( ctx, mode );
   }
}


void gl_save_DepthFunc( GLcontext *ctx, GLenum func )
{
   Node *n = alloc_instruction( ctx, OPCODE_DEPTH_FUNC, 1 );
   if (n) {
      n[1].e = func;
   }
   if (ctx->ExecuteFlag) {
      gl_DepthFunc( ctx, func );
   }
}


void gl_save_DepthMask( GLcontext *ctx, GLboolean mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_DEPTH_MASK, 1 );
   if (n) {
      n[1].b = mask;
   }
   if (ctx->ExecuteFlag) {
      gl_DepthMask( ctx, mask );
   }
}


void gl_save_DepthRange( GLcontext *ctx, GLclampd nearval, GLclampd farval )
{
   Node *n = alloc_instruction( ctx, OPCODE_DEPTH_RANGE, 2 );
   if (n) {
      n[1].f = (GLfloat) nearval;
      n[2].f = (GLfloat) farval;
   }
   if (ctx->ExecuteFlag) {
      gl_DepthRange( ctx, nearval, farval );
   }
}


void gl_save_Disable( GLcontext *ctx, GLenum cap )
{
   Node *n = alloc_instruction( ctx, OPCODE_DISABLE, 1 );
   if (n) {
      n[1].e = cap;
   }
   if (ctx->ExecuteFlag) {
      gl_Disable( ctx, cap );
   }
}


void gl_save_DrawBuffer( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_DRAW_BUFFER, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_DrawBuffer( ctx, mode );
   }
}


void gl_save_DrawPixels( GLcontext *ctx, GLsizei width, GLsizei height,
                         GLenum format, GLenum type, const GLvoid *pixels )
{
   Node *n = alloc_instruction( ctx, OPCODE_DRAW_PIXELS, 5 );
   if (n) {
      n[1].i = (GLint) width;
      n[2].i = (GLint) height;
      n[3].e = format;
      n[4].e = type;
      n[5].data = (GLvoid *) pixels;
   }
   if (ctx->ExecuteFlag) {
      gl_DrawPixels( ctx, width, height, format, type, pixels );
   }
}


void gl_save_EdgeFlag( GLcontext *ctx, GLboolean flag )
{
   Node *n = alloc_instruction( ctx, OPCODE_EDGE_FLAG, 1 );
   if (n) {
      n[1].b = flag;
   }
   if (ctx->ExecuteFlag) {
      gl_EdgeFlag( ctx, flag );
   }
}


void gl_save_Enable( GLcontext *ctx, GLenum cap )
{
   Node *n = alloc_instruction( ctx, OPCODE_ENABLE, 1 );
   if (n) {
      n[1].e = cap;
   }
   if (ctx->ExecuteFlag) {
      gl_Enable( ctx, cap );
   }
}


void gl_save_End( GLcontext *ctx )
{
   (void) alloc_instruction( ctx, OPCODE_END, 0 );
   if (ctx->ExecuteFlag) {
      gl_End( ctx );
   }
}


void gl_save_EvalCoord1f( GLcontext *ctx, GLfloat u )
{
   Node *n = alloc_instruction( ctx, OPCODE_EVALCOORD1, 1 );
   if (n) {
      n[1].f = u;
   }
   if (ctx->ExecuteFlag) {
      gl_EvalCoord1f( ctx, u );
   }
}


void gl_save_EvalCoord2f( GLcontext *ctx, GLfloat u, GLfloat v )
{
   Node *n = alloc_instruction( ctx, OPCODE_EVALCOORD2, 2 );
   if (n) {
      n[1].f = u;
      n[2].f = v;
   }
   if (ctx->ExecuteFlag) {
      gl_EvalCoord2f( ctx, u, v );
   }
}


void gl_save_EvalMesh1( GLcontext *ctx,
                        GLenum mode, GLint i1, GLint i2 )
{
   Node *n = alloc_instruction( ctx, OPCODE_EVALMESH1, 3 );
   if (n) {
      n[1].e = mode;
      n[2].i = i1;
      n[3].i = i2;
   }
   if (ctx->ExecuteFlag) {
      gl_EvalMesh1( ctx, mode, i1, i2 );
   }
}


void gl_save_EvalMesh2( GLcontext *ctx,
                        GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2 )
{
   Node *n = alloc_instruction( ctx, OPCODE_EVALMESH2, 5 );
   if (n) {
      n[1].e = mode;
      n[2].i = i1;
      n[3].i = i2;
      n[4].i = j1;
      n[5].i = j2;
   }
   if (ctx->ExecuteFlag) {
      gl_EvalMesh2( ctx, mode, i1, i2, j1, j2 );
   }
}


void gl_save_EvalPoint1( GLcontext *ctx, GLint i )
{
   Node *n = alloc_instruction( ctx, OPCODE_EVALPOINT1, 1 );
   if (n) {
      n[1].i = i;
   }
   if (ctx->ExecuteFlag) {
      gl_EvalPoint1( ctx, i );
   }
}


void gl_save_EvalPoint2( GLcontext *ctx, GLint i, GLint j )
{
   Node *n = alloc_instruction( ctx, OPCODE_EVALPOINT2, 2 );
   if (n) {
      n[1].i = i;
      n[2].i = j;
   }
   if (ctx->ExecuteFlag) {
      gl_EvalPoint2( ctx, i, j );
   }
}


void gl_save_Fogfv( GLcontext *ctx, GLenum pname, const GLfloat *params )
{
   Node *n = alloc_instruction( ctx, OPCODE_FOG, 5 );
   if (n) {
      n[1].e = pname;
      n[2].f = params[0];
      n[3].f = params[1];
      n[4].f = params[2];
      n[5].f = params[3];
   }
   if (ctx->ExecuteFlag) {
      gl_Fogfv( ctx, pname, params );
   }
}


void gl_save_FrontFace( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_FRONT_FACE, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_FrontFace( ctx, mode );
   }
}


void gl_save_Frustum( GLcontext *ctx, GLdouble left, GLdouble right,
                      GLdouble bottom, GLdouble top,
                      GLdouble nearval, GLdouble farval )
{
   Node *n = alloc_instruction( ctx, OPCODE_FRUSTUM, 6 );
   if (n) {
      n[1].f = left;
      n[2].f = right;
      n[3].f = bottom;
      n[4].f = top;
      n[5].f = nearval;
      n[6].f = farval;
   }
   if (ctx->ExecuteFlag) {
      gl_Frustum( ctx, left, right, bottom, top, nearval, farval );
   }
}


void gl_save_Hint( GLcontext *ctx, GLenum target, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_HINT, 2 );
   if (n) {
      n[1].e = target;
      n[2].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_Hint( ctx, target, mode );
   }
}


void gl_save_Indexi( GLcontext *ctx, GLint index )
{
   Node *n = alloc_instruction( ctx, OPCODE_INDEX, 1 );
   if (n) {
      n[1].i = index;
   }
   if (ctx->ExecuteFlag) {
      gl_Indexi( ctx, index );
   }
}


void gl_save_Indexf( GLcontext *ctx, GLfloat index )
{
   Node *n = alloc_instruction( ctx, OPCODE_INDEX, 1 );
   if (n) {
      n[1].i = (GLint) index;
   }
   if (ctx->ExecuteFlag) {
      gl_Indexf( ctx,index );
   }
}


void gl_save_IndexMask( GLcontext *ctx, GLuint mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_INDEX_MASK, 1 );
   if (n) {
      n[1].ui = mask;
   }
   if (ctx->ExecuteFlag) {
      gl_IndexMask( ctx, mask );
   }
}


void gl_save_InitNames( GLcontext *ctx )
{
   (void) alloc_instruction( ctx, OPCODE_INIT_NAMES, 0 );
   if (ctx->ExecuteFlag) {
      gl_InitNames( ctx );
   }
}


void gl_save_Lightfv( GLcontext *ctx, GLenum light, GLenum pname,
                      const GLfloat *params, GLint numparams )
{
   Node *n = alloc_instruction( ctx, OPCODE_LIGHT, 6 );
   if (OPCODE_LIGHT) {
      GLint i;
      n[1].e = light;
      n[2].e = pname;
      for (i=0;i<numparams;i++) {
  n[3+i].f = params[i];
      }
   }
   if (ctx->ExecuteFlag) {
      gl_Lightfv( ctx, light, pname, params, numparams );
   }
}


void gl_save_LightModelfv( GLcontext *ctx,
                           GLenum pname, const GLfloat *params )
{
   Node *n = alloc_instruction( ctx, OPCODE_LIGHT_MODEL, 5 );
   if (n) {
      n[1].e = pname;
      n[2].f = params[0];
      n[3].f = params[1];
      n[4].f = params[2];
      n[5].f = params[3];
   }
   if (ctx->ExecuteFlag) {
      gl_LightModelfv( ctx, pname, params );
   }
}


void gl_save_LineStipple( GLcontext *ctx, GLint factor, GLushort pattern )
{
   Node *n = alloc_instruction( ctx, OPCODE_LINE_STIPPLE, 2 );
   if (n) {
      n[1].i = factor;
      n[2].us = pattern;
   }
   if (ctx->ExecuteFlag) {
      gl_LineStipple( ctx, factor, pattern );
   }
}


void gl_save_LineWidth( GLcontext *ctx, GLfloat width )
{
   Node *n = alloc_instruction( ctx, OPCODE_LINE_WIDTH, 1 );
   if (n) {
      n[1].f = width;
   }
   if (ctx->ExecuteFlag) {
      gl_LineWidth( ctx, width );
   }
}


void gl_save_ListBase( GLcontext *ctx, GLuint base )
{
   Node *n = alloc_instruction( ctx, OPCODE_LIST_BASE, 1 );
   if (n) {
      n[1].ui = base;
   }
   if (ctx->ExecuteFlag) {
      gl_ListBase( ctx, base );
   }
}


void gl_save_LoadMatrixf( GLcontext *ctx, const GLfloat *m )
{
   Node *n = alloc_instruction( ctx, OPCODE_LOAD_MATRIX, 16 );
   if (n) {
      GLuint i;
      for (i=0;i<16;i++) {
  n[1+i].f = m[i];
      }
   }
   if (ctx->ExecuteFlag) {
      gl_LoadMatrixf( ctx, m );
   }
}


void gl_save_LoadName( GLcontext *ctx, GLuint name )
{
   Node *n = alloc_instruction( ctx, OPCODE_LOAD_NAME, 1 );
   if (n) {
      n[1].ui = name;
   }
   if (ctx->ExecuteFlag) {
      gl_LoadName( ctx, name );
   }
}


void gl_save_LogicOp( GLcontext *ctx, GLenum opcode )
{
   Node *n = alloc_instruction( ctx, OPCODE_LOGIC_OP, 1 );
   if (n) {
      n[1].e = opcode;
   }
   if (ctx->ExecuteFlag) {
      gl_LogicOp( ctx, opcode );
   }
}


void gl_save_Map1f( GLcontext *ctx,
                   GLenum target, GLfloat u1, GLfloat u2, GLint stride,
     GLint order, const GLfloat *points, GLboolean retain )
{
   Node *n = alloc_instruction( ctx, OPCODE_MAP1, 6 );
   if (n) {
      n[1].e = target;
      n[2].f = u1;
      n[3].f = u2;
      n[4].i = stride;
      n[5].i = order;
      n[6].data = (void *) points;
   }
   if (ctx->ExecuteFlag) {
      gl_Map1f( ctx, target, u1, u2, stride, order, points, GL_TRUE );
   }
}


void gl_save_Map2f( GLcontext *ctx, GLenum target,
                    GLfloat u1, GLfloat u2, GLint ustride, GLint uorder,
                    GLfloat v1, GLfloat v2, GLint vstride, GLint vorder,
                    const GLfloat *points, GLboolean retain )
{
   Node *n = alloc_instruction( ctx, OPCODE_MAP2, 10 );
   if (n) {
      n[1].e = target;
      n[2].f = u1;
      n[3].f = u2;
      n[4].f = v1;
      n[5].f = v2;
      n[6].i = ustride;
      n[7].i = vstride;
      n[8].i = uorder;
      n[9].i = vorder;
      n[10].data = (void *) points;
   }
   if (ctx->ExecuteFlag) {
      gl_Map2f( ctx, target,
                        u1, u2, ustride, uorder,
                        v1, v2, vstride, vorder, points, GL_TRUE );
   }
}


void gl_save_MapGrid1f( GLcontext *ctx, GLint un, GLfloat u1, GLfloat u2 )
{
   Node *n = alloc_instruction( ctx, OPCODE_MAPGRID1, 3 );
   if (n) {
      n[1].i = un;
      n[2].f = u1;
      n[3].f = u2;
   }
   if (ctx->ExecuteFlag) {
      gl_MapGrid1f( ctx, un, u1, u2 );
   }
}


void gl_save_MapGrid2f( GLcontext *ctx,
                        GLint un, GLfloat u1, GLfloat u2,
          GLint vn, GLfloat v1, GLfloat v2 )
{
   Node *n = alloc_instruction( ctx, OPCODE_MAPGRID2, 6 );
   if (n) {
      n[1].i = un;
      n[2].f = u1;
      n[3].f = u2;
      n[4].i = vn;
      n[5].f = v1;
      n[6].f = v2;
   }
   if (ctx->ExecuteFlag) {
      gl_MapGrid2f( ctx, un, u1, u2, vn, v1, v2 );
   }
}


void gl_save_Materialfv( GLcontext *ctx,
                         GLenum face, GLenum pname, const GLfloat *params )
{
   Node *n = alloc_instruction( ctx, OPCODE_MATERIAL, 6 );
   if (n) {
      n[1].e = face;
      n[2].e = pname;
      n[3].f = params[0];
      n[4].f = params[1];
      n[5].f = params[2];
      n[6].f = params[3];
   }
   if (ctx->ExecuteFlag) {
      gl_Materialfv( ctx, face, pname, params );
   }
}


void gl_save_MatrixMode( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_MATRIX_MODE, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_MatrixMode( ctx, mode );
   }
}


void gl_save_MultMatrixf( GLcontext *ctx, const GLfloat *m )
{
   Node *n = alloc_instruction( ctx, OPCODE_MULT_MATRIX, 16 );
   if (n) {
      GLuint i;
      for (i=0;i<16;i++) {
  n[1+i].f = m[i];
      }
   }
   if (ctx->ExecuteFlag) {
      gl_MultMatrixf( ctx, m );
   }
}


void gl_save_NewList( GLcontext *ctx, GLuint list, GLenum mode )
{

   gl_error( ctx, GL_INVALID_OPERATION, "glNewList" );
}


void gl_save_Normal3fv( GLcontext *ctx, const GLfloat norm[3] )
{
   Node *n = alloc_instruction( ctx, OPCODE_NORMAL, 3 );
   if (n) {
      n[1].f = norm[0];
      n[2].f = norm[1];
      n[3].f = norm[2];
   }
   if (ctx->ExecuteFlag) {
      gl_Normal3fv( ctx, norm );
   }
}


void gl_save_Normal3f( GLcontext *ctx, GLfloat nx, GLfloat ny, GLfloat nz )
{
   Node *n = alloc_instruction( ctx, OPCODE_NORMAL, 3 );
   if (n) {
      n[1].f = nx;
      n[2].f = ny;
      n[3].f = nz;
   }
   if (ctx->ExecuteFlag) {
      gl_Normal3f( ctx, nx, ny, nz );
   }
}


void gl_save_PixelMapfv( GLcontext *ctx,
                         GLenum map, GLint mapsize, const GLfloat *values )
{
   Node *n = alloc_instruction( ctx, OPCODE_PIXEL_MAP, 3 );
   if (n) {
      n[1].e = map;
      n[2].i = mapsize;
      n[3].data = (void *) malloc( mapsize * sizeof(GLfloat) );
      memcpy( (void *) (n[3].data), (void *) ((void *) values), (size_t) (mapsize * sizeof(GLfloat)) );
   }
   if (ctx->ExecuteFlag) {
      gl_PixelMapfv( ctx, map, mapsize, values );
   }
}


void gl_save_PixelTransferf( GLcontext *ctx, GLenum pname, GLfloat param )
{
   Node *n = alloc_instruction( ctx, OPCODE_PIXEL_TRANSFER, 2 );
   if (n) {
      n[1].e = pname;
      n[2].f = param;
   }
   if (ctx->ExecuteFlag) {
      gl_PixelTransferf( ctx, pname, param );
   }
}


void gl_save_PixelZoom( GLcontext *ctx, GLfloat xfactor, GLfloat yfactor )
{
   Node *n = alloc_instruction( ctx, OPCODE_PIXEL_ZOOM, 2 );
   if (n) {
      n[1].f = xfactor;
      n[2].f = yfactor;
   }
   if (ctx->ExecuteFlag) {
      gl_PixelZoom( ctx, xfactor, yfactor );
   }
}


void gl_save_PointSize( GLcontext *ctx, GLfloat size )
{
   Node *n = alloc_instruction( ctx, OPCODE_POINTSIZE, 1 );
   if (n) {
      n[1].f = size;
   }
   if (ctx->ExecuteFlag) {
      gl_PointSize( ctx, size );
   }
}


void gl_save_PolygonMode( GLcontext *ctx, GLenum face, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_POLYGON_MODE, 2 );
   if (n) {
      n[1].e = face;
      n[2].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_PolygonMode( ctx, face, mode );
   }
}


void gl_save_PolygonStipple( GLcontext *ctx, const GLubyte *mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_POLYGON_STIPPLE, 1 );
   if (n) {
      void *data;
      n[1].data = malloc( 32 * 4 );
      data = n[1].data;
      memcpy( (void *) (data), (void *) (mask), (size_t) (32 * 4) );
   }
   if (ctx->ExecuteFlag) {
      gl_PolygonStipple( ctx, mask );
   }
}


void gl_save_PolygonOffset( GLcontext *ctx, GLfloat factor, GLfloat units )
{
   Node *n = alloc_instruction( ctx, OPCODE_POLYGON_OFFSET, 2 );
   if (n) {
      n[1].f = factor;
      n[2].f = units;
   }
   if (ctx->ExecuteFlag) {
      gl_PolygonOffset( ctx, factor, units );
   }
}


void gl_save_PopAttrib( GLcontext *ctx )
{
   (void) alloc_instruction( ctx, OPCODE_POP_ATTRIB, 0 );
   if (ctx->ExecuteFlag) {
      gl_PopAttrib( ctx );
   }
}


void gl_save_PopMatrix( GLcontext *ctx )
{
   (void) alloc_instruction( ctx, OPCODE_POP_MATRIX, 0 );
   if (ctx->ExecuteFlag) {
      gl_PopMatrix( ctx );
   }
}


void gl_save_PopName( GLcontext *ctx )
{
   (void) alloc_instruction( ctx, OPCODE_POP_NAME, 0 );
   if (ctx->ExecuteFlag) {
      gl_PopName( ctx );
   }
}


void gl_save_PrioritizeTextures( GLcontext *ctx,
                                 GLsizei num, const GLuint *textures,
                                 const GLclampf *priorities )
{
   GLint i;

   for (i=0;i<num;i++) {
      Node *n = alloc_instruction( ctx, OPCODE_PRIORITIZE_TEXTURE, 2 );
      if (n) {
         n[1].ui = textures[i];
         n[2].f = priorities[i];
      }
   }
   if (ctx->ExecuteFlag) {
      gl_PrioritizeTextures( ctx, num, textures, priorities );
   }
}


void gl_save_PushAttrib( GLcontext *ctx, GLbitfield mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_PUSH_ATTRIB, 1 );
   if (n) {
      n[1].bf = mask;
   }
   if (ctx->ExecuteFlag) {
      gl_PushAttrib( ctx, mask );
   }
}


void gl_save_PushMatrix( GLcontext *ctx )
{
   (void) alloc_instruction( ctx, OPCODE_PUSH_MATRIX, 0 );
   if (ctx->ExecuteFlag) {
      gl_PushMatrix( ctx );
   }
}


void gl_save_PushName( GLcontext *ctx, GLuint name )
{
   Node *n = alloc_instruction( ctx, OPCODE_PUSH_NAME, 1 );
   if (n) {
      n[1].ui = name;
   }
   if (ctx->ExecuteFlag) {
      gl_PushName( ctx, name );
   }
}


void gl_save_RasterPos4f( GLcontext *ctx,
                          GLfloat x, GLfloat y, GLfloat z, GLfloat w )
{
   Node *n = alloc_instruction( ctx, OPCODE_RASTER_POS, 4 );
   if (n) {
      n[1].f = x;
      n[2].f = y;
      n[3].f = z;
      n[4].f = w;
   }
   if (ctx->ExecuteFlag) {
      gl_RasterPos4f( ctx, x, y, z, w );
   }
}


void gl_save_PassThrough( GLcontext *ctx, GLfloat token )
{
   Node *n = alloc_instruction( ctx, OPCODE_PASSTHROUGH, 1 );
   if (n) {
      n[1].f = token;
   }
   if (ctx->ExecuteFlag) {
      gl_PassThrough( ctx, token );
   }
}


void gl_save_ReadBuffer( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_READ_BUFFER, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_ReadBuffer( ctx, mode );
   }
}


void gl_save_Rotatef( GLcontext *ctx, GLfloat angle,
                      GLfloat x, GLfloat y, GLfloat z )
{
   GLfloat m[16];
   gl_rotation_matrix( angle, x, y, z, m );
   gl_save_MultMatrixf( ctx, m );
}


void gl_save_Scalef( GLcontext *ctx, GLfloat x, GLfloat y, GLfloat z )
{
   Node *n = alloc_instruction( ctx, OPCODE_SCALE, 3 );
   if (n) {
      n[1].f = x;
      n[2].f = y;
      n[3].f = z;
   }
   if (ctx->ExecuteFlag) {
      gl_Scalef( ctx, x, y, z );
   }
}


void gl_save_Scissor( GLcontext *ctx,
                      GLint x, GLint y, GLsizei width, GLsizei height )
{
   Node *n = alloc_instruction( ctx, OPCODE_SCISSOR, 4 );
   if (n) {
      n[1].i = x;
      n[2].i = y;
      n[3].i = width;
      n[4].i = height;
   }
   if (ctx->ExecuteFlag) {
      gl_Scissor( ctx, x, y, width, height );
   }
}


void gl_save_ShadeModel( GLcontext *ctx, GLenum mode )
{
   Node *n = alloc_instruction( ctx, OPCODE_SHADE_MODEL, 1 );
   if (n) {
      n[1].e = mode;
   }
   if (ctx->ExecuteFlag) {
      gl_ShadeModel( ctx, mode );
   }
}


void gl_save_StencilFunc( GLcontext *ctx, GLenum func, GLint ref, GLuint mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_STENCIL_FUNC, 3 );
   if (n) {
      n[1].e = func;
      n[2].i = ref;
      n[3].ui = mask;
   }
   if (ctx->ExecuteFlag) {
      gl_StencilFunc( ctx, func, ref, mask );
   }
}


void gl_save_StencilMask( GLcontext *ctx, GLuint mask )
{
   Node *n = alloc_instruction( ctx, OPCODE_STENCIL_MASK, 1 );
   if (n) {
      n[1].ui = mask;
   }
   if (ctx->ExecuteFlag) {
      gl_StencilMask( ctx, mask );
   }
}


void gl_save_StencilOp( GLcontext *ctx,
                        GLenum fail, GLenum zfail, GLenum zpass )
{
   Node *n = alloc_instruction( ctx, OPCODE_STENCIL_OP, 3 );
   if (n) {
      n[1].e = fail;
      n[2].e = zfail;
      n[3].e = zpass;
   }
   if (ctx->ExecuteFlag) {
      gl_StencilOp( ctx, fail, zfail, zpass );
   }
}


void gl_save_TexCoord4f( GLcontext *ctx, GLfloat s, GLfloat t,
                                         GLfloat r, GLfloat q )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEXCOORD, 4 );
   if (n) {
      n[1].f = s;
      n[2].f = t;
      n[3].f = r;
      n[4].f = q;
   }
   if (ctx->ExecuteFlag) {
      gl_TexCoord4f( ctx, s, t, r, q );
   }
}


void gl_save_TexEnvfv( GLcontext *ctx,
                       GLenum target, GLenum pname, const GLfloat *params )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEXENV, 6 );
   if (n) {
      n[1].e = target;
      n[2].e = pname;
      n[3].f = params[0];
      n[4].f = params[1];
      n[5].f = params[2];
      n[6].f = params[3];
   }
   if (ctx->ExecuteFlag) {
      gl_TexEnvfv( ctx, target, pname, params );
   }
}


void gl_save_TexGenfv( GLcontext *ctx,
                       GLenum coord, GLenum pname, const GLfloat *params )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEXGEN, 6 );
   if (n) {
      n[1].e = coord;
      n[2].e = pname;
      n[3].f = params[0];
      n[4].f = params[1];
      n[5].f = params[2];
      n[6].f = params[3];
   }
   if (ctx->ExecuteFlag) {
      gl_TexGenfv( ctx, coord, pname, params );
   }
}


void gl_save_TexParameterfv( GLcontext *ctx, GLenum target,
                             GLenum pname, const GLfloat *params )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEXPARAMETER, 6 );
   if (n) {
      n[1].e = target;
      n[2].e = pname;
      n[3].f = params[0];
      n[4].f = params[1];
      n[5].f = params[2];
      n[6].f = params[3];
   }
   if (ctx->ExecuteFlag) {
      gl_TexParameterfv( ctx, target, pname, params );
   }
}


void gl_save_TexImage1D( GLcontext *ctx, GLenum target,
                         GLint level, GLint components,
    GLsizei width, GLint border,
                         GLenum format, GLenum type,
    struct gl_image *teximage )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEX_IMAGE1D, 8 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = components;
      n[4].i = (GLint) width;
      n[5].i = border;
      n[6].e = format;
      n[7].e = type;
      n[8].data = teximage;
      if (teximage) {

         teximage->RefCount = 1;
      }
   }
   if (ctx->ExecuteFlag) {
      gl_TexImage1D( ctx, target, level, components, width,
                        border, format, type, teximage );
   }
}


void gl_save_TexImage2D( GLcontext *ctx, GLenum target,
                         GLint level, GLint components,
    GLsizei width, GLsizei height, GLint border,
                         GLenum format, GLenum type,
    struct gl_image *teximage )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEX_IMAGE2D, 9 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = components;
      n[4].i = (GLint) width;
      n[5].i = (GLint) height;
      n[6].i = border;
      n[7].e = format;
      n[8].e = type;
      n[9].data = teximage;
      if (teximage) {

         teximage->RefCount = 1;
      }
   }
   if (ctx->ExecuteFlag) {
      gl_TexImage2D( ctx, target, level, components, width,
                        height, border, format, type, teximage );
   }
}


void gl_save_TexImage3DEXT( GLcontext *ctx, GLenum target,
                            GLint level, GLint components,
                            GLsizei width, GLsizei height, GLsizei depth,
                            GLint border,
                            GLenum format, GLenum type,
                            struct gl_image *teximage )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEX_IMAGE3D, 10 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = components;
      n[4].i = (GLint) width;
      n[5].i = (GLint) height;
      n[6].i = (GLint) depth;
      n[7].i = border;
      n[8].e = format;
      n[9].e = type;
      n[10].data = teximage;
   }
   if (ctx->ExecuteFlag) {
      gl_TexImage3DEXT( ctx, target, level, components, width,
                           height, depth, border, format, type, teximage );
   }
}


void gl_save_TexSubImage1D( GLcontext *ctx,
                            GLenum target, GLint level, GLint xoffset,
                            GLsizei width, GLenum format, GLenum type,
                            struct gl_image *image )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEX_SUB_IMAGE1D, 7 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = xoffset;
      n[4].i = (GLint) width;
      n[5].e = format;
      n[6].e = type;
      n[7].data = image;
   }
   if (ctx->ExecuteFlag) {
      gl_TexSubImage1D( ctx, target, level, xoffset, width,
                           format, type, image );
   }
}


void gl_save_TexSubImage2D( GLcontext *ctx,
                            GLenum target, GLint level,
                            GLint xoffset, GLint yoffset,
                            GLsizei width, GLsizei height,
                            GLenum format, GLenum type,
                            struct gl_image *image )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEX_SUB_IMAGE2D, 9 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = xoffset;
      n[4].i = yoffset;
      n[5].i = (GLint) width;
      n[6].i = (GLint) height;
      n[7].e = format;
      n[8].e = type;
      n[9].data = image;
   }
   if (ctx->ExecuteFlag) {
      gl_TexSubImage2D( ctx, target, level, xoffset, yoffset,
                           width, height, format, type, image );
   }
}


void gl_save_TexSubImage3DEXT( GLcontext *ctx,
                               GLenum target, GLint level,
                               GLint xoffset, GLint yoffset,GLint zoffset,
                               GLsizei width, GLsizei height, GLsizei depth,
                               GLenum format, GLenum type,
                               struct gl_image *image )
{
   Node *n = alloc_instruction( ctx, OPCODE_TEX_SUB_IMAGE3D, 11 );
   if (n) {
      n[1].e = target;
      n[2].i = level;
      n[3].i = xoffset;
      n[4].i = yoffset;
      n[5].i = zoffset;
      n[6].i = (GLint) width;
      n[7].i = (GLint) height;
      n[8].i = (GLint) depth;
      n[9].e = format;
      n[10].e = type;
      n[11].data = image;
   }
   if (ctx->ExecuteFlag) {
      gl_TexSubImage3DEXT( ctx, target, level, xoffset, yoffset, zoffset,
                              width, height, depth, format, type, image );
   }
}


void gl_save_Translatef( GLcontext *ctx, GLfloat x, GLfloat y, GLfloat z )
{
   Node *n = alloc_instruction( ctx, OPCODE_TRANSLATE, 3 );
   if (n) {
      n[1].f = x;
      n[2].f = y;
      n[3].f = z;
   }
   if (ctx->ExecuteFlag) {
      gl_Translatef( ctx, x, y, z );
   }
}


void gl_save_Vertex4f( GLcontext *ctx,
                       GLfloat x, GLfloat y, GLfloat z, GLfloat w )
{
   Node *n = alloc_instruction( ctx, OPCODE_VERTEX, 4 );
   if (n) {
      n[1].f = x;
      n[2].f = y;
      n[3].f = z;
      n[4].f = w;
   }
   if (ctx->ExecuteFlag) {
      (*ctx->Exec.Vertex4f)( ctx, x, y, z, w );
   }
}


void gl_save_Viewport( GLcontext *ctx,
                       GLint x, GLint y, GLsizei width, GLsizei height )
{
   Node *n = alloc_instruction( ctx, OPCODE_VIEWPORT, 4 );
   if (n) {
      n[1].i = x;
      n[2].i = y;
      n[3].i = (GLint) width;
      n[4].i = (GLint) height;
   }
   if (ctx->ExecuteFlag) {
      gl_Viewport( ctx, x, y, width, height );
   }
}


void gl_save_WindowPos4fMESA( GLcontext *ctx,
                              GLfloat x, GLfloat y, GLfloat z, GLfloat w )
{
   Node *n = alloc_instruction( ctx, OPCODE_WINDOW_POS, 4 );
   if (n) {
      n[1].f = x;
      n[2].f = y;
      n[3].f = z;
      n[4].f = w;
   }
   if (ctx->ExecuteFlag) {
      gl_WindowPos4fMESA( ctx, x, y, z, w );
   }
}
# 2258 "dlist.c"
static void execute_list( GLcontext *ctx, GLuint list )
{
   Node *n;
   GLboolean done;
   OpCode opcode;

   if (!gl_IsList(ctx,list))
      return;

   ctx->CallDepth++;

   n = ctx->Shared->List[list-1];
   done = GL_FALSE;
   while (!done) {
      opcode = n[0].opcode;

      switch (opcode) {

         case OPCODE_VERTEX:
            (*ctx->Exec.Vertex4f)( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
            break;
         case OPCODE_NORMAL:
            ctx->Current.Normal[0] = n[1].f;
            ctx->Current.Normal[1] = n[2].f;
            ctx->Current.Normal[2] = n[3].f;
            break;
  case OPCODE_COLOR_4UB:
            (*ctx->Exec.Color4ub)( ctx, n[1].ub, n[2].ub, n[3].ub, n[4].ub );
     break;
  case OPCODE_COLOR_4F:
            (*ctx->Exec.Color4f)( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
            break;
         case OPCODE_INDEX:
            ctx->Current.Index = n[1].ui;
            ctx->VB->MonoColor = GL_FALSE;
            break;
         case OPCODE_BEGIN:
            gl_Begin( ctx, n[1].e );
            break;
         case OPCODE_END:
            gl_End( ctx );
            break;
  case OPCODE_TEXCOORD:
     ctx->Current.TexCoord[0] = n[1].f;
     ctx->Current.TexCoord[1] = n[2].f;
     ctx->Current.TexCoord[2] = n[3].f;
     ctx->Current.TexCoord[3] = n[4].f;
     break;


         case OPCODE_ACCUM:
     gl_Accum( ctx, n[1].e, n[2].f );
     break;
         case OPCODE_ALPHA_FUNC:
     gl_AlphaFunc( ctx, n[1].e, n[2].f );
     break;
         case OPCODE_BIND_TEXTURE:
            gl_BindTexture( ctx, n[1].e, n[2].ui );
            break;
  case OPCODE_BITMAP:
     gl_Bitmap( ctx, (GLsizei) n[1].i, (GLsizei) n[2].i,
         n[3].f, n[4].f,
         n[5].f, n[6].f,
         (struct gl_image *) n[7].data );
     break;
  case OPCODE_BLEND_COLOR:
     gl_BlendColor( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
     break;
  case OPCODE_BLEND_EQUATION:
     gl_BlendEquation( ctx, n[1].e );
     break;
  case OPCODE_BLEND_FUNC:
     gl_BlendFunc( ctx, n[1].e, n[2].e );
     break;
         case OPCODE_CALL_LIST:

            if (ctx->CallDepth<64) {
               execute_list( ctx, n[1].ui );
            }
            break;
         case OPCODE_CALL_LIST_OFFSET:

            if (ctx->CallDepth<64) {
               execute_list( ctx, ctx->List.ListBase + n[1].ui );
            }
            break;
  case OPCODE_CLEAR:
     gl_Clear( ctx, n[1].bf );
     break;
  case OPCODE_CLEAR_COLOR:
     gl_ClearColor( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
     break;
  case OPCODE_CLEAR_ACCUM:
     gl_ClearAccum( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
     break;
  case OPCODE_CLEAR_DEPTH:
     gl_ClearDepth( ctx, (GLclampd) n[1].f );
     break;
  case OPCODE_CLEAR_INDEX:
     gl_ClearIndex( ctx, n[1].ui );
     break;
  case OPCODE_CLEAR_STENCIL:
     gl_ClearStencil( ctx, n[1].i );
     break;
         case OPCODE_CLIP_PLANE:
            {
               GLfloat equ[4];
               equ[0] = n[2].f;
               equ[1] = n[3].f;
               equ[2] = n[4].f;
               equ[3] = n[5].f;
               gl_ClipPlane( ctx, n[1].e, equ );
            }
            break;
  case OPCODE_COLOR_MASK:
     gl_ColorMask( ctx, n[1].b, n[2].b, n[3].b, n[4].b );
     break;
  case OPCODE_COLOR_MATERIAL:
     gl_ColorMaterial( ctx, n[1].e, n[2].e );
     break;
  case OPCODE_COPY_PIXELS:
     gl_CopyPixels( ctx, n[1].i, n[2].i,
      (GLsizei) n[3].i, (GLsizei) n[4].i, n[5].e );
     break;
         case OPCODE_COPY_TEX_IMAGE1D:
     gl_CopyTexImage1D( ctx, n[1].e, n[2].i, n[3].e, n[4].i,
                               n[5].i, n[6].i, n[7].i );
            break;
         case OPCODE_COPY_TEX_IMAGE2D:
     gl_CopyTexImage2D( ctx, n[1].e, n[2].i, n[3].e, n[4].i,
                               n[5].i, n[6].i, n[7].i, n[8].i );
            break;
         case OPCODE_COPY_TEX_SUB_IMAGE1D:
     gl_CopyTexSubImage1D( ctx, n[1].e, n[2].i, n[3].i, n[4].i,
                                  n[5].i, n[6].i );
            break;
         case OPCODE_COPY_TEX_SUB_IMAGE2D:
     gl_CopyTexSubImage2D( ctx, n[1].e, n[2].i, n[3].i, n[4].i,
                                  n[5].i, n[6].i, n[7].i, n[8].i );
            break;
         case OPCODE_COPY_TEX_SUB_IMAGE3D:
            gl_CopyTexSubImage3DEXT( ctx, n[1].e, n[2].i, n[3].i, n[4].i,
                                     n[5].i, n[6].i, n[7].i, n[8].i , n[9].i);
            break;
  case OPCODE_CULL_FACE:
     gl_CullFace( ctx, n[1].e );
     break;
  case OPCODE_DEPTH_FUNC:
     gl_DepthFunc( ctx, n[1].e );
     break;
  case OPCODE_DEPTH_MASK:
     gl_DepthMask( ctx, n[1].b );
     break;
  case OPCODE_DEPTH_RANGE:
     gl_DepthRange( ctx, (GLclampd) n[1].f, (GLclampd) n[2].f );
     break;
  case OPCODE_DISABLE:
     gl_Disable( ctx, n[1].e );
     break;
  case OPCODE_DRAW_BUFFER:
     gl_DrawBuffer( ctx, n[1].e );
     break;
  case OPCODE_DRAW_PIXELS:
     gl_DrawPixels( ctx, (GLsizei) n[1].i, (GLsizei) n[2].i,
      n[3].e, n[4].e, n[5].data );
     break;
  case OPCODE_EDGE_FLAG:
            ctx->Current.EdgeFlag = n[1].b;
            break;
  case OPCODE_ENABLE:
     gl_Enable( ctx, n[1].e );
     break;
  case OPCODE_EVALCOORD1:
     gl_EvalCoord1f( ctx, n[1].f );
     break;
  case OPCODE_EVALCOORD2:
     gl_EvalCoord2f( ctx, n[1].f, n[2].f );
     break;
  case OPCODE_EVALMESH1:
     gl_EvalMesh1( ctx, n[1].e, n[2].i, n[3].i );
     break;
  case OPCODE_EVALMESH2:
     gl_EvalMesh2( ctx, n[1].e, n[2].i, n[3].i, n[4].i, n[5].i );
     break;
  case OPCODE_EVALPOINT1:
     gl_EvalPoint1( ctx, n[1].i );
     break;
  case OPCODE_EVALPOINT2:
     gl_EvalPoint2( ctx, n[1].i, n[2].i );
     break;
  case OPCODE_FOG:
     {
        GLfloat p[4];
        p[0] = n[2].f;
        p[1] = n[3].f;
        p[2] = n[4].f;
        p[3] = n[5].f;
        gl_Fogfv( ctx, n[1].e, p );
     }
     break;
  case OPCODE_FRONT_FACE:
     gl_FrontFace( ctx, n[1].e );
     break;
  case OPCODE_HINT:
     gl_Hint( ctx, n[1].e, n[2].e );
     break;
  case OPCODE_INDEX_MASK:
     gl_IndexMask( ctx, n[1].ui );
     break;
  case OPCODE_INIT_NAMES:
     gl_InitNames( ctx );
     break;
         case OPCODE_LIGHT:
     {
        GLfloat p[4];
        p[0] = n[3].f;
        p[1] = n[4].f;
        p[2] = n[5].f;
        p[3] = n[6].f;
        gl_Lightfv( ctx, n[1].e, n[2].e, p, 4 );
     }
     break;
         case OPCODE_LIGHT_MODEL:
     {
        GLfloat p[4];
        p[0] = n[2].f;
        p[1] = n[3].f;
        p[2] = n[4].f;
        p[3] = n[5].f;
        gl_LightModelfv( ctx, n[1].e, p );
     }
     break;
  case OPCODE_LINE_STIPPLE:
     gl_LineStipple( ctx, n[1].i, n[2].us );
     break;
  case OPCODE_LINE_WIDTH:
     gl_LineWidth( ctx, n[1].f );
     break;
  case OPCODE_LIST_BASE:
     gl_ListBase( ctx, n[1].ui );
     break;
  case OPCODE_LOAD_MATRIX:
     if (sizeof(Node)==sizeof(GLfloat)) {
        gl_LoadMatrixf( ctx, &n[1].f );
     }
     else {
        GLfloat m[16];
        GLuint i;
        for (i=0;i<16;i++) {
    m[i] = n[1+i].f;
        }
        gl_LoadMatrixf( ctx, m );
     }
     break;
  case OPCODE_LOAD_NAME:
     gl_LoadName( ctx, n[1].ui );
     break;
  case OPCODE_LOGIC_OP:
     gl_LogicOp( ctx, n[1].e );
     break;
  case OPCODE_MAP1:
     gl_Map1f( ctx, n[1].e, n[2].f, n[3].f,
                      n[4].i, n[5].i, (GLfloat *) n[6].data, GL_TRUE );
     break;
  case OPCODE_MAP2:
     gl_Map2f( ctx, n[1].e,
                      n[2].f, n[3].f,
        n[6].i, n[8].i,
        n[4].f, n[5].f,
        n[7].i, n[9].i,
        (GLfloat *) n[10].data,
                      GL_TRUE);
     break;
  case OPCODE_MAPGRID1:
     gl_MapGrid1f( ctx, n[1].i, n[2].f, n[3].f );
     break;
  case OPCODE_MAPGRID2:
     gl_MapGrid2f( ctx, n[1].i, n[2].f, n[3].f, n[4].i, n[5].f, n[6].f);
     break;
  case OPCODE_MATERIAL:
     {
        GLfloat params[4];
        params[0] = n[3].f;
        params[1] = n[4].f;
        params[2] = n[5].f;
        params[3] = n[6].f;
        gl_Materialfv( ctx, n[1].e, n[2].e, params );
     }
     break;
         case OPCODE_MATRIX_MODE:
            gl_MatrixMode( ctx, n[1].e );
            break;
  case OPCODE_MULT_MATRIX:
     if (sizeof(Node)==sizeof(GLfloat)) {
        gl_MultMatrixf( ctx, &n[1].f );
     }
     else {
        GLfloat m[16];
        GLuint i;
        for (i=0;i<16;i++) {
    m[i] = n[1+i].f;
        }
        gl_MultMatrixf( ctx, m );
     }
     break;
  case OPCODE_PASSTHROUGH:
     gl_PassThrough( ctx, n[1].f );
     break;
  case OPCODE_PIXEL_MAP:
     gl_PixelMapfv( ctx, n[1].e, n[2].i, (GLfloat *) n[3].data );
     break;
  case OPCODE_PIXEL_TRANSFER:
     gl_PixelTransferf( ctx, n[1].e, n[2].f );
     break;
  case OPCODE_PIXEL_ZOOM:
     gl_PixelZoom( ctx, n[1].f, n[2].f );
     break;
  case OPCODE_POINTSIZE:
     gl_PointSize( ctx, n[1].f );
     break;
  case OPCODE_POLYGON_MODE:
     gl_PolygonMode( ctx, n[1].e, n[2].e );
     break;
  case OPCODE_POLYGON_STIPPLE:
     gl_PolygonStipple( ctx, (GLubyte *) n[1].data );
     break;
  case OPCODE_POLYGON_OFFSET:
     gl_PolygonOffset( ctx, n[1].f, n[2].f );
     break;
  case OPCODE_POP_ATTRIB:
     gl_PopAttrib( ctx );
     break;
  case OPCODE_POP_MATRIX:
     gl_PopMatrix( ctx );
     break;
  case OPCODE_POP_NAME:
     gl_PopName( ctx );
     break;
  case OPCODE_PRIORITIZE_TEXTURE:
            gl_PrioritizeTextures( ctx, 1, &n[1].ui, &n[2].f );
     break;
  case OPCODE_PUSH_ATTRIB:
     gl_PushAttrib( ctx, n[1].bf );
     break;
  case OPCODE_PUSH_MATRIX:
     gl_PushMatrix( ctx );
     break;
  case OPCODE_PUSH_NAME:
     gl_PushName( ctx, n[1].ui );
     break;
  case OPCODE_RASTER_POS:
            gl_RasterPos4f( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
     break;
  case OPCODE_READ_BUFFER:
     gl_ReadBuffer( ctx, n[1].e );
     break;
         case OPCODE_SCALE:
            gl_Scalef( ctx, n[1].f, n[2].f, n[3].f );
            break;
  case OPCODE_SCISSOR:
     gl_Scissor( ctx, n[1].i, n[2].i, n[3].i, n[4].i );
     break;
  case OPCODE_SHADE_MODEL:
     gl_ShadeModel( ctx, n[1].e );
     break;
  case OPCODE_STENCIL_FUNC:
     gl_StencilFunc( ctx, n[1].e, n[2].i, n[3].ui );
     break;
  case OPCODE_STENCIL_MASK:
     gl_StencilMask( ctx, n[1].ui );
     break;
  case OPCODE_STENCIL_OP:
     gl_StencilOp( ctx, n[1].e, n[2].e, n[3].e );
     break;
         case OPCODE_TEXENV:
            {
               GLfloat params[4];
               params[0] = n[3].f;
               params[1] = n[4].f;
               params[2] = n[5].f;
               params[3] = n[6].f;
               gl_TexEnvfv( ctx, n[1].e, n[2].e, params );
            }
            break;
         case OPCODE_TEXGEN:
            {
               GLfloat params[4];
               params[0] = n[3].f;
               params[1] = n[4].f;
               params[2] = n[5].f;
               params[3] = n[6].f;
               gl_TexGenfv( ctx, n[1].e, n[2].e, params );
            }
            break;
         case OPCODE_TEXPARAMETER:
            {
               GLfloat params[4];
               params[0] = n[3].f;
               params[1] = n[4].f;
               params[2] = n[5].f;
               params[3] = n[6].f;
               gl_TexParameterfv( ctx, n[1].e, n[2].e, params );
            }
            break;
  case OPCODE_TEX_IMAGE1D:
     gl_TexImage1D( ctx,
                           n[1].e,
                           n[2].i,
                           n[3].i,
                           n[4].i,
                           n[5].e,
                           n[6].e,
                           n[7].e,
                           n[8].data );
     break;
  case OPCODE_TEX_IMAGE2D:
     gl_TexImage2D( ctx,
                           n[1].e,
                           n[2].i,
                           n[3].i,
                           n[4].i,
                           n[5].i,
                           n[6].e,
                           n[7].e,
                           n[8].e,
                           n[9].data );
     break;
         case OPCODE_TEX_IMAGE3D:
            gl_TexImage3DEXT( ctx,
                              n[1].e,
                              n[2].i,
                              n[3].i,
                              n[4].i,
                              n[5].i,
                              n[6].i,
                              n[7].e,
                              n[8].e,
                              n[9].e,
                              n[10].data );
            break;
         case OPCODE_TEX_SUB_IMAGE1D:
            gl_TexSubImage1D( ctx, n[1].e, n[2].i, n[3].i, n[4].i, n[5].e,
                              n[6].e, (struct gl_image *) n[7].data );
            break;
         case OPCODE_TEX_SUB_IMAGE2D:
            gl_TexSubImage2D( ctx, n[1].e, n[2].i, n[3].i, n[4].i, n[5].e,
                              n[6].i, n[7].e, n[8].e,
                              (struct gl_image *) n[9].data );
            break;
         case OPCODE_TEX_SUB_IMAGE3D:
            gl_TexSubImage3DEXT( ctx, n[1].e, n[2].i, n[3].i, n[4].i, n[5].i,
                                 n[6].i, n[7].i, n[8].i, n[9].e, n[10].e,
                                 (struct gl_image *) n[11].data );
            break;
         case OPCODE_TRANSLATE:
            gl_Translatef( ctx, n[1].f, n[2].f, n[3].f );
            break;
  case OPCODE_VIEWPORT:
     gl_Viewport( ctx,
                         n[1].i, n[2].i, (GLsizei) n[3].i, (GLsizei) n[4].i );
     break;
  case OPCODE_WINDOW_POS:
            gl_WindowPos4fMESA( ctx, n[1].f, n[2].f, n[3].f, n[4].f );
     break;
  case OPCODE_CONTINUE:
     n = (Node *) n[1].next;
     break;
  case OPCODE_END_OF_LIST:
     done = GL_TRUE;
     break;
  default:
            {
               char msg[1000];
               sprintf(msg, "Error in execute_list: opcode=%d", (int) opcode);
               gl_problem( ctx, msg );
            }
            done = GL_TRUE;
      }


      if (opcode!=OPCODE_CONTINUE) {
  n += InstSize[opcode];
      }

   }
   ctx->CallDepth--;
}
# 2757 "dlist.c"
GLboolean gl_IsList( GLcontext *ctx, GLuint list )
{
   if (list>0 && list<=7000 && ctx->Shared->List[list-1]) {
      return GL_TRUE;
   }
   else {
      return GL_FALSE;
   }
}






void gl_DeleteLists( GLcontext *ctx, GLuint list, GLsizei range )
{
   GLuint i;

   if (((ctx)->Primitive!=GL_BITMAP)) {
      gl_error( ctx, GL_INVALID_OPERATION, "glDeleteLists" );
      return;
   }
   if (range<0) {
      gl_error( ctx, GL_INVALID_VALUE, "glDeleteLists" );
      return;
   }
   for (i=list;i<list+range;i++) {
      if (i<=7000 && ctx->Shared->List[i-1]) {
         destroy_list( ctx, i-1 );
         ctx->Shared->List[i-1] = ((void *)0);
      }
   }
}







GLuint gl_GenLists( GLcontext *ctx, GLsizei range )
{
   GLuint i, freecount;

   if (((ctx)->Primitive!=GL_BITMAP)) {
      gl_error( ctx, GL_INVALID_OPERATION, "glGenLists" );
      return 0;
   }
   if (range<0) {
      gl_error( ctx, GL_INVALID_VALUE, "glGenLists" );
      return 0;
   }
   if (range==0) {
      return 0;
   }

   i = 0;
   freecount = 0;
   for (i=0; i<7000; i++ ) {
      if (ctx->Shared->List[i]==((void *)0)) {
         freecount++;
         if (freecount==range) {


     GLuint k;
     GLuint n = i-range+2;
     for (k=n;k<n+range;k++) {
        ctx->Shared->List[k-1] = make_empty_list();
     }
            return n;
         }
      }
      else {
         freecount = 0;
      }
   }
   return 0;
}






void gl_NewList( GLcontext *ctx, GLuint list, GLenum mode )
{
   if (((ctx)->Primitive!=GL_BITMAP)) {
      gl_error( ctx, GL_INVALID_OPERATION, "glNewList" );
      return;
   }
   if (list==0 || list>7000) {
      gl_error( ctx, GL_INVALID_VALUE, "glNewList" );
      return;
   }
   if (mode!=GL_COMPILE && mode!=GL_COMPILE_AND_EXECUTE) {
      gl_error( ctx, GL_INVALID_ENUM, "glNewList" );
      return;
   }
   if (CurrentListPtr) {

      gl_error( ctx, GL_INVALID_OPERATION, "glNewList" );
      return;
   }


   CurrentListNum = list;
   CurrentListPtr = CurrentBlock = (Node *) malloc( sizeof(Node) * 500 );
   CurrentPos = 0;

   ctx->CompileFlag = GL_TRUE;
   if (mode==GL_COMPILE) {
      ctx->ExecuteFlag = GL_FALSE;
   }
   else {

      ctx->ExecuteFlag = GL_TRUE;
   }

   ctx->API = ctx->Save;
}






void gl_EndList( GLcontext *ctx )
{
   Node *n;


   if (!CurrentListPtr) {
      gl_error( ctx, GL_INVALID_OPERATION, "glEndList" );
      return;
   }

   n = alloc_instruction( ctx, OPCODE_END_OF_LIST, 0 );


   if (ctx->Shared->List[CurrentListNum-1]) {
      destroy_list( ctx, CurrentListNum-1 );
   }
   ctx->Shared->List[CurrentListNum-1] = CurrentListPtr;

   CurrentListNum = 0;
   CurrentListPtr = ((void *)0);
   ctx->ExecuteFlag = GL_TRUE;
   ctx->CompileFlag = GL_FALSE;

   ctx->API = ctx->Exec;
}



void gl_CallList( GLcontext *ctx, GLuint list )
{


   GLboolean save_compile_flag;
   save_compile_flag = ctx->CompileFlag;
   ctx->CompileFlag = GL_FALSE;
   execute_list( ctx, list );
   ctx->CompileFlag = save_compile_flag;
}






void gl_CallLists( GLcontext *ctx,
                   GLsizei n, GLenum type, const GLvoid *lists )
{
   GLuint i, list;
   GLboolean save_compile_flag;




   save_compile_flag = ctx->CompileFlag;
   ctx->CompileFlag = GL_FALSE;

   for (i=0;i<n;i++) {
      list = translate_id( i, type, lists );
      execute_list( ctx, ctx->List.ListBase + list );
   }

   ctx->CompileFlag = save_compile_flag;
}






void gl_ListBase( GLcontext *ctx, GLuint base )
{
   if (((ctx)->Primitive!=GL_BITMAP)) {
      gl_error( ctx, GL_INVALID_OPERATION, "glListBase" );
      return;
   }
   ctx->List.ListBase = base;
}
# 2969 "dlist.c"
static char tmp[1000];

static char *enum_string( GLenum k )
{

   switch (k) {
      case GL_POINTS: return "GL_POINTS";
      case GL_LINES: return "GL_LINES";
      case GL_LINE_STRIP: return "GL_LINE_STRIP";
      case GL_LINE_LOOP: return "GL_LINE_LOOP";
      case GL_TRIANGLES: return "GL_TRIANGLES";
      case GL_TRIANGLE_STRIP: return "GL_TRIANGLE_STRIP";
      case GL_TRIANGLE_FAN: return "GL_TRIANGLE_FAN";
      case GL_QUADS: return "GL_QUADS";
      case GL_QUAD_STRIP: return "GL_QUAD_STRIP";
      case GL_POLYGON: return "GL_POLYGON";
      case GL_FRONT: return "GL_FRONT";
      case GL_BACK: return "GL_BACK";
      case GL_FRONT_AND_BACK: return "GL_FRONT_AND_BACK";
      case GL_AMBIENT: return "GL_AMBIENT";
      case GL_DIFFUSE: return "GL_DIFFUSE";
      case GL_SPECULAR: return "GL_SPECULAR";
      case GL_SHININESS: return "GL_SHININESS";
      default:
         sprintf(tmp,"%X", k);
         return tmp;
   }
}






static void print_list( GLcontext *ctx, FILE *f, GLuint list )
{
   Node *n;
   GLboolean done;
   OpCode opcode;

   if (!glIsList(list)) {
      fprintf(f,"%d is not a display list ID\n",list);
      return;
   }

   n = ctx->Shared->List[list-1];

   fprintf( f, "START-LIST %d, address %p\n", list, (void*)n );

   done = GL_FALSE;
   while (!done) {
      opcode = n[0].opcode;

      switch (opcode) {
         case OPCODE_ACCUM:
            fprintf(f,"accum %d %g\n", n[1].e, n[2].f );
     break;
         case OPCODE_BEGIN:
            fprintf(f,"Begin %s\n", enum_string(n[1].e) );
            break;
  case OPCODE_BITMAP:
            fprintf(f,"Bitmap %d %d %g %g %g %g %p\n", n[1].i, n[2].i,
         n[3].f, n[4].f, n[5].f, n[6].f, (void *) n[7].data );
     break;
         case OPCODE_CALL_LIST:
            fprintf(f,"CallList %d\n", n[1].ui );
            break;
         case OPCODE_CALL_LIST_OFFSET:
            fprintf(f,"CallList %d + offset %d = %d\n", n[1].ui,
                    ctx->List.ListBase, ctx->List.ListBase + n[1].ui );
            break;
  case OPCODE_COLOR_4F:
            fprintf(f,"Color4f %g %g %g %g\n", n[1].f, n[2].f, n[3].f, n[4].f);
     break;
  case OPCODE_COLOR_4UB:
            fprintf(f,"Color4ub %d %d %d %d\n", n[1].ub, n[2].ub,
                                                n[3].ub, n[4].ub );
     break;
  case OPCODE_DISABLE:
            fprintf(f,"Disable %s\n", enum_string(n[1].e));
     break;
  case OPCODE_ENABLE:
            fprintf(f,"Enable %s\n", enum_string(n[1].e));
     break;
         case OPCODE_END:
            fprintf(f,"End\n");
            break;
         case OPCODE_INDEX:
            fprintf(f,"Index %d\n", n[1].ui );
            break;
  case OPCODE_LINE_STIPPLE:
     fprintf(f,"LineStipple %d %x\n", n[1].i, (int) n[2].us );
     break;
  case OPCODE_LOAD_MATRIX:
            fprintf(f,"LoadMatrix (or LoadIdentity)\n");
            fprintf(f,"  %8f %8f %8f %8f\n", n[1].f, n[5].f, n[9].f, n[13].f);
            fprintf(f,"  %8f %8f %8f %8f\n", n[2].f, n[6].f, n[10].f, n[14].f);
            fprintf(f,"  %8f %8f %8f %8f\n", n[3].f, n[7].f, n[11].f, n[15].f);
            fprintf(f,"  %8f %8f %8f %8f\n", n[4].f, n[8].f, n[12].f, n[16].f);
     break;
  case OPCODE_MATERIAL:
            fprintf(f,"Material %s %s %g %g %g %g\n", enum_string(n[1].e),
                    enum_string(n[2].e), n[3].f, n[4].f, n[5].f, n[6].f );
            break;
  case OPCODE_MULT_MATRIX:
            fprintf(f,"MultMatrix (or Rotate)\n");
            fprintf(f,"  %8f %8f %8f %8f\n", n[1].f, n[5].f, n[9].f, n[13].f);
            fprintf(f,"  %8f %8f %8f %8f\n", n[2].f, n[6].f, n[10].f, n[14].f);
            fprintf(f,"  %8f %8f %8f %8f\n", n[3].f, n[7].f, n[11].f, n[15].f);
            fprintf(f,"  %8f %8f %8f %8f\n", n[4].f, n[8].f, n[12].f, n[16].f);
     break;
         case OPCODE_NORMAL:
            fprintf(f,"Normal %g %g %g\n", n[1].f, n[2].f, n[3].f );
            break;
  case OPCODE_POP_ATTRIB:
            fprintf(f,"PopAttrib\n");
     break;
  case OPCODE_POP_MATRIX:
            fprintf(f,"PopMatrix\n");
     break;
  case OPCODE_POP_NAME:
            fprintf(f,"PopName\n");
     break;
  case OPCODE_PUSH_ATTRIB:
            fprintf(f,"PushAttrib %x\n", n[1].bf );
     break;
  case OPCODE_PUSH_MATRIX:
            fprintf(f,"PushMatrix\n");
     break;
  case OPCODE_PUSH_NAME:
            fprintf(f,"PushName %d\n", n[1].ui );
     break;
  case OPCODE_RASTER_POS:
            fprintf(f,"RasterPos %g %g %g %g\n", n[1].f, n[2].f,n[3].f,n[4].f);
     break;
         case OPCODE_SCALE:
            fprintf(f,"Scale %g %g %g\n", n[1].f, n[2].f, n[3].f );
            break;
  case OPCODE_TEXCOORD:
            fprintf(f,"Texcoord %g %g %g %g\n", n[1].f, n[2].f, n[3].f,n[4].f);
     break;
         case OPCODE_TRANSLATE:
            fprintf(f,"Translate %g %g %g\n", n[1].f, n[2].f, n[3].f );
            break;
         case OPCODE_VERTEX:
            fprintf(f,"Vertex %g %g %g %g\n", n[1].f, n[2].f, n[3].f, n[4].f );
            break;




  case OPCODE_CONTINUE:
            fprintf(f,"DISPLAY-LIST-CONTINUE\n");
     n = (Node *) n[1].next;
     break;
  case OPCODE_END_OF_LIST:
            fprintf(f,"END-LIST %d\n", list);
     done = GL_TRUE;
     break;
         default:
            if (opcode < 0 || opcode > OPCODE_END_OF_LIST) {
               fprintf(f,"ERROR IN DISPLAY LIST: opcode = %d, address = %p\n",
                       opcode, (void*) n);
               return;
            }
            else {
               fprintf(f,"command %d, %d operands\n",opcode,InstSize[opcode]);
            }
      }


      if (opcode!=OPCODE_CONTINUE) {
  n += InstSize[opcode];
      }

   }
}
# 3154 "dlist.c"
void mesa_print_display_list( GLuint list )
{
   GLcontext *ctx;



   ctx = CC;

   print_list( ctx, stdout, list );
}