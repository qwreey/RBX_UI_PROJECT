local module = {}

function module:CreateToolbar(Title,ID)
	local Tab = shared[ID]--"qwreey.plugins.toolbarprovider"]
	if not Tab then
		local NewPlugin = PluginManager():CreatePlugin()
		local NewToolbar = NewPlugin:CreateToolbar(Title)--"Qwreey's plugins")
		
		Tab = {}
		Tab.ProviderPlugin = NewPlugin
		Tab.Toolbar = NewToolbar
		Tab.Saved = {}
		
		function Tab:CreateButton(ID,...)
			local New = Tab.Saved[ID] or NewToolbar:CreateButton(ID,...)
			
			if Tab.Saved[ID] then
				New.Icon = ""
				wait()
				New.Icon = select(2,...)

				New.Enabled = true
				New.ClickableWhenViewportHidden = false
				New:SetActive(false)
			else
				New.Parent = NewPlugin
				Tab.Saved[ID] = New
			end
			
			return New
		end
		
		shared[ID] = Tab--"qwreey.plugins.toolbarprovider"] = Tab
	end
	
	return Tab
end

return module