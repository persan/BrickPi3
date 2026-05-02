import GPS
from gs_utils import *


class Console_Process(GPS.Console, GPS.Process):
    def on_output(self, matched, unmatched):
        self.write(unmatched + matched)

    def on_exit(self, status, unmatched_output):
        pass  # Might already have been destroyed

    def on_input(self, input):
        self.send(input)

    def on_destroy(self):
        self.kill()  # Will call on_exit

    def __init__(self, command):
        GPS.Console.__init__(
            self, "Remote",
            on_input=Console_Process.on_input,
            on_destroy=Console_Process.on_destroy,
            force=True)
        GPS.Process.__init__(
            self, command, ".+",
            on_exit=Console_Process.on_exit,
            on_match=Console_Process.on_output)


@interactive("Editor",
             menu="/Edit/Foo",
             toolbar="main",
             name="Brick_Compile",
             description="Does a remote comiliation on the brick")
def compile_on_brick():
    Console_Process(["git", "commit", "-m", "Working", "-a"])
    Console_Process(["ssh", "brickpi", "make", "-C", "BrickPi3/Software/Ada/test"])
