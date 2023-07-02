local function createmsg(v)
	pcall(function()
		if not rp:FindFirstChild('DefaultChatSystemChatEvents') then
			local g = game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(v)
			g:SetExtraData("BubbleChatEnabled", false)
		else 
			rp:FindFirstChild('DefaultChatSystemChatEvents').SayMessageRequest:FireServer(tostring(v), "All");
		end
	end)
end
