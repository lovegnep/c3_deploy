


x550310_var_FileId = 550310
x550310_var_TransPos={"xianrenguexitone1","xianrenguexitone2","xianrenguexitone3","xianrenguexitone4"}



function x550310_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	local varCountry = GetCurCountry(varMap, varPlayer)
	if varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550310_var_TransPos[1])
	elseif varCountry == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550310_var_TransPos[2])
	elseif varCountry == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550310_var_TransPos[3])
	elseif varCountry == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550310_var_TransPos[4])
	end

end


function x550310_ProcMapTimerTick( varMap, monsterobjid )

end


function x550310_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550310_ProcEventEntry( varMap, monsterobjid )

end

