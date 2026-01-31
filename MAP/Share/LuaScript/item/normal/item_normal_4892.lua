













x404892_var_FileId = 404892 




x404892_var_Buf1 = -1 
x404892_var_Buf2 = -1 




function x404892_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404892_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404892_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404892_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	
	
	if GetHp(varMap,varPlayer) == GetPlayerMaxHP(varMap,varPlayer) and GetRage(varMap,varPlayer) == GetPlayerMaxRage(varMap,varPlayer) then
		
	  	Msg2Player( varMap, varPlayer, "你现在不需要这种药品", 8, 3)
		return 0
	end
	                                     
	
	
	
	
	
	

	return 1; 
end







function x404892_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404892_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404892_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404892_var_Buf1, 0);
	end

     
     SetHp( varMap, varPlayer, 50000)
	   RestoreRage(varMap, varPlayer,100)
	return 1;
end







function x404892_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
