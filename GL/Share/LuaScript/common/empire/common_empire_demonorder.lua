--皇帝魔君令处理， 刷新一次18魔君

x310270_var_FileId = 310270

x310270_var_CreatePositions = 
							{
								{varMap=	472	,pos={{posX=	254	,posZ=	106 }}	,MonsterType=	18400	,varCount=	1	,ai=	18	,aiscript=	961, title="魔君幻像"  },	 	--沙城中心
								{varMap=	472	,pos={{posX=	112	,posZ=	113 }}	,MonsterType=	3216	,varCount=	1	,ai=	1	,aiscript=	971, title="伏尔加之王"  },	 	--沙城左
								{varMap=	472	,pos={{posX=  	385 ,posZ=  98}}	,MonsterType=	3202	,varCount=	1	,ai=	1	,aiscript=	975, title="波兰之王"  },	 	--沙城右
								{varMap=	472	,pos={{posX=  	255 ,posZ=  297}}	,MonsterType=	9785	,varCount=	1	,ai=	1	,aiscript=	972, title="条顿之王"  },	 	--沙城下平台
								{varMap=	472	,pos={{posX=	439	,posZ=	302 }}	,MonsterType=	9786	,varCount=	1	,ai=	1	,aiscript=	976, title="哈布斯堡之王"  },	--沙城楼兰
								{varMap=	472	,pos={{posX=	419	,posZ=	421}}	,MonsterType=	9787	,varCount=	1	,ai=	1	,aiscript=	975, title="大马士革之王"  },	--沙城敦煌
								{varMap=	472	,pos={{posX=	249	,posZ=	462}}	,MonsterType=	9788	,varCount=	1	,ai=	1	,aiscript=	974, title="圣域之王"  },	 	--沙城天山
								{varMap=	472	,pos={{posX=	124	,posZ=	436 }}	,MonsterType=	3203	,varCount=	1	,ai=	1	,aiscript=	971, title="匈牙利之王"	 },	 	--沙城昆仑
								{varMap=	472	,pos={{posX=	326	,posZ=	394}}	,MonsterType=	3205 	,varCount=	1	,ai=	1	,aiscript=	974, title="埃及之王"	 },	 	--沙城玄石驿站
								{varMap=	472	,pos={{posX=	73	,posZ=	307}}	,MonsterType=	9784	,varCount=	1	,ai=	1	,aiscript=	976, title="撒马尔罕之王"  },		--沙城咸海湾

						}

x310270_var_CreateDay = 0
x310270_var_KillCount19 = 0
				
function x310270_ProcEventEntry( varMap )
			--print("-----------1")
			local empireCountry = GetEmpireCountry()
			local empireMap = -13
			if empireCountry == 0 then
					empireMap = 472
			elseif empireCountry == 1 then
					empireMap = 472
			elseif empireCountry == 2 then
					empireMap = 472
			elseif empireCountry == 3 then
					empireMap = 472
			end
			
			
			if varMap ~= 44 and varMap ~= 3 and varMap ~= empireMap then
					return
			end
	
	        local createMonstCountForDebug = 0
	        
			for varI, item in x310270_var_CreatePositions do
					if item.varMap == varMap then
							for j=1, item.varCount do
									local r = random(1,1)
									if r < 1 then 
										r = 1 
									end
									if r > 1 then 
										r = 1
									end
									local pos = item.pos[r]
									
									local rx = random(-3,3)
									local varX = pos.posX + rx
									local rz = random(-3,3)
									local z = pos.posZ + rz
									local varObj, objGuid =CreateMonster( varMap, item.MonsterType, varX, z, item.ai, item.aiscript, x310270_var_FileId, -1, 21, 60*60*1000, 0, "", item.title)
									if varObj >= 0 then
									    createMonstCountForDebug = createMonstCountForDebug + 1
									end
							end	
					end
			end
			
			x310270_var_CreateDay = GetDayOfYear()
			x310270_var_KillCount19 = 0
			--SetCountryQuestData(varMap, 0, CD_INDEX_MOJUN_KILL_COUNT, 0)
			
			WriteLog(1, format("x310270_ProcEventEntry varMap=%d, createMonstCount=%d", varMap, createMonstCountForDebug ) )
end


function x310270_ProcDie(varMap, varPlayer, varKiller)
	
	if IsObjValid( varMap,varKiller ) ~=1 then
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
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, msg2, CHAT_MAIN_RIGHTDOWN, 1)
--end

	GamePlayScriptLog(varMap, varKiller, 501)

end

