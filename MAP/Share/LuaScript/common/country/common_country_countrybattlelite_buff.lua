
x310156_var_FileId = 310156
x310156_var_BufId  = {8719,8720,8721,8722,8723,8724,8725,8726,8727}





function x310156_CancelBuf( varMap,varPlayer )
	
	for varI,item in x310156_var_BufId do
		if IsHaveSpecificImpact(varMap,varPlayer,item) == 1 then
			CancelSpecificImpact(varMap,varPlayer,item)
		end
	end
end




function x310156_ProcIntervalOverEvent( varMap, varPlayer)
	
	
	
	
	if varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and
	   varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 and
	   varMap ~= 68 and varMap ~= 168 and varMap ~= 268 and varMap ~= 368 and
	   varMap ~= 76 and varMap ~= 176 and varMap ~= 276 and varMap ~= 376 and 
	   varMap ~= 86 and varMap ~= 186 and varMap ~= 286 and varMap ~= 386 and 
	   varMap ~= 104 and varMap ~= 204 and varMap ~= 304 and varMap ~= 404 and 
	   varMap ~= 105 and varMap ~= 205 and varMap ~= 305 and varMap ~= 405 and 
	   varMap ~= 106 and varMap ~= 206 and varMap ~= 306 and varMap ~= 406 and 
	   varMap ~= 107 and varMap ~= 207 and varMap ~= 307 and varMap ~= 407 and 
	   varMap ~= 108 and varMap ~= 208 and varMap ~= 308 and varMap ~= 408 and 
	   varMap ~= 109 and varMap ~= 209 and varMap ~= 309 and varMap ~= 409 and 
	   varMap ~= 110 and varMap ~= 210 and varMap ~= 310 and varMap ~= 410 and 
	   varMap ~= 111 and varMap ~= 211 and varMap ~= 311 and varMap ~= 411 and 
	   varMap ~= 91 and varMap ~= 191 and varMap ~= 291 and varMap ~= 391 and varMap ~= 3 then
	   
	   x310156_CancelBuf( varMap,varPlayer )
	   return
		
	end
	
	
	if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsBattleFinished",varMap,varPlayer) == 1 then
		
		x310156_CancelBuf( varMap,varPlayer )
	   	return
	end	
end





function x310156_ProcActiveEvent( varMap, varPlayer )
end




function x310156_ProcFadeOutEvent( varMap, varPlayer )
end




function x310156_ProcEventEntry( varMap, varPlayer, varBagIdx)
end
