@rem Move location of the batch file itself.
cd /d %~dp0
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
code .vscode/raylib-hl-sample.code-workspace
