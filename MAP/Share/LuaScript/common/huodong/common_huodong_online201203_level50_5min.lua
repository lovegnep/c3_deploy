x310919_var_FileId 				= 310919
--x310919_var_QuestId				= 1486                     
x310919_var_QuestName			= "【领取成吉思汗3 恶狼传说上线礼包】"
x310919_var_QuestText			= {"\n\t作为成吉思汗的新老朋友，#Y@myname#W你如果在2012年3月23日至3月29日期间等级到达#R30级#W，可以获得我们为你精心准备的成吉思汗3 恶狼传说上线礼包一个。活动期间每天的20:00~22:00可以使用获得各种丰厚礼物，每五分钟可以使用一次"}
x310919_var_QuestName1			= {"#Y【个人】领取成吉思汗3 恶狼传说上线礼包", "#Y【个人】领取成吉思汗3 恶狼传说上线礼包"}
--x310919_var_PresentID			= 12030909
x310919_var_PresentID			= 12031038
x310919_var_Movement			= {}
x310919_var_strAddItemFailed	= "添加物品失败，请整理背包"
--x310919_var_Fuwuqi ={3162,3172,1352,1362,1372}  --服务器ID
x310919_var_MinLevel = 30														--最低等级

function x310919_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )



	local day = GetDayOfYear()
    if day >= 82 and day < 89 then
		TalkAppendButton(varMap,x310919_var_FileId,x310919_var_QuestName, 3)
		return
	end

	
end


function x310919_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

--	local tempwordID = 0
--	local worldID = GetWorldId(varMap,varPlayer)
--
--	if tempwordID == 0 then return end

  
	local day = GetDayOfYear()
	
    if day >= 82 and day < 89 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, x310919_var_QuestName1[1])
		TalkAppendString(varMap, x310919_var_QuestText[1] )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310919_var_FileId, -1)
	else
		return
	end

end

function x310919_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem1 = x310919_GetMD( varMap, varPlayer, MD_CHONGJISAI2012_COUNT_2)

	
--	if GetLevel(varMap, varPlayer) < x310919_var_MinLevel then
--		Msg2Player(varMap, varPlayer, "您等级不足40级，无法参与此活动", 8, 3)
--		return
--	end
	
	local day = GetDayOfYear()
	local hour, minute, sec = GetHourMinSec()
    if day >= 82 and day < 89 and hour>=20 and hour <=22 then	
		if isGetItem1 == 1 then
			Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
			return
		else

			
			x310919_GiveReward( varMap, varPlayer)	
				 GamePlayScriptLog( varMap, varPlayer, 5006)
		end
		else 
		Msg2Player(varMap, varPlayer, "现在不是活动时间", 8, 3)
	end
	


end


function x310919_GiveReward( varMap, varPlayer)
	local itemid = 0
	local day = GetDayOfYear()
--    if day >= 82 and day < 113 then	
		itemid = x310919_var_PresentID
--	end
	
    if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310919_var_strAddItemFailed, 8, 3)
    		return
    	else
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    	 	Msg2Player( varMap, varPlayer,"恭喜您活动成吉思汗3 恶狼传说上线大礼包1个", 8, 3)
    		if itemid == x310919_var_PresentID then
    			x310919_SetMD( varMap, varPlayer, MD_CHONGJISAI2012_COUNT_2, 1)
    		end
    		WriteLog(1, format("x310919_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    end 
    		
end


function x310919_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310919_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
    
end
