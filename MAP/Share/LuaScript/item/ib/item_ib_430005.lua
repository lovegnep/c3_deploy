













x430005_var_FileId = 430005 




x430005_var_Buf1 = 7041 
x430005_var_Buf2 = -1 
x430005_SceneList =  {2,3,4,5,6,7,8,9,10,11,86,87,89,186,187,189,286,287,289,386,387,389,73,173,273,373,74,174,274,374,68,168,268,368}




function x430005_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430005_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430005_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430005_ProcConditionCheck( varMap, varPlayer )
	

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430005_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x430005_ProcActivateOnce( varMap, varPlayer )

	if(-1~=x430005_var_Buf1) then

		if IsHaveSpecificImpact(varMap, varPlayer,x430005_var_Buf1) > 0 then
			local lastContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x430005_var_Buf1) - GetImpactContinuanceElapsed(varMap, varPlayer, x430005_var_Buf1) 
			if lastContinuance >= 0 then
				SetImpactContinuanceByDataIndex( varMap, varPlayer, x430005_var_Buf1, lastContinuance+60*60*1000 )
				ResetImpactContinuanceElapsed(varMap, varPlayer, x430005_var_Buf1)
				RefreshImpactByDataIndex(varMap, varPlayer,x430005_var_Buf1)
			end
		else
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430005_var_Buf1, 0)
		end
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你获得了一小时的战神加护");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"你获得了一小时的战神加护",8,2)

		local sign=0;
		for varI, item in x430005_SceneList do
			if varMap == item then sign = 1 break end
		end

		if sign == 1 then
			if IsHaveSpecificImpact( varMap, varPlayer, x430005_var_Buf1 ) > 0 then
				
				SetWanFaExpMult( varMap, varPlayer, 0.5 )
				
			end
		else
			SetWanFaExpMult( varMap, varPlayer, 0 )
		end
	
	end
	return 1;
end







function x430005_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
