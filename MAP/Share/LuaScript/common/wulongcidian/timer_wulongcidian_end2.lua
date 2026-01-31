
x310187_var_FileId = 310187

function x310187_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )

	if GetWeek() ~= 0 then
		return
	end
	
	if varMap ~= 0 then
		return
	end
	
	if WULONGCIDIAN_STEPIN_COUNT  <= 0 then
		return
	end
	
	local varMsg = ""
	local varCount =0
	local varMsg1=""
	local msg2=""
	local msg3=""

	for varI=1, WULONGCIDIAN_STEPIN_COUNT do
		varCount = varCount +1
		if varCount<=10 then
			varMsg1 = varMsg1.."#Y "..WULONGCIDIAN_STEPIN_NAME[varI]
		elseif varCount<=20 then
			msg2 = msg2.."#Y "..WULONGCIDIAN_STEPIN_NAME[varI]
		else
			msg3 = msg3.."#Y "..WULONGCIDIAN_STEPIN_NAME[varI]
		end
		SendSystemPost(varMap, WULONGCIDIAN_STEPIN_NAME[varI], "恭喜您获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！" )
		
	end
	if varCount<=10 then
		varMsg = "#G恭喜"
		varMsg = varMsg..varMsg1.."#G获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
		return
	end
	
	if varCount<=20 then
		varMsg = "#G恭喜"
		varMsg = varMsg..varMsg1.."#G获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！"
		LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
	 varMsg = "#G恭喜"
	 varMsg = varMsg..msg2.."#G获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
		return
	end
	
	 varMsg = "#G恭喜"
	varMsg = varMsg..varMsg1.."#G获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
	varMsg = "#G恭喜"
	varMsg = varMsg..msg2.."#G获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
	varMsg = "#G恭喜"
	varMsg = varMsg..msg3.."#G获得乌龙辞典第三轮参赛资格，请在下午16：30-17：00之内前往大都找到大内总管海总管参加最终决赛！"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
	
end
