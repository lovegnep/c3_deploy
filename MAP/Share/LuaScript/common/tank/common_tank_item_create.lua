
x290003_var_FileId = 290003 

-- 物品对应的战车标
x290003_var_MapList = { 
						{varItem=12266797, chariotID = 1  },
						{varItem=12266830, chariotID = 2  },
						{varItem=12266831, chariotID = 3  },
						{varItem=12266832, chariotID = 4  },
						{varItem=12266833, chariotID = 5  },
					} 
            

function x290003_ProcEventEntry( varMap, varPlayer, varBagIdx )

            
	local itemInBag = GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx)
	
	
	for varI, item in x290003_var_MapList do
		if (item.varItem == itemInBag) then
			if (1 == AddChariotToPlayer( varMap, varPlayer, item.chariotID, varBagIdx)) then
				if -1 == HaveSkill(varMap, varPlayer,92) then
					AddSkillToPlayer(varMap, varPlayer, 92, 1, 3)
					Msg2Player(varMap, varPlayer, "您获取了战车驾驶技能", 8, 2)
					Msg2Player(varMap, varPlayer, "您获取了战车驾驶技能", 8, 3)
				end
				Msg2Player(varMap, varPlayer, "您获取了新的战车", 8, 3)
				Msg2Player(varMap, varPlayer, "您获取了新的战车", 8, 2)
			elseif IsHaveChariot(varMap, varPlayer ) == 1 then
				if -1 == HaveSkill(varMap, varPlayer,92) then
					AddSkillToPlayer(varMap, varPlayer, 92, 1, 3)
					Msg2Player(varMap, varPlayer, "您获取了战车驾驶技能", 8, 2)
					Msg2Player(varMap, varPlayer, "您获取了战车驾驶技能", 8, 3)
				end
			end
			-- 为战车添加下车技能
			if IsHaveChariotSkill(varMap, varPlayer, 101) == 0 then
				AddSkillToChariot(varMap, varPlayer, 101, -1)
			end
			return
		end
	end

end



function x290003_ProcIsSpellLikeScript( varMap, varPlayer)

	return 0; 

end

