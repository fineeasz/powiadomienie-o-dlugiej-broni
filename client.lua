-- RedLeaks discord.gg/49263TE8g8
-- RedLeaks discord.gg/49263TE8g8

-- Powiadomienie o wyciagnieciu dlugiej 

BronieDlugie = {
	{name = 'WEAPON_ASSAULTSMG', label = 'Assault smg', instash=true},
	{name = 'WEAPON_COMBATPDW', label = 'Combat pdw', instash=true},
	{name = 'WEAPON_ASSAULTRIFLE', label = 'Assault rifle', instash=true},
	{name = 'WEAPON_CARBINERIFLE', label = 'Carbine rifle', instash=true},
	{name = 'WEAPON_ADVANCEDRIFLE', label= 'Advanced rifle', instash=true},
	{name = 'WEAPON_SPECIALCARBINE', label= 'Special carbine', instash=true},
	{name = 'WEAPON_BULLPUPRIFLE', label='Bullpup Rifle', instash=true},
	{name = 'WEAPON_COMPACTRIFLE', label= 'Compactrifle', instash=true},
	{name = 'WEAPON_PUMPSHOTGUN', label='Pumpshotgun', instash=true},
	{name = 'WEAPON_BULLPUPSHOTGUN', label='Bullpup shotgun', instash=true},
	{name = 'WEAPON_ASSAULTSHOTGUN', label='Assaut shotgun', instash=true},
	{name = 'WEAPON_HEAVYSHOTGUN', label='Heavy shotgun', instash=true},
	{name = 'WEAPON_SAWNOFFSHOTGUN', label='Sawoff shotgun', instash=true},
	{name = 'WEAPON_MUSKET', label='Musket', instash=true},
	{name = 'WEAPON_DBSHOTGUN', label='DB shotgun', instash=true},
	{name = 'WEAPON_AUTOSHOTGUN', label='Auto shotgun', instash=true},
	{name = 'WEAPON_COMBATMG', label='Combat smg', instash=true},
	{name = 'WEAPON_MG', label='Mg', instash=true},
	{name = 'WEAPON_SMG', label='SMG', instash=true},
	{name = 'WEAPON_GUSENBERG', label='Gunseberg', instash=true},
	{name = 'WEAPON_MINISMG', label='MINISMG', instash=true},
}

RegisterNetEvent('fineeasz:chat')
AddEventHandler('fineeasz:chat', function(id, color, message)
	local _source = PlayerId()
	local target = GetPlayerFromServerId(id)
	
	if target == _source then
		TriggerEvent('chatMessage', '' , color, message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(_source)), GetEntityCoords(GetPlayerPed(target)), true) < 60 then
		TriggerEvent('chatMessage', '' , color, message)
	end
end)

  CreateThread(function()
	local wyslane = true
	while true do
		Citizen.Wait(100)
		local playerPed = Citizen.InvokeNative(0x43A66C31C68491C0, -1)
		local x,y,z = table.unpack(GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1),true))

		if GetSelectedPedWeapon(playerPed) ~= nil then
			
			for i=1, #BronieDlugie, 1 do
				local weaponHash = GetHashKey(BronieDlugie[i].name)
				local weaponName = BronieDlugie[i].label
				if weaponHash == GetSelectedPedWeapon(playerPed) and not tookWeapon and GetSelectedPedWeapon(playerPed) ~= WeaponfromTrunk then
					tookWeapon = true
					wyslane = false
					WeaponfromTrunk = GetSelectedPedWeapon(playerPed)
					local id = GetPlayerServerId(PlayerId())
					TriggerServerEvent("Fineeasz:DlugaWiado", id, "Obywatel[".. id .."] Wyciagnał broń dlugą")
				end
			end
		end

		if GetSelectedPedWeapon(playerPed) ~= WeaponfromTrunk then
			WeaponfromTrunk = nil
			tookWeapon = false
			if not wyslane then
				wyslane = true
				local id = GetPlayerServerId(PlayerId())
				TriggerServerEvent("Fineeasz:DlugaWiado", id, "Obywatel[".. id .."] Chowa broń dlugą")
			end
		end
		currentWeapon = GetSelectedPedWeapon(playerPed)
		if currentWeapon ~= -1569615261 and currentWeapon ~= 883325847 and currentWeapon ~= 966099553 and not IsPedInAnyVehicle(playerPed, 1) and LoadedIn then
			if not tookWeapon or WeaponfromTrunk ~= GetSelectedPedWeapon(playerPed) then
				tookWeapon = true
				WeaponfromTrunk = GetSelectedPedWeapon(playerPed)
			end
		end
	end
end)

-- RedLeaks discord.gg/49263TE8g8
-- RedLeaks discord.gg/49263TE8g8