pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package linux_spi_spidev_h is

   SPI_IOC_MAGIC : aliased constant Character := 'k';  --  /usr/include/linux/spi/spidev.h:32
   --  arg-macro: function SPI_MSGSIZE (N)
   --    return (((N)*(sizeof (struct spi_ioc_transfer))) < (2 ** _IOC_SIZEBITS)) ? ((N)*(sizeof (struct spi_ioc_transfer))) : 0;
   --  arg-macro: procedure SPI_IOC_MESSAGE (N)
   --    _IOW(SPI_IOC_MAGIC, 0, char(SPI_MSGSIZE(N)))
   --  unsupported macro: SPI_IOC_RD_MODE _IOR(SPI_IOC_MAGIC, 1, __u8)
   --  unsupported macro: SPI_IOC_WR_MODE _IOW(SPI_IOC_MAGIC, 1, __u8)
   --  unsupported macro: SPI_IOC_RD_LSB_FIRST _IOR(SPI_IOC_MAGIC, 2, __u8)
   --  unsupported macro: SPI_IOC_WR_LSB_FIRST _IOW(SPI_IOC_MAGIC, 2, __u8)
   --  unsupported macro: SPI_IOC_RD_BITS_PER_WORD _IOR(SPI_IOC_MAGIC, 3, __u8)
   --  unsupported macro: SPI_IOC_WR_BITS_PER_WORD _IOW(SPI_IOC_MAGIC, 3, __u8)
   --  unsupported macro: SPI_IOC_RD_MAX_SPEED_HZ _IOR(SPI_IOC_MAGIC, 4, __u32)
   --  unsupported macro: SPI_IOC_WR_MAX_SPEED_HZ _IOW(SPI_IOC_MAGIC, 4, __u32)
   --  unsupported macro: SPI_IOC_RD_MODE32 _IOR(SPI_IOC_MAGIC, 5, __u32)
   --  unsupported macro: SPI_IOC_WR_MODE32 _IOW(SPI_IOC_MAGIC, 5, __u32)

   type spi_ioc_transfer is record
      tx_buf : aliased asm_generic_int_ll64_h.uu_u64;  -- /usr/include/linux/spi/spidev.h:71
      rx_buf : aliased asm_generic_int_ll64_h.uu_u64;  -- /usr/include/linux/spi/spidev.h:72
      len : aliased asm_generic_int_ll64_h.uu_u32;  -- /usr/include/linux/spi/spidev.h:74
      speed_hz : aliased asm_generic_int_ll64_h.uu_u32;  -- /usr/include/linux/spi/spidev.h:75
      delay_usecs : aliased asm_generic_int_ll64_h.uu_u16;  -- /usr/include/linux/spi/spidev.h:77
      bits_per_word : aliased asm_generic_int_ll64_h.uu_u8;  -- /usr/include/linux/spi/spidev.h:78
      cs_change : aliased asm_generic_int_ll64_h.uu_u8;  -- /usr/include/linux/spi/spidev.h:79
      tx_nbits : aliased asm_generic_int_ll64_h.uu_u8;  -- /usr/include/linux/spi/spidev.h:80
      rx_nbits : aliased asm_generic_int_ll64_h.uu_u8;  -- /usr/include/linux/spi/spidev.h:81
      word_delay_usecs : aliased asm_generic_int_ll64_h.uu_u8;  -- /usr/include/linux/spi/spidev.h:82
      pad : aliased asm_generic_int_ll64_h.uu_u8;  -- /usr/include/linux/spi/spidev.h:83
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/linux/spi/spidev.h:70

end linux_spi_spidev_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
