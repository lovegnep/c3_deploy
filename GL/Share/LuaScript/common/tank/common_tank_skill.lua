

x290000_var_FileId = 290000 

x290000_var_MapList = { 
						{varItem=12266822, skillID=10600},
						{varItem=12266823, skillID=10601},
						{varItem=12266824, skillID=10602},
						{varItem=12266825, skillID=10603},
                                                {varItem=12266826, skillID=10604},
                                                {varItem=12266827, skillID=10605},
                                                {varItem=12266828, skillID=10606},
                                                {varItem=12266829, skillID=10607},
						
					} 
            



function x290000_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if 0 == IsHaveChariot(varMap, varPlayer) then
		Msg2Player(varMap, varPlayer, "没有战车不能学习战车技能", 8, 3)
		Msg2Player(varMap, varPlayer, "没有战车不能学习战车技能", 8, 2)
	 	return
	end
            
	local itemInBag = GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx)
	
	for varI, item in x290000_var_MapList do
		if (item.varItem == itemInBag) then
			if 1 == IsHaveChariotSkill(varMap, varPlayer, item.skillID) then
				Msg2Player(varMap, varPlayer, "您已经学习过该技能了", 8, 3)
				Msg2Player(varMap, varPlayer, "您已经学习过该技能了", 8, 2)
				return
			end
			
			if (1 == AddSkillToChariot( varMap, varPlayer, item.skillID, varBagIdx)) then
				Msg2Player(varMap, varPlayer, "您的战车获得了新的技能", 8, 3)
				Msg2Player(varMap, varPlayer, "您的战车获得了新的技能", 8, 2)
			end
			return
		end
	end

end






function x290000_ProcIsSpellLikeScript( varMap, varPlayer)

	return 0; 

end

