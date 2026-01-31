
--DECLARE_QUEST_INFO_START--

x310219_var_FileId 					= 310219                  
x310219_var_QuestId 				= 9097                    

x310219_var_QuestKind 				= 1                       
x310219_var_LevelLess					= 40                      

x310219_var_QuestName				= "【国家】弱国令"
x310219_var_QuestTarget				= "  到敦煌马场的@npc_30105、@npc_30106、@npc_30107截获物资(%d/%d)"      
x310219_var_QuestInfo				= "\t长久以来，国力不足一直是我们的心头大患，近日，我们顺利的截获了敌国运输中的一批军需物资，但在敌军的反抗下，未获全功，大批物资散落在我国马场中。现在，国家的所有国民，请前往马场，将那批军需物资抢运回国！"      
x310219_var_ContinueInfo				= "\t不要耽误，即刻启程截获敌国物资！"	  
x310219_var_QuestCompleted			= "感谢你为国家做出的贡献，这些奖励是你应得的。"	  
x310219_var_QuestHelp				= "\t物资在敦煌马场内，请前往马场，将那批军需物资抢运回国！"      
x310219_var_Questruse				= "\t每截获一批物资都会有大量经验奖励，更有可能获得额外超高经验奖励。"      


x310219_var_ExtTarget					= { {type=20,n=1,target=""} }



x310219_var_ExpBonus					= 0     
x310219_var_BonusItem					= {}	

x310219_var_BonusMoney1               = 0  
x310219_var_BonusMoney2               = 0  
x310219_var_BonusMoney3               = 0  
x310219_var_BonusMoney4               = 0  
x310219_var_BonusMoney5               = 0  
x310219_var_BonusMoney6               = 0  
x300219_var_Exp_Drop               =   10
x310219_var_BonusChoiceItem           = {}

--DECLARE_QUEST_INFO_STOP--

x310219_var_GrowpointId				= 140 
x310219_var_Boss						= {type =9880,guid =-1,varX = 128, z=128, facedir =3600000, title = ""}

x310219_var_CoffExp					= {100000*x300219_var_Exp_Drop, 25000*x300219_var_Exp_Drop, 8500*x300219_var_Exp_Drop, 4000*x300219_var_Exp_Drop} 
x310219_var_MaxCount					= 5 


x310219_var_TargetNPC                 = 132021

x310219_var_GameOpenId				= 1066




function x310219_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetGameOpenById(x310219_var_GameOpenId) <= 0 then
		return
	end
	if IsOpenWeakCountryCheck() == 0 then
		return
	end
	local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x310219_var_QuestId)
	TalkAppendButton(varMap,x310219_var_QuestId,x310219_var_QuestName,varState, 0 )
end



