--神兵礼包
x418531_var_FileId 		= 418531
x418531_var_LevelMin	= 1
x418531_var_ItemTab	={
					{Item=11000304,Count=1},
					{Item=11000309,Count=1},
					{Item=11970018,Count=6},
					{Item=11000306,Count=1},
					{Item=11000551,Count=6},
					{Item=11000317,Count=1},
					{Item=11000379,Count=1},
					{Item=11000360,Count=6},
					{Item=12030200,Count=1},
					{Item=12030015,Count=1}
					}

--残破的神兵之魂	11000304	1	2		20	
--沧月泪珠			11000309	1	0.2		22	
--浮世印			11970018	6	30		322	
--烈焱碎片			11000306	1	0.2		324	
--无瑕星辰			11000551	6	30		624	
--星魄碎片			11000317	1	2		644	
--君王守护碎片		11000379	1	0.1		645		1000个出一个，前70%不出
--云杉木炭			11000360	6	28.5	930	
--小喇叭			12030200	1	2		950	
--帮会召集令		12030015	1	5		1000	


-- *************************
-- 抽奖的控制
-- 第7格1000次内最多允许出1个
x418531_g_item_1_pos = 7;
x418531_g_item_1_cnt = 1001;
x418531_g_item_1_limit = 1;
x418531_g_item_1_itemcnt = 0;
x418531_g_item_1_cur = 0;


function x418531_CheckMoneyItem(item,a)
	local jilu = 0.7; --小于此百分比数量不出
	if a == 0 then	
		x418531_g_item_1_cur = x418531_g_item_1_cur + 1;
	end

	if item == x418531_g_item_1_pos then
		if x418531_g_item_1_cur < x418531_g_item_1_cnt then
			if x418531_g_item_1_cur > x418531_g_item_1_cnt * jilu and x418531_g_item_1_itemcnt < x418531_g_item_1_limit then
				x418531_g_item_1_itemcnt = x418531_g_item_1_itemcnt + 1;
				return item;
			else
				x418531_CheckMoneyItem(random(1,10),1);
			end
		else
			x418531_g_item_1_cur = 0;
			x418531_g_item_1_itemcnt = 0;
			x418531_CheckMoneyItem(random(1,10),1);
		end
	end
	
	return item;
end

function x418531_SelectNumber(list)
	local qujian={0,20,22,322,324,624,644,645,930,950,1000}
	local m,i
	m=random(1,1000);
	for i=1,10 do
		if m > qujian[i] and m <= qujian[i+1] then
			return x418531_CheckMoneyItem(i,0);
		end
	end
end


function x418531_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418531_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end

function x418531_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418531_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return 0
	end
	
	return 1; 
end

function x418531_ProcDeplete( varMap, varPlayer )
		
	return 1;
end



function x418531_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local m_item = x418531_SelectNumber(1)
	local ItemId = x418531_var_ItemTab[m_item].Item
	local ItemNum = x418531_var_ItemTab[m_item].Count
	
	StartItemTask(varMap)
	--ItemAppendBind( varMap, x418531_var_ItemTab[m_item].Item,x418531_var_ItemTab[m_item].Count)
 	ItemAppend( varMap,ItemId ,ItemNum )
	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)				
			
			--Msg2Player( varMap,varPlayer,"打开礼包，获得帝国勇士时装礼包1个，千里驹降世符1个，布袋包1个等",8,2) ;			
			Msg2Player( varMap,varPlayer,format("打开礼包，获得#cffcf00@item_%d %d个",ItemId,ItemNum),8,3) ;		
			
			GamePlayScriptLog( varMap, varPlayer, 3049)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end


function x418531_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end