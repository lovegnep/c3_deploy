--DECLARE_QUEST_INFO_START--

x300958_var_FileId 					= 300958                  
x300958_var_QuestId 				= 7768                    

x300958_var_QuestKind 				= 1                       
x300958_var_LevelLess					= 40                      

x300958_var_QuestName				= "【国家】爪哇岛进贡"
x300958_var_QuestTarget				= "  找到#{_ITEM%d}(%d/%d)"      
x300958_var_QuestInfo				= "\t强大的国家不会满足于这一点点荣誉。不断的升级领地图腾会使得领地工资和完成出国任务的经验，荣誉有更高加成。去带来些升级所缺部件，记住，我们是为了荣誉而战！"      
x300958_var_ContinueInfo				= "\t找到#{_ITEM%d}"	  
x300958_var_QuestCompleted			= "\t感谢你为领地图腾升级所做的贡献！"	  
x300958_var_QuestHelp				= "\t每天所需部件为随机，部件可以与其他人交换以更快的完成任务。"      
x300958_var_Questruse				= "\t使用生活技能，制造1个#{_ITEM%d}"      


x300958_var_ExtTarget					= { {type=20,n=1,target=""} }



x300958_var_ExpBonus					= 0     
x300958_var_BonusItem					= {}	

x300958_var_BonusMoney1               = 0  
x300958_var_BonusMoney2               = 0  
x300958_var_BonusMoney3               = 0  
x300958_var_BonusMoney4               = 0  
x300958_var_BonusMoney5               = 0  
x300958_var_BonusMoney6               = 0  

x300958_var_BonusChoiceItem           = {}

--DECLARE_QUEST_INFO_STOP--

x300958_var_MaxCount					= 3


x300958_var_TargetNPC                 = 400608


x300958_var_QuestItemTable          = {
                                        { varItem = 11041000, varCount = 1  }, 
										{ varItem = 11041010, varCount = 1  }, 
                                        { varItem = 11041020, varCount = 1  }, 
                                        { varItem = 11041030, varCount = 1  }, 
                                        { varItem = 11041040, varCount = 1	}, 
                                        { varItem = 11041050, varCount = 1	}, 
}

x300958_var_LairdMap					= 34 

x300958_var_CoffExp                   = 1500

x300958_var_IsEnableId                = 1050

x300958_var_OpenTime                  = 540

x300958_var_EndTime                   = 1380

x300958_var_SaveItem                   = -1
x300958_var_SaveItemDay                = -1


function x300958_CallbackEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById( x300958_var_IsEnableId) <= 0 then
        return
    end
   
    local varCountry = GetCurCountry(varMap, varPlayer)
    local nLairdCountry = GetSceneLairdCountryId(x300958_var_LairdMap)
    if nLairdCountry ~= varCountry then
		return
	end
    
    if varQuest == 0 then
		if IsHaveQuest(varMap, varPlayer, x300958_var_QuestId) <= 0 then
			return 
		end
		
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if varTalkNpcGUID ~= x300958_var_TargetNPC then
			return
		end
	else
		if IsHaveQuest(varMap, varPlayer, x300958_var_QuestId) > 0 then
			return 
		end
    end
    
    local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300958_var_QuestId)
	TalkAppendButton(varMap,x300958_var_QuestId,x300958_var_QuestName,varState,varQuest )
end



function x300958_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
end




function x300958_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varExtIdx)

	if varExtIdx > 0 then
		if IsHaveQuest( varMap, varPlayer, x300958_var_QuestId) > 0 then

			x300958_DispatchContinueInfo(varMap, varPlayer, varTalknpc) 
        else
			x300958_DispatchQuestInfo(varMap, varPlayer, varTalknpc)	
		end
	else
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
            x300958_DispatchContinueInfo(varMap, varPlayer, varTalknpc) 
        else
            x300958_DispatchCompletedInfo(varMap, varPlayer, varTalknpc) 
        end
	end
end




function x300958_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuest(varMap, varPlayer, x300958_var_QuestId)
	if( varHaveQuest > 0) then
		return 0
	else
		return 1
	end
end




