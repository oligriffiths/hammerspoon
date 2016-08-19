require "window_arrangement";

-- Setup app config
addAppConfig('com.apple.TextEdit', windowCenter6);
addAppConfig('com.apple.TextEdit', windowCenter8, 1, 2);

addAppConfig('com.jetbrains.PhpStorm', windowMaximize);

addAppConfig('com.google.Chrome', windowMaximize, 1);
addAppConfig('com.google.Chrome', windowLeft10, 2, 2);

addAppConfig('com.twitter.twitter-mac', windowRight4);
addAppConfig('com.twitter.twitter-mac', windowRight2, 2, 2);

addAppConfig('com.troupe.gitter.mac.Gitter', windowMaximize, 1, 1);
addAppConfig('com.troupe.gitter.mac.Gitter', windowCenter10, 1, 2);
addAppConfig('com.troupe.gitter.mac.Gitter', windowMaximize, { x = 0, y = 1 }, 3);

addAppConfig('it.bloop.airmail.beta11', windowMaximize);

addAppConfig('com.apple.mail', windowMaximize);
addAppConfig('com.apple.mail', windowCenter8, 1, 2);

addAppConfig('com.apple.Terminal', windowCenter10);
addAppConfig('com.apple.Terminal', windowCenter8, 1, 2);

addAppConfig('com.googlecode.iterm2', windowCenter10);
addAppConfig('com.googlecode.iterm2', windowCenter8, 1, 2);

addAppConfig('com.tinyspeck.slackmacgap', windowMaximize, 1, 1);
addAppConfig('com.tinyspeck.slackmacgap', windowCenter10, 1, 2);
addAppConfig('com.tinyspeck.slackmacgap', windowMaximize, { x = 0, y = 1 }, 3);

addAppConfig('com.spotify.client', windowCenter10);
