


x310920_var_FileId = 310920
x310920_var_IsEnableId = 1070

x310920_var_CreatePositions = {
								{varMap=	36	,pos={{posX=	82 	,posZ=	206 },
																		{posX=	156 ,posZ=  233 },
																		{posX=	199	,posZ=	226 },
																		{posX=	145	,posZ=	179 },
																		{posX=	42 	,posZ=	186 },
																		{posX=	26 	,posZ=	221 },
																		{posX=	120	,posZ=	226 },
																		{posX=	166	,posZ=	150 },
																		{posX=	27 	,posZ=	108 },
																		{posX=	67 	,posZ=	146 },
																		{posX=	34 	,posZ=	157 },
																		{posX=	57 	,posZ=	232 },
																		{posX=	159	,posZ=	203 },
																		{posX=	120	,posZ=	156 },
																		{posX=	235	,posZ=	95  },
																		{posX=	228	,posZ=	158 },
																		{posX=	88 	,posZ=	169 },
																		{posX=	119	,posZ=	192 },
																		{posX=	190	,posZ=	208 },
																		{posX=	215	,posZ=	75  },
																		{posX=	229	,posZ=	188 },
																		{posX=	231	,posZ=	128 },
																		{posX=	190	,posZ=	165 },
																		{posX=	170	,posZ=	187 },
																		{posX=	236	,posZ=	210 }} },
																		
								{varMap=	37	,pos={{posX=	143	,posZ=	46  },
																		{posX=	120	,posZ=	33  },   
																		{posX=	76 	,posZ=	45  },
																		{posX=	122	,posZ=	91  },
																		{posX=	122	,posZ=	154 },
																		{posX=	172	,posZ=	138 },
																		{posX=	183	,posZ=	169 },
																		{posX=	218	,posZ=	223 },
																		{posX=	232	,posZ=	197 },
																		{posX=	214	,posZ=	178 },
																		{posX=	232	,posZ=	122 },
																		{posX=	187	,posZ=	84  },
																		{posX=	216	,posZ=	70  },
																		{posX=	211	,posZ=	108 },
																		{posX=	193	,posZ=	125 },
																		{posX=	220	,posZ=	145 },
																		{posX=	87 	,posZ=	111 },
																		{posX=	99 	,posZ=	70  },
																		{posX=	118	,posZ=	236 },
																		{posX=	33 	,posZ=	176 },
																		{posX=	98 	,posZ=	241 },
																		{posX=	52 	,posZ=	195 },
																		{posX=	147	,posZ=	119 },
																		{posX=	64 	,posZ=	121 },
																		{posX=	33 	,posZ=	105 },
																		{posX=	69 	,posZ=	165 },
																		{posX=	122	,posZ=	199 },
																		{posX=	96 	,posZ=	205 },
																		{posX=	156	,posZ=	159 },
																		{posX=	158	,posZ=	216 }} },	
																		
								{varMap=	38	,pos={{posX=  136 ,posZ=  102},
																		{posX=	144 ,posZ=	201},
																		{posX=	54  ,posZ=	230},
																		{posX=	188 ,posZ=	183},
																		{posX=	209 ,posZ=	128},
																		{posX=	95  ,posZ=	228},
																		{posX=	90  ,posZ=	108},
																		{posX=	81  ,posZ=	156},
																		{posX=	139 ,posZ=	32 },
																		{posX=	121 ,posZ=	174},
																		{posX=	161 ,posZ=	218},
																		{posX=	206 ,posZ=	168},
																		{posX=	29  ,posZ=	32 },
																		{posX=	29  ,posZ=	206},
																		{posX=	42  ,posZ=	63 },
																		{posX=	63  ,posZ=	137},
																		{posX=	25  ,posZ=	170},
																		{posX=	28  ,posZ=	91 },
																		{posX=	46  ,posZ=	120},
																		{posX=	104 ,posZ=	22 },
																		{posX=	67  ,posZ=	39 },
																		{posX=	182 ,posZ=	39 },
																		{posX=	98  ,posZ=	197},
																		{posX=	153 ,posZ=	64 },
																		{posX=	103 ,posZ=	139},
																		{posX=	113 ,posZ=	76 },
																		{posX=	228 ,posZ=	181},
																		{posX=	161 ,posZ=	158},
																		{posX=	227 ,posZ=	116},
																		{posX=	186 ,posZ=	110}} },	
																		
								{varMap=	15	,pos={{posX=  177 ,posZ=  166},
																		{posX=	168 ,posZ=	71 },
																		{posX=	51  ,posZ=	111},
																		{posX=	105 ,posZ=	156},
																		{posX=	157 ,posZ=	135},
																		{posX=	181 ,posZ=	99 },
																		{posX=	103 ,posZ=	135},
																		{posX=	118 ,posZ=	198},
																		{posX=	146 ,posZ=	188},
																		{posX=	117 ,posZ=	68 },
																		{posX=	196 ,posZ=	123},
																		{posX=	121 ,posZ=	91 },
																		{posX=	71  ,posZ=	70 },
																		{posX=	62  ,posZ=	152},
																		{posX=	86  ,posZ=	184}} },				 
							}

