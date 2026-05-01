with AUnit.Reporter.Text;
with AUnit.Run;
with AUnit.Test_Suites;
with Brickpi3.Test.Test_Suit_Driver_Generic;

procedure Brickpi3.Test.Test_Case_Driver_Generic is
   S  : aliased AUnit.Test_Suites.Test_Suite;
   TC : aliased Test_Case;

   function TS return AUnit.Test_Suites.Access_Test_Suite
   is (S'Unrestricted_Access);

   procedure Run is new Standard.Brickpi3.Test.Test_Suit_Driver_Generic (TS);

begin
   S.Add_Test (TC'Unchecked_Access);
   Run;
end Brickpi3.Test.Test_Case_Driver_Generic;
