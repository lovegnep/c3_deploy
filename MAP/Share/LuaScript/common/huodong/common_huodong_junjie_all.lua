x310932_var_FileId 				= 310932
                     
x310932_var_QuestName			= "【领取军阶礼包】"
x310932_var_QuestText			= "\t军阶系统已经上线一个多月了，#Y@myname#W你现在的军阶到达哪一个级别了呢？\n\t在2011年4月12日至4月18日期间，所有60级以上的玩家军阶等级达到#R探马赤军#W或更高军阶的玩家，可以在我这里领取一份神秘大礼包。"
x310932_var_QuestMenu			= {"探马赤军", "镇戌精锐", "怯薛悍卒"}
x310932_var_PresentID			= {12030595, 12030594, 12030593}
x310932_var_Movement			= {}
x310932_var_strAddItemFailed	= "添加物品失败，请整理背包"

function x310932_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	--Msg2Player(varMap, varPlayer, GetDayOfYear(), 8, 2)
	if GetDayOfYear() < 101 or GetDayOfYear() > 107 then
		return
	end
	
	local year,month,day = GetYearMonthDay()
	if 	year ~=2011 then
		return
	end		
	
	
	TalkAppendButton(varMap,x310932_var_FileId,x310932_var_QuestName,3,-1)
end


function x310932_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem = x310932_GetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT)

	if GetDayOfYear() < 101 or GetDayOfYear() > 107 then
		return
	end
	
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "您等级不足60级，无法参与此活动", 8, 3)
		return
	end
	
	if militaryRankLevel < 3 then
		Msg2Player(varMap, varPlayer, "您的军阶等级不足，无法参与此活动", 8, 3)
		return	
	end
		
	if isGetItem == 1 then
		Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
		return	
	end
	
	StartTalkTask(varMap)          
	TalkAppendString(varMap, "#Y【个人】领取军阶礼包")
	TalkAppendString(varMap, x310932_var_QuestText )
	if militaryRankLevel >= 3 and militaryRankLevel < 4 then
		TalkAppendButton(varMap,x310932_var_FileId,x310932_var_QuestMenu[1],3, 1)
	elseif militaryRankLevel >= 4 and militaryRankLevel < 5 then
		TalkAppendButton(varMap,x310932_var_FileId,x310932_var_QuestMenu[2],3, 2)
	elseif militaryRankLevel >= 5 then
		TalkAppendButton(varMap,x310932_var_FileId,x310932_var_QuestMenu[3],3, 3)
	end
	StopTalkTask()
	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	x310932_var_Movement[GetGUID(varMap, varPlayer)] = idExt
	
	if x310932_var_Movement[GetGUID(varMap, varPlayer)] == 1 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, format("#Y【个人】领取%s礼包\n", x310932_var_QuestMenu[x310932_var_Movement[GetGUID(varMap, varPlayer)]]))
		TalkAppendString(varMap, format("\t根据您现在的军阶等级，您可以领取一份%s军饷大礼包，您确定要领取吗？" , x310932_var_QuestMenu[x310932_var_Movement[GetGUID(varMap, varPlayer)]]))	
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310932_var_FileId, -1)
	elseif x310932_var_Movement[GetGUID(varMap, varPlayer)] == 2 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, format("#Y【个人】领取%s礼包\n", x310932_var_QuestMenu[x310932_var_Movement[GetGUID(varMap, varPlayer)]]))
		TalkAppendString(varMap, format("\t根据您现在的军阶等级，您可以领取一份%s军饷大礼包，您确定要领取吗？" , x310932_var_QuestMenu[x310932_var_Movement[GetGUID(varMap, varPlayer)]]))	
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310932_var_FileId, -1)
	elseif x310932_var_Movement[GetGUID(varMap, varPlayer)] == 3 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, format("#Y【个人】领取%s礼包\n", x310932_var_QuestMenu[x310932_var_Movement[GetGUID(varMap, varPlayer)]]))
		TalkAppendString(varMap, format("\t根据您现在的军阶等级，您可以领取一份%s军饷大礼包，您确定要领取吗？" , x310932_var_QuestMenu[x310932_var_Movement[GetGUID(varMap, varPlayer)]]))	
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310932_var_FileId, -1)		
	end
end


function x310932_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	if GetDayOfYear() < 101 or GetDayOfYear() > 107 then
		return
	end
	
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "您等级不足60级，无法参与此活动", 8, 3)
		return
	end
	
	if militaryRankLevel < 3 then
		Msg2Player(varMap, varPlayer, "军阶等级未到探马赤军，无法参与此活动", 8, 3)
		return	
	end	
	
	if isGetItem == 1 then
		Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
		return	
	end
		
	x310932_GiveReward( varMap, varPlayer)
	
end



function x310932_GiveReward( varMap, varPlayer)
	local itemid = x310932_var_PresentID[x310932_var_Movement[GetGUID(varMap, varPlayer)]]
    if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310932_var_strAddItemFailed, 8, 3)
    		return
    	else
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		x310932_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT, 1)
    		WriteLog(1, format("x310932_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    end
    		
end


function x310932_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310932_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
