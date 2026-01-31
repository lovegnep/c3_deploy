--春节活动之天降年兽

x310857_g_ScriptId = 310857;
x310857_g_GameOpenId = 1075;
x310857_g_ValidScene = {0, 50, 150 , 250, 350};			--有效场景


--年兽配置表， 第一行配置年兽，第二行配置年兽王
x310857_g_MonsterInfo = {
													{ id = 11028, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽						
												}																	

--年兽生成配置表， monsterIndex为在x310857_g_MonsterInfo表格中的索引
x310857_g_CreateMonsterConfigTb = {
			--大都
			{sceneId=0, pos={ {posX=266,posZ=274,monsterIndex=1}, {posX=68,posZ=145,monsterIndex=1},
												{posX=440,posZ=332,monsterIndex=1}, {posX=108,posZ=119,monsterIndex=1},
												{posX=315,posZ=280,monsterIndex=1}, {posX=103,posZ=100,monsterIndex=1},
												{posX=255,posZ=259,monsterIndex=1}, {posX=180,posZ=174,monsterIndex=1},
												{posX=240,posZ=266,monsterIndex=1}, {posX=198,posZ=175,monsterIndex=1},
												{posX=318,posZ=423,monsterIndex=1}, {posX=314,posZ=211,monsterIndex=1},
												{posX=196,posZ=282,monsterIndex=1}, {posX=315,posZ=181,monsterIndex=1},
												{posX=309,posZ=391,monsterIndex=1}, {posX=370,posZ=192,monsterIndex=1},
												{posX=122,posZ=270,monsterIndex=1}, {posX=392,posZ=191,monsterIndex=1},
												{posX=166,posZ=235,monsterIndex=1}, {posX=376,posZ=167,monsterIndex=1},
												{posX=177,posZ=392,monsterIndex=1}, {posX=392,posZ=125,monsterIndex=1},
												{posX=131,posZ=228,monsterIndex=1}, {posX=418,posZ=120,monsterIndex=1},
												{posX=72,posZ=213,monsterIndex=1}, {posX=303,posZ=340,monsterIndex=1},
												{posX=57,posZ=211,monsterIndex=1}, {posX=416,posZ=239,monsterIndex=1},
											  {posX=38,posZ=249,monsterIndex=1}, {posX=421,posZ=258,monsterIndex=1},
											  {posX=52,posZ=251,monsterIndex=1}, {posX=408,posZ=280,monsterIndex=1},
												{posX=61,posZ=187,monsterIndex=1}, {posX=422,posZ=319,monsterIndex=1},
												{posX=74,posZ=177,monsterIndex=1}, {posX=419,posZ=364,monsterIndex=1},
												{posX=104,posZ=172,monsterIndex=1}, {posX=109,posZ=303,monsterIndex=1},
											  {posX=111,posZ=184,monsterIndex=1}, {posX=87,posZ=307,monsterIndex=1},							  
											  {posX=39,posZ=188,monsterIndex=1}, {posX=99,posZ=337,monsterIndex=1},
											  {posX=157,posZ=183,monsterIndex=1}, {posX=61,posZ=354,monsterIndex=1},
											  {posX=139,posZ=146,monsterIndex=1}, {posX=55,posZ=376,monsterIndex=1},
											  {posX=123,posZ=150,monsterIndex=1}, {posX=176,posZ=359,monsterIndex=1},		  
											  {posX=95,posZ=139,monsterIndex=1}, {posX=154,posZ=342,monsterIndex=1},
											  {posX=146,posZ=382,monsterIndex=1}, {posX=136,posZ=400,monsterIndex=1},											  
											  {posX=195,posZ=420,monsterIndex=1}, {posX=266,posZ=319,monsterIndex=1},											   
											  {posX=192,posZ=451,monsterIndex=1}, {posX=244,posZ=329,monsterIndex=1},
											  {posX=247,posZ=408,monsterIndex=1}, {posX=275,posZ=341,monsterIndex=1},
											  {posX=265,posZ=367,monsterIndex=1}, {posX=321,posZ=338,monsterIndex=1}
											 }	
			},
			--楼兰王城
			{sceneId=50, pos={ {posX=278,posZ=267,monsterIndex=1}, {posX=129,posZ=112,monsterIndex=1},
												 {posX=235,posZ=285,monsterIndex=1}, {posX=94,posZ=122,monsterIndex=1},
												 {posX=192,posZ=268,monsterIndex=1}, {posX=99,posZ=87,monsterIndex=1},
												 {posX=206,posZ=290,monsterIndex=1}, {posX=80,posZ=66,monsterIndex=1}, 
												 {posX=234,posZ=306,monsterIndex=1}, {posX=127,posZ=51,monsterIndex=1},
												 {posX=180,posZ=313,monsterIndex=1}, {posX=61,posZ=141,monsterIndex=1},
												 {posX=197,posZ=323,monsterIndex=1}, {posX=73,posZ=153,monsterIndex=1},
												 {posX=154,posZ=223,monsterIndex=1}, {posX=63,posZ=213,monsterIndex=1},
												 {posX=140,posZ=242,monsterIndex=1}, {posX=78,posZ=218,monsterIndex=1},
												 {posX=247,posZ=299,monsterIndex=1}, {posX=375,posZ=146,monsterIndex=1},
												 {posX=286,posZ=292,monsterIndex=1}, {posX=408,posZ=137,monsterIndex=1},
												 {posX=294,posZ=279,monsterIndex=1}, {posX=433,posZ=120,monsterIndex=1},
												 {posX=300,posZ=258,monsterIndex=1}, {posX=450,posZ=136,monsterIndex=1},
												 {posX=353,posZ=253,monsterIndex=1}, {posX=453,posZ=178,monsterIndex=1},
												 {posX=374,posZ=281,monsterIndex=1}, {posX=419,posZ=191,monsterIndex=1},
											   {posX=377,posZ=306,monsterIndex=1}, {posX=397,posZ=45,monsterIndex=1},
											   {posX=375,posZ=334,monsterIndex=1}, {posX=398,posZ=65,monsterIndex=1},
 												 {posX=136,posZ=331,monsterIndex=1}, {posX=432,posZ=53,monsterIndex=1},
 												 {posX=108,posZ=283,monsterIndex=1}, {posX=470,posZ=61,monsterIndex=1},
 												 {posX=79,posZ=365,monsterIndex=1}, {posX=271,posZ=212,monsterIndex=1},
 												 {posX=327,posZ=399,monsterIndex=1}, {posX=191,posZ=202,monsterIndex=1},
 												 {posX=347,posZ=399,monsterIndex=1}, {posX=255,posZ=194,monsterIndex=1},
 												 {posX=275,posZ=377,monsterIndex=1}, {posX=231,posZ=208,monsterIndex=1},
 												 {posX=135,posZ=142,monsterIndex=1}, {posX=224,posZ=185,monsterIndex=1},
 												 {posX=136,posZ=234,monsterIndex=1}, {posX=32,posZ=111,monsterIndex=1},
 												 {posX=313,posZ=93,monsterIndex=1}, {posX=325,posZ=109,monsterIndex=1},
 												 {posX=298,posZ=109,monsterIndex=1}, {posX=197,posZ=84,monsterIndex=1},
 												 {posX=201,posZ=115,monsterIndex=1}, {posX=192,posZ=102,monsterIndex=1}
											 }	
			},
	 	{sceneId=150, pos={ {posX=278,posZ=267,monsterIndex=1}, {posX=129,posZ=112,monsterIndex=1},
												 {posX=235,posZ=285,monsterIndex=1}, {posX=94,posZ=122,monsterIndex=1},
												 {posX=192,posZ=268,monsterIndex=1}, {posX=99,posZ=87,monsterIndex=1},
												 {posX=206,posZ=290,monsterIndex=1}, {posX=80,posZ=66,monsterIndex=1}, 
												 {posX=234,posZ=306,monsterIndex=1}, {posX=127,posZ=51,monsterIndex=1},
												 {posX=180,posZ=313,monsterIndex=1}, {posX=61,posZ=141,monsterIndex=1},
												 {posX=197,posZ=323,monsterIndex=1}, {posX=73,posZ=153,monsterIndex=1},
												 {posX=154,posZ=223,monsterIndex=1}, {posX=63,posZ=213,monsterIndex=1},
												 {posX=140,posZ=242,monsterIndex=1}, {posX=78,posZ=218,monsterIndex=1},
												 {posX=247,posZ=299,monsterIndex=1}, {posX=375,posZ=146,monsterIndex=1},
												 {posX=286,posZ=292,monsterIndex=1}, {posX=408,posZ=137,monsterIndex=1},
												 {posX=294,posZ=279,monsterIndex=1}, {posX=433,posZ=120,monsterIndex=1},
												 {posX=300,posZ=258,monsterIndex=1}, {posX=450,posZ=136,monsterIndex=1},
												 {posX=353,posZ=253,monsterIndex=1}, {posX=453,posZ=178,monsterIndex=1},
												 {posX=374,posZ=281,monsterIndex=1}, {posX=419,posZ=191,monsterIndex=1},
											   {posX=377,posZ=306,monsterIndex=1}, {posX=397,posZ=45,monsterIndex=1},
											   {posX=375,posZ=334,monsterIndex=1}, {posX=398,posZ=65,monsterIndex=1},
 												 {posX=136,posZ=331,monsterIndex=1}, {posX=432,posZ=53,monsterIndex=1},
 												 {posX=108,posZ=283,monsterIndex=1}, {posX=470,posZ=61,monsterIndex=1},
 												 {posX=79,posZ=365,monsterIndex=1}, {posX=271,posZ=212,monsterIndex=1},
 												 {posX=327,posZ=399,monsterIndex=1}, {posX=191,posZ=202,monsterIndex=1},
 												 {posX=347,posZ=399,monsterIndex=1}, {posX=255,posZ=194,monsterIndex=1},
 												 {posX=275,posZ=377,monsterIndex=1}, {posX=231,posZ=208,monsterIndex=1},
 												 {posX=135,posZ=142,monsterIndex=1}, {posX=224,posZ=185,monsterIndex=1},
 												 {posX=136,posZ=234,monsterIndex=1}, {posX=32,posZ=111,monsterIndex=1},
 												 {posX=313,posZ=93,monsterIndex=1}, {posX=325,posZ=109,monsterIndex=1},
 												 {posX=298,posZ=109,monsterIndex=1}, {posX=197,posZ=84,monsterIndex=1},
 												 {posX=201,posZ=115,monsterIndex=1}, {posX=192,posZ=102,monsterIndex=1}
											 }	
			},				
			{sceneId=250, pos={ {posX=278,posZ=267,monsterIndex=1}, {posX=129,posZ=112,monsterIndex=1},
												 {posX=235,posZ=285,monsterIndex=1}, {posX=94,posZ=122,monsterIndex=1},
												 {posX=192,posZ=268,monsterIndex=1}, {posX=99,posZ=87,monsterIndex=1},
												 {posX=206,posZ=290,monsterIndex=1}, {posX=80,posZ=66,monsterIndex=1}, 
												 {posX=234,posZ=306,monsterIndex=1}, {posX=127,posZ=51,monsterIndex=1},
												 {posX=180,posZ=313,monsterIndex=1}, {posX=61,posZ=141,monsterIndex=1},
												 {posX=197,posZ=323,monsterIndex=1}, {posX=73,posZ=153,monsterIndex=1},
												 {posX=154,posZ=223,monsterIndex=1}, {posX=63,posZ=213,monsterIndex=1},
												 {posX=140,posZ=242,monsterIndex=1}, {posX=78,posZ=218,monsterIndex=1},
												 {posX=247,posZ=299,monsterIndex=1}, {posX=375,posZ=146,monsterIndex=1},
												 {posX=286,posZ=292,monsterIndex=1}, {posX=408,posZ=137,monsterIndex=1},
												 {posX=294,posZ=279,monsterIndex=1}, {posX=433,posZ=120,monsterIndex=1},
												 {posX=300,posZ=258,monsterIndex=1}, {posX=450,posZ=136,monsterIndex=1},
												 {posX=353,posZ=253,monsterIndex=1}, {posX=453,posZ=178,monsterIndex=1},
												 {posX=374,posZ=281,monsterIndex=1}, {posX=419,posZ=191,monsterIndex=1},
											   {posX=377,posZ=306,monsterIndex=1}, {posX=397,posZ=45,monsterIndex=1},
											   {posX=375,posZ=334,monsterIndex=1}, {posX=398,posZ=65,monsterIndex=1},
 												 {posX=136,posZ=331,monsterIndex=1}, {posX=432,posZ=53,monsterIndex=1},
 												 {posX=108,posZ=283,monsterIndex=1}, {posX=470,posZ=61,monsterIndex=1},
 												 {posX=79,posZ=365,monsterIndex=1}, {posX=271,posZ=212,monsterIndex=1},
 												 {posX=327,posZ=399,monsterIndex=1}, {posX=191,posZ=202,monsterIndex=1},
 												 {posX=347,posZ=399,monsterIndex=1}, {posX=255,posZ=194,monsterIndex=1},
 												 {posX=275,posZ=377,monsterIndex=1}, {posX=231,posZ=208,monsterIndex=1},
 												 {posX=135,posZ=142,monsterIndex=1}, {posX=224,posZ=185,monsterIndex=1},
 												 {posX=136,posZ=234,monsterIndex=1}, {posX=32,posZ=111,monsterIndex=1},
 												 {posX=313,posZ=93,monsterIndex=1}, {posX=325,posZ=109,monsterIndex=1},
 												 {posX=298,posZ=109,monsterIndex=1}, {posX=197,posZ=84,monsterIndex=1},
 												 {posX=201,posZ=115,monsterIndex=1}, {posX=192,posZ=102,monsterIndex=1}
											 }	
			},	
			{sceneId=350, pos={ {posX=278,posZ=267,monsterIndex=1}, {posX=129,posZ=112,monsterIndex=1},
												 {posX=235,posZ=285,monsterIndex=1}, {posX=94,posZ=122,monsterIndex=1},
												 {posX=192,posZ=268,monsterIndex=1}, {posX=99,posZ=87,monsterIndex=1},
												 {posX=206,posZ=290,monsterIndex=1}, {posX=80,posZ=66,monsterIndex=1}, 
												 {posX=234,posZ=306,monsterIndex=1}, {posX=127,posZ=51,monsterIndex=1},
												 {posX=180,posZ=313,monsterIndex=1}, {posX=61,posZ=141,monsterIndex=1},
												 {posX=197,posZ=323,monsterIndex=1}, {posX=73,posZ=153,monsterIndex=1},
												 {posX=154,posZ=223,monsterIndex=1}, {posX=63,posZ=213,monsterIndex=1},
												 {posX=140,posZ=242,monsterIndex=1}, {posX=78,posZ=218,monsterIndex=1},
												 {posX=247,posZ=299,monsterIndex=1}, {posX=375,posZ=146,monsterIndex=1},
												 {posX=286,posZ=292,monsterIndex=1}, {posX=408,posZ=137,monsterIndex=1},
												 {posX=294,posZ=279,monsterIndex=1}, {posX=433,posZ=120,monsterIndex=1},
												 {posX=300,posZ=258,monsterIndex=1}, {posX=450,posZ=136,monsterIndex=1},
												 {posX=353,posZ=253,monsterIndex=1}, {posX=453,posZ=178,monsterIndex=1},
												 {posX=374,posZ=281,monsterIndex=1}, {posX=419,posZ=191,monsterIndex=1},
											   {posX=377,posZ=306,monsterIndex=1}, {posX=397,posZ=45,monsterIndex=1},
											   {posX=375,posZ=334,monsterIndex=1}, {posX=398,posZ=65,monsterIndex=1},
 												 {posX=136,posZ=331,monsterIndex=1}, {posX=432,posZ=53,monsterIndex=1},
 												 {posX=108,posZ=283,monsterIndex=1}, {posX=470,posZ=61,monsterIndex=1},
 												 {posX=79,posZ=365,monsterIndex=1}, {posX=271,posZ=212,monsterIndex=1},
 												 {posX=327,posZ=399,monsterIndex=1}, {posX=191,posZ=202,monsterIndex=1},
 												 {posX=347,posZ=399,monsterIndex=1}, {posX=255,posZ=194,monsterIndex=1},
 												 {posX=275,posZ=377,monsterIndex=1}, {posX=231,posZ=208,monsterIndex=1},
 												 {posX=135,posZ=142,monsterIndex=1}, {posX=224,posZ=185,monsterIndex=1},
 												 {posX=136,posZ=234,monsterIndex=1}, {posX=32,posZ=111,monsterIndex=1},
 												 {posX=313,posZ=93,monsterIndex=1}, {posX=325,posZ=109,monsterIndex=1},
 												 {posX=298,posZ=109,monsterIndex=1}, {posX=197,posZ=84,monsterIndex=1},
 												 {posX=201,posZ=115,monsterIndex=1}, {posX=192,posZ=102,monsterIndex=1}
											 }	
			}
} 												                                                                                             



function x310857_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x310857_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x310857_g_GameOpenId > 0 and GetGameOpenById( x310857_g_GameOpenId ) <= 0 then
      return
  end

  
 	--创建年兽
	for i, item in x310857_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
					
				 local objId, guid = CreateMonster( SceneId, 
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x310857_g_ScriptId, 
																						 -1,  
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x310857_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
			end
		end
	end
end

function x310857_ProcDie( sceneId, selfId, killerId )

end