function x300958_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

    if IsHaveQuest(varMap, varPlayer, x300958_var_QuestId) > 0 then
		
        local nowTime = GetMinOfDay()
        if nowTime < x300958_var_OpenTime or nowTime >= x300958_var_EndTime then
            Msg2Player( varMap, varPlayer, "只有在每日的#G9：00--2300#cffcf00ず矗ユヴ叭", 8, 2)
            Msg2Player( varMap, varPlayer, "只有在每日的#G9：00--2300#cffcf00ず矗ユヴ叭", 8, 3)
            return
        end
        
        local varCountry = GetCurCountry(varMap, varPlayer)
		local nLairdCountry = GetSceneLairdCountryId(x300958_var_LairdMap)
		if nLairdCountry ~= varCountry then
			Msg2Player( varMap, varPlayer, "很抱歉，此领地不属于你的国家", 8, 3)
			return
		end
		
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300958_var_QuestId)
		local rnd = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        if DelItem(varMap, varPlayer, x300958_var_QuestItemTable[rnd].varItem, 1) == 0 then
			Msg2Player(varMap, varPlayer, "提交物品失败。", 8, 2)
			Msg2Player(varMap, varPlayer, "提交物品失败", 8, 3)
			return
		end 

        x300958_SetDayCount(varMap, varPlayer)

        DelQuest(varMap, varPlayer, x300958_var_QuestId)
        Msg2Player(varMap, varPlayer, "您完成了任务:"..x300958_var_QuestName, 8, 3)
        Msg2Player(varMap, varPlayer, "您完成了任务:"..x300958_var_QuestName, 8, 2)
       
		local mutli = 1
		
			
		
		
		
			
		
		
		
		local nGuildID = GetSceneLairdGuildId(x300958_var_LairdMap)
		if nGuildID < 0 then
			
			return
		end
		
		local nLairdLevel = GetSceneLairdLevel(x300958_var_LairdMap)
		
        local varLevel = GetLevel(varMap, varPlayer)
        if x300958_var_CoffExp > 0 then
			local xp = varLevel * x300958_var_CoffExp*mutli*nLairdLevel
			AddExp(varMap, varPlayer, xp)
			Msg2Player(varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp), 8, 2)
			Msg2Player(varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp), 8, 3)
        end
        
        if varLevel >= 80 then
			local refixInh = floor(AddInherenceExp(varMap, varPlayer, 2.5*varLevel*mutli))
			local varMsg = format("你获得了%d点天赋值。",refixInh)
			Msg2Player(varMap, varPlayer, varMsg, 8, 2)
			Msg2Player(varMap, varPlayer, varMsg, 8, 3)
        end
        
		if nLairdLevel > 5 then
			
			return
		end
		
		local nCurLairdExp = GetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP) + 1
		SetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP,nCurLairdExp)
		
		local nLevelup = 0
		
		
		if nLairdLevel == 1 and nCurLairdExp >= 10500 then
			SetSceneLairdLevel(x300958_var_LairdMap,2)
			SetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP,nCurLairdExp-10500)
			nLevelup = 1
		elseif nLairdLevel == 2 and nCurLairdExp >= 11667 then
			SetSceneLairdLevel(x300958_var_LairdMap,3)
			SetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP,nCurLairdExp-11667)
			nLevelup = 1
		elseif nLairdLevel == 3 and nCurLairdExp >= 12834 then
			SetSceneLairdLevel(x300958_var_LairdMap,4)
			SetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP,nCurLairdExp-12834)
			nLevelup = 1
		elseif nLairdLevel == 4 and nCurLairdExp >= 14001 then
			SetSceneLairdLevel(x300958_var_LairdMap,5)
			SetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP,0)
			nLevelup = 1
		end
		
		
		if nLevelup == 1 then
		
			
			CreateMonster(varMap, 3059, 100, 100, 24, -1, -1, -1, 21, -1, 0, "", "" )
			
			
			GameBattleLairdLevelupEvent(x300958_var_LairdMap)
			
			
			local strSceneName = GetSceneInfo(varMap,"NAME")
			local strLevelMsg = format("%s图腾升为%d级，触发天变，附近出现天龙之魂。",strSceneName,(nLairdLevel + 1) )			
			
			LuaAllScenceM2Wrold(varMap,strLevelMsg,CHAT_PLANE_SCROLL,1)
			LuaAllScenceM2Wrold(varMap,strLevelMsg,CHAT_LEFTDOWN,1)
			LuaAllScenceM2Wrold(varMap,strLevelMsg,CHAT_MAIN_RIGHTDOWN,1)
			
		end
	
    else
		
        local nowTime = GetMinOfDay()
        if nowTime < x300958_var_OpenTime or nowTime >= x300958_var_EndTime then
            Msg2Player( varMap, varPlayer, "只有在每日的#G9：00--2300#cffcf00ず烩ヴ叭", 8, 2)
            Msg2Player( varMap, varPlayer, "只有在每日的#G9：00--2300#cffcf00ず烩ヴ叭", 8, 3)
            return
        end
        
        if GetLevel( varMap, varPlayer) < x300958_var_LevelLess then
			Msg2Player( varMap, varPlayer, format("很抱歉，您的等级不足%d级，无法接受【国家】图腾进贡任务。", x300958_var_LevelLess), 8, 3)
			return
		end
		
        local varCountry = GetCurCountry(varMap, varPlayer)
		local nLairdCountry = GetSceneLairdCountryId(x300958_var_LairdMap)
		if nLairdCountry ~= varCountry then
			Msg2Player( varMap, varPlayer, "没有领地", 8, 3)
			return
		end
        
		if x300958_GetDayCount(varMap, varPlayer) == 0 then
			Msg2Player( varMap, varPlayer, "同一块领地一天只能完成"..x300958_var_MaxCount.."次任务", 8, 3)
            return
		end
		
		local varRet = AddQuest( varMap, varPlayer, x300958_var_QuestId, x300958_var_FileId, 0, 0, 1, 0) 
		if varRet == 0 then
			Msg2Player(varMap,varPlayer, "任务已满，任务接受失败！",8,3)
			return
		end
		
		
		Msg2Player( varMap, varPlayer, "您获得了任务："..x300958_var_QuestName, 8, 3)
		Msg2Player( varMap, varPlayer, "您获得了任务："..x300958_var_QuestName, 8, 2)
		
		x300958_SetSaveItem(varMap, varPlayer)
		local rnd = x300958_var_SaveItem

		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
			
		local varCount = GetItemCountInBag(varMap, varPlayer, x300958_var_QuestItemTable[rnd].varItem)

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, varCount >= x300958_var_QuestItemTable[rnd].varCount and 1 or 0)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, varCount >= x300958_var_QuestItemTable[rnd].varCount and 1 or 0)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, rnd)
		
		
		x300958_ProcQuestLogRefresh( varMap, varPlayer, x300958_var_QuestId)
		return 1
    end
