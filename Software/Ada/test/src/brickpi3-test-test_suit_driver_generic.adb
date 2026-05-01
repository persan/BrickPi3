with AUnit.Reporter.Text;
with AUnit.Run;

procedure Brickpi3.Test.Test_Suit_Driver_Generic is
   Reporter : AUnit.Reporter.Text.Text_Reporter;
   procedure Run is new AUnit.Run.Test_Runner (Suit);
begin
   Run (Reporter);
end Brickpi3.Test.Test_Suit_Driver_Generic;
