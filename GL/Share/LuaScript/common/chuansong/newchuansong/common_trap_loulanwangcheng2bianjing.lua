

x550101_var_FileId = 550101
x550101_var_TransPos0="loulanwangcheng2bianjing"
x550101_var_TransPos1="laiyinwangcheng2bianjing"
x550101_var_TransPos2="kunlunwangcheng2bianjing"
x550101_var_TransPos3="dunhuangwangcheng2bianjing"


function x550101_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	if varMap == 50 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550101_var_TransPos0)
	elseif varMap == 150 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550101_var_TransPos1)
	elseif varMap == 250 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550101_var_TransPos2)
	elseif varMap == 350 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550101_var_TransPos3)
	end

end


function x550101_ProcMapTimerTick( varMap, monsterobjid )

end


function x550101_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550101_ProcEventEntry( varMap, monsterobjid )

end

