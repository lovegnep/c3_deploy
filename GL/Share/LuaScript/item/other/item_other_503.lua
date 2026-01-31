





x418503_var_FileId = 418503
x418503_var_QuestId = 10292
x418503_var_ItemId = 12260018
x418503_var_NoTimes = "您的剩余次数不足！"
x418503_var_StartWeek =81
x418503_var_NormalItemNum		=   16	



x418503_var_MainMenuTab	=	{
								{	itemname = 	"神级首饰套装一（永久）",	describe = "#W该套首饰额外附加#R全属性#W", varItem  = {10298192,10288192},	 varNum = 1	,  probability =1000 	},
								{	itemname = 	"神级首饰套装二（永久）",	describe = "#W该套首饰额外附加#R生命#W",   varItem  = {10298226,10288226},	 varNum = 1	,  probability =1000 	},
								{	itemname = 	"天级首饰套装一（永久）",	describe = "#W该套首饰额外附加#R全属性#W", varItem  = {10298195,10288195},	 varNum = 1	,  probability =1000 	},
								{	itemname = 	"天级首饰套装二（永久）",	describe = "#W该套首饰额外附加#R生命#W",   varItem  = {10298227,10288227},	 varNum = 1  ,  probability =1000 	}, 
								{	itemname = 	"冥级首饰套装一（永久）",	describe = "#W该套首饰额外附加#R全属性#W", varItem  = {10298198,10288198},	 varNum = 1	,  probability =1000	},  
								{	itemname = 	"冥级首饰套装二（永久）",	describe = "#W该套首饰额外附加#R生命#W",   varItem  = {10298228,10288228},	 varNum = 1	,  probability =1000 	},

							}                                     


function x418503_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
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
function x418503_GetLeaveTimes( varMap, varPlayer, MdIndex )
	return 1
end
function x418503_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418503_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418503_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418503_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418503_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418503, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418503_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418503_CheckDate( varMap, varPlayer)
--	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
--			local nFrom = MD_CHONGCU_BEGIN[1]
--			local nTo   = MD_CHONGCU_END[1]
--			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
--			nFrom = nFrom + 1
--			for varI = nFrom,nTo do
--				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
--			end
--	end	
--	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418503_var_StartWeek)
end



function x418503_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

--		local Times = x418503_GetLeaveTimes(varMap, varPlayer, extid)
--		Times = 30 - Times
--		if Times <= 0 then
--			Msg2Player( varMap, varPlayer, x418503_var_NoTimes, 8, 2)
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
			TalkAppendString( varMap, format( "\t您选择了#R%s%s#W，您确定要选择该套套装吗？\n \n 注：所得道具为#R绑定道具#W。", x418503_var_MainMenuTab[ extid].itemname,x418503_var_MainMenuTab[ extid].describe ,12030059 ) )	
		else
			TalkAppendString( varMap, format( "\t您选择了#R%s%s#W，您确定要选择该套套装吗？\n \n 注：所得道具均为#R绑定道具#W。", x418503_var_MainMenuTab[ extid].itemname,x418503_var_MainMenuTab[ extid].describe ,12030059 ) )
		end
		for i ,item in x418503_var_MainMenuTab[extid].varItem do
				AddQuestItemBonus( varMap,x418503_var_MainMenuTab[extid].varItem[i] , x418503_var_MainMenuTab[ extid].varNum)
		end		


--		if extid == 1 then		 
--			AddQuestItemBonus( varMap,12030605 , x418503_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap,12030606	, x418503_var_MainMenuTab[ extid].varNum)
--		elseif extid == 2 or extid == 3 or extid == 6 then
--			AddQuestItemBonus( varMap, x418503_var_MainMenuTab[ extid].varItem1, x418503_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap, x418503_var_MainMenuTab[ extid].varItem2, x418503_var_MainMenuTab[ extid].varNum)			
--		elseif extid == 4 or extid == 8 then		 
--			AddQuestItemBonus( varMap, x418503_var_MainMenuTab[ extid].varItem1, x418503_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap, x418503_var_MainMenuTab[ extid].varItem2, x418503_var_MainMenuTab[ extid].varNum)
--			AddQuestItemBonus( varMap, x418503_var_MainMenuTab[ extid].varItem3, x418503_var_MainMenuTab[ extid].varNum)
--		else
--		AddQuestItemBonus( varMap, x418503_var_MainMenuTab[ extid].varItem, x418503_var_MainMenuTab[ extid].varNum)	
--		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418503_var_FileId,x418503_var_QuestId)

end

function x418503_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	local year,month,day = GetYearMonthDay()		
	if year ~= 2012 then
		Msg2Player( varMap, varPlayer, "此道具已过使用期", 8, 3)
		DepletingUsedItem( varMap, varPlayer)

		return 0
	end
--	
--	x418503_CheckDate( varMap, varPlayer)
	local year,month,day = GetYearMonthDay()



	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t选择一套情人节首饰套装！" )

	for varI, s in x418503_var_MainMenuTab do		
		TalkAppendButton(varMap, x418503_var_QuestId, "我要"..x418503_var_MainMenuTab[varI].itemname.."！",3,varI)	
	end

	StopTalkTask( varMap)

  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418503_GetGift( varMap, varPlayer, varIndex)
--	local year,month,day = GetYearMonthDay()		
--	if year > 2011 then
--		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
--		DepletingUsedItem( varMap, varPlayer)
--		GamePlayScriptLog( varMap, varPlayer, 1413)
--		return 0
--	end
	local year,month,day = GetYearMonthDay()
	if varIndex <= 3 then
		if year == 2011 and day <= 23 then
			return
		end
	end
	


	local varRand = random (1 , 10000)
	if varRand < 1 then varRand =9999 end
	if varRand >= 10000 then varRand =9999 end
	
	if varRand <= x418503_var_MainMenuTab[varIndex].probability then
		local itemid =random(getn(x418503_var_MainMenuTab[varIndex].varItem))
		return x418503_var_MainMenuTab[varIndex].varItem[itemid],1
	else
			return 12030059,0
	end			
		
end



function x418503_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

  local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	

	local varMsg =""


		local varNum =x418503_var_MainMenuTab[varIndex].varNum
		
	if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
		
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418503_var_ItemId then
				return
			end
		
		
			if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
				return
			end



			local value1 = x418503_var_MainMenuTab[varIndex].varItem[1]
			local value2 = x418503_var_MainMenuTab[varIndex].varItem[2]
			
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
--	x418503_SetLeaveTimes(varMap, varPlayer, varIndex, Times)

	local logindex = 3520+varIndex
	GamePlayScriptLog( varMap, varPlayer, logindex)

    
end


