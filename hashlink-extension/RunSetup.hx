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
	static function main():Void {
		trace("Run setup.");
		final tmpDir:String = '${Sys.getEnv("tmp")}/{B435D3AC-8E5A-49DF-BFAB-976AFE917694}';
		if (!FileSystem.exists(tmpDir)) {
			FileSystem.createDirectory(tmpDir);
			Sys.command('git -C "${tmpDir}" clone https://github.com/raysan5/raylib.git');
		}

		if (!FileSystem.exists("lib/raylib")) {
			FileSystem.createDirectory("lib/raylib");
			if (false) FileSystem.rename("${tmpDir}/raylib/src", "lib/raylib/src"); // not work
			Sys.command('xcopy "${tmpDir}/raylib/src" lib/raylib');
		}
		
		addPrefix();
	}

	static function addPrefix():Void {
		final raylibSourceFiles:Array<String> = getDirFiles("lib/raylib").filter(function (file:String):Bool {
			return [".c", ".h"].contains(Path.extension(file));
		});
		trace(raylibSourceFiles);

		final raylibApi:RaylibApi = Json.parse(File.getContent("lib/raylib/parser/raylib_api.json"));
		trace(raylibApi);
	}

	static function getDirFiles(dirPath:String = ".\\", ?fileList:Array<String>, recursive:Bool = true):Array<String> {
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
