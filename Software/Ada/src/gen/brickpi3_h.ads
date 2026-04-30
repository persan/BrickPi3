pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_stdint_uintn_h;
with Interfaces.C.Extensions;
with aarch64_linux_gnu_bits_stdint_intn_h;
with linux_spi_spidev_h;
with Interfaces.C.Strings;
with System;

package BrickPi3_h is

   FIRMWARE_VERSION_REQUIRED : aliased constant String := "1.4." & ASCII.NUL;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:15

   LONGEST_SPI_TRANSFER : constant := 29;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:17
   LONGEST_I2C_TRANSFER : constant := 16;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:18

   SPI_TARGET_SPEED : constant := 500000;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:20

   SPIDEV_FILE_NAME : aliased constant String := "/dev/spidev0.1" & ASCII.NUL;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:22

   ERROR_NONE : constant := 0;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:37
   ERROR_SPI_FILE : constant := -1;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:38
   ERROR_SPI_RESPONSE : constant := -2;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:39
   ERROR_WRONG_MANUFACTURER : constant := -3;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:40
   ERROR_WRONG_DEVICE : constant := -4;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:41
   ERROR_FIRMWARE_MISMATCH : constant := -5;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:42
   ERROR_SENSOR_TYPE_MISMATCH : constant := -6;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:43

   PORT_1 : constant := 16#01#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:166
   PORT_2 : constant := 16#02#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:167
   PORT_3 : constant := 16#04#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:168
   PORT_4 : constant := 16#08#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:169

   PORT_A : constant := 16#01#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:172
   PORT_B : constant := 16#02#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:173
   PORT_C : constant := 16#04#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:174
   PORT_D : constant := 16#08#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:175

   MOTOR_FLOAT : constant := -128;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:178

   REMOTE_BIT_RED_UP : constant := 16#01#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:181
   REMOTE_BIT_RED_DOWN : constant := 16#02#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:182
   REMOTE_BIT_BLUE_UP : constant := 16#04#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:183
   REMOTE_BIT_BLUE_DOWN : constant := 16#08#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:184
   REMOTE_BIT_BROADCAST : constant := 16#10#;  --  /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:185

   type BPSPI_MESSAGE_TYPE is 
     (BPSPI_MESSAGE_NONE,
      BPSPI_MESSAGE_GET_MANUFACTURER,
      BPSPI_MESSAGE_GET_NAME,
      BPSPI_MESSAGE_GET_HARDWARE_VERSION,
      BPSPI_MESSAGE_GET_FIRMWARE_VERSION,
      BPSPI_MESSAGE_GET_ID,
      BPSPI_MESSAGE_SET_LED,
      BPSPI_MESSAGE_GET_VOLTAGE_3V3,
      BPSPI_MESSAGE_GET_VOLTAGE_5V,
      BPSPI_MESSAGE_GET_VOLTAGE_9V,
      BPSPI_MESSAGE_GET_VOLTAGE_VCC,
      BPSPI_MESSAGE_SET_ADDRESS,
      BPSPI_MESSAGE_SET_SENSOR_TYPE,
      BPSPI_MESSAGE_GET_SENSOR_1,
      BPSPI_MESSAGE_GET_SENSOR_2,
      BPSPI_MESSAGE_GET_SENSOR_3,
      BPSPI_MESSAGE_GET_SENSOR_4,
      BPSPI_MESSAGE_I2C_TRANSACT_1,
      BPSPI_MESSAGE_I2C_TRANSACT_2,
      BPSPI_MESSAGE_I2C_TRANSACT_3,
      BPSPI_MESSAGE_I2C_TRANSACT_4,
      BPSPI_MESSAGE_SET_MOTOR_POWER,
      BPSPI_MESSAGE_SET_MOTOR_POSITION,
      BPSPI_MESSAGE_SET_MOTOR_POSITION_KP,
      BPSPI_MESSAGE_SET_MOTOR_POSITION_KD,
      BPSPI_MESSAGE_SET_MOTOR_DPS,
      BPSPI_MESSAGE_SET_MOTOR_DPS_KP,
      BPSPI_MESSAGE_SET_MOTOR_DPS_KD,
      BPSPI_MESSAGE_SET_MOTOR_LIMITS,
      BPSPI_MESSAGE_OFFSET_MOTOR_ENCODER,
      BPSPI_MESSAGE_GET_MOTOR_A_ENCODER,
      BPSPI_MESSAGE_GET_MOTOR_B_ENCODER,
      BPSPI_MESSAGE_GET_MOTOR_C_ENCODER,
      BPSPI_MESSAGE_GET_MOTOR_D_ENCODER,
      BPSPI_MESSAGE_GET_MOTOR_A_STATUS,
      BPSPI_MESSAGE_GET_MOTOR_B_STATUS,
      BPSPI_MESSAGE_GET_MOTOR_C_STATUS,
      BPSPI_MESSAGE_GET_MOTOR_D_STATUS)
   with Convention => C;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:47

   subtype SENSOR_TYPE is unsigned;
   SENSOR_TYPE_SENSOR_TYPE_NONE : constant SENSOR_TYPE := 1;
   SENSOR_TYPE_SENSOR_TYPE_I2C : constant SENSOR_TYPE := 2;
   SENSOR_TYPE_SENSOR_TYPE_CUSTOM : constant SENSOR_TYPE := 3;
   SENSOR_TYPE_SENSOR_TYPE_TOUCH : constant SENSOR_TYPE := 4;
   SENSOR_TYPE_SENSOR_TYPE_TOUCH_NXT : constant SENSOR_TYPE := 5;
   SENSOR_TYPE_SENSOR_TYPE_TOUCH_EV3 : constant SENSOR_TYPE := 6;
   SENSOR_TYPE_SENSOR_TYPE_NXT_LIGHT_ON : constant SENSOR_TYPE := 7;
   SENSOR_TYPE_SENSOR_TYPE_NXT_LIGHT_OFF : constant SENSOR_TYPE := 8;
   SENSOR_TYPE_SENSOR_TYPE_NXT_COLOR_RED : constant SENSOR_TYPE := 9;
   SENSOR_TYPE_SENSOR_TYPE_NXT_COLOR_GREEN : constant SENSOR_TYPE := 10;
   SENSOR_TYPE_SENSOR_TYPE_NXT_COLOR_BLUE : constant SENSOR_TYPE := 11;
   SENSOR_TYPE_SENSOR_TYPE_NXT_COLOR_FULL : constant SENSOR_TYPE := 12;
   SENSOR_TYPE_SENSOR_TYPE_NXT_COLOR_OFF : constant SENSOR_TYPE := 13;
   SENSOR_TYPE_SENSOR_TYPE_NXT_ULTRASONIC : constant SENSOR_TYPE := 14;
   SENSOR_TYPE_SENSOR_TYPE_EV3_GYRO_ABS : constant SENSOR_TYPE := 15;
   SENSOR_TYPE_SENSOR_TYPE_EV3_GYRO_DPS : constant SENSOR_TYPE := 16;
   SENSOR_TYPE_SENSOR_TYPE_EV3_GYRO_ABS_DPS : constant SENSOR_TYPE := 17;
   SENSOR_TYPE_SENSOR_TYPE_EV3_COLOR_REFLECTED : constant SENSOR_TYPE := 18;
   SENSOR_TYPE_SENSOR_TYPE_EV3_COLOR_AMBIENT : constant SENSOR_TYPE := 19;
   SENSOR_TYPE_SENSOR_TYPE_EV3_COLOR_COLOR : constant SENSOR_TYPE := 20;
   SENSOR_TYPE_SENSOR_TYPE_EV3_COLOR_RAW_REFLECTED : constant SENSOR_TYPE := 21;
   SENSOR_TYPE_SENSOR_TYPE_EV3_COLOR_COLOR_COMPONENTS : constant SENSOR_TYPE := 22;
   SENSOR_TYPE_SENSOR_TYPE_EV3_ULTRASONIC_CM : constant SENSOR_TYPE := 23;
   SENSOR_TYPE_SENSOR_TYPE_EV3_ULTRASONIC_INCHES : constant SENSOR_TYPE := 24;
   SENSOR_TYPE_SENSOR_TYPE_EV3_ULTRASONIC_LISTEN : constant SENSOR_TYPE := 25;
   SENSOR_TYPE_SENSOR_TYPE_EV3_INFRARED_PROXIMITY : constant SENSOR_TYPE := 26;
   SENSOR_TYPE_SENSOR_TYPE_EV3_INFRARED_SEEK : constant SENSOR_TYPE := 27;
   SENSOR_TYPE_SENSOR_TYPE_EV3_INFRARED_REMOTE : constant SENSOR_TYPE := 28;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:104

   type SENSOR_STATE is 
     (SENSOR_STATE_VALID_DATA,
      SENSOR_STATE_NOT_CONFIGURED,
      SENSOR_STATE_CONFIGURING,
      SENSOR_STATE_NO_DATA,
      SENSOR_STATE_I2C_ERROR)
   with Convention => C;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:144

   subtype SENSOR_CONFIG_FLAGS is unsigned;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_I2C_MID_CLOCK : constant SENSOR_CONFIG_FLAGS := 1;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_PIN_1_PULL : constant SENSOR_CONFIG_FLAGS := 2;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_I2C_REPEAT : constant SENSOR_CONFIG_FLAGS := 4;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_PIN_5_DIR : constant SENSOR_CONFIG_FLAGS := 16;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_PIN_5_STATE : constant SENSOR_CONFIG_FLAGS := 32;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_PIN_6_DIR : constant SENSOR_CONFIG_FLAGS := 256;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_PIN_6_STATE : constant SENSOR_CONFIG_FLAGS := 512;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_REPORT_1_ADC : constant SENSOR_CONFIG_FLAGS := 4096;
   SENSOR_CONFIG_FLAGS_SENSOR_CONFIG_REPORT_6_ADC : constant SENSOR_CONFIG_FLAGS := 16384;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:153

   type anon_array3070 is array (0 .. 15) of aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
   type i2c_struct_t is record
      speed : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:189
      c_delay : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:190
      address : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:191
      length_write : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:192
      buffer_write : aliased anon_array3070;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:193
      length_read : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:194
      buffer_read : aliased anon_array3070;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:195
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:188

   type sensor_custom_t is record
      adc1 : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:200
      adc6 : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:201
      pin5 : aliased Extensions.bool;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:202
      pin6 : aliased Extensions.bool;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:203
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:199

   type sensor_touch_t is record
      pressed : aliased Extensions.bool;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:208
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:207

   type sensor_light_t is record
      ambient : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:213
      reflected : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:214
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:212

   type sensor_color_t is record
      color : aliased aarch64_linux_gnu_bits_stdint_intn_h.int8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:219
      reflected_red : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:220
      reflected_green : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:221
      reflected_blue : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:222
      ambient : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:223
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:218

   type sensor_ultrasonic_t is record
      cm : aliased float;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:228
      inch : aliased float;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:229
      presence : aliased Extensions.bool;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:230
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:227

   type sensor_gyro_t is record
      c_abs : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:235
      dps : aliased aarch64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:236
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:234

   type anon_array3086 is array (0 .. 3) of aliased aarch64_linux_gnu_bits_stdint_intn_h.int8_t;
   type anon_array3088 is array (0 .. 3) of aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
   type sensor_infrared_t is record
      proximity : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:241
      distance : aliased anon_array3086;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:242
      heading : aliased anon_array3086;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:243
      remote : aliased anon_array3088;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:244
   end record
   with Convention => C_Pass_By_Copy;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:240

   package Class_BrickPi3 is
      type anon_array3160 is array (0 .. 28) of aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
      type BrickPi3 is limited record
         Address : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:324
         SensorType : aliased anon_array3088;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:326
         I2CInBytes : aliased anon_array3088;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:327
         spi_file_handle : aliased int;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:329
         spi_xfer_struct : aliased linux_spi_spidev_h.spi_ioc_transfer;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:330
         spi_array_out : aliased anon_array3160;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:331
         spi_array_in : aliased anon_array3160;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.h:332
      end record
      with Import => True,
           Convention => CPP;

      function New_BrickPi3 (addr : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return BrickPi3;  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:14
      pragma CPP_Constructor (New_BrickPi3, "_ZN8BrickPi3C1Eh");

      function detect (this : access BrickPi3; critical : Extensions.bool) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:154
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi36detectEb";

      function get_manufacturer (this : access BrickPi3; str : Interfaces.C.Strings.chars_ptr) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:209
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi316get_manufacturerEPc";

      function get_board (this : access BrickPi3; str : Interfaces.C.Strings.chars_ptr) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:213
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi39get_boardEPc";

      function get_version_hardware (this : access BrickPi3; str : Interfaces.C.Strings.chars_ptr) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:217
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi320get_version_hardwareEPc";

      function get_version_firmware (this : access BrickPi3; str : Interfaces.C.Strings.chars_ptr) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:227
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi320get_version_firmwareEPc";

      function get_id (this : access BrickPi3; str : Interfaces.C.Strings.chars_ptr) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:237
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi36get_idEPc";

      function set_led (this : access BrickPi3; value : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:253
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi37set_ledEh";

      function get_voltage_3v3 (this : access BrickPi3) return float  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:257
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi315get_voltage_3v3Ev";

      function get_voltage_5v (this : access BrickPi3) return float  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:271
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi314get_voltage_5vEv";

      function get_voltage_9v (this : access BrickPi3) return float  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:285
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi314get_voltage_9vEv";

      function get_voltage_battery (this : access BrickPi3) return float  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:299
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi319get_voltage_batteryEv";

      function get_voltage_3v3 (this : access BrickPi3; voltage : access float) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:264
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi315get_voltage_3v3ERf";

      function get_voltage_5v (this : access BrickPi3; voltage : access float) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:278
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi314get_voltage_5vERf";

      function get_voltage_9v (this : access BrickPi3; voltage : access float) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:292
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi314get_voltage_9vERf";

      function get_voltage_battery (this : access BrickPi3; voltage : access float) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:306
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi319get_voltage_batteryERf";

      function set_sensor_type
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         c_type : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         flags : aarch64_linux_gnu_bits_stdint_uintn_h.uint16_t;
         i2c_struct : access i2c_struct_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:313
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi315set_sensor_typeEhhtP12i2c_struct_t";

      function transact_i2c
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         i2c_struct : access i2c_struct_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:363
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi312transact_i2cEhP12i2c_struct_t";

      function get_sensor
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value_ptr : System.Address) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:408
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi310get_sensorEhPv";

      function set_motor_power
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         power : aarch64_linux_gnu_bits_stdint_intn_h.int8_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:649
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi315set_motor_powerEha";

      function set_motor_position
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         position : aarch64_linux_gnu_bits_stdint_intn_h.int32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:657
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi318set_motor_positionEhi";

      function set_motor_position_relative
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         position : aarch64_linux_gnu_bits_stdint_intn_h.int32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:668
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi327set_motor_position_relativeEhi";

      function set_motor_dps
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         dps : aarch64_linux_gnu_bits_stdint_intn_h.int16_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:685
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi313set_motor_dpsEhs";

      function set_motor_limits
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         power : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         dps : aarch64_linux_gnu_bits_stdint_uintn_h.uint16_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:694
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi316set_motor_limitsEhht";

      function get_motor_status
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         state : access aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         power : access aarch64_linux_gnu_bits_stdint_intn_h.int8_t;
         position : access aarch64_linux_gnu_bits_stdint_intn_h.int32_t;
         dps : access aarch64_linux_gnu_bits_stdint_intn_h.int16_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:704
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi316get_motor_statusEhRhRaRiRs";

      function offset_motor_encoder
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         position : aarch64_linux_gnu_bits_stdint_intn_h.int32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:741
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi320offset_motor_encoderEhi";

      function reset_motor_encoder
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value : access aarch64_linux_gnu_bits_stdint_intn_h.int32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:769
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi319reset_motor_encoderEhRi";

      function reset_motor_encoder (this : access BrickPi3; port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:752
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi319reset_motor_encoderEh";

      function set_motor_encoder
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value : aarch64_linux_gnu_bits_stdint_intn_h.int32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:778
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi317set_motor_encoderEhi";

      function get_motor_encoder
        (this : access BrickPi3;
         port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value : access aarch64_linux_gnu_bits_stdint_intn_h.int32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:793
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi317get_motor_encoderEhRi";

      function get_motor_encoder (this : access BrickPi3; port : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return aarch64_linux_gnu_bits_stdint_intn_h.int32_t  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:787
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi317get_motor_encoderEh";

      function reset_all (this : access BrickPi3) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:817
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi39reset_allEv";

      function spi_setup (this : access BrickPi3) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:28
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi39spi_setupEv";

      function spi_transfer_array
        (this : access BrickPi3;
         length : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         outArray : access aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         inArray : access aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:44
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi318spi_transfer_arrayEhPhS0_";

      function BrickPi3_set_address
        (this : access BrickPi3;
         addr : int;
         id : Interfaces.C.Strings.chars_ptr) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:78
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi320BrickPi3_set_addressEiPKc";

      procedure fatal_error (this : access BrickPi3; error : Interfaces.C.Strings.chars_ptr)  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:64
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi311fatal_errorEPc";

      procedure fatal_error (this : access BrickPi3; error : Interfaces.C.Strings.chars_ptr)  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:71
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi311fatal_errorEPKc";

      function spi_write_8
        (this : access BrickPi3;
         msg_type : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:56
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi311spi_write_8Ehh";

      function spi_read_16
        (this : access BrickPi3;
         msg_type : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value : access aarch64_linux_gnu_bits_stdint_uintn_h.uint16_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:105
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi311spi_read_16EhRt";

      function spi_read_32
        (this : access BrickPi3;
         msg_type : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         value : access aarch64_linux_gnu_bits_stdint_uintn_h.uint32_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:120
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi311spi_read_32EhRj";

      function spi_read_string
        (this : access BrickPi3;
         msg_type : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t;
         str : Interfaces.C.Strings.chars_ptr;
         chars : aarch64_linux_gnu_bits_stdint_uintn_h.uint8_t) return int  -- /home/per/persan.BrickPi3/Software/Ada/../C/BrickPi3.cpp:135
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN8BrickPi315spi_read_stringEhPch";
   end;
   use Class_BrickPi3;
end BrickPi3_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
