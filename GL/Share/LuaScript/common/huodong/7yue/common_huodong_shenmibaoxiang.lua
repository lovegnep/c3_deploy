--怪物突袭

x302534_g_ScriptId = 302534;
x302534_g_GameOpenId = 1075;
x302534_g_ValidScene = {0};			--有效场景
x302534_var_FeastId = 13

--年兽配置表， 第一行配置年兽，第二行配置年兽王
x302534_g_MonsterInfo = {
													{ id = 11036, baseAI = 3, highAI = -1, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽						
													{ id = 11037, baseAI = 0, highAI = -1, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
												}																	
--年兽生成配置表， monsterIndex为在x302534_g_MonsterInfo表格中的索引
x302534_g_CreateMonsterConfigTb = {
			--大都
			{sceneId = 0, pos={ {posX=61 ,posZ=359,monsterIndex=1}, {posX=70 ,posZ=374,monsterIndex=1},
													{posX=83 ,posZ=361,monsterIndex=1}, {posX=89 ,posZ=342,monsterIndex=1},
													{posX=99 ,posZ=369,monsterIndex=1}, {posX=105,posZ=388,monsterIndex=1},
													{posX=106,posZ=411,monsterIndex=1}, {posX=124,posZ=429,monsterIndex=1},
													{posX=145,posZ=437,monsterIndex=1}, {posX=164,posZ=448,monsterIndex=1},
													{posX=129,posZ=441,monsterIndex=1}, {posX=196,posZ=411,monsterIndex=1},
													{posX=207,posZ=439,monsterIndex=1}, {posX=199,posZ=423,monsterIndex=1},
													{posX=198,posZ=402,monsterIndex=1}, {posX=218,posZ=399,monsterIndex=1},
													{posX=239,posZ=395,monsterIndex=1}, {posX=223,posZ=365,monsterIndex=1},
													{posX=112,posZ=306,monsterIndex=1}, {posX=250,posZ=408,monsterIndex=1},
													{posX=266,posZ=417,monsterIndex=1}, {posX=275,posZ=398,monsterIndex=1},
													{posX=210,posZ=340,monsterIndex=1}, {posX=205,posZ=380,monsterIndex=1},
													{posX=292,posZ=423,monsterIndex=1}, {posX=314,posZ=426,monsterIndex=1},
													{posX=335,posZ=440,monsterIndex=1}, {posX=356,posZ=446,monsterIndex=1},
											  	{posX=378,posZ=448,monsterIndex=1}, {posX=391,posZ=436,monsterIndex=1},
											  	{posX=400,posZ=460,monsterIndex=1}, {posX=355,posZ=424,monsterIndex=1},
													{posX=359,posZ=409,monsterIndex=1}, {posX=317,posZ=446,monsterIndex=1},
													{posX=305,posZ=461,monsterIndex=1}, {posX=291,posZ=453,monsterIndex=1},
													{posX=286,posZ=467,monsterIndex=1}, {posX=259,posZ=420,monsterIndex=1},
											 		{posX=238,posZ=421,monsterIndex=1}, {posX=168,posZ=478,monsterIndex=1},							  
											 		{posX=184,posZ=439,monsterIndex=1}, {posX=185,posZ=466,monsterIndex=1},
											 		{posX=227,posZ=427,monsterIndex=1}, {posX=299,posZ=344,monsterIndex=1},
											  	{posX=339,posZ=459,monsterIndex=1}, {posX=300,posZ=377,monsterIndex=1},
											  	{posX=285,posZ=359,monsterIndex=1}, {posX=204,posZ=365,monsterIndex=1},		  
											  	{posX=226,posZ=341,monsterIndex=1}, {posX=246,posZ=326,monsterIndex=1},
											  	{posX=263,posZ=331,monsterIndex=1}, {posX=281,posZ=384,monsterIndex=1},											  
											  	{posX=175,posZ=351,monsterIndex=1}, {posX=152,posZ=344,monsterIndex=1},											   
											  	{posX=126,posZ=344,monsterIndex=1}, {posX=109,posZ=328,monsterIndex=1},
											  	{posX=92 ,posZ=308,monsterIndex=1}, {posX=80 ,posZ=335,monsterIndex=1},
											  	{posX=93 ,posZ=425,monsterIndex=1}, {posX=109,posZ=440,monsterIndex=1},
											 }	
			},

} 												                                                                                             



function x302534_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x302534_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x302534_g_GameOpenId > 0 and GetGameOpenById( x302534_g_GameOpenId ) <= 0 then
      return
  end


 	--创建年兽
	for i, item in x302534_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
				 local objId, guid = CreateMonster( SceneId, 
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x302534_g_ScriptId, 
																						 -1,  
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x302534_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
			end
		end
	end
end

 function x302534_ProcDie( sceneId, selfId, killerId )
	--取随机判断 空 or 刷怪 or 掉物品
			local posX,posZ = GetWorldPos(sceneId, selfId)

			local rand = random(1,10)
			if rand <= 5 then
					Msg2Player(sceneId, killerId, "宝箱里掉落出来一堆宝贝。", 0, 3)
					x302534_DropItem( sceneId ,selfId)
			elseif rand <= 9 then 
		
			 		 local objId, guid =CreateMonster(
													 sceneId, 
													 x302534_g_MonsterInfo[ 2 ].id,
													 posX,  
													 posZ,  
													 x302534_g_MonsterInfo[ 2 ].baseAI,
													 x302534_g_MonsterInfo[ 2 ].highAI,
													 -1, 
													 -1,  
													 x302534_g_MonsterInfo[ 2 ].campId,  
													 x302534_g_MonsterInfo[ 2 ].liveTime, 
													 x302534_g_MonsterInfo[ 2 ].dir,
													 x302534_g_MonsterInfo[ 2 ].name,
													 x302534_g_MonsterInfo[ 2 ].title )

					Msg2Player(sceneId, killerId, "一缕浓烟冒起，宝箱里冲出来一只丑恶的怪物！", 0, 3)
					
			else
				Msg2Player(sceneId, killerId, "宝箱里空空如也，继续寻找下一个吧！", 0, 3)
			end
end

function x302534_DropItem( varMap,selfId)

					StartItemTask(varMap)
					ItemAppend( varMap, 12110216, 4 )   --天狼盔甲碎片 
					local a = random(1,10)  
					if a <= 4 then 
						ItemAppend( varMap,12030056 , 1 )
					elseif a <= 7 then
						ItemAppend( varMap, 12030057, 1 )		--金条
					else
						ItemAppend( varMap, 12030058, 1 )
					end
					DropItemListToScene(varMap, selfId, 0)
--------------------下面为掉落不绑定道具：字符	-----------------------				
					--SendSpecificImpactToUnit(varMap, k, k, k,buff, 0);
	
end
