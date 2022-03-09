package;
import raylib.TestRaylib;
import utest.Runner;
import utest.ui.Report;

class TestAll {
	public static function main():Void {
		var runner = new Runner();
		runner.addCase(new TestRaylib());
		Report.create(runner);
		runner.run();
	}
}
