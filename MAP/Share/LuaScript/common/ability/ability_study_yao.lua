x890001_var_FileId = 890001



function x890001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	TalkAppendButton(varMap, x890001_var_FileId, "÷–‘≠≤›“© ı", 3,	 1)
	
	
end


function x890001_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varLifeSkillLevel = QueryPlayerAbilityLevel( varMap, varPlayer, varIndex )
	local costMoney=0
	local costExp=0
	local limitLevel=0
	costMoney, costExp, limitLevel = GetAbilityLevelupConfig(varIndex, varLifeSkillLevel)
	local studyOrLevelup = 0;

	
		
	
		
	
	DeliverAbilityInfo(varMap, varPlayer, varTalknpc,x890001_var_FileId, varIndex, costMoney, studyOrLevelup, costExp, limitLevel);
end
