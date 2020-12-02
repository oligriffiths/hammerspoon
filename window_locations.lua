require "window_arrangement";

-- Setup app config
addAppConfig('com.apple.TextEdit', windowCenter6x6, 1, 1);
addAppConfig('com.apple.TextEdit', windowCenter8x8, 2, 1);

addAppConfig('com.jetbrains.PhpStorm', windowMaximize, 1, 1);
addAppConfig('com.jetbrains.PhpStorm', windowLeft6_12, 2, 1);

addAppConfig('com.google.Chrome', windowMaximize, 2, 1);
addAppConfig('com.google.Chrome', windowMaximize, 2, 2);
addAppConfig('com.google.Chrome', windowLeft9_12, 3, 2);

addAppConfig('com.tapbots.Tweetbot3Mac', windowRight4_12, 1, 1);
addAppConfig('com.tapbots.Tweetbot3Mac', windowRight2_12, 2, 1);

addAppConfig('com.troupe.gitter.mac.Gitter', windowMaximize, 1, 1);
addAppConfig('com.troupe.gitter.mac.Gitter', windowCenter10x10, 2, 1);
addAppConfig('com.troupe.gitter.mac.Gitter', windowMaximize, 3, { x = 0, y = 1 });

addAppConfig('com.apple.iChat', windowRight3_12, 1, 1);
addAppConfig('com.apple.iChat', { x = 9,  y = 2,  w = 3,  h = 10 }, 2, 1);

addAppConfig('com.apple.iCal', windowMaximize, 1, 1);
addAppConfig('com.apple.iCal', windowCenter6x10, 2, 1);

addAppConfig('com.apple.mail', windowMaximize, 1, 1);
addAppConfig('com.apple.mail', windowCenter6x10, 2, 1);

addAppConfig('com.francescodilorenzo.Mailbro', windowMaximize, 1, 1);
addAppConfig('com.francescodilorenzo.Mailbro', windowCenter6x10, 2, 1);

addAppConfig('com.apple.Terminal', windowCenter10x10, 1, 1);
addAppConfig('com.apple.Terminal', windowCenter6x8, 2, 1);

addAppConfig('com.googlecode.iterm2', windowCenter10x10, 1, 1);
addAppConfig('com.googlecode.iterm2', windowCenter6x8, 2, 1);

addAppConfig('com.tinyspeck.slackmacgap', windowMaximize, 1, 1);
addAppConfig('com.tinyspeck.slackmacgap', windowRight6_12, 2, 1);
addAppConfig('com.tinyspeck.slackmacgap', windowMaximize, 3, { x = 0, y = 1 });

addAppConfig('com.spotify.client', windowCenter10x10, 1, 1);
