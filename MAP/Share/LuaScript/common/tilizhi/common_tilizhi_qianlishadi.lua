--DECLARE_QUEST_INFO_START--
x330002_var_FileId          			= 330002
x330002_var_QuestName       			= "【体力】完成千里杀敌"
x330002_var_QuestInfo					= "\t后花园的神秘战车已经被勇士们消灭殆尽，如果你愿意付出一些体力值，这点小事就不劳烦英雄出手了，当然你既已付出体力值也会获得全部的任务奖励。"
x330002_var_QuestSuggest				= "\t如果你今天已经领取了#R千里杀敌#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R千里杀敌#W任务。"
x330002_var_QuestId						= {6657, 6658, 6659, 6660}
x330002_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330002_var_ExpParam					= 1750
x330002_var_ChariotHonour			= 160
x330002_var_GuildExp					= 2
x330002_var_OrderPoint					= 1
x330002_var_Level			 					= 70
x330002_var_LevelLess 					= 80
x330002_var_PlayerPhyForce				= 100
x330002_var_QuestName1          = "#cb4b4b4【体力】完成千里杀敌"
x330002_var_GamePlayLogTable ={3102, 3103, 3104}
x330002_var_QuestTable ={
													{CountryId=0, MissionTable={
																											{Name="天山",QuestId=6661,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI,MD_ZHANCHELING_JINGTIANDONGDI1_COUNT}},
																											{Name="昆仑",QuestId=6669,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI2,MD_ZHANCHELING_JINGTIANDONGDI2_COUNT}},
																											{Name="敦煌",QuestId=6673,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI3,MD_ZHANCHELING_JINGTIANDONGDI3_COUNT}},
																										}},
													{CountryId=1, MissionTable={
																											{Name="楼兰",QuestId=6674,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI,MD_ZHANCHELING_JINGTIANDONGDI1_COUNT}},
																											{Name="昆仑",QuestId=6662,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI2,MD_ZHANCHELING_JINGTIANDONGDI2_COUNT}},
																											{Name="敦煌",QuestId=6670,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI3,MD_ZHANCHELING_JINGTIANDONGDI3_COUNT}},
																										}},		
													{CountryId=2, MissionTable={
																											{Name="楼兰",QuestId=6671,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI,MD_ZHANCHELING_JINGTIANDONGDI1_COUNT}},
																											{Name="天山",QuestId=6675,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI2,MD_ZHANCHELING_JINGTIANDONGDI2_COUNT}},
																											{Name="敦煌",QuestId=6663,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI3,MD_ZHANCHELING_JINGTIANDONGDI3_COUNT}},
																										}},		
													{CountryId=3, MissionTable={
																											{Name="楼兰",QuestId=6664,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI,MD_ZHANCHELING_JINGTIANDONGDI1_COUNT}},
																											{Name="天山",QuestId=6672,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI2,MD_ZHANCHELING_JINGTIANDONGDI2_COUNT}},
																											{Name="昆仑",QuestId=6676,QuestMD={MD_HOUHUAYUAN_JINGTIANDONGDI3,MD_ZHANCHELING_JINGTIANDONGDI3_COUNT}},
																										}},																																																																														
												}
x330002_var_QuestMDTable ={
														{MD_HOUHUAYUAN_JINGTIANDONGDI ,MD_ZHANCHELING_JINGTIANDONGDI1_COUNT},
														{MD_HOUHUAYUAN_JINGTIANDONGDI2,MD_ZHANCHELING_JINGTIANDONGDI2_COUNT},
														{MD_HOUHUAYUAN_JINGTIANDONGDI3,MD_ZHANCHELING_JINGTIANDONGDI3_COUNT},
													}												
x330002_var_LeagueQuestTableTemp ={
																		{6677, 6678, 6679, 6680},
																		{6681, 6682, 6683, 6684},
																		{6685, 6686, 6687, 6688},
																		{6689, 6690, 6691, 6692},
																	}
x330002_var_LeagueQuestMatchTable =    {
															    			{6678, 6679, 6680},
															    			{6681, 6683, 6684},
															    			{6685, 6686, 6688},
															    			{6689, 6690, 6691},
															    		 }		
x330002_var_SelectTable ={}															    																	
--DECLARE_QUEST_INFO_STOP--

function x330002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330002_var_Level then
		return
	end
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--    return 
-- 	end	 	
	if (x330002_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI) == GetDayOfYear())  and (x330002_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI2) == GetDayOfYear()) and (x330002_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI3) == GetDayOfYear()) then
			TalkAppendButton(varMap, x330002_var_FileId, x330002_var_QuestName1, 3, -1)
	else 
  		TalkAppendButton(varMap, x330002_var_FileId, x330002_var_QuestName, 3, -1)
	end


end


