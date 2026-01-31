





x418432_var_FileId = 418432
x418432_var_QuestId = 10276
x418432_var_ItemId = 12030788
x418432_var_NoTimes = "您的剩余次数不足！"
x418432_var_StartWeek =81

x418432_var_NormalItemNum		=   16	



x418432_var_MainMenuTab	=	{
								{	itemname = 	"永久时装"				,	describe = "1件#R有效期永久#W的时装", 				varItem = {10306067, 10306068},						 varNum = 1	,  	 probability =25	},  
								{	itemname = 	"永久护身符"			,	describe = "1个#R有效期永久#W的护身符",				varItem = {10340012, 10340013, 10340014},	 varNum = 1 	,  probability =30 	},  
								{	itemname = 	"冥传戒指手镯碎片",	describe = "1个#R冥传戒指手镯碎片#W",	  			varItem  = {12030789},  									 varNum = 1 	,  probability =1000},  
								{	itemname = 	"五孔钻碎片"			,	describe = "1个可以兑换五孔钻的#R钻头碎片#W", varItem = {11000155},											 varNum = 1, 		 probability =100	},  
								{	itemname = 	"魔君附体石"			,	describe = "1个#R魔君附体石#W", 							varItem  = {12035252,12035253,12035254}, 	 varNum = 1 	,  probability =1500},  
								{	itemname = 	"雪山之星"		,	describe = "10个#R雪山之星#W", 								varItem  = {11000936},										 varNum = 10	,  probability =500 	}
							}                                     
                                                           

function x418432_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
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
function x418432_GetLeaveTimes( varMap, varPlayer, MdIndex )
	return 1
end
function x418432_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418432_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418432_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418432_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418432_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418432, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418432_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418432_CheckDate( varMap, varPlayer)
--	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
--			local nFrom = MD_CHONGCU_BEGIN[1]
--			local nTo   = MD_CHONGCU_END[1]
--			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
--			nFrom = nFrom + 1
--			for varI = nFrom,nTo do
--				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
--			end
--	end	
--	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418432_var_StartWeek)
end



function x418432_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

--		local Times = x418432_GetLeaveTimes(varMap, varPlayer, extid)
--		Times = 30 - Times
--		if Times <= 0 then
--			Msg2Player( varMap, varPlayer, x418432_var_NoTimes, 8, 2)
--			return
--		end
		StartTalkTask( varMap)
		TalkAppendString( varMap, format( "\t您选择了#G%s#W，您会获得%s或金卡奖励！\n \n\t您确定要开始领取礼盒内的礼品吗？\n \n \n注：\n\t1.金卡以道具形式给予，分为#R5两#W、#R10两#W、#R100两#W！\n\t2.所得道具均为#R绑定道具#W。", x418432_var_MainMenuTab[ extid].itemname,x418432_var_MainMenuTab[ extid].itemname,x418432_var_MainMenuTab[ extid].describe ,12030059 ) )
		for i ,item in x418432_var_MainMenuTab[extid].varItem do
				AddQuestRadioItemBonus( varMap,x418432_var_MainMenuTab[extid].varItem[i] , x418432_var_MainMenuTab[ extid].varNum)
		end		


--		if extid == 1 then		 
--			AddQuestRadioItemBonus( varMap,12030605 , x418432_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap,12030606	, x418432_var_MainMenuTab[ extid].varNum)
--		elseif extid == 2 or extid == 3 or extid == 6 then
--			AddQuestRadioItemBonus( varMap, x418432_var_MainMenuTab[ extid].varItem1, x418432_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418432_var_MainMenuTab[ extid].varItem2, x418432_var_MainMenuTab[ extid].varNum)			
--		elseif extid == 4 or extid == 8 then		 
--			AddQuestRadioItemBonus( varMap, x418432_var_MainMenuTab[ extid].varItem1, x418432_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418432_var_MainMenuTab[ extid].varItem2, x418432_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418432_var_MainMenuTab[ extid].varItem3, x418432_var_MainMenuTab[ extid].varNum)
--		else
--		AddQuestRadioItemBonus( varMap, x418432_var_MainMenuTab[ extid].varItem, x418432_var_MainMenuTab[ extid].varNum)	
--		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418432_var_FileId,x418432_var_QuestId)

