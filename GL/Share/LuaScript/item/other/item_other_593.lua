





x418593_var_FileId = 418593
x418593_var_QuestId = 10295
x418593_var_ItemId = 12500319

x418593_var_NormalItemNum		=   1	
x418593_var_NormalItemTab		=	{
									{	varItem = 12030058   , itemname = "金元宝"		}, 
								}



x418593_var_MainMenuTab	=	{
								
								{	itemname = 	"钻石原石"		,	varItem = 11990113},  
								{	itemname = 	"洗石剂"	,	varItem = 11000905},  
								{	itemname = 	"永久清一色"	,	itemId = 10310023},  
								{	itemname = 	"经验时装"	,	varItem = 10306066	},   
								{	itemname = 	"月饼"	,	varItem = 12030258},  
								{	itemname = 	"黄金麻将",varItem = 11970023}, 
								{	itemname = 	"永久护身符",varItem = 10340012},  
								{	itemname = 	"永久时装",varItem = 10306067},  
								{	itemname = 	"帮贡"}, 	
								{	itemname = 	"荣誉"},  
							}

x418593_var_BangGongTabNum	=	4
x418593_var_BangGongTab		=	{200, 300, 400, 500}
x418593_var_RongYuTabNum		=	6
x418593_var_RongYuTab			=	{700, 800, 900, 1050, 1150, 1250}
x418593_var_ShenWangTabNum	=	9
x418593_var_ShenWangTab		=	{7500, 8500, 9500, 10500, 11500, 12000, 13000, 14000, 15000}
x418593_var_ZhanChanTabNum	=	5
x418593_var_ZhanChanTab		=	{150, 175, 200, 225, 250}
x418593_var_XianYinTabNum		=	5
x418593_var_XianYinTab		=	{150000, 175000, 200000, 225000, 250000}




function x418593_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418593_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418593_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
	return 1; 
end







function x418593_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418593_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418593, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418593_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x418593_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
		
		StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y不求人黄金礼盒" )
		TalkAppendString( varMap, format( "\t您选择了#Y%s#W，您在获得5两金卡奖励同时，还有机会获得#Y%s#W奖励。\n\t您确定要使用不求人黄金礼盒吗？", x418593_var_MainMenuTab[ extid].itemname,x418593_var_MainMenuTab[ extid].itemname) )
		
		if(extid == 3) then
			
			AddQuestRadioItemBonus( varMap, x418593_var_MainMenuTab[ extid].itemId, 1)
		elseif(extid <= 8) then
			
			AddQuestRadioItemBonus( varMap, x418593_var_MainMenuTab[ extid].varItem, 1)
		end
		
		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418593_var_FileId,x418593_var_QuestId)


	
	
	
end

function x418593_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418593_var_ItemId then
				return
			end

	StartTalkTask(varMap)
	TalkAppendString( varMap, "#Y不求人黄金礼盒" )
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的极品稀有道具应有尽有！" )
	

	for varI, s in x418593_var_MainMenuTab do
		
			TalkAppendButton(varMap, x418593_var_QuestId, "我要"..x418593_var_MainMenuTab[varI].itemname.."！",3,varI)

	end

	StopTalkTask( varMap)

                                           
    DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418593_GetGift( varMap, varPlayer, varIndex)

	
	if varIndex == 1 then
		local varRand = random( 1, 100)
		if(varRand <= 3) then                       --钻石原石3%
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			
			return x418593_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 2 then
		local varRand = random( 1, 100)  --宗师级洗石剂1%
		if(varRand == 1) then
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			
			varRand = random( 1, x418593_var_NormalItemNum)
			
			return x418593_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 3 then  --掌门牌0.5%
		local varRand = random( 1, 10000)
		if varRand <= 50 then
			return x418593_var_MainMenuTab[varIndex].itemId,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			
			return x418593_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 4 then
		local varRand = random( 1, 100) --经验时装1%
		if(varRand == 1) then
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			return x418593_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 5 then					--全福月饼5%		
		local varRand = random( 1, 100)
		if(varRand <= 5) then
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			return x418593_var_NormalItemTab[varRand].varItem,0	
		end	
	elseif varIndex == 6 then
		local varRand = random( 1, 10000) --黄金麻将80%
		if varRand <= 8000 then
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			return x418593_var_NormalItemTab[varRand].varItem,0	
		end	
	elseif varIndex == 7 then							
	local varRand = random( 1, 10000) --护身符30/10000
		if varRand <= 30 then
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			return x418593_var_NormalItemTab[varRand].varItem,0	
		end						
	elseif varIndex == 8 then
		local varRand = random( 1, 10000) --永久时装25/10000
		if varRand <= 25 then
			return x418593_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418593_var_NormalItemNum)
			return x418593_var_NormalItemTab[varRand].varItem,0	
		end						
	elseif varIndex == 9 then
		local varRand = random( 1, 10000)
		if varRand <= 2500 then
			return 10,0
		elseif 	varRand <= 5000 then
			return 15,0
		elseif 	varRand <= 8000 then
			return 20,0
		elseif 	varRand <= 9700 then
			return 35,0
		elseif 	varRand <= 9995 then
			return 100,0
		else
			return 1000,1
		end													
	elseif varIndex == 10 then
		local varRand = random( 1, 10000)
		if varRand <= 2500 then
			return 40,0
		elseif 	varRand <= 5000 then
			return 50,0
		elseif 	varRand <= 8000 then
			return 60,0
		elseif 	varRand <= 9700 then
			return 70,0
		elseif 	varRand <= 9995 then
			return 150,0
		else
			return 1000,1
		end				
	end				

