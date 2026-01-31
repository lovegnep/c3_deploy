--DECLARE_QUEST_INFO_START--
x330019_var_FileId          			= 330019
x330019_var_QuestName       			= "【体力】完成皇帝密令"
x330019_var_QuestInfo					= "\t皇上体恤下属，特派我在此助你办事，你如身上还有要事须办，可在我这里快速完成皇帝密令任务。"
x330019_var_QuestSuggest				= "\t如果你今天已经领取了#R皇帝密令#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R皇帝密令#W任务。"
x330019_var_QuestId						= 7790
x330019_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330019_var_CoffExp						= {120000, 12000, 2400, 1200} 
x330019_var_Genius						= 770
x330019_var_Money						= 100000
x330019_var_Level			 					= 75
x330019_var_LevelLess 					= 90
x330019_var_PlayerPhyForce				= 300
x330019_var_PlayerExp						= 1200
x330019_var_QuestName1          = "#cb4b4b4【体力】完成皇帝密令"

--DECLARE_QUEST_INFO_STOP--


function x330019_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330019_var_Level then
		return
	end
	
	if x330019_GetMD( varMap, varPlayer, MD_HUANGDIMILING_DATE) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, x330019_var_QuestId) <= 0 then
		TalkAppendButton(varMap, x330019_var_FileId, x330019_var_QuestName, 3, 1)
  	else 
    	TalkAppendButton(varMap, x330019_var_FileId, x330019_var_QuestName1, 3, 1)
	end
end


function x330019_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	local varExp = GetLevel(varMap, varPlayer) * (1200 * 3 +7000)
	local Genius = RefixInherenceExp( varMap, varPlayer, x330019_var_Genius)
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330019_var_QuestName)
		TalkAppendString(varMap,format("%s\n\t需要扣除#R%d#W点体力值，直接完成#R皇帝密令#W任务。你将获得#R经验值#W#G%s#W点、#R帮会金钱#G#{_MONEY%d}#W奖励、#R天赋奖励#W#G%s#W点。",x330019_var_QuestInfo, x330019_var_PlayerPhyForce, varExp, x330019_var_Money, Genius))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330019_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n帮会金钱：#{_MONEY%d}\n天赋：%s点", varExp, x330019_var_Money, Genius))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330019_var_FileId, -1)

end



function x330019_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		if GetLevel(varMap, varPlayer) < x330019_var_LevelLess then
			local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330019_var_LevelLess)
			Msg2Player( varMap, varPlayer, str, 8, 3)
			return
		end
		
    if GetGuildID( varMap, varPlayer) < 0 then
      Msg2Player( varMap, varPlayer, "你还不属于任何帮会，不能领取此任务", 8, 2)
      Msg2Player( varMap, varPlayer, "你还不属于任何帮会，不能领取此任务", 8, 3)    
        return
    end
    
    
--	if IsQuestHaveDone(varMap, varPlayer, 1407) <= 0 then
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】皇帝的密旨", 8, 2)
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】皇帝的密旨", 8, 3)		
--		return 
--	end	
	if IsHaveQuest( varMap, varPlayer, x330019_var_QuestId) > 0 then
		Msg2Player( varMap, varPlayer, x330019_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330019_var_QuestCommentCountOver, 8, 3)
		return
	end

	if x330019_GetMD( varMap, varPlayer, MD_HUANGDIMILING_DATE) == GetDayOfYear() then
		Msg2Player( varMap, varPlayer, x330019_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330019_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330019_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330019_GetPlayerAward(varMap, varPlayer)	
	x330019_SetMD( varMap, varPlayer, MD_HUANGDIMILING_DATE, GetDayOfYear())
end


function x330019_GetPlayerExp(varMap, varPlayer)
	local rnd = random(1, 1000)
	local varLevel = GetLevel(varMap, varPlayer)
	local xp = 0
	if rnd <= 101 then
		xp = varLevel * (x330019_var_CoffExp[2]*3 + 7000)
		return xp, rnd
	elseif rnd <= 501 and rnd > 101 then
		xp = varLevel * (x330019_var_CoffExp[3]*3 + 7000)
		return xp, rnd
	else
		xp = varLevel * (x330019_var_CoffExp[4]*3 + 7000)
		return xp, rnd
	end

end


function x330019_GetPlayerAward(varMap, varPlayer)
	local varExp, rnd = x330019_GetPlayerExp(varMap, varPlayer)
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
		local Genius = RefixInherenceExp( varMap, varPlayer, x330019_var_Genius)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330019_var_PlayerPhyForce)	
 	AddExp(varMap, varPlayer, varExp)	
	AddGuildMoney(varMap,varPlayer,x330019_var_Money)
	AddInherenceExp( varMap, varPlayer, x330019_var_Genius)
	GamePlayScriptLog( varMap, varPlayer, 3093)
  Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330019_var_QuestName), 8, 2) 
	if rnd <= 101 then
		Msg2Player( varMap, varPlayer, "恭喜您幸运的获得#R10倍经验奖励#cffcf00", 8, 2)
	elseif rnd <= 501 and rnd > 101 then
		Msg2Player( varMap, varPlayer, "恭喜您幸运的获得#R双倍经验奖励#cffcf00", 8, 2)	
	end		
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得帮会金钱奖励：#R#{_MONEY%d}\n#cffcf00获得天赋奖励：#R%s#cffcf00点.", varExp, x330019_var_Money, Genius)

	Msg2Player( varMap, varPlayer, varMessage, 8, 2)

    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330019_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
  
	  if rnd <= 101 then
	    StartTalkTask(varMap)
	    TalkAppendString(varMap,"恭喜您幸运的获得#R10倍经验奖励#cffcf00");
	    StopTalkTask(varMap) 
	    DeliverTalkTips(varMap,varPlayer)
		elseif rnd <= 501 and rnd > 101 then
	    StartTalkTask(varMap)
	    TalkAppendString(varMap,"恭喜您幸运的获得#R双倍经验奖励#cffcf00");
	    StopTalkTask(varMap) 
	    DeliverTalkTips(varMap,varPlayer)
		end		
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..varExp.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,format("获得#R帮会金钱#R#{_MONEY%d}#cffcf00的奖励",x330019_var_Money))
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)  	
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R天赋"..Genius.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)	
end


function x330019_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330019_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330019_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330019_var_Level then
		return	0
	end
	
	if x330019_GetMD( varMap, varPlayer, MD_HUANGDIMILING_DATE) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, x330019_var_QuestId) <= 0 then
		TalkAppendButton(varMap, x330019_var_FileId, x330019_var_QuestName, 3, 1)
  	else 
    	TalkAppendButton(varMap, x330019_var_FileId, x330019_var_QuestName1, 3, 1)
	end
	return 1
end
