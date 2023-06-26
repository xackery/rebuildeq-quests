-- 1) 10 scrolls + the 1 Gilded scroll will drop max in the mission
-- 2) npcs beyond locked gate do not drop scrolls but likely count as remaining mobs for drop chance
--    this can cause an incompletable mission (no gilded) or less than 10 scroll drops (no respawns)
-- 3) the Gilded scroll only drops after most scrolls drop, suggesting chance increases per scroll
--    this could mean +10% chance per scroll for gilded to drop
-- 4) the Gilded scroll can drop with another scroll so it's a secondary check
-- 5) the distribution on scrolls is 50% labor doc and 50% spread between the 3 magic scrolls
-- todo: for live accuracy npcs behind gate should count for drop chance even if it can make mission incompletable

local zone_controller_id  = 10 -- hardcoded in source
local scholar_npc_id      = 340750 -- #Noble_Kirin_Scholar
local exclude             = { zone_controller_id = true, scholar_npc_id = true }
local gilded_scroll_id    = 81880
local labor_scroll_id     = 81881
local magic_scrolls       = { 81882, 81883, 81884 }
local dropped_gilded      = false
local scroll_drops        = { max = 10, count = 0, normal = 0, magic = 0 }

local scroll_emote = "As you take the scroll from the corpse, you pause to take a closer look at it."
local magic_emote  = "As you take the scroll from the corpse, magical runes appear on the parchment."

local scrolls = {
  -- Gilded Scroll of Earth Rending
  [81880] = { replace_id = 81885, npc_id = nil, spell_id = nil, emote = scroll_emote },
  -- Labor and Inventory Documentation
  [81881] = { replace_id = 81886, npc_id = nil, spell_id = nil, emote = scroll_emote },
  -- Expended Trapped Scroll, #Trapped_Scroll, Heatwave
  [81882] = { replace_id = 81887, npc_id = 340747, spell_id = 5816, emote = magic_emote },
  -- Expended Scroll of Deadly Shock, #Scroll_of_Deadly_Shock, Static Burn
  [81883] = { replace_id = 81888, npc_id = 340748, spell_id = 3965, emote = magic_emote },
  -- Expended Scroll of Dissolution, #Scroll_of_Dissolution, Cursed Keeper's Anger
  [81884] = { replace_id = 81889, npc_id = 340749, spell_id = 4444, emote = magic_emote },
}

local function is_behind_locked_door(npc)
  local locked_door = { x = 1300, y = 1800 }
  return npc:GetSpawnPointX() < locked_door.x and npc:GetSpawnPointY() < locked_door.y
end

local function get_npc_count()
  local remaining = 0
  local npc_list = eq.get_entity_list():GetNPCList()
  for npc in npc_list.entries do
    -- live appears to count npcs beyond locked door but doesn't allow them to drop scrolls
    if not npc:IsPet() and not exclude[npc:GetNPCTypeID()] and not is_behind_locked_door(npc) then
      remaining = remaining + 1
    end
  end
  return remaining
end

local function add_item(corpse, item_id)
  corpse:AddItem(item_id, 1)
  corpse:ResetDecayTimer() -- prevent empty corpse decay timer if it didn't have any other loot
end

local function add_random_scroll(corpse)
  if math.random() > 0.5 then -- labor scroll distribution is 50%
    eq.debug("Adding scroll (Normal)")
    add_item(corpse, labor_scroll_id)
    scroll_drops.normal = scroll_drops.normal + 1
  else
    eq.debug("Adding scroll (Magic)")
    local scroll_id = magic_scrolls[math.random(#magic_scrolls)]
    add_item(corpse, scroll_id)
    scroll_drops.magic = scroll_drops.magic + 1
  end
end

function zone_npc_death(e)
  -- prevent npcs that spawn beyond locked door from dropping scrolls (live does this but can bug mission)
  if e.killed:IsPet() or exclude[e.killed:GetNPCTypeID()] or is_behind_locked_door(e.killed) then
    return
  end

  local remaining_scrolls = scroll_drops.max - scroll_drops.count
  local npc_count = get_npc_count() + 1
  eq.debug(("Remaining scrolls (%d) npcs (%d) -- dropped normal (%d) magic (%d)"):format(
    remaining_scrolls, npc_count, scroll_drops.normal, scroll_drops.magic))

  -- drops might be better distributed on live and double drops less common
  if remaining_scrolls > 0 then
    local chance = remaining_scrolls / npc_count
    local roll = math.random()
    eq.debug(("-- Checking scroll chance: (%f) roll: (%f)"):format(chance * 100, roll * 100))
    if roll < chance then
      scroll_drops.count = scroll_drops.count + 1
      add_random_scroll(e.corpse)
    end
  end

  if not dropped_gilded then
    local chance = (scroll_drops.count * 0.1) / npc_count -- +10% per dropped scroll
    local roll = math.random()
    eq.debug(("-- Checking Gilded chance: (%f) roll: (%f)"):format(chance * 100, roll * 100))
    if roll < chance then
      eq.debug("Adding scroll (Gilded)")
      add_item(e.corpse, gilded_scroll_id)
      dropped_gilded = true
    end
  end
end

function player_loot(e)
  local scroll = scrolls[e.item:GetID()]
  if scroll and e.corpse:IsNPCCorpse() then
    e.self:Message(MT.Yellow, scroll.emote)

    if scroll.npc_id and scroll.spell_id then
      local scroll_npc = eq.spawn2(scroll.npc_id, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
      scroll_npc:CastSpell(scroll.spell_id, e.self:GetID())
      scroll_npc:Depop()
    elseif e.item:GetID() == gilded_scroll_id then
      local scholar = eq.unique_spawn(scholar_npc_id, 0, 0, 1296, 1708, 19, 63.75) -- #Noble_Kirin_Scholar
      scholar:CastToNPC():MoveTo(1429.25, 1859.625, -1.125, 42.25, true)
    end

    eq.set_timer("replace_scroll", 1000)
  end
end

function player_timer(e)
  eq.stop_timer(e.timer)
  local inv = e.self:GetInventory()
  for scroll_id, scroll in pairs(scrolls) do
    if inv:HasItem(scroll_id, 1, bit.bor(InventoryWhere.Personal, InventoryWhere.Cursor)) ~= -1 then
      e.self:RemoveItem(scroll_id)
      e.self:SummonItem(scroll.replace_id)
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, zone_controller_id, zone_npc_death)
  eq.register_player_event(Event.loot, player_loot)
  eq.register_player_event(Event.timer, player_timer)
end
