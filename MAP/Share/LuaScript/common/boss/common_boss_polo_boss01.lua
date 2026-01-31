x305011_var_FileId = 305011


x305011_var_MinorBossTable        = { 
                                    { bossId = 9717, posX = 161, posZ = 141, ai = 0, aiscript = -1, objGuid = -1, campId = 21, liveTime = 1800000}, 
                                    { bossId = 9717, posX = 121, posZ = 141, ai = 0, aiscript = -1, objGuid = -1, campId = 21, liveTime = 1800000}, 
                                    { bossId = 9717, posX = 120, posZ = 115, ai = 0, aiscript = -1, objGuid = -1, campId = 21, liveTime = 1800000}, 
                                    { bossId = 9717, posX = 154, posZ = 115, ai = 0, aiscript = -1, objGuid = -1, campId = 21, liveTime = 1800000}, 
                                    { bossId = 9717, posX = 129, posZ = 121, ai = 0, aiscript = -1, objGuid = -1, campId = 21, liveTime = 1800000}, 
                                    { bossId = 9717, posX = 151, posZ = 129, ai = 0, aiscript = -1, objGuid = -1, campId = 21, liveTime = 1800000}, 
}


x305011_var_LiveTable				= { 0, 0, 0, 0, 0, 0, 0 }

function x305011_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    
    for varI, item in x305011_var_MinorBossTable do
        x305011_var_LiveTable[varI] = CreateMonster( varMap, item.bossId, item.posX, item.posZ, item.ai, item.aiscript, x305011_var_FileId, item.objGuid, item.campId, item.liveTime, 0, "加里曼丹女祭司" )
    end

    
    x305011_var_LiveTable[7] = CreateMonster( varMap, 9716, 143, 129, 0, 408, x305011_var_FileId, -1, 21, 1800000, 0, "萨拉曼陀", "加里曼丹大祭祀" )
	
	varMsg = "加里曼丹大祭祀出现在婆罗洲"
	msg3 = "加里曼丹大祭祀—萨拉曼陀再一次恢复了力量，出现在婆罗洲的中心地带"
	LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, msg3, CHAT_LEFTDOWN, 1)
end


function x305011_ProcDie( varMap, varPlayer, varKiller)
    local varName = GetName( varMap, varKiller)
    local countryId = GetCurCountry( varMap, varKiller)
    local ownerId = GetOwnerID( varMap, varKiller)
    if ownerId ~= -1 then
        
        varName = GetName( varMap, ownerId)
        countryId = GetCurCountry( varMap, ownerId)
    end

	if varPlayer == x305011_var_LiveTable[7] then
		local countryName = GetCountryName(countryId)
		local varMsg1 = "加里曼丹大祭祀-萨拉曼陀已被"..countryName..varName.."杀死！"
		LuaAllScenceM2Wrold( varMap, varMsg1, 5, 1)
        LuaAllScenceM2Wrold( varMap, varMsg1, 1, 1)
	else
		for varI, item in x305011_var_LiveTable do
			if varPlayer == item then
				local countryName = GetCountryName(countryId)
				local msg2 = "加里曼丹女祭司已被"..countryName..varName.."杀死！"
				LuaAllScenceM2Wrold( varMap, msg2, 5, 1)
                LuaAllScenceM2Wrold( varMap, msg2, 1, 1)
			end
		end
	end
end

