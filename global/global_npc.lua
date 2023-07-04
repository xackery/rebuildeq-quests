---@param e NPCEventSay
function event_say(e)
    local guildmaster = require("guild_master")
    guildmaster.do_buffs_and_ports(e)


    local bountyquest = require("bounty_quest")
    bountyquest.do_dialog(e)
end

---@param e NPCEventSpawn
function event_spawn(e)
    local card = require("card")
    local cards = card.Inspect(e.self)
    for idx, weight in pairs(cards) do
        --e.self:Say("Adding item " .. idx .. " with weight " .. weight .. " to roll table")
        local roll = math.random(0, 10000)
        if roll <= weight then
            e.self:Say("Roll " .. roll .. " is less than or equal to weight " .. weight .. ", spawning item " .. idx)
            e.self:AddItem(idx, 1)
        end
    end
end
