# 1 "gethdr.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gethdr.c"
# 30 "gethdr.c"
# 1 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 1 3 4
# 28 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 3 4
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
# 29 "/home/xlous/Development/experiment/arm-2010.09/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h" 2 3 4





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

# 31 "gethdr.c" 2

# 1 "config.h" 1
# 33 "gethdr.c" 2
# 1 "global.h" 1
# 30 "global.h"
# 1 "mpeg2dec.h" 1
# 31 "global.h" 2
# 45 "global.h"
void Substitute_Frame_Buffer (int bitstream_framenum, int sequence_framenum)
                         ;


void Initialize_Buffer (void);
void Fill_Buffer (void);
unsigned int Show_Bits (int n);
unsigned int Get_Bits1 (void);
void Flush_Buffer (int n);
unsigned int Get_Bits (int n);
int Get_Byte (void);
int Get_Word (void);


void Next_Packet (void);
int Get_Long (void);
void Flush_Buffer32 (void);
unsigned int Get_Bits32 (void);



void Decode_MPEG1_Intra_Block (int comp, int dc_dct_pred[]);
void Decode_MPEG1_Non_Intra_Block (int comp);
void Decode_MPEG2_Intra_Block (int comp, int dc_dct_pred[]);
void Decode_MPEG2_Non_Intra_Block (int comp);


int Get_Hdr (void);
void next_start_code (void);
int slice_header (void);
void marker_bit (char *text);


void Decode_Picture (int bitstream_framenum, int sequence_framenum)
                         ;
void Output_Last_Frame_of_Sequence (int framenum);


int Get_macroblock_type (void);
int Get_motion_code (void);
int Get_dmvector (void);
int Get_coded_block_pattern (void);
int Get_macroblock_address_increment (void);
int Get_Luma_DC_dct_diff (void);
int Get_Chroma_DC_dct_diff (void);


void Fast_IDCT (short *block);
void Initialize_Fast_IDCT (void);


void Initialize_Reference_IDCT (void);
void Reference_IDCT (short *block);


void motion_vectors (int PMV[2][2][2], int dmvector[2], int motion_vertical_field_select[2][2], int s, int motion_vector_count, int mv_format, int h_r_size, int v_r_size, int dmv, int mvscale)

                                                                   ;
void motion_vector (int *PMV, int *dmvector, int h_r_size, int v_r_size, int dmv, int mvscale, int full_pel_vector)
                                                                         ;
void Dual_Prime_Arithmetic (int DMV[][2], int *dmvector, int mvx, int mvy);


void Error (char *text);
void Warning (char *text);
void Print_Bits (int code, int bits, int len);


void form_predictions (int bx, int by, int macroblock_type, int motion_type, int PMV[2][2][2], int motion_vertical_field_select[2][2], int dmvector[2], int stwtype)

                                ;


void Spatial_Prediction (void);


void Write_Frame (unsigned char *src[], int frame);
# 134 "global.h"
extern char Version[]



;

extern char Author[]



;



extern unsigned char scan[2][64]
# 166 "global.h"
;


extern unsigned char default_intra_quantizer_matrix[64]
# 183 "global.h"
;


extern unsigned char Non_Linear_quantizer_scale[32]
# 196 "global.h"
;
# 213 "global.h"
extern int Inverse_Table_6_9[8][4]
# 227 "global.h"
;
# 242 "global.h"
extern int Output_Type;
extern int hiQdither;


extern int Quiet_Flag;
extern int Trace_Flag;
extern int Fault_Flag;
extern int Verbose_Flag;
extern int Two_Streams;
extern int Spatial_Flag;
extern int Reference_IDCT_Flag;
extern int Frame_Store_Flag;
extern int System_Stream_Flag;
extern int Display_Progressive_Flag;
extern int Ersatz_Flag;
extern int Big_Picture_Flag;
extern int Verify_Flag;
extern int Stats_Flag;
extern int User_Data_Flag;
extern int Main_Bitstream_Flag;



extern char *Output_Picture_Filename;
extern char *Substitute_Picture_Filename;
extern char *Main_Bitstream_Filename;
extern char *Enhancement_Layer_Bitstream_Filename;



extern char Error_Text[256];
extern unsigned char *Clip;


