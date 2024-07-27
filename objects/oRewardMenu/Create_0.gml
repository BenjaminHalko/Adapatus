/// @desc Setup Up Rewards

EnableLive;

global.gameState = GameState.REWARD;

// Config
itemSpacing = 8;
textboxMarginX = 10;
textboxMarginY = 10;
x = ResWidth / 2;
y = ResHeight / 2 - oToolbar.toolbarBaseHeight / 2;

// Non - Config
choiceQueue = [];
textboxWidth = 0;
textboxHeight = 0;
textboxMinWidth = 0;
textboxBaseSize = sprite_get_width(sWindowBG);
alpha = 0;
bgAlpha = 0;
xScale = 0;
elementHovered = -1;

active = true;
done = false;