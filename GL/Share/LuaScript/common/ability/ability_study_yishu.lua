
x540004_var_FileId = 540004



function x540004_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	TalkAppendButton(varMap, x540004_var_FileId, "地中海工程术", 3,	 5)
	
	
end


function x540004_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varLifeSkillLevel = QueryPlayerAbilityLevel( varMap, varPlayer, varIndex )
	local costMoney=0
	local costExp=0
	local limitLevel=0
	costMoney, costExp, limitLevel = GetAbilityLevelupConfig(varIndex, varLifeSkillLevel)
	local studyOrLevelup = 0;

	
		
	
		
	
	DeliverAbilityInfo(varMap, varPlayer, varTalknpc,x540004_var_FileId, varIndex, costMoney, studyOrLevelup, costExp, limitLevel);
end
