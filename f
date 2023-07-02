local library = {}

local rp = game:GetService('ReplicatedStorage')


local settingsl = {
	prefix = '$',
	wht = {},
}; __index = settingsl;



local predict
function library:addcommand(c, enable, user, callback, ...)
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

function b(x)
	for x, j in pairs (game.Players:GetChildren()) do
		if string.find(string.lower(x.Name), string.lower(x)) and string.find(string.lower(x.DisplayName) then
			return x.Name
		elseif string.find(string.lower(x.DisplayName), string.lower(x)) then
			return x.Name
		end
	end
end

function createmsg(v)
	pcall(function()
		if not rp:FindFirstChild('DefaultChatSystemChatEvents') then
			local g = game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(v)
			g:SetExtraData("BubbleChatEnabled", false)
		else 
			rp:FindFirstChild('DefaultChatSystemChatEvents').SayMessageRequest:FireServer(tostring(v), "All");
		end
	end)
end


return library