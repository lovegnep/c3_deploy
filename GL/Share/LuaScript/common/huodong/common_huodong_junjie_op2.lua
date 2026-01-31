x310934_var_FileId 				= 310934
x310934_var_QuestId				= 4396                     
x310934_var_QuestName			= "【领取老玩家军阶礼包】"
x310934_var_QuestText			= {"\n\t作为成吉思汗的老朋友，#Y@myname#W你如果在2011年6月9日9:00至6月16日24：00期间军阶等级到达#R镇戍精锐#W或更高军阶等级，就可以在此期间内找我领取一份老玩家镇戌大礼包。", "\n\t作为成吉思汗的老朋友，#Y@myname#W你如果在2011年7月19日9:00至7月26日24：00期间军阶等级到达#R下十户长#W或更高军阶等级，就可以在此期间内找我领取一份老玩家十户长大礼包。"}
x310934_var_QuestName1			= {"#Y【个人】领取老玩家镇戌大礼包", "#Y【个人】领取老玩家十户长大礼包"}
x310934_var_PresentID			= {12030596, 12030597}
x310934_var_Movement			= {}
x310934_var_strAddItemFailed	= "添加物品失败，请整理背包"


function x310934_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if IsQuestHaveDone(varMap, varPlayer, x310934_var_QuestId) <= 0 then
		return
	end

	local year,month,day = GetYearMonthDay()
	if 	year ~=2011 then
		return
	end			
	
	if GetCurrentTime() >= 1307581200 and GetDayOfYear() <= 166 then
		TalkAppendButton(varMap,x310934_var_FileId,x310934_var_QuestName, 3)
	elseif GetCurrentTime() >= 1311037200 and GetDayOfYear() <= 206 then
		TalkAppendButton(varMap,x310934_var_FileId,x310934_var_QuestName,3, -1)
	else
		return
	end
	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310934_var_FileId, x310934_var_QuestId)
	
end


function x310934_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt )
	if GetCurrentTime() >= 1307581200 and GetDayOfYear() <= 166 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, x310934_var_QuestName1[1])
		TalkAppendString(varMap, x310934_var_QuestText[1] )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310934_var_FileId, -1)
	elseif GetCurrentTime() >= 1311037200 and GetDayOfYear() <= 206 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, x310934_var_QuestName1[2])
		TalkAppendString(varMap, x310934_var_QuestText[2] )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310934_var_FileId, -1)	
	else
		return
	end

end

function x310934_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem1 = x310934_GetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT3)
	local isGetItem2 = x310934_GetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT4)
		
	if IsQuestHaveDone(varMap, varPlayer, x310934_var_QuestId) <= 0 then
		Msg2Player(varMap, varPlayer, "您未完成过任务【个人】玩家回归，无法参与此活动", 8, 1)
		Msg2Player(varMap, varPlayer, "您未完成过任务【个人】玩家回归，无法参与此活动", 8, 3)	
		return
	end
	
	if GetCurrentTime() < 1307581200 then
		return
	end
	
	if GetDayOfYear() > 166 and GetCurrentTime() < 1311037200 then
		return
	end
	
	if GetDayOfYear() > 206 then
		return
	end	
		
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "您等级不足60级，无法参与此活动", 8, 3)
		return
	end
	

	
	if GetCurrentTime() >= 1307581200 and GetDayOfYear() <= 166 then
		if militaryRankLevel < 4 then
			Msg2Player(varMap, varPlayer, "您的军阶等级不足，无法参与此活动", 8, 3)
			return	
		elseif isGetItem1 == 1 then
			Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
			return
		else
			x310934_GiveReward( varMap, varPlayer)	
		end
	end
	
	if GetCurrentTime() >= 1311037200 and GetDayOfYear() <= 206 then
		if militaryRankLevel < 7 then
			Msg2Player(varMap, varPlayer, "您的军阶等级不足，无法参与此活动", 8, 3)
			return	
		elseif isGetItem2 == 1 then
			Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
			return	
		else
			x310934_GiveReward( varMap, varPlayer)
		end
	end	
	

end


function x310934_GiveReward( varMap, varPlayer)
	local itemid = 0
	if GetCurrentTime() >= 1307581200 and GetDayOfYear() <= 166 then
		itemid = x310934_var_PresentID[1]
	elseif GetCurrentTime() >= 1311037200 and GetDayOfYear() <= 206 then
		itemid = x310934_var_PresentID[2]
	end
	
    --if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310934_var_strAddItemFailed, 8, 3)
    		return
    	else
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		if itemid == x310934_var_PresentID[1] then
    			x310934_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT3, 1)
    		elseif itemid == x310934_var_PresentID[2] then
    			x310934_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT4, 1)
    		end
    		WriteLog(1, format("x310934_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    --end 
    		
end


function x310934_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310934_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
