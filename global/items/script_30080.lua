--- MonsterDex

---@param e ItemEventItemClickCast
function event_item_click_cast(e)
	if (e.self:GetID() ~= 151000) then
		return
	end
	local card = require("card")
	local target = e.owner:GetTarget()
	if target == nil then
		e.owner:Message(15, "You must target a monster.")
		return
	end

	local cards = card.Inspect(target)

	if (cards == nil) then
		e.owner:Message(15, target:GetCleanName() .. " does not drop any cards.")
		return
	end

	local message = target:GetCleanName() .. " can drop: "
	for k, v in pairs(cards) do
		message = message .. eq.item_link(k) .. ", "
	end
	message = string.sub(message, 0, string.len(message)-2)
	e.owner:Message(15, message)
end