x320024_var_FileId = 320024


function x320024_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	if varMap ~= 44 then
		return
	end	
	local CarId1, CarId2 = LuaCallNoclosure(320019, "GetSystemCarId", varMap, varPlayer)
	if CarId1 == varPlayer or CarId2 == varPlayer then
	DeleteBus(varMap, varPlayer,1)
	WriteLog(1, format("x320024_ProcAreaEntered: busid=%d", varPlayer))
	end

end



function x320024_ProcMapTimerTick( varMap, monsterobjid )

end


function x320024_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x320024_ProcEventEntry( varMap, monsterobjid )

end
