
function x430205_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	
	
	
	return 0;
end










function x430205_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 

end

function x430205_ProcCancelImpacts( varMap, varPlayer )
	return 0;
end





function x430205_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	local bagIndex = GetBagIndexOfUsedItem(varMap ,varPlayer)

	if GetItemIsOverTimeByBagPos(varMap ,varPlayer ,bagIndex) == 1 then
			if( DepletingUsedItem(varMap, varPlayer) > 0 ) then
			Msg2Player(varMap, varPlayer, "您使用的物品已过期,道具自动删除！", 8, 3)
				return
			end
	end

	return 1; 

end







function x430205_ProcDeplete( varMap, varPlayer )
	--删道具条件
		return 1;
end








function x430205_ProcActivateOnce( varMap, varPlayer )

	LetAllHorseHappy( varMap, varPlayer, 0 )
	
	local addHp = GetMaxHp( varMap, varPlayer)
	SetHp( varMap, varPlayer, addHp )
	RestoreHp(varMap, varPlayer,0)
	RestoreRage(varMap, varPlayer,100)
	RepaireBodyItemDur( varMap, varPlayer, 0 )
	
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 9663, 0);
	Msg2Player(varMap, varPlayer, "道具使用成功", 8, 3)
	return 1;
end







function x430205_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
