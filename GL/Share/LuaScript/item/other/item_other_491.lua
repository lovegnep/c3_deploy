





x418491_var_FileId = 418491
x418491_var_QuestId = 10278
x418491_var_ItemId = 12030851
x418491_var_NoTimes = "您的剩余次数不足！"
x418491_var_StartWeek =81

x418491_var_NormalItemNum		=   16	



x418491_var_MainMenuTab	=	{
								{	itemname = 	"高级时装纹样"		,	describe = "#R高级时装纹样#W", 						varItem = {11011482, 11011483, 11011484 },						 varNum = 1	,  	 probability =100	},  					
								{	itemname = 	"绝世骑乘"				,	describe = "1个#R金鬃狂狮降世符#W，金鬃狂狮带有3级疾奔和无双无畏技能。", 					varItem  = {12050286},						 varNum = 1	,  probability =25 	},
								{	itemname = 	"冥传节庆戒指"		,	describe = "#R冥传节庆戒指#W",							varItem = {10287360},											 varNum = 1, 		 probability =50	},  
								{	itemname = 	"绝世神兵"		,	describe = "#R残破的神兵之魂#W，残破的神兵之魂可以在大都职业大师处获得绝世神兵。", 						varItem  = {11000304},						 varNum = 1	,  probability =500 	},
								{	itemname = 	"黄金麻将"				,	describe = "#R黄金乱士符#W，黄金乱士符可以在装备铭刻大师处升级装备麻将铭刻的属性。", 							varItem = {11970023 },						 varNum = 1	,  	 probability =8000	},  
								{	itemname = 	"永久清一色掌门牌",	describe = "的#R掌门牌碎片#W，掌门牌碎片可以在大都#S活动使者#W处，兑换掌门牌：清一色门前清、掌门牌：清一色双暗刻、掌门牌：清一色断么九、掌门牌：清一色喜相逢、掌门牌：清一色不求人。", 						varItem  = {12030775},  varNum = 1 	,  probability =1000 		},  
								{	itemname = 	"永久护身符"			,	describe = "#R有效期永久#W的护身符",				varItem = {10340012, 10340013, 10340014},	 varNum = 1 	,  probability =30 	},  
								{	itemname = 	"永久时装"				,	describe = "#R有效期永久#W的冷羽无悯时装", varItem = {10306074 },						 varNum = 1	,  	 probability =25	},  
								{	itemname = 	"五孔钻"			,	describe = "可以兑换五孔钻的#R钻头碎片#W", varItem = {11000155},											 varNum = 1, 		 probability =100	},  
								
							}                                     


function x418491_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
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
function x418491_GetLeaveTimes( varMap, varPlayer, MdIndex )
	return 1
end
function x418491_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418491_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418491_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418491_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418491_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418491, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418491_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418491_CheckDate( varMap, varPlayer)
--	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
--			local nFrom = MD_CHONGCU_BEGIN[1]
--			local nTo   = MD_CHONGCU_END[1]
--			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
--			nFrom = nFrom + 1
--			for varI = nFrom,nTo do
--				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
--			end
--	end	
--	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418491_var_StartWeek)
end



function x418491_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

--		local Times = x418491_GetLeaveTimes(varMap, varPlayer, extid)
--		Times = 30 - Times
--		if Times <= 0 then
--			Msg2Player( varMap, varPlayer, x418491_var_NoTimes, 8, 2)
--			return
--		end
		local year,month,day = GetYearMonthDay()
		if extid <= 3 then
			if year == 2011 and day <= 23 then
				return
			end
		end


		StartTalkTask( varMap)
		if extid == 4 then
			TalkAppendString( varMap, format( "\t您选择了#R%s#W，您如果幸运的话，就会获得%s\n \n\t您确定要使用如意符吗？\n \n 注：所得道具为#R不绑定道具#W。", x418491_var_MainMenuTab[ extid].itemname,x418491_var_MainMenuTab[ extid].describe ,12030059 ) )	
		else
			TalkAppendString( varMap, format( "\t您选择了#R%s#W，您如果幸运的话，就会获得%s\n \n\t您确定要使用如意符吗？\n \n 注：所得道具均为#R绑定道具#W。", x418491_var_MainMenuTab[ extid].itemname,x418491_var_MainMenuTab[ extid].describe ,12030059 ) )
		end
		for i ,item in x418491_var_MainMenuTab[extid].varItem do
				AddQuestRadioItemBonus( varMap,x418491_var_MainMenuTab[extid].varItem[i] , x418491_var_MainMenuTab[ extid].varNum)
		end		


