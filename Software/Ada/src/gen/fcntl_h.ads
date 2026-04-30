pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with aarch64_linux_gnu_sys_types_h;

package fcntl_h is

   --  unsupported macro: S_IFMT __S_IFMT
   --  unsupported macro: S_IFDIR __S_IFDIR
   --  unsupported macro: S_IFCHR __S_IFCHR
   --  unsupported macro: S_IFBLK __S_IFBLK
   --  unsupported macro: S_IFREG __S_IFREG
   --  unsupported macro: S_IFIFO __S_IFIFO
   --  unsupported macro: S_IFLNK __S_IFLNK
   --  unsupported macro: S_IFSOCK __S_IFSOCK
   --  unsupported macro: S_ISUID __S_ISUID
   --  unsupported macro: S_ISGID __S_ISGID
   --  unsupported macro: S_ISVTX __S_ISVTX
   --  unsupported macro: S_IRUSR __S_IREAD
   --  unsupported macro: S_IWUSR __S_IWRITE
   --  unsupported macro: S_IXUSR __S_IEXEC
   --  unsupported macro: S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)
   --  unsupported macro: S_IRGRP (S_IRUSR >> 3)
   --  unsupported macro: S_IWGRP (S_IWUSR >> 3)
   --  unsupported macro: S_IXGRP (S_IXUSR >> 3)
   --  unsupported macro: S_IRWXG (S_IRWXU >> 3)
   --  unsupported macro: S_IROTH (S_IRGRP >> 3)
   --  unsupported macro: S_IWOTH (S_IWGRP >> 3)
   --  unsupported macro: S_IXOTH (S_IXGRP >> 3)
   --  unsupported macro: S_IRWXO (S_IRWXG >> 3)
   R_OK : constant := 4;  --  /usr/include/fcntl.h:128
   W_OK : constant := 2;  --  /usr/include/fcntl.h:129
   X_OK : constant := 1;  --  /usr/include/fcntl.h:130
   F_OK : constant := 0;  --  /usr/include/fcntl.h:131

   AT_FDCWD : constant := -100;  --  /usr/include/fcntl.h:149

   AT_SYMLINK_NOFOLLOW : constant := 16#100#;  --  /usr/include/fcntl.h:152
   AT_REMOVEDIR : constant := 16#200#;  --  /usr/include/fcntl.h:153

   AT_SYMLINK_FOLLOW : constant := 16#400#;  --  /usr/include/fcntl.h:155

   AT_NO_AUTOMOUNT : constant := 16#800#;  --  /usr/include/fcntl.h:157

   AT_EMPTY_PATH : constant := 16#1000#;  --  /usr/include/fcntl.h:159
   AT_STATX_SYNC_TYPE : constant := 16#6000#;  --  /usr/include/fcntl.h:160
   AT_STATX_SYNC_AS_STAT : constant := 16#0000#;  --  /usr/include/fcntl.h:161
   AT_STATX_FORCE_SYNC : constant := 16#2000#;  --  /usr/include/fcntl.h:162
   AT_STATX_DONT_SYNC : constant := 16#4000#;  --  /usr/include/fcntl.h:163
   AT_RECURSIVE : constant := 16#8000#;  --  /usr/include/fcntl.h:164

   AT_EACCESS : constant := 16#200#;  --  /usr/include/fcntl.h:166

   F_ULOCK : constant := 0;  --  /usr/include/fcntl.h:278
   F_LOCK : constant := 1;  --  /usr/include/fcntl.h:279
   F_TLOCK : constant := 2;  --  /usr/include/fcntl.h:280
   F_TEST : constant := 3;  --  /usr/include/fcntl.h:281

   function fcntl (uu_fd : int; uu_cmd : int  -- , ...
      ) return int  -- /usr/include/fcntl.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "fcntl";

   function fcntl64 (uu_fd : int; uu_cmd : int  -- , ...
      ) return int  -- /usr/include/fcntl.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "fcntl64";

   function open (uu_file : Interfaces.C.Strings.chars_ptr; uu_oflag : int  -- , ...
      ) return int  -- /usr/include/fcntl.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "open";

   function open64 (uu_file : Interfaces.C.Strings.chars_ptr; uu_oflag : int  -- , ...
      ) return int  -- /usr/include/fcntl.h:219
   with Import => True, 
        Convention => C, 
        External_Name => "open64";

   function openat
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_oflag : int  -- , ...
      ) return int  -- /usr/include/fcntl.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "openat";

   function openat64
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_oflag : int  -- , ...
      ) return int  -- /usr/include/fcntl.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "openat64";

   function creat (uu_file : Interfaces.C.Strings.chars_ptr; uu_mode : aarch64_linux_gnu_sys_types_h.mode_t) return int  -- /usr/include/fcntl.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "creat";

   function creat64 (uu_file : Interfaces.C.Strings.chars_ptr; uu_mode : aarch64_linux_gnu_sys_types_h.mode_t) return int  -- /usr/include/fcntl.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "creat64";

   function lockf
     (uu_fd : int;
      uu_cmd : int;
      uu_len : aarch64_linux_gnu_sys_types_h.off_t) return int  -- /usr/include/fcntl.h:284
   with Import => True, 
        Convention => C, 
        External_Name => "lockf";

   function lockf64
     (uu_fd : int;
      uu_cmd : int;
      uu_len : aarch64_linux_gnu_sys_types_h.off64_t) return int  -- /usr/include/fcntl.h:293
   with Import => True, 
        Convention => C, 
        External_Name => "lockf64";

   function posix_fadvise
     (uu_fd : int;
      uu_offset : aarch64_linux_gnu_sys_types_h.off_t;
      uu_len : aarch64_linux_gnu_sys_types_h.off_t;
      uu_advise : int) return int  -- /usr/include/fcntl.h:301
   with Import => True, 
        Convention => C, 
        External_Name => "posix_fadvise";

   function posix_fadvise64
     (uu_fd : int;
      uu_offset : aarch64_linux_gnu_sys_types_h.off64_t;
      uu_len : aarch64_linux_gnu_sys_types_h.off64_t;
      uu_advise : int) return int  -- /usr/include/fcntl.h:313
   with Import => True, 
        Convention => C, 
        External_Name => "posix_fadvise64";

   function posix_fallocate
     (uu_fd : int;
      uu_offset : aarch64_linux_gnu_sys_types_h.off_t;
      uu_len : aarch64_linux_gnu_sys_types_h.off_t) return int  -- /usr/include/fcntl.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "posix_fallocate";

   function posix_fallocate64
     (uu_fd : int;
      uu_offset : aarch64_linux_gnu_sys_types_h.off64_t;
      uu_len : aarch64_linux_gnu_sys_types_h.off64_t) return int  -- /usr/include/fcntl.h:334
   with Import => True, 
        Convention => C, 
        External_Name => "posix_fallocate64";

end fcntl_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
