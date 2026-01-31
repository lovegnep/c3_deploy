
x303140_var_FileId = 303140

x303140_randomBuff_array = { 
			{ 32504, 32505, 32506 },
			{ 32507, 32508, 32509 },
			{ 32510, 32511, 32512 },
			{ 32513, 32514, 32515 },
			{ 32516, 32517, 32518, 32519, 32520, 32521 },
			{ 32522, 32523, 32524, 32525, 32526 },
}

x303140_randomBuff_array_count = 6


function x303140_ProcEventEntry( varMap, varPlayer, varBagIdx )

end




function x303140_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end




function x303140_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end




function x303140_ProcConditionCheck( varMap, varPlayer )
		
	if ( varMap < 3584 or varMap > 3886 ) then
		Msg2Player(varMap,varPlayer, "使用物品完成，但只在跨服帮会战场中有效",8,2)
		Msg2Player(varMap,varPlayer, "使用物品完成，但只在跨服帮会战场中有效",8,3)
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end




function x303140_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end




function x303140_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local buff = nil
	local varRand = random ( 1, x303140_randomBuff_array_count )
	local varRand1 = random ( 1, 100 )
	
	if ( varRand == 1 ) then
		if ( varRand1 <=45 ) then
			buff = x303140_randomBuff_array[varRand][1]
		elseif ( varRand1 <=80 ) then
			buff = x303140_randomBuff_array[varRand][2]
		else
			buff = x303140_randomBuff_array[varRand][3]
		end
	elseif ( varRand == 2 ) then
		if ( varRand1 <=45 ) then
			buff = x303140_randomBuff_array[varRand][1]
		elseif ( varRand1 <=80 ) then
			buff = x303140_randomBuff_array[varRand][2]
		else
			buff = x303140_randomBuff_array[varRand][3]
		end
	elseif ( varRand == 3 ) then
		if ( varRand1 <=45 ) then
			buff = x303140_randomBuff_array[varRand][1]
		elseif ( varRand1 <=80 ) then
			buff = x303140_randomBuff_array[varRand][2]
		else
			buff = x303140_randomBuff_array[varRand][3]
		end
	elseif ( varRand == 4 ) then
		if ( varRand1 <=45 ) then
			buff = x303140_randomBuff_array[varRand][1]
		elseif ( varRand1 <=80 ) then
			buff = x303140_randomBuff_array[varRand][2]
		else
			buff = x303140_randomBuff_array[varRand][3]
		end
	elseif ( varRand == 5 ) then
		if ( varRand1 <=20 ) then
			buff = x303140_randomBuff_array[varRand][1]
		elseif ( varRand1 <=40 ) then
			buff = x303140_randomBuff_array[varRand][2]
		elseif ( varRand1 <=60 ) then
			buff = x303140_randomBuff_array[varRand][3]
		elseif ( varRand1 <=80 ) then
			buff = x303140_randomBuff_array[varRand][4]
		elseif ( varRand1 <=90 ) then
			buff = x303140_randomBuff_array[varRand][5]
		else
			buff = x303140_randomBuff_array[varRand][6]
		end
	elseif ( varRand == 6 ) then
		if ( varRand1 <=20 ) then
			buff = x303140_randomBuff_array[varRand][1]
		elseif ( varRand1 <=40 ) then
			buff = x303140_randomBuff_array[varRand][2]
		elseif ( varRand1 <=60 ) then
			buff = x303140_randomBuff_array[varRand][3]
		elseif ( varRand1 <=80 ) then
			buff = x303140_randomBuff_array[varRand][4]
		else
			buff = x303140_randomBuff_array[varRand][5]
		end
	end
	
	if ( varImpact ~= nil and buff ~= nil ) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0)
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 0)
	end
	
	return 1;
end




function x303140_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
