
with AUnit.Test_Cases;
package Brickpi3.Test.Simple is
   use AUnit;
   type Test_Case is new AUnit.Test_Cases.Test_Case with record
      null;
   end record;
   
   procedure Register_Tests (Test : in out Test_Case);
   function Name (Test : Test_Case) return Message_String;
end Brickpi3.Test.Simple;
