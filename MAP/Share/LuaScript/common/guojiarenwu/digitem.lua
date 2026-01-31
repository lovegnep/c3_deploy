

--DECLARE_QUEST_INFO_START--

x300518_var_FileId = 300518

x300518_var_QuestName = "【个人】内政任务"

x300518_var_QuestHelp   = "\t用@item_12030020#W去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE#W探索一番，看看有没有#G%s#W"

x300518_var_QuestTarget = "  到#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE#W附近使用@item_12030020#W挖掘(%d/1)"

x300518_var_QuestInfo   = "\t最近我观察圣山之上灵气异常，其地脉更是有仙龙为照，山中定然有很多鲜为人知的化石材料，请你首先到@npc_138502那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。"
x300518_var_QuestInfo_High   = "\t最近我观察护城河灵气异常，其水源更是有仙龙为照，河畔定然有很多鲜为人知的化石材料，请你首先到@npc_138502那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。"

x300518_var_QuestContinue   = "\t你还没有找到#G%s#W呢。"

--DECLARE_QUEST_INFO_STOP--
x300518_LevelToCapital		= 300		

x300518_ProceRoundCount	= 10
x300518_HighBonusCircleCount = 10

x300518_var_DigNothing    = "这里什么也没有，请在灵气旺盛的(%d，%d)附近使用。"

x300518_var_DigQuestID              = 6470
x300518_var_DigQuestID_End          = 6479

x300518_CountrySceneList	= {50, 150, 250, 350}
x300518_CapitalSceneId		= 0


x300518_UserLevelAccept		= 1
x300518_PositionGroup		= 2
x300518_ItemId			= 3

x300518_var_CoordinateLib     = 
{
                                { posX = 422, posZ = 50  }, 
                                { posX = 378, posZ = 81  }, 
                                { posX = 428, posZ = 30 }, 
                                { posX = 411, posZ = 32 }, 
                                { posX = 425, posZ = 245 }, 
}

x300518_var_CoordinateLib_Cap     = 
{
                                { posX = 166, posZ = 68  }, 
                                { posX = 158, posZ = 109  }, 
                                { posX = 363, posZ = 271 }, 
                                { posX = 373, posZ = 371 }, 
                                { posX = 419, posZ = 436 }, 
}

x300518_var_DigTarget         =
{
                                { quest = 6470, varId = 13013000, varName = "仙灵玉石" }, 
                                { quest = 6471, varId = 13013001, varName = "仙灵光石" }, 
                                { quest = 6472, varId = 13013002, varName = "仙灵彩石" }, 
                                { quest = 6473, varId = 13013003, varName = "仙灵暗石" }, 
                                { quest = 6474, varId = 13013004, varName = "仙灵玄石" }, 
                                { quest = 6475, varId = 13013000, varName = "仙灵玉石" }, 
                                { quest = 6476, varId = 13013001, varName = "仙灵光石" }, 
                                { quest = 6477, varId = 13013002, varName = "仙灵彩石" }, 
                                { quest = 6478, varId = 13013003, varName = "仙灵暗石" }, 
                                { quest = 6479, varId = 13013004, varName = "仙灵玄石" }, 
}                                                   



x300518_var_Radius    = 4

function x300518_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest)
    return 1
end

function x300518_ProcAccept( varMap, varPlayer)
end


function x300518_ShowQuestContinueInfo( varMap, varPlayer, varTalknpc, varQuest)
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300518_var_QuestName)
        local varItem, itemname = x300518_GetDigItem(varQuest)
       TalkAppendString( varMap, format( x300518_var_QuestContinue, itemname) )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end


function x300518_ProcDigbyShovel( varMap, varPlayer )

	
	local varQuest = x300518_GetRandQuestId(varMap, varPlayer)
	if (varQuest < x300518_var_DigQuestID or varQuest > x300518_var_DigQuestID_End) then
		return 0
	end

	
	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)

	local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	if isFinish ~= 0 then
		return 0
	end

        
	local userlevelaccept = GetQuestParam( varMap, varPlayer, varQuestIdx, x300518_UserLevelAccept )
	local positiongroup = GetQuestParam( varMap, varPlayer, varQuestIdx, x300518_PositionGroup )

	local posX,posZ,destSceneId = x300518_GetDigPosition(varMap, varPlayer, userlevelaccept, positiongroup)
	if (destSceneId ~= varMap) then	
		return 0
	end
	local varItem,itemname =x300518_GetDigItem(varQuest)
	
	
        local varX, z = GetWorldPos( varMap, varPlayer)
	
        if abs( varX - posX) > x300518_var_Radius or abs( z - posZ) > x300518_var_Radius then
		
            StartTalkTask( varMap)
                TalkAppendString( varMap, format( x300518_var_DigNothing, posX, posZ) )
            StopTalkTask()
            DeliverTalkTips( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, format( x300518_var_DigNothing, posX, posZ), 8, 2)
            return 0
        end

        
        StartItemTask( varMap)
		ItemAppend( varMap, varItem, 1)
        local result = StopItemTask( varMap, varPlayer)
        if result == 0 then
            StartTalkTask( varMap)
		TalkAppendString( varMap, "背包已满，无法放入挖到的物品！" )
            StopTalkTask( varMap)
            DeliverTalkTips( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, "背包已满，无法放入挖到的物品！", 8, 2)
            return 1
        end
        StartTalkTask( varMap)
		TalkAppendString( varMap, "你得到了"..itemname.."。" )
		DeliverItemListSendToPlayer( varMap, varPlayer)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300518_ItemId, varItem) 
        StopTalkTask( varMap)

        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "你得到了"..itemname.."。", 8, 2)
        
	
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        Msg2Player(varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 3)
	
        x300518_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)

        
        LuaCallNoclosure( 300331, "LogicDeplete", varMap, varPlayer)

	return 1
