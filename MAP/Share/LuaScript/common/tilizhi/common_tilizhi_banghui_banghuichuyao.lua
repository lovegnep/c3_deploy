--DECLARE_QUEST_INFO_START--
x330054_var_FileId          			= 330054
x330054_var_QuestName       			= "【体力】完成帮会除妖"
x330054_var_QuestInfo					= "\t帮会的建设是必不可少的，但有时候你是不是也想偷个小懒？呵呵，那就用体力值来直接完成#R帮会除妖#W吧。"
x330054_var_QuestSuggest				= "\t如果你今天已经领取了#R帮会除妖#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R帮会除妖#W任务。"
x330054_var_QuestId				=	{
											{ 8532,8533,8534,8535,8536,8537,8508,8509,8510,8511,8512,8513  },
											{ 8538,8539,8540,8541,8542,8543,8514,8515,8516,8517,8518,8519  },
											{ 8544,8545,8546,8547,8548,8549,8520,8521,8522,8523,8524,8525  },
											{ 8550,8551,8552,8553,8554,8555,8526,8527,8528,8529,8530,8531  },
											}

x330054_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330054_var_ExpParam					= 26000
x320008_var_BonusMoney8						= 100
x330054_var_GuildExp					= 1
x330054_var_OrderPoint					= 2
x330054_var_Level			 					= 70
x330054_var_LevelLess 					= 80
x330054_var_PlayerPhyForce				= 200
x330054_var_GuildLevelMin      =3 
x330054_var_QuestName1          = "#cb4b4b4【体力】完成帮会除妖"

--DECLARE_QUEST_INFO_STOP--

function x330054_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330054_var_Level then
		return
	end
	 if GetGuildID( varMap, varPlayer) < 0 then
	    return
	 end
		local varCountry = GetCurCountry( varMap, varPlayer )
		local ishavequest = 0
		for varI,itm in x330054_var_QuestId[varCountry+1] do
			if IsHaveQuestNM( varMap, varPlayer, itm ) > 0 then	
			ishavequest = 1
			break
			end
		end

	--local varquest = x330054_GetQuestID(varMap,varPlayer)
 	
		if x330054_GetMD( varMap, varPlayer, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE) ~= GetDayOfYear()  and ishavequest == 0 then
			TalkAppendButton(varMap, x330054_var_FileId, x330054_var_QuestName, 3, 1)
  		else 
    		TalkAppendButton(varMap, x330054_var_FileId, x330054_var_QuestName1, 3, 1)
		end


end


function x330054_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer ) ) < 70 then
--			Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,2)
--			Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
  --    return 
  end
  
   if GetGuildID( varMap, varPlayer) < 0 then
      Msg2Player( varMap, varPlayer, "你还不属于任何帮会，不能领取此任务", 8, 2)
      Msg2Player( varMap, varPlayer, "你还不属于任何帮会，不能领取此任务", 8, 3)
      return
   end

	local varGuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
	if varGuildLevel < x330054_var_GuildLevelMin then
    Msg2Player( varMap, varPlayer, "帮会等级不足3级，不能领取此任务", 8, 2)
    Msg2Player( varMap, varPlayer, "帮会等级不足3级，不能领取此任务", 8, 3)
		return
	end
	local varExp = x330054_GetExpBonus(varMap, varPlayer)
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330054_var_QuestName)
		TalkAppendString(varMap,format("%s\n \n\t扣除#R200#W点体力值，直接完成帮会除妖任务。获得#R经验值#W#G%s#W点、#R帮贡#W#G%s#W点、#R帮会经验#W#G%s#W点、#R使命点#W#G%s#W点奖励。", x330054_var_QuestInfo, varExp, x320008_var_BonusMoney8, x330054_var_GuildExp, x330054_var_OrderPoint))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330054_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n帮贡：%s点\n帮会经验：%s点\n使命点：%s点", varExp, x320008_var_BonusMoney8, x330054_var_GuildExp, x330054_var_OrderPoint))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330054_var_FileId, -1)

end



