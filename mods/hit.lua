
---@param e ModCheckHitChance
function CheckHitChance(e)
    e.self:Say("self")
    e.other:Say("other")
	e.IgnoreDefault = true
    e.ReturnValue = true
    return e
end


---@param e ModCommonOutgoingHitSuccess
function CommonOutgoingHitSuccess(e)
    e.self:Say("self")
    e.other:Say("other")
end