extern unsigned char *backward_reference_frame[3];
extern unsigned char *forward_reference_frame[3];

extern unsigned char *auxframe[3];
extern unsigned char *current_frame[3];
extern unsigned char *substitute_frame[3];



extern unsigned char *llframe0[3];
extern unsigned char *llframe1[3];

extern short *lltmp;
extern char *Lower_Layer_Picture_Filename;





extern int Coded_Picture_Width;
extern int Coded_Picture_Height;
extern int Chroma_Width;
extern int Chroma_Height;
extern int block_count;
extern int Second_Field;
extern int profile, level;


extern int horizontal_size;
extern int vertical_size;
extern int mb_width;
extern int mb_height;
extern double bit_rate;
extern double frame_rate;






extern int aspect_ratio_information;
extern int frame_rate_code;
extern int bit_rate_value;
extern int vbv_buffer_size;
extern int constrained_parameters_flag;


extern int profile_and_level_indication;
extern int progressive_sequence;
extern int chroma_format;
extern int low_delay;
extern int frame_rate_extension_n;
extern int frame_rate_extension_d;


extern int video_format;
extern int color_description;
extern int color_primaries;
extern int transfer_characteristics;
extern int matrix_coefficients;
extern int display_horizontal_size;
extern int display_vertical_size;


extern int temporal_reference;
extern int picture_coding_type;
extern int vbv_delay;
extern int full_pel_forward_vector;
extern int forward_f_code;
extern int full_pel_backward_vector;
extern int backward_f_code;



extern int f_code[2][2];
extern int intra_dc_precision;
extern int picture_structure;
extern int top_field_first;
extern int frame_pred_frame_dct;
extern int concealment_motion_vectors;

extern int intra_vlc_format;

extern int repeat_first_field;

extern int chroma_420_type;
extern int progressive_frame;
extern int composite_display_flag;
extern int v_axis;
extern int field_sequence;
extern int sub_carrier;
extern int burst_amplitude;
extern int sub_carrier_phase;




extern int frame_center_horizontal_offset[3];
extern int frame_center_vertical_offset[3];




extern int layer_id;
extern int lower_layer_prediction_horizontal_size;
extern int lower_layer_prediction_vertical_size;
extern int horizontal_subsampling_factor_m;
extern int horizontal_subsampling_factor_n;
extern int vertical_subsampling_factor_m;
extern int vertical_subsampling_factor_n;



extern int lower_layer_temporal_reference;
extern int lower_layer_horizontal_offset;
extern int lower_layer_vertical_offset;
extern int spatial_temporal_weight_code_table_index;
extern int lower_layer_progressive_frame;
extern int lower_layer_deinterlaced_field_select;







extern int copyright_flag;
extern int copyright_identifier;
extern int original_or_copy;
extern int copyright_number_1;
extern int copyright_number_2;
extern int copyright_number_3;


extern int drop_flag;
extern int hour;
extern int minute;
extern int sec;
extern int frame;
extern int closed_gop;
extern int broken_link;




extern struct layer_data {

  int Infile;
  unsigned char Rdbfr[2048];
  unsigned char *Rdptr;
  unsigned char Inbfr[16];

  unsigned int Bfr;
  unsigned char *Rdmax;
  int Incnt;
  int Bitcnt;

  int intra_quantizer_matrix[64];
  int non_intra_quantizer_matrix[64];
  int chroma_intra_quantizer_matrix[64];
  int chroma_non_intra_quantizer_matrix[64];

  int load_intra_quantizer_matrix;
  int load_non_intra_quantizer_matrix;
  int load_chroma_intra_quantizer_matrix;
  int load_chroma_non_intra_quantizer_matrix;

  int MPEG2_Flag;

  int scalable_mode;

  int q_scale_type;
  int alternate_scan;

  int pict_scal;

  int priority_breakpoint;
  int quantizer_scale;
  int intra_slice;
  short block[12][64];
} base, enhan, *ld;
# 477 "global.h"
extern int Decode_Layer;
# 486 "global.h"
extern int global_MBA;
extern int global_pic;
extern int True_Framenum;
# 34 "gethdr.c" 2



