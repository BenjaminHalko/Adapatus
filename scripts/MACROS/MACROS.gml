#macro ResWidth 400
#macro ResHeight 224

#macro ToolbarHeight 24

#macro CursorSize max(min(window_get_width()/ResWidth,window_get_height()/ResHeight),0.5)

// Debug
#macro DebugMode true
#macro EnableLive if live_call() return live_result