RegisterNetEvent("FRP:TOAST:New",function(icon, mensagem, time)
	if not time then
		time = 5000
	end

	local testDict = "generic_textures"
	local testIcon = "tick"
	local testColor = "COLOR_WHITE"

	if icon == "alert" then
		testDict = 'menu_textures'
		testIcon = 'menu_icon_alert'
		testColor = "COLOR_ORANGE"
	end

	if icon == "verify" then
		testDict = 'generic_textures'
		testIcon = 'tick'
	end

	if icon == "locked" then
		testDict = 'menu_textures'
		testIcon = 'stamp_locked_rank'
	end

	if icon == "star" then
		testDict = 'menu_textures'
		testIcon = 'star'
	end	
	
	if icon == "horse" then
		testDict = 'HUD_TOASTS'
		testIcon = 'toast_horse_bond'
	end

	if icon == "error" then
		testDict = 'menu_textures'
		testIcon = 'menu_icon_info_warning'
	end
	
	Notification:NotifyAvanced(mensagem, testDict, testIcon, testColor, time)
end)

RegisterNetEvent("FRP:NOTIFY:Simple",function(mensagem, time)
	if not time then
		time = 5000
	end
	Notification:NotifyRightTip(mensagem, time)
end)

-- RegisterNetEvent("texas:notify:simple",function(mensagem, time)
-- 	if not time then
-- 		time = 5000
-- 	end
-- 	Notification:NotifyRightTip(mensagem, time)
-- end)
RegisterNetEvent("texas:notify:native",function(mensagem, time)
	if not time then
		time = 5000
	end

	SendNUIMessage({ css = 'sucesso', mensagem = mensagem, time =  time })
end)

RegisterNetEvent("texas:notify:simple",function(mensagem, time)
	if not time then
		time = 5000
	end

	SendNUIMessage({ css = 'sucesso', mensagem = mensagem, time =  time })
end)


-- RegisterNetEvent('blipALERTRED', function(targetCoords)
-- 	--if isPlayerWhitelisted and Config.GunshotAlert then
-- 		local alpha = 250
-- 		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 160.0)

-- 		SetBlipHighDetail(gunshotBlip, true)
-- 		SetBlipSprite (gunshotBlip, 10)
-- 		SetBlipColour (gunshotBlip, 1)
-- 		SetBlipAlpha(gunshotBlip, alpha)
-- 		SetBlipAsShortRange(gunshotBlip, true)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(50 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(gunshotBlip, alpha)
-- 			if alpha == 0 then
-- 				RemoveBlip(gunshotBlip)
-- 				return
-- 			end
-- 		end
-- 	--end
-- end)