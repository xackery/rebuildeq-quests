---@param e NPCEventSay
function event_say(e)
    local guildmaster = require("guild_master");
    guildmaster.do_buffs_and_ports(e);


    local bountyquest = require("bounty_quest");
    bountyquest.do_dialog(e);
end