require 'window_functions';

-- Setup timer to stash every minute
hs.timer.doEvery(60, stashWindowPositions);

-- Setup screen watcher to restore window positions
screenWatcher = hs.screen.watcher.new(function()
    hs.alert('Screen configuration changed');
    if restoreWindowPositions(true) == false then
        arrangeApps(apps, true);
        stashWindowPositions();
    end;
end);
screenWatcher:start()

-- Setup hotkey bindings
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "l", listApps);
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "a", function()
    arrangeApps(apps, true);
    stashWindowPositions();
end);
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
    restoreWindowPositions(true);
end);
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "s", function()
    stashWindowPositions(true);
end);

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ".", function()
    scaleWindow(hs.window.frontmostWindow(), 50);
end);

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ",", function()
    scaleWindow(hs.window.frontmostWindow(), -50);
end);


-- load config on save
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
