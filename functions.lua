
function listApps()
    print('-- Listing Running Apps --');
    hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:bundleID(), app:title()) end)
    print('------------');
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function merge(firstTable, secondTable)

    local newTable = hs.fnutils.copy(firstTable);
    return hs.fnutils.concat(newTable, secondTable);
end

-- load config on save
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload();
        hs.alert('Config reloaded');
    end
end