end

function x418432_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
--	local year,month,day = GetYearMonthDay()		
--	if year > 2011 then
--		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
--		DepletingUsedItem( varMap, varPlayer)
--		GamePlayScriptLog( varMap, varPlayer, 1413)
--		return 0
--	end
--	
--	x418432_CheckDate( varMap, varPlayer)

	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的极品稀有道具应有尽有！" )

	for varI, s in x418432_var_MainMenuTab do

			TalkAppendButton(varMap, x418432_var_QuestId, "我要"..x418432_var_MainMenuTab[varI].itemname.."！",3,varI)	

	end

	StopTalkTask( varMap)

                                           
  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418432_GetGift( varMap, varPlayer, varIndex)
--	local year,month,day = GetYearMonthDay()		
--	if year > 2011 then
--		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
--		DepletingUsedItem( varMap, varPlayer)
--		GamePlayScriptLog( varMap, varPlayer, 1413)
--		return 0
--	end
	local logid =3000+varIndex
	GamePlayScriptLog( varMap, varPlayer, logid)

	local varRand = random (1 , 10000)
	if varRand <= 1 then varRand =1 end
	if varRand >= 10000 then varRand =10000 end
	
	if varRand <= x418432_var_MainMenuTab[varIndex].probability then
		local itemid =random(getn(x418432_var_MainMenuTab[varIndex].varItem))
		return x418432_var_MainMenuTab[varIndex].varItem[itemid],1
	else
			return 12030059,0
	end			
		
end



function x418432_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

  local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	

	local varMsg =""


		local varNum =x418432_var_MainMenuTab[varIndex].varNum
		
	if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
		
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418432_var_ItemId then
				return
			end
		
		
			if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
				return
			end



			local value,broadcast = x418432_GetGift( varMap, varPlayer, varIndex)

			if value == 12035252 or value ==  12035253 or value ==  12035254 then
				local varRandmj = random (1 , 100)
				if varRandmj <= 1 then varRandmj =1 end
				if varRandmj >= 100 then varRandmj =100 end
				if varRandmj <= 60 then value =12035252 
				elseif varRandmj <= 95 then value =12035253
				else value =12035254
				end
			end	

			if value ==12030059 then
				local ran =random(1,1000)
				if ran <=1 then ran =1 end
				if ran >=1000 then ran =1000 end
				
				if ran <= 975 then
					value = 12030058
					varNum = 1
					broadcast = 0
				elseif 	ran <=995 then
					value = 12030059
				  varNum = 1
					broadcast = 1
				else
					value = 12030048
					varNum = 1
					broadcast = 1
				end
			end		
			

			StartItemTask( varMap)		
			ItemAppendBind( varMap, value, varNum)
			if StopItemTask( varMap, varPlayer) <= 0 then
				return
			end
			DeliverItemListSendToPlayer( varMap, varPlayer)

		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s的%s打开iHold住4S大礼包获得了%d个#{_ITEM%d}!", CountryName, Name, varNum, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用iHold住4S大礼包获得了%d个#{_ITEM%d}!", varNum, value), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用iHold住4S大礼包获得了%d个#{_ITEM%d}!", varNum, value), 8, 3)
		else
		if varNum ~= 0 then

				varMsg = format( "恭喜你使用iHold住4S大礼包获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你使用iHold住4S大礼包获得了#{_ITEM%d}!", value)
			end
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		end
	
	
	if broadcast ~= 1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

--	Times = Times -	1
--	Times = 30 - Times
--	x418432_SetLeaveTimes(varMap, varPlayer, varIndex, Times)

	GamePlayScriptLog( varMap, varPlayer, 1412)

		end	
    
end

