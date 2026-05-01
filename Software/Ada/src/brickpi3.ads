with Ada.Finalization;
with Ada.Streams;
with System;
with Interfaces;
package BrickPi3 is

   pragma Elaborate_Body;
   type Sensor_Port is range 1 .. 8;
   PORT_1 : constant Sensor_Port := 16#01#;
   PORT_2 : constant Sensor_Port := 16#02#;
   PORT_3 : constant Sensor_Port := 16#04#;
   PORT_4 : constant Sensor_Port := 16#08#;

   type Motor_Port is range 1 .. 8;
   PORT_A : constant Motor_Port := 16#01#;
   PORT_B : constant Motor_Port := 16#02#;
   PORT_C : constant Motor_Port := 16#04#;
   PORT_D : constant Motor_Port := 16#08#;

   MOTOR_FLOAT : constant := -128;

   REMOTE_BIT_RED_UP    : constant := 16#01#;
   REMOTE_BIT_RED_DOWN  : constant := 16#02#;
   REMOTE_BIT_BLUE_UP   : constant := 16#04#;
   REMOTE_BIT_BLUE_DOWN : constant := 16#08#;
   REMOTE_BIT_BROADCAST : constant := 16#10#;

   type BPSPI_MESSAGE_TYPE is
     (NONE,
      GET_MANUFACTURER,
      GET_NAME,
      GET_HARDWARE_VERSION,
      GET_FIRMWARE_VERSION,
      GET_ID,
      SET_LED,
      GET_VOLTAGE_3V3,
      GET_VOLTAGE_5V,
      GET_VOLTAGE_9V,
      GET_VOLTAGE_VCC,
      SET_ADDRESS,
      SET_SENSOR_TYPE,
      GET_SENSOR_1,
      GET_SENSOR_2,
      GET_SENSOR_3,
      GET_SENSOR_4,

      I2C_TRANSACT_1,
      I2C_TRANSACT_2,
      I2C_TRANSACT_3,
      I2C_TRANSACT_4,

      SET_MOTOR_POWER,
      SET_MOTOR_POSITION,
      SET_MOTOR_POSITION_KP,
      SET_MOTOR_POSITION_KD,
      SET_MOTOR_DPS,
      SET_MOTOR_DPS_KP,
      SET_MOTOR_DPS_KD,
      SET_MOTOR_LIMITS,
      OFFSET_MOTOR_ENCODER,
      GET_MOTOR_A_ENCODER,
      GET_MOTOR_B_ENCODER,
      GET_MOTOR_C_ENCODER,
      GET_MOTOR_D_ENCODER,
      GET_MOTOR_A_STATUS,
      GET_MOTOR_B_STATUS,
      GET_MOTOR_C_STATUS,
      GET_MOTOR_D_STATUS);

   type SENSOR_TYPE is
     (NONE,
      I2C,
      CUSTOM,

      TOUCH,
      TOUCH_NXT,
      TOUCH_EV3,

      NXT_LIGHT_ON,
      NXT_LIGHT_OFF,
      NXT_COLOR_RED,
      NXT_COLOR_GREEN,
      NXT_COLOR_BLUE,
      NXT_COLOR_FULL,
      NXT_COLOR_OFF,
      NXT_ULTRASONIC,

      EV3_GYRO_ABS,
      EV3_GYRO_DPS,
      EV3_GYRO_ABS_DPS,
      EV3_COLOR_REFLECTED,
      EV3_COLOR_AMBIENT,
      EV3_COLOR_COLOR,
      EV3_COLOR_RAW_REFLECTED,
      EV3_COLOR_COLOR_COMPONENTS,
      EV3_ULTRASONIC_CM,
      EV3_ULTRASONIC_INCHES,
      EV3_ULTRASONIC_LISTEN,
      EV3_INFRARED_PROXIMITY,
      EV3_INFRARED_SEEK,
      EV3_INFRARED_REMOTE);

   type SENSOR_STATE is
     (VALID_DATA, NOT_CONFIGURED, CONFIGURING, NO_DATA, I2C_ERROR);

   type SENSOR_CONFIG_FLAGS is mod 2 ** 32;

   I2C_MID_CLOCK : constant SENSOR_CONFIG_FLAGS := 2#0000_0000_0000_0001#;
   PIN_1_PULL    : constant SENSOR_CONFIG_FLAGS := 2#0000_0000_0000_0010#;
   I2C_REPEAT    : constant SENSOR_CONFIG_FLAGS := 2#0000_0000_0000_0100#;
   PIN_5_DIR     : constant SENSOR_CONFIG_FLAGS := 2#0000_0000_0001_0000#;
   PIN_5_STATE   : constant SENSOR_CONFIG_FLAGS := 2#0000_0000_0010_0000#;
   PIN_6_DIR     : constant SENSOR_CONFIG_FLAGS := 2#0000_0001_0000_0000#;
   PIN_6_STATE   : constant SENSOR_CONFIG_FLAGS := 2#0000_0010_0010_0000#;

   REPORT_1_ADC : constant SENSOR_CONFIG_FLAGS := 4096;
   REPORT_6_ADC : constant SENSOR_CONFIG_FLAGS := 16384;

   type i2c_struct_t is record
      speed        : Interfaces.Unsigned_8;
      c_delay      : Interfaces.Unsigned_8;
      address      : Interfaces.Unsigned_8;
      length_write : Interfaces.Unsigned_8;
      buffer_write : Ada.Streams.Stream_Element_Array (1 .. 16);
      length_read  : Interfaces.Unsigned_8;
      buffer_read  : Ada.Streams.Stream_Element_Array (1 .. 16);
   end record;

   type sensor_custom_t is record
      adc1 : Interfaces.Unsigned_16;
      adc6 : Interfaces.Unsigned_16;
      pin5 : Boolean;
      pin6 : Boolean;
   end record;

   type sensor_touch_t is record
      pressed : Boolean;
   end record;

   type sensor_light_t is record
      ambient   : Interfaces.Integer_16;
      reflected : Interfaces.Integer_16;
   end record;

   type sensor_color_t is record
      color           : Interfaces.Integer_8;
      reflected_red   : Interfaces.Integer_16;
      reflected_green : Interfaces.Integer_16;
      reflected_blue  : Interfaces.Integer_16;
      ambient         : Interfaces.Integer_16;
   end record;

   type sensor_ultrasonic_t is record
      cm       : float;
      inch     : float;
      presence : Boolean;
   end record;

   type sensor_gyro_t is record
      c_abs : Interfaces.Integer_16;
      dps   : Interfaces.Integer_16;
   end record;

   type anon_array3086 is array (0 .. 3) of Interfaces.Integer_8;
   type anon_array3088 is array (0 .. 3) of Interfaces.Unsigned_8;
   type sensor_infrared_t is record
      proximity : Interfaces.Unsigned_8;
      distance  : anon_array3086;
      heading   : anon_array3086;
      remote    : anon_array3088;
   end record;

   type BrickPi3 is new Ada.Finalization.Limited_Controlled with private;

   function Detect (Self : BrickPi3) return Boolean;
   -- Confirm that the BrickPi3 is connected and up-to-date

   function get_manufacturer (Self : BrickPi3) return String;
   --  Get the manufacturer (should be "Dexter Industries")

   function get_board (Self : BrickPi3) return String;
   --  Get the board name (should be "BrickPi3")

   function Get_Hardware_Version (Self : BrickPi3) return String;
   --  Get the hardware version number

   function Get_firmware_Version (Self : BrickPi3) return String;
   --  Get the firmware version number

   function get_id (Self : BrickPi3) return String;
   --  Get the serial number ID that is unique to each BrickPi3

   procedure Set_LED (Self : BrickPi3; On : Boolean := False);
   --  Control the LED

   function Get_Voltage_3v3 (Self : BrickPi3) return Float;
   function Get_Voltage_5v (Self : BrickPi3) return Float;
   function Get_Voltage_9v (Self : BrickPi3) return Float;
   function Get_Voltage_Battery (Self : BrickPi3) return Float;
   --  Get the voltage and return as floating point voltage

   function set_sensor_type
     (this       : in out  BrickPi3;
      port       : Interfaces.Unsigned_8;
      c_type     : Interfaces.Unsigned_8;
      flags      : Interfaces.Unsigned_16;
      i2c_struct : access i2c_struct_t) return Integer;

   function transact_i2c
     (this       : in out  BrickPi3;
      port       : Interfaces.Unsigned_8;
      i2c_struct : access i2c_struct_t) return Integer;

   function get_sensor
     (this      : in out  BrickPi3;
      port      : Interfaces.Unsigned_8;
      value_ptr : System.Address) return Integer;

   function set_motor_power
     (this  : in out  BrickPi3;
      port  : Interfaces.Unsigned_8;
      power : Interfaces.Integer_8) return Integer;

   function set_motor_position
     (this     : in out  BrickPi3;
      port     : Interfaces.Unsigned_8;
      position : Interfaces.Integer_32) return Integer;

   function set_motor_position_relative
     (this     : in out  BrickPi3;
      port     : Interfaces.Unsigned_8;
      position : Interfaces.Integer_32) return Integer;

   function set_motor_dps
     (this : in out  BrickPi3;
      port : Interfaces.Unsigned_8;
      dps  : Interfaces.Integer_16) return Integer;

   function set_motor_limits
     (this  : in out  BrickPi3;
      port  : Interfaces.Unsigned_8;
      power : Interfaces.Unsigned_8;
      dps   : Interfaces.Unsigned_16) return Integer;

   function get_motor_status
     (this     : in out  BrickPi3;
      port     : Interfaces.Unsigned_8;
      state    : access Interfaces.Unsigned_8;
      power    : access Interfaces.Integer_8;
      position : access Interfaces.Integer_32;
      dps      : access Interfaces.Integer_16) return Integer;

   function offset_motor_encoder
     (this     : in out  BrickPi3;
      port     : Interfaces.Unsigned_8;
      position : Interfaces.Integer_32) return Integer;

   function reset_motor_encoder
     (this  : in out  BrickPi3;
      port  : Interfaces.Unsigned_8;
      value : access Interfaces.Integer_32) return Integer;

   function reset_motor_encoder
     (this : in out  BrickPi3; port : Interfaces.Unsigned_8) return Integer;

   function set_motor_encoder
     (this  : in out  BrickPi3;
      port  : Interfaces.Unsigned_8;
      value : Interfaces.Integer_32) return Integer;

   function get_motor_encoder
     (this  : in out  BrickPi3;
      port  : Interfaces.Unsigned_8;
      value : access Interfaces.Integer_32) return Integer;


   function reset_all (this : in out  BrickPi3) return Integer;

   function spi_setup (this : in out  BrickPi3) return Integer;

   function spi_transfer_array
     (this     : in out  BrickPi3;
      length   : Interfaces.Unsigned_8;
      outArray : access Interfaces.Unsigned_8;
      inArray  : access Interfaces.Unsigned_8) return Integer;

   function BrickPi3_set_address
     (this : in out  BrickPi3; addr : Integer; id : String) return Integer;

   procedure fatal_error (this : in out  BrickPi3; error : String);

   function spi_write_8
     (this     : in out  BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      value    : Interfaces.Unsigned_8) return Integer;

   function spi_read_16
     (this     : in out  BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      value    : access Interfaces.Unsigned_16) return Integer;

   function spi_read_32
     (this     : in out  BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      value    : access Interfaces.Unsigned_32) return Integer;

   function spi_read_string
     (this     : in out  BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      str      : String;
      chars    : Interfaces.Unsigned_8) return Integer;

private

   type BrickPi3 is new Ada.Finalization.Limited_Controlled with record
      null;
   end record;
   procedure Initialize (this : in out BrickPi3);
   procedure Finalize   (this : in out BrickPi3);
end BrickPi3;
