--DECLARE_QUEST_INFO_START--
x330024_var_FileId          			= 330024
x330024_var_QuestName       			= "【体力】完成护送物资"
x330024_var_QuestInfo					= "\t沙城军需官和我也有几分交情，他最近告诉说，如果有人想要直接完成护送物资的任务，让我帮他行个方便。你如有此意，就在这里直接完成任务吧。"
x330024_var_QuestSuggest				= "\t如果你今天已经领取了#R护送物资#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R护送物资#W任务。"
x330024_var_QuestId						= {9205, 9206, 9207, 9208}
x330024_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330024_var_ExpParam					= {
{level = 60,  nexp = 1400},
{level = 70,  nexp = 2000},
}
x330024_var_CountryRes					= 1
x330024_var_CangBaoTu					= 12035017
x330024_var_Level								= 60
x330024_var_LevelLess 					= 70
x330024_var_PlayerPhyForce				= 60
x330024_var_QuestName1          = "#cb4b4b4【体力】完成护送物资"
--DECLARE_QUEST_INFO_STOP--

function x330024_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330024_var_Level then
		return
	end

	local varquest = x330024_GetQuestID(varMap,varPlayer)
		if x330024_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, varquest) <= 0 then
			TalkAppendButton(varMap, x330024_var_FileId, x330024_var_QuestName, 3, 1)
		else 
		  TalkAppendButton(varMap, x330024_var_FileId, x330024_var_QuestName1, 3, 1)
		end

end


function x330024_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330024_var_QuestName)
		TalkAppendString(varMap,format("%s\n\t需要扣除#R60#W点体力值直接完成任务。获得#R经验值#W#G%s#W点、#R国家资源#W#G%s#W点奖励。", x330024_var_QuestInfo, x330024_GetPlayerExp(varMap, varPlayer), x330024_var_CountryRes))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330024_var_QuestSuggest))
		TalkAppendString( varMap," ")
		
		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n国家资源：%s点", x330024_GetPlayerExp(varMap, varPlayer), x330024_var_CountryRes))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330024_var_FileId, -1)

end



function x330024_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if GetLevel(varMap, varPlayer) < x330024_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330024_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
--	if IsQuestHaveDone(varMap, varPlayer, 1406) <= 0 then
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】沙城日常的进阶", 8, 2)
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】沙城日常的进阶", 8, 3)		
--		return 
--	end
	for varI = 1, 4 do
		if IsHaveQuest( varMap, varPlayer, x330024_var_QuestId[varI]) > 0 then
			Msg2Player( varMap, varPlayer, x330024_var_QuestCommentCountOver, 8, 2)
			Msg2Player( varMap, varPlayer, x330024_var_QuestCommentCountOver, 8, 3)
			return
		end
	end
	if x330024_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE) == GetDayOfYear() then
		Msg2Player( varMap, varPlayer, x330024_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330024_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330024_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330024_GetPlayerAward(varMap, varPlayer)	
	x330024_SetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE, GetDayOfYear())
end



function x330024_GetPlayerAward(varMap, varPlayer)
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330024_var_PlayerPhyForce)
 	AddExp(varMap, varPlayer, x330024_GetPlayerExp(varMap, varPlayer))
	local countryId = GetCurCountry(varMap, varPlayer)	
	AddCountryResourceWithRecall(varMap, countryId, 1, 1, x330024_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer) 
	GamePlayScriptLog( varMap, varPlayer, 3112)
	
	local varRand = random(1, 100)
	if varRand == 1 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x330024_var_CangBaoTu, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	    
	    local varName = GetName( varMap, varPlayer)
	    LuaAllScenceM2Wrold(varMap, varName.."使用体力值完成【护送物资】任务时幸运获得黄金藏宝图碎片", CHAT_PLANE_SCROLL, 1)
	    Msg2Player( varMap, varPlayer, "额外获得黄金藏宝图碎片", 8, 2)
		  Msg2Player( varMap, varPlayer, "额外获得黄金藏宝图碎片", 8, 3) 
	   
	end	
end



function x330024_ProcRequestNpcBuffSubResValid( varMap ,varCountry, varIndex, varResult, varPlayer)

	if varResult == 1 then
		local varMessage = format("获得经验奖励：#R%s#cffcf00点\n你的国家增加#R1#cffcf00石粮草资源.", x330024_GetPlayerExp(varMap, varPlayer), x330024_var_CountryRes)
		Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330024_var_QuestName), 8, 2) 
		Msg2Player( varMap, varPlayer, varMessage, 8, 2)
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330024_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x330024_GetPlayerExp(varMap, varPlayer).."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R国家粮草资源"..x330024_var_CountryRes.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)		  
		return
	else
		AddCountryResourceWithRecall(varMap, varCountry, 1, 1, x330024_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer)  
	end
end


function x330024_GetQuestID(varMap,varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
		if varCountry == 0 then
			return x330024_var_QuestId[1]
		elseif varCountry == 1 then                                                  
			return x330024_var_QuestId[2]
		elseif varCountry == 2 then	                                                
			return x330024_var_QuestId[3]
		elseif varCountry == 3 then                                                  
			return x330024_var_QuestId[4]
		end	

end


function x330024_GetPlayerExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local Exp = 0
	if nLevel < 60 then
		return
	end
		
	for i, item in x330024_var_ExpParam do
		if nLevel >= item.level then
			Exp = nLevel * item.nexp
		else
			return Exp
		end
	end
	return Exp

end

function x330024_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330024_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330024_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330024_var_Level then
		return	0
	end

	local varquest = x330024_GetQuestID(varMap,varPlayer)
		if x330024_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, varquest) <= 0 then
			TalkAppendButton(varMap, x330024_var_FileId, x330024_var_QuestName, 3, 1)
		else 
		  TalkAppendButton(varMap, x330024_var_FileId, x330024_var_QuestName1, 3, 1)
		end
		
		return 1

end