end


function x300518_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest, farScriptId, constMD_Rand, retQuestId)
    return 1
end


function x300518_ShowQuestInfo( varMap, varPlayer, varTalknpc, varQuest)

	local userlevel = GetLevel(varMap, varPlayer);
	
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300518_var_QuestName)
        
	local randgroup,posX,posZ,destSceneId
	if (userlevel < x300518_LevelToCapital) then
		randgroup = random( 1, getn( x300518_var_CoordinateLib) )
		posX = x300518_var_CoordinateLib[ randgroup].posX
		posZ = x300518_var_CoordinateLib[ randgroup].posZ
		destSceneId = x300518_CountrySceneList[GetCurCountry(varMap, varPlayer)+1];
	else
		randgroup = random( 1, getn( x300518_var_CoordinateLib_Cap) )
		posX = x300518_var_CoordinateLib_Cap[ randgroup].posX
		posZ = x300518_var_CoordinateLib_Cap[ randgroup].posZ
		destSceneId = x300518_CapitalSceneId;
	end

        
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0) 
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300518_UserLevelAccept, userlevel) 
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300518_PositionGroup, randgroup) 
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300518_ItemId, -1)
        
        TalkAppendString( varMap, "#Y任务目标：" )
	local varItem, itemName = x300518_GetDigItem(varQuest)

	local strMisInfo
	if (destSceneId == x300518_CapitalSceneId ) then
		strMisInfo = x300518_var_QuestInfo_High
	else
		strMisInfo = x300518_var_QuestInfo
	end

        TalkAppendString( varMap, format( strMisInfo, destSceneId, posX, posZ, posX, posZ, itemName) )

    StopTalkTask()
    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300518_var_FileId, varQuest, 1)


end


function x300518_AutoAccept( varMap, varPlayer, varTalknpc, varQuest)
	return AddQuest( varMap, varPlayer, varQuest, x300518_var_FileId, 0, 0, 0, 1)
end

function x300518_AfterAccept(varMap, varPlayer, varTalknpc, varQuest, varQuestIdx)
	
	x300518_ProcQuestLogRefresh(varMap, varPlayer, varQuest, varQuestIdx)
end

function x300518_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

	varQuest = x300518_GetRandQuestId(varMap, varPlayer)
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0
	end

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);

	local submitguid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	
	if submitguid ~= -1 and submitguid == varTalkNpcGUID then	
		local varState = GetQuestStateNM(varMap, varPlayer, varTalkNpcGUID, varQuest);
		return TalkAppendButtonNM(varMap, varPlayer, varTalkNpcGUID, varQuest, varState, -1);
	end

    return 1
end

