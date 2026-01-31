





x320015_var_FileId 		= 320015 

x320015_var_LevelMin		=	1






function x320015_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x320015_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x320015_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x320015_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x320015_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x320015_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x320015_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if GetGuildID(varMap, varPlayer) == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"没有帮会无法使用该礼包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local Level = GetLevel (varMap, varPlayer)
		if Level >= 80 then
			local suiji = random(1,5)
			if suiji == 1 then
				AddGuildUserPoint(varMap,varPlayer,100)
				Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100),4,2)
			elseif suiji == 2 then
				local ExpBonus = 0
				if Level < 75 then
					ExpBonus = Level*2400
				elseif Level >= 75 then
					ExpBonus = Level*3500
				end
				AddExp(varMap, varPlayer, ExpBonus);
				Msg2Player(varMap,varPlayer,format("您获得了%d点经验", ExpBonus),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点经验", ExpBonus),4,2)	
			elseif suiji == 3 then
				AddHonor(varMap, varPlayer, 250)
				Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 250),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 250),4,2)
			elseif suiji == 4 then
				local refixtf = AddInherenceExp( varMap, varPlayer, 105)
				Msg2Player(varMap,varPlayer,format("您获得了%d点天赋", refixtf),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点天赋", refixtf),4,2)
			elseif suiji == 5 then
				if Level <75 then
					nMoney = Level * 100
				elseif Level >= 75 then
					nMoney = Level * 150
				end
				AddMoney(varMap, varPlayer, 0, nMoney)
				Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}现银的奖励。", nMoney),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}现银的奖励。", nMoney),4,2)
			end
		elseif Level < 80 then
			local suiji = random(1,4)
			if suiji == 1 then
				AddGuildUserPoint(varMap,varPlayer,100)
				Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100),4,2)
			elseif suiji == 2 then
				local ExpBonus = 0
				if Level < 75 then
					ExpBonus = Level*2400
				elseif Level >= 75 then
					ExpBonus = Level*3500
				end
				AddExp(varMap, varPlayer, ExpBonus);
				Msg2Player(varMap,varPlayer,format("您获得了%d点经验", ExpBonus),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点经验", ExpBonus),4,2)	
			elseif suiji == 3 then
				AddHonor(varMap, varPlayer, 250)
				Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 250),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 250),4,2)
			elseif suiji == 4 then
				if Level <75 then
					nMoney = Level * 100
				elseif Level >= 75 then
					nMoney = Level * 150
				end
				AddMoney(varMap, varPlayer, 0, nMoney)
				Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}现银的奖励。", nMoney),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}现银的奖励。", nMoney),4,2)
			end		
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x320015_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
