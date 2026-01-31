--DECLARE_QUEST_INFO_START--
x330001_var_FileId          			= 330001
x330001_var_QuestName       			= "【体力】完成争夺机甲"
x330001_var_QuestInfo					= "\t最近帝国新进了一批先进的机甲零件用于补给，如果你愿意付出一些体力值将不再需要亲自去争夺后花园粮仓中的战车机甲零件。"
x330001_var_QuestSuggest				= "\t如果你今天已经领取了#R争夺机甲#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R争夺机甲#W任务。"
x330001_var_QuestId						= {6657, 6658, 6659, 6660}
x330001_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330001_var_ExpParam					= 3000
x330001_var_ChariotHonour			= 360
x330001_var_GuildExp					= 2
x330001_var_OrderPoint					= 1
x330001_var_Level			 					= 70
x330001_var_LevelLess 					= 80
x330001_var_PlayerPhyForce				= 180
x330001_var_QuestName1          = "#cb4b4b4【体力】完成争夺机甲"

--DECLARE_QUEST_INFO_STOP--

function x330001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330001_var_Level then
		return
	end
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
 --   return 
 --	end	
	local varquest = x330001_GetQuestID(varMap,varPlayer)
 	
		if x330001_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, varquest) <= 0 then
			TalkAppendButton(varMap, x330001_var_FileId, x330001_var_QuestName, 3, 1)
  		else 
    		TalkAppendButton(varMap, x330001_var_FileId, x330001_var_QuestName1, 3, 1)
		end


end


function x330001_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
--   if GetGuildID( varMap, varPlayer) < 0 then
--      Msg2Player( varMap, varPlayer, "你还不属于任何帮会，不能领取此任务", 8, 2)
--      Msg2Player( varMap, varPlayer, "你还不属于任何帮会，不能领取此任务", 8, 3)
--      
--      return
--   end
	local varExp = GetLevel(varMap, varPlayer) * x330001_var_ExpParam
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330001_var_QuestName)
		TalkAppendString(varMap,format("%s\n \n\t扣除#R%d#W点体力值，直接完成争夺机甲任务。获得#R经验值#W#G%s#W点、#R战车荣誉#W#G%s#W点。", x330001_var_QuestInfo, x330001_var_PlayerPhyForce, varExp, x330001_var_ChariotHonour))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330001_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n战车荣誉：%s点", varExp, x330001_var_ChariotHonour))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330001_var_FileId, -1)

end



function x330001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	if GetLevel(varMap, varPlayer) < x330001_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330001_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
--    if GetGuildID( varMap, varPlayer) < 0 then
--        return
--    end

    
	for varI = 1, 4 do
		if IsHaveQuest( varMap, varPlayer, x330001_var_QuestId[varI]) > 0 then
			Msg2Player( varMap, varPlayer, x330001_var_QuestCommentCountOver, 8, 2)
			Msg2Player( varMap, varPlayer, x330001_var_QuestCommentCountOver, 8, 3)
			return
		end
	end
	if x330001_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU) == GetDayOfYear() and x330001_GetMD( varMap, varPlayer, MD_ZHANCHELING_YUANZHENGZHILU_COUNT) >= 1 then
		Msg2Player( varMap, varPlayer, x330001_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330001_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330001_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330001_GetPlayerAward(varMap, varPlayer)	
	x330001_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU, GetDayOfYear())
	x330001_SetMD( varMap, varPlayer, MD_ZHANCHELING_YUANZHENGZHILU_COUNT, 1)
end


function x330001_GetPlayerAward(varMap, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330001_var_ExpParam
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330001_var_PlayerPhyForce)
 	AddExp(varMap, varPlayer, varExp)
 	AddPlayerChariotHonour(varMap, varPlayer, x330001_var_ChariotHonour)
 	GamePlayScriptLog( varMap, varPlayer, 3101)
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得战车荣誉奖励：#R%s#cffcf00点.", varExp, x330001_var_ChariotHonour)
	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330001_var_QuestName), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330001_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R战车荣誉"..x330001_var_ChariotHonour.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
  local varRet = CountryIsFortuneTime(varMap,varPlayer,5)
  --战车令额外获得2倍的经验和战车荣誉
	if varRet == 1 then
		local AddThirdExp = varExp * 2
		local AddThirdHonour = x330001_var_ChariotHonour * 2
		AddExp(varMap, varPlayer, AddThirdExp)
		AddPlayerChariotHonour(varMap, varPlayer, AddThirdHonour) 		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o战车令额外获得#R经验"..AddThirdExp.."点#o的奖励")
		StopTalkTask();		
		DeliverTalkTips(varMap, varPlayer);		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o战车令额外获得#R战车荣誉"..AddThirdHonour.."点#o的奖励")		
		StopTalkTask();		
		DeliverTalkTips(varMap, varPlayer);				
  	Msg2Player(varMap,varPlayer,format("战车令额外获得经验奖励#R%s#cffcf00点",AddThirdExp),8,2)
 		Msg2Player(varMap,varPlayer,format("战车令额外获得战车荣誉奖励#R%s#cffcf00点",AddThirdHonour ),8,2)   		
	end     
end

function x330001_GetQuestID(varMap,varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
		if varCountry == 0 then
			return x330001_var_QuestId[1]
		elseif varCountry == 1 then                                                  
			return x330001_var_QuestId[2]
		elseif varCountry == 2 then	                                                
			return x330001_var_QuestId[3]
		elseif varCountry == 3 then                                                  
			return x330001_var_QuestId[4]
		end	

end

function x330001_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330001_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330001_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330001_var_Level then
		return	0
	end
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--    return 0
 --	end	
	local varquest = x330001_GetQuestID(varMap,varPlayer)
 	
		if x330001_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, varquest) <= 0 then
			TalkAppendButton(varMap, x330001_var_FileId, x330001_var_QuestName, 3, 1)
  		else 
    		TalkAppendButton(varMap, x330001_var_FileId, x330001_var_QuestName1, 3, 1)
		end
		return 1


end