function x310219_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varExtIdx)
	if IsHaveQuest( varMap, varPlayer, x310219_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
			x310219_DispatchContinueInfo(varMap, varPlayer, varTalknpc) 
        else
            x310219_DispatchCompletedInfo(varMap, varPlayer, varTalknpc) 
        end
    else
		x310219_DispatchQuestInfo(varMap, varPlayer, varTalknpc)	
	end
end




function x310219_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuest(varMap, varPlayer, x310219_var_QuestId)
	if( varHaveQuest > 0) then
		return 0
	else
		return 1
	end
end




function x310219_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

    if IsHaveQuest(varMap, varPlayer, x310219_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x310219_var_QuestId)
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) ~= 1 then
			Msg2Player(varMap, varPlayer, "任务为未完成状态。", 8, 2)
			Msg2Player(varMap, varPlayer, "任务为未完成状态", 8, 3)
			return
		end 

        x310219_SetDayCount(varMap, varPlayer)

        DelQuest(varMap, varPlayer, x310219_var_QuestId)
        Msg2Player(varMap, varPlayer, "您完成了任务:"..x310219_var_QuestName, 8, 3)
        Msg2Player(varMap, varPlayer, "您完成了任务:"..x310219_var_QuestName, 8, 2)
        
		local nCountryIdx = GetCurCountry(varMap, varPlayer);
		
		local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		
		local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
		local nLairdHornorBonus = (0.2 - selfscore / allscore) * 4000 + 400  
		if nLairdHornorBonus >= 600 then
			nLairdHornorBonus = 600
		end
		AddHonor(varMap, varPlayer, nLairdHornorBonus);
        Msg2Player(varMap, varPlayer, format("获得#R荣誉%d点#cffcf00的奖励",nLairdHornorBonus), 8, 2)
		Msg2Player(varMap, varPlayer, format("获得#R荣誉%d点#cffcf00的奖励",nLairdHornorBonus), 8, 3)
	 	
    else
    	if GetGameOpenById(x310219_var_GameOpenId) <= 0 then
			return
		end
	
		if GetLevel( varMap, varPlayer) < x310219_var_LevelLess then
			Msg2Player( varMap, varPlayer, format("很抱歉，您的等级不足%d级，无法接受【国家】弱国令。", x310219_var_LevelLess), 8, 3)
			return
		end

		if x310219_GetDayCount(varMap, varPlayer) == 0 then
			Msg2Player( varMap, varPlayer, "你今天领取过该任务，请明天再来吧！", 8, 3)
			return
		end
		
		local varRet = CountryIsFortuneTime(varMap,varPlayer,2)
		
		if varRet ~= 1 then
			Msg2Player(varMap, varPlayer, "很抱歉，弱国令期间才可接受此任务！", 8, 2)
			Msg2Player(varMap, varPlayer, "很抱歉，弱国令期间才可接受此任务！", 8, 3)
			return
		end 

		local varRet = AddQuest( varMap, varPlayer, x310219_var_QuestId, x310219_var_FileId, 0, 0, 0, 0) 
		if varRet == 0 then
			Msg2Player(varMap,varPlayer, "任务已满，任务接受失败！",8,3)
			return
		end
		
		
		Msg2Player( varMap, varPlayer, "您获得了任务："..x310219_var_QuestName, 8, 3)
		Msg2Player( varMap, varPlayer, "您获得了任务："..x310219_var_QuestName, 8, 2)
		
	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
		
		
		x310219_ProcQuestLogRefresh( varMap, varPlayer, x310219_var_QuestId)
		return 1
    end
end




function x310219_ProcQuestAbandon( varMap, varPlayer, varQuest)
	if IsHaveQuest( varMap, varPlayer, x310219_var_QuestId) > 0 then
		DelQuest( varMap, varPlayer, x310219_var_QuestId)
        x310219_SetDayCount(varMap, varPlayer)
		Msg2Player( varMap, varPlayer, "您放弃了任务："..x310219_var_QuestName, 8, 3)
		Msg2Player( varMap, varPlayer, "您放弃了任务："..x310219_var_QuestName, 8, 2)
	end
end




function x310219_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x310219_BonusInfo(varMap, varPlayer)
    
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local nLairdHornorBonus = (0.2 - selfscore / allscore) * 4000 + 400  
	if nLairdHornorBonus >= 600 then
		nLairdHornorBonus = 600
	end
    
	if nLairdHornorBonus > 0 then
		AddQuestMoneyBonus6( varMap, nLairdHornorBonus )
	end

end




function x310219_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x310219_var_QuestName)
    TalkAppendString( varMap, x310219_var_QuestInfo)
    TalkAppendString( varMap, " ")

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
	local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
	
	TalkAppendString( varMap,"#Y任务目标：")
    TalkAppendString( varMap, format(x310219_var_QuestTarget, varCount, x310219_var_MaxCount))
	TalkAppendString( varMap, " ")
	TalkAppendString(varMap,"#Y任务提示：")
    TalkAppendString( varMap, format(x310219_var_QuestHelp))
    TalkAppendString( varMap, " ")
							
    x310219_BonusInfo(varMap, varPlayer)
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310219_var_FileId, x310219_var_QuestId)
end




function x310219_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
	local rnd = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
		
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310219_var_QuestName)
    TalkAppendString( varMap, format(x310219_var_ContinueInfo, x310219_var_TargetNPC))
	TalkAppendString( varMap, " ")
	
	TalkAppendString( varMap,"#Y完成情况：")
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
		TalkAppendString(varMap, "未完成")
	else
		TalkAppendString(varMap, "已完成")
	end
	
	x310219_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
    DeliverTalkRequire( varMap, varPlayer, varTalknpc, x310219_var_FileId, x310219_var_QuestId,0)
end




function x310219_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310219_var_QuestName)
    TalkAppendString( varMap, x310219_var_QuestCompleted)
    TalkAppendString( varMap, " ")
    
    x310219_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310219_var_FileId, x310219_var_QuestId)
end




function x310219_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end




function x310219_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end




