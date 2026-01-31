

x418312_var_FileId = 418312
x418312_var_QuestName = "铁牌图腾礼包"
x418312_var_LevelMin = 70


function x418312_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418312_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418312_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418312_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418312_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end
function x418312_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418312_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local value = 1
		while value == 1 do   
		local varRan = random(1,1000)
			value = 2 
		if varRan <= 200 then
			exp = GetLevel(varMap, varPlayer) * 6000
			AddExp(varMap, varPlayer, exp)
			local varMsg = format( "获得经验值奖励#R"..exp.."#o点") 
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		elseif varRan <= 400 then
			local guildId = GetGuildID(varMap,varPlayer)
			if guildId < 0 then
--				local varMsg = format( "您没有帮会，无法获得帮贡!")
--				Msg2Player( varMap, varPlayer, varMsg, 8, 2)
--				Msg2Player( varMap, varPlayer, varMsg, 8, 3)
					value = 1
			else
				local guildvalue = GetLevel(varMap, varPlayer) * 2
				AddGuildUserPoint(varMap, varPlayer, guildvalue)
				local varMsg = format( "获得帮贡值奖励%d点", guildvalue)
				Msg2Player( varMap, varPlayer, varMsg, 8, 2)
				Msg2Player( varMap, varPlayer, varMsg, 8, 3)
			end
		elseif varRan <= 600 then
			local honor = GetLevel(varMap, varPlayer) * 2
			AddHonor(varMap, varPlayer, honor)
			local varMsg = format( "获得荣誉值奖励%d点", honor)
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
--	elseif varRan <= 800 then
--			StartItemTask( varMap)
--			ItemAppendBind( varMap, 11020002, 2)     -- 战车强化道具20%,后期添加
--			if StopItemTask( varMap, varPlayer) <= 0 then
--					local varMsg = format( "背包空间不足，无法获得奖励物品")
--					Msg2Player( varMap, varPlayer, varMsg, 8, 2)
--					Msg2Player( varMap, varPlayer, varMsg, 8, 3)
--					return
--			end
--			DeliverItemListSendToPlayer( varMap, varPlayer)
		elseif varRan <= 1000 then
			local bonusshengwang = GetLevel(varMap, varPlayer) * 4
			local shenwang = GetShengWang(varMap, varPlayer)
			SetShengWang(varMap, varPlayer, shenwang+bonusshengwang)
			local varMsg = format( "获得声望值奖励%d点", bonusshengwang)
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
--		else
--			StartItemTask( varMap)
--			ItemAppendBind( varMap, 11020002, 1)     -- 高级车身一个1/1000概率，后期添加
--			if StopItemTask( varMap, varPlayer) <= 0 then
--					local varMsg = format( "背包空间不足，无法获得奖励物品")
--					Msg2Player( varMap, varPlayer, varMsg, 8, 2)
--					Msg2Player( varMap, varPlayer, varMsg, 8, 3)
--					return
--			end
			end
		end
	else
			local varMsg = format( "道具使用异常！")
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)
			return   
	end
end







function x418312_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end








