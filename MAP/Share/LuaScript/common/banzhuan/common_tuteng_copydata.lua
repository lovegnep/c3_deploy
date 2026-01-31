x311104_var_FileId = 311104

function x311104_ProcSwitchDay(varMap, varPlayer)
	local curDate = GetDayOfYear()
	local Date = x311104_GetDate(varMap, varPlayer, MD_CURRENT_BANZHUAN_DATE[1], MD_CURRENT_BANZHUAN_DATE[2], MD_CURRENT_BANZHUAN_DATE[3])
	local DateCount = x311104_GetDateCount(varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT[1], MD_CURRENT_BANZHUAN_DAYCOUNT[2], MD_CURRENT_BANZHUAN_DAYCOUNT[3])
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*3600+minute*60+sec
	
	if Date ~= curDate then
		x311104_SetDate(varMap, varPlayer, MD_LAST_BANZHUAN_DATE[1], MD_LAST_BANZHUAN_DATE[2], MD_LAST_BANZHUAN_DATE[3], Date)
		x311104_SetDateCount(varMap, varPlayer, MD_LAST_BANZHUAN_DAYCOUNT[1], MD_LAST_BANZHUAN_DAYCOUNT[2], MD_LAST_BANZHUAN_DAYCOUNT[3], DateCount)
		x311104_SetDate(varMap, varPlayer, MD_LAST_BANZHUAN_GET_PRIZE[1], MD_LAST_BANZHUAN_GET_PRIZE[2], MD_LAST_BANZHUAN_GET_PRIZE[3], 0)
		x311104_SetDate(varMap, varPlayer, MD_CURRENT_BANZHUAN_DATE[1], MD_CURRENT_BANZHUAN_DATE[2], MD_CURRENT_BANZHUAN_DATE[3], curDate)
		x311104_SetDateCount(varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT[1], MD_CURRENT_BANZHUAN_DAYCOUNT[2], MD_CURRENT_BANZHUAN_DAYCOUNT[3], 0)
	end
end

function x311104_SetDate(varMap, varPlayer, nMDIndex, nOffset, nSize, day)
	SetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize, day)
end

function x311104_SetDateCount(varMap, varPlayer, nMDIndex, nOffset, nSize, varCount)
	SetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize, varCount)
end

function x311104_GetDate(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varDate= GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varDate
end

function x311104_GetDateCount(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varDaycount =  GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varDaycount
end
