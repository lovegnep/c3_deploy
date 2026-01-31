-------- 神行符脚本
x430044_var_FileId = 430044 
x430044_var_NeedItemId = 12031037
x430044_var_CDTime = 60
x430044_var_Buf1 = 7721
x430044_var_MainTransScript = 430014
x430044_var_UICommandID = 111

function x430044_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure(x430044_var_MainTransScript, "ProcEventEntry", varMap, varPlayer, varBagIdx, x430044_var_UICommandID)
end

function x430044_CheckCanTrans(varMap, varPlayer, varBagIdx, varIndex ,newSceneId )
	
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x430044_var_NeedItemId then
		return 0
	end
	
	local ret = LuaCallNoclosure(x430044_var_MainTransScript, "CommonConditionCheck", varMap, varPlayer, varBagIdx, varIndex ,newSceneId)
	if (ret == 0) then
		return 0
	end
	
	local continuance = GetCurrentTime() - GetPlayerGameData(varMap, varPlayer, MD_TRANS_TIME[1], MD_TRANS_TIME[2], MD_TRANS_TIME[3])
	if continuance < x430044_var_CDTime then
		local varMsg = format("%d秒后才可使用下一次千里符", x430044_var_CDTime-continuance)
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end
	
	if (varIndex < 5 or varIndex > 14) then
		return 0
	end

	SetPlayerGameData(varMap, varPlayer, MD_TRANS_TIME[1], MD_TRANS_TIME[2], MD_TRANS_TIME[3], GetCurrentTime())

	return 1
end

function x430044_SetTransMap(varMap, varPlayer, varIndex, varBagIdx, value)
	if varIndex == 5 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP6[1], MD_TRANS_MAP6[2], MD_TRANS_MAP6[3], value)	
	elseif varIndex == 6 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP7[1], MD_TRANS_MAP7[2], MD_TRANS_MAP7[3], value)
	elseif varIndex == 7 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP8[1], MD_TRANS_MAP8[2], MD_TRANS_MAP8[3], value)
	elseif varIndex == 8 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP9[1], MD_TRANS_MAP9[2], MD_TRANS_MAP9[3], value)
	elseif varIndex == 9 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP10[1], MD_TRANS_MAP10[2], MD_TRANS_MAP10[3], value)
	elseif varIndex == 10 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP11[1], MD_TRANS_MAP11[2], MD_TRANS_MAP11[3], value)	
	elseif varIndex == 11 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP12[1], MD_TRANS_MAP12[2], MD_TRANS_MAP12[3], value)
	elseif varIndex == 12 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP13[1], MD_TRANS_MAP13[2], MD_TRANS_MAP13[3], value)
	elseif varIndex == 13 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP14[1], MD_TRANS_MAP14[2], MD_TRANS_MAP14[3], value)
	elseif varIndex == 14 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP15[1], MD_TRANS_MAP15[2], MD_TRANS_MAP15[3], value)

	end
end

function x430044_SetTransPosX(varMap, varPlayer, varIndex, varBagIdx, value)
	if varIndex == 5 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X6[1], MD_TRANS_POS_X6[2], MD_TRANS_POS_X6[3], value)	
	elseif varIndex == 6 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X7[1], MD_TRANS_POS_X7[2], MD_TRANS_POS_X7[3], value)
	elseif varIndex == 7 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X8[1], MD_TRANS_POS_X8[2], MD_TRANS_POS_X8[3], value)
	elseif varIndex == 8 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X9[1], MD_TRANS_POS_X9[2], MD_TRANS_POS_X9[3], value)
	elseif varIndex == 9 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X10[1], MD_TRANS_POS_X10[2], MD_TRANS_POS_X10[3], value)
	elseif varIndex == 10 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X11[1], MD_TRANS_POS_X11[2], MD_TRANS_POS_X11[3], value)	
	elseif varIndex == 11 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X12[1], MD_TRANS_POS_X12[2], MD_TRANS_POS_X12[3], value)
	elseif varIndex == 12 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X13[1], MD_TRANS_POS_X13[2], MD_TRANS_POS_X13[3], value)
	elseif varIndex == 13 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X14[1], MD_TRANS_POS_X14[2], MD_TRANS_POS_X14[3], value)
	elseif varIndex == 14 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X15[1], MD_TRANS_POS_X15[2], MD_TRANS_POS_X15[3], value)
	end
end

function x430044_SetTransPosZ(varMap, varPlayer, varIndex, varBagIdx, value)
	if varIndex == 5 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z6[1], MD_TRANS_POS_Z6[2], MD_TRANS_POS_Z6[3], value)	
	elseif varIndex == 6 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z7[1], MD_TRANS_POS_Z7[2], MD_TRANS_POS_Z7[3], value)
	elseif varIndex == 7 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z8[1], MD_TRANS_POS_Z8[2], MD_TRANS_POS_Z8[3], value)
	elseif varIndex == 8 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z9[1], MD_TRANS_POS_Z9[2], MD_TRANS_POS_Z9[3], value)
	elseif varIndex == 9 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z10[1], MD_TRANS_POS_Z10[2], MD_TRANS_POS_Z10[3], value)
	elseif varIndex == 10 then
		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z11[1], MD_TRANS_POS_Z11[2], MD_TRANS_POS_Z11[3], value)	
	elseif varIndex == 11 then
 		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z12[1], MD_TRANS_POS_Z12[2], MD_TRANS_POS_Z12[3], value)
	elseif varIndex == 12 then
 		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z13[1], MD_TRANS_POS_Z13[2], MD_TRANS_POS_Z13[3], value)
	elseif varIndex == 13 then
 		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z14[1], MD_TRANS_POS_Z14[2], MD_TRANS_POS_Z14[3], value)
	elseif varIndex == 14 then
 		SetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z15[1], MD_TRANS_POS_Z15[2], MD_TRANS_POS_Z15[3], value)
	end
end

function x430044_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0
end

function x430044_ProcCancelImpacts( varMap, varPlayer )
	return 0
end

function x430044_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x430044_ProcDeplete( varMap, varPlayer )

	return 0
end

function x430044_ProcActivateOnce( varMap, varPlayer )
end

function x430044_ProcActivateEachTick( varMap, varPlayer)
	return 1
end
