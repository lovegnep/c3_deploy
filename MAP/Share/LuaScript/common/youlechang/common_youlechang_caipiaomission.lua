


x310338_var_FileId = 310338

function x310338_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	if varMap ~= 39 then
			return
	end
	
	if 0 == varParam1 then 
		SetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1, 1000)
		SetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO1, -1)
		SetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO1, -1)
		SetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO1, -1)
		
		SetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO2, -1)
		SetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO2, -1)
		SetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO2, -1)
		SetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO2, -1)
	elseif 1 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO1, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	elseif 2 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO1, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	elseif 3 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO1, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	elseif 4 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO2, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	elseif 5 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO2, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	elseif 6 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO2, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	elseif 7 == varParam1 then 
		local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
		if varCount <= 1000 then
			return
		end
		local rnd = random(1000, varCount-1)
		SetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO2, rnd)
		
		local varMsg = format("本期乐透彩票开出的号码是:#G%d#R，请中奖的玩家前往#G乐透彩票大使（126，93）#R处领取大奖！", rnd)
		local varMsg1 = format("本期乐透彩票开出的号码是:%d，请中奖的玩家前往乐透彩票大使（126，93）处领取大奖！", rnd)
		LuaThisScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	end
end