function x330002_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	if idExt == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x330002_var_QuestInfo)
		for i,j in x330002_var_QuestTable do
			if j.CountryId == GetCurCountry(varMap, varPlayer) then
				for s,t in j.MissionTable do
					local str= x330002_var_QuestName..t.Name
					if x330002_GetMD( varMap, varPlayer, t.QuestMD[1]) == GetDayOfYear() then
						str = "#cb4b4b4"..str
					end
					TalkAppendButton(varMap, x330002_var_FileId, str, 3, s)
				end
			end
		end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	else
		x330002_var_SelectTable[GetGUID(varMap, varPlayer)] =idExt
		local varExp = GetLevel(varMap, varPlayer) * x330002_var_ExpParam
		StartTalkTask(varMap)
			--任务信息
			TalkAppendString(varMap,"#Y"..x330002_var_QuestName..x330002_var_QuestTable[GetCurCountry(varMap, varPlayer) +1].MissionTable[idExt].Name)
			TalkAppendString(varMap,format("%s\n \n\t扣除#R%d#W点体力值，直接完成千里杀敌任务。获得#R经验值#W#G%s#W点、#R战车荣誉#W#G%s#W点。", x330002_var_QuestInfo, x330002_var_PlayerPhyForce, varExp, x330002_var_ChariotHonour))
			TalkAppendString(varMap," ")
	
			--提示信息
			TalkAppendString( varMap,"#G小提示：")
			TalkAppendString( varMap,format("%s", x330002_var_QuestSuggest))
			TalkAppendString( varMap," ")
	
			--奖励信息
			TalkAppendString( varMap,"#Y奖励内容：")
			TalkAppendString( varMap,format("经验值：%s点\n战车荣誉：%s点", varExp, x330002_var_ChariotHonour))		
			TalkAppendString( varMap," ")		
	
			
		StopTalkTask(varMap)
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330002_var_FileId, -1)
	end
end



function x330002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	if GetLevel(varMap, varPlayer) < x330002_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330002_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
--    if GetGuildID( varMap, varPlayer) < 0 then
--        return
--    end

  local selectId =x330002_var_SelectTable[GetGUID(varMap, varPlayer)]
  --是否拥有对应国家的任务，有则不能用体力值完成
	if IsHaveQuest( varMap, varPlayer, x330002_var_QuestTable[GetCurCountry(varMap, varPlayer) +1].MissionTable[selectId].QuestId) > 0 then
		Msg2Player( varMap, varPlayer, x330002_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330002_var_QuestCommentCountOver, 8, 3)
		return
	end 
	--是否拥有对应国家的联盟任务，有则不能用体力值完成、
	if IsHaveQuest( varMap, varPlayer, x330002_var_LeagueQuestMatchTable[GetCurCountry(varMap, varPlayer) +1][selectId]) > 0 then
		Msg2Player( varMap, varPlayer, x330002_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330002_var_QuestCommentCountOver, 8, 3)
		return
	end 
	--是否对应选项的MD已经置过，有则不能完成
	if x330002_GetMD( varMap, varPlayer, x330002_var_QuestMDTable[selectId][1]) == GetDayOfYear() and x330002_GetMD( varMap, varPlayer, x330002_var_QuestMDTable[selectId][2]) >= 1 then
		Msg2Player( varMap, varPlayer, x330002_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330002_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330002_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330002_GetPlayerAward(varMap, varPlayer, selectId)	
	x330002_SetMD( varMap, varPlayer, x330002_var_QuestMDTable[selectId][1], GetDayOfYear())
	x330002_SetMD( varMap, varPlayer, x330002_var_QuestMDTable[selectId][2], 1)
end


function x330002_GetPlayerAward(varMap, varPlayer, selectId)
	local varExp = GetLevel(varMap, varPlayer) * x330002_var_ExpParam
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330002_var_PlayerPhyForce)
 	AddExp(varMap, varPlayer, varExp)
 	AddPlayerChariotHonour(varMap, varPlayer, x330002_var_ChariotHonour)
 	GamePlayScriptLog( varMap, varPlayer, x330002_var_GamePlayLogTable[selectId])
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得战车荣誉奖励：#R%s#cffcf00点.", varExp, x330002_var_ChariotHonour)
	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330002_var_QuestName..x330002_var_QuestTable[GetCurCountry(varMap, varPlayer) +1].MissionTable[selectId].Name), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330002_var_QuestName..x330002_var_QuestTable[GetCurCountry(varMap, varPlayer) +1].MissionTable[selectId].Name));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R战车荣誉"..x330002_var_ChariotHonour.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
  local varRet = CountryIsFortuneTime(varMap,varPlayer,5)
  --战车令额外获得2倍的经验和战车荣誉
	if varRet == 1 then
		local AddThirdExp = varExp * 2
		local AddThirdHonour = x330002_var_ChariotHonour * 2
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


function x330002_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330002_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330002_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330002_var_Level then
		return	0
	end
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
 --   return 	0
 --	end	 	
	if (x330002_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI) == GetDayOfYear())  and (x330002_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI2) == GetDayOfYear()) and (x330002_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI3) == GetDayOfYear()) then
			TalkAppendButton(varMap, x330002_var_FileId, x330002_var_QuestName1, 3, -1)
	else 
  		TalkAppendButton(varMap, x330002_var_FileId, x330002_var_QuestName, 3, -1)
	end
	
	return 1


end
