



x310410_var_FileId = 310410

x310410_var_GameId = 1065




x310410_var_TableMix = {
Level = {60, 70, 80, 90},
Time = {3 * 24 * 3600, 7 * 24 * 3600, 14 * 24 * 3600, 21 * 24 * 3600, 30 * 24 * 3600,60 * 24 * 3600},
Exp = {
{38, 88, 138, 188},
{76, 176, 276, 376},
{152, 352, 552, 752},
{190, 440, 690, 940},
{228, 528, 828, 1128},
{228, 528, 828, 1128},}}




function x310410_ProcMapPlayerNewConnectEnter(varMap, varPlayer)		
	if GetGameOpenById(x310410_var_GameId)<=0 then
		return
	end

	local lastLogoutTime = GetLastLogoutTime(varMap, varPlayer)
	local	thisTime = GetCurrentTime() - lastLogoutTime			

	
	
		
	local nLevel = GetLevel( varMap,varPlayer )
	local Exp1 = x310410_CompareLevel(varMap, varPlayer)
	local Exp2 = x310410_CompareTime(varMap, varPlayer)	
	if x310410_CompareLevel(varMap, varPlayer) == 0 or x310410_CompareTime(varMap, varPlayer) == 0 or thisTime >= 63072000 then	
		WriteLog(1, format("x310410_OffLineTime varMap=%d PlayerGUID=%u Exp1=%d Exp2=%d lastLogoutTime=%u thisTime=%u", varMap, GetGUID(varMap, varPlayer), Exp1, Exp2, lastLogoutTime, thisTime))		
		return			
	elseif x310410_CompareLevel(varMap, varPlayer) > 0 and x310410_CompareTime(varMap, varPlayer) > 0 then
		local nExp = floor (nLevel * x310410_var_TableMix.Exp[Exp2][Exp1] * thisTime / 60)	
		if nExp >= 20000000000 then
			nExp = 20000000000
		else
			nExp = floor (nLevel * x310410_var_TableMix.Exp[Exp2][Exp1] * thisTime / 60)						
		end					
	AddExp(varMap, varPlayer, nExp)
	WriteLog(1, format("x310410_AddOffLineExp varMap=%d PlayerGUID=%u Exp1=%d Exp2=%d %s lastLogoutTime=%u thisTime=%u", varMap, GetGUID(varMap, varPlayer), Exp1, Exp2, "获得经验奖励="..nExp, lastLogoutTime, thisTime))
	Msg2Player(varMap, varPlayer, "您获得了离线经验补偿"..nExp.."点。" , 8, 1)	
	SendSystemPost(varMap, GetName(varMap, varPlayer), "您获得了离线经验补偿"..nExp.."点。")		
	
		local year,month,day = GetYearMonthDay()
		if 	year == 2011 then
			if GetDayOfYear() >= 299 and GetDayOfYear() <= 331 then
				if Exp2 ==6 then
					AddQuestNM( varMap, varPlayer, 4399)
					GamePlayScriptLog(varMap, varPlayer, 2525)
					SetQuestByIndex(varMap,varPlayer,GetQuestIndexByID(varMap,varPlayer,4399),0,1)
					SetQuestByIndex(varMap,varPlayer,GetQuestIndexByID(varMap,varPlayer,4399),7,1)	
				end
			end
		end
	end
end





function x310410_CompareLevel(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local varIndex = 0		
	for varI, item in x310410_var_TableMix.Level do
		if nLevel >= item then
			varIndex = varIndex + 1
		else
			return varIndex
		end			
	end
	return varIndex
end





function x310410_CompareTime(varMap, varPlayer)
	local lastLogoutTime = GetLastLogoutTime(varMap, varPlayer)
	local thisTime = GetCurrentTime() - lastLogoutTime      
	local varIndex = 0
	for varI, item in x310410_var_TableMix.Time do
		if thisTime >= item then
			varIndex = varIndex + 1
		else
			return varIndex
		end			
	end
	return varIndex
end
