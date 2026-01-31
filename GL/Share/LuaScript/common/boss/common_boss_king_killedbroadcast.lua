x305002_var_FileId = 305002




function x305002_ProcDie( varMap, varPlayer, varKiller)
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
	local varTitle =GetMonsterTitle(varMap, varPlayer)
	--local MapName = GetSceneInfo(varMap, "NAME")
	local CampId =GetSceneCamp(varMap)
	local CurrentCountryName =GetCountryName(CampId - 16)
	local varName = GetName( varMap, varKiller)
  local countryId = GetCurCountry( varMap, varKiller)
	local countryName = GetCountryName(countryId)
	local varMsg = CurrentCountryName..varTitle.."±»"..countryName..varName.."»÷É±£¡"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
end

function x305002_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
end
