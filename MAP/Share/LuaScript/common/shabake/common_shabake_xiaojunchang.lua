--DECLARE_QUEST_INFO_START--
x300946_var_FileId 						= 300946
x300946_var_QuestName					= "【沙城】校场练兵"
x300946_var_QuestInfo					= "\t在沙城中央塔四周盘踞着一伙经常挑衅的敌军，去给他们一个小小的教训，让他们记住，我们国家是不可被冒犯的。\n\t(完成任务可获得一石国家粮草，同时有一定几率获得#R皇帝战回魂丹#W)"
x300946_var_QuestCompleted				= "\t惩戒只是权益之计，等我军获得沙城情报之后，就可挥师直入，扫荡群小！"
x300946_var_QuestHelp					= "  杀死#R50#W个适合等级的沙城敌军"
x300946_var_LevelLess	= 	60
x300946_var_NPCName						= "@npc_401204"
x300946_var_QuestRuse					= "杀死50个适合等级的#R沙城敌军#W，再向@npc_401204回复。"
x300946_var_strQuestFinishTip			= "\t任务已经完成，快点回去汇报吧！"
x300946_var_SubmitNPCGUID				= "@npc_401204"  --昆仑，楼兰，天山，敦煌
x300946_var_QuestId						= 9209
x300946_var_ShiCai						= 12030011
x300946_var_ReliveItem					= 11990401
x300946_var_BonusItem					= {}
x300946_var_BonusChoiceItem				= {}
x300946_var_GetPlayerExp				=  
{
{level = 60, value = 22000},
{level = 70, value = 22000},
{level = 80, value = 22000},
{level = 90, value = 22000},
{level = 100, value = 22000},
{level = 110, value = 22000},
}
--DECLARE_QUEST_INFO_STOP--
x300946_var_KillMonsterTable          = {
                                        { level = 60, monsterId = 10446, posId = 82000, varCount = 50, varName = "海都前锋军", 
                                          target = "  消灭#R%d#W个@npc_%d#W(%d/%d)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_塔塔尔部剧场_59633处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_15021！", tips = "" },  
                                        { level = 70, monsterId = 10447, posId = 82001, varCount = 50, varName = "海都前锋游击", 
                                          target = "  消灭#R%d#W个@npc_%d#W(%d/%d)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_克烈部剧场_59633处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_16007！", tips = "" },  
                                        { level = 80, monsterId = 10448, posId = 82002, varCount = 50, varName = "海都力士", 
                                          target = "  消灭#R%d#W个@npc_%d#W(%d/%d)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_乃蛮部剧场_59633处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_105315！", tips = "" },  
                                        { level = 90, monsterId = 10449, posId = 82003, varCount = 50, varName = "海都左翼军", 
                                          target = "  消灭#R%d#W个@npc_%d#W(%d/%d)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_太行山剧场_59633处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_19014！", tips = "" },  
                                        { level = 100, monsterId =10450, posId = 82004, varCount = 50, varName = "海都右翼军", 
                                          target = "  消灭#R%d#W个@npc_%d#W(%d/%d)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_凤翔府剧场_59633处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_20018！", tips = "" },  
                                        { level = 110, monsterId = 10451, posId = 82005, varCount = 50, varName = "海都精锐军", 
                                          target = "  消灭#R%d#W个@npc_%d#W(%d/%d)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_阿尔金山剧场_59633处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_18018！", tips = "" },  
                                        
}
--posid== 怪物id，varCount==杀怪数量


function x300946_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetLevel(varMap, varPlayer) >= 60 then
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300946_var_QuestId, x300946_var_QuestName, state)
	end
end


function x300946_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
 	if IsHaveQuestNM( varMap, varPlayer, x300946_var_QuestId ) ~= 1 then
		if x300946_GetDayCount_BeforeQuestDate(varMap, varPlayer) == 0 then
			Msg2Player(varMap, varPlayer, "请先完成任务#R【沙城】护送物资", 8, 3)
			return		
		end
	end
	
		if x300946_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("你今天已经完成过#R%s#0#cffcf00任务",x300946_var_QuestName), 8, 3)
		return		
	end
	
	if IsHaveQuestNM( varMap, varPlayer, x300946_var_QuestId ) > 0 then
		local bDone = x300946_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
		if(bDone > 0) then

				x300946_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

			x300946_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示

	end			

end


function x300946_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)

	local num = x300946_KillMonsterLevel(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300946_var_QuestId)
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 

	if KilledNum < x300946_var_KillMonsterTable[num].varCount then
		return 0
	else

		return 1
	end
