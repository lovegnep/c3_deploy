
x540008_var_FileId = 540008



function x540008_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	TalkAppendButton(varMap, x540008_var_FileId, "罗马工程术", 3,	 9)
	
	
end


function x540008_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varLifeSkillLevel = QueryPlayerAbilityLevel( varMap, varPlayer, varIndex )
	local costMoney=0
	local costExp=0
	local limitLevel=0
	costMoney, costExp, limitLevel = GetAbilityLevelupConfig(varIndex, varLifeSkillLevel)
	local studyOrLevelup = 0;

	
		
	
		
	
	DeliverAbilityInfo(varMap, varPlayer, varTalknpc,x540008_var_FileId, varIndex, costMoney, studyOrLevelup, costExp, limitLevel);
end
