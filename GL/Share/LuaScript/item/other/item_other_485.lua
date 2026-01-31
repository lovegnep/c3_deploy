





x418485_var_FileId = 418485
x418485_var_QuestId = 10294
x418485_var_ItemId = 12030880
x418485_var_NoTimes = "您的剩余次数不足！"
x418485_var_StartWeek =81
x418485_var_NormalItemNum		=   16	



x418485_var_MainMenuTab	=	{
								{	itemname = 	"绝世神兵"				,	describe = "#R残破的神兵之魂#W，残破的神兵之魂可以在大都职业大师处获得绝世神兵。", 	varItem = {11000304},	varNum = 1	, probability =500 	},
								{	itemname = 	"黄金麻将"				,	describe = "#R黄金乱士符#W，黄金乱士符可以在装备铭刻大师处升级装备麻将铭刻的属性。",varItem = {11970023},	varNum = 1	, probability =8000	},  
								{	itemname = 	"精品地中海菱凿"	,	describe = "#R精品地中海菱凿#W",																							varItem = {11000950},	 varNum = 1 	,  probability =8500 	}, 
								{	itemname = 	"永久护身符"			,	describe = "1个#R有效期永久#W的护身符",																							varItem = {10340012, 10340013, 10340014},	 varNum = 1 	,  probability =30 	}, 
								{	itemname = 	"永久时装"				,	describe = "#R有效期永久#W的冷羽无悯时装", 																					varItem = {10306074},	varNum = 1	, probability =25	},  
								{	itemname = 	"高级时装纹样"		,	describe = "#R高级时装纹样#W", 						varItem = {11011482, 11011483, 11011484 },						 varNum = 1	,  	 probability =100	},  													

							}



function x418485_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418485_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418485_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418485_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418485_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418485, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418485_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418485_CheckDate( varMap, varPlayer)
end



function x418485_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

		StartTalkTask( varMap)
		if extid == 1 then
			TalkAppendString( varMap, format( "\t您选择了#R%s#W，您如果幸运的话，就会获得%s\n \n\t您确定要使用喜气符吗？\n \n 注：所得道具为#R不绑定道具#W。", x418485_var_MainMenuTab[ extid].itemname,x418485_var_MainMenuTab[ extid].describe ,12030059 ) )	
		else
			TalkAppendString( varMap, format( "\t您选择了#R%s#W，您如果幸运的话，就会获得%s\n \n\t您确定要使用喜气符吗？\n \n 注：所得道具均为#R绑定道具#W。", x418485_var_MainMenuTab[ extid].itemname,x418485_var_MainMenuTab[ extid].describe ,12030059 ) )
		end
		for i ,item in x418485_var_MainMenuTab[extid].varItem do
				AddQuestRadioItemBonus( varMap,x418485_var_MainMenuTab[extid].varItem[i] , x418485_var_MainMenuTab[ extid].varNum)
		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418485_var_FileId,x418485_var_QuestId)

end

function x418485_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)


	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的极品稀有道具应有尽有！" )

	for varI, s in x418485_var_MainMenuTab do		
		TalkAppendButton(varMap, x418485_var_QuestId, "我要"..x418485_var_MainMenuTab[varI].itemname.."！",3,varI)	
	end

	StopTalkTask( varMap)

  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418485_GetGift( varMap, varPlayer, varIndex)


	
	local logid =3070+varIndex
	GamePlayScriptLog( varMap, varPlayer, logid)

	local varRand = random (1 , 10000)
	if varRand < 1 then varRand =9999 end
	if varRand >= 10000 then varRand =9999 end
	
	if varRand <= x418485_var_MainMenuTab[varIndex].probability then
		local itemid =random(getn(x418485_var_MainMenuTab[varIndex].varItem))
		return x418485_var_MainMenuTab[varIndex].varItem[itemid],1
	else
			return 12030059,0
	end			
		
end



function x418485_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

  local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	

	local varMsg =""


		local varNum =x418485_var_MainMenuTab[varIndex].varNum
		
	if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
		
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418485_var_ItemId then
				return
			end
		
		
			if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
				return
			end



			local value,broadcast = x418485_GetGift( varMap, varPlayer, varIndex)
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
--地中海尖凿
			if value ==11000950 then
				local rand =random(8500)
				if rand < 1 then rand = 8500 end
				if rand > 8500 then rand =8500 end
				if rand <= 7000 then
					varNum = 1
					broadcast = 0
				elseif rand <= 8000 then
					varNum = 3			
					broadcast = 0
				else
					varNum = 5
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
			
			varMsg = format( "恭喜%s的%s打开喜气符获得了%d个#{_ITEM%d}!", CountryName, Name, varNum, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用喜气符获得了%d个#{_ITEM%d}!", varNum, value), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用喜气符获得了%d个#{_ITEM%d}!", varNum, value), 8, 3)
		else
		if varNum ~= 0 then

				varMsg = format( "恭喜你使用喜气符获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你使用喜气符获得了#{_ITEM%d}!", value)
			end
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		end
	
	
	if broadcast ~= 1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

	GamePlayScriptLog( varMap, varPlayer, 1412)

		end	
    
end


