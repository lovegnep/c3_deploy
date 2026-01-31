





x418426_var_FileId = 418426
x418426_var_QuestId = 10275
x418426_var_ItemId = 12030782
x418426_var_NoTimes = "您的剩余次数不足！"
x418426_var_StartWeek =81

x418426_var_NormalItemNum		=   16	



x418426_var_MainMenuTab	=	{
								{	itemname = 	"永久时装"				,	describe = "1件#R有效期永久#W的时装", 	varItem = {10306067, 10306068},												varNum = 1	,  probability =25	},  
								{	itemname = 	"永久护身符"			,	describe = "1个#R有效期永久#W的护身符", varItem = {10340012, 10340013, 10340014},	varNum = 1 	,  probability =30 		},  
								{	itemname = 	"永久大三元"			,	describe = "1个#R有效期永久#W的大三元", varItem  = {10310003},  									 												varNum = 1 	,  probability =20 		},  
								{	itemname = 	"永久清一色"			,	describe = "1个#R有效期永久#W的清一色掌门牌（门前清、双暗刻、断么九、喜相逢、不求人随机）", varItem = {10310035, 10310036, 10310037, 10310038, 10310039}, varNum = 1, probability =30		},  
								{	itemname = 	"三头凶蛟降世符"	,	describe = "1个#R三头凶蛟降世符#W", 		varItem  = {12030769}, 																				  	varNum = 1 	,  probability =50 	},  
								{	itemname = 	"冥装生命图谱"		,	describe = "5个#R生命图谱#W或5个#R祝福图谱#W", varItem = {11000838, 11000839,  11000840, 11000841, 11000842, 11000843, 11000844, 11000845, 11000984, 11000985, 11000986, 11000987, 11000988, 11000989, 11000990, 11000991},	varNum = 5 	,  probability =400	},  
								{	itemname = 	"传说级洗石剂"		,	describe = "10个#R雪山之星#W", varItem  = {11000936},																						 					varNum = 10	,  probability =500 		}
							}                                     
                                                           




function x418426_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
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
function x418426_GetLeaveTimes( varMap, varPlayer, MdIndex )
	return 1
end
function x418426_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418426_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418426_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418426_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418426_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418426, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418426_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418426_CheckDate( varMap, varPlayer)
--	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
--			local nFrom = MD_CHONGCU_BEGIN[1]
--			local nTo   = MD_CHONGCU_END[1]
--			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
--			nFrom = nFrom + 1
--			for varI = nFrom,nTo do
--				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
--			end
--	end	
--	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418426_var_StartWeek)
end



function x418426_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

--		local Times = x418426_GetLeaveTimes(varMap, varPlayer, extid)
--		Times = 30 - Times
--		if Times <= 0 then
--			Msg2Player( varMap, varPlayer, x418426_var_NoTimes, 8, 2)
--			return
--		end
		StartTalkTask( varMap)
		TalkAppendString( varMap, format( "\t您将进行#G%s#W的幸运抽奖，您有可能获得%s。如果您没有得到想要的道具，则会获得#R金卡奖励#W，祝您中奖！\n\t您确定要开始幸运抽奖了吗？\n注：\n\t1.金卡以道具形式给予，分为#R2两#W、#R5两#W、#R10两#W、#R100两#W！\n\t2.所得道具均为#R绑定道具#W。", x418426_var_MainMenuTab[ extid].itemname,x418426_var_MainMenuTab[ extid].describe ,12030059 ) )
		for i ,item in x418426_var_MainMenuTab[extid].varItem do
				AddQuestRadioItemBonus( varMap,x418426_var_MainMenuTab[extid].varItem[i] , x418426_var_MainMenuTab[ extid].varNum)
		end		


