
x800100_var_FileId = 800100
x800100_var_QuestName = "加密算法管理模块"




function x800100_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )	
end




function x800100_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
end




function x800100_ProcEncryptManager( varMap, varPlayer, enctyptId )	
	
	local answer = x800100_CheckLoginAnswer( varMap, varPlayer )	

	if answer == 0 then		
		
		local bValid,nErrorCount,nOPMode = GetCheatActTableInfo( varMap, varPlayer,9 )
		
		if bValid == 0 then
			
			return 1
		end
		
		if nOPMode == 2 then		
			x800100_MakeKickTime( varMap, varPlayer )				
		elseif nOPMode == 3 then	
			x800100_DoLoginAnswer( varMap, varPlayer )	
		end

		SetLoginAnswer(varMap, varPlayer,3)		
		return 1
	elseif answer == 1 or answer == 2 then
		
		local bValid,nErrorCount,nOPMode = GetCheatActTableInfo( varMap, varPlayer,0 )
		
		if bValid == 0 then
			
			return 1
		end
				
		if nOPMode == 2 then		
			x800100_MakeKickTime( varMap, varPlayer )				
		elseif nOPMode == 3 then	
			x800100_DoLoginAnswer( varMap, varPlayer )	
		end
		return 1
	end

	local encryptCount = GetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_COUNT )

	if encryptCount == 0 then
		SetPlayerRuntimeData( varMap, varPlayer, RD_LAST_ENCRYPT_INDEX, -1 )
	end

	if encryptCount == 0 or encryptCount >= 5 then

		
		SetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_COUNT, 0 )
		local currIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_INDEX )
		SetPlayerRuntimeData( varMap, varPlayer, RD_LAST_ENCRYPT_INDEX, currIndex )
		SetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_INDEX, enctyptId )
		encryptCount = 0

	end

	SetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_COUNT, encryptCount+1 )
	
	
	local unrespondCount = GetPlayerRuntimeData( varMap, varPlayer, RD_ENCRYPT_UNRESPOND_TIME )
	if unrespondCount >= 5 then
		
		return 0
	end

	SetPlayerRuntimeData( varMap, varPlayer, RD_ENCRYPT_UNRESPOND_TIME, unrespondCount+1 )

	
	local currIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_INDEX )
	local varScript,result,fnName = GetEncryptInfo( varMap, varPlayer ,currIndex )

	
	LuaCallNoclosure( varScript, fnName, varMap, varPlayer ,currIndex )

	return 1
	
end







function x800100_CheckLoginAnswer( varMap, varPlayer )	
	
	local answer = GetLoginAnswer(varMap, varPlayer)
	return answer

end



function x800100_DoLoginAnswer( varMap, varPlayer )	
	
	if GetGameOpenById(1020)>0 then

		if LuaCallNoclosure(300824, "StartDati", varMap, varPlayer, 1020)>0 then
		end
		
	end

end

function x800100_ProcDatiSuccess(varMap,varPlayer)
end

function x800100_ProcDatiFail(varMap,varPlayer)
end




function x800100_ProcCheckEncrypt( varMap, varPlayer, result )	
	
	local currIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_CURR_ENCRYPT_INDEX )
	local varScript,tabResult,fnName = GetEncryptInfo( varMap, varPlayer ,currIndex )

	if result == tabResult then

		
		SetPlayerRuntimeData( varMap, varPlayer, RD_ENCRYPT_UNRESPOND_TIME, 0 )
		return 1

	else

		local lastIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_LAST_ENCRYPT_INDEX )	
		if lastIndex ~= -1 then
			local scriptId2,tabResult2,fnName2 = GetEncryptInfo( varMap, varPlayer ,lastIndex )
			if result == tabResult2 then
				
				SetPlayerRuntimeData( varMap, varPlayer, RD_ENCRYPT_UNRESPOND_TIME, 0 )
				return 1
			end
		end

	end

	
	return 0

end



function x800100_MakeKickTime( varMap, varPlayer )	
	
	local kickTime = GetEncryptKickTime(varMap, varPlayer)

	if kickTime ~= NumberCastIntToUInt(-1) then
		
		return 
	end

	
	kickTime = mod(600,2400)
	SetEncryptKickTime(varMap, varPlayer,kickTime)

end
