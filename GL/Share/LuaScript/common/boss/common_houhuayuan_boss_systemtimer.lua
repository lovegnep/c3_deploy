


x306010_var_FileId = 306010

x306010_var_CreatePositions = {
																{ type = 18520, title = "武士之王" },
																{ type = 18521, title = "剑侠之王" },
																{ type = 18522, title = "骑射之王" },
																{ type = 18523, title = "火枪之王" },
																{ type = 18524, title = "先知之王" },
																{ type = 18525, title = "萨满之王" },
																{ type = 18526, title = "十字军之王" },
																{ type = 18527, title = "圣火使之王" },
																{ type = 18528, title = "刺客之王" },
																{ type = 18529, title = "近卫军之王" },
																{ type = 18530, title = "隐修士之王" },
																{ type = 18531, title = "僧侣之王" },
															}
															
x306010_var_Pos = {
										{x = 289.920654, z = 142.17128 },
										{x = 246.913635, z = 175.173599},
										{x = 271.883484, z = 221.05127 },
										{x = 328.450867, z = 220.792007},
										{x = 329.422485, z = 162.021011},
									} 
                    
function x306010_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )

	if varMap ~= 539 and varMap ~= 540 and varMap ~= 541 and varMap ~= 542 and varMap ~= 543 then
		return
	end
	
	local theMonster = {}
	for varI, item in x306010_var_Pos do
		local varMonster = random( 1, getn(x306010_var_CreatePositions) )
		local isOK = 0
		while ( isOK == 0 ) do
			isOK = 1		
			for varJ, itm in theMonster do
				if ( itm == varMonster ) then
					varMonster = varMonster + 1
					if ( varMonster > getn(x306010_var_CreatePositions) ) then
						varMonster = 1
					end
					isOK = 0
				end
			end
		end
		
		theMonster[varI] = varMonster
		
		local varObj, objGuid = CreateMonster( varMap, x306010_var_CreatePositions[varMonster].type, item.x, item.z, 1, -1, x306010_var_FileId, -1, 21, 60*60*1000, 0, "", x306010_var_CreatePositions[varMonster].title, -1)
		
	end

end


function x306010_ProcDie(varMap, varPlayer, varKiller)
	
	if IsObjValid( varMap, varKiller ) ~= 1 then
		return
	end
	
	local title = GetMonsterTitle(varMap, varPlayer)
	local nKillerType = GetObjType(varMap, varKiller)
	local nOwnerId = varKiller
	if nKillerType== 3 then
		nOwnerId = GetOwnerID(varMap, varKiller)		
	end
	
	local killerName = GetName(varMap, nOwnerId)
	local countryId = GetCurCountry(varMap, nOwnerId)
	local countryName = GetCountryName(countryId)

	local varMsg1 = title.."已顺利被"..countryName..killerName.."击败！"
	local msg2 = title.."已被击败！"

--if  varMap >= 2 and varMap<= 351 then
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
		LuaThisScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
		LuaThisScenceM2Wrold(varMap, msg2, CHAT_MAIN_RIGHTDOWN, 1)
--end

	GamePlayScriptLog(varMap, varKiller, 501)
	
end

function x306010_ProcGetRuoGuoFlag(varMap, varPlayer,QuestData,varQuest)
end

