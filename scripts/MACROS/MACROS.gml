#macro ResWidth 480
#macro ResHeight 270

#macro CursorSize (global.hasNativeCursor ? max(min(window_get_width()/ResWidth, window_get_height()/ResHeight),0.5) : 1)

// Debug
#macro DebugMode true
#macro EnableLive if live_call() return live_result