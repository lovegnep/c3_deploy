--怪物突袭

x302536_g_ScriptId = 302536;
x302536_g_GameOpenId = 1075;
x302536_g_ValidScene = {50,150,250,350};			--有效场景
x302536_var_FeastId = 13


--年兽配置表， 第一行配置年兽，第二行配置年兽王
x302536_g_MonsterInfo = {
													{ id = 11039, baseAI = 1, highAI = -1, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --天狼巫师						
													{ id = 11038, baseAI = 3, highAI = -1, campId = 20, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },--传送特效
												}
x302536_g_Monster ={ id = 11040, baseAI = 0, highAI = -1, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0}													
x302536_g_Monstercoord ={ {posX = 276, posZ = 267},{posX =385 , posZ =127 },{posX =147 , posZ =241 }}																
--年兽生成配置表， monsterIndex为在x302536_g_MonsterInfo表格中的索引
x302536_g_CreateMonsterConfigTb1 ={ {posX=274 ,posZ=265,monsterIndex=1}, {posX=267 ,posZ=265,monsterIndex=1},
																		{posX=280 ,posZ=258,monsterIndex=1}, {posX=290 ,posZ=255,monsterIndex=1},
																		{posX=294 ,posZ=265,monsterIndex=1}, {posX=301 ,posZ=269,monsterIndex=1},
																		{posX=308 ,posZ=267,monsterIndex=1}, {posX=316 ,posZ=259,monsterIndex=1},
																		{posX=322 ,posZ=266,monsterIndex=1}, {posX=331 ,posZ=264,monsterIndex=1},
															    }								
x302536_g_CreateMonsterConfigTb2 ={ {posX=380 ,posZ=105,monsterIndex=1}, {posX=387 ,posZ=97 ,monsterIndex=1},
																		{posX=390 ,posZ=104,monsterIndex=1}, {posX=386 ,posZ=112,monsterIndex=1},
																		{posX=382 ,posZ=120,monsterIndex=1}, {posX=388 ,posZ=121,monsterIndex=1},
																		{posX=396 ,posZ=121,monsterIndex=1}, {posX=391 ,posZ=128,monsterIndex=1},
																		{posX=383 ,posZ=133,monsterIndex=1}, {posX=376 ,posZ=133,monsterIndex=1},
																	}						
x302536_g_CreateMonsterConfigTb3 ={	{posX=147, posZ=238,monsterIndex=1}, {posX=140 ,posZ=246,monsterIndex=1},
																			{posX=130, posZ=243,monsterIndex=1}, {posX=123 ,posZ=243,monsterIndex=1},
																			{posX=117, posZ=250,monsterIndex=1}, {posX=122 ,posZ=256,monsterIndex=1},
																			{posX=125, posZ=262,monsterIndex=1}, {posX=145 ,posZ=245,monsterIndex=1},
																			{posX=156, posZ=236,monsterIndex=1}, {posX=151 ,posZ=244,monsterIndex=1},
													  			}	
										                                                                                             

function x302536_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	--检查地图是否匹配
		if x302536_g_GameOpenId > 0 and GetGameOpenById( x302536_g_GameOpenId ) <= 0 then
      return
  end
	for i, item in x302536_g_ValidScene do
		if SceneId == item then


	--检查活动是否开启

					for i=1,3 do
						local b = 1
						for j=1,2 do
						if b == 1 then
							x302536_g_ScriptId = 302536
						else
							x302536_g_ScriptId = -1
						end
										local objId =CreateMonster(				 SceneId, 
																		 x302536_g_MonsterInfo[ j ].id,
																		 x302536_g_Monstercoord[i].posX,  
																		 x302536_g_Monstercoord[i].posZ,  
																		 x302536_g_MonsterInfo[ j ].baseAI,
																		 x302536_g_MonsterInfo[ j ].highAI,
																		 x302536_g_ScriptId, 
																		 -1,  
																		 x302536_g_MonsterInfo[ j ].campId,  
																		 x302536_g_MonsterInfo[ j ].liveTime, 
																		 x302536_g_MonsterInfo[ j ].dir,
																		 x302536_g_MonsterInfo[ j ].name,
																		 x302536_g_MonsterInfo[ j ].title )
								b = b + 1
						end
					end
						--NpcTalk(SceneId, objId,"开启传送，天狼王至尊无上！" ,-1)

		end
	end
end

 function x302536_ProcDie( sceneId, selfId, killerId )

 		local posX = GetPlayerWorldX(sceneId,killerId)
 		local posZ = GetPlayerWorldZ(sceneId,killerId)
 		local a = 1
		for k = 1, 3 do
			if posX > (x302536_g_Monstercoord[k].posX - 50) and posX < (x302536_g_Monstercoord[k].posX + 30) and posZ > (x302536_g_Monstercoord[k].posZ - 30) and posZ < (x302536_g_Monstercoord[k].posZ + 30) then
					posX = x302536_g_Monstercoord[k].posX
					posZ = x302536_g_Monstercoord[k].posZ
					break
			end
			a = a + 1
		end
		if a == 1 then
			for j, item in x302536_g_CreateMonsterConfigTb1 do
					 local objId = CreateMonster( sceneId, 
																							 x302536_g_Monster.id,
																							 x302536_g_CreateMonsterConfigTb1[j].posX,  
																							 x302536_g_CreateMonsterConfigTb1[j].posZ,  
																							 x302536_g_Monster.baseAI,
																							 x302536_g_Monster.highAI,
																							 -1, 
																							 -1,  
																							 x302536_g_Monster.campId,  
																							 x302536_g_Monster.liveTime, 
																							 x302536_g_Monster.dir,
																							 x302536_g_Monster.name,
																							 x302536_g_Monster.title );	 
			end
		elseif a == 2 then
			for j, item in x302536_g_CreateMonsterConfigTb2 do
					 local objId = CreateMonster( sceneId, 
																							 x302536_g_Monster.id,
																							 x302536_g_CreateMonsterConfigTb2[j].posX,  
																							 x302536_g_CreateMonsterConfigTb2[j].posZ,    
																							 x302536_g_Monster.baseAI,
																							 x302536_g_Monster.highAI,
																							 -1, 
																							 -1,  
																							 x302536_g_Monster.campId,  
																							 x302536_g_Monster.liveTime, 
																							 x302536_g_Monster.dir,
																							 x302536_g_Monster.name,
																							 x302536_g_Monster.title );	 
			end
		else
			for j, item in x302536_g_CreateMonsterConfigTb3 do
					 local objId = CreateMonster( sceneId, 
																							 x302536_g_Monster.id,
																							 x302536_g_CreateMonsterConfigTb3[j].posX,  
																							 x302536_g_CreateMonsterConfigTb3[j].posZ,  
																							 x302536_g_Monster.baseAI,
																							 x302536_g_Monster.highAI,
																							 -1, 
																							 -1,  
																							 x302536_g_Monster.campId,  
																							 x302536_g_Monster.liveTime, 
																							 x302536_g_Monster.dir,
																							 x302536_g_Monster.name,
																							 x302536_g_Monster.title );	 
			end
		end
end

function x302536_DropItem( varMap,selfId)

end
