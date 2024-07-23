#macro ResWidth 480
#macro ResHeight 270

#macro CursorSize max(min(window_get_width()/ResWidth, window_get_height()/ResHeight),0.5)

// Debug
#macro DebugMode true
#macro EnableLive if live_call() return live_result