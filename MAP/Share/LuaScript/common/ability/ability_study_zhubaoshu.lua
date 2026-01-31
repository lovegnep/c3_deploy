
x540007_var_FileId = 540007



function x540007_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	TalkAppendButton(varMap, x540007_var_FileId, "巴尔干战车术", 3,	 30)
	
	
end


function x540007_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varLifeSkillLevel = QueryPlayerAbilityLevel( varMap, varPlayer, varIndex )
	local costMoney=0
	local costExp=0
	local limitLevel=0
	costMoney, costExp, limitLevel = GetAbilityLevelupConfig(varIndex, varLifeSkillLevel)
	local studyOrLevelup = 0;

	
		
	
		
	
	DeliverAbilityInfo(varMap, varPlayer, varTalknpc,x540007_var_FileId, varIndex, costMoney, studyOrLevelup, costExp, limitLevel);
end
