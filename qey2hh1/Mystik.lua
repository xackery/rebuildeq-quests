-- Monk Epic 1.5/2.0 (Prequest)

function event_say(e)
  local qglobals = eq.get_qglobals(e.other)
  local mnk_pre = tonumber(qglobals["MnkPre"]);
  if (mnk_pre == nil) then mnk_pre = 0; end
    
  if (mnk_pre == 1) then
    if (e.message:findi("hail")) then
      e.self:Say("I see you bear the Sign of Acceptance. So you believe you are strong enough to accomplish all that is asked of you? If you stand true during this [" .. eq.say_link("test") .. "] you will find all you seek.");
    elseif(e.message:findi("test")) then
      e.self:Say("In this test you will have to face me and prove that you have the heart to succeed. I hope you have brought strong allies to accompany you for you shall need them. We shall begin as soon as you are [" .. eq.say_link("ready to start") .. "].");
    elseif(e.message:findi("ready to start")) then
      e.self:Say("I didnt know slime could speak common.. go back to the sewer before I lose my temper.");
      e.self:SetSpecialAbility(19,0);
      e.self:SetSpecialAbility(20,0);
      e.self:SetSpecialAbility(24,0);
      e.self:SetSpecialAbility(25,0);
      eq.attack(e.other:GetName());
    end
  end
end

function event_death_complete(e)
	e.self:Say("You have proven to be successful. Go now and continue your journey.");
end
