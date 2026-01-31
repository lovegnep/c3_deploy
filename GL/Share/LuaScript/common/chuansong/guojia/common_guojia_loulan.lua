

--DECLARE_QUEST_INFO_START--
x550400_var_FileId = 550400
x550400_var_QuestName1 = "前往楼兰边塞"
x550400_var_QuestName2 = "前往天山边塞"
x550400_var_QuestName3 = "前往昆仑边塞"
x550400_var_QuestName4 = "前往敦煌边塞"   
x550400_var_SceneID1 =51								
x550400_var_SceneID2 =151	  						 
x550400_var_SceneID3 =251								
x550400_var_SceneID4 =351								
x550400_var_QuestInfo=" "  
x550400_var_QuestInfo2=""
x550400_var_QuestQuestID	=	-1
x550400_var_QuestComplete="  "					
x550400_var_ContinueInfo="    "
x550400_var_Notice = "您的等级还不足#R40级#Y，无法前往其他国家！"

x550400_var_MoneyBonus = 10000
x550400_var_TuchengzhanQuestID = 7559

x550400_var_ItemBonus={}


x550400_var_RadioItemBonus={}

--DECLARE_QUEST_INFO_STOP--
x550400_var_ExpBonus = 1000






function x550400_ProcEventEntry(varMap, varPlayer, varTalknpc)
local minute = GetMinOfDay()	
local weekIdx = GetWeek()
         
if minute >= 900 and minute < 1020 then
	if 	x550400_IsLouLanRuoGuo(varMap, varPlayer) > 0 then
		if x550400_IsLianMeng(varMap, varPlayer) ~= 1 then
			if x550400_IsBenGuo(varMap, varPlayer) == 0 then
				if weekIdx == 6 then
					if IsHaveQuestNM(varMap, varPlayer, x550400_var_TuchengzhanQuestID ) <= 0 then
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法前往弱国！",8,2)
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法前往弱国！",8,3)		
						return				
					end
				else				
				--if CountryIsFortuneTimeEx(0,0) > 0 or CountryIsFortuneTimeEx(0,1) > 0 then
					Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法前往弱国！",8,2)
					Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法前往弱国！",8,3)
					return
			--	end
				end
			end
		end
	end
end
	local selfType = GetObjType(varMap, varPlayer)
	if selfType == 1 then 
		
		if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
		
		
	end
	
	if selfType == 9 then	
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			local daduSceneId = 0
			ReadyBusChangeScene(varMap, daduSceneId,varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				NewWorld(varMap,varObj,x550400_var_SceneID1,407,298, 550400)
			end
			
			DeleteBus(varMap, varPlayer,0)
			return
		end
	elseif selfType == 1 then	





	end
	
	local varText = ""
	local CanTrans = IsCashboxState(varMap,varPlayer)	
	if CanTrans == 1 then
		StartTalkTask(varMap)
			varText = "#Y运镖或者护送状态中，不允许传送"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < 40 then 
		Msg2Player(varMap,varPlayer,"#Y"..x550400_var_Notice.."#W",4,3)
	else
		NewWorld(varMap,varPlayer,x550400_var_SceneID1,407,298, 550400)
	end
	
end









function x550400_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if varMap ~= x550400_var_SceneID1 then
		TalkAppendButton(varMap, x550400_var_FileId, x550400_var_QuestName1)
	end
	
end









function x550400_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end








function x550400_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550400_ProcAccept(varMap, varPlayer)

    
end









function x550400_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x550400_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x550400_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	
end






function x550400_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x550400_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
function x550400_IsLouLanRuoGuo(varMap, varPlayer)
  local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	if maxlevel >= 70 then
			if loulanscore <= allscore*0.2 then
				if x550400_IsMinGuo(varMap, varPlayer) == 1 then
	 	 			return 1
	 	 		end
			end
	end
	return 0
end

function x550400_IsLianMeng(varMap, varPlayer)
	local varCountryID = GetCurCountry(varMap, varPlayer )
	
	if IsLeague( varCountryID, 0 ) == 1 then
	    return 1
	end
	
	return 0
		
end
function x550400_IsBenGuo(varMap, varPlayer)
local country = GetCurCountry(varMap, varPlayer )
 		if country == 0 then
 			return 1
 		end
 	return 0
end
function x550400_IsMinGuo(varMap, varPlayer)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local MinGuo = loulanscore
	local Onlyvalue = 0
		for varI = 0, 3 do
			if GetCountryParam(varMap, varI, CD_LASTWEEK_STRONG_WEAK_JIFEN) <= MinGuo then
				Onlyvalue = Onlyvalue + 1
			end
		end
		if Onlyvalue == 1 then
			return 1
		end
	return 0
end	
