--传说缤纷大礼包

x418530_var_FileId 		= 418530

x418530_var_LevelMin	= 1

x418530_var_ItemTab	={
					{Item={11970018},Count=1},
					{Item={11000948},Count=1},
					{Item={11970023},Count=1},
					{Item={11000551},Count=1},
					{Item={14010026,14020026,14030026,14040026},Count=1},
					{Item={10310035,10310036,10310037,10310038,10310039},Count=1},
					{Item={11000359},Count=10},
					{Item={14032685},Count=1},
					{Item={11000360},Count=10},
					{Item={11000501},Count=10}
					}

--黄金乱士符			11970023										1	0.8		8	
--一星爆焱龙珠			14032685										1	1		18	
--浮世印				11970018										1	15		168	
--普通地中海尖凿		11000948										1	15		318	
--无瑕星辰				11000551										1	15		468	
--高级猫眼				14010026|14020026|14030026|14040026				1	0.1		469	5000个出一个，前70%不出
--掌门牌：清一色门前清	10310035|10310036|10310037|10310038|10310039	1	0.1		470	8000个出一个，前70%不出，5个中再随一次从前到后，机率减少
--沉香木炭				11000359										10	17		640	
--云杉木炭				11000360										10	18		820	
--紫檀木炭				11000501										10	18		1000	

-- *************************
-- 抽奖的控制
-- 第5格5000次内最多允许出2个
x418530_g_item_1_pos = 5;
x418530_g_item_1_cnt = 5001;
x418530_g_item_1_limit = 1;
x418530_g_item_1_itemcnt = 0;
x418530_g_item_1_cur = 0;

-- 第6格8000次内最多允许出2个
x418530_g_item_2_pos = 6;
x418530_g_item_2_cnt = 8001;
x418530_g_item_2_limit = 1;
x418530_g_item_2_itemcnt = 0;
x418530_g_item_2_cur = 0;


function x418530_CheckMoneyItem(item,a)
	local jilu = 0.7; --小于此百分比数量不出
	if a == 0 then	
		x418530_g_item_1_cur = x418530_g_item_1_cur + 1;
		x418530_g_item_2_cur = x418530_g_item_2_cur + 1;
	end

	if item == x418530_g_item_1_pos then
		if x418530_g_item_1_cur < x418530_g_item_1_cnt then
			if x418530_g_item_1_cur > x418530_g_item_1_cnt * jilu and x418530_g_item_1_itemcnt < x418530_g_item_1_limit then
				x418530_g_item_1_itemcnt = x418530_g_item_1_itemcnt + 1;
				return item;
			else
				x418530_CheckMoneyItem(random(1,10),1);
			end
		else
			x418530_g_item_1_cur = 0;
			x418530_g_item_1_itemcnt = 0;
			x418530_CheckMoneyItem(random(1,10),1);
		end
	end
	
	if item == x418530_g_item_2_pos then
		if x418530_g_item_2_cur < x418530_g_item_2_cnt then
			if x418530_g_item_2_cur > x418530_g_item_2_cnt * jilu and x418530_g_item_2_itemcnt < x418530_g_item_2_limit then
				x418530_g_item_2_itemcnt = x418530_g_item_2_itemcnt + 1;
				return item;
			else
				x418530_CheckMoneyItem(random(1,10),1);
			end
		else
			x418530_g_item_2_cur = 0;
			x418530_g_item_2_itemcnt = 0;
			x418530_CheckMoneyItem(random(1,10),1);
		end
	end
	
	return item;
end

function x418530_SelectNumber(list)
	local qujian={0,150,300,308,458,459,460,630,640,820,1000}
	local m,i
	m=random(1,1000);
	for i=1,10 do
		if m > qujian[i] and m <= qujian[i+1] then
			return x418530_CheckMoneyItem(i,0);
		end
	end
end

function x418530_ProcEventEntry( varMap, varPlayer, varBagIdx )

end


function x418530_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end


function x418530_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end


function x418530_ProcConditionCheck( varMap, varPlayer )
	
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


function x418530_ProcDeplete( varMap, varPlayer )
	
	return 1;
end


function x418530_ProcActivateOnce( varMap, varPlayer, varImpact )
	local m,i,n,ItemId
	local m_item= x418530_SelectNumber(1)
	
	if (m_item == 5) then
		m=random(1,4);
		ItemId = x418530_var_ItemTab[m_item].Item[m]		
	elseif(m_item == 6) then
		local qujian={0,30,55,75,90,100}
		m=random(1,100);
		for i=1,5 do
			if m > qujian[i] and m <= qujian[i+1] then
				n = i
				break
			end
		end
		ItemId = x418530_var_ItemTab[m_item].Item[n]			
	else
		ItemId = x418530_var_ItemTab[m_item].Item[1]
	end
	local ItemNum = x418530_var_ItemTab[m_item].Count



	--Msg2Player( varMap,varPlayer,format("ItemId:%d,ItemNum:%d",ItemId,ItemNum),8,3) ;	
			
	StartItemTask(varMap)
	ItemAppend( varMap,ItemId ,ItemNum )
	--ItemAppendBind( varMap, 12266785, 1)	--小钱包1个	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)		
			--Msg2Player( varMap,varPlayer,"打开礼包，获得帝国勇士时装礼包1个，千里驹降世符1个，布袋包1个等",8,2) ;			
			Msg2Player( varMap,varPlayer,format("打开礼包，获得#cffcf00@item_%d %d个",ItemId,ItemNum),8,3) ;	
			
			if (m_item == 5 or m_item == 6) then
				local Name =  GetName(varMap, varPlayer)
				local varMsg = format( "恭喜%s打开传说缤纷大礼包获得了#cffcf00@item_%d",ItemId)
				LuaAllScenceM2Wrold (varMap, varMsg, 5, 1)				
			end					
			
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


function x418530_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
