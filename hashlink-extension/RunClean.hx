package;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

using Lambda;

class RunClean {
	// It is dangerous to derive, so specify it.
	static inline final buildOutputDir:String = "x64";

	static function main():Void {
		trace("Run clean.");
		final vcxproj:Xml = Xml.parse(File.getContent("raylib-hl.vcxproj")).firstElement();
		final projectGuid:String = getProjectGuid(vcxproj);

		// Move to the tmp folder. Do not delete for safety.
		final dateTimeStr:String = DateTools.format(Date.now(), "%Y-%m-%d_%H-%M-%S");
		final destDir:String = Path.normalize(Sys.getEnv("tmp") + "/" + projectGuid + "/" + dateTimeStr);
		FileSystem.createDirectory(destDir);

		if (FileSystem.exists(buildOutputDir)) {
			trace('remove: ./${buildOutputDir}/');
			FileSystem.rename(buildOutputDir, destDir + "/" + buildOutputDir);
		}
		if (FileSystem.exists(".vs")) {
			trace("remove: ./.vs/");
			FileSystem.rename(".vs", destDir + "/.vs");
		}

		trace("Finish.");
	}

	static function getProjectGuid(vcxproj:Xml):String {
		for (element in vcxproj.elementsNamed("PropertyGroup")) {
			for (element in element.elementsNamed("ProjectGuid")) {
				return element.firstChild().nodeValue;
			}
		};
		throw "Not found projectGuid in vcxproj.";
	}
}
