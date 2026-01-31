--春节活动之天降年兽

x310848_g_ScriptId = 310848;
x310848_g_GameOpenId = 1075;
x310848_g_ValidScene = { 36, 37, 38 , 50, 150, 250, 350, 51, 151, 251, 351 };			--有效场景


--年兽配置表， 第一行配置年兽，第二行配置年兽王
x310848_g_MonsterInfo = {
													{ id = 62746, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽
													{ id = 62745, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽王											
												}																	
																
--年兽生成配置表， monsterIndex为在x310848_g_MonsterInfo表格中的索引
x310848_g_CreateMonsterConfigTb = {

			--大都南
			{sceneId=36, pos={ {posX= 82,posZ=206,monsterIndex=1}, {posX=156,posZ=233,monsterIndex=1}, 
												 {posX=156,posZ=233,monsterIndex=1}, {posX=199,posZ=226,monsterIndex=1},
												 {posX=145,posZ=179,monsterIndex=1}, {posX=42 ,posZ=186,monsterIndex=1}, 
												 {posX= 26,posZ=221,monsterIndex=1}, {posX=120,posZ=226,monsterIndex=1},
												 {posX=166,posZ=150,monsterIndex=1}, {posX=27 ,posZ=108,monsterIndex=1}, 
												 {posX= 67,posZ=146,monsterIndex=1}, {posX=34 ,posZ=157,monsterIndex=1},
												 {posX= 57,posZ=232,monsterIndex=1}, {posX=159,posZ=203,monsterIndex=1}, 
												 {posX=120,posZ=156,monsterIndex=1}, {posX=235,posZ=95 ,monsterIndex=1},
												 {posX=228,posZ=158,monsterIndex=1}, {posX=88 ,posZ=169,monsterIndex=1},
												 {posX=119,posZ=192,monsterIndex=1}, {posX=190,posZ=208,monsterIndex=1},
												 {posX=215,posZ=75 ,monsterIndex=1}, {posX=229,posZ=188,monsterIndex=1},
												 {posX=231,posZ=128,monsterIndex=1}, {posX=190,posZ=165,monsterIndex=1},
												 {posX=170,posZ=187,monsterIndex=1}, {posX=236,posZ=210,monsterIndex=1}
											 }	
			},
			
			--大都东
			{sceneId=37, pos={ {posX=143,posZ=46 ,monsterIndex=1}, {posX=120,posZ=33 ,monsterIndex=1},   
												 {posX=76 ,posZ=45 ,monsterIndex=1}, {posX=122,posZ=91 ,monsterIndex=1},
												 {posX=122,posZ=154,monsterIndex=1}, {posX=172,posZ=138,monsterIndex=1},
												 {posX=183,posZ=169,monsterIndex=1}, {posX=218,posZ=223,monsterIndex=1},
												 {posX=232,posZ=197,monsterIndex=1}, {posX=214,posZ=178,monsterIndex=1},
												 {posX=232,posZ=122,monsterIndex=1}, {posX=187,posZ=84 ,monsterIndex=1},
												 {posX=216,posZ=70 ,monsterIndex=1}, {posX=211,posZ=108,monsterIndex=1},
												 {posX=193,posZ=125,monsterIndex=1}, {posX=220,posZ=145,monsterIndex=1},
												 {posX=87 ,posZ=111,monsterIndex=1}, {posX=99 ,posZ=70 ,monsterIndex=1},
												 {posX=118,posZ=236,monsterIndex=1}, {posX=33 ,posZ=176,monsterIndex=1},
												 {posX=98 ,posZ=241,monsterIndex=1}, {posX=52 ,posZ=195,monsterIndex=1},
												 {posX=147,posZ=119,monsterIndex=1}, {posX=64 ,posZ=121,monsterIndex=1},
												 {posX=33 ,posZ=105,monsterIndex=1}, {posX=69 ,posZ=165,monsterIndex=1},
												 {posX=122,posZ=199,monsterIndex=1}, {posX=96 ,posZ=205,monsterIndex=1},
												 {posX=156,posZ=159,monsterIndex=1}, {posX=158,posZ=216,monsterIndex=1}
											 }
			
			},
			
			--大都西
			{sceneId=38, pos={ {posX=136,posZ=102,monsterIndex=1},{posX=144,posZ=201,monsterIndex=1}, 
												 {posX=54 ,posZ=230,monsterIndex=1},{posX=188,posZ=183,monsterIndex=1}, 
												 {posX=209,posZ=128,monsterIndex=1},{posX=95 ,posZ=228,monsterIndex=1}, 
												 {posX=90 ,posZ=108,monsterIndex=1},{posX=81 ,posZ=156,monsterIndex=1}, 
												 {posX=139,posZ=32 ,monsterIndex=1},{posX=121,posZ=174,monsterIndex=1}, 
												 {posX=161,posZ=218,monsterIndex=1},{posX=206,posZ=168,monsterIndex=1}, 
												 {posX=29 ,posZ=32 ,monsterIndex=1},{posX=29 ,posZ=206,monsterIndex=1}, 
												 {posX=42 ,posZ=63 ,monsterIndex=1},{posX=63 ,posZ=137,monsterIndex=1}, 
												 {posX=25 ,posZ=170,monsterIndex=1},{posX=28 ,posZ=91 ,monsterIndex=1}, 
												 {posX=46 ,posZ=120,monsterIndex=1},{posX=104,posZ=22 ,monsterIndex=1}, 
												 {posX=67 ,posZ=39 ,monsterIndex=1},{posX=182,posZ=39 ,monsterIndex=1}, 
												 {posX=98 ,posZ=197,monsterIndex=1},{posX=153,posZ=64 ,monsterIndex=1}, 
												 {posX=103,posZ=139,monsterIndex=1},{posX=113,posZ=76 ,monsterIndex=1}, 
												 {posX=228,posZ=181,monsterIndex=1},{posX=161,posZ=158,monsterIndex=1}, 
												 {posX=227,posZ=116,monsterIndex=1},{posX=186,posZ=110,monsterIndex=1}
											 }												 
											 },
			--楼兰王城
			{sceneId=50, pos={ {posX=59 ,posZ=31 ,monsterIndex=1},{posX=186,posZ=175,monsterIndex=1}, 
												 {posX=71 ,posZ=40 ,monsterIndex=1},{posX=178,posZ=195,monsterIndex=1}, 
												 {posX=67 ,posZ=55 ,monsterIndex=1},{posX=166,posZ=180,monsterIndex=1}, 
												 {posX=59 ,posZ=66 ,monsterIndex=1},{posX=143,posZ=178,monsterIndex=1}, 
												 {posX=90 ,posZ=69 ,monsterIndex=1},{posX=113,posZ=177,monsterIndex=1}, 
												 {posX=113,posZ=76 ,monsterIndex=1},{posX=114,posZ=157,monsterIndex=1}, 
												 {posX=110,posZ=32 ,monsterIndex=1},{posX=142,posZ=162,monsterIndex=1}, 
												 {posX=145,posZ=34 ,monsterIndex=1},{posX=81 ,posZ=192,monsterIndex=1}, 
												 {posX=128,posZ=78 ,monsterIndex=1},{posX=66 ,posZ=181,monsterIndex=1}, 
												 {posX=174,posZ=74 ,monsterIndex=1},{posX=72 ,posZ=160,monsterIndex=1}, 
												 {posX=201,posZ=70 ,monsterIndex=1},{posX=67 ,posZ=132,monsterIndex=1}, 
												 {posX=180,posZ=37 ,monsterIndex=1},{posX=66 ,posZ=105,monsterIndex=1}, 
												 {posX=194,posZ=36 ,monsterIndex=1},{posX=19 ,posZ=140,monsterIndex=1}, 
												 {posX=187,posZ=98 ,monsterIndex=1},{posX=244,posZ=139,monsterIndex=1}, 
												 {posX=187,posZ=157,monsterIndex=1},{posX=157,posZ=135,monsterIndex=1}
											 }												 
			},
			--天山王城
			{sceneId=150, pos={{posX=145 ,posZ=216 ,monsterIndex=1},{posX=293 ,posZ=255,monsterIndex=1}, 
												 {posX=113 ,posZ=273 ,monsterIndex=1},{posX=220 ,posZ=256,monsterIndex=1}, 
												 {posX=80 ,posZ=370 ,monsterIndex=1},{posX=368 ,posZ=146,monsterIndex=1}, 
												 {posX=115 ,posZ=401 ,monsterIndex=1},{posX=126 ,posZ=150,monsterIndex=1}, 
												 {posX=184 ,posZ=294 ,monsterIndex=1},{posX=182 ,posZ=271,monsterIndex=1}, 
												 {posX=242 ,posZ=313 ,monsterIndex=1},{posX=289 ,posZ=295,monsterIndex=1}, 
												 {posX=304,posZ=269 ,monsterIndex=1},{posX=200 ,posZ=314,monsterIndex=1}, 
												 {posX=313,posZ=328 ,monsterIndex=1},{posX=307 ,posZ=370,monsterIndex=1}, 
												 {posX=374,posZ=227 ,monsterIndex=1},{posX=188 ,posZ=358,monsterIndex=1}, 
												 {posX=384,posZ=134 ,monsterIndex=1},{posX=233 ,posZ=358,monsterIndex=1}, 
												 {posX=421,posZ=135 ,monsterIndex=1},{posX=375 ,posZ=146,monsterIndex=1}, 
												 {posX=424,posZ=60 ,monsterIndex=1},{posX=128 ,posZ=146,monsterIndex=1}, 
												 {posX=435,posZ=242 ,monsterIndex=1},{posX=120 ,posZ=190,monsterIndex=1}, 
												 {posX=378,posZ=320 ,monsterIndex=1},{posX=444 ,posZ=64,monsterIndex=1}, 
												 {posX=303,posZ=347,monsterIndex=1},{posX=458 ,posZ=166,monsterIndex=1}
											 }												 
			},
			--昆仑王城
			{sceneId=250, pos={{posX=145 ,posZ=216 ,monsterIndex=1},{posX=293 ,posZ=255,monsterIndex=1}, 
												 {posX=113 ,posZ=273 ,monsterIndex=1},{posX=220 ,posZ=256,monsterIndex=1}, 
												 {posX=80 ,posZ=370 ,monsterIndex=1},{posX=368 ,posZ=146,monsterIndex=1}, 
												 {posX=115 ,posZ=401 ,monsterIndex=1},{posX=126 ,posZ=150,monsterIndex=1}, 
												 {posX=184 ,posZ=294 ,monsterIndex=1},{posX=182 ,posZ=271,monsterIndex=1}, 
												 {posX=242 ,posZ=313 ,monsterIndex=1},{posX=289 ,posZ=295,monsterIndex=1}, 
												 {posX=304,posZ=269 ,monsterIndex=1},{posX=200 ,posZ=314,monsterIndex=1}, 
												 {posX=313,posZ=328 ,monsterIndex=1},{posX=307 ,posZ=370,monsterIndex=1}, 
												 {posX=374,posZ=227 ,monsterIndex=1},{posX=188 ,posZ=358,monsterIndex=1}, 
												 {posX=384,posZ=134 ,monsterIndex=1},{posX=233 ,posZ=358,monsterIndex=1}, 
												 {posX=421,posZ=135 ,monsterIndex=1},{posX=375 ,posZ=146,monsterIndex=1}, 
												 {posX=424,posZ=60 ,monsterIndex=1},{posX=128 ,posZ=146,monsterIndex=1}, 
												 {posX=435,posZ=242 ,monsterIndex=1},{posX=120 ,posZ=190,monsterIndex=1}, 
												 {posX=378,posZ=320 ,monsterIndex=1},{posX=444 ,posZ=64,monsterIndex=1}, 
												 {posX=303,posZ=347,monsterIndex=1},{posX=458 ,posZ=166,monsterIndex=1}
											 }												 
			},			
			--敦煌王城
			{sceneId=350, pos={{posX=145 ,posZ=216 ,monsterIndex=1},{posX=293 ,posZ=255,monsterIndex=1}, 
												 {posX=113 ,posZ=273 ,monsterIndex=1},{posX=220 ,posZ=256,monsterIndex=1}, 
												 {posX=80 ,posZ=370 ,monsterIndex=1},{posX=368 ,posZ=146,monsterIndex=1}, 
												 {posX=115 ,posZ=401 ,monsterIndex=1},{posX=126 ,posZ=150,monsterIndex=1}, 
												 {posX=184 ,posZ=294 ,monsterIndex=1},{posX=182 ,posZ=271,monsterIndex=1}, 
												 {posX=242 ,posZ=313 ,monsterIndex=1},{posX=289 ,posZ=295,monsterIndex=1}, 
												 {posX=304,posZ=269 ,monsterIndex=1},{posX=200 ,posZ=314,monsterIndex=1}, 
												 {posX=313,posZ=328 ,monsterIndex=1},{posX=307 ,posZ=370,monsterIndex=1}, 
												 {posX=374,posZ=227 ,monsterIndex=1},{posX=188 ,posZ=358,monsterIndex=1}, 
												 {posX=384,posZ=134 ,monsterIndex=1},{posX=233 ,posZ=358,monsterIndex=1}, 
												 {posX=421,posZ=135 ,monsterIndex=1},{posX=375 ,posZ=146,monsterIndex=1}, 
												 {posX=424,posZ=60 ,monsterIndex=1},{posX=128 ,posZ=146,monsterIndex=1}, 
												 {posX=435,posZ=242 ,monsterIndex=1},{posX=120 ,posZ=190,monsterIndex=1}, 
												 {posX=378,posZ=320 ,monsterIndex=1},{posX=444 ,posZ=64,monsterIndex=1}, 
												 {posX=303,posZ=347,monsterIndex=1},{posX=458 ,posZ=166,monsterIndex=1}
											 }												 
			},	
			--楼兰边塞
			{sceneId=51, pos={ {posX=59 ,posZ=123 ,monsterIndex=1},{posX=203,posZ=80,monsterIndex=1}, 
												 {posX=204 ,posZ=126 ,monsterIndex=1},{posX=299,posZ=113,monsterIndex=1}, 
												 {posX=367 ,posZ=80 ,monsterIndex=1},{posX=410,posZ=120,monsterIndex=1}, 
												 {posX=141 ,posZ=205,monsterIndex=1},{posX=205,posZ=213,monsterIndex=1}, 
												 {posX=102 ,posZ=248,monsterIndex=1},{posX=92,posZ=297,monsterIndex=1}, 
												 {posX=260 ,posZ=371 ,monsterIndex=1},{posX=274,posZ=305,monsterIndex=1}, 
												 {posX=398,posZ=335 ,monsterIndex=1},{posX=384,posZ=360,monsterIndex=1}, 
												 {posX=359,posZ=368 ,monsterIndex=1},{posX=235,posZ=373,monsterIndex=1}, 
												 {posX=204,posZ=387 ,monsterIndex=1},{posX=204,posZ=361,monsterIndex=1}, 
												 {posX=170,posZ=372 ,monsterIndex=1},{posX=151,posZ=355,monsterIndex=1}, 
												 {posX=114,posZ=295 ,monsterIndex=1},{posX=124 ,posZ=208,monsterIndex=1}, 
												 {posX=226,posZ=163 ,monsterIndex=1},{posX=225 ,posZ=240,monsterIndex=1}, 
												 {posX=400,posZ=364 ,monsterIndex=1},{posX=439 ,posZ=411,monsterIndex=1}, 
												 {posX=372,posZ=432 ,monsterIndex=1},{posX=387 ,posZ=458,monsterIndex=1}, 
												 {posX=339,posZ=121 ,monsterIndex=1},{posX=330 ,posZ=164,monsterIndex=1}
											 }												 
			},		
			--天山边塞
			{sceneId=151, pos={{posX=59 ,posZ=123 ,monsterIndex=1},{posX=203,posZ=80,monsterIndex=1}, 
												 {posX=204 ,posZ=126 ,monsterIndex=1},{posX=299,posZ=113,monsterIndex=1}, 
												 {posX=367 ,posZ=80 ,monsterIndex=1},{posX=410,posZ=120,monsterIndex=1}, 
												 {posX=141 ,posZ=205,monsterIndex=1},{posX=205,posZ=213,monsterIndex=1}, 
												 {posX=102 ,posZ=248,monsterIndex=1},{posX=92,posZ=297,monsterIndex=1}, 
												 {posX=260 ,posZ=371 ,monsterIndex=1},{posX=274,posZ=305,monsterIndex=1}, 
												 {posX=398,posZ=335 ,monsterIndex=1},{posX=384,posZ=360,monsterIndex=1}, 
												 {posX=359,posZ=368 ,monsterIndex=1},{posX=235,posZ=373,monsterIndex=1}, 
												 {posX=204,posZ=387 ,monsterIndex=1},{posX=204,posZ=361,monsterIndex=1}, 
												 {posX=170,posZ=372 ,monsterIndex=1},{posX=151,posZ=355,monsterIndex=1}, 
												 {posX=114,posZ=295 ,monsterIndex=1},{posX=124 ,posZ=208,monsterIndex=1}, 
												 {posX=226,posZ=163 ,monsterIndex=1},{posX=225 ,posZ=240,monsterIndex=1}, 
												 {posX=400,posZ=364 ,monsterIndex=1},{posX=439 ,posZ=411,monsterIndex=1}, 
												 {posX=372,posZ=432 ,monsterIndex=1},{posX=387 ,posZ=458,monsterIndex=1}, 
												 {posX=339,posZ=121 ,monsterIndex=1},{posX=330 ,posZ=164,monsterIndex=1}
											 }												 
			},	
			--昆仑边塞
			{sceneId=251, pos={{posX=59 ,posZ=123 ,monsterIndex=1},{posX=203,posZ=80,monsterIndex=1}, 
												 {posX=204 ,posZ=126 ,monsterIndex=1},{posX=299,posZ=113,monsterIndex=1}, 
												 {posX=367 ,posZ=80 ,monsterIndex=1},{posX=410,posZ=120,monsterIndex=1}, 
												 {posX=141 ,posZ=205,monsterIndex=1},{posX=205,posZ=213,monsterIndex=1}, 
												 {posX=102 ,posZ=248,monsterIndex=1},{posX=92,posZ=297,monsterIndex=1}, 
												 {posX=260 ,posZ=371 ,monsterIndex=1},{posX=274,posZ=305,monsterIndex=1}, 
												 {posX=398,posZ=335 ,monsterIndex=1},{posX=384,posZ=360,monsterIndex=1}, 
												 {posX=359,posZ=368 ,monsterIndex=1},{posX=235,posZ=373,monsterIndex=1}, 
												 {posX=204,posZ=387 ,monsterIndex=1},{posX=204,posZ=361,monsterIndex=1}, 
												 {posX=170,posZ=372 ,monsterIndex=1},{posX=151,posZ=355,monsterIndex=1}, 
												 {posX=114,posZ=295 ,monsterIndex=1},{posX=124 ,posZ=208,monsterIndex=1}, 
												 {posX=226,posZ=163 ,monsterIndex=1},{posX=225 ,posZ=240,monsterIndex=1}, 
												 {posX=400,posZ=364 ,monsterIndex=1},{posX=439 ,posZ=411,monsterIndex=1}, 
												 {posX=372,posZ=432 ,monsterIndex=1},{posX=387 ,posZ=458,monsterIndex=1}, 
												 {posX=339,posZ=121 ,monsterIndex=1},{posX=330 ,posZ=164,monsterIndex=1}
											 }												 
			},			
			--敦煌边塞
			{sceneId=351, pos={{posX=59 ,posZ=123 ,monsterIndex=1},{posX=203,posZ=80,monsterIndex=1}, 
												 {posX=204 ,posZ=126 ,monsterIndex=1},{posX=299,posZ=113,monsterIndex=1}, 
												 {posX=367 ,posZ=80 ,monsterIndex=1},{posX=410,posZ=120,monsterIndex=1}, 
												 {posX=141 ,posZ=205,monsterIndex=1},{posX=205,posZ=213,monsterIndex=1}, 
												 {posX=102 ,posZ=248,monsterIndex=1},{posX=92,posZ=297,monsterIndex=1}, 
												 {posX=260 ,posZ=371 ,monsterIndex=1},{posX=274,posZ=305,monsterIndex=1}, 
												 {posX=398,posZ=335 ,monsterIndex=1},{posX=384,posZ=360,monsterIndex=1}, 
												 {posX=359,posZ=368 ,monsterIndex=1},{posX=235,posZ=373,monsterIndex=1}, 
												 {posX=204,posZ=387 ,monsterIndex=1},{posX=204,posZ=361,monsterIndex=1}, 
												 {posX=170,posZ=372 ,monsterIndex=1},{posX=151,posZ=355,monsterIndex=1}, 
												 {posX=114,posZ=295 ,monsterIndex=1},{posX=124 ,posZ=208,monsterIndex=1}, 
												 {posX=226,posZ=163 ,monsterIndex=1},{posX=225 ,posZ=240,monsterIndex=1}, 
												 {posX=400,posZ=364 ,monsterIndex=1},{posX=439 ,posZ=411,monsterIndex=1}, 
												 {posX=372,posZ=432 ,monsterIndex=1},{posX=387 ,posZ=458,monsterIndex=1}, 
												 {posX=339,posZ=121 ,monsterIndex=1},{posX=330 ,posZ=164,monsterIndex=1}
											 }												 
			},									
																									
}

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

x310848_g_MonsterObjId2MonsterId = {};

function x310848_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x310848_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x310848_g_GameOpenId > 0 and GetGameOpenById( x310848_g_GameOpenId ) <= 0 then
      return
  end
  
  local tableExist = 0
  for x, y in x310848_g_MonsterObjId2MonsterId do
  		if x == SceneId then
  			tableExist = 1
  			break
  		end
  end
  
  if tableExist == 0 then
  	 x310848_g_MonsterObjId2MonsterId[SceneId] = {}
  end
  
 	--创建年兽
	for i, item in x310848_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
					
				 local objId, guid = CreateMonster( SceneId, 
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x310848_g_ScriptId, 
																						 -1,  
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x310848_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
				
				--记录objId对应的monsterId																	 															
				x310848_g_MonsterObjId2MonsterId[SceneId][objId] =  x310848_g_MonsterInfo[ itemDetail.monsterIndex ].id;
				
			end
		end
	end
end

function x310848_ProcDie( sceneId, selfId, killerId )
	
	if IsObjValid( sceneId,killerId ) ~=1 then
		return
	end

end

