pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;

package linux_types_h is

   subtype uu_s128 is Extensions.Signed_128;  -- /usr/include/linux/types.h:12

   subtype uu_u128 is Extensions.Unsigned_128;  -- /usr/include/linux/types.h:13

   subtype uu_le16 is asm_generic_int_ll64_h.uu_u16;  -- /usr/include/linux/types.h:31

   subtype uu_be16 is asm_generic_int_ll64_h.uu_u16;  -- /usr/include/linux/types.h:32

   subtype uu_le32 is asm_generic_int_ll64_h.uu_u32;  -- /usr/include/linux/types.h:33

   subtype uu_be32 is asm_generic_int_ll64_h.uu_u32;  -- /usr/include/linux/types.h:34

   subtype uu_le64 is asm_generic_int_ll64_h.uu_u64;  -- /usr/include/linux/types.h:35

   subtype uu_be64 is asm_generic_int_ll64_h.uu_u64;  -- /usr/include/linux/types.h:36

   subtype uu_sum16 is asm_generic_int_ll64_h.uu_u16;  -- /usr/include/linux/types.h:38

   subtype uu_wsum is asm_generic_int_ll64_h.uu_u32;  -- /usr/include/linux/types.h:39

   subtype uu_poll_t is unsigned;  -- /usr/include/linux/types.h:55

end linux_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
