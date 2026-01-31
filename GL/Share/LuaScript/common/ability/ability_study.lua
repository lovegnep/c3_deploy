

x890000_var_FileId = 890000



function x890000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	TalkAppendButton(varMap, x890000_var_FileId, "ÂÞÂíÖý¼×Êõ", 3,	 3)
	
	
end


function x890000_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varLifeSkillLevel = QueryPlayerAbilityLevel( varMap, varPlayer, varIndex )
	local costMoney=0
	local costExp=0
	local limitLevel=0
	costMoney, costExp, limitLevel = GetAbilityLevelupConfig(varIndex, varLifeSkillLevel)
	local studyOrLevelup = 0;

	DeliverAbilityInfo(varMap, varPlayer, varTalknpc,x890000_var_FileId, varIndex, costMoney, studyOrLevelup, costExp, limitLevel);
end



function x890000_ProcLevelupSucc( varMap, varPlayer )
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 14318, 0)
end
