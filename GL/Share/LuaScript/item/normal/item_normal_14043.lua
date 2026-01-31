





x414043_var_FileId 		= 414043 

x414043_var_LevelMin		=	30






function x414043_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414043_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414043_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414043_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414043_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414043_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414043_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local Bind =1
  local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
	if IsItemBind(varMap,varPlayer,bagIndex) == 0 then
		Bind =2
	end	
	
	
	local nMoney = x414043_GetBonusMoney( varMap, varPlayer)
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap, varPlayer)


	if Bind ==2 then
		if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
			Bind =0
		end	
	end	
	if Bind ==0 then
			AddMoney(varMap, varPlayer, 0, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了%d两现银", nMoney/1000),4,3)
			Msg2Player(varMap,varPlayer,format("你获得了%d两现银", nMoney/1000),4,2)			
		else
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了%d两银卡", nMoney/1000),4,3)
			Msg2Player(varMap,varPlayer,format("你获得了%d两银卡", nMoney/1000),4,2)
	end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414043_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end



function x414043_GetBonusMoney( varMap, varPlayer)
	local level = GetLevel( varMap, varPlayer)	
	if level >= 80 then
		return 50000
	elseif level >= 70 then
		return 50000
	elseif level >= 60 then
		return 50000
	elseif level >= 50 then
		return 50000
	elseif level >= 40 then
		return 20000
	elseif level >= 30 then
		return 20000
	end
end