end



function x418593_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418593_var_ItemId then
				return
			end
			
			
	
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	local value,broadcast = x418593_GetGift( varMap, varPlayer, varIndex)

	local varMsg
	
	
	if varIndex <= 8 then
		if(value == nil) then
			Msg2Player( varMap, varPlayer, "您级别不够，无法得到物品！", 8, 2)
			Msg2Player( varMap, varPlayer, "您级别不够，无法得到物品！", 8, 3)
			return
		end

		local varNum = 1
		if varIndex == 5 then
			varNum = random(8, 12)
		end
			
		if GetBagSpace(varMap, varPlayer) <= 0 then
			
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
			if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
			end

			AddMoney(varMap, varPlayer, 3, 5000,101)
			Msg2Player( varMap, varPlayer, "恭喜你在不求人黄金礼盒中获得了5两金卡！", 8, 2)
			Msg2Player( varMap, varPlayer, "恭喜你在不求人黄金礼盒中获得了5两金卡！", 8, 3)			

	
			if value ==11970023 then  --黄金麻将数量
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




		if value ~= 12030058 then
				StartItemTask( varMap)		
				ItemAppendBind( varMap, value, varNum)
				if StopItemTask( varMap, varPlayer) <= 0 then
					return
				end
				DeliverItemListSendToPlayer( varMap, varPlayer)
		else
			return		
		end
			
		end

		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s使用不求人黄金礼盒获得了#{_ITEM%d}！", Name, value )
			if varIndex ==5 or varIndex ==6 then
				varMsg = format( "恭喜%s使用不求人黄金礼盒获得了%d个#{_ITEM%d}！", Name, varNum, value )
			end
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			local varMsgself =format( "恭喜你在不求人黄金礼盒中获得了#{_ITEM%d}！", value)
			if varIndex ==5 or varIndex ==6 then
				varMsgself =format( "恭喜你在不求人黄金礼盒中获得了%d个#{_ITEM%d}！", varNum,value)
			end	
			Msg2Player( varMap, varPlayer, varMsgself, 8, 2)
		else
			if varIndex == 5 or varIndex == 6 then
				varMsg = format( "恭喜你在不求人黄金礼盒中获得了%d个#{_ITEM%d}！", varNum, value)
			else
				varMsg = format( "恭喜你在不求人黄金礼盒中获得了#{_ITEM%d}！", value)
			end
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
	end	
	elseif varIndex == 9 then
		local guildId = GetGuildID(varMap,varPlayer)
		if guildId < 0 then
			varMsg = format( "您没有帮会，无法获得帮贡！")
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
			return
		end

		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
		end
		AddMoney(varMap, varPlayer, 3, 5000,101)
		Msg2Player( varMap, varPlayer, "恭喜你在不求人黄金礼盒中获得了5两金卡！", 8, 2)
		Msg2Player( varMap, varPlayer, "恭喜你在不求人黄金礼盒中获得了5两金卡！", 8, 3)					
		AddGuildUserPoint(varMap, varPlayer, value)
		varMsg = format( "恭喜你在不求人黄金礼盒中获得了%d点帮贡！", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		Msg2Player( varMap, varPlayer, varMsg, 8, 3)

		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s使用不求人黄金礼盒获得了%d点帮贡！", Name, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)

		end


	elseif varIndex == 10 then
			
		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
			return
		end
		AddMoney(varMap, varPlayer, 3, 5000,101)
		Msg2Player( varMap, varPlayer, "恭喜你在不求人黄金礼盒中获得了5两金卡！", 8, 2)
		Msg2Player( varMap, varPlayer, "恭喜你在不求人黄金礼盒中获得了5两金卡！", 8, 3)			
		AddHonor(varMap, varPlayer, value)
		varMsg = format( "恭喜你在不求人黄金礼盒中获得了%d点荣誉！", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		
		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s使用不求人黄金礼盒获得了%d点荣誉！", Name, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
		end		
	end

	GamePlayScriptLog( varMap, varPlayer, 3500+varIndex)
    
end