end

function x300946_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "等级不足", 8, 3)
		return
	end
	
	if x300946_GetDayCount_BeforeQuestDate(varMap, varPlayer) == 0 then
		Msg2Player(varMap, varPlayer, "请先完成任务#R【沙城】护送物资", 8, 3)
		return		
	end
	
	if x300946_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("已经完成过#R%s#0任务",x300946_var_QuestName), 8, 3)
		return		
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	

	if AddQuest( varMap, varPlayer, x300946_var_QuestId,x300946_var_FileId,1,0,0,1) == 1 then
	
		
		--接任务写日志


		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x300946_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x300946_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300946_var_QuestId);
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )
		GamePlayScriptLog(varMap, varPlayer, 2564)
		
	end

end

function x300946_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x300946_var_QuestName)
		TalkAppendString(varMap,x300946_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x300946_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300946_var_FileId, x300946_var_QuestId)

end



function x300946_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)
		local num = x300946_KillMonsterLevel(varMap, varPlayer)
	    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300946_var_QuestId)
		local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
		local questtarget  = format( x300946_var_KillMonsterTable[num].target, x300946_var_KillMonsterTable[num].varCount, x300946_var_KillMonsterTable[num].posId, KilledNum, x300946_var_KillMonsterTable[num].varCount)

		--任务信息
		TalkAppendString(varMap,"#Y"..x300946_var_QuestName)
		TalkAppendString(varMap,format("%s", x300946_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap, questtarget)
		TalkAppendString( varMap," ")

		--提示信息
		if x300946_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300946_var_QuestHelp))
			TalkAppendString(varMap," ")
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300946_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300946_var_FileId, varQuest)
end

function x300946_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local num = x300946_KillMonsterLevel(varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = x300946_KillMonsterLevel(varMap, varPlayer)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300946_var_QuestId)
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest )

    local varCount = x300946_var_KillMonsterTable[ varIndex].varCount  
    local questtarget  = format( x300946_var_KillMonsterTable[num].target, x300946_var_KillMonsterTable[num].varCount, x300946_var_KillMonsterTable[num].posId, KilledNum, x300946_var_KillMonsterTable[num].varCount)



	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x300946_var_QuestName,			-- 任务名字
								questtarget,					--任务目标
								x300946_var_SubmitNPCGUID,
								x300946_var_QuestRuse,			--任务攻略
								x300946_var_QuestInfo,			--任务描述
								x300946_var_QuestHelp								--任务小提示
								)
		local varExp = 	x300946_YunBiaoExp(varMap, varPlayer)				
	  if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end							
				
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end


function x300946_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

	local num = x300946_KillMonsterLevel(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300946_var_QuestId)
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 
	local varTeamSize = GetNearTeamCount( varMap, varPlayer)	
	if varTeamSize <= 1 then
	    if varObjData == x300946_var_KillMonsterTable[num].monsterId and KilledNum < x300946_var_KillMonsterTable[num].varCount then
	        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, KilledNum + 1)
	    else
	        
	        return
	    end	
		KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
		if KilledNum >= x300946_var_KillMonsterTable[num].varCount then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
	        Msg2Player( varMap, varPlayer, x300946_var_strQuestFinishTip, 8, 3)
	    else
	        Msg2Player( varMap, varPlayer, format( "已消灭#G%s#cffcf00(%d/%d)", x300946_var_KillMonsterTable[num].varName, KilledNum, x300946_var_KillMonsterTable[num].varCount), 8, 3)
		end

		x300946_ProcQuestLogRefresh( varMap, varPlayer, x300946_var_QuestId)
	else
        for varI = 0, varTeamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varPlayer, varI)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x300946_var_QuestId) > 0 then 
                    varQuestIdx = GetQuestIndexByID( varMap, memberId, x300946_var_QuestId)
                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then 
						local num = x300946_KillMonsterLevel(varMap, memberId)
                        local KilledNum  = GetQuestParam( varMap, memberId, varQuestIdx, 1)

                        if varObjData == x300946_var_KillMonsterTable[num].monsterId and KilledNum < x300946_var_KillMonsterTable[num].varCount then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 1, KilledNum + 1)
                        end

                        
                        KilledNum = GetQuestParam( varMap, memberId, varQuestIdx, 1)
                        if KilledNum >= x300946_var_KillMonsterTable[num].varCount then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 0, 1)
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
                        end

                        x300946_ProcQuestLogRefresh( varMap, memberId, x300946_var_QuestId)
                    end
                end
            end
        end
    end		
