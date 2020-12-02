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
windowCenter6x6 = { x = 3,  y = 3,  w = 6,  h = 6 };
windowCenter6x8 = { x = 3,  y = 2,  w = 6,  h = 8 };
windowCenter6x10 = { x = 3,  y = 1,  w = 6,  h = 10 };
windowCenter8x8 = { x = 2,  y = 2,  w = 8,  h = 8 };
windowCenter8x10 = { x = 2,  y = 1,  w = 8,  h = 10 };
windowCenter10x10 = { x = 1,  y = 1,  w = 10,  h = 10 };

windowLeft2_12 = { x = 0,  y = 0,  w = 2,  h = 12 };
windowLeft3_12 = { x = 0,  y = 0,  w = 3,  h = 12 };
windowLeft4_12 = { x = 0,  y = 0,  w = 4,  h = 12 };
windowLeft6_12 = { x = 0,  y = 0,  w = 6,  h = 12 };
windowLeft8_12 = { x = 0,  y = 0,  w = 8,  h = 12 };
windowLeft9_12 = { x = 0,  y = 0,  w = 9,  h = 12 };
windowLeft10_12 = { x = 0,  y = 0,  w = 10,  h = 12 };

windowLeft2_10 = { x = 0,  y = 1,  w = 2,  h = 10 };
windowLeft3_10 = { x = 0,  y = 1,  w = 3,  h = 10 };
windowLeft4_10 = { x = 0,  y = 1,  w = 4,  h = 10 };
windowLeft6_10 = { x = 0,  y = 1,  w = 6,  h = 10 };
windowLeft8_10 = { x = 0,  y = 1,  w = 8,  h = 10 };
windowLeft9_10 = { x = 0,  y = 1,  w = 9,  h = 10 };
windowLeft10_10 = { x = 0,  y = 1,  w = 10,  h = 12 };

windowRight2_12 = { x = 10,  y = 0,  w = 2,  h = 12 };
windowRight3_12 = { x = 9,  y = 0,  w = 3,  h = 12 };
windowRight4_12 = { x = 8,  y = 0,  w = 4,  h = 12 };
windowRight6_12 = { x = 6,  y = 0,  w = 6,  h = 12 };
windowRight8_12 = { x = 4,  y = 0,  w = 8,  h = 12 };
windowRight9_12 = { x = 3,  y = 0,  w = 9,  h = 12 };
windowRight10_10 = { x = 2,  y = 1,  w = 10,  h = 10 };

windowRight2_10 = { x = 10,  y = 1,  w = 2,  h = 10 };
windowRight3_10 = { x = 9,  y = 1,  w = 3,  h = 10 };
windowRight4_10 = { x = 8,  y = 1,  w = 4,  h = 10 };
windowRight6_10 = { x = 6,  y = 1,  w = 6,  h = 10 };
windowRight8_10 = { x = 4,  y = 1,  w = 8,  h = 10 };
windowRight9_10 = { x = 3,  y = 1,  w = 9,  h = 10 };
windowRight10_10 = { x = 2,  y = 1,  w = 10,  h = 10 };
-- Pre-defined grid layouts

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
        error('The app definition: ' .. id .. ' is missing an "id" property');
        return;
    end;

    if appConfig.windows == nil then
        error('The app definition: ' .. id .. ' is missing a "windows" property');
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
                ' at grid (' .. windowConfig.position.x .. ', ' .. windowConfig.position.y .. ', ' .. windowConfig.position.w .. ', ' .. windowConfig.position.h .. ')' ..
                ' on screen (x: ' .. windowConfig.screen.x .. ', y: ' .. windowConfig.screen.y .. ')'
            );

            if (windowConfig.screen) then
                hs.grid.set(window, windowConfig.position, windowConfig.screen);
            else
                hs.grid.set(window, windowConfig.position);
            end;
        end;
    end
end

function findwindow(windows, index)

    if (index == 0) then
        return nil;
    end;

    if windows[index] then
        return windows[index];
    end;

    return findwindow(windows, index-1);
end

function addAppConfig(id, position, numScreens, screen)

    config = {
        position = position
    }

    if numScreens == nil then
        error("numScreens must not be nil")
    end;

    if screen == nil then
        error("screen must not be nil")
    end;

    -- If screen provided, check if it's a table
    if (type(screen) == "table") then
      config.screen = screen;
    else
      screen = screen - 1
      config.screen = {x = screen, y = 0};
    end;

    -- Initialise the app config
    if apps[id] == nil then
        apps[id] = {id = id, windows = {}};
    end;

    apps[id].windows[numScreens] = config
end
