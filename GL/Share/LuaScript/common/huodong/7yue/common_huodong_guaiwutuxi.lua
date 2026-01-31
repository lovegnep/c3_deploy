--怪物突袭

x302529_g_ScriptId = 302529;
x302529_g_GameOpenId = 1075;
x302529_g_ValidScene = {5, 8, 11 , 17, 20, 23};			--有效场景
x302529_var_FeastId = 13

--年兽配置表， 第一行配置年兽，第二行配置年兽王
x302529_g_MonsterInfo = {
													{ id = 11030, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽						
													{ id = 11031, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11032, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11033, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11034, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11035, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11028, baseAI = 1, highAI = -1, campId = 21, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0 },											
												
												
												
												
												}																	

--年兽生成配置表， monsterIndex为在x302529_g_MonsterInfo表格中的索引
x302529_g_CreateMonsterConfigTb = {
			--凤翔府
			{sceneId=5, pos={ {posX=61,posZ=198,monsterIndex=1}, {posX=84,posZ=204,monsterIndex=1},
												{posX=130,posZ=205,monsterIndex=1}, {posX=139,posZ=181,monsterIndex=1},
												{posX=119,posZ=154,monsterIndex=1}, {posX=96,posZ=145,monsterIndex=1},
												{posX=86,posZ=125,monsterIndex=1}, {posX=70,posZ=110,monsterIndex=1},
												{posX=72,posZ=83,monsterIndex=1}, {posX=63,posZ=55,monsterIndex=1},
												{posX=41,posZ=43,monsterIndex=1}, {posX=29,posZ=29,monsterIndex=1},
												{posX=69,posZ=39,monsterIndex=1}, {posX=87,posZ=35,monsterIndex=1},
												{posX=91,posZ=56,monsterIndex=1}, {posX=100,posZ=90,monsterIndex=1},
												{posX=87,posZ=131,monsterIndex=1}, {posX=110,posZ=134,monsterIndex=1},
												{posX=120,posZ=111,monsterIndex=1}, {posX=134,posZ=96,monsterIndex=1},
												{posX=157,posZ=96,monsterIndex=1}, {posX=169,posZ=104,monsterIndex=1},
												{posX=162,posZ=63,monsterIndex=1}, {posX=164,posZ=42,monsterIndex=1},
												{posX=182,posZ=39,monsterIndex=1}, {posX=194,posZ=52,monsterIndex=1},
												{posX=157,posZ=56,monsterIndex=1}, {posX=164,posZ=44,monsterIndex=1},
											  {posX=172,posZ=36,monsterIndex=1}, {posX=181,posZ=43,monsterIndex=1},
											  {posX=189,posZ=41,monsterIndex=1}, {posX=188,posZ=52,monsterIndex=1},
												{posX=198,posZ=57,monsterIndex=1}, {posX=201,posZ=58,monsterIndex=1},
												{posX=212,posZ=61,monsterIndex=1}, {posX=222,posZ=52,monsterIndex=1},
												{posX=231,posZ=43,monsterIndex=1}, {posX=227,posZ=33,monsterIndex=1},
											  {posX=236,posZ=28,monsterIndex=1}, {posX=216,posZ=22,monsterIndex=1},							  
											  {posX=230,posZ=59,monsterIndex=1}, {posX=212,posZ=36,monsterIndex=1},
											  {posX=222,posZ=113,monsterIndex=1}, {posX=236,posZ=112,monsterIndex=1},
											  {posX=223,posZ=140,monsterIndex=1}, {posX=215,posZ=149,monsterIndex=1},
											  {posX=204,posZ=146,monsterIndex=1}, {posX=192,posZ=139,monsterIndex=1},		  
											  {posX=192,posZ=124,monsterIndex=1}, {posX=208,posZ=155,monsterIndex=1},
											  {posX=182,posZ=119,monsterIndex=1}, {posX=172,posZ=119,monsterIndex=1},											  
											  {posX=164,posZ=142,monsterIndex=1}, {posX=165,posZ=166,monsterIndex=1},											   
											  {posX=154,posZ=177,monsterIndex=1}, {posX=155,posZ=196,monsterIndex=1},
											  {posX=161,posZ=209,monsterIndex=1}, {posX=162,posZ=192,monsterIndex=1},
											  {posX=135,posZ=216,monsterIndex=1}, {posX=121,posZ=218,monsterIndex=1}
											 }	
			},
			--楼兰王城
			{sceneId=8, pos={ {posX=33,posZ=34 ,monsterIndex=2}, {posX=33,posZ=51 ,monsterIndex=2},
												 {posX=35,posZ=73 ,monsterIndex=2}, {posX=34,posZ=113,monsterIndex=2},
												 {posX=37,posZ=124,monsterIndex=2}, {posX=40,posZ=162,monsterIndex=2},
												 {posX=41,posZ=183,monsterIndex=2}, {posX=44,posZ=208,monsterIndex=2}, 
												 {posX=55,posZ=224,monsterIndex=2}, {posX=60,posZ=204,monsterIndex=2},
												 {posX=63,posZ=180,monsterIndex=2}, {posX=61,posZ=141,monsterIndex=2},
												 {posX=73,posZ=161,monsterIndex=2}, {posX=85,posZ=138,monsterIndex=2},
												 {posX=75,posZ=191,monsterIndex=2}, {posX=58,posZ=113,monsterIndex=2},
												 {posX=87,posZ=107,monsterIndex=2}, {posX=84,posZ=91 ,monsterIndex=2},
												 {posX=72,posZ=85 ,monsterIndex=2}, {posX=75,posZ=70 ,monsterIndex=2},
												 {posX=64,posZ=53,monsterIndex=2}, {posX=50,posZ=58,monsterIndex=2},
												 {posX=93,posZ=68,monsterIndex=2}, {posX=89,posZ=48,monsterIndex=2},
												 {posX=76,posZ=34,monsterIndex=2}, {posX=63,posZ=42,monsterIndex=2},
												 {posX=53,posZ=45,monsterIndex=2}, {posX=133,posZ=38,monsterIndex=2},
												 {posX=146,posZ=57,monsterIndex=2}, {posX=41,posZ=67,monsterIndex=2},
											   {posX=128,posZ=72,monsterIndex=2}, {posX=117,posZ=66,monsterIndex=2},
											   {posX=153,posZ=85,monsterIndex=2}, {posX=189,posZ=83,monsterIndex=2},
 												 {posX=211,posZ=82,monsterIndex=2}, {posX=211,posZ=66,monsterIndex=2},
 												 {posX=253,posZ=161,monsterIndex=2}, {posX=190,posZ=38,monsterIndex=2},
 												 {posX=209,posZ=45,monsterIndex=2}, {posX=209,posZ=29,monsterIndex=2},
 												 {posX=210,posZ=87,monsterIndex=2}, {posX=185,posZ=84,monsterIndex=2},
 												 {posX=162,posZ=82,monsterIndex=2}, {posX=129,posZ=137,monsterIndex=2},
 												 {posX=141,posZ=158,monsterIndex=2}, {posX=159,posZ=161,monsterIndex=2},
 												 {posX=174,posZ=173,monsterIndex=2}, {posX=193,posZ=162,monsterIndex=2},
 												 {posX=235,posZ=175,monsterIndex=2}, {posX=223,posZ=165,monsterIndex=2},
 												 {posX=179,posZ=198,monsterIndex=2}, {posX=196,posZ=196,monsterIndex=2},
 												 {posX=145,posZ=200,monsterIndex=2}, {posX=131,posZ=206,monsterIndex=2},
 												 {posX=123,posZ=228,monsterIndex=2}, {posX=100,posZ=226,monsterIndex=2}
											 }	
			},
	 	{sceneId=11, pos={ {posX=200,posZ=190,monsterIndex=3}, {posX=232,posZ=176,monsterIndex=3},
												 {posX=230,posZ=153,monsterIndex=3}, {posX=221,posZ=114,monsterIndex=3},
												 {posX=217,posZ=90,monsterIndex=3}, {posX=221,posZ=67,monsterIndex=3},
												 {posX=208,posZ=51,monsterIndex=3}, {posX=171,posZ=31,monsterIndex=3}, 
												 {posX=170,posZ=49,monsterIndex=3}, {posX=170,posZ=68,monsterIndex=3},
												 {posX=189,posZ=82,monsterIndex=3}, {posX=160,posZ=62,monsterIndex=3},
												 {posX=146,posZ=55,monsterIndex=3}, {posX=154,posZ=39,monsterIndex=3},
												 {posX=179,posZ=35,monsterIndex=3}, {posX=60,posZ=200,monsterIndex=3},
												 {posX=140,posZ=32,monsterIndex=3}, {posX=120,posZ=29,monsterIndex=3},
												 {posX=107,posZ=39,monsterIndex=3}, {posX=104,posZ=53,monsterIndex=3},
												 {posX=93,posZ=67,monsterIndex=3}, {posX=81,posZ=64,monsterIndex=3},
												 {posX=67,posZ=71,monsterIndex=3}, {posX=54,posZ=79,monsterIndex=3},
												 {posX=63,posZ=95,monsterIndex=3}, {posX=41,posZ=66,monsterIndex=3},
												 {posX=28,posZ=61,monsterIndex=3}, {posX=24,posZ=47,monsterIndex=3},
												 {posX=31,posZ=82,monsterIndex=3}, {posX=32,posZ=102,monsterIndex=3},
											   {posX=89,posZ=29,monsterIndex=3}, {posX=63,posZ=28,monsterIndex=3},
											   {posX=46,posZ=34,monsterIndex=3}, {posX=41,posZ=53,monsterIndex=3},
 												 {posX=32,posZ=68,monsterIndex=3}, {posX=432,posZ=53,monsterIndex=3},
 												 {posX=48,posZ=128,monsterIndex=3}, {posX=21,posZ=134,monsterIndex=3},
 												 {posX=27,posZ=151,monsterIndex=3}, {posX=37,posZ=162,monsterIndex=3},
 												 {posX=38,posZ=180,monsterIndex=3}, {posX=55,posZ=180,monsterIndex=3},
 												 {posX=41,posZ=199,monsterIndex=3}, {posX=24,posZ=208,monsterIndex=3},
 												 {posX=45,posZ=219,monsterIndex=3}, {posX=59,posZ=211,monsterIndex=3},
 												 {posX=43,posZ=235,monsterIndex=3}, {posX=71,posZ=197,monsterIndex=3},
 												 {posX=81,posZ=176,monsterIndex=3}, {posX=82,posZ=161,monsterIndex=3},
 												 {posX=100,posZ=93,monsterIndex=3}, {posX=325,posZ=109,monsterIndex=3},
 												 {posX=298,posZ=161,monsterIndex=3}, {posX=105,posZ=176,monsterIndex=3},
 												 {posX=136,posZ=201,monsterIndex=3}, {posX=156,posZ=191,monsterIndex=3}
											 }	
			},				
			{sceneId=17, pos={ {posX=37 ,posZ=54 ,monsterIndex=4}, {posX=48 ,posZ=72 ,monsterIndex=4},
												 {posX=62 ,posZ=89 ,monsterIndex=4}, {posX=58 ,posZ=102,monsterIndex=4},
												 {posX=60 ,posZ=128,monsterIndex=4}, {posX=74 ,posZ=128,monsterIndex=4},
												 {posX=89 ,posZ=129,monsterIndex=4}, {posX=80 ,posZ=66 ,monsterIndex=4}, 
												 {posX=76 ,posZ=145,monsterIndex=4}, {posX=72 ,posZ=158,monsterIndex=4},
												 {posX=77 ,posZ=175,monsterIndex=4}, {posX=57 ,posZ=181,monsterIndex=4},
												 {posX=54 ,posZ=201,monsterIndex=4}, {posX=90 ,posZ=128,monsterIndex=4},
												 {posX=106,posZ=203,monsterIndex=4}, {posX=109,posZ=185,monsterIndex=4},
												 {posX=125,posZ=196,monsterIndex=4}, {posX=134,posZ=214,monsterIndex=4},
												 {posX=151,posZ=212,monsterIndex=4}, {posX=375,posZ=146,monsterIndex=4},
												 {posX=150,posZ=198,monsterIndex=4}, {posX=161,posZ=188,monsterIndex=4},
												 {posX=181,posZ=192,monsterIndex=4}, {posX=189,posZ=209,monsterIndex=4},
												 {posX=187,posZ=223,monsterIndex=4}, {posX=202,posZ=219,monsterIndex=4},
												 {posX=212,posZ=220,monsterIndex=4}, {posX=228,posZ=210,monsterIndex=4},
												 {posX=195,posZ=198,monsterIndex=4}, {posX=213,posZ=184,monsterIndex=4},
											   {posX=212,posZ=165,monsterIndex=4}, {posX=197,posZ=164,monsterIndex=4},
											   {posX=180,posZ=158,monsterIndex=4}, {posX=201,posZ=140,monsterIndex=4},
 												 {posX=214,posZ=164,monsterIndex=4}, {posX=202,posZ=102,monsterIndex=4},
 												 {posX=188,posZ=122,monsterIndex=4}, {posX=177,posZ=131,monsterIndex=4},
 												 {posX=161,posZ=121,monsterIndex=4}, {posX=140,posZ=129,monsterIndex=4},
 												 {posX=137,posZ=151,monsterIndex=4}, {posX=134,posZ=171,monsterIndex=4},
 												 {posX=116,posZ=178,monsterIndex=4}, {posX=119,posZ=157,monsterIndex=4},
 												 {posX=114,posZ=141,monsterIndex=4}, {posX=116,posZ=119,monsterIndex=4},
 												 {posX=112,posZ=100,monsterIndex=4}, {posX=107,posZ=79 ,monsterIndex=4},
 												 {posX=92 ,posZ=79 ,monsterIndex=4}, {posX=66 ,posZ=68 ,monsterIndex=4},
 												 {posX=51 ,posZ=84 ,monsterIndex=4}, {posX=52 ,posZ=98 ,monsterIndex=4},
 												 {posX=41 ,posZ=66 ,monsterIndex=4}, {posX=113,posZ=148,monsterIndex=4},
 												 {posX=102,posZ=175,monsterIndex=4}, {posX=113,posZ=191,monsterIndex=4}
											 }	
			},	
			{sceneId=20, pos={ {posX=20 ,posZ=50 ,monsterIndex=5}, {posX=53 ,posZ=68 ,monsterIndex=5},
												 {posX=42 ,posZ=85 ,monsterIndex=5}, {posX=36 ,posZ=121,monsterIndex=5},
												 {posX=31 ,posZ=131,monsterIndex=5}, {posX=38 ,posZ=148,monsterIndex=5},
												 {posX=51 ,posZ=135,monsterIndex=5}, {posX=65 ,posZ=140,monsterIndex=5}, 
												 {posX=83 ,posZ=138,monsterIndex=5}, {posX=101,posZ=138,monsterIndex=5},
												 {posX=104,posZ=110,monsterIndex=5},{posX=104,posZ=91,monsterIndex=5},
												 {posX=93,posZ=201,monsterIndex=5}, {posX=90,posZ=128,monsterIndex=5},
												 {posX=93,posZ=74,monsterIndex=5}, {posX=76,posZ=82,monsterIndex=5},
												 {posX=55,posZ=160,monsterIndex=5}, {posX=85,posZ=160,monsterIndex=5},
												 {posX=106,posZ=157,monsterIndex=5}, {posX=120,posZ=147,monsterIndex=5},
												 {posX=130,posZ=132,monsterIndex=5}, {posX=131,posZ=115,monsterIndex=5},
												 {posX=134,posZ=99,monsterIndex=5}, {posX=143,posZ=77,monsterIndex=5},
												 {posX=120,posZ=166,monsterIndex=5}, {posX=118,posZ=181,monsterIndex=5},
												 {posX=113,posZ=201,monsterIndex=5}, {posX=103,posZ=215,monsterIndex=5},
												 {posX=90,posZ=224,monsterIndex=5}, {posX=76,posZ=234,monsterIndex=5},
												 {posX=55,posZ=232,monsterIndex=5}, {posX=36,posZ=232,monsterIndex=5},
												 {posX=94,posZ=53,monsterIndex=5}, {posX=118,posZ=56,monsterIndex=5},
											   {posX=138,posZ=66,monsterIndex=5}, {posX=149,posZ=52,monsterIndex=5},
											   {posX=162,posZ=35,monsterIndex=5}, {posX=186,posZ=32,monsterIndex=5},
 												 {posX=211,posZ=30,monsterIndex=5}, {posX=198,posZ=43,monsterIndex=5},
 												 {posX=199,posZ=64,monsterIndex=5}, {posX=196,posZ=88,monsterIndex=5},
 												 {posX=198,posZ=105,monsterIndex=5}, {posX=214,posZ=117,monsterIndex=5},
 												 {posX=230,posZ=123,monsterIndex=5}, {posX=238,posZ=107,monsterIndex=5},
 												 {posX=247,posZ=94,monsterIndex=5}, {posX=235,posZ=89,monsterIndex=5},
 												 {posX=235,posZ=73,monsterIndex=5}, {posX=249,posZ=73,monsterIndex=5},
 												 {posX=225,posZ=80,monsterIndex=5}, {posX=236,posZ=155,monsterIndex=5},
 												 {posX=241,posZ=99,monsterIndex=5}, {posX=234,posZ=81,monsterIndex=5},
 												 {posX=180,posZ=131,monsterIndex=5}, {posX=167,posZ=149,monsterIndex=5},
 												 {posX=188,posZ=163,monsterIndex=5}, {posX=176,posZ=179,monsterIndex=5},
 												 {posX=163,posZ=193,monsterIndex=5}, {posX=179,posZ=209,monsterIndex=5}
											 }	
			},
			{sceneId=23, pos={ {posX=75,posZ=53,monsterIndex=6}, {posX=47,posZ=74,monsterIndex=6},
												 {posX=42,posZ=91,monsterIndex=6}, {posX=61,posZ=91,monsterIndex=6},
												 {posX=76,posZ=78,monsterIndex=6}, {posX=88,posZ=69,monsterIndex=6},
												 {posX=92,posZ=54,monsterIndex=6},{posX=105,posZ=40,monsterIndex=6}, 
												 {posX=121,posZ=69,monsterIndex=6}, {posX=205,posZ=49,monsterIndex=6},
												 {posX=193,posZ=35,monsterIndex=6},{posX=181,posZ=45,monsterIndex=6},
												 {posX=168,posZ=60,monsterIndex=6}, {posX=173,posZ=77,monsterIndex=6},
												 {posX=172,posZ=85,monsterIndex=6}, {posX=162,posZ=93,monsterIndex=6},
												 {posX=156,posZ=76,monsterIndex=6}, {posX=148,posZ=92,monsterIndex=6},
												 {posX=29,posZ=135,monsterIndex=6}, {posX=38,posZ=147,monsterIndex=6},
												 {posX=54,posZ=136,monsterIndex=6}, {posX=51,posZ=160,monsterIndex=6},
												 {posX=68,posZ=159,monsterIndex=6}, {posX=80,posZ=148,monsterIndex=6},
												 {posX=97,posZ=145,monsterIndex=6}, {posX=88,posZ=163,monsterIndex=6},
												 {posX=79,posZ=185,monsterIndex=6}, {posX=109,posZ=174,monsterIndex=6},
												 {posX=129,posZ=166,monsterIndex=6}, {posX=139,posZ=178,monsterIndex=6},
												 {posX=134,posZ=200,monsterIndex=6}, {posX=151,posZ=212,monsterIndex=6},
												 {posX=101,posZ=215,monsterIndex=6}, {posX=61,posZ=208,monsterIndex=6},
											   {posX=51,posZ=188,monsterIndex=6}, {posX=217,posZ=199,monsterIndex=6},
											   {posX=211,posZ=182,monsterIndex=6}, {posX=205,posZ=199,monsterIndex=6},
 												 {posX=213,posZ=177,monsterIndex=6}, {posX=204,posZ=188,monsterIndex=6},
 												 {posX=184,posZ=178,monsterIndex=6}, {posX=173,posZ=174,monsterIndex=6},
 												 {posX=148,posZ=167,monsterIndex=6}, {posX=141,posZ=179,monsterIndex=6},
 												 {posX=123,posZ=172,monsterIndex=6}, {posX=119,posZ=157,monsterIndex=6},
 												 {posX=177,posZ=219,monsterIndex=6}, {posX=158,posZ=212,monsterIndex=6},
 												 {posX=177,posZ=204,monsterIndex=6}, {posX=160,posZ=191,monsterIndex=6},
 												 {posX=128,posZ=200,monsterIndex=6}, {posX=129,posZ=175,monsterIndex=6},
 												 {posX=109,posZ=165,monsterIndex=6}, {posX=95,posZ=171,monsterIndex=6},
 												 {posX=77,posZ=161,monsterIndex=6}, {posX=57,posZ=155,monsterIndex=6},
 												 {posX=178,posZ=160,monsterIndex=6}, {posX=156,posZ=161,monsterIndex=6},
 												 {posX=133,posZ=146,monsterIndex=6}, {posX=219,posZ=209,monsterIndex=6},
											 }	,
			},
} 												                                                                                             



function x302529_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x302529_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x302529_g_GameOpenId > 0 and GetGameOpenById( x302529_g_GameOpenId ) <= 0 then
      return
  end
  
	local year, month, day = GetYearMonthDay()
	local day = GetDayOfYear()
	if year ~= 2012 or day < 263 or day > 277 then
		return
	end
  
 	--创建年兽
	for i, item in x302529_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
					
				 local objId, guid = CreateMonster( SceneId, 
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x302529_g_ScriptId, 
																						 -1,  
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x302529_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
			end
		end
	end
end

function x302529_ProcDie( sceneId, selfId, killerId )
	if IsObjValid( sceneId,killerId ) ~=1 then
		return
	end
	if MD_CURRENT_FEAST_ID ~= x302529_var_FeastId then return end
	local nKillerType = GetObjType(sceneId, killerId)
	
	if nKillerType == 1 or nKillerType == 3 then  --是玩家或者召唤兽弄死的
	
		local TeamNum = 0
		local humanObjId = 0
		if nKillerType == 1 then
			 humanObjId = killerId
		elseif nKillerType == 3 then
			 humanObjId = GetOwnerID(sceneId, killerId)
		end
		local day = GetDayOfYear() - 262
		local coutryId = GetCurCountry(sceneId, humanObjId)
		local TeamId = GetTeamId(sceneId, humanObjId)
		if TeamId ~= -1 then
				TeamNum = GetNearTeamCount(sceneId, humanObjId)
				for j = 0, TeamNum -1 do
					if x302529_GetData(sceneId, humanObjId) ~= day then
						x302529_SetDataNum(sceneId, humanObjId,0)
					end
					humanObjId = GetNearTeamMember(sceneId, humanObjId, j)
					local a = x302529_GetDataNum(sceneId, humanObjId) + 1
					GamePlayScriptLog( sceneId, humanObjId, 3869)
					x302529_record_Time(sceneId, humanObjId,a)
					if a < 5 then
						Msg2Player(sceneId, humanObjId, format("您当前击杀%d个天狼国战士",a), 0, 3)
					else
						Msg2Player(sceneId, humanObjId, "您击杀的天狼国战士数量已经达成条件", 0, 3)
					end
					--记MD
				end
		else
			if x302529_GetData(sceneId, humanObjId) ~= day then
						x302529_SetDataNum(sceneId, humanObjId,0)
			end
			local a = x302529_GetDataNum(sceneId, humanObjId)
			 a = a + 1
			
				x302529_record_Time(sceneId, humanObjId,a)
			if a < 5 then
				Msg2Player(sceneId, humanObjId, format("您当前击杀%d个天狼国战士",a), 0, 3)
			else
						Msg2Player(sceneId, humanObjId, "您击杀的天狼国战士数量已经达成条件", 0, 3)
			end
		end
		 
--		local jifenAddition = 1;		
--		if x302529_g_MonsterObjId2MonsterId[sceneId][selfId] == x302529_g_MonsterInfo[2].id then --年兽王， 加5分
--			jifenAddition = 5					
--		end
--		SetCountryQuestData( sceneId, 3, CD_HUODONG_XINNIAN, jifenAddition, 1 );		
	end
end
function x302529_record_DAY(varMap, varPlayer)
	local day = GetDayOfYear() - 262
	local day1= x302529_GetData(varMap, varPlayer)
		if day1 == day then	
			return 0
		else 
			x302529_SetData(varMap, varPlayer,day)	
			return 1
		end

	
end

function x302529_record_Time(varMap, varPlayer,value)
	if value > 5 then
		value = 5 
	end
	if x302529_record_DAY(varMap, varPlayer) == 0 then
		x302529_SetDataNum(varMap, varPlayer,value)
	else
		x302529_SetDataNum(varMap, varPlayer,1)
	end

end
function x302529_Set_MD_Data(varMap, varPlayer)
	local feastid = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
	if feastid < x302529_var_FeastId then
		LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer)
		SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,x302529_var_FeastId)				
	end
end
function x302529_SetDataNum(varMap, varPlayer,value)
	return SetPlayerGameData( varMap, varPlayer, MD_KILLMON_NUM[ 1], MD_KILLMON_NUM[ 2], MD_KILLMON_NUM[ 3], value)
end
function x302529_GetDataNum(varMap, varPlayer)
	return GetPlayerGameData( varMap, varPlayer, MD_KILLMON_NUM[ 1], MD_KILLMON_NUM[ 2], MD_KILLMON_NUM[ 3] )
end
function x302529_SetData(varMap, varPlayer,value)
	return SetPlayerGameData( varMap, varPlayer, MD_MONATTR_DAY[ 1], MD_MONATTR_DAY[ 2], MD_MONATTR_DAY[ 3], value)
end
function x302529_GetData(varMap, varPlayer)
	return GetPlayerGameData( varMap, varPlayer, MD_MONATTR_DAY[ 1], MD_MONATTR_DAY[ 2], MD_MONATTR_DAY[ 3] )
end