x310920_var_BonusItem 	= { 
	{rnd = 10000, varItem = 11020002} 
}

function x310920_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	if varMap ~= 36 and varMap ~= 37 and varMap ~= 38 and varMap ~= 15 then
		return
	end

	if GetGameOpenById( x310920_var_IsEnableId) <= 0 then
      return
  end


	
	

	for varI, item in x310920_var_CreatePositions do
		if item.varMap == varMap then
			for j, itemPos in item.pos do
			CreateMonster( varMap, 11000, itemPos.posX, itemPos.posZ, 1, 975, x310920_var_FileId, -1, 21, 30*60*1000, 0)
			end
		end
	end
	
	SetCountryQuestData(varMap, 2, CD_HUODONG_XINNIAN, 0)
end


function x310920_ProcDie(varMap, varPlayer, varKiller)
	
	if IsObjValid( varMap,varKiller ) ~=1 then
		return
	end
	
	local varX,z = GetWorldPos(varMap,varKiller)
	local varNum =  GetNearPlayerCount(varMap, varKiller,varX,z,30)
	if varNum <= 0 then
		return
	end
	
	GamePlayScriptLog( varMap, varKiller, 2504)
				
	for	varI=0,varNum-1 do
			
		local member = GetNearPlayerMember(varMap, varKiller,varI)	
		if member ~= -1 and IsPlayerStateNormal( varMap,member ) == 1 then
			AddExp(varMap, varPlayer, 100)
			Msg2Player(varMap, member, "击杀贺岁喜兽获得100点经验。", 8, 3)
			Msg2Player(varMap, member, "击杀贺岁喜兽获得100点经验。", 8, 2)
			StartItemTask( varMap )
	
			local rnd = random(1, 10000)
			
			for j, item in x310920_var_BonusItem do
				if rnd <= item.rnd then
					ItemAppend( varMap, item.varItem, 1)
					break
				end
			end
			
			local varRet = StopItemTask( varMap, member )
			if varRet > 0 then
				
			end
			
		end 
	end
	
	SetCountryQuestData(varMap, 2, CD_HUODONG_XINNIAN, 1, 1)
	
	local myGuid = GetPlayerGUID( varMap,varKiller )
	GetCountryQuestDataNM(varMap, myGuid, 2, CD_HUODONG_XINNIAN, x310920_var_FileId, -1, "ProcCreateBoss", 0)
end

function x310920_ProcCreateBoss(varMap, guid, questData)
	if questData == 100 then
		if varMap == 36 then
			CreateMonster( varMap, 11001, 129, 175, 1, 971, x310920_var_FileId, -1, 21, 60*60*1000, 0)
		elseif varMap == 37 then
			CreateMonster( varMap, 11001, 193, 164, 1, 971, x310920_var_FileId, -1, 21, 60*60*1000, 0)
		elseif varMap == 38 then
			CreateMonster( varMap, 11001, 96, 147, 1, 971, x310920_var_FileId, -1, 21, 60*60*1000, 0)
			local varMsg1 = "贺岁兽王出现在大都东、南、西！"
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			local msg2 = "贺岁喜兽全部被消灭，贺岁兽王出现在大都东、南、西！"
			LuaAllScenceM2Wrold(varMap, msg2, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg2, CHAT_MAIN_RIGHTDOWN, 1)
		end
	end 
end
