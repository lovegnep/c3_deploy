

x300672_var_FileId = 300672
x300672_var_QuestId = 7026


x300672_var_GUID_Normal_Npcs = {
								123833,		
								123834,		
								123835,		
							}
x300672_var_GUID_Special_Npc = 123836			


x300672_var_RefreshTime = 60*5*1000


x300672_var_SpecialNpc_Interval = 300
x300672_var_SpecialNpc_Times = {0,0,0,0,0,0}


x300672_var_Price_BenchMark = {
								{3384,2270,1154},	
								{3384,2270,1154},	
								{3384,2270,1154}	
							}

x300672_var_Price_Refix = 100


x300672_var_Price = 	{
						
						{ 
							varTalkNpcGUID = x300672_var_GUID_Normal_Npcs[1],	
							AllPrices = { {}, {}, {} },					
							priceflag = {1,1,2,2,3,3},					
						},
						
						{ 
							varTalkNpcGUID = x300672_var_GUID_Normal_Npcs[2], 
							AllPrices = { {}, {}, {} },
							priceflag = {3,3,1,1,2,2},
						},
						
						{ 
							varTalkNpcGUID = x300672_var_GUID_Normal_Npcs[3], 
							AllPrices = { {}, {}, {} },
							priceflag = {2,2,3,3,1,1},
						},
						
						{ 
							varTalkNpcGUID = x300672_var_GUID_Special_Npc, 
							AllPrices = { {}, {}, {} },
							priceflag = {1,1,1,1,1,1},
						},
					}


x300672_Item_Goods = { 13030122, 13030123, 13030124, 13030125, 13030126, 13030127 }
x300672_Item_GoodsName = { "南洋珍珠", "琉球珊瑚", "波斯金鞍", "大宛马铠", "高丽山参", "大理灵芝", }
x300672_Item_Money = 13030128

x300672_var_FirstActive = 1


function x300672_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, x300672_var_QuestId ) ~= 1 then
		return
	end
	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	if varTalkNpcGUID ~= x300672_var_GUID_Special_Npc then		
		for varI,item in x300672_Item_Goods do
			if HaveItem(varMap,varPlayer,item)>0 then
				TalkAppendButton(varMap,300672,"【帮会跑商】"..x300672_Item_GoodsName[varI],3,varI)
			end
		end
	else		
		local curTime = GetCurrentTime()
		for varI,item in x300672_Item_Goods do
			if curTime - x300672_var_SpecialNpc_Times[varI] >= x300672_var_SpecialNpc_Interval then
				if HaveItem(varMap,varPlayer,item)>0 then
					TalkAppendButton(varMap,300672,"【帮会跑商】"..x300672_Item_GoodsName[varI],3,varI)
				end
			end
		end		
	end
	
	if x300672_var_FirstActive == 1 then
		x300672_var_FirstActive = 0
		SetTimer(varMap, varPlayer, 300672, "ProcSceneTimer", x300672_var_RefreshTime )
		x300672_Refresh_Price(varMap)
	end
end