static void sequence_header (void);
static void group_of_pictures_header (void);
static void picture_header (void);
static void extension_and_user_data (void);
static void sequence_extension (void);
static void sequence_display_extension (void);
static void quant_matrix_extension (void);
static void sequence_scalable_extension (void);
static void picture_display_extension (void);
static void picture_coding_extension (void);
static void picture_spatial_scalable_extension (void);
static void picture_temporal_scalable_extension (void);
static int extra_bit_information (void);
static void copyright_extension (void);
static void user_data (void);
static void user_data (void);





static void Update_Temporal_Reference_Tacking_Data (void);

static int Temporal_Reference_Base = 0;
static int True_Framenum_max = -1;
static int Temporal_Reference_GOP_Reset = 0;


static double frame_rate_Table[16] =
{
  0.0,
  ((23.0*1000.0)/1001.0),
  24.0,
  25.0,
  ((30.0*1000.0)/1001.0),
  30.0,
  50.0,
  ((60.0*1000.0)/1001.0),
  60.0,

  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1
};






int Get_Hdr()
{
  unsigned int code;

  for (;;)
  {

    next_start_code();
    code = Get_Bits32();

    switch (code)
    {
    case 0x1B3:
      sequence_header();
      break;
    case 0x1B8:
      group_of_pictures_header();
      break;
    case 0x100:
      picture_header();
      return 1;
      break;
    case 0x1B7:
      return 0;
      break;
    default:
      if (!Quiet_Flag)
        fprintf(stderr,"Unexpected next_start_code %08x (ignored)\n",code);
      break;
    }
  }
}




void next_start_code()
{

  Flush_Buffer(ld->Incnt&7);
  while (Show_Bits(24)!=0x01L)
    Flush_Buffer(8);
}




static void sequence_header()
{
  int i;
  int pos;

  pos = ld->Bitcnt;
  horizontal_size = Get_Bits(12);
  vertical_size = Get_Bits(12);
  aspect_ratio_information = Get_Bits(4);
  frame_rate_code = Get_Bits(4);
  bit_rate_value = Get_Bits(18);
  marker_bit("sequence_header()");
  vbv_buffer_size = Get_Bits(10);
  constrained_parameters_flag = Get_Bits(1);

  if((ld->load_intra_quantizer_matrix = Get_Bits(1)))
  {
    for (i=0; i<64; i++)
      ld->intra_quantizer_matrix[scan[0][i]] = Get_Bits(8);
  }
  else
  {
    for (i=0; i<64; i++)
      ld->intra_quantizer_matrix[i] = default_intra_quantizer_matrix[i];
  }

  if((ld->load_non_intra_quantizer_matrix = Get_Bits(1)))
  {
    for (i=0; i<64; i++)
      ld->non_intra_quantizer_matrix[scan[0][i]] = Get_Bits(8);
  }
  else
  {
    for (i=0; i<64; i++)
      ld->non_intra_quantizer_matrix[i] = 16;
  }


  for (i=0; i<64; i++)
  {
    ld->chroma_intra_quantizer_matrix[i] =
      ld->intra_quantizer_matrix[i];

    ld->chroma_non_intra_quantizer_matrix[i] =
      ld->non_intra_quantizer_matrix[i];
  }
# 208 "gethdr.c"
  extension_and_user_data();
}





static void group_of_pictures_header()
{
  int pos;

  if (ld == &base)
  {
    Temporal_Reference_Base = True_Framenum_max + 1;
    Temporal_Reference_GOP_Reset = 1;
  }
  pos = ld->Bitcnt;
  drop_flag = Get_Bits(1);
  hour = Get_Bits(5);
  minute = Get_Bits(6);
  marker_bit("group_of_pictures_header()");
  sec = Get_Bits(6);
  frame = Get_Bits(6);
  closed_gop = Get_Bits(1);
  broken_link = Get_Bits(1);
# 252 "gethdr.c"
  extension_and_user_data();

}





static void picture_header()
{
  int pos;
  int Extra_Information_Byte_Count;


  ld->pict_scal = 0;

  pos = ld->Bitcnt;
  temporal_reference = Get_Bits(10);
  picture_coding_type = Get_Bits(3);
  vbv_delay = Get_Bits(16);

  if (picture_coding_type==2 || picture_coding_type==3)
  {
    full_pel_forward_vector = Get_Bits(1);
    forward_f_code = Get_Bits(3);
  }
  if (picture_coding_type==3)
  {
    full_pel_backward_vector = Get_Bits(1);
    backward_f_code = Get_Bits(3);
  }
# 311 "gethdr.c"
  Extra_Information_Byte_Count =
    extra_bit_information();

  extension_and_user_data();


  Update_Temporal_Reference_Tacking_Data();
}




