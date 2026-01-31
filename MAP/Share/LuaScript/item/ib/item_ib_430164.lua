













function x430164_ProcEventEntry( varMap, varPlayer, varBagIdx )
	

	
	
	return 0;
end










function x430164_ProcIsSpellLikeScript( varMap, varPlayer)

--技能
	return 1; 

end

function x430164_ProcCancelImpacts( varMap, varPlayer )

	return 0;
end





function x430164_ProcConditionCheck( varMap, varPlayer )
	

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	local bagIndex = GetBagIndexOfUsedItem(varMap ,varPlayer)
	if GetItemIsOverTimeByBagPos(varMap ,varPlayer ,bagIndex) == 1 then
		EraseItem(varMap, varPlayer,bagIndex)
		Msg2Player(varMap, varPlayer, "您使用的物品已过期,道具自动删除！", 8, 3)
		return 
	end
	if(GetHp( varMap, varPlayer) == GetMaxHp( varMap, varPlayer)) then
		local varStr = "您当前生命值已满，不需要再次恢复！"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		return 0
	end
	return 1; 

end







function x430164_ProcDeplete( varMap, varPlayer )
		return 1
end








function x430164_ProcActivateOnce( varMap, varPlayer )

local addHp = GetMaxHp( varMap, varPlayer)
	SetHp( varMap, varPlayer, addHp )
	return 1;
end







function x430164_ProcActivateEachTick( varMap, varPlayer)

	return 1; 
end