function x300672_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

	
	if IsHaveQuestNM( varMap, varPlayer, x300672_var_QuestId ) ~= 1 then
		return
	end
	
	if varIndex < 10 then
		local varReadme = "卖物品:"..x300672_Item_GoodsName[varIndex]..",价格:"..x300672_GetPrice(varMap, varPlayer, varTalknpc,varIndex)
		StartTalkTask(varMap);
		TalkAppendButton(varMap,300672,"确定",3,varIndex + 10 )
		TalkAppendString(varMap,varReadme);
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
	elseif varIndex > 10 then
	
		local op = varIndex - 10
		
		if GetMonsterGUID(varMap,varTalknpc) == x300672_var_GUID_Special_Npc then
			if GetCurrentTime() - x300672_var_SpecialNpc_Times[op] < x300672_var_SpecialNpc_Interval then
				StartTalkTask(varMap);
				TalkAppendString(varMap,"交易失败#r刚才有人在你之前出售过这样货物了。");
				StopTalkTask(varMap);
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)	
				return
			end
		end
		
		if x300672_SaleItem(varMap, varPlayer, varTalknpc,op) == 1 then
		
			local bAllSaled = 1
			local bFailed = 0
			for varI,item in x300672_Item_Goods do
				if HaveItem(varMap, varPlayer,item)>0 then
					bAllSaled = 0
					break
				end
			end
			if bAllSaled == 1 then
				local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300672_var_QuestId)
				local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
				if nMoney < 10000 then
					bFailed = 1
				end			
			end

			StartTalkTask(varMap);
			if bFailed==0 then
				TalkAppendString(varMap,"\t好吧，这货物不错，我愿意收购。");
			else
				TalkAppendString(varMap,"\t你出售了所有的帮会货物，但得到的金钱#G不足以完成任务#W，去帮会任务发布人处#G重新领取任务#W吧。");
			end
			StopTalkTask(varMap);
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)	

			if bFailed == 1 then			
				local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300672_var_QuestId)
				
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, 1)
				LuaCallNoclosure( 300671, "ProcQuestLogRefresh", varMap, varPlayer, x300672_var_QuestId )	
			else 
				local price = x300672_GetPrice(varMap, varPlayer, varTalknpc, op)
			    local goodsname = x300672_Item_GoodsName[op]
				local salemsg = format("你出售了#G%s#cffcf00，帮会银票中的金额增加了#G%s#cffcf00。",goodsname,price)
				Msg2Player(varMap, varPlayer, salemsg, 8, 3);
				Msg2Player(varMap, varPlayer, salemsg, 8, 2);
			end
			
			if GetMonsterGUID(varMap,varTalknpc) == x300672_var_GUID_Special_Npc then
				x300672_var_SpecialNpc_Times[op] = GetCurrentTime()
			end
			
		end
		
	end

end


function x300672_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
end




function x300672_ProcAccept( varMap, varPlayer )
end




function x300672_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300672_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300672_CheckSubmit( varMap, varPlayer )

end




function x300672_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300672_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300672_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300672_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


function x300672_ProcSceneTimer( varMap )
	x300672_Refresh_Price(varMap)
end

function x300672_Refresh_Price(varMap)

	for i1,item1 in x300672_var_Price do					
		for i2,item2 in item1.AllPrices do				
			for i3,item3 in item1.priceflag do			
				item2[i3] = x300672_var_Price_BenchMark[i2][item3] + random(1,x300672_var_Price_Refix) - x300672_var_Price_Refix/2
			end
		end		
	end
	
end

function x300672_GetPrice( varMap, varPlayer, varTalknpc, itemIndex )

	local price = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	for varI,item in x300672_var_Price do
		if item.varTalkNpcGUID == varTalkNpcGUID then
			local varLevel = GetLevel(varMap, varPlayer)
			if varLevel>=70 then
				price = item.AllPrices[3][itemIndex]
			elseif varLevel>=50 then
				price = item.AllPrices[2][itemIndex]
			elseif varLevel>=20 then
				price = item.AllPrices[1][itemIndex]
			end
			break
		end
	end
	
	return floor( price)

end

function x300672_SaleItem(varMap, varPlayer, varTalknpc, itemIndex )

	if HaveItem(varMap,varPlayer,x300672_Item_Goods[itemIndex])<=0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap,"\t你似乎并没有这样货物。");
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		return 0
	end
	
	if HaveItem(varMap,varPlayer,x300672_Item_Money)<=0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap,"\t你没有帮会银票，无法交易。");
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)		
		return 0
	end	
	
	local price = x300672_GetPrice(varMap, varPlayer, varTalknpc,itemIndex)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300672_var_QuestId)
	local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)		

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, nMoney+price)
	if DelItem(varMap, varPlayer, x300672_Item_Goods[itemIndex], 1) ~= 1 then return 0 end
	
	LuaCallNoclosure( 300671, "ProcQuestLogRefresh", varMap, varPlayer, x300672_var_QuestId )	
	
	return 1

end
