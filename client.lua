local function getDirectionFromHeading(heading)
    local dirs = { "N", "NE", "E", "SE", "S", "SW", "W", "NW", "N" }
    local index = math.floor((heading + 22.5) / 45.0) + 1
    return dirs[index]
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local wait = 300

        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            local speed = math.floor(GetEntitySpeed(veh) * 3.6)
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)

            local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
            local streetName = GetStreetNameFromHashKey(streetHash)
            local direction = getDirectionFromHeading(heading)

            SendNUIMessage({
                action = "show",
                speed = speed,
                direction = direction,
                street = streetName
            })

            wait = 100
        else
            SendNUIMessage({
                action = "hide"
            })
        end

        Wait(wait)
    end
end)