--		if extid == 1 then		 
--			AddQuestRadioItemBonus( varMap,12030605 , x418491_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap,12030606	, x418491_var_MainMenuTab[ extid].varNum)
--		elseif extid == 2 or extid == 3 or extid == 6 then
--			AddQuestRadioItemBonus( varMap, x418491_var_MainMenuTab[ extid].varItem1, x418491_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418491_var_MainMenuTab[ extid].varItem2, x418491_var_MainMenuTab[ extid].varNum)			
--		elseif extid == 4 or extid == 8 then		 
--			AddQuestRadioItemBonus( varMap, x418491_var_MainMenuTab[ extid].varItem1, x418491_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418491_var_MainMenuTab[ extid].varItem2, x418491_var_MainMenuTab[ extid].varNum)
--			AddQuestRadioItemBonus( varMap, x418491_var_MainMenuTab[ extid].varItem3, x418491_var_MainMenuTab[ extid].varNum)
--		else
--		AddQuestRadioItemBonus( varMap, x418491_var_MainMenuTab[ extid].varItem, x418491_var_MainMenuTab[ extid].varNum)	
--		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418491_var_FileId,x418491_var_QuestId)

end

function x418491_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
--	local year,month,day = GetYearMonthDay()		
--	if year > 2011 then
--		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
--		DepletingUsedItem( varMap, varPlayer)
--		GamePlayScriptLog( varMap, varPlayer, 1413)
--		return 0
--	end
--	
--	x418491_CheckDate( varMap, varPlayer)
	local year,month,day = GetYearMonthDay()



	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的极品稀有道具应有尽有！" )

	for varI, s in x418491_var_MainMenuTab do
			if varI <= 3 then
				if year > 2011 then
					TalkAppendButton(varMap, x418491_var_QuestId, "#B圣诞限时购：我要"..x418491_var_MainMenuTab[varI].itemname.."！",3,varI)					
				elseif day > 23 then
					TalkAppendButton(varMap, x418491_var_QuestId, "#B圣诞限时购：我要"..x418491_var_MainMenuTab[varI].itemname.."！",3,varI)				
				end
			else			
				TalkAppendButton(varMap, x418491_var_QuestId, "我要"..x418491_var_MainMenuTab[varI].itemname.."！",3,varI)	
			end
	end

	StopTalkTask( varMap)

                                           
  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418491_GetGift( varMap, varPlayer, varIndex)
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
	
	local logid =3030+varIndex
	GamePlayScriptLog( varMap, varPlayer, logid)

	local varRand = random (1 , 10000)
	if varRand < 1 then varRand =9999 end
	if varRand >= 10000 then varRand =9999 end
	
	if varRand <= x418491_var_MainMenuTab[varIndex].probability then
		local itemid =random(getn(x418491_var_MainMenuTab[varIndex].varItem))
		return x418491_var_MainMenuTab[varIndex].varItem[itemid],1
	else
			return 12030059,0
	end			
		
end



function x418491_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

  local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	

	local varMsg =""


		local varNum =x418491_var_MainMenuTab[varIndex].varNum
		
	if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
		
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418491_var_ItemId then
				return
			end
		
		
			if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
				return
			end



			local value,broadcast = x418491_GetGift( varMap, varPlayer, varIndex)
			if value ==12030059 then
				Msg2Player( varMap, varPlayer,  "很遗憾，你什么都没有得到。", 8, 2)
				Msg2Player( varMap, varPlayer,  "很遗憾，你什么都没有得到。", 8, 3)
				return
			end	

--黄金乱士符				
			if value ==11970023 then
				local rand =random(20)
				if rand < 1 then rand = 1 end
				if rand > 20 then rand =1 end
				if rand == 20 then
					varNum = 10
				elseif rand > 16 then
					varNum = 5			
					broadcast = 0
				else
					broadcast = 0
				end		
			end		
			
			
			

			StartItemTask( varMap)
			if value == 11000304 then
				ItemAppend( varMap, value, varNum)
			else	
				ItemAppendBind( varMap, value, varNum)
			end	
			if StopItemTask( varMap, varPlayer) <= 0 then
				return
			end
			DeliverItemListSendToPlayer( varMap, varPlayer)

		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s的%s打开如意符获得了%d个#{_ITEM%d}!", CountryName, Name, varNum, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用如意符获得了%d个#{_ITEM%d}!", varNum, value), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用如意符获得了%d个#{_ITEM%d}!", varNum, value), 8, 3)
		else
		if varNum ~= 0 then

				varMsg = format( "恭喜你使用如意符获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你使用如意符获得了#{_ITEM%d}!", value)
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
--	x418491_SetLeaveTimes(varMap, varPlayer, varIndex, Times)

	GamePlayScriptLog( varMap, varPlayer, 1412)

		end	
    
end


