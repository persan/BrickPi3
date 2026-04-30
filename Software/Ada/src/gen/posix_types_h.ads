pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package posix_types_h is

   subtype uu_kernel_old_uid_t is unsigned_short;  -- /usr/lib/linux/uapi/arm64/asm/posix_types.h:5

   subtype uu_kernel_old_gid_t is unsigned_short;  -- /usr/lib/linux/uapi/arm64/asm/posix_types.h:6

end posix_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
