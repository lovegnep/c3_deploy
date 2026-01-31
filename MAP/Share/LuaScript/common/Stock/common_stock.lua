
x310350_var_FileId = 310350
x310350_var_QuestName = "进入钱庄"

x310350_var_STOCK_OP_ASK_REGISTER = 0				
x310350_var_STOCK_OP_ASK_OPEN = 1					
x310350_var_STOCK_OP_MONEY_TO_STOCK = 2			
x310350_var_STOCK_OP_MONEY_TO_CHAR = 3			
x310350_var_STOCK_OP_MONEY_TO_CHAR_FAILED = 4		
x310350_var_STOCK_OP_ASK_WORLD_LIST = 5			
x310350_var_STOCK_OP_ASK_AUTO_SALE = 6			
x310350_var_STOCK_OP_ASK_AUTO_BUY = 7				
x310350_var_STOCK_OP_ASK_FAST_SALE = 8			
x310350_var_STOCK_OP_ASK_FAST_BUY = 9				
x310350_var_STOCK_OP_ASK_RECORD = 10				
x310350_var_STOCK_OP_ASK_MARKET_LIST = 11			
x310350_var_STOCK_OP_ASK_REPEAL_BUY = 12			
x310350_var_STOCK_OP_ASK_REPEAL_SELL = 13			


x310350_var_SceneMatchNPC = 	{ 
								
								{ varMap = 0, varTalkNpcGUID = 139086, },
								
								
								{ varMap = 50, varTalkNpcGUID = 123768, },
								
								
								{ varMap = 150, varTalkNpcGUID = 126064, },
																
								
								{ varMap = 250, varTalkNpcGUID = 129067, },
																
								
								{ varMap = 350, varTalkNpcGUID = 132064, },		
																			
								
								{ varMap = 39, varTalkNpcGUID = 145058, },			
																							
								
								{ varMap = 40, varTalkNpcGUID = 145149, },																													
							}



function x310350_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x310350_var_FileId,x310350_var_QuestName,3,-1)
	
end




function x310350_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	if GetMergeDBToggle() == 1 then
		local text = "为配合并服，钱庄系统暂时关闭，并服完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return 	
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
		local text = "为配合资料库升级，钱庄系统暂时关闭，升级完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return 	
	end

	if IsEnableStockAccount(varMap, varPlayer) == 0 then
		local text = "您还未开通钱庄帐户,请先开通您的钱庄帐户！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return
	end
	
	
	OpenStockSystem(varMap, varPlayer)
		
end


function x310350_ProcIsCanAccessStock( varMap, varPlayer, opType,gold, siller )
		
	if IsEnableStockAccount(varMap, varPlayer) == 0 then
	
		local text = "您还未开通钱庄帐户,请先开通您的钱庄帐户！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
		
	end
	
	if GetMergeDBToggle() == 1 then
	
		local text = "为配合并服，模块暂时关闭，并服完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
		
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
	
		local text = "为配合资料库升级，模块暂时关闭，升级完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
		
	end

	local isInDistance = 0	
	for varI,itm in x310350_var_SceneMatchNPC do
		
		if itm.varMap == varMap then		
			
			local npcObjId = FindMonsterByGUID(varMap,itm.varTalkNpcGUID)		
			if IsInDist(varMap,varPlayer,npcObjId,5) == 1 then
				isInDistance = 1				
			end	
			
			break
						
		end
		
	end
	
	if isInDistance ~= 1 then
	
		
		return 0
		
	end
			
	local varRet = 0
	
	if opType == x310350_var_STOCK_OP_MONEY_TO_STOCK then		
	
		varRet = LuaCallNoclosure(x310350_var_FileId, "ProcIsCanTransMoneyToStock", varMap, varPlayer, gold, siller);
		
	elseif opType == x310350_var_STOCK_OP_MONEY_TO_CHAR then	
	
		varRet = LuaCallNoclosure(x310350_var_FileId, "ProcIsCanTransMoneyToChar", varMap, varPlayer, gold, siller);	
		
	elseif opType == x310350_var_STOCK_OP_ASK_AUTO_BUY or opType == x310350_var_STOCK_OP_ASK_FAST_BUY then	
		
		
		varRet = LuaCallNoclosure(x310350_var_FileId, "ProcIsCanBuy", varMap, varPlayer, gold, siller);	
		
		
	elseif opType == x310350_var_STOCK_OP_ASK_AUTO_SALE or opType == x310350_var_STOCK_OP_ASK_FAST_SALE then	
		
		
		varRet = LuaCallNoclosure(x310350_var_FileId, "ProcIsCanSale", varMap, varPlayer, gold, siller);	
				
	elseif opType == x310350_var_STOCK_OP_ASK_REPEAL_BUY or opType == x310350_var_STOCK_OP_ASK_REPEAL_SELL then		
	
		
		varRet = LuaCallNoclosure(x310350_var_FileId, "ProcIsCanRepeal", varMap, varPlayer);		
				
	elseif opType == x310350_var_STOCK_OP_ASK_WORLD_LIST then
	
		
		varRet = x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_ASK_WORLD_LIST_TIME,3) 
			
	elseif opType == x310350_var_STOCK_OP_ASK_RECORD then
	
		
		varRet = x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_ASK_RECORD_TIME,1)		
		
	elseif opType == x310350_var_STOCK_OP_ASK_MARKET_LIST then		
		
		
		varRet = x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_AASK_MARKET_LIST_TIME,1)
		
	else
		
		
		varRet = 0
		
	end
	
	return varRet
	
end


