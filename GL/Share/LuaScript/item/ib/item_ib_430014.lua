---------- 定位传送总脚本,通过这个脚本向子脚本派发
x430014_var_FileId = 430014 
x430014_var_UICommandID = 103
x430014_var_CDTime = 120
x430014_var_lingdicheck 	= {							
							  { varMap= 6,	time1 = 960,time2 = 1020,x1 = 28,x2 = 107,z1 =41,z2 =123},	
							  { varMap= 9,	time1 = 960,time2 = 1020,x1 = 132,x2 = 187,z1 =15,z2 =97},	
							  { varMap= 13,time1 = 960,time2 = 1020,x1 = 31,x2 = 126,z1 =165,z2 =236},   
							  { varMap= 18,time1 = 960,time2 = 1020,x1 = 180,x2 = 210,z1 =28,z2 =60},  	
							  { varMap= 21,time1 = 960,time2 = 1020,x1 = 130,x2 = 288,z1 =70,z2 =191},	
							  { varMap= 24,time1 = 960,time2 = 1020,x1 = 84,x2 = 174,z1 =55,z2 =136},	
							  { varMap= 27,time1 = 960,time2 = 1020,x1 = 100,x2 = 100,z1 =100,z2 =100},   
							  { varMap= 31,time1 = 960,time2 = 1020,x1 = 100,x2 = 100,z1 =100,z2 =100},	
							  { varMap= 34,time1 = 960,time2 = 1020,x1 = 100,x2 = 100,z1 =100,z2 =100},	
							}


x430014_var_Buf1 = 7721

x430014_var_DebugPrint = 0	-- 调试开关
x430014_var_InfoPrint	 = 1  -- 信息开关
x430014_var_ExpressItemTab = {12035279,12035285}	-- 提供限时神行符

function x430014_ProcEventEntry( varMap, varPlayer, varBagIdx ,varUICommandID)
		StartGCDTask(varMap);
		GCDAppendInt(varMap, varBagIdx);
		local CommandID = x430014_var_UICommandID
		if (varUICommandID ~= nil) then
			CommandID = varUICommandID
		end
		DeliverGCDInfo(varMap,varPlayer, CommandID );
		StopGCDTask(varMap);
end

function x430014_CommonConditionCheck(varMap, varPlayer, varBagIdx, varIndex ,newSceneId)
	
	if varMap>=600 and varMap <=649 then
		Msg2Player(varMap,varPlayer,"很抱歉，家园中无法使用该道具",8,2)		
		return 0
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 32584) ~= 0  then
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法使用该道具",8,3)		
		return 0
	end
	
	if  GetWeek() == 6 then
		if 	x430014_lingdicheck(varMap, varPlayer, varIndex) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，在领地争夺战期间，无法使用该道具传送至领地图腾附近。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，在领地争夺战期间，无法使用该道具传送至领地图腾附近。",8,2)		
			return 0	
		end
	
		if 	x430014_houhuayuancheck(varMap, varPlayer, varIndex) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，在决战后花园期间，无法使用该道具传送至后花园。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，在决战后花园期间，无法使用该道具传送至后花园。",8,2)		
			return 0	
		end
	end
	
	if IsBusMember(varMap, varPlayer) == 1 then
		local varMsg = "运镖、乘坐公车或者护送状态时无法使用该道具！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end

	if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
		local varMsg = "很抱歉，未完成铁人三项任务时无法通往其他场景！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end

	if varMap == 14 then
		local varMsg = "舞厅中无法使用该道具！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end

	if varMap == 12 then
		local varMsg = "监狱中无法使用该道具！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end

	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "扛着旗子无法使用该道具！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"扛着旗子无法使用该道具！",8,2)
		return 0
	end

	if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
		return 0
	end
	if GetSceneType(varMap) == 2 then

		local varMsg = "当前场景无法使用该道具！"
		StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end	
	
	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
    
    IsHaveFlagCar = IsHaveSpecificImpact(varMap, varPlayer, 7629 )
    if IsHaveFlagCar ~= 0 then
    	local varMsg = "在战车加护状态下，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
		if 	x430014_NewWorldcheck( varMap, varPlayer, varIndex ) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您的等级不足80级，无法使用地中海传送。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"您的等级不足80级，无法使用地中海传送。",8,2)		
			return 0		
		end  
		if 	x430014_NewWorldcheck( varMap, varPlayer, varIndex ) == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，等级排行榜上第50名玩家不足80级，无法使用地中海传送。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜上第50名玩家不足80级，无法使用地中海传送。",8,2)		
			return 0		
		end    
		if 	x430014_NewWorldcheck( varMap, varPlayer, varIndex ) == 3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "卡迪兹港的征服度不足"..POINT_KADIZI_TRANS.."点，无法使用地中海传送。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"卡迪兹港的征服度不足"..POINT_KADIZI_TRANS.."点，无法使用地中海传送。",8,2)		
			return 0		
		end  
		
		return 1
