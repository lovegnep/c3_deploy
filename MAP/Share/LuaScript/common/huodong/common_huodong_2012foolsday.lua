--愚人节活动

x310849_g_ScriptId = 310849;
x310849_g_GameOpenId = 1075;
x310849_g_ValidScene = {51, 151, 251, 351};			--有效场景


--怪物配置表， 第一行配置不掉东西的怪，第二行配置掉东西的怪
x310849_g_MonsterInfo = {
													{ id = 62743, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽
													{ id = 62744, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽王											
												}																	
																
--怪物生成配置表， monsterIndex为在x310849_g_MonsterInfo表格中的索引
x310849_g_CreateMonsterConfigTb = {
	
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
											 }												 
			},									
}

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

x310849_g_MonsterObjId2MonsterId = {};

function x310849_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x310849_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x310849_g_GameOpenId > 0 and GetGameOpenById( x310849_g_GameOpenId ) <= 0 then
      return
  end
  
  local tableExist = 0
  for x, y in x310849_g_MonsterObjId2MonsterId do
  		if x == SceneId then
  			tableExist = 1
  			break
  		end
  end
  
  if tableExist == 0 then
  	 x310849_g_MonsterObjId2MonsterId[SceneId] = {}
  end
--掉东西的boss
local roll =random(1,20)
	for k, item in x310849_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for l, itemDetail in item.pos do
				if l == roll then
			 		local objId, guid = CreateMonster( SceneId, 
																					 x310849_g_MonsterInfo[2].id,
																					 itemDetail.posX,  
																					 itemDetail.posZ,  
																					 x310849_g_MonsterInfo[2].baseAI,
																					 x310849_g_MonsterInfo[2].highAI,
																					 x310849_g_ScriptId, 
																					 -1,  
																					 x310849_g_MonsterInfo[2].campId,  
																					 x310849_g_MonsterInfo[2].liveTime, 
																					 x310849_g_MonsterInfo[2].dir,
																					 x310849_g_MonsterInfo[2].name,
																					 x310849_g_MonsterInfo[2].title );	 
			
			--记录objId对应的monsterId																	 															
					x310849_g_MonsterObjId2MonsterId[SceneId][objId] =  x310849_g_MonsterInfo[2].id;
				end	
			end
		end
	end
--不掉东西的boss
	for i, item in x310849_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
				if j ~= roll then
			 		local objId, guid = CreateMonster( SceneId, 
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																					 itemDetail.posX,  
																					 itemDetail.posZ,  
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																					 x310849_g_ScriptId, 
																					 -1,  
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																					 x310849_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
			
			--记录objId对应的monsterId																	 															
					x310849_g_MonsterObjId2MonsterId[SceneId][objId] =  x310849_g_MonsterInfo[ itemDetail.monsterIndex ].id;
				end
			end
		end
	end
end

function x310849_ProcDie( sceneId, selfId, killerId )
	
	if IsObjValid( sceneId,killerId ) ~=1 then
		return
	end
end

