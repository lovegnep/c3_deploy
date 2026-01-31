





x418707_var_FileId 		= 418707

x418707_var_LevelMin		=	1

x418707_var_ExtraBonusName	=
	{
		[11990113] ="钻石原石",
		[10306083] ="钢铁侠时装"   ,
		[12050286] ="金鬃狂狮降世符" ,
}





function x418707_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418707_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418707_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418707_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418707_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418707_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	--判断背包剩余
	if GetBagSpace(varMap, varPlayer,0) < 3 then
		Msg2Player(varMap, varPlayer, "背包空间不足，请保证有3个以上的空间！", 0, 2)
		Msg2Player(varMap, varPlayer, "背包空间不足，请保证有3个以上的空间！", 0, 3)
		return
	end
	
	if GetLevel(varMap, varPlayer)< x418707_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local extraitem =x418707_ExtraBonus( varMap, varPlayer)
	local god =x418707_GodBonus( varMap, varPlayer)

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12054300, 50 )	  --还童书
		if extraitem ~= 0 then
				ItemAppendBind( varMap, extraitem, 1 )
		end
		if god ~= 0 then
				ItemAppendBind( varMap, god, 1 )
		end
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得50本还童书。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			if extraitem ~= 0 then
					local Name =  GetName(varMap, varPlayer)
					local msg = "恭喜你获得1个#G"..x418707_var_ExtraBonusName[extraitem]
					Msg2Player( varMap, varPlayer, msg, 8, 3)
					msg = "恭喜"..Name.."打开还童书大礼包获得了#G"..x418707_var_ExtraBonusName[extraitem]
					LuaAllScenceM2Wrold (varMap , msg , 5, 1)
			end			
			if god ~= 0 then
					local Name =  GetName(varMap, varPlayer)
					local msg = "恭喜你获得残破的神兵之魂"
					Msg2Player( varMap, varPlayer, msg, 8, 3)
					msg = "恭喜"..Name.."打开还童书大礼包获得了残破的神兵之魂"
					LuaAllScenceM2Wrold (varMap , msg , 1, 1)
			end
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







function x418707_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x418707_ExtraBonus( varMap, varPlayer)
	local ran1 =	random(10000) 
	if 2000 >= ran1 then
		return 11990113	
	end	
	return 0; 
end

function x418707_GodBonus( varMap, varPlayer)
	local ran =	random(1000) 
	if 680 >= ran then
		return 11000304
	end	
	return 0; 
end