end

function x430014_CheckCanTrans(varMap, varPlayer, varBagIdx, varIndex ,newSceneId )
	local scriptId = GetItemProperty(varMap, varPlayer, varBagIdx, "ScriptId")
	if LuaCallNoclosure(scriptId, "CheckCanTrans", varMap, varPlayer, varBagIdx, varIndex ,newSceneId) == 1 then
		return 1
	end
	
	return 0
end
function x430014_houhuayuancheck( varMap, varPlayer, varIndex )
	local varRet = 0
    local minute = GetMinOfDay()
	local varMap1 = x430014_GetTransMap(varMap, varPlayer, varIndex)
	local weekIdx = GetWeek()

	if weekIdx == 6 and minute >= 890 and minute <= 900 and varMap1 == 44 then
		varRet = 1
	end	
	return varRet
end

function x430014_lingdicheck( varMap, varPlayer, varIndex )

	local varRet = 0
    local minute = GetMinOfDay()
	local varMap1 = x430014_GetTransMap(varMap, varPlayer, varIndex)
	local posX = x430014_GetTransPosX(varMap, varPlayer, varIndex)
	local posZ = x430014_GetTransPosZ(varMap, varPlayer, varIndex)

	for varI,itm in x430014_var_lingdicheck do
		if varMap1 == itm.varMap and minute >=itm.time1 and minute <= itm.time2 and posX >=itm.x1 and posX <=itm.x2 and posZ >=itm.z1 and posZ <=itm.z2 then
			varRet = 1
			break
		end
	end
	return varRet
end	

function x430014_GetTransMap(varMap, varPlayer, varIndex)
	local value = 0
	if varIndex == 0 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP1[1], MD_TRANS_MAP1[2], MD_TRANS_MAP1[3])	
	elseif varIndex == 1 then
		value =  GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP2[1], MD_TRANS_MAP2[2], MD_TRANS_MAP2[3])
	elseif varIndex == 2 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP3[1], MD_TRANS_MAP3[2], MD_TRANS_MAP3[3])
	elseif varIndex == 3 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP4[1], MD_TRANS_MAP4[2], MD_TRANS_MAP4[3])
	elseif varIndex == 4 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP5[1], MD_TRANS_MAP5[2], MD_TRANS_MAP5[3])
	elseif varIndex == 5 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP6[1], MD_TRANS_MAP6[2], MD_TRANS_MAP6[3])
	elseif varIndex == 6 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP7[1], MD_TRANS_MAP7[2], MD_TRANS_MAP7[3])
	elseif varIndex == 7 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP8[1], MD_TRANS_MAP8[2], MD_TRANS_MAP8[3])
	elseif varIndex == 8 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP9[1], MD_TRANS_MAP9[2], MD_TRANS_MAP9[3])
	elseif varIndex == 9 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP10[1], MD_TRANS_MAP10[2], MD_TRANS_MAP10[3])
	elseif varIndex == 10 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP11[1], MD_TRANS_MAP11[2], MD_TRANS_MAP11[3])	
	elseif varIndex == 11 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP12[1], MD_TRANS_MAP12[2], MD_TRANS_MAP12[3])
	elseif varIndex == 12 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP13[1], MD_TRANS_MAP13[2], MD_TRANS_MAP13[3])
	elseif varIndex == 13 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP14[1], MD_TRANS_MAP14[2], MD_TRANS_MAP14[3])
	elseif varIndex == 14 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_MAP15[1], MD_TRANS_MAP15[2], MD_TRANS_MAP15[3])

	end
	return value
end

