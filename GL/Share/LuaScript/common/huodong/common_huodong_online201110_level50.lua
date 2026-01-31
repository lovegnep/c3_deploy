x310917_var_FileId 				= 310917
--x310917_var_QuestId				= 1486                     
x310917_var_QuestName			= "【领取冲级赛礼包】"
x310917_var_QuestText			= {"\n\t作为成吉思汗的新老朋友，#Y@myname#W你如果在2011年11月1日至11月7日24：00期间等级到达#R50级#W，将获得我们为你精心准备的大礼包一个。如过您在11月21日24：00之前达到#R70级#W，还能再次打开七十级大礼包。"}
x310917_var_QuestName1			= {"#Y【个人】领取冲级赛大礼包", "#Y【个人】领取冲级赛大礼包"}
x310917_var_PresentID			= 12030796
x310917_var_Movement			= {}
x310917_var_strAddItemFailed	= "添加物品失败，请整理背包"
x310917_var_Fuwuqi ={3162,3172,1352,1362,1372}  --服务器ID
x310917_var_MinLevel = 50														--最低等级

function x310917_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local tempwordID = 0
	local worldID = GetWorldId(varMap,varPlayer)
	for varI0 ,item0 in x310917_var_Fuwuqi do
		if worldID == item0 then
			tempwordID = 1
			break;
		end
	end
	if tempwordID == 0 then return end

	local day = GetDayOfYear()
    if day >= 304 and day < 311 then
		TalkAppendButton(varMap,x310917_var_FileId,x310917_var_QuestName, 3)
		return
	end

	
end

print(GetDayOfYear())
function x310917_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

	local tempwordID = 0
	local worldID = GetWorldId(varMap,varPlayer)
	for varI0 ,item0 in x310917_var_Fuwuqi do
		if worldID == item0 then
			tempwordID = 1
			break;
		end
	end
	if tempwordID == 0 then return end

   
	local day = GetDayOfYear()
    if day >= 304 and day < 311 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, x310917_var_QuestName1[1])
		TalkAppendString(varMap, x310917_var_QuestText[1] )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310917_var_FileId, -1)
	else
		return
	end

end

function x310917_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem1 = x310917_GetMD( varMap, varPlayer, MD_CHONGJISAI_COUNT)

	
	if GetLevel(varMap, varPlayer) < x310917_var_MinLevel then
		Msg2Player(varMap, varPlayer, "您等级不足50级，无法参与此活动", 8, 3)
		return
	end
	
	local day = GetDayOfYear()
    if day >= 304 and day < 311  then	
		if isGetItem1 == 1 then
			Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
			return
		else
			x310917_GiveReward( varMap, varPlayer)	
		end
	end
	


end


function x310917_GiveReward( varMap, varPlayer)
	local itemid = 0
	local day = GetDayOfYear()
    if day >= 304 and day < 311 then	
		itemid = x310917_var_PresentID
	end
	
    if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310917_var_strAddItemFailed, 8, 3)
    		return
    	else
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		if itemid == x310917_var_PresentID then
    			x310917_SetMD( varMap, varPlayer, MD_CHONGJISAI_COUNT, 1)
    		end
    		WriteLog(1, format("x310917_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    end 
    		
end


function x310917_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310917_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
