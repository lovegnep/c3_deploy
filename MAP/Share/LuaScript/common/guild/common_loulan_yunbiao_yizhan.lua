
--DECLARE_QUEST_INFO_START--
x300680_var_FileId 					= 	300680                  
x300680_var_QuestKind 				= 	1                       
x300680_var_QuestName				= 	"【帮会】神兽驿站"      

x300680_var_QuestCompleted			= 	"\t神兽经过休息后，体力更足了，请收下驿站给您的奖励！"  
x300680_var_QuestInfo				= 	"\t每当帮会护送神兽时，神兽最好在我这里稍做休息。同时在帮主身边的帮众会获得经验奖励，当您完成护送神兽任务时也会获得经验奖励加成。"  	

--DECLARE_QUEST_INFO_STOP--


x300680_var_BonusMoney8               =   100  
x300680_var_GuildExpBonus				=	1
x300680_var_Leader_Index = 5					
x300680_var_Exp = 100*3*25*1*1*0.4
x300680_var_LogId = 111
x300680_var_RingQuestIndex = 1				

x300680_var_GameOpenId				= 1062

x300680_var_CountryList = {
							{ countryId = 0 , submitNpcGuid = 124534, misId = 7024, misEndId = 7002 },
							{ countryId = 1 , submitNpcGuid = 127540, misId = 7705, misEndId = 7023 },
							{ countryId = 2 , submitNpcGuid = 130531, misId = 7706, misEndId = 7022 },
							{ countryId = 3 , submitNpcGuid = 133501, misId = 7707, misEndId = 7021 },							
						}


function x300680_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById(x300680_var_GameOpenId) <= 0 then
		return
	end
		
	local pos = GetGuildOfficial(varMap, varPlayer)
  	if pos ~= x300680_var_Leader_Index then			
  		return 0
 	end
	
	local misId = 0
	local misEndId = 0

	for varI,itm in x300680_var_CountryList do
		if itm.countryId == GetCurCountry(varMap, varPlayer) then
			misId = itm.misId
			misEndId = itm.misEndId
			break
		end
	end

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, misEndId); 
	local isFinishing = GetQuestParam( varMap, varPlayer,varQuestIdx,x300680_var_RingQuestIndex )
	if isFinishing == 1 then
		return
	end
	
	if IsHaveQuestNM(varMap, varPlayer, misId) <= 0 then
		
	end
		
	TalkAppendButton(varMap,misId,x300680_var_QuestName,8)
	
end




function x300680_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varExtIdx)	

	local misId = 0
	local submitNpcGuid = -1

	for varI,itm in x300680_var_CountryList do
		if itm.countryId == GetCurCountry(varMap, varPlayer) then
			misId = itm.misId
			submitNpcGuid = itm.submitNpcGuid
			break
		end
	end
	
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, misId);
	if(varHaveQuest > 0) then
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if submitNpcGuid == varTalkNpcGUID then
			x300680_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,misId) 
		end

	else
		if varExtIdx ~= x300680_var_FileId then
			x300680_DispatchQuestInfo( varMap, varPlayer, varTalknpc, misId )	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有神兽任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc);			
		end

	end
		
end




function x300680_DispatchCompletedInfo( varMap, varPlayer, varTalknpc, misId )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300680_var_QuestName)
		TalkAppendString(varMap,x300680_var_QuestCompleted)
		TalkAppendString(varMap," ")

  		

		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = x300680_var_Exp * varLevel
		varExpBonus =floor(varExpBonus+0.5)
	    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,  varExpBonus);
		end

		
		
			
		
		
		
			
		

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300680_var_FileId, misId);

end




