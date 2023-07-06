
loot_table = {
    { tier = 1, id = 17662, name = "Dull Jade Earring",        weight = 100, quantity = 1, equip = true },
    { tier = 1, id = 17661, name = "Dull Ruby Ring",           weight = 100,    quantity = 1, equip = true },
    { tier = 1, id = 13347, name = "Dull Pearl Necklace",      weight = 100,    quantity = 1, equip = true },
    { tier = 1, id = 4038,  name = "Qeynos Chain Arms",        weight = 100,    quantity = 1, equip = true },
    { tier = 1, id = 4044,  name = "Qeynos Chain Cloak",       weight = 100,    quantity = 1, equip = true },
    { tier = 1, id = 4039,  name = "Qeynos Chain Breastplate", weight = 100,    quantity = 1, equip = true },
    { tier = 1, id = 4041,  name = "Qeynos Chain Mask",        weight = 100,    quantity = 1, equip = true },
    { tier = 1, id = 2857,  name = "Qeynos Chain Boots",       weight = 1000,    quantity = 1, equip = true },
    { tier = 1, id = 4062,  name = "Qeynos Chain Gauntlets",   weight = 100,    quantity = 1, equip = true }
}

---@param e NPCEventSay
---@param num_drops integer
function assign_loot(e, num_drops)
    local loot_assigned = 0;
    local tier = 1

    local max_pool = 0
    local roll_table = {}
    local last_weight
    for idx, item in pairs(loot_table) do
        if item.tier == tier then
            last_weight = item.weight
            max_pool = max_pool + item.weight
            table.insert(roll_table, max_pool)
            roll_table[max_pool] = idx
            e.self:Say("Adding ".. item.name .. "with max pool " .. max_pool)
        end
    end

    e.self:Say("Tier: " .. tostring(tier));
    e.self:Say("Number of items in tier: " .. tostring(#roll_table))
    e.self:Say("Chance of each item to drop: " .. tostring((last_weight / max_pool) * 100))

    local counter = 0
    while (loot_assigned < num_drops and counter < 50) do
        counter = counter + 1
        local roll = math.random(0, max_pool);
        e.self:Say("Rolled " .. roll .. " vs max " .. max_pool)

        for _, roll_weight in ipairs(roll_table) do
            if roll <= roll_weight then
                local idx = roll_table[roll_weight]
                local item = loot_table[idx]
                e.self:Say("Added: " .. item.name)
                loot_assigned = loot_assigned + 1;
                break
            end
        end
    end
    if counter >= 1000 then
        e.self:Say("Exhausted attempts to roll")
    end
end

---@param e NPCEventSay
function event_say(e)
    e.self:Say("Rawr")
    assign_loot(e, 10)
end