end




function x300958_ProcQuestAbandon( varMap, varPlayer, varQuest)
	if IsHaveQuest( varMap, varPlayer, x300958_var_QuestId) > 0 then
		DelQuest( varMap, varPlayer, x300958_var_QuestId)
        x300958_SetDayCount(varMap, varPlayer)
		Msg2Player( varMap, varPlayer, "很抱歉，您放弃了任务："..x300958_var_QuestName, 8, 3)
		Msg2Player( varMap, varPlayer, "很抱歉，您放弃了任务："..x300958_var_QuestName, 8, 2)
	end
end




function x300958_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x300958_BonusInfo(varMap, varPlayer)
	local mutli = 1
	
		
	
	
	
		
	
	
	local varLevel = GetLevel(varMap, varPlayer)
	
	
	local nGuildID = GetSceneLairdGuildId(x300957_var_LairdMap)
	if nGuildID < 0 then
		
		return
	end
	
	local nLairdLevel = GetSceneLairdLevel(x300957_var_LairdMap)

    
    if x300958_var_CoffExp > 0 then
		local varExp = varLevel * x300958_var_CoffExp*mutli*nLairdLevel
        AddQuestExpBonus(varMap, varExp)
    end
    
	if varLevel >= 80 then
		local refixInhExp = floor(RefixInherenceExp(varMap, varPlayer, 2.5*varLevel*mutli))
		AddQuestInherenceExpBonus(varMap,refixInhExp)
	end
	
end




function x300958_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x300958_var_QuestName)
    TalkAppendString( varMap, x300958_var_QuestInfo)
    TalkAppendString( varMap, " ")
	
	x300958_SetSaveItem(varMap, varPlayer)
	local rnd = x300958_var_SaveItem

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
	
	local varCount = GetItemCountInBag(varMap, varPlayer, x300958_var_QuestItemTable[rnd].varItem)
	if varCount > x300958_var_QuestItemTable[rnd].varCount then
		varCount = x300958_var_QuestItemTable[rnd].varCount
	end
	TalkAppendString( varMap,"#Y任务目标：")
    TalkAppendString( varMap, format(x300958_var_QuestTarget, x300958_var_QuestItemTable[rnd].varItem, 
								varCount, x300958_var_QuestItemTable[rnd].varCount))
	TalkAppendString( varMap, " ")
	TalkAppendString(varMap,"#Y任务提示：")
    TalkAppendString( varMap, format(x300958_var_QuestHelp, x300958_var_QuestItemTable[rnd].varItem))
    TalkAppendString( varMap, " ")
							
    x300958_BonusInfo(varMap, varPlayer)
   
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300958_var_FileId, x300958_var_QuestId)
end




