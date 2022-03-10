# raylib-hl-sample
Raylib on hashlink  
This is for a hashlink-extension sample.  
Raylib-api is only for running the sample.  

<img width="401" alt="2022-03-09_23-13-40" src="https://user-images.githubusercontent.com/35370168/157459050-692ef1f3-13e9-4c7c-a076-3a56964f6c57.png">

# How to try
In windows-os.

1. Download [raylib source](https://github.com/raysan5/raylib), and put it in `hashlink-extension/lib`
1. Edit path: Match your visual studio version.
	- [vcvars64.bat path](https://github.com/seiren-games/raylib-hl-sample/blob/8c5995dc853e1b96e47320aa242e9f726569159c/start-vscode-from-vcvars64.bat#L3)
	- [compilerPath](https://github.com/seiren-games/raylib-hl-sample/blob/9a54b821e89da139cdd4c5b3050bac4caa04a5f5/hashlink-extension/.vscode/c_cpp_properties.json#L19)
1. Run `start-vscode-from-vcvars64.bat`
1. Build and run: vscode menu - `Terminal` - `Run Build Task...` or Ctrl+Shift+B
1. Function(identifier) names collide and error occurs.  
Rename the collided functions in the raylib source files(`hashlink-extension/lib/raylib/src`) to `Raylib****`.  
Unfortunately, raylib doesn't have a prefix: https://github.com/raysan5/raylib/discussions/2057#discussioncomment-1486752
1. Repeat 4.~5.

### Thanks
[HashLink-native-extension-tutorial](https://github.com/HaxeFoundation/hashlink/wiki/HashLink-native-extension-tutorial)