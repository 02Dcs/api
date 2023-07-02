local settingsl = {
	prefix = '$',
	wht = {},
}; __index = settingsl;

local function changeprefix(x)
     return string.gsub(settingsl.prefix, settingsl.prefix, x);
end

local predict
local function addcommand(c, enable, user, callback, ...)
	for d, z in pairs(game.Players:GetChildren()) do
		local callback = callback or function() end
		local args = {...}
		z.Chatted:connect(function(args)
			if #args > 0 then
				predict = args
				if args:match(settingsl.prefix .. tostring(c)) then
					if not enable then
						--table.insert(wht, user);
						if user == 'whitelist' or user == 'wht' then
							if table.find(settingsl.wht, z.Name) then
								pcall(callback)	
							end
						end
					else 
						if user == 'everyone' or user == 'all' then
							local xa = tostring(string.split(args," ")[2])
							pcall(callback); 

						end
					end
				end
			end
		end)
	end
end

return {
	AiBot = function(Properties)
		local prefix = Properties
		changeprefix(prefix);
		pcall(Properties);
	end,
}
