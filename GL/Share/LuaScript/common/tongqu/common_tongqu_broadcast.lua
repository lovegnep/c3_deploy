function x300325_ProcTimerDoingStart( varMap, actId, Param1, Param2, Param3, Param4, Param5 )
	
		if varMap == 0 then
			TONGQU_COMMIT_NUM = 0
		end
		local message = "【活动】童年的回忆将在20：00开始，请40级以上玩家到大都活动使者处接取任务"
		LuaThisScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaThisScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		SetSystemTimerTick( varMap, 300325, "BroadCast1", varAct, 60*1000*10  ) 
	
end


function x300325_BroadCast1(varMap, varAct, varTime)
	local message = "【活动】童年的回忆开始了，请40级以上玩家到大都活动使者处接取任务"
	LuaThisScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
	LuaThisScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
	SetSystemTimerTick( varMap, 300325, "BroadCast2", varAct, 60*1000*30  ) 
end

function x300325_BroadCast2(varMap, varAct, varTime)
	local message = "【活动】童年的回忆结束了，请随时关注系统公告"
	LuaThisScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
	LuaThisScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
end
