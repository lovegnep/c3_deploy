
x310828_var_FileId 		= 310828 

x310828_var_LevelMin	=	1






function x310828_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x310828_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310828_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310828_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x310828_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x310828_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x310828_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end
	
	local varRandom = random (1,100)
	
	if varRandom <= 100 then     --------------此礼包100%给火尾天狐降世符
	
		StartItemTask(varMap)
			ItemAppendBind( varMap, 12050296, 1 )	--火尾天狐降世符
			
		local ret = StopItemTask(varMap,varPlayer)
		if ret > 0 then
			if(DepletingUsedItem(varMap, varPlayer)) == 1 then
				GamePlayScriptLog( varMap, varPlayer, 2655)
				StartTalkTask(varMap)
				TalkAppendString(varMap,"打开火狐盛典礼包，获得了火尾天狐降世符")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"使用物品异常！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		
		local varLevel=GetLevel(varMap, varPlayer)
		local varExpBonus = 0
		
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			if varLevel > 0 and varLevel < 10 then
				varExpBonus = 50000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 20 then
				varExpBonus = 50000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 30 then
				varExpBonus = 50000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 40 then
				varExpBonus = 270000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 50 then
				varExpBonus = 400000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 60 then
				varExpBonus = 550000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 70 then
				varExpBonus = 720000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 80 then
				varExpBonus = 910000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 90 then
				varExpBonus = 1120000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			elseif varLevel < 100 then
				varExpBonus = 1350000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			else
				varExpBonus = 1580000*2
  		  AddExp( varMap, varPlayer, varExpBonus)
			end
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
		if varExpBonus ~= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开火狐盛典礼包，获得了"..varExpBonus.."点经验值")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	end
end







function x310828_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