function x330054_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		if GetLevel(varMap, varPlayer) < x330054_var_LevelLess then
			local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330054_var_LevelLess)
			Msg2Player( varMap, varPlayer, str, 8, 3)
			return
		end
	
    if GetGuildID( varMap, varPlayer) < 0 then
        return
    end
		local varCountry = GetCurCountry( varMap, varPlayer )
		for varI,itm in x330054_var_QuestId[varCountry+1] do
			if IsHaveQuestNM( varMap, varPlayer, itm ) > 0 then	
			Msg2Player( varMap, varPlayer, x330054_var_QuestCommentCountOver, 8, 2)
			Msg2Player( varMap, varPlayer, x330054_var_QuestCommentCountOver, 8, 3)
			return
			end
		end
    
	if x330054_GetMD( varMap, varPlayer, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE) == GetDayOfYear() and x330054_GetMD( varMap, varPlayer, MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT) >= 1 then
		Msg2Player( varMap, varPlayer, x330054_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330054_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330054_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330054_GetPlayerAward(varMap, varPlayer)	
	x330054_SetMD( varMap, varPlayer, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE, GetDayOfYear())
	x330054_SetMD( varMap, varPlayer, MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT, 1)
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,3)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,3)
end


function x330054_GetPlayerAward(varMap, varPlayer)
	local varExp = x330054_GetExpBonus(varMap, varPlayer)
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330054_var_PlayerPhyForce)
 	AddExp(varMap, varPlayer, varExp)
 	AddGuildShiMing(varMap, varPlayer,x330054_var_OrderPoint)
 	AddGuildUserPoint(varMap,varPlayer,x320008_var_BonusMoney8)	
 	AddGuildExp(varMap,varPlayer,x330054_var_GuildExp)
 	GamePlayScriptLog( varMap, varPlayer, 3072)
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得帮贡奖励：#R%s#cffcf00点\n获得帮会经验奖励：#R%s#cffcf00点\n获得使命点奖励：#R%s#cffcf00点", varExp, x320008_var_BonusMoney8, x330054_var_GuildExp, x330054_var_OrderPoint)
	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330054_var_QuestName), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330054_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..varExp.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R帮贡"..x320008_var_BonusMoney8.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer) 	
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R帮会经验"..x330054_var_GuildExp.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer) 
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R使命点"..x330054_var_OrderPoint.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)         
end

function x330054_GetQuestID(varMap,varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
		if varCountry == 0 then
			return x330054_var_QuestId[1]
		elseif varCountry == 1 then                                                  
			return x330054_var_QuestId[2]
		elseif varCountry == 2 then	                                                
			return x330054_var_QuestId[3]
		elseif varCountry == 3 then                                                  
			return x330054_var_QuestId[4]
		end	

end

function x330054_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330054_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330054_GetExpBonus(varMap, varPlayer)

	local varLevel = GetLevel(varMap, varPlayer)
	local guildid = GetGuildID( varMap, varPlayer )
	local GuildLevel = GetGuildSimpleData(guildid)	
	local varExpBonus = ceil ( (100 * 3 * varLevel * 15*1*1 ) )
	varExpBonus =floor(varExpBonus+0.5)
	
		if 	GuildLevel == 2 then
			varExpBonus = floor(varExpBonus*1.25)
		elseif 	GuildLevel == 3 then
			varExpBonus = floor(varExpBonus*1.5)
		elseif	GuildLevel == 4 then
			varExpBonus = floor(varExpBonus*1.75)
		elseif 	GuildLevel == 5 then
			varExpBonus = floor(varExpBonus*2)
		elseif 	GuildLevel == 5 then
			varExpBonus = floor(varExpBonus*2.25)
		elseif 	GuildLevel == 5 then
			varExpBonus = floor(varExpBonus*2.5)
		end
		return varExpBonus
end

function x330054_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330054_var_Level then
		return 0
	end
	 if GetGuildID( varMap, varPlayer) < 0 then
	    return 0
	 end
		local varCountry = GetCurCountry( varMap, varPlayer )
		local ishavequest = 0
		for varI,itm in x330054_var_QuestId[varCountry+1] do
			if IsHaveQuestNM( varMap, varPlayer, itm ) > 0 then	
			ishavequest = 1
			break
			end
		end

	--local varquest = x330054_GetQuestID(varMap,varPlayer)
 	
		if x330054_GetMD( varMap, varPlayer, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE) ~= GetDayOfYear()  and ishavequest == 0 then
			TalkAppendButton(varMap, x330054_var_FileId, x330054_var_QuestName, 3, 1)
  		else 
    		TalkAppendButton(varMap, x330054_var_FileId, x330054_var_QuestName1, 3, 1)
		end

		return 1
end
