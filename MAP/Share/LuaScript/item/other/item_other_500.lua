





x418500_var_FileId = 418500
x418500_var_QuestId = 10291
x418500_var_ItemId = 12260021
x418500_var_NoTimes = "您的剩余次数不足！"
x418500_var_StartWeek =81
x418500_var_NormalItemNum		=   16	



x418500_var_MainMenuTab	=	{
								{	itemname = 	"神级首饰套装一（90天）",	describe = "#W该套首饰额外附加#R全属性#W", varItem  = {10298210,10288210},	 varNum = 1	,  probability =1000 	},
								{	itemname = 	"神级首饰套装二（90天）",	describe = "#W该套首饰额外附加#R生命#W",   varItem  = {10288232,10298232},	 varNum = 1	,  probability =1000 	},
								{	itemname = 	"天级首饰套装一（90天）",	describe = "#W该套首饰额外附加#R全属性#W", varItem  = {10298213,10288213},	 varNum = 1	,  probability =1000 	},
								{	itemname = 	"天级首饰套装二（90天）",	describe = "#W该套首饰额外附加#R生命#W",   varItem  = {10288233,10298233},	 varNum = 1  , probability =1000  }, 
								{	itemname = 	"冥级首饰套装一（90天）",	describe = "#W该套首饰额外附加#R全属性#W", varItem  = {10298216,10288216},	 varNum = 1	,  probability =1000	},  
								{	itemname = 	"冥级首饰套装二（90天）",	describe = "#W该套首饰额外附加#R生命#W",   varItem  = {10288234,10298234},	 varNum = 1	,  probability =1000 	},
                                                                  
							}                                                   
                                                                  
                                                                  
function x418500_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
--	if MdIndex == 1 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT1[1], MD_CHONGCU_COUNT1[2],MD_CHONGCU_COUNT1[3], MdData ) 
--	elseif MdIndex == 2 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT2[1], MD_CHONGCU_COUNT2[2],MD_CHONGCU_COUNT2[3], 1 ) 
--	elseif MdIndex == 3 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT3[1], MD_CHONGCU_COUNT3[2],MD_CHONGCU_COUNT3[3], MdData ) 
--	elseif MdIndex == 4 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT4[1], MD_CHONGCU_COUNT4[2],MD_CHONGCU_COUNT4[3], MdData ) 
--	elseif MdIndex == 5 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT5[1], MD_CHONGCU_COUNT5[2],MD_CHONGCU_COUNT5[3], MdData ) 
--	elseif MdIndex == 6 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT6[1], MD_CHONGCU_COUNT6[2],MD_CHONGCU_COUNT6[3], MdData ) 
--	elseif MdIndex == 7 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT7[1], MD_CHONGCU_COUNT7[2],MD_CHONGCU_COUNT7[3], MdData ) 
--	elseif MdIndex == 8 then
--		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT8[1], MD_CHONGCU_COUNT8[2],MD_CHONGCU_COUNT8[3], MdData ) 
--	end
end
function x418500_GetLeaveTimes( varMap, varPlayer, MdIndex )
	return 1
end
function x418500_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418500_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418500_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end





function x418500_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418500_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418500, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418500_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418500_CheckDate( varMap, varPlayer)
--	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
--			local nFrom = MD_CHONGCU_BEGIN[1]
--			local nTo   = MD_CHONGCU_END[1]
--			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
--			nFrom = nFrom + 1
--			for varI = nFrom,nTo do
--				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
--			end
--	end	
--	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418500_var_StartWeek)
end



function x418500_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
--		local Times = x418500_GetLeaveTimes(varMap, varPlayer, extid)
--		Times = 30 - Times
--		if Times <= 0 then
--			Msg2Player( varMap, varPlayer, x418500_var_NoTimes, 8, 2)
--			return
--		end
		local year,month,day = GetYearMonthDay()
		if extid <= 3 then
			if year == 2011 and day <= 23 then
				return
			end
		end


		StartTalkTask( varMap)
		if extid == 3 then
			TalkAppendString( varMap, format( "\t您选择了#R%s%s#W，您确定要选择该套套装吗？\n \n 注：所得道具为#R绑定道具#W。", x418500_var_MainMenuTab[ extid].itemname,x418500_var_MainMenuTab[ extid].describe ,12030059 ) )	
		else
			TalkAppendString( varMap, format( "\t您选择了#R%s%s#W，您确定要选择该套套装吗？\n \n 注：所得道具均为#R绑定道具#W。", x418500_var_MainMenuTab[ extid].itemname,x418500_var_MainMenuTab[ extid].describe ,12030059 ) )
		end
		for i ,item in x418500_var_MainMenuTab[extid].varItem do
				AddQuestItemBonus( varMap,x418500_var_MainMenuTab[extid].varItem[i] , x418500_var_MainMenuTab[ extid].varNum)
		end		


