
x310102_var_FileId 		= 310102
x310102_var_guardGuid 	= {129721,129722,129723,129724,129725}
x310102_var_minsterGuid	= 129720
x310102_var_Time			= { min = 1200,max = 2359 }
x310102_var_DieMessage	= "#R敌方人多势众，御前护卫已经战死，#Y朵尔只殿下#R#aB{goto_%d,%d,%d}(%d,%d)#aE危在旦夕！殿下遇害国王将会被解除职务，请全体国民火速前往增援！"







function x310102_CheckWeekValid( nPreTime )
	
	if nPreTime < 0 then
		return 1
	end
	
	local nTime = GetCurrentTime()
	local nTime = nTime - nPreTime
	if nTime >= 7*24*3600 then
		return 1
	end
	
	return 0
end

function x310102_GetCountryParam( nSelfCountry )
	
	return CD_INDEX_MINSTER_KILLDATE
end




function x310102_ProcEventEntry( varMap ,varPlayer, varTalknpc )
end


function x310102_ProcDie( varMap,varPlayer,varKiller )

	
	if GetGameOpenById(1026) <= 0 then
		return
	end
	
	
	local ObjType = GetObjType(varMap, varKiller)	
	if ObjType == 3 then
		ObjType = 1
		varKiller = GetOwnerID(varMap, varKiller)
	end
	
	
	if IsPlayerStateNormal(varMap,varKiller)~=1 then
		return
	end

	



		


	
	
	local varCountry = -1
	if varMap == 51 then
		varCountry = 0
	elseif varMap == 151 then
		varCountry = 1
	elseif varMap == 251 then
		varCountry = 2
	elseif varMap == 351 then
		varCountry = 3
	else
		return
	end
	
	
	
	local nKingGUID = CountryGetKingGUID(varCountry)
	if nKingGUID == -1 then
		local varName = GetName(varMap,varKiller)
		local varMsg = "很遗憾，目前该国没有国王。"
		LuaScenceM2Player(varMap,varKiller,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varKiller,varMsg,varName,3,1)
		return
	end
	

	
	local playerGUID = GetPlayerGUID(varMap,varKiller)
	if playerGUID == nil then
		playerGUID = -1
	end
	local playerCountry = GetCurCountry(varMap,varKiller)
	local playerCP = x310102_GetCountryParam(varCountry)
	GetCountryQuestDataNM(varMap,playerGUID,varCountry, playerCP, x310102_var_FileId,-1,"ProcReturn",1)
	
end

function x310102_ProcReturn( varMap, varPlayer,QuestData,varQuest )

	
	if GetGameOpenById(1026) <= 0 then
		return
	end
	
	
	if x310102_CheckWeekValid(QuestData ) ~= 1 then
		
		local varName = GetName(varMap,varPlayer)
		local varMsg = "#R一周之内击杀#Y朵尔只#R只能导致该国国王下台一次。"
		local msg3 ="#R击杀无效！"
		LuaScenceM2Player(varMap,varPlayer,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msg3,varName,3,1)
		
		return
	end
	
	
	local hour,minute,sec =GetHourMinSec();
	local now = hour *100 + minute
	if now < x310102_var_Time.min or now > x310102_var_Time.max then
		
		local varName = GetName(varMap,varPlayer)
		local varMsg = "#R在12：00-0：00期间击杀#Y朵尔只#R才会导致该国国王下台。"
		local msg2 ="#R时间错误！"
		LuaScenceM2Player(varMap,varPlayer,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msg2,varName,3,1)
		
		return
	end
	

	
	local varCountry = -1
	if varMap == 51 then
		varCountry = 0
	elseif varMap == 151 then
		varCountry = 1
	elseif varMap == 251 then
		varCountry = 2
	elseif varMap == 351 then
		varCountry = 3
	else
		return
	end
	
	
	
	local nKingGUID = CountryGetKingGUID(varCountry)
	if nKingGUID == -1 then
		local varName = GetName(varMap,varPlayer)
		local varMsg = "很遗憾，目前该国没有国王。"
		LuaScenceM2Player(varMap,varPlayer,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varPlayer,varMsg,varName,3,1)
		return
	end
	
	
	




	
	
	
	








	
	
	
	local varMsg = format(x310102_var_DieMessage,varMap,96,100,96,100)
	local varMsg1 ="#R御前护卫战死！"
	
	LuaAllScenceM2Country( varMap,varMsg,varCountry, 2,1)
	LuaAllScenceM2Country( varMap,varMsg1,varCountry, 3,1)
	
	
	GamePlayScriptLog(varMap,varPlayer,1311)
						
	
end
