@rem Move location of the batch file itself.
cd /d %~dp0
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
code .vscode/raylib-hl-sample.code-workspace
