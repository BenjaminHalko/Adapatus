/// @desc Setup Up Rewards

EnableLive;

global.gameState = GameState.REWARD;

// Config
x = ResWidth / 2;
y = ResHeight / 2 - oToolbar.toolbarBaseHeight / 2;

// Non - Config
menus = [];
alpha = 0;
bgAlpha = 0;
xScale = 0;

active = true;
done = false;