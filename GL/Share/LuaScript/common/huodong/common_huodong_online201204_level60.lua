x310252_var_FileId 				= 310252
--x310252_var_QuestId				= 1486                     
x310252_var_QuestName			= "【领取冲级赛礼包】"
x310252_var_QuestText			= {"\n\t作为成吉思汗的新老朋友，#Y@myname#W你如果在2012年4月28日至5月28日期间等级到达#R60级#W，将获得我们为你精心准备的大礼包一个。如过您在5月28日之前达到#R70级#W，可以打开七十级大礼包。如过您在5月28日之前达到#R75级#W，还能再次打开七十五级大礼包。如过您在5月28日之前达到#R80级#W，还能再次打开八十级大礼包。"}
x310252_var_QuestName1			= {"#Y【个人】领取冲级赛大礼包", "#Y【个人】领取冲级赛大礼包"}
x310252_var_PresentID			= 12031045    --礼包ID

x310252_var_Movement			= {}
x310252_var_strAddItemFailed	= "添加物品失败，请整理背包"
x310252_var_Fuwuqi ={2162,2172,2182}  --服务器ID
x310252_var_MinLevel = 60														--最低等级

function x310252_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local serverId = GetWorldIdEx()
for i, v in x310252_var_Fuwuqi do 
		if serverId == v then
			--4月28到5月28
			local year, month, day = GetYearMonthDay();
			local day1 = GetDayOfYear()
	    if year == 2012 and day1 >= 118 and day1 <= 148 then
				TalkAppendButton(varMap,x310252_var_FileId,x310252_var_QuestName, 3,3)
				
			end
		end
	end
end


function x310252_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

	local tempwordID = 0
	local worldID = GetWorldId(varMap,varPlayer)

	--if tempwordID == 0 then return end

	local serverId = GetWorldIdEx()
	for i, v in x310252_var_Fuwuqi do 
		if serverId == v then 
			if idExt == 3 then
				local year, month, day = GetYearMonthDay();
				if year == 2012 then
					local day = GetDayOfYear()

			    if day >= 118 and day <= 148 then
		    
					StartTalkTask(varMap)          
					TalkAppendString(varMap, x310252_var_QuestName1[1])
					TalkAppendString(varMap, x310252_var_QuestText[1] )
					StopTalkTask()
					DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310252_var_FileId, -1)
				else
					return
				end
			end
		end
	end
	end
end

function x310252_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem1 = x310252_GetMD( varMap, varPlayer, MD_NEWSERVER_MONEY_1)

	
	if GetLevel(varMap, varPlayer) < x310252_var_MinLevel then
		Msg2Player(varMap, varPlayer, "您等级不足60级，无法参与此活动", 8, 3)
		return
	end
	
	
	local serverId = GetWorldIdEx()
	for i, v in x310252_var_Fuwuqi do 
		if serverId == v then 
			local year, month, day = GetYearMonthDay();
			if year == 2012 then
				local day = GetDayOfYear()
			  if day >= 118 and day <= 148 then	
					if isGetItem1 == 1 then
						Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
						return
					else
					 	Msg2Player(varMap, varPlayer, "您获得了一个#G冲级赛礼包（60级）", 8, 3)
						x310252_GiveReward( varMap, varPlayer)	
						GamePlayScriptLog( varMap, varPlayer, 3730)
					end
				end
			end
		end
	end
	


end


function x310252_GiveReward( varMap, varPlayer)
	local itemid = 0
	local day = GetDayOfYear()
    if day >= 118 and day <= 148 then	
			itemid = x310252_var_PresentID
		end
	
    if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310252_var_strAddItemFailed, 8, 3)
    		return
    	else
    		
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		if itemid == x310252_var_PresentID then
    			x310252_SetMD( varMap, varPlayer, MD_NEWSERVER_MONEY_1, 1)
    		end
    		WriteLog(1, format("x310252_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    end 
    		
end


function x310252_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310252_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