function x310219_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end




function x310219_GetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_RUOGUOLING_DATE[1], MD_RUOGUOLING_DATE[2],MD_RUOGUOLING_DATE[3])
	
	if varToday ~= varLastday then
		return 1
	end
		
	return 0
end




function x310219_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	SetPlayerGameData(varMap, varPlayer, MD_RUOGUOLING_DATE[1], MD_RUOGUOLING_DATE[2], MD_RUOGUOLING_DATE[3], varToday)
end




function x310219_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
    local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    
	StartTalkTask( varMap)
    AddQuestLogCustomText( varMap,
							"",									
                            x310219_var_QuestName,              
                            format(x310219_var_QuestTarget, varCount, x310219_var_MaxCount),            
                            "@npc_"..x310219_var_TargetNPC,       
                            format(x310219_var_Questruse,x310219_var_TargetNPC), 				
                            x310219_var_QuestInfo,              
                            x310219_var_QuestHelp			
                            )
                            
    x310219_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end


function x310219_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x310219_var_GrowpointId, varMap, 0, -1)
end


function x310219_ProcGpOpen( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if IsHaveQuestNM( varMap, varPlayer, x310219_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		if varCount == x310219_var_MaxCount then
			Msg2Player( varMap, varPlayer, "每个人每天只允许截获5份物资,明天再来吧", 8, 3)
			return 1
		end
		return 0
    end
        Msg2Player( varMap, varPlayer, "很抱歉，你没有【国家】弱国令任务，无法采集", 8, 3)
    return 1
end


function x310219_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


function x310219_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)

    if IsHaveQuestNM( varMap, varPlayer, x310219_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310219_var_QuestId)
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, varCount+1)
		if varCount+1 == x310219_var_MaxCount then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
		end
		
		local varLevel = GetLevel(varMap, varPlayer)
		local rnd = random(1, 1000)
        local xp = 0
		local varRand = random(-3, 3)
		local bossx, bossz =GetWorldPos(varMap,varPlayer)
			bossx = bossx + varRand
			bossz = bossz + varRand
        if rnd == 1 then
		
			xp = varLevel * x310219_var_CoffExp[1]
			if x310219_var_Boss.title~= "" then
				CreateMonster(varMap, x310219_var_Boss.type, bossx, bossz, 1, 977, -1, x310219_var_Boss.guid, 21,-1,x310219_var_Boss.facedir, "", x310219_var_Boss.title)
			else
				CreateMonster(varMap, x310219_var_Boss.type, bossx, bossz, 1, 977, -1, x310219_var_Boss.guid, 21,-1,x310219_var_Boss.facedir)
			end
			local killerName = GetName(varMap,varPlayer)
			local varMsg1 = "武仙出现在敦煌马场抢夺军需物资！"
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
		elseif rnd <= 101 then
			xp = varLevel * x310219_var_CoffExp[2]
		elseif rnd <= 501 then
			xp = varLevel * x310219_var_CoffExp[3]
		else
			xp = varLevel * x310219_var_CoffExp[4]
		end
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)	
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local multi = 0
	if selfscore > 0 and allscore > 0 then
		 multi = allscore*0.25/selfscore
	end
	local xp_multi = floor(xp*multi)
	if xp_multi >= xp *2 then
		xp_multi = xp *2
	end
		AddExp(varMap, varPlayer, xp);
			if x310219_IsMinGuo(varMap, varPlayer) == 1 then
				AddExp(varMap, varPlayer, xp_multi)
				Msg2Player(varMap, varPlayer, format( "弱国额外获得#R经验%d点#cffcf00的奖励", xp_multi), 8, 2)
				Msg2Player(varMap, varPlayer, format( "弱国额外获得#R经验%d点#cffcf00的奖励", xp_multi), 8, 3)				
			end
		Msg2Player(varMap, varPlayer, format( "截获军需物资获得#R经验%d点#cffcf00的奖励", xp), 8, 2)
		Msg2Player(varMap, varPlayer, format( "截获军需物资获得#R经验%d点#cffcf00的奖励", xp), 8, 3)
		x310219_ProcQuestLogRefresh( varMap, varPlayer, x310219_var_QuestId)
		return 1
    end

    return 0
end

function x310219_ProcDie(varMap, varPlayer, varKiller)

end
function x310219_IsMinGuo(varMap, varPlayer)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local MinGuo = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
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
