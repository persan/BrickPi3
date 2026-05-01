
package body BrickPi3 is
   pragma Warnings (Off);



   Active : Boolean := False;
   procedure Initialize (this : in out BrickPi3) is
   begin
      if Active then
         raise Program_Error with "Only one instance allowed";
      end if;
      Active := True;
   end;
   procedure Finalize   (this : in out BrickPi3)is
   begin
      Active := False;
   end;

   ---------------
   -- get_board --
   ---------------

   function get_board (Self : BrickPi3) return String is
   begin
      pragma Compile_Time_Warning (Standard.True, "get_board unimplemented");
      return raise Program_Error with "Unimplemented function get_board";
   end get_board;





   ------------------------------------------------------------------------------
   --  BrickPi3::BrickPi3(uint8_t addr){
   --    if(spi_file_handle < 0){
   --      if(spi_setup()){
   --        fatal_error("spi_setup error");
   --      }
   --    }
   --
   --    if(addr < 1 || addr > 255){
   --      fatal_error("error: SPI address must be in the range of 1 to 255");
   --    }
   --    Address = addr;
   --  }

   ---------------
   -- spi_setup --
   ---------------

   function spi_setup (this : in out BrickPi3) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "spi_setup unimplemented");
      return raise Program_Error with "Unimplemented function spi_setup";
   end spi_setup;
   --  -- Set up SPI. Open the file, and define the configuration.
   --  int BrickPi3::spi_setup(){
   --      this.spi_file_handle = open(SPIDEV_FILE_NAME, O_RDWR);
   --
   --      if (spi_file_handle < 0){
   --          return ERROR_SPI_FILE;
   --      }
   --
   --      this.spi_xfer_struct.cs_change := 0;               -- Keep CS activated
   --      this.spi_xfer_struct.delay_usecs := 0;             -- delay in us
   --      this.spi_xfer_struct.speed_hz := SPI_TARGET_SPEED; -- speed
   --      this.spi_xfer_struct.bits_per_word := 8;           -- bites per word 8
   --
   --      return ERROR_NONE;
   --  }

   ------------------------
   -- spi_transfer_array --
   ------------------------
   function spi_transfer_array
     (this     : in out BrickPi3;
      length   : Interfaces.Unsigned_8;
      outArray : access Interfaces.Unsigned_8;
      inArray  : access Interfaces.Unsigned_8) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "spi_transfer_array unimplemented");
      return
      raise Program_Error with "Unimplemented function spi_transfer_array";
   end spi_transfer_array;
   --  -- Transfer length number of bytes. Write from outArray, read to inArray.
   --  int BrickPi3::spi_transfer_array(uint8_t length, uint8_t *outArray, uint8_t *inArray){
   --      this.spi_xfer_struct.len = length;
   --      this.spi_xfer_struct.tx_buf = (unsigned long)outArray;
   --      this.spi_xfer_struct.rx_buf = (unsigned long)inArray;
   --
   --      if (ioctl(spi_file_handle, SPI_IOC_MESSAGE(1), this.spi_xfer_struct'access) < 0) {
   --          return ERROR_SPI_FILE;
   --      }
   --
   --      return ERROR_NONE;
   --  }

   -----------------
   -- spi_write_8 --
   -----------------
   function spi_write_8
     (this     : in out BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      value    : Interfaces.Unsigned_8) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "spi_write_8 unimplemented");
      return raise Program_Error with "Unimplemented function spi_write_8";
   end spi_write_8;
   --  int BrickPi3::spi_write_8(uint8_t msg_type, uint8_t value){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --    spi_array_out[2] = (value & 0xFF);
   --    return spi_transfer_array(3, spi_array_out, spi_array_in);
   --  }

   -----------------
   -- fatal_error --
   -----------------
   procedure fatal_error (this : in out BrickPi3; error : String) is
   begin
      pragma Compile_Time_Warning (Standard.True, "fatal_error unimplemented");
      raise Program_Error with "Unimplemented procedure fatal_error";
   end fatal_error; --  -- Function to call if an error occured that can not be resolved, such as failure to set up SPI
   --  void BrickPi3::fatal_error(char *error){
   --      printf(error);
   --      printf("\n");
   --      exit(-1);
   --  }

   --------------------------
   -- BrickPi3_set_address --
   --------------------------
   function BrickPi3_set_address
     (this : in out BrickPi3; addr : Integer; id : String) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "BrickPi3_set_address unimplemented");
      return
      raise Program_Error with "Unimplemented function BrickPi3_set_address";
   end BrickPi3_set_address;
   --  -- Set a BrickPi3's address to allow stacking
   --  int BrickPi3::BrickPi3_set_address(int addr, const char *id){
   --      if(addr < 1 || addr > 255){
   --          fatal_error("BrickPi3_set_address error: invalid address. Must be in the range of 1 to 255");
   --          return -1;
   --      }
   --
   --      spi_array_out[0] = 0;                         -- use address 0 so all BrickPi3s will listen, regardless of current address
   --      spi_array_out[1] = BPSPI_MESSAGE_SET_ADDRESS;
   --      spi_array_out[2] = addr;
   --      for(uint8_t i = 0; i < 16; i++){
   --          if(strlen(id) == 32){
   --              char id_str[2];
   --              id_str[0] = *(id + (i * 2));
   --              id_str[1] = *(id + (i * 2) + 1);
   --              spi_array_out[3 + i] = strtol(id_str, NULL, 16);
   --          }else if(strlen(id) == 0){
   --              spi_array_out[3 + i] = 0;
   --          }else{
   --              fatal_error("BrickPi3_set_address error: wrong serial number id length. Must be a 32-digit hex string.");
   --          }
   --      }
   --      if(spi_transfer_array(19, spi_array_out, spi_array_in)){
   --          return -1;
   --      }
   --  }

   -----------------
   -- spi_read_16 --
   -----------------
   function spi_read_16
     (this     : in out BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      value    : access Interfaces.Unsigned_16) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "spi_read_16 unimplemented");
      return raise Program_Error with "Unimplemented function spi_read_16";
   end spi_read_16;
   --  int BrickPi3::spi_read_16(uint8_t msg_type, uint16_t &value){
   --    value = 0;
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --    -- assign error to the value returned by spi_transfer_array, and if not 0:
   --    if(int error = spi_transfer_array(6, spi_array_out, spi_array_in)){
   --      return error;
   --    }
   --    if(spi_array_in[3] != 0xA5){
   --      return ERROR_SPI_RESPONSE;
   --    }
   --    value = ((spi_array_in[4] << 8) | spi_array_in[5]);
   --    return ERROR_NONE;
   --  }

   -----------------
   -- spi_read_32 --
   -----------------
   function spi_read_32
     (this     : in out BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      value    : access Interfaces.Unsigned_32) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "spi_read_32 unimplemented");
      return raise Program_Error with "Unimplemented function spi_read_32";
   end spi_read_32;
   --  int BrickPi3::spi_read_32(uint8_t msg_type, uint32_t &value){
   --    value = 0;
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --    -- assign error to the value returned by spi_transfer_array, and if not 0:
   --    if(int error = spi_transfer_array(8, spi_array_out, spi_array_in)){
   --      return error;
   --    }
   --    if(spi_array_in[3] != 0xA5){
   --      return ERROR_SPI_RESPONSE;
   --    }
   --    value = ((spi_array_in[4] << 24) | (spi_array_in[5] << 16) | (spi_array_in[6] << 8) | spi_array_in[7]);
   --    return ERROR_NONE;
   --  }

   ---------------------
   -- spi_read_string --
   ---------------------
   function spi_read_string
     (this     : in out BrickPi3;
      msg_type : Interfaces.Unsigned_8;
      str      : String;
      chars    : Interfaces.Unsigned_8) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "spi_read_string unimplemented");
      return raise Program_Error with "Unimplemented function spi_read_string";
   end spi_read_string;
   --  int BrickPi3::spi_read_string(uint8_t msg_type, char *str, uint8_t chars){
   --    if((chars + 4) > LONGEST_SPI_TRANSFER){
   --      return -3;
   --    }
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --    -- assign error to the value returned by spi_transfer_array, and if not 0:
   --    if(int error = spi_transfer_array(chars + 4, spi_array_out, spi_array_in)){
   --      return error;
   --    }
   --    if(spi_array_in[3] != 0xA5){
   --      return ERROR_SPI_RESPONSE;
   --    }
   --    for(uint8_t i = 0; i < chars; i++){
   --      str[i] = spi_array_in[i + 4];
   --    }
   --    return ERROR_NONE;
   --  }

   ------------
   -- Detect --
   ------------
   function Detect (Self : BrickPi3) return Boolean is
   begin
      pragma Compile_Time_Warning (Standard.True, "Detect unimplemented");
      return raise Program_Error with "Unimplemented function Detect";
   end Detect;
   --  int BrickPi3::detect(bool critical){
   --    char ErrorStr[100];
   --    char str[21];
   --    int error;
   --    -- assign error to the value returned by get_manufacturer, and if not 0:
   --    if(error = get_manufacturer(str)){
   --      if(critical){
   --        fatal_error("detect error: get_manufacturer failed. Perhaps the BrickPi3 is not connected, or the address is incorrect.");
   --      }else{
   --        return error;
   --      }
   --    }
   --    if(strstr(str, "Dexter Industries") != str){
   --      if(critical){
   --        fatal_error("detect error: get_manufacturer string is not 'Dexter Industries'");
   --      }else{
   --        return ERROR_WRONG_MANUFACTURER;
   --      }
   --    }
   --
   --    -- assign error to the value returned by get_board, and if not 0:
   --    if(error = get_board(str)){
   --      if(critical){
   --        fatal_error("detect error: get_board failed");
   --      }else{
   --        return error;
   --      }
   --    }
   --    if(strstr(str, "BrickPi3") != str){
   --      if(critical){
   --        fatal_error("detect error: get_board string is not 'BrickPi3'");
   --      }else{
   --        return ERROR_WRONG_DEVICE;
   --      }
   --    }
   --
   --    -- assign error to the value returned by get_version_firmware, and if not 0:
   --    if(error = get_version_firmware(str)){
   --      if(critical){
   --        fatal_error("detect error: get_version_firmware failed");
   --      }else{
   --        return error;
   --      }
   --    }
   --    if(strstr(str, FIRMWARE_VERSION_REQUIRED) != str){
   --      if(critical){
   --        sprintf(ErrorStr, "detect error: BrickPi3 firmware needs to be version %sx but is currently version %s", FIRMWARE_VERSION_REQUIRED, str);
   --        fatal_error(ErrorStr);
   --      }else{
   --        return ERROR_FIRMWARE_MISMATCH;
   --      }
   --    }
   --    return ERROR_NONE;
   --  }

   ----------------------
   -- get_manufacturer --
   ----------------------
   function get_manufacturer (Self : BrickPi3) return String is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "get_manufacturer unimplemented");
      return
      raise Program_Error with "Unimplemented function get_manufacturer";
   end get_manufacturer;
   --  int BrickPi3::get_manufacturer(char *str){
   --    return spi_read_string(BPSPI_MESSAGE_GET_MANUFACTURER, str);
   --  }
   --
   --  int BrickPi3::get_board(char *str){
   --    return spi_read_string(BPSPI_MESSAGE_GET_NAME, str);
   --  }

   --------------------------
   -- Get_Hardware_Version --
   --------------------------
   function Get_Hardware_Version (Self : BrickPi3) return String is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "Get_Hardware_Version unimplemented");
      return
      raise Program_Error with "Unimplemented function Get_Hardware_Version";
   end Get_Hardware_Version;
   --  int BrickPi3::get_version_hardware(char *str){
   --    uint32_t value;
   --    -- assign error to the value returned by spi_read_32, and if not 0:
   --    if(int error = spi_read_32(BPSPI_MESSAGE_GET_HARDWARE_VERSION, value)){
   --      return error;
   --    }
   --    sprintf(str, "%d.%d.%d", (value / 1000000), ((value / 1000) % 1000), (value % 1000));
   --    return 0;
   --  }

   --------------------------
   -- Get_firmware_Version --
   --------------------------
   function Get_firmware_Version (Self : BrickPi3) return String is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "Get_firmware_Version unimplemented");
      return
      raise Program_Error with "Unimplemented function Get_firmware_Version";
   end Get_firmware_Version;
   --  int BrickPi3::get_version_firmware(char *str){
   --    uint32_t value;
   --    -- assign error to the value returned by spi_read_32, and if not 0:
   --    if(int error = spi_read_32(BPSPI_MESSAGE_GET_FIRMWARE_VERSION, value)){
   --      return error;
   --    }
   --    sprintf(str, "%d.%d.%d", (value / 1000000), ((value / 1000) % 1000), (value % 1000));
   --    return ERROR_NONE;
   --  }

   ------------
   -- get_id --
   ------------
   function get_id (Self : BrickPi3) return String is
   begin
      pragma Compile_Time_Warning (Standard.True, "get_id unimplemented");
      return raise Program_Error with "Unimplemented function get_id";
   end get_id;
   --  int BrickPi3::get_id(char *str){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_GET_ID;
   --    -- assign error to the value returned by spi_read_32, and if not 0:
   --    if(int error = spi_transfer_array(20, spi_array_out, spi_array_in)){
   --      return error;
   --    }
   --    if(spi_array_in[3] != 0xA5){
   --      return ERROR_SPI_RESPONSE;
   --    }
   --    for(int i = 0; i < 16; i++){
   --      sprintf((str + (i * 2)), "%02X", spi_array_in[i + 4]);
   --    }
   --    return ERROR_NONE;
   --  }
   --

   -------------
   -- Set_LED --
   -------------
   procedure Set_LED (Self : BrickPi3; On : Boolean := False) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Set_LED unimplemented");
      raise Program_Error with "Unimplemented procedure Set_LED";
   end Set_LED;
   --  int  BrickPi3::set_led(uint8_t value){
   --    return spi_write_8(BPSPI_MESSAGE_SET_LED, value);
   --  }

   ---------------------
   -- Get_Voltage_3v3 --
   ---------------------
   function Get_Voltage_3v3 (Self : BrickPi3) return Float is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "Get_Voltage_3v3 unimplemented");
      return raise Program_Error with "Unimplemented function Get_Voltage_3v3";
   end Get_Voltage_3v3;
   --  float BrickPi3::get_voltage_3v3(){
   --    float voltage;
   --    int res = get_voltage_3v3(voltage);
   --    if(res)return res;
   --    return voltage;
   --  }
   --  int BrickPi3::get_voltage_3v3(float &voltage){
   --    uint16_t value;
   --    int res = spi_read_16(BPSPI_MESSAGE_GET_VOLTAGE_3V3, value);
   --    voltage = value / 1000.0;
   --    return res;
   --  }

   --------------------
   -- Get_Voltage_5v --
   --------------------
   function Get_Voltage_5v (Self : BrickPi3) return Float is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "Get_Voltage_5v unimplemented");
      return raise Program_Error with "Unimplemented function Get_Voltage_5v";
   end Get_Voltage_5v;
   --  float BrickPi3::get_voltage_5v(){
   --    float voltage;
   --    int res = get_voltage_5v(voltage);
   --    if(res)return res;
   --    return voltage;
   --  }
   --  int BrickPi3::get_voltage_5v(float &voltage){
   --    uint16_t value;
   --    int res = spi_read_16(BPSPI_MESSAGE_GET_VOLTAGE_5V, value);
   --    voltage = value / 1000.0;
   --    return res;
   --  }

   --------------------
   -- Get_Voltage_9v --
   --------------------
   function Get_Voltage_9v (Self : BrickPi3) return Float is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "Get_Voltage_9v unimplemented");
      return raise Program_Error with "Unimplemented function Get_Voltage_9v";
   end Get_Voltage_9v;
   --  float BrickPi3::get_voltage_9v(){
   --    float voltage;
   --    int res = get_voltage_9v(voltage);
   --    if(res)return res;
   --    return voltage;
   --  }
   --
   --  int BrickPi3::get_voltage_9v(float &voltage){
   --    uint16_t value;
   --    int res = spi_read_16(BPSPI_MESSAGE_GET_VOLTAGE_9V, value);
   --    voltage = value / 1000.0;
   --    return res;
   --  }

   -------------------------
   -- Get_Voltage_Battery --
   -------------------------
   function Get_Voltage_Battery (Self : BrickPi3) return Float is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "Get_Voltage_Battery unimplemented");
      return
      raise Program_Error with "Unimplemented function Get_Voltage_Battery";
   end Get_Voltage_Battery;
   --  float BrickPi3::get_voltage_battery(){
   --    float voltage;
   --    int res = get_voltage_battery(voltage);
   --    if(res)return res;
   --    return voltage;
   --  }
   --
   --  int BrickPi3::get_voltage_battery(float &voltage){
   --    uint16_t value;
   --    int res = spi_read_16(BPSPI_MESSAGE_GET_VOLTAGE_VCC, value);
   --    voltage = value / 1000.0;
   --    return res;
   --  }

   ---------------------
   -- set_sensor_type --
   ---------------------
   function set_sensor_type
     (this       : in out BrickPi3;
      port       : Interfaces.Unsigned_8;
      c_type     : Interfaces.Unsigned_8;
      flags      : Interfaces.Unsigned_16;
      i2c_struct : access i2c_struct_t) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "set_sensor_type unimplemented");
      return raise Program_Error with "Unimplemented function set_sensor_type";
   end set_sensor_type;
   --  int BrickPi3::set_sensor_type(uint8_t port, uint8_t type, uint16_t flags, i2c_struct_t *i2c_struct){
   --    for(uint8_t p = 0; p < 4; p++){
   --      if(port & (1 << p)){
   --        SensorType[p] = type;
   --      }
   --    }
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_SET_SENSOR_TYPE;
   --    spi_array_out[2] = port;
   --    spi_array_out[3] = type;
   --    uint8_t spi_transfer_length = 4;
   --
   --    if(type == SENSOR_TYPE_CUSTOM){
   --      spi_array_out[4] = ((flags >> 8) & 0xFF);
   --      spi_array_out[5] = (flags & 0xFF);
   --      spi_transfer_length = 6;
   --    }else if(type == SENSOR_TYPE_I2C){
   --      spi_array_out[4] = flags & 0xFF;
   --      spi_array_out[5] = i2c_struct->speed;
   --      if(flags & SENSOR_CONFIG_I2C_REPEAT){
   --        spi_array_out[6] = ((i2c_struct->delay >> 24) & 0xFF);
   --        spi_array_out[7] = ((i2c_struct->delay >> 16) & 0xFF);
   --        spi_array_out[8] = ((i2c_struct->delay >> 8) & 0xFF);
   --        spi_array_out[9] = (i2c_struct->delay & 0xFF);
   --        spi_array_out[10] = i2c_struct->address;
   --        if(i2c_struct->length_read > LONGEST_I2C_TRANSFER){
   --          i2c_struct->length_read = LONGEST_I2C_TRANSFER;
   --        }
   --        spi_array_out[11] = i2c_struct->length_read;
   --        for(uint8_t p = 0; p < 4; p++){
   --          if(port & (1 << p)){
   --            I2CInBytes[p] = i2c_struct->length_read;
   --          }
   --        }
   --        if(i2c_struct->length_write > LONGEST_I2C_TRANSFER){
   --          i2c_struct->length_write = LONGEST_I2C_TRANSFER;
   --        }
   --        spi_array_out[12] = i2c_struct->length_write;
   --        for(uint8_t i = 0; i < i2c_struct->length_write; i++){
   --          spi_array_out[13 + i] = i2c_struct->buffer_write[i];
   --        }
   --        spi_transfer_length = 13 + i2c_struct->length_write;
   --      }else{
   --        spi_transfer_length = 6;
   --      }
   --    }
   --
   --    return spi_transfer_array(spi_transfer_length, spi_array_out, spi_array_in);
   --  }

   ------------------
   -- transact_i2c --
   ------------------
   function transact_i2c
     (this       : in out BrickPi3;
      port       : Interfaces.Unsigned_8;
      i2c_struct : access i2c_struct_t) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "transact_i2c unimplemented");
      return raise Program_Error with "Unimplemented function transact_i2c";
   end transact_i2c;
   --  int BrickPi3::transact_i2c(uint8_t port, i2c_struct_t *i2c_struct){
   --    uint8_t msg_type;
   --    switch(port){
   --      case PORT_1:
   --        msg_type = BPSPI_MESSAGE_I2C_TRANSACT_1;
   --      break;
   --      case PORT_2:
   --        msg_type = BPSPI_MESSAGE_I2C_TRANSACT_2;
   --      break;
   --      case PORT_3:
   --        msg_type = BPSPI_MESSAGE_I2C_TRANSACT_3;
   --      break;
   --      case PORT_4:
   --        msg_type = BPSPI_MESSAGE_I2C_TRANSACT_4;
   --      break;
   --      default:
   --        fatal_error("transact_i2c error. Must be one sensor port at a time. PORT_1, PORT_2, PORT_3, or PORT_4.");
   --    }
   --
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --    spi_array_out[2] = i2c_struct->address;
   --
   --    if(i2c_struct->length_read > LONGEST_I2C_TRANSFER){
   --      i2c_struct->length_read = LONGEST_I2C_TRANSFER;
   --    }
   --    spi_array_out[3] = i2c_struct->length_read;
   --    for(uint8_t p = 0; p < 4; p++){
   --      if(port & (1 << p)){
   --        I2CInBytes[p] = i2c_struct->length_read;
   --      }
   --    }
   --
   --    if(i2c_struct->length_write > LONGEST_I2C_TRANSFER){
   --      i2c_struct->length_write = LONGEST_I2C_TRANSFER;
   --    }
   --    spi_array_out[4] = i2c_struct->length_write;
   --
   --    for(uint8_t i = 0; i < i2c_struct->length_write; i++){
   --      spi_array_out[5 + i] = i2c_struct->buffer_write[i];
   --    }
   --
   --    return spi_transfer_array((5 + i2c_struct->length_write), spi_array_out, spi_array_in);
   --  }

   ----------------
   -- get_sensor --
   ----------------
   function get_sensor
     (this      : in out BrickPi3;
      port      : Interfaces.Unsigned_8;
      value_ptr : System.Address) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "get_sensor unimplemented");
      return raise Program_Error with "Unimplemented function get_sensor";
   end get_sensor;
   --  int BrickPi3::get_sensor(uint8_t port, void *value_ptr){
   --    uint8_t port_index;
   --    uint8_t msg_type;
   --    switch(port){
   --      case PORT_1:
   --        port_index = 0;
   --        msg_type = BPSPI_MESSAGE_GET_SENSOR_1;
   --      break;
   --      case PORT_2:
   --        port_index = 1;
   --        msg_type = BPSPI_MESSAGE_GET_SENSOR_2;
   --      break;
   --      case PORT_3:
   --        port_index = 2;
   --        msg_type = BPSPI_MESSAGE_GET_SENSOR_3;
   --      break;
   --      case PORT_4:
   --        port_index = 3;
   --        msg_type = BPSPI_MESSAGE_GET_SENSOR_4;
   --      break;
   --      default:
   --        fatal_error("get_sensor error. Must be one sensor port at a time. PORT_1, PORT_2, PORT_3, or PORT_4.");
   --    }
   --
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --
   --    uint8_t spi_transfer_length;
   --
   --    -- Determine the SPI transaction byte length based on the sensor type
   --    switch(SensorType[port_index]){
   --      case SENSOR_TYPE_TOUCH:
   --      case SENSOR_TYPE_TOUCH_NXT:
   --      case SENSOR_TYPE_TOUCH_EV3:
   --      case SENSOR_TYPE_NXT_ULTRASONIC:
   --      case SENSOR_TYPE_EV3_COLOR_REFLECTED:
   --      case SENSOR_TYPE_EV3_COLOR_AMBIENT:
   --      case SENSOR_TYPE_EV3_COLOR_COLOR:
   --      case SENSOR_TYPE_EV3_ULTRASONIC_LISTEN:
   --      case SENSOR_TYPE_EV3_INFRARED_PROXIMITY:
   --        spi_transfer_length = 7;
   --      break;
   --      case SENSOR_TYPE_NXT_LIGHT_ON:
   --      case SENSOR_TYPE_NXT_LIGHT_OFF:
   --      case SENSOR_TYPE_NXT_COLOR_RED:
   --      case SENSOR_TYPE_NXT_COLOR_GREEN:
   --      case SENSOR_TYPE_NXT_COLOR_BLUE:
   --      case SENSOR_TYPE_NXT_COLOR_OFF:
   --      case SENSOR_TYPE_EV3_GYRO_ABS:
   --      case SENSOR_TYPE_EV3_GYRO_DPS:
   --      case SENSOR_TYPE_EV3_ULTRASONIC_CM:
   --      case SENSOR_TYPE_EV3_ULTRASONIC_INCHES:
   --        spi_transfer_length = 8;
   --      break;
   --      case SENSOR_TYPE_CUSTOM:
   --      case SENSOR_TYPE_EV3_COLOR_RAW_REFLECTED:
   --      case SENSOR_TYPE_EV3_GYRO_ABS_DPS:
   --      case SENSOR_TYPE_EV3_INFRARED_REMOTE:
   --        spi_transfer_length = 10;
   --      break;
   --      case SENSOR_TYPE_NXT_COLOR_FULL:
   --        spi_transfer_length = 12;
   --      break;
   --      case SENSOR_TYPE_EV3_COLOR_COLOR_COMPONENTS:
   --      case SENSOR_TYPE_EV3_INFRARED_SEEK:
   --        spi_transfer_length = 14;
   --      break;
   --      case SENSOR_TYPE_I2C:
   --        spi_transfer_length = 6 + I2CInBytes[port_index];
   --      break;
   --
   --      -- Invalid or unsupported sensor type
   --      default:
   --        return SENSOR_STATE_NOT_CONFIGURED;
   --      break;
   --    }
   --
   --    -- Get the sensor value(s), and if error
   --    -- assign error to the value returned by spi_transfer_array, and if not 0:
   --    if(int error = spi_transfer_array(spi_transfer_length, spi_array_out, spi_array_in)){
   --      return error;
   --    }
   --    -- If the fourth byte received is not 0xA5
   --    if(spi_array_in[3] != 0xA5){
   --      return ERROR_SPI_RESPONSE;
   --    }
   --    -- If the sensor type is not what it should be
   --    if(!(spi_array_in[4] == SensorType[port_index] || (SensorType[port_index] == SENSOR_TYPE_TOUCH && (spi_array_in[4] == SENSOR_TYPE_TOUCH_NXT || spi_array_in[4] == SENSOR_TYPE_TOUCH_EV3)))){
   --      return ERROR_SENSOR_TYPE_MISMATCH;
   --    }
   --    -- If the sensor value(s) is not valid (still configuring the sensor, or error communicating with the sensor)
   --    if(spi_array_in[5] != SENSOR_STATE_VALID_DATA){
   --      return spi_array_in[5];
   --    }
   --
   --    -- Get some commonly used values
   --    uint8_t  raw_value_8 = spi_array_in[6];
   --    uint16_t raw_value_16 = ((spi_array_in[6] << 8) | spi_array_in[7]);
   --    uint16_t raw_value_16_2 = ((spi_array_in[8] << 8) | spi_array_in[9]);
   --
   --    -- For each sensor type, copy the value(s) into the corresponding structure value(s)
   --    if(SensorType[port_index] == SENSOR_TYPE_TOUCH ||
   --       SensorType[port_index] == SENSOR_TYPE_TOUCH_NXT ||
   --       SensorType[port_index] == SENSOR_TYPE_TOUCH_EV3){
   --      sensor_touch_t *Value = (sensor_touch_t*)value_ptr;
   --      Value->pressed = raw_value_8;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_ULTRASONIC){
   --      sensor_ultrasonic_t *Value = (sensor_ultrasonic_t*)value_ptr;
   --      Value->cm = raw_value_8;
   --      Value->inch = raw_value_8 / 2.54;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_COLOR_REFLECTED){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->reflected_red = raw_value_8;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_COLOR_AMBIENT){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->ambient = raw_value_8;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_COLOR_COLOR){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->color = raw_value_8;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_ULTRASONIC_LISTEN){
   --      sensor_ultrasonic_t *Value = (sensor_ultrasonic_t*)value_ptr;
   --      Value->presence = raw_value_8;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_INFRARED_PROXIMITY){
   --      sensor_infrared_t *Value = (sensor_infrared_t*)value_ptr;
   --      Value->proximity = raw_value_8;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_LIGHT_ON){
   --      sensor_light_t *Value = (sensor_light_t*)value_ptr;
   --      Value->reflected = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_LIGHT_OFF){
   --      sensor_light_t *Value = (sensor_light_t*)value_ptr;
   --      Value->ambient = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_COLOR_RED){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->reflected_red = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_COLOR_GREEN){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->reflected_green = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_COLOR_BLUE){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->reflected_blue = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_COLOR_OFF){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->ambient = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_GYRO_ABS){
   --      sensor_gyro_t *Value = (sensor_gyro_t*)value_ptr;
   --      Value->abs = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_GYRO_DPS){
   --      sensor_gyro_t *Value = (sensor_gyro_t*)value_ptr;
   --      Value->dps = raw_value_16;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_ULTRASONIC_CM){
   --      sensor_ultrasonic_t *Value = (sensor_ultrasonic_t*)value_ptr;
   --      Value->cm = raw_value_16 / 10.0;
   --      Value->inch = raw_value_16 / 25.4;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_ULTRASONIC_INCHES){
   --      sensor_ultrasonic_t *Value = (sensor_ultrasonic_t*)value_ptr;
   --      Value->cm = raw_value_16 * 0.254;
   --      Value->inch = raw_value_16 / 10.0;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_CUSTOM){
   --      sensor_custom_t *Value = (sensor_custom_t*)value_ptr;
   --      Value->adc1 = (((spi_array_in[8] & 0x0F) << 8) | spi_array_in[9]);
   --      Value->adc6 = (((spi_array_in[8] >> 4) & 0x0F) | (spi_array_in[7] << 4));
   --      Value->pin5 = (spi_array_in[6] & 0x01);
   --      Value->pin6 = ((spi_array_in[6] >> 1) & 0x01);
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_COLOR_RAW_REFLECTED){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->reflected_red = raw_value_16;
   --      --Value-> = raw_value_16_2; not sure what this value is
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_GYRO_ABS_DPS){
   --      sensor_gyro_t *Value = (sensor_gyro_t*)value_ptr;
   --      Value->abs = raw_value_16;
   --      Value->dps = raw_value_16_2;
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_INFRARED_REMOTE){
   --      sensor_infrared_t *Value = (sensor_infrared_t*)value_ptr;
   --      for(uint8_t v = 0; v < 4; v++){
   --        switch(spi_array_in[6 + v]){
   --          case 1:
   --            Value->remote[v] = REMOTE_BIT_RED_UP;
   --          break;
   --          case 2:
   --            Value->remote[v] = REMOTE_BIT_RED_DOWN;
   --          break;
   --          case 3:
   --            Value->remote[v] = REMOTE_BIT_BLUE_UP;
   --          break;
   --          case 4:
   --            Value->remote[v] = REMOTE_BIT_BLUE_DOWN;
   --          break;
   --          case 5:
   --            Value->remote[v] = REMOTE_BIT_RED_UP | REMOTE_BIT_BLUE_UP;
   --          break;
   --          case 6:
   --            Value->remote[v] = REMOTE_BIT_RED_UP | REMOTE_BIT_BLUE_DOWN;
   --          break;
   --          case 7:
   --            Value->remote[v] = REMOTE_BIT_RED_DOWN | REMOTE_BIT_BLUE_UP;
   --          break;
   --          case 8:
   --            Value->remote[v] = REMOTE_BIT_RED_DOWN | REMOTE_BIT_BLUE_DOWN;
   --          break;
   --          case 9:
   --            Value->remote[v] = REMOTE_BIT_BROADCAST;
   --          break;
   --          case 10:
   --            Value->remote[v] = REMOTE_BIT_RED_UP | REMOTE_BIT_RED_DOWN;
   --          break;
   --          case 11:
   --            Value->remote[v] = REMOTE_BIT_BLUE_UP | REMOTE_BIT_BLUE_DOWN;
   --          break;
   --          default:
   --            Value->remote[v] = 0;
   --          break;
   --        }
   --      }
   --    }else if(SensorType[port_index] == SENSOR_TYPE_NXT_COLOR_FULL){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->color           = spi_array_in[6];
   --      Value->reflected_red   = ((spi_array_in[ 7] << 2) | ((spi_array_in[11] >> 6) & 0x03));
   --      Value->reflected_green = ((spi_array_in[ 8] << 2) | ((spi_array_in[11] >> 4) & 0x03));
   --      Value->reflected_blue  = ((spi_array_in[ 9] << 2) | ((spi_array_in[11] >> 2) & 0x03));
   --      Value->ambient         = ((spi_array_in[10] << 2) | ( spi_array_in[11]       & 0x03));
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_COLOR_COLOR_COMPONENTS){
   --      sensor_color_t *Value = (sensor_color_t*)value_ptr;
   --      Value->reflected_red   = ((spi_array_in[ 6] << 8) | spi_array_in[ 7]);
   --      Value->reflected_green = ((spi_array_in[ 8] << 8) | spi_array_in[ 9]);
   --      Value->reflected_blue  = ((spi_array_in[10] << 8) | spi_array_in[11]);
   --      --Value-> = ((spi_array_in[12] << 8) | spi_array_in[13]); not sure what this value is
   --    }else if(SensorType[port_index] == SENSOR_TYPE_EV3_INFRARED_SEEK){
   --      sensor_infrared_t *Value = (sensor_infrared_t*)value_ptr;
   --      for(uint8_t v = 0; v < 4; v++){
   --        Value->heading [v] = spi_array_in[6 + (v * 2)];
   --        Value->distance[v] = spi_array_in[7 + (v * 2)];
   --      }
   --    }else if(SensorType[port_index] == SENSOR_TYPE_I2C){
   --      i2c_struct_t *Value = (i2c_struct_t*)value_ptr;
   --      for(uint8_t b = 0; b < I2CInBytes[port_index]; b++){
   --        Value->buffer_read[b] = spi_array_in[6 + b];
   --      }
   --    }
   --    return SENSOR_STATE_VALID_DATA;
   --  }

   ---------------------
   -- set_motor_power --
   ---------------------
   function set_motor_power
     (this  : in out BrickPi3;
      port  : Interfaces.Unsigned_8;
      power : Interfaces.Integer_8) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "set_motor_power unimplemented");
      return raise Program_Error with "Unimplemented function set_motor_power";
   end set_motor_power;
   --  int BrickPi3::set_motor_power(uint8_t port, int8_t power){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_SET_MOTOR_POWER;
   --    spi_array_out[2] = port;
   --    spi_array_out[3] = power;
   --    return spi_transfer_array(4, spi_array_out, spi_array_in);
   --  }

   ------------------------
   -- set_motor_position --
   ------------------------
   function set_motor_position
     (this     : in out BrickPi3;
      port     : Interfaces.Unsigned_8;
      position : Interfaces.Integer_32) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "set_motor_position unimplemented");
      return
      raise Program_Error with "Unimplemented function set_motor_position";
   end set_motor_position;
   --  int BrickPi3::set_motor_position(uint8_t port, int32_t position){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_SET_MOTOR_POSITION;
   --    spi_array_out[2] = port;
   --    spi_array_out[3] = ((position >> 24) & 0xFF);
   --    spi_array_out[4] = ((position >> 16) & 0xFF);
   --    spi_array_out[5] = ((position >> 8) & 0xFF);
   --    spi_array_out[6] = (position & 0xFF);
   --    return spi_transfer_array(7, spi_array_out, spi_array_in);
   --  }

   ---------------------------------
   -- set_motor_position_relative --
   ---------------------------------
   function set_motor_position_relative
     (this     : in out BrickPi3;
      port     : Interfaces.Unsigned_8;
      position : Interfaces.Integer_32) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "set_motor_position_relative unimplemented");
      return
      raise Program_Error
        with "Unimplemented function set_motor_position_relative";
   end set_motor_position_relative;
   --  int BrickPi3::set_motor_position_relative(uint8_t port, int32_t position){
   --    for(uint8_t p = 1; p <= PORT_D; p <<= 1){
   --      if(port & p){
   --        int32_t encoder = 0;
   --        -- assign error to the error value returned by get_motor_encoder, and if not 0:
   --        if(int error = get_motor_encoder(p, encoder)){
   --          return error;
   --        }
   --        -- assign error to the error value returned by get_motor_encoder, and if not 0:
   --        if(int error = set_motor_position(p, (encoder + position))){
   --          return error;
   --        }
   --      }
   --    }
   --    return ERROR_NONE;
   --  }


   -------------------
   -- set_motor_dps --
   -------------------
   function set_motor_dps
     (this : in out BrickPi3;
      port : Interfaces.Unsigned_8;
      dps  : Interfaces.Integer_16) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "set_motor_dps unimplemented");
      return raise Program_Error with "Unimplemented function set_motor_dps";
   end set_motor_dps;
   --  int BrickPi3::set_motor_dps(uint8_t port, int16_t dps){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_SET_MOTOR_DPS;
   --    spi_array_out[2] = port;
   --    spi_array_out[3] = ((dps >> 8) & 0xFF);
   --    spi_array_out[4] = (dps & 0xFF);
   --    return spi_transfer_array(5, spi_array_out, spi_array_in);
   --  }


   ----------------------
   -- set_motor_limits --
   ----------------------
   function set_motor_limits
     (this  : in out BrickPi3;
      port  : Interfaces.Unsigned_8;
      power : Interfaces.Unsigned_8;
      dps   : Interfaces.Unsigned_16) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "set_motor_limits unimplemented");
      return
      raise Program_Error with "Unimplemented function set_motor_limits";
   end set_motor_limits;
         --  int BrickPi3::set_motor_limits(uint8_t port, uint8_t power, uint16_t dps){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_SET_MOTOR_LIMITS;
   --    spi_array_out[2] = port;
   --    spi_array_out[3] = power;
   --    spi_array_out[4] = ((dps >> 8) & 0xFF);
   --    spi_array_out[5] = (dps & 0xFF);
   --    return spi_transfer_array(6, spi_array_out, spi_array_in);
   --  }



   ----------------------
   -- get_motor_status --
   ----------------------
   function get_motor_status
     (this     : in out BrickPi3;
      port     : Interfaces.Unsigned_8;
      state    : access Interfaces.Unsigned_8;
      power    : access Interfaces.Integer_8;
      position : access Interfaces.Integer_32;
      dps      : access Interfaces.Integer_16) return Integer is
   begin
      pragma
        Compile_Time_Warning (Standard.True, "get_motor_status unimplemented");
      return
      raise Program_Error with "Unimplemented function get_motor_status";
   end get_motor_status;
      --  int BrickPi3::get_motor_status(uint8_t port, uint8_t &state, int8_t &power, int32_t &position, int16_t &dps){
   --    uint8_t msg_type;
   --    switch(port){
   --      case PORT_A:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_A_STATUS;
   --      break;
   --      case PORT_B:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_B_STATUS;
   --      break;
   --      case PORT_C:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_C_STATUS;
   --      break;
   --      case PORT_D:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_D_STATUS;
   --      break;
   --      default:
   --        fatal_error("get_motor_status error. Must be one motor port at a time. PORT_A, PORT_B, PORT_C, or PORT_D.");
   --    }
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = msg_type;
   --    -- assign error to the value returned by spi_transfer_array, and if not 0:
   --    if(int error = spi_transfer_array(12, spi_array_out, spi_array_in)){
   --      return error;
   --    }
   --
   --    if(spi_array_in[3] != 0xA5){
   --      return ERROR_SPI_RESPONSE;
   --    }
   --
   --    state    = spi_array_in[4];
   --    power    = spi_array_in[5];
   --    position = ((spi_array_in[6] << 24) | (spi_array_in[7] << 16) | (spi_array_in[8] << 8) | spi_array_in[9]);
   --    dps      = ((spi_array_in[10] << 8) | spi_array_in[11]);
   --
   --    return ERROR_NONE;
   --  }


   --------------------------
   -- offset_motor_encoder --
   --------------------------
   function offset_motor_encoder
     (this     : in out BrickPi3;
      port     : Interfaces.Unsigned_8;
      position : Interfaces.Integer_32) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "offset_motor_encoder unimplemented");
      return
      raise Program_Error with "Unimplemented function offset_motor_encoder";
   end offset_motor_encoder;
   --  int BrickPi3::offset_motor_encoder(uint8_t port, int32_t position){
   --    spi_array_out[0] = Address;
   --    spi_array_out[1] = BPSPI_MESSAGE_OFFSET_MOTOR_ENCODER;
   --    spi_array_out[2] = port;
   --    spi_array_out[3] = ((position >> 24) & 0xFF);
   --    spi_array_out[4] = ((position >> 16) & 0xFF);
   --    spi_array_out[5] = ((position >> 8) & 0xFF);
   --    spi_array_out[6] = (position & 0xFF);
   --    return spi_transfer_array(7, spi_array_out, spi_array_in);
   --  }


   -------------------------
   -- reset_motor_encoder --
   -------------------------
   function reset_motor_encoder
     (this : in out BrickPi3; port : Interfaces.Unsigned_8) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "reset_motor_encoder unimplemented");
      return
      raise Program_Error with "Unimplemented function reset_motor_encoder";
   end reset_motor_encoder;
   --  int BrickPi3::reset_motor_encoder(uint8_t port){
   --    int32_t value;
   --    int error = 1;
   --    for(uint8_t p = 1; p <= PORT_D; p <<= 1){
   --      if(port & p){
   --        error = reset_motor_encoder(p, value);
   --        if(error){
   --          return error;
   --        }
   --      }
   --    }
   --    if(error){
   --      fatal_error("reset_motor_encoder error. Must be one or more motor ports. PORT_A, PORT_B, PORT_C, and/or PORT_D.");
   --    }
   --    return ERROR_NONE;
   --  }


   -------------------------
   -- reset_motor_encoder --
   -------------------------
   function reset_motor_encoder
     (this  : in out BrickPi3;
      port  : Interfaces.Unsigned_8;
      value : access Interfaces.Integer_32) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "reset_motor_encoder unimplemented");
      return
      raise Program_Error with "Unimplemented function reset_motor_encoder";
   end reset_motor_encoder;
   --  int BrickPi3::reset_motor_encoder(uint8_t port, int32_t &value){
   --    value = 0;
   --    -- assign error to the error value returned by get_motor_encoder, and if not 0:
   --    if(int error = get_motor_encoder(port, value)){
   --      return error;
   --    }
   --    return offset_motor_encoder(port, value);
   --  }


   -----------------------
   -- set_motor_encoder --
   -----------------------
   function set_motor_encoder
     (this  : in out BrickPi3;
      port  : Interfaces.Unsigned_8;
      value : Interfaces.Integer_32) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "set_motor_encoder unimplemented");
      return
      raise Program_Error with "Unimplemented function set_motor_encoder";
   end set_motor_encoder;
   --  int BrickPi3::set_motor_encoder(uint8_t port, int32_t value){
   --    int32_t enc_value = 0;
   --    -- assign error to the error value returned by get_motor_encoder, and if not 0:
   --    if(int error = get_motor_encoder(port, enc_value)){
   --      return error;
   --    }
   --    return offset_motor_encoder(port, (enc_value - value));
   --  }
   --
   --  int32_t BrickPi3::get_motor_encoder(uint8_t port){
   --    int32_t value;
   --    get_motor_encoder(port, value);
   --    return value;
   --  }


   -----------------------
   -- get_motor_encoder --
   -----------------------
   function get_motor_encoder
     (this  : in out BrickPi3;
      port  : Interfaces.Unsigned_8;
      value : access Interfaces.Integer_32) return Integer is
   begin
      pragma
        Compile_Time_Warning
          (Standard.True, "get_motor_encoder unimplemented");
      return
      raise Program_Error with "Unimplemented function get_motor_encoder";
   end get_motor_encoder;

   --  int BrickPi3::get_motor_encoder(uint8_t port, int32_t &value){
   --    uint8_t msg_type;
   --    switch(port){
   --      case PORT_A:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_A_ENCODER;
   --      break;
   --      case PORT_B:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_B_ENCODER;
   --      break;
   --      case PORT_C:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_C_ENCODER;
   --      break;
   --      case PORT_D:
   --        msg_type = BPSPI_MESSAGE_GET_MOTOR_D_ENCODER;
   --      break;
   --      default:
   --        fatal_error("get_motor_encoder error. Must be one motor port at a time. PORT_A, PORT_B, PORT_C, or PORT_D.");
   --    }
   --    uint32_t Value;
   --    int res = spi_read_32(msg_type, Value);
   --    value = Value;
   --    return res;
   --  }


    ---------------
   -- reset_all --
   ---------------
   function reset_all (this : in out BrickPi3) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "reset_all unimplemented");
      return raise Program_Error with "Unimplemented function reset_all";
   end reset_all;
   --  int BrickPi3::reset_all(){
   --    int res1 = set_sensor_type(PORT_1 + PORT_2 + PORT_3 + PORT_4, SENSOR_TYPE_NONE);
   --    int res2 = set_motor_power(PORT_A + PORT_B + PORT_C + PORT_D, MOTOR_FLOAT);
   --    int res3 = set_motor_limits(PORT_A + PORT_B + PORT_C + PORT_D, 0, 0);
   --    int res4 = set_led(-1);
   --    if(res1){
   --      return res1;
   --    }else if(res2){
   --      return res2;
   --    }else if(res3){
   --      return res3;
   --    }else if(res4){
   --      return res4;
   --    }
   --    return ERROR_NONE;
   --  }
end BrickPi3;
