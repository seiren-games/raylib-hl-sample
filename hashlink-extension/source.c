#define HL_NAME(n) raylib_##n

#include <stdbool.h>
#include <hl.h>
#include <raylib.h>

HL_PRIM void HL_NAME(init_window)(int width, int height, const vbyte *title)
{
	RaylibInitWindow(width, height, (char *)title);
}
DEFINE_PRIM(_VOID, init_window, _I32 _I32 _BYTES);

HL_PRIM bool HL_NAME(window_should_close)()
{
	return RaylibWindowShouldClose();
}
DEFINE_PRIM(_BOOL, window_should_close, _NO_ARG);

HL_PRIM void HL_NAME(begin_drawing)()
{
	RaylibBeginDrawing();
}
DEFINE_PRIM(_VOID, begin_drawing, _NO_ARG);

HL_PRIM void HL_NAME(end_drawing)()
{
	RaylibEndDrawing();
}
DEFINE_PRIM(_VOID, end_drawing, _NO_ARG);

HL_PRIM void HL_NAME(close_window)()
{
	RaylibCloseWindow();
}
DEFINE_PRIM(_VOID, close_window, _NO_ARG);

HL_PRIM void HL_NAME(clear_background)(vdynamic *color_setting)
{
	RaylibColor color;
	color.r = hl_dyn_geti(color_setting, hl_hash_utf8("r"), &hlt_i32);
	color.g = hl_dyn_geti(color_setting, hl_hash_utf8("g"), &hlt_i32);
	color.b = hl_dyn_geti(color_setting, hl_hash_utf8("b"), &hlt_i32);
	color.a = hl_dyn_geti(color_setting, hl_hash_utf8("a"), &hlt_i32);
	RaylibClearBackground(color);
}
DEFINE_PRIM(_VOID, clear_background, _DYN);

HL_PRIM void HL_NAME(draw_text)(const vbyte *text, int posX, int posY, int fontSize, vdynamic *color_setting)
{
	RaylibColor color;
	color.r = hl_dyn_geti(color_setting, hl_hash_utf8("r"), &hlt_i32);
	color.g = hl_dyn_geti(color_setting, hl_hash_utf8("g"), &hlt_i32);
	color.b = hl_dyn_geti(color_setting, hl_hash_utf8("b"), &hlt_i32);
	color.a = hl_dyn_geti(color_setting, hl_hash_utf8("a"), &hlt_i32);
	RaylibDrawText((char *)text, posX, posY, fontSize, color);
}
DEFINE_PRIM(_VOID, draw_text, _BYTES _I32 _I32 _I32 _DYN);
