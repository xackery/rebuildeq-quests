
---@param e ModCheckHitChance
function CheckHitChance(e)
    if not e.self:IsClient() then
        return e
    end

    if not e.self:GetAAByAAID(28) then
        return e
    end

    --- is sitting ?

    -- local avoidance = e.other:GetTotalDefense()
	--if avoidance == -1 then -- some sort of auto avoid disc
    --    e.ReturnValue = false
    --    return e
    --end

	-- auto accuracy = hit.tohit;
	-- if (accuracy == -1)
	-- 	return true;

	-- // so now we roll!
	-- // relevant dev quote:
	-- // Then your chance to simply avoid the attack is checked (defender's avoidance roll beat the attacker's accuracy roll.)
	-- int tohit_roll = zone->random.Roll0(accuracy);
	-- int avoid_roll = zone->random.Roll0(avoidance);
	-- Log(Logs::Detail, Logs::Attack, "CheckHitChance accuracy(%d => %d) avoidance(%d => %d)", accuracy, tohit_roll, avoidance, avoid_roll);

	-- // tie breaker? Don't want to be biased any one way
	-- if (tohit_roll == avoid_roll)
	-- 	return zone->random.Roll(50);
	-- return tohit_roll > avoid_roll;
    --     if e.hit.skill == eq.get_skill_name then
    --         e.hit.damage_done = e.hit.damage_done * 0.8
    --         e.ReturnValue = true
    --         return e
    --     end
    -- end
	-- e.IgnoreDefault = true
    -- e.ReturnValue = true
    return e
end


---@param e ModCommonOutgoingHitSuccess
function CommonOutgoingHitSuccess(e)
    --e.self:Say("self")
    --e.other:Say("other")
end