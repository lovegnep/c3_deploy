--春节活动之天降年兽

x310859_g_ScriptId = 310859;
x310859_g_GameOpenId = 1075;
x310859_g_ValidScene = {0};			--有效场景


--年兽配置表， 第一行配置年兽，第二行配置年兽王
x310859_g_MonsterInfo = {
													{ id = 11028, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽						
												}																	

--年兽生成配置表， monsterIndex为在x310859_g_MonsterInfo表格中的索引
x310859_g_CreateMonsterConfigTb = {
			--大都
			{sceneId=0, pos={  {posX=282,posZ=241,monsterIndex=1}, {posX=210,posZ=231,monsterIndex=1}, {posX=157,posZ=233,monsterIndex=1}, {posX=450,posZ=335,monsterIndex=1},	
												 {posX=292,posZ=207,monsterIndex=1}, {posX=268,posZ=280,monsterIndex=1}, {posX=152,posZ=217,monsterIndex=1},  {posX=336,posZ=375,monsterIndex=1}, 
												 {posX=311,posZ=199,monsterIndex=1}, {posX=293,posZ=282,monsterIndex=1}, {posX=127,posZ=269,monsterIndex=1},  {posX=370,posZ=455,monsterIndex=1}, 
												 {posX=313,posZ=182,monsterIndex=1}, {posX=318,posZ=273,monsterIndex=1}, {posX=130,posZ=229,monsterIndex=1},  {posX=399,posZ=452,monsterIndex=1}, 
												 {posX=287,posZ=184,monsterIndex=1}, {posX=315,posZ=255,monsterIndex=1}, {posX=96,posZ=229,monsterIndex=1},   {posX=345,posZ=440,monsterIndex=1}, 
												 {posX=255,posZ=172,monsterIndex=1}, {posX=320,posZ=245,monsterIndex=1}, {posX=76,posZ=214,monsterIndex=1},  {posX=39,posZ=470,monsterIndex=1},   
												 {posX=192,posZ=175,monsterIndex=1}, {posX=317,posZ=279,monsterIndex=1}, {posX=57,posZ=212,monsterIndex=1},  {posX=92,posZ=477,monsterIndex=1},   
												 {posX=197,posZ=197,monsterIndex=1}, {posX=349,posZ=281,monsterIndex=1}, {posX=34,posZ=250,monsterIndex=1},  {posX=106,posZ=468,monsterIndex=1},  
												 {posX=188,posZ=219,monsterIndex=1}, {posX=195,posZ=272,monsterIndex=1}, {posX=50,posZ=251,monsterIndex=1},  {posX=134,posZ=475,monsterIndex=1},  
												 {posX=199,posZ=220,monsterIndex=1}, {posX=154,posZ=254,monsterIndex=1}, {posX=61,posZ=185,monsterIndex=1},  {posX=193,posZ=441,monsterIndex=1},  
												{posX=141,posZ=151,monsterIndex=1}, {posX=139,posZ=81,monsterIndex=1}, {posX=335,posZ=197,monsterIndex=1},   {posX=145,posZ=381,monsterIndex=1},  
												{posX=108,posZ=118,monsterIndex=1}, {posX=152,posZ=174,monsterIndex=1}, {posX=422,posZ=113,monsterIndex=1},   {posX=252,posZ=167,monsterIndex=1}, 
												{posX=101,posZ=105,monsterIndex=1}, {posX=155,posZ=199,monsterIndex=1}, {posX=456,posZ=123,monsterIndex=1}, {posX=98,posZ=343,monsterIndex=1}, 
												 {posX=113,posZ=71,monsterIndex=1}, {posX=369,posZ=194,monsterIndex=1}, {posX=441,posZ=158,monsterIndex=1}, {posX=84,posZ=360,monsterIndex=1}, 
											   {posX=112,posZ=52,monsterIndex=1}, {posX=394,posZ=192,monsterIndex=1}, {posX=461,posZ=194,monsterIndex=1}, {posX=60,posZ=351,monsterIndex=1}, 
											   {posX=89,posZ=60,monsterIndex=1}, {posX=401,posZ=174,monsterIndex=1}, {posX=448,posZ=188,monsterIndex=1},  {posX=95,posZ=364,monsterIndex=1}, 
												{posX=64,posZ=53,monsterIndex=1}, {posX=373,posZ=147,monsterIndex=1}, {posX=417,posZ=169,monsterIndex=1},   {posX=46,posZ=441,monsterIndex=1}, 
												{posX=62,posZ=91,monsterIndex=1}, {posX=364,posZ=161,monsterIndex=1}, {posX=417,posZ=263,monsterIndex=1},   {posX=196,posZ=426,monsterIndex=1},
												{posX=58,posZ=109,monsterIndex=1}, {posX=387,posZ=126,monsterIndex=1}, {posX=444,posZ=306,monsterIndex=1}, {posX=211,posZ=380,monsterIndex=1},
											  {posX=123,posZ=151,monsterIndex=1}, {posX=80,posZ=114,monsterIndex=1}, {posX=390,posZ=114,monsterIndex=1}, {posX=186,posZ=361,monsterIndex=1},										  
											  {posX=415,posZ=354,monsterIndex=1}, {posX=239,posZ=313,monsterIndex=1}, {posX=308,posZ=403,monsterIndex=1},{posX=168,posZ=345,monsterIndex=1},
											  {posX=327,posZ=340,monsterIndex=1}, {posX=239,posZ=331,monsterIndex=1}, {posX=317,posZ=435,monsterIndex=1},{posX=110,posZ=322,monsterIndex=1},
											  {posX=301,posZ=335,monsterIndex=1}, {posX=281,posZ=349,monsterIndex=1}, {posX=327,posZ=444,monsterIndex=1},{posX=91,posZ=331,monsterIndex=1}, 
											  {posX=272,posZ=319,monsterIndex=1}, {posX=296,posZ=381,monsterIndex=1}, {posX=370,posZ=375,monsterIndex=1},{posX=142,posZ=405,monsterIndex=1},											  
											  {posX=323,posZ=428,monsterIndex=1}, {posX=217,posZ=364,monsterIndex=1}, {posX=85,posZ=303,monsterIndex=1}, {posX=251,posZ=396,monsterIndex=1},  
											  {posX=309,posZ=410,monsterIndex=1},  {posX=275,posZ=405,monsterIndex=1},  {posX=260,posZ=418,monsterIndex=1}, {posX=284,posZ=377,monsterIndex=1}, 
											   {posX=134,posZ=390,monsterIndex=1}											  											   
											 }	
			}
} 												                                                                                             




function x310859_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x310859_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x310859_g_GameOpenId > 0 and GetGameOpenById( x310859_g_GameOpenId ) <= 0 then
      return
  end

  
 	--创建年兽
	for i, item in x310859_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
					
				 local objId, guid = CreateMonster( SceneId, 
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x310859_g_ScriptId, 
																						 -1,  
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x310859_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
			end
		end
	end
end

function x310859_ProcDie( sceneId, selfId, killerId )

end