function x300958_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
	local rnd = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
		
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300958_var_QuestName)
    TalkAppendString( varMap, format(x300958_var_ContinueInfo, x300958_var_QuestItemTable[rnd].varItem))
    TalkAppendString( varMap, " ")
	
	if IsHaveQuest(varMap, varPlayer, x300958_var_QuestId) > 0 then

		TalkAppendString( varMap,"#Y完成情况：")
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
			TalkAppendString(varMap, "未完成")
		else
			TalkAppendString(varMap, "已完成")
		end
	    x300958_BonusInfo(varMap, varPlayer)
    end
    
	StopTalkTask()
    DeliverTalkRequire( varMap, varPlayer, varTalknpc, x300958_var_FileId, x300958_var_QuestId,0)
end




function x300958_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300958_var_QuestName)
    TalkAppendString( varMap, x300958_var_QuestCompleted)
    TalkAppendString( varMap, " ")
    
    x300958_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300958_var_FileId, x300958_var_QuestId)

end




function x300958_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end




function x300958_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
	
	if IsHaveQuest( varMap, varPlayer, x300958_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
		local rnd = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
		local varCount = GetItemCountInBag(varMap, varPlayer, x300958_var_QuestItemTable[rnd].varItem)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, varCount >= x300958_var_QuestItemTable[rnd].varCount and 1 or 0)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, varCount >= x300958_var_QuestItemTable[rnd].varCount and 1 or 0)
		
		x300958_ProcQuestLogRefresh( varMap, varPlayer, x300958_var_QuestId)
	end
end




function x300958_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, x300958_var_QuestId) == 0 then	
		return
	end
end




function x300958_GetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DATE[1], MD_LINGDIJINGONG_9_DATE[2],MD_LINGDIJINGONG_9_DATE[3])
	
	if varToday ~= varLastday then
		return 1
	end
		
	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DAYCOUNT[1], MD_LINGDIJINGONG_9_DAYCOUNT[2],MD_LINGDIJINGONG_9_DAYCOUNT[3])
	return varDaycount < x300958_var_MaxCount and 1 or 0
end




function x300958_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DATE[1], MD_LINGDIJINGONG_9_DATE[2],MD_LINGDIJINGONG_9_DATE[3])

	if varToday ~= varLastday then
		SetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DATE[1], MD_LINGDIJINGONG_9_DATE[2], MD_LINGDIJINGONG_9_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DAYCOUNT[1], MD_LINGDIJINGONG_9_DAYCOUNT[2], MD_LINGDIJINGONG_9_DAYCOUNT[3], 1)
	else
		local varCount = GetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DAYCOUNT[1], MD_LINGDIJINGONG_9_DAYCOUNT[2],MD_LINGDIJINGONG_9_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_LINGDIJINGONG_9_DAYCOUNT[1], MD_LINGDIJINGONG_9_DAYCOUNT[2], MD_LINGDIJINGONG_9_DAYCOUNT[3], varCount+1)
	end
end

function x300958_SetSaveItem(varMap, varPlayer)
	if x300958_var_SaveItem == -1 then
		x300958_var_SaveItem = random(1, getn(x300958_var_QuestItemTable))
		if x300958_var_SaveItem < 1 then x300958_var_SaveItem = 1 end
		if x300958_var_SaveItem > getn(x300958_var_QuestItemTable) then x300958_var_SaveItem = getn(x300958_var_QuestItemTable) end
		x300958_var_SaveItemDay = GetDayOfYear()
	elseif x300958_var_SaveItemDay == -1 or x300958_var_SaveItemDay ~= GetDayOfYear() then
		x300958_var_SaveItem = random(1, getn(x300958_var_QuestItemTable))
		if x300958_var_SaveItem < 1 then x300958_var_SaveItem = 1 end
		if x300958_var_SaveItem > getn(x300958_var_QuestItemTable) then x300958_var_SaveItem = getn(x300958_var_QuestItemTable) end
		x300958_var_SaveItemDay = GetDayOfYear()
	end
end



function x300958_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300958_var_QuestId)
    local rnd = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
	local varCount = GetItemCountInBag(varMap, varPlayer, x300958_var_QuestItemTable[rnd].varItem)
	if varCount > x300958_var_QuestItemTable[rnd].varCount then
		varCount = x300958_var_QuestItemTable[rnd].varCount
	end
	
	StartTalkTask( varMap)
    AddQuestLogCustomText( varMap,
							"",									
                            x300958_var_QuestName,              
                            format(x300958_var_QuestTarget, x300958_var_QuestItemTable[rnd].varItem, 
								varCount, x300958_var_QuestItemTable[rnd].varCount),            
                            "@npc_"..x300958_var_TargetNPC,       
                             format(x300958_var_Questruse,x300958_var_QuestItemTable[rnd].varItem), 				
                            x300958_var_QuestInfo,              
                            x300958_var_QuestHelp			
                            )
                            
    x300958_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end
