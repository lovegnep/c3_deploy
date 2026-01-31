x310933_var_FileId 				= 310933
x310933_var_QuestId				= 1486                     
x310933_var_QuestName			= "【领取老玩家军阶礼包】"
x310933_var_QuestText			= {"\n\t作为成吉思汗的老朋友，#Y@myname#W你如果在2011年4月5日至4月11日24：00期间军阶等级到达#R镇戍精锐#W或更高军阶等级，就可以在此期间内找我领取一份老玩家镇戌大礼包。", "\n\t作为成吉思汗的老朋友，#Y@myname#W你如果在2011年5月2日至5月9日24：00期间军阶等级到达#R下十户长#W或更高军阶等级，就可以在此期间内找我领取一份老玩家十户长大礼包。"}
x310933_var_QuestName1			= {"#Y【个人】领取老玩家镇戌大礼包", "#Y【个人】领取老玩家十户长大礼包"}
x310933_var_PresentID			= {12030596, 12030597}
x310933_var_Movement			= {}
x310933_var_strAddItemFailed	= "添加物品失败，请整理背包"


function x310933_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	--Msg2Player(varMap, varPlayer, IsQuestHaveDone(varMap, varPlayer, x310933_var_QuestId), 8, 2)
	if IsQuestHaveDone(varMap, varPlayer, x310933_var_QuestId) <= 0 then
		return
	end

	local year,month,day = GetYearMonthDay()
	if 	year ~=2011 then
		return
	end			
	
	if GetCurrentTime() >= 1301965200 and GetDayOfYear() <= 100 then
		TalkAppendButton(varMap,x310933_var_FileId,x310933_var_QuestName, 3)
	elseif GetCurrentTime() >= 1304298000 and GetDayOfYear() <= 128 then
		TalkAppendButton(varMap,x310933_var_FileId,x310933_var_QuestName,3, -1)
	else
		return
	end
	
	
end


function x310933_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

	if GetCurrentTime() >= 1301965200 and GetDayOfYear() <= 100 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, x310933_var_QuestName1[1])
		TalkAppendString(varMap, x310933_var_QuestText[1] )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310933_var_FileId, -1)
	elseif GetCurrentTime() >= 1304298000 and GetDayOfYear() <= 128 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, x310933_var_QuestName1[2])
		TalkAppendString(varMap, x310933_var_QuestText[2] )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310933_var_FileId, -1)	
	else
		return
	end

end

function x310933_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem1 = x310933_GetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT1)
	local isGetItem2 = x310933_GetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT2)
		
	if IsQuestHaveDone(varMap, varPlayer, x310933_var_QuestId) <= 0 then
		Msg2Player(varMap, varPlayer, "您未完成过任务【个人】玩家回归，无法参与此活动", 8, 1)
		Msg2Player(varMap, varPlayer, "您未完成过任务【个人】玩家回归，无法参与此活动", 8, 3)	
		return
	end
	
	if GetCurrentTime() < 1301965200 then
		return
	end
	
	if GetDayOfYear() > 100 and GetCurrentTime() < 1304298000 then
		return
	end
	
	if GetDayOfYear() > 128 then
		return
	end	
		
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "您等级不足60级，无法参与此活动", 8, 3)
		return
	end
	

	
	if GetCurrentTime() >= 1301965200 and GetDayOfYear() <= 100 then
		if militaryRankLevel < 4 then
			Msg2Player(varMap, varPlayer, "您的军阶等级不足，无法参与此活动", 8, 3)
			return	
		elseif isGetItem1 == 1 then
			Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
			return
		else
			x310933_GiveReward( varMap, varPlayer)	
		end
	end
	
	if GetCurrentTime() >= 1304298000 and GetDayOfYear() <= 128 then	
		if militaryRankLevel < 7 then
			Msg2Player(varMap, varPlayer, "您的军阶等级不足，无法参与此活动", 8, 3)
			return	
		elseif isGetItem2 == 1 then
			Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
			return	
		else
			x310933_GiveReward( varMap, varPlayer)
		end
	end	
	

end


function x310933_GiveReward( varMap, varPlayer)
	local itemid = 0
	if GetCurrentTime() >= 1301965200 and GetDayOfYear() <= 100 then
		itemid = x310933_var_PresentID[1]
	elseif GetCurrentTime() >= 1304298000	 and GetDayOfYear() <= 128 then
		itemid = x310933_var_PresentID[2]
	end
	
    if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310933_var_strAddItemFailed, 8, 3)
    		return
    	else
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		if itemid == x310933_var_PresentID[1] then
    			x310933_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT1, 1)
    		elseif itemid == x310933_var_PresentID[2] then
    			x310933_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT2, 1)
    		end
    		WriteLog(1, format("x310933_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    end 
    		
end


function x310933_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310933_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
