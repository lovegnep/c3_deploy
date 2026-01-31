





x414027_var_FileId 		= 414027 

x414027_var_LevelMin		=	20






function x414027_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414027_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414027_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414027_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414027_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414027_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414027_var_LevelMin then
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
	
	
	local nMoney = x414027_GetBonusMoney( varMap, varPlayer)
	
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







function x414027_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end



function x414027_GetBonusMoney( varMap, varPlayer)
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)	
	local itemInBag = GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx)
	--冠军大礼包
	if itemInBag ==12030136 or itemInBag ==12030140 then 
		return 12000
	elseif itemInBag ==12030137 then
		return 18000
	elseif itemInBag ==12030138 or itemInBag ==12030141 then
		return 24000
	elseif itemInBag ==12030139 or itemInBag ==12030142 then	
		return 30000
	end
end
