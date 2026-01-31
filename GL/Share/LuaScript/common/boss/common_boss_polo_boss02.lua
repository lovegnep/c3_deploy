x305012_var_FileId = 305012


x305012_var_MonsterAppeared       = "莫斯科大公--出现在领地 莫斯科"


x305012_var_BossTable             = { 
                                    { bossId = 9751, posX = 31, posZ = 154, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX =  167, posZ =  94, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX =  174, posZ = 166, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 74, posZ = 185, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 131, posZ =  175, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 174, posZ = 136, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX =  48, posZ =  49, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX =  67, posZ = 125, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 58, posZ = 168, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 170, posZ =  190, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 196, posZ = 147, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 
                                    { bossId = 9751, posX = 168, posZ =  188, ai = 0, aiscript = 976, objGuid = -1, campId = 21, liveTime = -1, bossName = "伊凡雷帝", bossTitle = "莫斯科大公" }, 								
}

function x305012_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
	
	if varMap == 17 then 
		local boss = x305012_var_BossTable[ random( 1, getn( x305012_var_BossTable) ) ]
		CreateMonster( varMap, boss.bossId, boss.posX, boss.posZ, boss.ai, boss.aiscript, x305012_var_FileId, boss.objGuid, boss.campId, 60*60*1000, 0, boss.bossName, boss.bossTitle)
		LuaAllScenceM2Wrold( varMap, x305012_var_MonsterAppeared, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold( varMap, "莫斯科大公--出现在领地 莫斯科", 5, 1)
		LuaAllScenceM2Wrold(varMap, "莫斯科大公--出现在领地 莫斯科", CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, "莫斯科大公--出现在领地 莫斯科", CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, "莫斯科大公--出现在领地 莫斯科", CHAT_MAIN_RIGHTDOWN, 1)
	end
end


function x305012_ProcDie( varMap, varPlayer, varKiller)
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
	local varMsg1 = "莫斯科大公--被"..countryName..varName.."击杀"
    LuaAllScenceM2Wrold( varMap, varMsg1, 5, 1)
	local msg2 ="莫斯科大公已被击败！"
	LuaAllScenceM2Wrold(varMap, msg2, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, msg2, CHAT_LEFTDOWN, 1)
	LuaAllScenceM2Wrold(varMap, msg2, CHAT_MAIN_RIGHTDOWN, 1)
end
