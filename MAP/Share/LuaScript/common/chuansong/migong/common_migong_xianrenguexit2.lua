


x550312_var_FileId = 550312
x550312_var_TransPos={"xianrenguexittwo1","xianrenguexittwo2","xianrenguexittwo3","xianrenguexittwo4"}



function x550312_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	local varCountry = GetCurCountry(varMap, varPlayer)
	if varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550312_var_TransPos[1])
	elseif varCountry == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550312_var_TransPos[2])
	elseif varCountry == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550312_var_TransPos[3])
	elseif varCountry == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550312_var_TransPos[4])
	end

end


function x550312_ProcMapTimerTick( varMap, monsterobjid )

end


function x550312_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550312_ProcEventEntry( varMap, monsterobjid )

end

