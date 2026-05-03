--  /*
--   *  Released under the MIT license (http://choosealicense.com/licenses/mit/).
--   *
--   *  This code is an example for reading BrickPi3 information
--   *
--   *  Results: Print information about the attached BrickPi3.
--   *
--   *  Example compile command:
--   *    gprbuild  info.adb
--   *  Example run command:
--   *    sudo ./bin/info
--   *
--   */

with BrickPi3;
with Ada.Text_IO;

procedure Info is
   BP : BrickPi3.BrickPi3;
   -- // Create a BrickPi3 instance with the default address of 1
begin
   --    //BrickPi3_set_address(1, ""); // set BrickPi3 with any id to the default address of 1
   --    //BrickPi3_set_address(7, "192A0F96514D4D5438202020FF080C23"); // set BrickPi3 with id 192A0F96514D4D5438202020FF080C23 to address 7
   Ada.Text_Io.Put_Line ("Manufacturer    : " & BP.Get_Manufacturer);
   Ada.Text_Io.Put_Line ("Board           : " & BP.get_board);
   Ada.Text_Io.Put_Line ("Serial Number   : " & BP.get_id);
   Ada.Text_Io.Put_Line ("Hardware version: " & BP.Get_hardware_Version);
   Ada.Text_Io.Put_Line ("Firmware version: " & BP.Get_firmware_Version);
   Ada.Text_Io.Put_Line ("Battery voltage : " & BP.Get_Voltage_Battery'Image);
   Ada.Text_Io.Put_Line ("9v voltage      : " & BP.get_voltage_9v'Image);
   Ada.Text_Io.Put_Line ("5v voltage      : " & BP.get_voltage_5v'Image);
   Ada.Text_Io.Put_Line ("3.3v voltage    : " & BP.get_voltage_3v3'Image);
end Info;
