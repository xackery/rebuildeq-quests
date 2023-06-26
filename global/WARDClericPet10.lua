function event_spawn(e)
	eq.set_timer("first_cast",1000);
	eq.set_timer("cast_spell",10*1000);
end

function event_timer(e)
	if e.timer=="cast_spell" then
		e.self:CastSpell(8131, e.self:GetID()); --Aura of Cleansing II
	elseif e.timer=="first_cast" then
		e.self:CastSpell(8131, e.self:GetID()); --Aura of Cleansing II
		eq.stop_timer("first_cast");
	end
end
