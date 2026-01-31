
x303143_var_FileId 		= 303143

x303143_var_LevelMin		=	1

x303143_skill_buff = {
			{
					1321, 2081, 3091, 4091, 5081, 6101, 17040, 18080, 19070, 20070, 21060, 22080
			},
			{
					1322, 2082, 3092, 4092, 5082, 6102, 17041, 18081, 19071, 20071, 21061, 22081
			},
			{
					1323, 2083, 3093, 4093, 5083, 6103, 17042, 18082, 19072, 20072, 21062, 22082
			},
			{
					1324, 2084, 3094, 4094, 5084, 6104, 17043, 18083, 19073, 20073, 21063, 22083
			},
			{
					1325, 2085, 3095, 4095, 5085, 6105, 17044, 18084, 19074, 20074, 21064, 22084
			},
			{
					1326, 2086, 3096, 4096, 5086, 6106, 17045, 18085, 19075, 20075, 21065, 22085
			},
			{
					1327, 2087, 3097, 4097, 5087, 6107, 17046, 18086, 19076, 20076, 21066, 22086
			},
			{
					1328, 2088, 3098, 4098, 5088, 6108, 17047, 18087, 19077, 20077, 21067, 22087
			},
			{
					1329, 2089, 3099, 4099, 5089, 6109, 17048, 18088, 19078, 20078, 21068, 22088
			},
			{
					1330, 2090, 3100, 4100, 5090, 6110, 17049, 18089, 19079, 20079, 21069, 22089
			},
}






function x303143_ProcEventEntry( varMap, varPlayer, varBagIdx )
end






function x303143_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x303143_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x303143_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x303143_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x303143_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x303143_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	--local varMapType = GetSceneType(varMap)
	--if ( varMapType ~= 7 ) then
		--Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,2)
		--Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,3)	
		--return
	--end
		
	if ( varMap < 3584 or varMap > 3886 ) then
		Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,2)
		Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,3)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	
		local varLevel = GetLevel(varMap, varPlayer)
		local varLevelArrayCount = -1
		if ( varLevel < 10 ) then
			varLevelArrayCount = 1
		elseif ( varLevel < 20 ) then
			varLevelArrayCount = 2
		elseif ( varLevel < 30 ) then
			varLevelArrayCount = 3
		elseif ( varLevel < 40 ) then
			varLevelArrayCount = 4
		elseif ( varLevel < 50 ) then
			varLevelArrayCount = 5
		elseif ( varLevel < 60 ) then
			varLevelArrayCount = 6
		elseif ( varLevel < 70 ) then
			varLevelArrayCount = 7
		elseif ( varLevel < 73 ) then
			varLevelArrayCount = 8
		elseif ( varLevel < 93 ) then
			varLevelArrayCount = 9
		else
			varLevelArrayCount = 10
		end
		
		if ( varLevelArrayCount == -1 ) then
			return
		end
		
		if ( varLevelArrayCount == 3 ) then
			varLevelArrayCount = 2
		elseif ( varLevelArrayCount > 3 ) then
			varLevelArrayCount = varLevelArrayCount - 2
		end
		
		for varI,s in x303143_skill_buff[varLevelArrayCount] do
			if ( s ~= nil ) then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, s, 0);
			end
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x303143_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