function x300680_DispatchQuestInfo( varMap, varPlayer, varTalknpc, misId )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300680_var_QuestName)
		TalkAppendString(varMap,format("%s", x300680_var_QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString(varMap,"\n#Y奖励内容：")
		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = x300680_var_Exp * varLevel
		varExpBonus =floor(varExpBonus+0.5)
	    if varExpBonus > 0 then
			TalkAppendString(varMap,"经验值："..varExpBonus.."点")
			
		end
		
		if varLevel >= 80 then
			local refixInhExp = RefixInherenceExp(varMap, varPlayer, 300)
			local varStr = format("天赋值：%d点", refixInhExp)
			TalkAppendString(varMap, varStr)
		end
		
		
			
		
		
		
			
		
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300680_var_FileId,misId);
	
end


function x300680_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300680_var_GameOpenId) <= 0 then
		return
	end
	
	
	local pos = GetGuildOfficial(varMap, varPlayer)
  	if pos ~= x300680_var_Leader_Index then			
  	
  		StartTalkTask(varMap)
		TalkAppendString(varMap, "抱歉，您不是帮主，没有权利领取奖励！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "抱歉，您不是帮主，没有权利领取奖励！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
  		return 0
  		
 	end
 	
 	 
	local misEndId = 0
	for varI,itm in x300680_var_CountryList do
		if itm.countryId == GetCurCountry(varMap, varPlayer) then
			misEndId = itm.misEndId
			break
		end
	end
	
	if IsHaveQuestNM( varMap, varPlayer, misEndId ) == 0 then	
  		StartTalkTask(varMap)
		TalkAppendString(varMap, "抱歉，您没有接受护兽任务，没有权利领取奖励！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "抱歉，您没有接受护兽任务，没有权利领取奖励！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
  	
	local varValid = IsValidGuildBus(varMap, varPlayer)
	if varValid == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您距离镖车过远，无法提交护送神兽任务！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o您距离镖车过远，无法提交护送神兽任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
 	
 	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_YUNBIAO_RING_MIS_TIME, x300680_var_FileId,misEndId,"ProcReturn")

end

function x300680_ProcReturn(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	
	if QuestData == 0 then					

		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您已经领取过了，请改天再来吧！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "很抱歉，您已经领取过了，请改天再来吧！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)		
		return
		
	end

	local misEndId = 0
	for varI,itm in x300680_var_CountryList do
		if itm.countryId == GetCurCountry(varMap, varPlayer) then
			misEndId = itm.misEndId
			break
		end
	end
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, misEndId) 
	local isFinishing = GetQuestParam( varMap, varPlayer,varQuestIdx,x300680_var_RingQuestIndex )
	if isFinishing == 1 then
		return
	end
	SetQuestByIndex(varMap, varPlayer, varQuestIdx, x300680_var_RingQuestIndex, 1);	
	
	
	local GuildID = GetGuildID(varMap,varPlayer)
	SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_RING_MIS_TIME, 1)
	
 	
	local varX,z = GetWorldPos(varMap,varPlayer)
	local playerCount =  GetNearCountryCount(varMap, varPlayer,varX,z,25)  

	for varI = 0, playerCount-1 do

		
		local humanObjId = GetNearCountryMember(varMap, varPlayer,varI) 
		if GetGuildID(varMap, humanObjId) == GuildID then

			
			if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
				
				x300680_GetBonus( varMap,humanObjId, varMemberCount )
			end

		end

	end

end

function x300680_GetBonus( varMap, varPlayer, varMemberCount )	

	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = x300680_var_Exp * varLevel
	varExpBonus =floor(varExpBonus+0.5)
    if varExpBonus > 0 then
		if GetHp(varMap, varPlayer) > 0 then
			AddExp(varMap, varPlayer, varExpBonus);
			StartTalkTask(varMap)
			TalkAppendString(varMap, "获得#R经验"..varExpBonus.."点#o的奖励" );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"获得#R经验"..varExpBonus.."点#o的奖励",8,2)	
		end
	end
	if GetLevel(varMap,varPlayer) >= 80 then
		local refixInhExp = AddInherenceExp(varMap,varPlayer,300)
		local varStr = format("获得#R天赋值%d点#o的奖励", refixInhExp)
		StartTalkTask(varMap)
		TalkAppendString(varMap, varStr );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varStr,8,2)
	end
	
    
		
		
		
		
		
		
		
	

	
	
	
		
		
			
			
		
			
			
	

	
	GamePlayScriptLog(varMap,varPlayer,x300680_var_LogId)	
	
	
	local misEndId = 0
	for varI,itm in x300680_var_CountryList do
		if itm.countryId == GetCurCountry(varMap, varPlayer) then
			misEndId = itm.misEndId
			break
		end
	end
		
end


