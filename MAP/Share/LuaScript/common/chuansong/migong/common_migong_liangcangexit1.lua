

x550305_var_FileId = 550305
x550305_var_TransPos1="liangcangexitone1"
x550305_var_TransPos2="liangcangexitone2"
x550305_var_TransPos3="liangcangexitone3"
x550305_var_TransPos4="liangcangexitone4"



function x550305_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	local varCountry = GetCurCountry(varMap , varPlayer )
	
	if varCountry == 0 then 
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550305_var_TransPos1)	
	elseif varCountry == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550305_var_TransPos2)
	elseif varCountry == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550305_var_TransPos3)
	elseif varCountry == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550305_var_TransPos4)
	end
end


function x550305_ProcMapTimerTick( varMap, monsterobjid )

end


function x550305_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550305_ProcEventEntry( varMap, monsterobjid )

end

