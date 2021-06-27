require("casbin")
local M = {}

function M.check(e)
    local req = ngx.var.request_uri
    for usr, obj, act in req:gmatch("/(%w+)%?obj=(%w+)&act=(%w+)") do
    	
  		-- If pattern matches, shows the request and enforce result
    	ngx.say("Request:\t", "User:"..usr.."\t", "Object:"..obj.."\t", "Action:"..act)
    	ngx.say("Result = ", e:enforce(usr, obj, act))
    	break
	end
end

return M
