

function x310074_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
	
	
	
		
		
			if 0 == varMap then
				YUNYOU_COMMIT_NUM = 0
			end
			local message = "【个人】寿诞采办将在21：30开始，请40级以上的玩家到大都海总管处进行活动！"
			LuaThisScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
			LuaThisScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
			SetSystemTimerTick( varMap, 310074, "BroadCast1", varAct, 60*1000*10  ) 
		
		
	
	
end


function x310074_BroadCast1(varMap, varAct, varTime)
	local message = "【个人】寿诞采办已经开始了，请40级以上的玩家到大都海总管处进行活动！"
	LuaThisScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
	LuaThisScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
	SetSystemTimerTick( varMap, 310074, "BroadCast2", varAct, 60*1000*30  ) 
end

function x310074_BroadCast2(varMap, varAct, varTime)
	local message = "【个人】寿诞采办已经结束了，请随时关注公告！"
	LuaThisScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
	LuaThisScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
	
end
