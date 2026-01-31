-------- 神行符脚本
x430162_var_FileId = 430162 
x430162_var_NeedItemId = 12030031
x430062_var_CDTime = 120
x430162_var_Buf1 = 7721
x430162_var_MainTransScript = 430014
x430162_var_UICommandID = 103

function x430162_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure(x430162_var_MainTransScript, "ProcEventEntry", varMap, varPlayer, varBagIdx, x430162_var_UICommandID)
end

function x430162_CheckCanTrans(varMap, varPlayer, varBagIdx, varIndex ,newSceneId )
	
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x430162_var_NeedItemId then
		return 0
	end
	
	local ret = LuaCallNoclosure(x430162_var_MainTransScript, "CommonConditionCheck", varMap, varPlayer, varBagIdx, varIndex ,newSceneId)
	if (ret == 0) then
		return 0
	end
	
	local continuance = GetCurrentTime() - GetPlayerGameData(varMap, varPlayer, MD_TRANS_TIME[1], MD_TRANS_TIME[2], MD_TRANS_TIME[3])
	if continuance < x430062_var_CDTime then
		local varMsg = format("%d秒后才可使用下一次神行符", x430062_var_CDTime-continuance)
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end
	
	if (varIndex > 4) then
		return 0
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_TRANS_TIME[1], MD_TRANS_TIME[2], MD_TRANS_TIME[3], GetCurrentTime())

	return 1
end

function x430162_SetTransMap(varMap, varPlayer, varIndex, varBagIdx, value)
	if varIndex == 0 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP1[1], MD_TRANS_MAP1[2], MD_TRANS_MAP1[3], value)	
	elseif varIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP2[1], MD_TRANS_MAP2[2], MD_TRANS_MAP2[3], value)
	elseif varIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP3[1], MD_TRANS_MAP3[2], MD_TRANS_MAP3[3], value)
	elseif varIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP4[1], MD_TRANS_MAP4[2], MD_TRANS_MAP4[3], value)
	elseif varIndex == 4 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP5[1], MD_TRANS_MAP5[2], MD_TRANS_MAP5[3], value)
	end
end

function x430162_SetTransPosX(varMap, varPlayer, varIndex, varBagIdx, value)
	if varIndex == 0 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X1[1], MD_TRANS_POS_X1[2], MD_TRANS_POS_X1[3], value)	
	elseif varIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X2[1], MD_TRANS_POS_X2[2], MD_TRANS_POS_X2[3], value)
	elseif varIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X3[1], MD_TRANS_POS_X3[2], MD_TRANS_POS_X3[3], value)
	elseif varIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X4[1], MD_TRANS_POS_X4[2], MD_TRANS_POS_X4[3], value)
	elseif varIndex == 4 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X5[1], MD_TRANS_POS_X5[2], MD_TRANS_POS_X5[3], value)
	end
end

function x430162_SetTransPosZ(varMap, varPlayer, varIndex, varBagIdx, value)
	if varIndex == 0 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z1[1], MD_TRANS_POS_Z1[2], MD_TRANS_POS_Z1[3], value)	
	elseif varIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z2[1], MD_TRANS_POS_Z2[2], MD_TRANS_POS_Z2[3], value)
	elseif varIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z3[1], MD_TRANS_POS_Z3[2], MD_TRANS_POS_Z3[3], value)
	elseif varIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z4[1], MD_TRANS_POS_Z4[2], MD_TRANS_POS_Z4[3], value)
	elseif varIndex == 4 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z5[1], MD_TRANS_POS_Z5[2], MD_TRANS_POS_Z5[3], value)
	end
end

function x430162_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0
end

function x430162_ProcCancelImpacts( varMap, varPlayer )
	return 0
end

function x430162_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x430162_ProcDeplete( varMap, varPlayer )

	return 0
end

function x430162_ProcActivateOnce( varMap, varPlayer )
end

function x430162_ProcActivateEachTick( varMap, varPlayer)
	return 1
end