--		if extid == 1 then		 
--			AddQuestRadioItemBonus( varMap,12030605 , x418426_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap,12030606	, x418426_var_MainMenuTab[ extid].varNum)
--		elseif extid == 2 or extid == 3 or extid == 6 then
--			AddQuestRadioItemBonus( varMap, x418426_var_MainMenuTab[ extid].varItem1, x418426_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418426_var_MainMenuTab[ extid].varItem2, x418426_var_MainMenuTab[ extid].varNum)			
--		elseif extid == 4 or extid == 8 then		 
--			AddQuestRadioItemBonus( varMap, x418426_var_MainMenuTab[ extid].varItem1, x418426_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418426_var_MainMenuTab[ extid].varItem2, x418426_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418426_var_MainMenuTab[ extid].varItem3, x418426_var_MainMenuTab[ extid].varNum)
--		else
--		AddQuestRadioItemBonus( varMap, x418426_var_MainMenuTab[ extid].varItem, x418426_var_MainMenuTab[ extid].varNum)	
--		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418426_var_FileId,x418426_var_QuestId)

end

function x418426_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
--	local year,month,day = GetYearMonthDay()		
--	if year > 2011 then
--		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
--		DepletingUsedItem( varMap, varPlayer)
--		GamePlayScriptLog( varMap, varPlayer, 1413)
--		return 0
--	end
--	
--	x418426_CheckDate( varMap, varPlayer)

	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的极品稀有道具应有尽有！" )

	for varI, s in x418426_var_MainMenuTab do

			TalkAppendButton(varMap, x418426_var_QuestId, "我要"..x418426_var_MainMenuTab[varI].itemname.."！",3,varI)	

	end

	StopTalkTask( varMap)

                                           
  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418426_GetGift( varMap, varPlayer, varIndex)
--	local year,month,day = GetYearMonthDay()		
--	if year > 2011 then
--		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
--		DepletingUsedItem( varMap, varPlayer)
--		GamePlayScriptLog( varMap, varPlayer, 1413)
--		return 0
--	end

	local varRand = random (1 , 10000)
	if varRand <= 1 then varRand =1 end
	if varRand >= 10000 then varRand =10000 end
	
	if varRand <= x418426_var_MainMenuTab[varIndex].probability then
		local itemid =random(getn(x418426_var_MainMenuTab[varIndex].varItem))
		return x418426_var_MainMenuTab[varIndex].varItem[itemid],1
	else
			return 12030059,0
	end			
		
end



function x418426_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

	
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	local value,broadcast = x418426_GetGift( varMap, varPlayer, varIndex)

	local varMsg


		local varNum =x418426_var_MainMenuTab[varIndex].varNum
		
		if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else

	local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	

	if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418426_var_ItemId then
		return
	end


	if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
		return
	end


			if value ==12030059 then
				local ran =random(1,1000)
				if ran <=1 then ran =1 end
				if ran >=1000 then ran =1000 end
				
				if ran <= 705 then
					value = 12030058
					varNum = 1
					broadcast = 0
				elseif 	ran <=710 then
					value = 12030048
				  varNum = 1
					broadcast = 1
				elseif 	ran <=760 then
					broadcast = 0
					varNum = 1
				else
					value = 12030056
					varNum = 2
				end
			end		
			

			StartItemTask( varMap)		
			ItemAppendBind( varMap, value, varNum)
			if StopItemTask( varMap, varPlayer) <= 0 then
				return
			end
			DeliverItemListSendToPlayer( varMap, varPlayer)
		end
		

		
		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s的%s打开全场Hold住大礼包获得了%d个#{_ITEM%d}!", CountryName, Name, varNum, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你在全场Hold住大礼包抽奖中获得了%d个#{_ITEM%d}!", varNum, value), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你在全场Hold住大礼包抽奖中获得了%d个#{_ITEM%d}!", varNum, value), 8, 3)
		else
		if varNum ~= 0 then
				varMsg = format( "恭喜你在全场Hold住大礼包抽奖中获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你在全场Hold住大礼包抽奖中获得了#{_ITEM%d}!", value)
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
--	x418426_SetLeaveTimes(varMap, varPlayer, varIndex, Times)

	GamePlayScriptLog( varMap, varPlayer, 1412)

	
    
end

