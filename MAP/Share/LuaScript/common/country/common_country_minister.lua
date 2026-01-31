
x310101_var_FileId 				= 310101					
x310101_var_minsterGuid			= 129720					
x310101_var_Time					= { min = 1930,max = 2259 }	


x310101_var_DieLog				= "Minister = 310101, varMap=%d,varCountry = %d,kingGUID=%X ,killerGUID=%X"
x310101_var_PreTime				=  0						
x310101_var_AreaTipsInterval		=  2						
x310101_var_AreaTips				= "#R警报！警报！本国的#Y战神之旗#R#aB{goto_%d,%d,%d}(%d,%d)#aE正在遭受敌国的攻击，如果被敌国击倒旗帜，国王将会被剥夺王位，请全体国民火速前往增援！"	
x310101_var_EnterDay					=	{1,2,3,4,5,6};





function x310101_CheckWeekValid( nPreTime )

	if nPreTime> 0 then
		local nTime = GetCurrentTime()/86400
		nTime = nTime - nPreTime
		if nTime < 7 then
			return 0
		end
		
		local bFind = -1
		local weekDay = GetWeek()
		
		for varI, item in x310101_var_EnterDay do
			if weekDay==item then
				bFind = 1
				break;
			end
		end
		
		
		if bFind == -1 then
			return 0
		end
		
		return 1
	else
		
		local bFind = -1
		local weekDay = GetWeek()
		for varI, item in x310101_var_EnterDay do
			if weekDay==item then
				bFind = 1
				break;
			end
		end
		
		
		if bFind == -1 then
			return 0
		end
		
		return 1
	end
	
end


function x310101_GetCountryParam( nSelfCountry )
	
	return CD_INDEX_MINSTER_KILLDATE
end




function x310101_ProcEventEntry( varMap ,varPlayer, varTalknpc )
end


function x310101_ProcMapTimerTick( varMap,now)
end

function x310101_ProcDie( varMap,varPlayer,varKiller )

	
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
	if varMap == 50 then
		varCountry = 0
	elseif varMap == 150 then
		varCountry = 1
	elseif varMap == 250 then
		varCountry = 2
	elseif varMap == 350 then
		varCountry = 3
	else
		return
	end
	

	
	local nKingGUID = CountryGetKingGUID(varCountry)
	if nKingGUID == -1 then
		local kingCountryName = GetCountryName(varCountry)
		local varName = GetName(varMap,varKiller)
		local varMsg = "很遗憾，目前"..kingCountryName.."没有国王"
		LuaScenceM2Player(varMap,varKiller,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varKiller,varMsg,varName,3,1)
		return
	end

	
	if varCountry == GetCurCountry(varMap,varKiller) then
		return
	end	
	
	
	
	
	
		
		
			
		
	
	
	
		
		
		
		
		
		
		
		
	

	
	local playerGUID = GetPlayerGUID(varMap,varKiller)
	if playerGUID == nil then
		playerGUID = -1
	end
	
	local playerCP = x310101_GetCountryParam(varCountry)
	GetCountryQuestDataNM(varMap,playerGUID,varCountry, playerCP, x310101_var_FileId,-1,"ProcReturn",1)
end

function x310101_ProcReturn( varMap, varPlayer,QuestData,varQuest )

	
	if GetGameOpenById(1026) <= 0 then
		return
	end
	
	
	if IsPlayerStateNormal(varMap,varPlayer)~=1 then
		return
	end
	
	
	local varCountry = -1
	if varMap == 50 then
		varCountry = 0
	elseif varMap == 150 then
		varCountry = 1
	elseif varMap == 250 then
		varCountry = 2
	elseif varMap == 350 then
		varCountry = 3
	else
		return
	end
	if x310101_CheckWeekValid(QuestData) ~= 1 then
		local kingCountryName = GetCountryName(varCountry)
		local varName = GetName(varMap,varPlayer)
		local varMsg = "#R一周之内摧毁#Y战神之旗#R只能导致"..kingCountryName.."国王下台一次，并且#G周日#R击杀无效。"
		local msg5="#R击杀无效！"
		LuaScenceM2Player(varMap,varPlayer,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msg5,varName,3,1)
		return
	end
	
	

	
	local hour,minute,sec =GetHourMinSec();
	local now = hour *100 + minute
	if now < x310101_var_Time.min or now > x310101_var_Time.max then
		local kingCountryName = GetCountryName(varCountry)
		local varName = GetName(varMap,varPlayer)
		local varMsg = "#R在19：30-23：00期间摧毁#Y战神之旗#R才能剥夺"..kingCountryName.."国王的王位。"
		local msg4= "#R时间错误！"
		LuaScenceM2Player(varMap,varPlayer,varMsg,varName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msg4,varName,3,1)
		return
	end
	
	
	
	
	local varCountry = -1
	if varMap == 50 then
		varCountry = 0
	elseif varMap == 150 then
		varCountry = 1
	elseif varMap == 250 then
		varCountry = 2
	elseif varMap == 350 then
		varCountry = 3
	else
		return
	end
	
	
	local nKingGUID = CountryGetKingGUID(varCountry)
	if nKingGUID == -1 then
		return
	end
	
	
	if varCountry == GetCurCountry(varMap,varPlayer) then
		return
	end
	
	
	local misterId = FindMonsterByGUID(varMap,x310101_var_minsterGuid)
	if IsObjValid(varMap,misterId ) ~= 1 or GetHp(varMap,misterId) <= 0 then
	
		local nTime = GetCurrentTime()/86400 	
	
		
		local playerCP = x310101_GetCountryParam(varCountry)
		SetCountryQuestData(varMap,varCountry,playerCP,nTime,0)
		SetGuildQuestData(varMap,GetCountryKingGuildIdNM(varCountry),GD_GUILD_INDEX_MINISTER_GUILD_DATE,nTime,0)
		
		
		CancelKing(varMap,varPlayer,nKingGUID,varCountry)
		
		
		local varMsg = format(x310101_var_DieLog,varMap,varCountry,nKingGUID,GetPlayerGUID(varMap,varPlayer) )
		WriteLog(1,varMsg);
	
		
		local kingCountryName = GetCountryName(varCountry)
		local killerCountryName = GetCountryName(GetCurCountry( varMap, varPlayer))
		local killerName = GetName( varMap, varPlayer)
		local varMsg1 = format("#R%s的战神之旗已被%s#R的%s摧毁，国王被剥夺了王位！",kingCountryName,killerCountryName,killerName)
		local msg2 ="#R战神之旗被摧毁，国王被剥夺了王位！"
		LuaAllScenceM2Country( varMap,x310101_var_DieMessage,varCountry, 2,1)
		LuaAllScenceM2Country( varMap,msg2,varCountry, 2,1)
		LuaAllScenceM2Wrold(varMap, varMsg1, 5, 1)
		
		
		GamePlayScriptLog(varMap,varPlayer,1312)

	end
	