int slice_header()
{
  int slice_vertical_position_extension;
  int quantizer_scale_code;
  int pos;
  int slice_picture_id_enable = 0;
  int slice_picture_id = 0;
  int extra_information_slice = 0;

  pos = ld->Bitcnt;

  slice_vertical_position_extension =
    (ld->MPEG2_Flag && vertical_size>2800) ? Get_Bits(3) : 0;

  if (ld->scalable_mode==1)
    ld->priority_breakpoint = Get_Bits(7);

  quantizer_scale_code = Get_Bits(5);
  ld->quantizer_scale =
    ld->MPEG2_Flag ? (ld->q_scale_type ? Non_Linear_quantizer_scale[quantizer_scale_code] : quantizer_scale_code<<1) : quantizer_scale_code;



  if (Get_Bits(1))
  {
    ld->intra_slice = Get_Bits(1);

    slice_picture_id_enable = Get_Bits(1);
 slice_picture_id = Get_Bits(6);

    extra_information_slice = extra_bit_information();
  }
  else
    ld->intra_slice = 0;
# 386 "gethdr.c"
  return slice_vertical_position_extension;
}




static void extension_and_user_data()
{
  int code,ext_ID;

  next_start_code();

  while ((code = Show_Bits(32))==0x1B5 || code==0x1B2)
  {
    if (code==0x1B5)
    {
      Flush_Buffer32();
      ext_ID = Get_Bits(4);
      switch (ext_ID)
      {
      case 1:
        sequence_extension();
        break;
      case 2:
        sequence_display_extension();
        break;
      case 3:
        quant_matrix_extension();
        break;
      case 5:
        sequence_scalable_extension();
        break;
      case 7:
        picture_display_extension();
        break;
      case 8:
        picture_coding_extension();
        break;
      case 9:
        picture_spatial_scalable_extension();
        break;
      case 10:
        picture_temporal_scalable_extension();
        break;
      case 4:
        copyright_extension();
        break;
     default:
        fprintf(stderr,"reserved extension start code ID %d\n",ext_ID);
        break;
      }
      next_start_code();
    }
    else
    {




      Flush_Buffer32();
      user_data();
    }
  }
}





static void sequence_extension()
{
  int horizontal_size_extension;
  int vertical_size_extension;
  int bit_rate_extension;
  int vbv_buffer_size_extension;
  int pos;






  ld->MPEG2_Flag = 1;

  ld->scalable_mode = 0;
  layer_id = 0;

  profile_and_level_indication = Get_Bits(8);
  progressive_sequence = Get_Bits(1);
  chroma_format = Get_Bits(2);
  horizontal_size_extension = Get_Bits(2);
  vertical_size_extension = Get_Bits(2);
  bit_rate_extension = Get_Bits(12);
  marker_bit("sequence_extension");
  vbv_buffer_size_extension = Get_Bits(8);
  low_delay = Get_Bits(1);
  frame_rate_extension_n = Get_Bits(2);
  frame_rate_extension_d = Get_Bits(5);

  frame_rate = frame_rate_Table[frame_rate_code] *
    ((frame_rate_extension_n+1)/(frame_rate_extension_d+1));


  if((profile_and_level_indication>>7) & 1)
  {


    if((profile_and_level_indication&15)==5)
    {
      profile = (128+5);
      level = 8;
    }
  }
  else
  {
    profile = profile_and_level_indication >> 4;
    level = profile_and_level_indication & 0xF;
  }


  horizontal_size = (horizontal_size_extension<<12) | (horizontal_size&0x0fff);
  vertical_size = (vertical_size_extension<<12) | (vertical_size&0x0fff);
# 516 "gethdr.c"
  bit_rate_value += (bit_rate_extension << 18);
  bit_rate = ((double) bit_rate_value) * 400.0;
  vbv_buffer_size += (vbv_buffer_size_extension << 10);
# 552 "gethdr.c"
}




