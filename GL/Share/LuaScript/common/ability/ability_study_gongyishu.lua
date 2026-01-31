
x540006_var_FileId = 540006



function x540006_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	TalkAppendButton(varMap, x540006_var_FileId, "波斯工艺术", 3,	 7)
	
	
end


function x540006_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varLifeSkillLevel = QueryPlayerAbilityLevel( varMap, varPlayer, varIndex )
	local costMoney=0
	local costExp=0
	local limitLevel=0
	costMoney, costExp, limitLevel = GetAbilityLevelupConfig(varIndex, varLifeSkillLevel)
	local studyOrLevelup = 0;

	
		
	
		
	
	DeliverAbilityInfo(varMap, varPlayer, varTalknpc,x540006_var_FileId, varIndex, costMoney, studyOrLevelup, costExp, limitLevel);
end
