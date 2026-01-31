





x418795_var_FileId 		= 418795

x418795_var_LevelMin		=	1

x418795_var_zhiye ={{var1 =30001002,var2 =30011002,var3=30021002,var4=30031002,var5 =30061002,var6 =30071002,var7 =30081002,var8 =30091002},
										{var1 =30001007,var2 =30011007,var3 =30021007,var4 =30031007,var5 =30061007,var6 =30071007,var7 =30081007,var8 =30091007},
										{var1 =30001012,var2 =30011012,var3 =30021012,var4 =30031012,var5 =30061012,var6 =30071012,var7 =30081012,var8 =30091012}
										}




function x418795_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418795_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418795_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418795_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418795_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418795_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetBagSpace(varMap, varPlayer) <8 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少8个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少8个背包空位", 0, 3)
		return 0
	end
	local zhiye = GetZhiye(varMap, varPlayer)
	local mark = mod((zhiye + 1),6)
	local shuxing = 0
	if mark == 1 or mark == 2 then
		shuxing = 1
	elseif mark ==3 and mark == 4 then
		shuxing = 2
	else
		shuxing = 3
	end  
	

	StartItemTask(varMap)
	
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var1 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var2 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var3 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var4 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var5 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var6 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var7 , 1 )
		ItemAppendBind( varMap,x418795_var_zhiye[shuxing].var8 , 1 )		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog( varMap, varPlayer, 3869)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得骑乘装备。")
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
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418795_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
