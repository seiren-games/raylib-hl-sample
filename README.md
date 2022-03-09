# raylib-hl-sample
raylib on hashlink

# How to use
In windows-os.

1. Download [raylib source](https://github.com/raysan5/raylib), and put it in `hashlink-extension/lib`
1. Run vscode from vcvars64.bat: Double-click `start-vscode-from-vcvars64.bat`
1. Build and run: vscode menu - `Terminal` - `Run Build Task...` or Ctrl+Shift+B
1. Rename the raylib function (identifier) that collided with another function to Raylib****.
Unfortunately, raylib doesn't have a prefix: https://github.com/raysan5/raylib/discussions/2057#discussioncomment-1486752

### Thanks
[HashLink-native-extension-tutorial](https://github.com/HaxeFoundation/hashlink/wiki/HashLink-native-extension-tutorial)