end




function x310101_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	

	
	if GetGameOpenById(1026) <= 0 then
		return
	end
	
	
	
	if IsPlayerStateNormal(varMap,varPlayer)~=1 then
		return
	end
	
	
	
	local hour,minute,sec =GetHourMinSec();
	local now = hour *100 + minute
	if now < x310101_var_Time.min or now > x310101_var_Time.max then
		return
	end

	
	
	local varCountry = -1
	if varMap == 50 then
		varCountry = 0
	elseif varMap == 150 then
		varCountry = 1
	elseif varMap == 250 then
		varCountry = 2
	elseif varMap == 350 then
		varCountry = 3
	else
		return
	end
	
	
	
	local nKingGUID = CountryGetKingGUID(varCountry)
	if nKingGUID == -1 then
		return
	end
	
	
	
	
	
	if varCountry == GetCurCountry(varMap,varPlayer) then
		return
	end
	
	

	
	
	local nCurMin = GetMinOfYear()
	local nInterval = nCurMin - x310101_var_PreTime
	if nInterval < x310101_var_AreaTipsInterval then
		return	
	end
	
	

	
	
	local playerGUID = GetPlayerGUID(varMap,varPlayer)
	if playerGUID == nil then
		playerGUID = -1
	end
	local playerCP = x310101_GetCountryParam(varCountry)
	GetCountryQuestDataNM(varMap,playerGUID,varCountry, playerCP, x310101_var_FileId,-1,"ProcReturn2",1)
	
	
	
end


function x310101_ProcReturn2( varMap, varPlayer,QuestData,varQuest )

	
	
	if GetGameOpenById(1026) <= 0 then
		return
	end
	
	
	
	if IsPlayerStateNormal(varMap,varPlayer)~=1 then
		return
	end

	
	
	local hour,minute,sec =GetHourMinSec();
	local now = hour *100 + minute
	if now < x310101_var_Time.min or now > x310101_var_Time.max then
		return
	end
	

	
	if x310101_CheckWeekValid(QuestData) ~= 1 then
		return
	end
	
	
	
	
	local varCountry = -1
	if varMap == 50 then
		varCountry = 0
	elseif varMap == 150 then
		varCountry = 1
	elseif varMap == 250 then
		varCountry = 2
	elseif varMap == 350 then
		varCountry = 3
	else
		return
	end
	
	
	
	
	local nKingGUID = CountryGetKingGUID(varCountry)
	if nKingGUID == -1 then
		return
	end
	
	
	
	
	if varCountry == GetCurCountry(varMap,varPlayer) then
		return
	end	
	
	
	
	
	local nCurMin = GetMinOfYear()
	local nInterval = nCurMin - x310101_var_PreTime
	if nInterval < x310101_var_AreaTipsInterval then
		return	
	end
	

	
	
	x310101_var_PreTime = nCurMin
	
	
	local misterId = FindMonsterByGUID(varMap,x310101_var_minsterGuid)
	if IsObjValid(varMap,misterId ) == 1 and GetHp(varMap,misterId) > 0 then
	
		local varMsg = format( x310101_var_AreaTips,varMap,284,189,284,189)
		local msg3 ="#R战神之旗受到敌国袭击！"
		
		LuaAllScenceM2Country( varMap,varMsg,varCountry, 2,1)
		LuaAllScenceM2Country( varMap,msg3,varCountry, 5,1)
	end
	
end




function x310101_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end