function x300518_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)

	if (varQuestIdx == nil) then
		varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	end
	local finished = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
	local userlevelaccept = GetQuestParam( varMap, varPlayer, varQuestIdx, x300518_UserLevelAccept )
	local positiongroup = GetQuestParam( varMap, varPlayer, varQuestIdx, x300518_PositionGroup )
	local posX,posZ,destSceneId = x300518_GetDigPosition(varMap, varPlayer, userlevelaccept, positiongroup)
	local varItem,itemname =x300518_GetDigItem(varQuest)
	local strName;
	strName = x300518_var_QuestName;
	local varCircle = x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	if (varCircle >= x300518_ProceRoundCount) then
		varCircle = 1
	else
		varCircle = varCircle + 1
	end

	strName = strName.."("..varCircle;
	strName = strName.."/"..x300518_ProceRoundCount;
	strName = strName..")";

	local reply_npcid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx );

	StartTalkTask(varMap)
	
	local strMisInfo
	if (destSceneId == x300518_CapitalSceneId ) then
		strMisInfo = x300518_var_QuestInfo_High
	else
		strMisInfo = x300518_var_QuestInfo
	end
        AddQuestLogCustomText( varMap,
                                "",                             
                                strName,          
                                format( x300518_var_QuestTarget, destSceneId, posX, posZ, posX, posZ, finished),
                                "@npc_"..reply_npcid,             
                                format( x300518_var_QuestHelp, destSceneId, posX, posZ, posX, posZ, itemname),
                                format( strMisInfo, destSceneId, posX, posZ, posX, posZ, itemname),
                                "@item_12030020在@npc_138502处有售，请先去找他吧！" )

	
	local curlevel = GetLevel(varMap, varPlayer)
	local varExp = x300518_GetExpAward ( varMap, varPlayer, curlevel );
	local money,shengw = x300518_GetMoneyAward ( varMap, varPlayer, curlevel );
	if(varExp > 0) then
		AddQuestExpBonus(varMap, varExp)
	end
	if(money > 0) then
		AddQuestMoneyBonus2(varMap, money)
	end
	if(shengw > 0) then
		AddQuestMoneyBonus5(varMap, shengw)
	end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x300518_ProcQuestAbandon(varMap, varPlayer, varQuest)
	varQuest = x300518_GetRandQuestId(varMap, varPlayer)
	if (IsHaveQuestNM(varMap, varPlayer, varQuest) == 0) then
		return
	end
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	local saveditemid = GetQuestParam( varMap, varPlayer, varQuestIdx, x300518_ItemId )
	if saveditemid >= 0 then
		if DelItem( varMap, varPlayer, saveditemid, 1) ~= 1 then return 0 end
	end

	LuaCallNoclosure( 300501, "ProcQuestAbandon", varMap, varPlayer, varQuest)
end

function x300518_GetRandQuestId(varMap, varPlayer)
	return  x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID)
end

function x300518_SetMD(varMap, varPlayer, MDNAME, value)
	SetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3], value);
end

function x300518_GetMD(varMap, varPlayer, MDNAME)

	return GetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3])
end


function x300518_CheckDayChanged(varMap, varPlayer)
	local varLastday = x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY)
	local varToday = GetDayOfYear()
	if varLastday ~= varToday then	
		x300518_SetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, varToday)
		x300518_SetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH, 0)
	end
end


function x300518_GetExpAward(varMap, varPlayer, startlevel)

	x300518_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)
	
	varCircle = varCircle + 1
	if (varCircle > x300518_ProceRoundCount) then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local exp_rate
	if GetLevel(varMap, varPlayer) >= 60 then
		exp_rate = 3650
	else
		exp_rate = 2800
	end

	local BonusExp = startlevel * exp_rate * (varCircle * 2 - 1) / 200
	if (highcircle <= x300518_HighBonusCircleCount) then
		BonusExp = BonusExp * 5
	end
    
    BonusExp = BonusExp * 2
	return BonusExp;

end


function x300518_GetMoneyAward(varMap, varPlayer, startlevel)

	x300518_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300518_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

	varCircle = varCircle + 1
	if (varCircle > x300518_ProceRoundCount) then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local BonusMoney = startlevel
	local shengw = 5
	if (highcircle <= x300518_HighBonusCircleCount) then
		BonusMoney = BonusMoney * 5
		shengw = 25
	end
	return BonusMoney, shengw;
end

function x300518_GetDigPosition(varMap, varPlayer, userlevelaccept, positiongroup)

	local posX,posZ,destSceneId
	if (userlevelaccept < x300518_LevelToCapital) then
		if (positiongroup == nil or positiongroup < 1 or positiongroup > getn(x300518_var_CoordinateLib)) then
			return -1,-1,-1
		end
		posX = x300518_var_CoordinateLib[positiongroup].posX;
		posZ = x300518_var_CoordinateLib[positiongroup].posZ;
		destSceneId = x300518_CountrySceneList[GetCurCountry(varMap, varPlayer)+1];
	else
		if (positiongroup == nil or positiongroup < 1 or positiongroup > getn(x300518_var_CoordinateLib_Cap)) then
			return -1,-1,-1
		end
		posX = x300518_var_CoordinateLib_Cap[positiongroup].posX;
		posZ = x300518_var_CoordinateLib_Cap[positiongroup].posZ;
		destSceneId = 0
	end

	return posX, posZ, destSceneId
end

function x300518_GetDigItem(varQuest)

	local varItem = -1
	local itemname = ""
	for varI, item in x300518_var_DigTarget do
		if item.quest == varQuest then
			itemname = item.varName
			varItem = item.varId
			break
		end
	end

	return varItem,itemname
end