function x430014_GetTransPosX(varMap, varPlayer, varIndex)
	local value = 0
	if varIndex == 0 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X1[1], MD_TRANS_POS_X1[2], MD_TRANS_POS_X1[3])	
	elseif varIndex == 1 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X2[1], MD_TRANS_POS_X2[2], MD_TRANS_POS_X2[3])
	elseif varIndex == 2 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X3[1], MD_TRANS_POS_X3[2], MD_TRANS_POS_X3[3])
	elseif varIndex == 3 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X4[1], MD_TRANS_POS_X4[2], MD_TRANS_POS_X4[3])
	elseif varIndex == 4 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X5[1], MD_TRANS_POS_X5[2], MD_TRANS_POS_X5[3])
	elseif varIndex == 5 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X6[1], MD_TRANS_POS_X6[2], MD_TRANS_POS_X6[3])
	elseif varIndex == 6 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X7[1], MD_TRANS_POS_X7[2], MD_TRANS_POS_X7[3])
	elseif varIndex == 7 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X8[1], MD_TRANS_POS_X8[2], MD_TRANS_POS_X8[3])
	elseif varIndex == 8 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X9[1], MD_TRANS_POS_X9[2], MD_TRANS_POS_X9[3])
	elseif varIndex == 9 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X10[1], MD_TRANS_POS_X10[2], MD_TRANS_POS_X10[3])
	elseif varIndex == 10 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X11[1], MD_TRANS_POS_X11[2], MD_TRANS_POS_X11[3])	
	elseif varIndex == 11 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X12[1], MD_TRANS_POS_X12[2], MD_TRANS_POS_X12[3])
	elseif varIndex == 12 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X13[1], MD_TRANS_POS_X13[2], MD_TRANS_POS_X13[3])
	elseif varIndex == 13 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X14[1], MD_TRANS_POS_X14[2], MD_TRANS_POS_X14[3])
	elseif varIndex == 14 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_X15[1], MD_TRANS_POS_X15[2], MD_TRANS_POS_X15[3])

	end
	return value
end

function x430014_GetTransPosZ(varMap, varPlayer, varIndex)
	local value = 0
	if varIndex == 0 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z1[1], MD_TRANS_POS_Z1[2], MD_TRANS_POS_Z1[3])	
	elseif varIndex == 1 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z2[1], MD_TRANS_POS_Z2[2], MD_TRANS_POS_Z2[3])
	elseif varIndex == 2 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z3[1], MD_TRANS_POS_Z3[2], MD_TRANS_POS_Z3[3])
	elseif varIndex == 3 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z4[1], MD_TRANS_POS_Z4[2], MD_TRANS_POS_Z4[3])
	elseif varIndex == 4 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z5[1], MD_TRANS_POS_Z5[2], MD_TRANS_POS_Z5[3])
	elseif varIndex == 5 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z6[1], MD_TRANS_POS_Z6[2], MD_TRANS_POS_Z6[3])
	elseif varIndex == 6 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z7[1], MD_TRANS_POS_Z7[2], MD_TRANS_POS_Z7[3])
	elseif varIndex == 7 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z8[1], MD_TRANS_POS_Z8[2], MD_TRANS_POS_Z8[3])
	elseif varIndex == 8 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z9[1], MD_TRANS_POS_Z9[2], MD_TRANS_POS_Z9[3])
	elseif varIndex == 9 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z10[1], MD_TRANS_POS_Z10[2], MD_TRANS_POS_Z10[3])
	elseif varIndex == 10 then
		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z11[1], MD_TRANS_POS_Z11[2], MD_TRANS_POS_Z11[3])	
	elseif varIndex == 11 then
 		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z12[1], MD_TRANS_POS_Z12[2], MD_TRANS_POS_Z12[3])
	elseif varIndex == 12 then
 		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z13[1], MD_TRANS_POS_Z13[2], MD_TRANS_POS_Z13[3])
	elseif varIndex == 13 then
 		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z14[1], MD_TRANS_POS_Z14[2], MD_TRANS_POS_Z14[3])
	elseif varIndex == 14 then
 		value = GetPlayerGameData(varMap, varPlayer, MD_TRANS_POS_Z15[1], MD_TRANS_POS_Z15[2], MD_TRANS_POS_Z15[3])

	end
	return value
end

