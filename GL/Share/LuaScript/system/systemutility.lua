


function x888894_AskTheWay( varMap, varPlayer, sceneNum, varX, varY, tip )
	Msg2Player( varMap, varPlayer, "@*;flagNPC;" .. sceneNum .. ";" .. varX .. ";" .. varY .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( varMap, varPlayer, "@*;flashNPC;" .. sceneNum .. ";" .. varX .. ";" .. varY .. ";" .. tip, MSG2PLAYER_PARA )
end




function x888894_AskTheWayPos( varMap, varPlayer, sceneNum, varX, varY, tip )
	Msg2Player( varMap, varPlayer, "@*;flagPOS;" .. sceneNum .. ";" .. varX .. ";" .. varY .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( varMap, varPlayer, "@*;flashPOS;" .. sceneNum .. ";" .. varX .. ";" .. varY .. ";" .. tip, MSG2PLAYER_PARA )
end




function x888894_PlaySound( varMap, varPlayer, soundId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, soundId)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer, 11)
end




function x888894_StopSound( varMap, varPlayer, soundId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, soundId)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer, 12)
end




function x888894_PlayLight( varMap, varPlayer, lightId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, lightId)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,13)
end




function x888894_StopLight( varMap, varPlayer, lightId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, lightId)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,14)
end




function x888894_PlayEffect( varMap, varPlayer, effectId )

	StartGCDTask(varMap)
	GCDAppendInt(varMap, effectId)
	GCDAppendInt(varMap, GetSceneInfo(varMap,"CLIENTRES"))
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,15)
end




function x888894_StopEffect( varMap, varPlayer, effectId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, effectId)
	GCDAppendInt(varMap, GetSceneInfo(varMap,"CLIENTRES"))
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,16)
end




function x888894_PlayBkgSound( varMap, varPlayer, soundId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, soundId)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,17)
end




function x888894_StopBkgSound( varMap, varPlayer )
	StartGCDTask(varMap)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,18)
end




function x888894_ShowNewHelp( varMap, varPlayer, tableId )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, tableId)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,19)
end




function x888894_ShowNewUITips( varMap, varPlayer, UITipId,nToggle )
	if UITipId == 2 or UITipId == 5 then return end
	StartGCDTask(varMap)
	GCDAppendInt(varMap, UITipId)
	GCDAppendInt(varMap, nToggle)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,20)
end




function x888894_PlayClientCameraEffect( varMap, varPlayer, effectId, nToggle )
	StartGCDTask(varMap)
	GCDAppendInt(varMap, effectId)
	GCDAppendInt(varMap, nToggle)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,21)
end




function x888894_PlayClientRiseEffect( varMap, varPlayer)
	StartGCDTask(varMap)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,22)
end





function x888894_PlayClientAnimEffect( varMap, varPlayer,effectId)
	StartGCDTask(varMap)
	GCDAppendInt(varMap, effectId)
	GCDAppendInt(varMap, 1)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,23)
end




function x888894_StopClientAnimEffect( varMap, varPlayer,effectId)
	StartGCDTask(varMap)
	GCDAppendInt(varMap, effectId)
	GCDAppendInt(varMap, 0)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,23)
end




function x888894_PlayClientMapColor( varMap, varPlayer, colorId, nTime)
	StartGCDTask(varMap)
	GCDAppendInt(varMap, colorId)
	GCDAppendInt(varMap, 1)
	GCDAppendInt(varMap, nTime)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,24)
end




function x888894_StopClientMapColor( varMap, varPlayer, nTime)
	StartGCDTask(varMap)
	GCDAppendInt(varMap, -1)
	GCDAppendInt(varMap, 0)
	GCDAppendInt(varMap, nTime)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,24)
end





function x888894_OpenWorldDirectory( varMap, varPlayer)
	StartGCDTask(varMap)
	StopGCDTask(varMap)
	DeliverGCDInfo(varMap,varPlayer,25)
end




function x888894_GetCountryName(varMap,nCountryId)
	
	if nCountryId == 0 then
		return "楼兰王国"
	elseif nCountryId == 1 then
		return "天山王国"
	elseif nCountryId == 2 then
		return "昆仑王国"
	elseif nCountryId == 3 then
		return "敦煌王国"
	end
	
	return ""
	
end




function x888894_Feast_ClearMD(varMap,varPlayer)

	local nFrom = MD_FEAST_BEGIN[1]
	local nTo   = MD_FEAST_END[1]

	SetPlayerGameData(varMap,varPlayer,nFrom,16,16,0)
	nFrom = nFrom + 1
	
	for varI = nFrom,nTo do
		SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
	end
end





function x888894_Feast_GetCurrentId(varMap,varPlayer)
	return GetPlayerGameData(varMap,varPlayer,MD_FEAST_INDEX[1],MD_FEAST_INDEX[2],MD_FEAST_INDEX[3])
end




function x888894_Feast_SetCurrentId( varMap,varPlayer,nFeastId)
	
	
	if nFeastId ~=  x888894_Feast_GetCurrentId(varMap,varPlayer) then
		x888894_Feast_ClearMD(varMap,varPlayer)
	end
	
	
	SetPlayerGameData(varMap,varPlayer,MD_FEAST_INDEX[1],MD_FEAST_INDEX[2],MD_FEAST_INDEX[3],nFeastId)
end