end


function x300946_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local num = x300946_KillMonsterLevel(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300946_var_QuestId)
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 
	local nlevel = GetLevel( varMap, varPlayer)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	
	if nlevel < 60 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
		return
	end




	if KilledNum < x300946_var_KillMonsterTable[num].varCount then

		Msg2Player(varMap,varPlayer,"杀怪数量不够，无法提交任务！",8,3)	
		return
	end	

	if(varHaveQuest <= 0) then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "你没有这个任务，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你没有这个任务，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0		
	end



	if varHaveQuest > 0 then

		if x300946_CheckPlayerBagFull2( varMap ,varPlayer,selectId ) == 1 then
			return
		end	
		
		x300946_CheckPlayerBagFull1( varMap ,varPlayer,selectId )		
		
		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end						
		x300946_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x300946_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
GamePlayScriptLog(varMap, varPlayer, 2565)
 
    AddExp(varMap, varPlayer, x300946_YunBiaoExp(varMap, varPlayer))
    
    local PlayerValue = x300946_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE)
    if PlayerValue <= 511 then
    	x300946_SetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE, GetDayOfYear())
    end
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x300946_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x300946_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")

    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x300946_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x300946_YunBiaoExp(varMap, varPlayer)),8,2)
    local varRand = random (1,10000)
		if varRand <= 50 then
			CreateMonster( varMap, 56616, 194, 307, 26, -1, -1, -1, 21, 3600*1000)
			local message = "沙城#R军需官#cffcf00附近出现了战车之灵抹杀者"
			local message1 = "沙城军需官附近出现了战车之灵抹杀者"
			--LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
			LuaAllScenceM2Wrold( varMap, message1, CHAT_LEFTDOWN, 1 )
			LuaAllScenceM2Wrold( varMap, message, 5, 1 )
		end

end




function x300946_ProcQuestAbandon( varMap, varPlayer,varQuest )
	
--	if IsHaveQuestNM( varMap, varPlayer, x300946_var_QuestId) == 0 then	-- 如果没有这个任务
--		return
--	end
	local varBusID  =  GetBusId(varMap, varPlayer)	
	DelQuestNM( varMap, varPlayer, x300946_var_QuestId)
	if varBusID ~= -1 then
		DeleteBus(varMap, varBusID,1)
	end
	local Readme = format("你放弃了任务：%s",x300946_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end

function x300946_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300946_var_QuestId )

	if varHaveQuest > 0 then
		if varTalkNpcGUID == x300946_var_SubmitNPCGUID  then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300946_var_QuestId)
			TalkAppendButton(varMap, x300946_var_QuestId, x300946_var_QuestName,7, 1)
		end
	end
end

function x300946_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 60 then
		return 0
	end
	for i, j in x300946_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x300946_GetDayCount_BeforeQuestDate(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = x300946_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE)

	if varLastday ~= varToday then
		return 0
	else
		return 1
	end



end

function x300946_KillMonsterLevel(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local value = 0
	if nLevel < 60 then
		return 1
	end
	for i, j in x300946_var_KillMonsterTable do
		if nLevel >= j.level then
			value = value + 1
		else
			return value
		end
	end
	return value	
end

function x300946_SubmitNPCGUID(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0	
	if nCountryIdx == 0 then
		return x300946_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		return x300946_var_SubmitNPCGUID[3]	
	elseif nCountryIdx == 2 then	
		return x300946_var_SubmitNPCGUID[1]	
	elseif nCountryIdx == 3 then
		return x300946_var_SubmitNPCGUID[4]	
	end
end	


function x300946_CheckPlayerBagFull2( varMap ,varPlayer,selectId )
	if x300946_ItemRandom(varMap ,varPlayer) == 5 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x300946_var_ReliveItem, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return 1
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	end
    
end

function x300946_CheckPlayerBagFull1( varMap ,varPlayer,selectId )
	local countryId = GetCurCountry(varMap, varPlayer)	
	AddCountryResourceWithRecall(varMap, countryId, 1, 1, x300946_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer) 
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 2)
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 3)	
end

function x300946_ProcRequestNpcBuffSubResValid( varMap ,varCountry, varIndex, varResult, varPlayer)

	if varResult == 1 then
		return
	else
		AddCountryResourceWithRecall(varMap, varCountry, 1, 1, x300946_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer)    
	end
end

function x300946_ItemRandom(varMap ,varPlayer)
	local varX =random(1, 10)
	return varX
end


function x300946_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300946_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