static void sequence_display_extension()
{
  int pos;

  pos = ld->Bitcnt;
  video_format = Get_Bits(3);
  color_description = Get_Bits(1);

  if (color_description)
  {
    color_primaries = Get_Bits(8);
    transfer_characteristics = Get_Bits(8);
    matrix_coefficients = Get_Bits(8);
  }

  display_horizontal_size = Get_Bits(14);
  marker_bit("sequence_display_extension");
  display_vertical_size = Get_Bits(14);
# 602 "gethdr.c"
}




static void quant_matrix_extension()
{
  int i;
  int pos;

  pos = ld->Bitcnt;

  if((ld->load_intra_quantizer_matrix = Get_Bits(1)))
  {
    for (i=0; i<64; i++)
    {
      ld->chroma_intra_quantizer_matrix[scan[0][i]]
      = ld->intra_quantizer_matrix[scan[0][i]]
      = Get_Bits(8);
    }
  }

  if((ld->load_non_intra_quantizer_matrix = Get_Bits(1)))
  {
    for (i=0; i<64; i++)
    {
      ld->chroma_non_intra_quantizer_matrix[scan[0][i]]
      = ld->non_intra_quantizer_matrix[scan[0][i]]
      = Get_Bits(8);
    }
  }

  if((ld->load_chroma_intra_quantizer_matrix = Get_Bits(1)))
  {
    for (i=0; i<64; i++)
      ld->chroma_intra_quantizer_matrix[scan[0][i]] = Get_Bits(8);
  }

  if((ld->load_chroma_non_intra_quantizer_matrix = Get_Bits(1)))
  {
    for (i=0; i<64; i++)
      ld->chroma_non_intra_quantizer_matrix[scan[0][i]] = Get_Bits(8);
  }
# 665 "gethdr.c"
}




static void sequence_scalable_extension()
{
  int pos;

  pos = ld->Bitcnt;



  ld->scalable_mode = Get_Bits(2) + 1;

  layer_id = Get_Bits(4);

  if (ld->scalable_mode==2)
  {
    lower_layer_prediction_horizontal_size = Get_Bits(14);
    marker_bit("sequence_scalable_extension()");
    lower_layer_prediction_vertical_size = Get_Bits(14);
    horizontal_subsampling_factor_m = Get_Bits(5);
    horizontal_subsampling_factor_n = Get_Bits(5);
    vertical_subsampling_factor_m = Get_Bits(5);
    vertical_subsampling_factor_n = Get_Bits(5);
  }

  if (ld->scalable_mode==4)
    Error("temporal scalability not implemented\n");
# 727 "gethdr.c"
}




static void picture_display_extension()
{
  int i;
  int number_of_frame_center_offsets;
  int pos;

  pos = ld->Bitcnt;




  if(progressive_sequence)
  {
    if(repeat_first_field)
    {
      if(top_field_first)
        number_of_frame_center_offsets = 3;
      else
        number_of_frame_center_offsets = 2;
    }
    else
    {
      number_of_frame_center_offsets = 1;
    }
  }
  else
  {
    if(picture_structure!=3)
    {
      number_of_frame_center_offsets = 1;
    }
    else
    {
      if(repeat_first_field)
        number_of_frame_center_offsets = 3;
      else
        number_of_frame_center_offsets = 2;
    }
  }



  for (i=0; i<number_of_frame_center_offsets; i++)
  {
    frame_center_horizontal_offset[i] = Get_Bits(16);
    marker_bit("picture_display_extension, first marker bit");

    frame_center_vertical_offset[i] = Get_Bits(16);
    marker_bit("picture_display_extension, second marker bit");
  }
# 805 "gethdr.c"
}