--		if extid == 1 then		 
--			AddQuestItemBonus( varMap,12030605 , x418500_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap,12030606	, x418500_var_MainMenuTab[ extid].varNum)
--		elseif extid == 2 or extid == 3 or extid == 6 then
--			AddQuestItemBonus( varMap, x418500_var_MainMenuTab[ extid].varItem1, x418500_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap, x418500_var_MainMenuTab[ extid].varItem2, x418500_var_MainMenuTab[ extid].varNum)			
--		elseif extid == 4 or extid == 8 then		 
--			AddQuestItemBonus( varMap, x418500_var_MainMenuTab[ extid].varItem1, x418500_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap, x418500_var_MainMenuTab[ extid].varItem2, x418500_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap, x418500_var_MainMenuTab[ extid].varItem3, x418500_var_MainMenuTab[ extid].varNum)
--		else
--		AddQuestItemBonus( varMap, x418500_var_MainMenuTab[ extid].varItem, x418500_var_MainMenuTab[ extid].varNum)	
--		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418500_var_FileId,x418500_var_QuestId)

end

function x418500_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	local year,month,day = GetYearMonthDay()		
	if year ~= 2012 then
		Msg2Player( varMap, varPlayer, "此道具已过使用期", 8, 3)
		DepletingUsedItem( varMap, varPlayer)

		return 0
	end
--	
--	x418500_CheckDate( varMap, varPlayer)
	local year,month,day = GetYearMonthDay()



	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t选择一套情人节首饰套装！" )

	for varI, s in x418500_var_MainMenuTab do		
		TalkAppendButton(varMap, x418500_var_QuestId, "我要"..x418500_var_MainMenuTab[varI].itemname.."！",3,varI)	
	end

	StopTalkTask( varMap)

  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418500_GetGift( varMap, varPlayer, varIndex)

	local year,month,day = GetYearMonthDay()
	if varIndex <= 3 then
		if year ~= 2012 then
		if DepletingUsedItem(varMap, varPlayer) == 1 then 
			StartTalkTask(varMap)
			TalkAppendString(varMap,"礼包已过期")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		return
	end
	end


--	local varRand = random (1 , 10000)
--	if varRand < 1 then varRand =9999 end
--	if varRand >= 10000 then varRand =9999 end
--	
--	if varRand <= x418500_var_MainMenuTab[varIndex].probability then
		local itemid =random(getn(x418500_var_MainMenuTab[varIndex].varItem))
		return x418500_var_MainMenuTab[varIndex].varItem[1],x418500_var_MainMenuTab[varIndex].varItem[2]
--	else
--			return 12030059,0
--	end			
--		
end



function x418500_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

  local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	

	local varMsg =""


		local varNum =x418500_var_MainMenuTab[varIndex].varNum
		
	if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
		
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418500_var_ItemId then
				return
			end
		
		
			if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
				return
			end



			local value1 = x418500_var_MainMenuTab[varIndex].varItem[1]
			local value2 = x418500_var_MainMenuTab[varIndex].varItem[2]
			StartItemTask( varMap)
			
			ItemAppendBind( varMap, value1, varNum)
			
			ItemAppendBind( varMap, value2, varNum)
				
			if StopItemTask( varMap, varPlayer) <= 0 then
				return
			end
			DeliverItemListSendToPlayer( varMap, varPlayer)
			varMsg = format( "恭喜你获得了%d个#{_ITEM%d}和%d个#{_ITEM%d}!", varNum, value1, varNum, value2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		end

--	Times = Times -	1
--	Times = 30 - Times
--	x418500_SetLeaveTimes(varMap, varPlayer, varIndex, Times)
	local logindex = 3510+varIndex
	GamePlayScriptLog( varMap, varPlayer, logindex)

    
end


