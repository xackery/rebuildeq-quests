--- MonsterDex

---@param e SpellEventSpellEffect
function event_spell_effect(e)
	local caster = eq.get_entity_list():GetClientByID(e.caster_id);
	if caster == nil then
		return false
	end

	local target = e.target
	if target == nil then
		caster:Message(15, "You must target a monster.")
		return true
	end
	local card = require("card")
	local cards = card.Inspect(target)

	if (cards == nil) then
		caster:Message(15, target:GetCleanName() .. " does not drop any cards.")
		return
	end

	local message = target:GetCleanName() .. " can drop: "
	for k, v in pairs(cards) do
		message = message .. eq.item_link(k) .. ", "
	end
	message = string.sub(message, 0, string.len(message)-2)
	caster:Message(15, message)
end