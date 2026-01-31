x310003_var_FileId = 310003
x310003_var_GameId   = 1069

x310003_var_MonsterAppeared       = "恐怖的暗·海都大王出现在中兴府！"



function x310003_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)

	if GetGameOpenById(x310003_var_GameId) ~= 1 then
		return
	end
	
	if varMap == 3 then 
	local varRet = 0
		varRet = CreateMonster( varMap, 18400, 102, 129, 18, 961, x310003_var_FileId, -1, 21, 60*60*1000, 0, "", "魔君幻像")
		SetPatrolId(varMap, varRet, 0)
		LuaAllScenceM2Wrold( varMap, x310003_var_MonsterAppeared, 5, 1)
		LuaAllScenceM2Wrold( varMap, x310003_var_MonsterAppeared, CHAT_MAIN_RIGHTDOWN, 1)
	end
end


function x310003_ProcDie( varMap, varPlayer, varKiller)
	local ObjType = GetObjType(varMap,varKiller)
	if ObjType == 3 then		
		ObjType = 1
		varKiller = GetOwnerID(varMap, varKiller)
	end
	if ObjType ~= 1 then
		return
	end
	if IsPlayerStateNormal( varMap,varKiller ) ~= 1 then
		return
	end
	local varName = GetName( varMap, varKiller)
    local countryId = GetCurCountry( varMap, varKiller)
	local countryName = GetCountryName(countryId)
	local varMsg1 = "暗·海都大王已被"..countryName..varName.."击败！"
    LuaAllScenceM2Wrold( varMap, varMsg1, 5, 1)
	local msg2 ="暗·海都大王已被击败！"
	LuaAllScenceM2Wrold(varMap, msg2, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, msg2, CHAT_LEFTDOWN, 1)
	LuaAllScenceM2Wrold(varMap, msg2, CHAT_MAIN_RIGHTDOWN, 1)
end
