x310943_var_FileId 				= 310943
--x310943_var_QuestId				= 1486                     
x310943_var_QuestName			= "【领取冲级赛礼包】"
x310943_var_QuestText			= {"\n\t作为成吉思汗的新老朋友，#Y@myname#W你如果在2012年8月3日至9月2日期间等级到达#R60级#W，将获得我们为你精心准备的大礼包一个。如过您在9月3日之前达到#R60级#W，打开可以获得丰富奖励及七十级大礼包。如过您在9月3日之前达到#R70级#W，还能再次打开获得丰富奖励及八十级大礼包。如过您在9月3日之前达到#R80级#W，可以获得丰富的奖励。",
														"\n\t作为成吉思汗的新老朋友，#Y@myname#W你如果在2012年8月10日至9月9日期间等级到达#R60级#W，将获得我们为你精心准备的大礼包一个。如过您在9月3日之前达到#R60级#W，打开可以获得丰富奖励及七十级大礼包。如过您在9月3日之前达到#R70级#W，还能再次打开获得丰富奖励及八十级大礼包。如过您在9月3日之前达到#R80级#W，可以获得丰富的奖励。"
														}
x310943_var_QuestName1			= {"#Y【个人】领取冲级赛大礼包", "#Y【个人】领取冲级赛大礼包"}
x310943_var_PresentID			= 12031072    --礼包ID
x310943_var_DayAndServerID ={{serverId = 2052,lastDay = 245},
															{serverId = 2092,lastDay = 252}
														}
x310943_var_Movement			= {}
x310943_var_strAddItemFailed	= "添加物品失败，请整理背包"

x310943_var_MinLevel = 60														--最低等级

function x310943_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local serverId = GetWorldIdEx()
	local a = 1
		for i, v in x310943_var_DayAndServerID do 
				if serverId == v.serverId then

					local year, month, day = GetYearMonthDay();
					local day1 = GetDayOfYear()
			    if year == 2012 and day1 >= 216 and day1 <= x310943_var_DayAndServerID[i].lastDay then
						TalkAppendButton(varMap,x310943_var_FileId,x310943_var_QuestName, 3,3)
						
					end
				end
				a = a + 1
		end
end


function x310943_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

	local tempwordID = 0
	local worldID = GetWorldId(varMap,varPlayer)

	--if tempwordID == 0 then return end

	local serverId = GetWorldIdEx()
	local a = 1
		for i, v in x310943_var_DayAndServerID do  
			if serverId == v.serverId then 
				if idExt == 3 then
					local year, month, day = GetYearMonthDay();
					if year == 2012 then
						local day = GetDayOfYear()
	
				    if day >= 216 and day <= x310943_var_DayAndServerID[a].lastDay then
			    
						StartTalkTask(varMap)          
						TalkAppendString(varMap, x310943_var_QuestName1[1])
						TalkAppendString(varMap, x310943_var_QuestText[a] )
						StopTalkTask()
						DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310943_var_FileId, -1)
						else
							return
						end
					end
				end
			end
			a =a + 1
	end
end

function x310943_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	local isGetItem1 = x310943_GetMD( varMap, varPlayer, MD_CHONGJISAI_201208)

	
	if GetLevel(varMap, varPlayer) < x310943_var_MinLevel then
		Msg2Player(varMap, varPlayer, "您等级不足60级，无法参与此活动", 8, 3)
		return
	end
	
	
	local serverId = GetWorldIdEx()
	local a = 1
	for i, v in x310943_var_DayAndServerID do 
		if serverId == v.serverId then 
			local year, month, day = GetYearMonthDay();
			if year == 2012 then
				local day = GetDayOfYear()
			  if day >= 216 and day <= x310943_var_DayAndServerID[a].lastDay then	
					if isGetItem1 == 1 then
						Msg2Player(varMap, varPlayer, "您已经参与过此活动了", 8, 3)
						return
					else
					 	Msg2Player(varMap, varPlayer, "您获得了一个#G冲级赛礼包（60级）", 8, 3)
						x310943_GiveReward( varMap, varPlayer,a)	
						GamePlayScriptLog( varMap, varPlayer, 3875)
					end
				end
			end
		end
		a = a + 1
	end
	


end


function x310943_GiveReward( varMap, varPlayer,a)
	local itemid = 0
	local day = GetDayOfYear()
    if day >= 216 and day <= x310943_var_DayAndServerID[a].lastDay then	
			itemid = x310943_var_PresentID
		end
	
    if varItem ~= 0 then
    	StartItemTask( varMap)
        ItemAppendBind( varMap, itemid, 1)
    	local bRes = StopItemTask( varMap, varPlayer)
    	if bRes == 0 then
    		Msg2Player( varMap, varPlayer, x310943_var_strAddItemFailed, 8, 3)
    		return
    	else
    		
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		if itemid == x310943_var_PresentID then
    			x310943_SetMD( varMap, varPlayer, MD_CHONGJISAI_201208, 1)
    		end
    		WriteLog(1, format("x310943_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
    	end
    end 
    		
end


function x310943_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310943_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
