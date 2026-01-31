--春节活动之天降年兽

x310858_g_ScriptId = 310858;
x310858_g_GameOpenId = 1075;
x310858_g_ValidScene = {0};			--有效场景


--年兽配置表， 第一行配置年兽，第二行配置年兽王
x310858_g_MonsterInfo = {
													{ id = 11029, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽						
												}																	

--年兽生成配置表， monsterIndex为在x310858_g_MonsterInfo表格中的索引
x310858_g_CreateMonsterConfigTb = {{sceneId=0, pos={ {posX=254,posZ=397,monsterIndex=1}}	}}

function x310858_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x310858_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x310858_g_GameOpenId > 0 and GetGameOpenById( x310858_g_GameOpenId ) <= 0 then
      return
  end
  
 	--创建年兽
	for i, item in x310858_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
					print(item.pos)
				 local objId, guid = CreateMonster( SceneId, 
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x310858_g_ScriptId, 
																						 -1,  
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x310858_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
			end
		end
	end
end

function x310858_ProcDie( sceneId, selfId, killerId )

end
