--[[
 -
 - Window stashing
 -
 ]]
local stashedWindowPositions = {};
function stashWindowPositions(alert)

    print('--------');
    print('-- Stashing window locations --');

    local screenCount = tablelength(hs.screen.allScreens());
    stashedWindowPositions[screenCount] = {};

    for i,app in pairs(hs.application.runningApplications()) do

        for i,window in ipairs(app:allWindows()) do

            local id = window:id();
            local config = {
                app_id = app:pid(),
                screen = window:screen(),
                frame = window:frame(),
                name = app:name(),
                title = window:title(),
            };

            print(
                'Stashing window: ' .. app:name() .. ' - ' .. window:title() ..
                ' at (' .. config.frame.x .. ', ' .. config.frame.y .. ', ' .. config.frame.w .. ', ' .. config.frame.h .. ')'
            );

            if (id) then
                stashedWindowPositions[screenCount][id] = config;
            end

        end

    end

    print('--------');


    if (alert) then
        hs.alert('Stashed window locations');
    end
end

function restoreWindowPositions(alert)

    print('--------');
    print('-- Restoring window locations --');

    local screenCount = tablelength(hs.screen.allScreens());

    if (screenCount == 0) then
        return;
    end;

    -- If there is no stashed data, return false
    if (stashedWindowPositions[screenCount] == nil) then
        print('-- No stashed window location data --');
        hs.alert('No stashed window data');
        return false;
    end;

    -- Restore stashed window data
    for id,config in pairs(stashedWindowPositions[screenCount]) do

        local app = hs.application.get(config.app_id);
        local window = hs.window.get(id);
        local screen = hs.screen.find(config.screen);

        if (window and app) then
            window:setFrame(config.frame);
            window:moveToScreen(screen);

            print(
                'Restoring window: ' .. app:name() .. ' - ' .. window:title() ..
                ' to (' .. config.frame.x .. ', ' .. config.frame.y .. ', ' .. config.frame.w .. ', ' .. config.frame.h .. ')'
            );
        elseif (app) then
            print(
                'Unable to find window for: ' .. app:name());
        end;
    end;

    print('--------');

    if (alert) then
        hs.alert('Restored window locations');
    end;

    return true;
end