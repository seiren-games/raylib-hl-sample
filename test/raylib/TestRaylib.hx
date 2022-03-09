package raylib;

import utest.Assert;
import utest.ITest;
import raylib.Raylib;

class TestRaylib implements ITest {
	public function new() {}

	public function test():Void {
		Raylib.initWindow(800, 450, @:privateAccess "raylib [core] example - basic window".toUtf8());
		while (!Raylib.windowShouldClose()) {
			Raylib.beginDrawing();
			Raylib.clearBackground({r:245, g:245, b:245, a:245});
			Raylib.drawText(
				@:privateAccess "Congrats! You created your first window!".toUtf8(),
				190,
				200,
				20,
				{r:200, g:200, b:200, a:255}
			);
			Raylib.endDrawing();
		}
		Raylib.closeWindow();

		Assert.pass();
	}
}
