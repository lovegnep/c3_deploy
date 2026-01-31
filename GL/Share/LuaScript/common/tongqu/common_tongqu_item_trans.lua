x300323_var_FileId = 300323 

function x300323_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if varMap ~= 0 then return end
	local tempbuff = {7220,7221,7222,7223,7224,7225,7226,7227,7228,7229,}
	for k,v in tempbuff do
		if IsHaveSpecificImpact(varMap, varPlayer, v) > 0  then
			local posX=254
			local posZ =246
			SetPos(varMap, varPlayer, posX, posZ)
			
		else
		end
	end
end

function x300323_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x300323_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300323_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300323_ProcDeplete( varMap, varPlayer )

	return 0
end

function x300323_ProcActivateOnce( varMap, varPlayer )
end

function x300323_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
