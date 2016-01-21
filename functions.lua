
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

    local newTable = {};

    for k,v in pairs(firstTable) do
        newTable[k] = v
    end

    for k,v in pairs(secondTable) do
        newTable[k] = v
    end

    return newTable;
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
        hs.reload()
    end
end
