package;

import sys.io.File;
import haxe.Json;
import haxe.io.Path;
import sys.FileSystem;

typedef RaylibApi = {
	structs:Array<Identifier>,
	enums:Array<Identifier>,
	defines:Array<Identifier>,
	functions:Array<Identifier>
}

typedef Identifier = {
	name:String
}

class RunSetup {
	final tmpDir:String;
	static function main():Void {
		new RunSetup();
	}

	function new() {
		trace("Run setup.");
		tmpDir = '${Sys.getEnv("tmp")}\\{B435D3AC-8E5A-49DF-BFAB-976AFE917694}';
		if (!FileSystem.exists(tmpDir)) {
			FileSystem.createDirectory(tmpDir);
			Sys.command('git -C "${tmpDir}" clone https://github.com/raysan5/raylib.git');
		}

		final sourceRaylibDir:String = '${tmpDir}\\raylib\\src';
		final destRaylibDir:String = "lib\\raylib\\src";
		if (!FileSystem.exists(destRaylibDir)) {
			FileSystem.createDirectory(destRaylibDir);
			if (false) FileSystem.rename('${tmpDir}/raylib/src', "lib/raylib/src"); // not work
			Sys.command('xcopy /s /e /i "${sourceRaylibDir}" ${destRaylibDir}');
		}
		
		addPrefix();
	}

	function addPrefix():Void {
		final raylibSourceFiles:Array<String> = getDirFiles("lib/raylib").filter(function (file:String):Bool {
			return ["c", "h"].contains(Path.extension(file));
		});

		final raylibApi:RaylibApi = Json.parse(File.getContent(tmpDir + "/raylib/parser/raylib_api.json"));
		
		final identifiers:Array<Identifier> = raylibApi.structs
			.concat(raylibApi.enums)
			.concat(raylibApi.defines)
			.concat(raylibApi.functions);
		for (raylibSourceFile in raylibSourceFiles) {
			var content:String = File.getContent(raylibSourceFile);
			for (identifier in identifiers) {
				trace(identifier.name, raylibSourceFile);
				final eReg:EReg = new EReg("\\b" + identifier.name + "\\b", "g");
				content = eReg.replace(content, "Raylib" + identifier.name);
			}
			File.saveContent(raylibSourceFile, content);
		}
	}

	function getDirFiles(dirPath:String = ".\\", ?fileList:Array<String>, recursive:Bool = true):Array<String> {
		if (fileList == null) {
			fileList = [];
		}
		if (!FileSystem.exists(dirPath)) {
			throw "not found: " + dirPath;
		} else if (!FileSystem.isDirectory(dirPath)) {
			throw "not dir: " + dirPath;
		}
		final paths:Array<String> = FileSystem.readDirectory(dirPath);
		for (path in paths) {
			path = Path.join([dirPath, path]);
			fileList.push(path);
			if (FileSystem.isDirectory(path) && recursive) {
				getDirFiles(path, fileList);
			}
		}
		return fileList;
	}
}
