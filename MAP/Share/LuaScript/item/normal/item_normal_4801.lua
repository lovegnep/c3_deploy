














x404801_var_FileId = 404801 



x404801_var_Zhiye = -1 


x404801_var_Buf1 = 9801 
x404801_var_Buf2 = -1 




function x404801_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404801_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404801_ProcCancelImpacts( varMap, varPlayer )
	local varRet = CancelSpecificImpact(varMap, varPlayer, x404801_var_Buf1)
	if(0<varRet) then
		return 1;
	end
	return 0;
end






function x404801_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	if(-1~=x404801_var_Zhiye) then
		if(GetZhiye(varMap, varPlayer)==x404801_var_Zhiye) then 
			return 1;
		else
			Msg2Player( varMap,varPlayer,"您不能骑这种座骑。",MSG2PLAYER_PARA) 
		end
	else
		return 1;
	end
	return 0;
end







function x404801_ProcDeplete( varMap, varPlayer )
	return 1; 
end








function x404801_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404801_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404801_var_Buf1, 0);
	end
	Msg2Player( varMap,varPlayer,"您已经骑上黄骠马了。",MSG2PLAYER_PARA) 
	return 1;
end







function x404801_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