static void picture_coding_extension()
{
  int pos;

  pos = ld->Bitcnt;

  f_code[0][0] = Get_Bits(4);
  f_code[0][1] = Get_Bits(4);
  f_code[1][0] = Get_Bits(4);
  f_code[1][1] = Get_Bits(4);

  intra_dc_precision = Get_Bits(2);
  picture_structure = Get_Bits(2);
  top_field_first = Get_Bits(1);
  frame_pred_frame_dct = Get_Bits(1);
  concealment_motion_vectors = Get_Bits(1);
  ld->q_scale_type = Get_Bits(1);
  intra_vlc_format = Get_Bits(1);
  ld->alternate_scan = Get_Bits(1);
  repeat_first_field = Get_Bits(1);
  chroma_420_type = Get_Bits(1);
  progressive_frame = Get_Bits(1);
  composite_display_flag = Get_Bits(1);

  if (composite_display_flag)
  {
    v_axis = Get_Bits(1);
    field_sequence = Get_Bits(3);
    sub_carrier = Get_Bits(1);
    burst_amplitude = Get_Bits(7);
    sub_carrier_phase = Get_Bits(8);
  }
# 880 "gethdr.c"
}




static void picture_spatial_scalable_extension()
{
  int pos;

  pos = ld->Bitcnt;

  ld->pict_scal = 1;

  lower_layer_temporal_reference = Get_Bits(10);
  marker_bit("picture_spatial_scalable_extension(), first marker bit");
  lower_layer_horizontal_offset = Get_Bits(15);
  if (lower_layer_horizontal_offset>=16384)
    lower_layer_horizontal_offset-= 32768;
  marker_bit("picture_spatial_scalable_extension(), second marker bit");
  lower_layer_vertical_offset = Get_Bits(15);
  if (lower_layer_vertical_offset>=16384)
    lower_layer_vertical_offset-= 32768;
  spatial_temporal_weight_code_table_index = Get_Bits(2);
  lower_layer_progressive_frame = Get_Bits(1);
  lower_layer_deinterlaced_field_select = Get_Bits(1);
# 927 "gethdr.c"
}







static void picture_temporal_scalable_extension()
{
  Error("temporal scalability not supported\n");




}




static int extra_bit_information()
{
  int Byte_Count = 0;

  while (Get_Bits1())
  {
    Flush_Buffer(8);
    Byte_Count++;
  }

  return(Byte_Count);
}






void marker_bit(text)
char *text;
{
  int marker;

  marker = Get_Bits(1);





}



static void user_data()
{

  next_start_code();
}
# 993 "gethdr.c"
static void copyright_extension()
{
  int pos;
  int reserved_data;

  pos = ld->Bitcnt;


  copyright_flag = Get_Bits(1);
  copyright_identifier = Get_Bits(8);
  original_or_copy = Get_Bits(1);


  reserved_data = Get_Bits(7);

  marker_bit("copyright_extension(), first marker bit");
  copyright_number_1 = Get_Bits(20);
  marker_bit("copyright_extension(), second marker bit");
  copyright_number_2 = Get_Bits(22);
  marker_bit("copyright_extension(), third marker bit");
  copyright_number_3 = Get_Bits(22);

  if(Verbose_Flag>0)
  {
    printf("copyright_extension (byte %d)\n",(pos>>3)-4);
    if (Verbose_Flag>1)
    {
      printf("  copyright_flag =%d\n",copyright_flag);

      printf("  copyright_identifier=%d\n",copyright_identifier);

      printf("  original_or_copy = %d (original=1, copy=0)\n",
        original_or_copy);

      printf("  copyright_number_1=%d\n",copyright_number_1);
      printf("  copyright_number_2=%d\n",copyright_number_2);
      printf("  copyright_number_3=%d\n",copyright_number_3);
    }
  }




}




static void Update_Temporal_Reference_Tacking_Data()
{
  static int temporal_reference_wrap = 0;
  static int temporal_reference_old = 0;

  if (ld == &base)
  {
    if (picture_coding_type!=3 && temporal_reference!=temporal_reference_old)

    {

      if (temporal_reference_wrap)
      {


        Temporal_Reference_Base += 1024;
     temporal_reference_wrap = 0;
      }


      if (temporal_reference<temporal_reference_old && !Temporal_Reference_GOP_Reset)
     temporal_reference_wrap = 1;

      temporal_reference_old = temporal_reference;
      Temporal_Reference_GOP_Reset = 0;
    }

    True_Framenum = Temporal_Reference_Base + temporal_reference;


    if (temporal_reference_wrap && temporal_reference <= temporal_reference_old)
      True_Framenum += 1024;

    True_Framenum_max = (True_Framenum > True_Framenum_max) ?
                        True_Framenum : True_Framenum_max;
  }
}