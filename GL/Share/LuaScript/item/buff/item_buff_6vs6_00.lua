













x417100_var_FileId = 417100 




x417100_var_Buf1 = 7984 
x417100_var_Buf2 = -1 




function x417100_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x417100_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x417100_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x417100_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x417100_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x417100_ProcActivateOnce( varMap, varPlayer )
	
	if LuaCallNoclosure(SCENE_SCRIPT_ID,"GetBattleSceneType", varMap ) ~= PVP6V6_BATTLE_SCRIPT then
	    Msg2Player(varMap, varPlayer, "非组队战场状态，道具使用无效！", 8, 3)
		return 1
	end

	if(-1~=x417100_var_Buf1) then
		
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x417100_var_Buf1, 0);
	end
	return 1;
end







function x417100_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
