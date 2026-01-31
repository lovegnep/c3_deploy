


















x310062_var_Bufftabale = {30578,30579,30580,30581,30582} 
x310062_var_Buff       = 30581    --长生天的赐福（外装）
x310062_var_Item       = 12035024 --长生天的赐福（外装藏宝图）
x310062_var_ItemID     = 12035019 --黄金藏宝图传送符







function x310062_ProcEventEntry( varMap, varPlayer, varBagIdx )
	for i , item in x310062_var_Bufftabale do 
		 if IsHaveSpecificImpact(varMap, varPlayer, item) == 1 then
		 	Msg2Player( varMap, varPlayer, "你已经有一种洞彻玄机的能力,手动取消该能力后才可以使用此道具！", 8, 3)   
  	 	Msg2Player( varMap, varPlayer, "你已经有一种洞彻玄机的能力,手动取消该能力后才可以使用此道具！", 8, 2)    
  	 	return 0
  	 end
  end
  
  if GetItemCount(varMap,varPlayer,x310062_var_ItemID) <= 0 then   
		StartItemTask( varMap )
		ItemAppend( varMap, x310062_var_ItemID, 1 )
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x310062_var_Item, 1) ~= 1 then return 0 end 
			DeliverItemListSendToPlayer(varMap,varPlayer)
			Msg2Player( varMap, varPlayer, format("#Y获得#G1个#Y#{_ITEM%d}！", x310062_var_ItemID), 8, 3)
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310062_var_Buff, 0);   
			Msg2Player( varMap, varPlayer, "你获得#G洞彻玄机#cffcf00能力！", 8, 3)   
  		Msg2Player( varMap, varPlayer, "获得#G洞彻玄机#cffcf00能力，你可以使用藏宝图传送符帮你快速完成#G【个人】外装黄金藏宝图的秘密#cffcf00任务！", 8, 2) 

		else
			Msg2Player( varMap, varPlayer, format("#Y背包空间不足！", x310062_var_ItemID), 8, 3)
			return 0
		end 
	else	
		if DelItem( varMap, varPlayer, x310062_var_Item, 1) ~= 1 then return 0 end 
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310062_var_Buff, 0);   
		Msg2Player( varMap, varPlayer, "你获得#G洞彻玄机#cffcf00能力！", 8, 3)   
  	Msg2Player( varMap, varPlayer, "获得#G洞彻玄机#cffcf00能力，你可以使用藏宝图传送符帮你快速完成#G【个人】外装黄金藏宝图的秘密#cffcf00任务！", 8, 2) 
	end
	GamePlayScriptLog( varMap, varPlayer, 2639)
	
end

function x310062_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310062_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310062_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310062_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310062_ProcActivateOnce( varMap, varPlayer )
end

function x310062_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end



