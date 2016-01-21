require 'functions';

--[[
 -
 - App Arrangement
 -
 ]]
apps = {};

--[[
 Define Grid
--]]

hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 12
hs.grid.GRIDHEIGHT = 12

-- Pre-defined grid layouts
windowMaximize = { x = 0,  y = 0,  w = 12,  h = 12 };
windowCenter6 = { x = 3,  y = 3,  w = 6,  h = 6 };
windowCenter8 = { x = 2,  y = 2,  w = 8,  h = 8 };
windowCenter10 = { x = 1,  y = 1,  w = 10,  h = 10 };
windowLeft2 = { x = 0,  y = 0,  w = 2,  h = 12 };
windowLeft3 = { x = 0,  y = 0,  w = 3,  h = 12 };
windowLeft4 = { x = 0,  y = 0,  w = 4,  h = 12 };
windowLeft6 = { x = 0,  y = 0,  w = 6,  h = 12 };
windowLeft8 = { x = 0,  y = 0,  w = 8,  h = 12 };
windowLeft9 = { x = 0,  y = 0,  w = 9,  h = 12 };
windowLeft10 = { x = 0,  y = 0,  w = 10,  h = 12 };
windowRight2 = { x = 10,  y = 0,  w = 2,  h = 12 };
windowRight3 = { x = 9,  y = 0,  w = 3,  h = 12 };
windowRight4 = { x = 8,  y = 0,  w = 4,  h = 12 };
windowRight6 = { x = 6,  y = 0,  w = 6,  h = 12 };
windowRight8 = { x = 4,  y = 0,  w = 8,  h = 12 };
windowRight9 = { x = 3,  y = 0,  w = 9,  h = 12 };
windowRight10 = { x = 2,  y = 0,  w = 10,  h = 12 };

function arrangeApps(apps, alert)

    print('--------');
    print('-- Arranging apps to pre-defined locations --');

    for i,app in pairs(apps) do
        arrangeApp(i, app);
    end

    if (alert) then
        hs.alert('Window arrangement reset');
    end;

    print('--------');
end

function arrangeApp(id, appConfig)

    if appConfig.id == nil then
        hs.alert('The app definition: ' .. id .. ' is missing an "id" property');
        return;
    end;

    if appConfig.windows == nil then
        hs.alert('The app definition: ' .. id .. ' is missing a "windows" property');
        return;
    end;

    for i,app in pairs(hs.application.applicationsForBundleID(appConfig.id)) do
        arrangeWindows(app, appConfig);
    end
end

function arrangeWindows(app, config)

    local screenCount = tablelength(hs.screen.allScreens());

    for i,window in ipairs(app:allWindows()) do

        local windowConfig = findwindow(config.windows, screenCount);

        if (windowConfig) then

            print(
                'Arranging window: ' .. app:name() .. ' - ' .. window:title() ..
                ' at grid (' .. windowConfig.x .. ', ' .. windowConfig.y .. ', ' .. windowConfig.w .. ', ' .. windowConfig.h .. ')'
            );

            if (windowConfig.s) then
                hs.grid.set(window, windowConfig, {x = windowConfig.s, y = 0});
            else
                hs.grid.set(window, windowConfig);
            end;

        end;

    end
end

function findwindow(windows, index)

    if (index < 0) then
        return nil;
    end;

    if windows[index] then
        return windows[index];
    end;

    return findwindow(windows, index-1);
end

function addAppConfig(id, windows, screen)

    -- Allow a single window to be passed
    if (windows and windows[1] == nil) then
        windows = { windows }
    end;

    -- If screen provided, set on all windows
    if screen ~= nil then
        for i,window in ipairs(windows) do
            window.s = screen;
        end;
    end;

    if apps[id] == nil then
        apps[id] = {id = id, windows = windows};
    else
        for i,window in ipairs(windows) do
            table.insert(apps[id].windows, window)
        end;
    end;

end