function x310350_IsIntervalEnough(varMap, varPlayer,varIndex,interval)

	local lastTime = GetPlayerRuntimeData( varMap, varPlayer, varIndex )
	if lastTime <= 0 then
		
		local currTime = GetCurrentTime()
		SetPlayerRuntimeData( varMap, varPlayer, varIndex, currTime)
		
	else
		
		local currTime = GetCurrentTime()
		if currTime - lastTime < interval then		
			return 0
		end
		
		SetPlayerRuntimeData( varMap, varPlayer, varIndex, currTime)		
		
	end
	
	return 1
	
end



function x310350_ProcIsCanTransMoneyToStock( varMap, varPlayer, costGold, costSiller )
		
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
	
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
		
	end
	
	
	if x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_TRANS_MONEY_TIME,2) == 0 then
		
		return 0	
	end

	if costGold < 0 or costSiller < 0 then
		
		return 0
	end
	
	if costGold == 0 and costSiller ==0 then
		
		return 0
	end
	
	if costSiller > 0 and IsPasswordProtect(varMap, varPlayer, 3, 1) == 0 then
		return 0
	end
	
	if costGold > 0 and IsPasswordProtect(varMap, varPlayer, 2, 1) == 0 then
		return 0
	end		
	
	if GetMoney(varMap, varPlayer,0) < costSiller then
		
		local text = "你的背包内现银余额不足#{_MONEY"..costSiller.."},充值失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
		
	end	
	
	if GetMoney(varMap, varPlayer,2) < costGold then
		
		local text = "你的背包内现金余额不足#{_MONEY"..costGold.."},充值失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
		
	end

	return 1

end


function x310350_ProcIsCanTransMoneyToChar( varMap, varPlayer, gold, siller )
	
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
	
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
		
	end
	
	
	if x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_TRANS_MONEY_TIME,2) == 0 then
		
		return 0	
	end
	
	if gold < 0 or siller < 0 then
		
		return 0
	end
	
	if gold == 0 and siller ==0 then
		
		return 0
	end
	
	if GetMoney(varMap, varPlayer,0) + siller > 999999999 then
		
		local text = "现银超过上限"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
		
	end	
	
	if GetMoney(varMap, varPlayer,2) + gold > 999999999 then
		
		local text = "现金超过上限"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
		
	end

	return 1

end


function x310350_ProcIsCanBuy( varMap, varPlayer, gold, siller )
	
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	
	if x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_BUY_TIME,1) == 0 then
		
		return 0	
	end
	
	if gold <= 0 or siller <= 0 then
		
		return 0
	end	
	
	if mod(gold,1000) ~= 0 or mod(siller,1000) ~= 0 then
		
		return 0
	end
	
	gold = gold / 1000
	siller = siller / 1000
	
	if gold > 999 or siller > 999 then
		
		return 0
	end	
	
	if siller * gold > 999999 then
		
		return 0
	end	
	
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if siller > 0 and IsPasswordProtect(varMap, varPlayer, 3, 1) == 0 then
		return 0
	end
	
	if gold > 0 and IsPasswordProtect(varMap, varPlayer, 2, 1) == 0 then
		return 0
	end	
	
	return 1
	
end


function x310350_ProcIsCanSale( varMap, varPlayer, gold, siller )
		
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	
	if x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_SALE_TIME,1) == 0 then
		
		return 0	
	end
	
	if IsEnableStockAccount(varMap, varPlayer) == 0 then
		local text = "请先开通您的钱庄帐户！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
	end
	
	if GetMergeDBToggle() == 1 then
		local text = "为配合并服，模块暂时关闭，并服完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
	
		local text = "为配合资料库升级，模块暂时关闭，升级完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
		
	end
	
	if gold <= 0 or siller <= 0 then
		
		return 0
	end	
	
	if mod(gold,1000) ~= 0 or mod(siller,1000) ~= 0 then
		
		return 0
	end
	
	gold = gold / 1000
	siller = siller / 1000
	
	if gold > 999 or siller > 999 then
		
		return 0
	end	
	
	if siller * gold > 999999 then
		
		return 0
	end	
	
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if siller > 0 and IsPasswordProtect(varMap, varPlayer, 3, 1) == 0 then
		return 0
	end
	
	if gold > 0 and IsPasswordProtect(varMap, varPlayer, 2, 1) == 0 then
		return 0
	end	
	
	return 1
	
end


function x310350_ProcIsCanRepeal( varMap, varPlayer )
		
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你尚处于安全保护时间内，无法进行此操作！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	
	if x310350_IsIntervalEnough(varMap, varPlayer,RD_STOCK_REPEAL_TIME,2) == 0 then
		
		return 0	
	end
	
	return 1
	
end


function x310350_ProcTransMoneyToStockResult( varMap, varPlayer, transGold, transSiller,stockGold,stockSiller,result )
	
	if result == 0 then
		local text = "钱庄帐户充值失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	else
		local text = "钱庄帐户充值完成，帐户余额为：现金#{_MONEY"..stockGold.."现银#{_MONEY"..stockSiller
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0	
	end
end


function x310350_ProcAskAutoSaleResult( varMap, varPlayer, transGold, transSiller,result )

	if result == 0 and transGold >= 10000 then
		
		local text = "某人在钱庄处委托卖金#{_MONEY"..transGold.."}，每两金子价格为#{_MONEY"..transSiller.."}银子，已完成挂单。"
		LuaAllScenceM2Wrold(varMap,text,2,1)
	end

end


function x310350_ProcAskAutoBuyResult( varMap, varPlayer, transGold, transSiller,result )
	
	if result == 0 and transGold >= 10000 then
		
		local text = "某人在钱庄处委托买金#{_MONEY"..transGold.."}，每两金子价格为#{_MONEY"..transSiller.."}银子，已完成挂单。"
		LuaAllScenceM2Wrold(varMap,text,2,1)		
	end
	
end



function x310350_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	return 1

end





function x310350_ProcAccept( varMap, varPlayer )

end
