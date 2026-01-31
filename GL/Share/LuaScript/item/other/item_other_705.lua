





x418705_var_FileId 		= 418705

x418705_var_LevelMin		=	1

x418705_var_ExtraBonusName	=
	{
		[11990113] ="钻石原石"   ,
		[10306083] ="钢铁侠时装"     ,
		[12050286] ="金鬃狂狮降世符"   ,
}




function x418705_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418705_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418705_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418705_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418705_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418705_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	--判断背包剩余
	if GetBagSpace(varMap, varPlayer,0) < 4 then
		Msg2Player(varMap, varPlayer, "背包空间不足，请保证有4个以上的空间！", 0, 2)
		Msg2Player(varMap, varPlayer, "背包空间不足，请保证有4个以上的空间！", 0, 3)
		return
	end
	
	if GetLevel(varMap, varPlayer)< x418705_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local extraitem =x418705_ExtraBonus( varMap, varPlayer)
	local god =x418705_GodBonus( varMap, varPlayer)
	local num =x418705_wanmeiBonus( varMap, varPlayer)
	
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000551, 25 )	  --无瑕星辰
		ItemAppendBind( varMap, 11000552, num )	  --完美星辰
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
			TalkAppendString(varMap,"打开礼包，获得25个无瑕星辰和"..num.."个完美星辰")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			if extraitem ~= 0 then
					local Name =  GetName(varMap, varPlayer)
					local msg = "恭喜你获得#G"..x418705_var_ExtraBonusName[extraitem]
					Msg2Player( varMap, varPlayer, msg, 8, 3)
					msg = "恭喜"..Name.."打开无瑕星辰大礼包获得#G"..x418705_var_ExtraBonusName[extraitem]
					LuaAllScenceM2Wrold (varMap , msg , 5, 1)
			end						
			if god ~= 0 then
					local Name =  GetName(varMap, varPlayer)
					local msg = "恭喜你获得残破的神兵之魂"
					Msg2Player( varMap, varPlayer, msg, 8, 3)
					msg = "恭喜"..Name.."打开无瑕星辰大礼包获得了残破的神兵之魂"
					LuaAllScenceM2Wrold (varMap , msg , 1, 1)
			end			
			if num == 3 then
					local Name =  GetName(varMap, varPlayer)
					msg = "恭喜"..Name.."打开无瑕星辰大礼包获得了3个完美星辰"
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







function x418705_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end



function x418705_ExtraBonus( varMap, varPlayer)
	local ran1 =	random(10000) 
	if 1000 >= ran1 then
		return 11990113
	elseif 1190	 >= ran1 then
		return 10306083
	end	
	return 0; 
end


function x418705_GodBonus( varMap, varPlayer)
	local ran2 =	random(1000) 
	if 380 >= ran2 then
		return 11000304
	end	
	return 0; 
end



function x418705_wanmeiBonus( varMap, varPlayer)
	local ran =	random(100) 
	if 80 >= ran then
		return 1
	elseif 95 >= ran then
		return 2
	else
		return 3	
	end	
end

