with AUnit;
with GNAT;
with GNAT.Source_Info;

package body Brickpi3.Test.Simple is

   ----------
   -- Name --
   ----------
   Test_Name : constant String := GNAT.Source_Info.Enclosing_Entity;
   Test_Id   : constant String := "";

   function Name (Test : Test_Case) return Message_String is
   begin
      return
        Format (Test_Name & (if Test_Id /= "" then ":" & Test_Id else ""));
   end Name;

   procedure Dummy_Test (T : in out AUnit.Test_Cases.Test_Case'Class) is
   begin
      null;
   end;
   --------------------
   -- Register_Tests --
   --------------------
   procedure Register_Tests (Test : in out Test_Case) is
   begin
      AUnit.Test_Cases.Registration.Register_Routine
        (Test, Dummy_Test'Access, "Dummy_Test");
   end Register_Tests;

end Brickpi3.Test.Simple;
