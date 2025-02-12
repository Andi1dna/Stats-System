wait(0.1)
local player = game.Players.LocalPlayer
local events = {
	["ChangeStrValue"] = game.ReplicatedStorage.StatEvents.ChangeStrengthEvent,
	["ChangeDurValu"] = game.ReplicatedStorage.StatEvents.ChangeDurabilityEvent,
	["ChangeAgilityValue"] = game.ReplicatedStorage.StatEvents.ChangeAgilityEvent,
	["ChangeSPValue"] = game.ReplicatedStorage.StatEvents.ChangeStatPointsEvent,
	["StrChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.StrOnChangedEvent,
	["DurChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.DurOnChangedEvent,
	["AgilityChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.AgilityOnChangedEvent,
	["SPChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.SPOnChangedEvent
}
script.Parent.Frame.Strength.Text = "Strength: "..player.Stats.Strength.Value
script.Parent.Frame.Durability.Text = "Durability: "..player.Stats.Durability.Value
script.Parent.Frame.Agility.Text = "Agility: "..player.Stats.Agility.Value
script.Parent.Frame.StatPoints.Text = "StatPoints: "..player.Stats.StatPoints.Value
script.Parent.Frame.Strength.TextButton.MouseButton1Click:Connect(function(plr)
	if player.Stats.StatPoints.Value > 0 then
		events.ChangeStrValue:FireServer(player)
		player.Stats.Strength.Value += 1
		player.Stats.StatPoints.Value -= 1
	end
end)
script.Parent.Frame.Durability.TextButton.MouseButton1Click:Connect(function(plr)
	if player.Stats.StatPoints.Value > 0 then
		events.ChangeDurValu:FireServer(player)
		player.Stats.Durability.Value += 1
		player.Stats.StatPoints.Value -= 1
	end
end)
script.Parent.Frame.Agility.TextButton.MouseButton1Click:Connect(function(plr)
	if player.Stats.StatPoints.Value > 0 then
		events.ChangeAgilityValue:FireServer(player)
		player.Stats.Agility.Value += 1
		player.Stats.StatPoints.Value -= 1
	end
end)
player.Stats.Strength.Changed:Connect(function(plr)
	print("changed str")
	player.Stats.Strength.Value = player.Stats.Strength.Value
	events.StrChanged:FireServer(player)
	script.Parent.Frame.Strength.Text = "Strength: "..player.Stats.Strength.Value
end)
player.Stats.Durability.Changed:Connect(function(plr)
	print("changed dura")
	player.Stats.Durability.Value = player.Stats.Durability.Value
	events.DurChanged:FireServer(player)
	script.Parent.Frame.Durability.Text = "Durability: "..player.Stats.Durability.Value
end)
player.Stats.Agility.Changed:Connect(function(plr)
	print("changed agility")
	player.Stats.Agility.Value = player.Stats.Agility.Value
	events.AgilityChanged:FireServer(player)
	script.Parent.Frame.Agility.Text = "Agility: "..player.Stats.Agility.Value
end)
player.Stats.StatPoints.Changed:Connect(function(plr)
	print("changed statpoints")
	player.Stats.StatPoints.Value = player.Stats.StatPoints.Value
	events.SPChanged:FireServer(player)
	script.Parent.Frame.StatPoints.Text = "StatPoints: "..player.Stats.StatPoints.Value
end)
