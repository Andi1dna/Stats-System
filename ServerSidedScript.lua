local events = {
	["ChangeStrValue"] = game.ReplicatedStorage.StatEvents.ChangeStrengthEvent,
	["ChangeDurValu"] = game.ReplicatedStorage.StatEvents.ChangeDurabilityEvent,
	["ChangeAgilityValue"] = game.ReplicatedStorage.StatEvents.ChangeAgilityEvent,
	["ChangeSPValue"] = game.ReplicatedStorage.StatEvents.ChangeStatPointsEvent,
	["StrChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.StrOnChangedEvent,
	["DurChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.DurOnChangedEvent,
	["AgilityChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.AgilityOnChangedEvent,
	["SPChanged"] = game.ReplicatedStorage.StatEvents.OnChangedEvents.SPOnChangedEvent,
	["ChangeLevelEvent"] = game.ReplicatedStorage.StatEvents.LevelAndExp.ChangeLevelEvent,
	["ChangeExpEvent"] = game.ReplicatedStorage.StatEvents.LevelAndExp.ChangeExpEvent,
	["AddExp"] = game.ReplicatedStorage.StatEvents.LevelAndExp.Addexp
}
local statsmodule = require(game.ReplicatedStorage.ModuleScripts.Stats)
events.ChangeStrValue.OnServerEvent:Connect(function(player)
	print(player)
	player.Stats.Strength.Value += 1
	player.Stats.StatPoints.Value -= 1
	if player.Stats.Strength.Value < statsmodule.Strength.MaximumStr then
		print("ok perfect str")
	elseif player.Stats.Strength.Value > statsmodule.Strength.MaximumStr then
		print("str too high")
		player.Stats.Strength.Value = statsmodule.Strength.MaximumStr
		player.Stats.StatPoints.Value += 1
	elseif player.Stats.Strength.Value < statsmodule.Strength.MinimumStr then
		print("too low str")
		player.Stats.Strength.Value += 1
	end
end)
events.ChangeDurValu.OnServerEvent:Connect(function(player)
	print(player)
	player.Stats.Durability.Value += 1
	player.Stats.StatPoints.Value -= 1
	if player.Stats.Durability.Value < statsmodule.Durability.MaximumHealth  then
		print("ok perfect fr")
		player.Character:WaitForChild("Humanoid").MaxHealth = player.Stats.Durability.Value
		player.Character:WaitForChild("Humanoid").Health = player.Stats.Durability.Value
	elseif player.Stats.Durability.Value > statsmodule.Durability.MaximumHealth  then
		print("too much hp damn bruh")
		player.Character:WaitForChild("Humanoid").MaxHealth = statsmodule.Durability.MaximumHealth
		player.Character:WaitForChild("Humanoid").Health = statsmodule.Durability.MaximumHealth
		player.Stats.StatPoints.Value += 1
		player.Stats.Durability.Value  = statsmodule.Durability.MaximumHealth
	end
end)
events.ChangeAgilityValue.OnServerEvent:Connect(function(player)
	print(player)
	player.Stats.Agility.Value += 1
	player.Stats.StatPoints.Value -= 1
	if player.Stats.Agility.Value < statsmodule.Speed.MinimumSpeed then
		print("low ass speed")
		player.Stats.Agility.Value = statsmodule.Speed.MinimumSpeed
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value
	elseif player.Stats.Agility.Value <= statsmodule.Speed.MaxSpeed then
		print("perfect speed")
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value 
	elseif player.Stats.Agility.Value > statsmodule.Speed.MaxSpeed then
		print("lowered the speed cuz too high")
		player.Stats.Agility.Value  = statsmodule.Speed.MaxSpeed 
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value
		player.Stats.StatPoints.Value += 1
	end 
end)
events.StrChanged.OnServerEvent:Connect(function(player)
	print(player)
	if player.Stats.Strength.Value <= statsmodule.Strength.MaximumStr then
		print("ok perfect str")
	elseif player.Stats.Strength.Value > statsmodule.Strength.MaximumStr then
		print("str too high")
		player.Stats.Strength.Value = statsmodule.Strength.MaximumStr
	elseif player.Stats.Strength.Value < statsmodule.Strength.MinimumStr then
		print("too low str")
		player.Stats.Strength.Value = statsmodule.Strength.MinimumStr
	end
end)
events.DurChanged.OnServerEvent:Connect(function(player)
	print(player)
	if player.Stats.Durability.Value <= statsmodule.Durability.MaximumHealth then
		print("ok perfect fr")
		player.Character:WaitForChild("Humanoid").MaxHealth = player.Stats.Durability.Value
		player.Character:WaitForChild("Humanoid").Health = player.Stats.Durability.Value
	elseif player.Stats.Durability.Value > statsmodule.Durability.MaximumHealth  then
		print("too much hp damn bruh")
		player.Character:WaitForChild("Humanoid").MaxHealth = statsmodule.Durability.MaximumHealth
		player.Character:WaitForChild("Humanoid").Health = statsmodule.Durability.MaximumHealth
		player.Stats.Durability.Value  = statsmodule.Durability.MaximumHealth
	elseif player.Stats.Durability.Value < statsmodule.Durability.MinimumHealth then
		print("too lil hp get gud kid")
		player.Stats.Durability.Value = statsmodule.Durability.MinimumHealth
		player.Character:WaitForChild("Humanoid").MaxHealth = statsmodule.Durability.MinimumHealth
		player.Character:WaitForChild("Humanoid").Health = statsmodule.Durability.MinimumHealth
	end
end)
events.AgilityChanged.OnServerEvent:Connect(function(player)
	print(player)
	if player.Stats.Agility.Value < statsmodule.Speed.MinimumSpeed then
		print("low ass speed")
		player.Stats.Agility.Value = statsmodule.Speed.MinimumSpeed
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value
	elseif player.Stats.Agility.Value <= statsmodule.Speed.MaxSpeed then
		print("perfect speed")
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value 
	elseif player.Stats.Agility.Value > statsmodule.Speed.MaxSpeed then
		print("lowered the speed cuz too high")
		player.Stats.Agility.Value  = statsmodule.Speed.MaxSpeed 
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value
	end 
end)
events.ChangeLevelEvent.OnServerEvent:Connect(function(player)
	print(player)
	if player.Stats.Level.Value < statsmodule.Level.MinimumLevel then
		print("too low level")
		player.Stats.Level.Value = statsmodule.Level.MinimumLevel
	elseif player.Stats.Level.Value <= statsmodule.Level.MaximumLevel then
		print("perfect level")
		player.Stats.Level.Value = player.Stats.Level.Value
		player.Stats.StatPoints.Value += 8
	elseif player.Stats.Level.Value > statsmodule.Level.MaximumLevel then
		print("Too high level")
		player.Stats.Level.Value = statsmodule.Level.MaximumLevel
	end
end)
events.ChangeExpEvent.OnServerEvent:Connect(function(player)
	print(player)
	print(player.Stats.Exp.Value)
	if player.Stats.Exp.Value >= player.Stats.Exptocollect.Value then
		print("leveled up")
		player.Stats.Level.Value += 1
		player.Stats.Exptocollect.Value = player.Stats.Exptocollect.Value + 10
		player.Stats.Exp.Value = 0
	end
end)
events.AddExp.OnServerEvent:Connect(function(player)
	player.Stats.Exp.Value += 1
end)
events.SPChanged.OnServerEvent:Connect(function(player)
	print(player)
	if player.Stats.StatPoints.Value > statsmodule.StatPoints.MinimumStatPoints and player.Stats.StatPoints.Value < statsmodule.StatPoints.MaximumStatPoints then
		print("perfect sp")
	elseif player.Stats.StatPoints.Value < statsmodule.StatPoints.MinimumStatPoints then
		print("too low sp")
		player.Stats.StatPoints.Value = statsmodule.StatPoints.MinimumStatPoints
	elseif player.Stats.StatPoints.Value > statsmodule.StatPoints.MaximumStatPoints then
		print("too high sp damn bruh")
		player.Stats.StatPoints.Value = statsmodule.StatPoints.MaximumStatPoints
	end
end)
game.Players.PlayerAdded:Connect(function(player)
	wait(1)
	print(player.Stats.Agility.Value)
	if player.Stats.Agility.Value < statsmodule.Speed.MinimumSpeed then
		print(player.Stats.Agility.Value)
		player.Stats.Agility.Value = statsmodule.Speed.MinimumSpeed
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value
	elseif player.Stats.Agility.Value > statsmodule.Speed.MinimumSpeed then
		print("bro")
		player.Character.Humanoid.WalkSpeed = player.Stats.Agility.Value
	end
	if player.Stats.Durability.Value <= statsmodule.Durability.MaximumHealth then
		print("ok perfect fr")
		player.Character:WaitForChild("Humanoid").MaxHealth = player.Stats.Durability.Value
		player.Character:WaitForChild("Humanoid").Health = player.Stats.Durability.Value
	elseif player.Stats.Durability.Value > statsmodule.Durability.MaximumHealth  then
		print("too much hp damn bruh")
		player.Character:WaitForChild("Humanoid").MaxHealth = statsmodule.Durability.MaximumHealth
		player.Character:WaitForChild("Humanoid").Health = statsmodule.Durability.MaximumHealth
		player.Stats.Durability.Value  = statsmodule.Durability.MaximumHealth
	elseif player.Stats.Durability.Value < statsmodule.Durability.MinimumHealth then
		print("too lil hp get gud kid")
		player.Stats.Durability.Value = statsmodule.Durability.MinimumHealth
		player.Character:WaitForChild("Humanoid").MaxHealth = statsmodule.Durability.MinimumHealth
		player.Character:WaitForChild("Humanoid").Health = statsmodule.Durability.MinimumHealth
	end
	if player.Stats.Strength.Value < statsmodule.Strength.MinimumStr then
		print("too low str")
		player.Stats.Strength.Value = statsmodule.Strength.MinimumStr
	elseif player.Stats.Level.Value >= statsmodule.Level.MinimumLevel then
		player.Stats.Exptocollect.Value = 10
	end
	player.CharacterAdded:Connect(function(char)
		wait()
		print(player.Stats.Agility.Value)
		print(player.Stats.Durability.Value)
		print(player.Stats.Strength.Value)
		char:WaitForChild("Humanoid").WalkSpeed = player.Stats.Agility.Value
		char:WaitForChild("Humanoid").MaxHealth = player.Stats.Durability.Value
		char:WaitForChild("Humanoid").Health = player.Stats.Durability.Value
	end)
end)