function x430014_SetTransMap(varMap, varPlayer, varIndex, varBagIdx, value)
	local scriptId = GetItemProperty(varMap, varPlayer, varBagIdx, "ScriptId")
	if (x430014_var_DebugPrint == 1) then
	WriteLog(1, format("x430014_SetTransMap Debug ...varMap = %d, varPlayer = %d, varIndex = %d, scriptId = %d, value = %d", 
						varMap, varPlayer, varIndex, scriptId, value))
	end
	
	LuaCallNoclosure(scriptId, "SetTransMap", varMap, varPlayer, varIndex, varBagIdx, value)
end

function x430014_SetTransPosX(varMap, varPlayer, varIndex, varBagIdx, value)
	local scriptId = GetItemProperty(varMap, varPlayer, varBagIdx, "ScriptId")
	if (x430014_var_DebugPrint == 1) then
	WriteLog(1, format("x430014_SetTransPosX Debug ...varMap = %d, varPlayer = %d, varIndex = %d, scriptId = %d, value = %d", 
						varMap, varPlayer, varIndex, scriptId, value))
	end
	
	LuaCallNoclosure(scriptId, "SetTransPosX", varMap, varPlayer, varIndex, varBagIdx, value)
end

function x430014_SetTransPosZ(varMap, varPlayer, varIndex, varBagIdx, value)
	local scriptId = GetItemProperty(varMap, varPlayer, varBagIdx, "ScriptId")
	if (x430014_var_DebugPrint == 1) then
	WriteLog(1, format("x430014_SetTransPosZ Debug ...varMap = %d, varPlayer = %d, varIndex = %d, scriptId = %d, value = %d", 
						varMap, varPlayer, varIndex, scriptId, value))
	end
	
	LuaCallNoclosure(scriptId, "SetTransPosZ", varMap, varPlayer, varIndex, varBagIdx, value)
end

function x430014_BeforeTrans(varMap, varPlayer,varIndex)
	if x430014_var_Buf1 >= 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430014_var_Buf1, 0);
	end
end

function x430014_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x430014_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x430014_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x430014_ProcDeplete( varMap, varPlayer )

	return 0
end

function x430014_ProcActivateOnce( varMap, varPlayer )
end

function x430014_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x430014_NewWorldcheck( varMap, varPlayer, varIndex )
	local varRet = 0
	local varMap1 = x430014_GetTransMap(varMap, varPlayer, varIndex)  
	local  guid,Level = GetToplistInfo(varMap,0,49)	
	if varMap1 == 567 or varMap1 == 569 then
		if GetLevel(varMap, varPlayer) < 80 then
			varRet = 1
		elseif 	Level < 80 then
			varRet = 2	
		elseif GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <POINT_KADIZI_TRANS then
			varRet = 3
		end	
	end
	return varRet
end

function x430014_ProcConsumItem( varMap, varPlayer, varBagPos)
	local nCurrentTimes = GetBagItemMultTimes(varMap, varPlayer, varBagPos)
	if (1 == x430014_var_DebugPrint) then
		WriteLog(1, format("x430014_ProcConsumItem Debug == GUID = %X, varBagPos = %d, nCurrentTimes = %d", 
		GetGUID(varMap, varPlayer), varBagPos, nCurrentTimes))
	end
	
	if ((nCurrentTimes <= 1) and (x430014_IsExpressItem(varMap, varPlayer, varBagPos) == 0)) then
		EraseItem(varMap, varPlayer, varBagPos)
	elseif (x430014_IsExpressItem(varMap, varPlayer, varBagPos) == 0) then
		SetBagItemMultTimes(varMap, varPlayer, varBagPos, nCurrentTimes - 1)
	end
	return 1
end

-- 判定是否为特殊显示道具
function x430014_IsExpressItem(varMap, varPlayer, varBagPos)

	local nItemId = GetItemIDByIndexInBag(varMap, varPlayer, varBagPos)
	if (1 == x430014_var_DebugPrint) then
		WriteLog(1, format("x430014_IsExpressItem Debug == GUID = %X, nItemId = %d", 
		GetGUID(varMap, varPlayer), nItemId))
	end
	
	if (-1 == nItemId) then
		return 0
	end
	
	for i, item in x430014_var_ExpressItemTab do
		if (item == nItemId) then
			return 1
		end
	end
	
	return 0
end
