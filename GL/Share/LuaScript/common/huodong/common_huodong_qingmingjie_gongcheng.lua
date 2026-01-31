--清明节活动之亡灵攻城

x310847_g_ScriptId = 310847;
x310847_g_GameOpenId = 1076;

--怪物类型配置表， 第一行配置小怪，第二行配置大怪，一波就刷两种怪
--所以这个数组数目至少要等于 波次的两倍！！
x310847_g_MonsterInfo = {
													{ id = 62746, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君1
													{ id = 62757, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62747, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君2
													{ id = 62757, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62748, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君3
													{ id = 62757, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62749, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君4
													{ id = 62758, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62750, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君5
													{ id = 62758, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62751, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君6
													{ id = 62758, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62752, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君7
													{ id = 62758, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62753, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君8
													{ id = 62758, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62754, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君9
													{ id = 62758, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62755, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君0
													{ id = 62759, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62756, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君1
													{ id = 62759, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62746, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君2
													{ id = 62759, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62747, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君3
													{ id = 62760, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62748, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君4
													{ id = 62760, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62749, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君5
													{ id = 62760, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62750, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君6
													{ id = 62761, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62751, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君7
													{ id = 62761, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62752, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君8
													{ id = 62761, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62753, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君9
													{ id = 62762, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 62754, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君0
													{ id = 62745, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --海都
												}

--刷出点配置表，需要配置属性为：坐标x, 坐标z
x310847_g_CreateMonsterConfigTb = {

					[50] =	{	
										{ x = 106 , z = 137  },  { x = 137 , z = 148 },
										{ x = 92 , z = 130  },  { x = 122 , z = 192 },
										{ x = 148 , z = 213  },  { x = 118, z = 251 },
										{ x = 162 , z = 259  },  { x = 194, z = 259 },
										{ x = 168 , z = 276  },  { x = 238, z = 358 },
										{ x = 269, z = 258  },  { x = 309, z = 258 },
										{ x = 362, z = 256  },  { x = 375, z = 216 },
										{ x = 376, z = 171  },  { x = 383, z = 129 },
										{ x = 411, z = 72  },  { x = 407, z = 145 },
										{ x = 430, z = 170  },  { x = 305, z = 288 },
										{ x = 231, z = 290  },  { x = 208, z = 290 },
										{ x = 307, z = 279  },  { x = 307, z = 298 },
										{ x = 263, z = 309  },  { x = 217, z = 322 },
										{ x = 125, z = 256  },  { x = 163, z = 284 },
										{ x = 360, z = 150 },  { x = 114, z = 328 },
										{ x = 399, z = 79 },  { x = 229, z = 324 },
										{ x = 300, z = 257 },  { x = 281, z = 275 },
										{ x = 240, z = 277 },  { x = 220, z = 321 },
										{ x = 379, z = 183 },  { x = 143 , z = 144 },
										{ x = 183, z = 274 },  { x = 326, z = 325 },
										{ x = 114, z = 157 },  { x = 76 , z = 174 },
										{ x = 215, z = 333 },  { x = 285 , z = 308 },
										{ x = 472 , z = 160 },  { x = 450 , z = 123 },
										{ x = 470 , z = 318 },  { x = 138 , z = 332 },
										{ x = 163 , z = 334 },  { x = 297 , z = 362 },
										{ x = 442 , z = 336 },  { x = 191 , z = 359 },
										{ x = 236 , z = 357 },  { x = 276, z = 380 },
										{ x = 340 , z = 328 },  { x = 355 , z = 360 },
										{ x = 387, z = 347 },  { x = 138 , z = 112 },
										{ x = 365, z = 104 },  { x = 407, z = 201 },
								 	},
											
					[150] =	{	
										{ x = 106 , z = 137  },  { x = 137 , z = 148 },
										{ x = 92 , z = 130  },  { x = 122 , z = 192 },
										{ x = 148 , z = 213  },  { x = 118, z = 251 },
										{ x = 162 , z = 259  },  { x = 194, z = 259 },
										{ x = 168 , z = 276  },  { x = 238, z = 358 },
										{ x = 269, z = 258  },  { x = 309, z = 258 },
										{ x = 362, z = 256  },  { x = 375, z = 216 },
										{ x = 376, z = 171  },  { x = 383, z = 129 },
										{ x = 411, z = 72  },  { x = 407, z = 145 },
										{ x = 430, z = 170  },  { x = 305, z = 288 },
										{ x = 231, z = 290  },  { x = 208, z = 290 },
										{ x = 307, z = 279  },  { x = 307, z = 298 },
										{ x = 263, z = 309  },  { x = 217, z = 322 },
										{ x = 125, z = 256  },  { x = 163, z = 284 },
										{ x = 360, z = 150 },  { x = 114, z = 328 },
										{ x = 399, z = 79 },  { x = 229, z = 324 },
										{ x = 300, z = 257 },  { x = 281, z = 275 },
										{ x = 240, z = 277 },  { x = 220, z = 321 },
										{ x = 379, z = 183 },  { x = 143 , z = 144 },
										{ x = 183, z = 274 },  { x = 326, z = 325 },
										{ x = 114, z = 157 },  { x = 76 , z = 174 },
										{ x = 215, z = 333 },  { x = 285 , z = 308 },
										{ x = 472 , z = 160 },  { x = 450 , z = 123 },
										{ x = 470 , z = 318 },  { x = 138 , z = 332 },
										{ x = 163 , z = 334 },  { x = 297 , z = 362 },
										{ x = 442 , z = 336 },  { x = 191 , z = 359 },
										{ x = 236 , z = 357 },  { x = 276, z = 380 },
										{ x = 340 , z = 328 },  { x = 355 , z = 360 },
										{ x = 387, z = 347 },  { x = 138 , z = 112 },
										{ x = 365, z = 104 },  { x = 407, z = 201 },
									},
											
					[250] =	{	
										{ x = 106 , z = 137  },  { x = 137 , z = 148 },
										{ x = 92 , z = 130  },  { x = 122 , z = 192 },
										{ x = 148 , z = 213  },  { x = 118, z = 251 },
										{ x = 162 , z = 259  },  { x = 194, z = 259 },
										{ x = 168 , z = 276  },  { x = 238, z = 358 },
										{ x = 269, z = 258  },  { x = 309, z = 258 },
										{ x = 362, z = 256  },  { x = 375, z = 216 },
										{ x = 376, z = 171  },  { x = 383, z = 129 },
										{ x = 411, z = 72  },  { x = 407, z = 145 },
										{ x = 430, z = 170  },  { x = 305, z = 288 },
										{ x = 231, z = 290  },  { x = 208, z = 290 },
										{ x = 307, z = 279  },  { x = 307, z = 298 },
										{ x = 263, z = 309  },  { x = 217, z = 322 },
										{ x = 125, z = 256  },  { x = 163, z = 284 },
										{ x = 360, z = 150 },  { x = 114, z = 328 },
										{ x = 399, z = 79 },  { x = 229, z = 324 },
										{ x = 300, z = 257 },  { x = 281, z = 275 },
										{ x = 240, z = 277 },  { x = 220, z = 321 },
										{ x = 379, z = 183 },  { x = 143 , z = 144 },
										{ x = 183, z = 274 },  { x = 326, z = 325 },
										{ x = 114, z = 157 },  { x = 76 , z = 174 },
										{ x = 215, z = 333 },  { x = 285 , z = 308 },
										{ x = 472 , z = 160 },  { x = 450 , z = 123 },
										{ x = 470 , z = 318 },  { x = 138 , z = 332 },
										{ x = 163 , z = 334 },  { x = 297 , z = 362 },
										{ x = 442 , z = 336 },  { x = 191 , z = 359 },
										{ x = 236 , z = 357 },  { x = 276, z = 380 },
										{ x = 340 , z = 328 },  { x = 355 , z = 360 },
										{ x = 387, z = 347 },  { x = 138 , z = 112 },
										{ x = 365, z = 104 },  { x = 407, z = 201 },
									},
											
					[350] =	{	
										{ x = 106 , z = 137  },  { x = 137 , z = 148 },
										{ x = 92 , z = 130  },  { x = 122 , z = 192 },
										{ x = 148 , z = 213  },  { x = 118, z = 251 },
										{ x = 162 , z = 259  },  { x = 194, z = 259 },
										{ x = 168 , z = 276  },  { x = 238, z = 358 },
										{ x = 269, z = 258  },  { x = 309, z = 258 },
										{ x = 362, z = 256  },  { x = 375, z = 216 },
										{ x = 376, z = 171  },  { x = 383, z = 129 },
										{ x = 411, z = 72  },  { x = 407, z = 145 },
										{ x = 430, z = 170  },  { x = 305, z = 288 },
										{ x = 231, z = 290  },  { x = 208, z = 290 },
										{ x = 307, z = 279  },  { x = 307, z = 298 },
										{ x = 263, z = 309  },  { x = 217, z = 322 },
										{ x = 125, z = 256  },  { x = 163, z = 284 },
										{ x = 360, z = 150 },  { x = 114, z = 328 },
										{ x = 399, z = 79 },  { x = 229, z = 324 },
										{ x = 300, z = 257 },  { x = 281, z = 275 },
										{ x = 240, z = 277 },  { x = 220, z = 321 },
										{ x = 379, z = 183 },  { x = 143 , z = 144 },
										{ x = 183, z = 274 },  { x = 326, z = 325 },
										{ x = 114, z = 157 },  { x = 76 , z = 174 },
										{ x = 215, z = 333 },  { x = 285 , z = 308 },
										{ x = 472 , z = 160 },  { x = 450 , z = 123 },
										{ x = 470 , z = 318 },  { x = 138 , z = 332 },
										{ x = 163 , z = 334 },  { x = 297 , z = 362 },
										{ x = 442 , z = 336 },  { x = 191 , z = 359 },
										{ x = 236 , z = 357 },  { x = 276, z = 380 },
										{ x = 340 , z = 328 },  { x = 355 , z = 360 },
										{ x = 387, z = 347 },  { x = 138 , z = 112 },
										{ x = 365, z = 104 },  { x = 407, z = 201 },
									}
}

--波次配置表
x310847_g_RushConfigTb = {
			
			[1] = { monsterCount = 30, monsterKingCount = 0 },
			[2] = { monsterCount = 30, monsterKingCount = 0 },
			[3] = { monsterCount = 30, monsterKingCount = 1 },
			[4] = { monsterCount = 30, monsterKingCount = 0 },
			[5] = { monsterCount = 30, monsterKingCount = 0 },
			
			[6] = { monsterCount = 30, monsterKingCount = 1 },
			[7] = { monsterCount = 30, monsterKingCount = 0 },
			[8] = { monsterCount = 30, monsterKingCount = 0 },
			[9] = { monsterCount = 30, monsterKingCount = 2 },
			[10] = { monsterCount = 30, monsterKingCount = 0 },
			
			[11] = { monsterCount = 30, monsterKingCount = 0 },
			[12] = { monsterCount = 30, monsterKingCount = 2 },
			[13] = { monsterCount = 30, monsterKingCount = 0 },
			[14] = { monsterCount = 30, monsterKingCount = 0 },
			[15] = { monsterCount = 30, monsterKingCount = 2 },
			
			[16] = { monsterCount = 30, monsterKingCount = 0 },
			[17] = { monsterCount = 30, monsterKingCount = 0 },
			[18] = { monsterCount = 30, monsterKingCount = 2 },
			[19] = { monsterCount = 30, monsterKingCount = 0 },
			[20] = { monsterCount = 30, monsterKingCount = 1 },
}

x310847_g_MaxRushNum = 20     --总共几波 = table.getn(x310847_g_RushConfigTb)


------------------------------------------------------------------------------------------------------------------
--需要配置的内容都在上面，下面不需配置
-------------------------------------------------------------------------------------------------------------------

x310847_g_CurrentRushNum = {}; --当前是第几波
x310847_g_CurrentRushTotalCount = {}; --当前这一波总共要刷多少怪
x310847_g_CurrentRushDieCount = {};   --当前这一波死了多少怪
x310847_g_MonsterObjId2MonsterId = {};  --通过objId得到魔君id

--//////////////////////////////////////////////////////////////////////////////////
--	x310847_ProcTimingDoingStart
--/////////////////////////////////////////////////////////////////////////////////
function x310847_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	
	--检查地图是否合法
	if SceneId ~= 50 and SceneId ~= 150 and SceneId ~= 250 and SceneId ~= 350 then
		return
	end
	
	--活动是否开启
	if x310847_g_GameOpenId > 0 and GetGameOpenById( x310847_g_GameOpenId ) <= 0 then
      return
  end
  
  --第一个参数为1表示清除所有怪，用于活动结束
  if Param1 == 1 then
     
     x310847_g_CurrentRushNum[SceneId] = x310847_g_MaxRushNum;
     
     for objId, value in x310847_g_MonsterObjId2MonsterId[SceneId] do
     		 if value ~= nil then
     		 	DeleteMonster( SceneId, objId );    
     		 end
     end
  	
  	 x310847_g_MonsterObjId2MonsterId[SceneId] = {};
    	
  else -- 开始活动
  		
  		x310847_g_MonsterObjId2MonsterId[SceneId] = {};
  		x310847_g_CurrentRushNum[SceneId] = 0; 
  		x310847_g_CurrentRushTotalCount[SceneId] = 0;
  		x310847_g_CurrentRushDieCount[SceneId] = 0;
			x310847_OnRush( SceneId )
	end

end

--//////////////////////////////////////////////////////////////////////////////////
--	x310847_ProcDie 处理怪物被打死事件
--/////////////////////////////////////////////////////////////////////////////////
function x310847_ProcDie(sceneId, selfId, killerId)
	
	if IsObjValid( sceneId,killerId ) ~=1 then
		return
	end
	
	local jifenAddition = 1;
	local nKillerType = GetObjType(sceneId, killerId)
	if nKillerType == 1 or nKillerType == 3 then  --是玩家或者召唤兽弄死的，加积分
		 if x310847_g_MonsterObjId2MonsterId[sceneId][selfId] == 1 then --是魔君，加5分
		 		jifenAddition = 5;
		 end
		 SetCountryQuestData( sceneId, 3, CD_HUODONG_XINNIAN, jifenAddition, 1 );
	end
	
	x310847_g_MonsterObjId2MonsterId[sceneId][selfId] = nil;
	
	x310847_g_CurrentRushDieCount[sceneId] = x310847_g_CurrentRushDieCount[sceneId] + 1;
	
	--怪都死了，重新开始下一波
	if x310847_g_CurrentRushDieCount[sceneId] >= x310847_g_CurrentRushTotalCount[sceneId] then 
			x310847_OnRush( sceneId );
	end

end

--//////////////////////////////////////////////////////////////////////////////////
--	x310847_OnRush 开始一波
--/////////////////////////////////////////////////////////////////////////////////
function x310847_OnRush( sceneId )

	if sceneId ~= 50 and sceneId ~= 150 and sceneId ~= 250 and sceneId ~= 350 then
		return
	end
	
	local country = 0;
	if sceneId == 50 then
		country = 0;
	elseif sceneId == 150 then
		country = 1
	elseif sceneId == 250 then
		country = 2
	else
		country = 3
	end

	
	--设置当前第几波
	x310847_g_CurrentRushNum[sceneId] = x310847_g_CurrentRushNum[sceneId] + 1;
	if( x310847_g_CurrentRushNum[sceneId] > x310847_g_MaxRushNum ) then
		ThisScenceM2Country(sceneId, "本次海都袭城活动结束！", country, 5, 0)
		return
	end
	
	--广播一下
	ThisScenceM2Country(sceneId, format("海都袭城第%d波开始了，请大家做好防护！",x310847_g_CurrentRushNum[sceneId] ), country, 5 )
	ThisScenceM2Country(sceneId, format("海都袭城第%d波开始了，请大家做好防护！",x310847_g_CurrentRushNum[sceneId] ), country, 1 )
	
	local info = x310847_g_RushConfigTb[x310847_g_CurrentRushNum[sceneId]];
	
	--当前波总共要刷多少怪
	x310847_g_CurrentRushTotalCount[sceneId] = info.monsterCount + info.monsterKingCount;
	
	--当前波死了多少怪
	x310847_g_CurrentRushDieCount[sceneId] = 0;
			
	--刷怪
	local randArray = {};
	local posCount = 0;
	for i, item in x310847_g_CreateMonsterConfigTb[sceneId] do
			randArray[i] = x310847_g_CreateMonsterConfigTb[sceneId][i]
			posCount = posCount + 1;
	end
	
	local monsterIndex = ( x310847_g_CurrentRushNum[sceneId] -1 ) * 2 + 1;
	local iter = 1;
	while iter <= info.monsterCount do
			  
			  local posIndex = random( iter, posCount )
			  local pos = randArray[posIndex];
			 
			  
			  local objId = CreateMonster( sceneId, 
			 									x310847_g_MonsterInfo[monsterIndex].id, 
			 									pos.x,
			 									pos.z,
			 									x310847_g_MonsterInfo[monsterIndex].baseAI, 
			 									x310847_g_MonsterInfo[monsterIndex].highAI, 
			 									x310847_g_ScriptId, 
			 									-1, 
			 									x310847_g_MonsterInfo[monsterIndex].campId, 
			 									x310847_g_MonsterInfo[monsterIndex].liveTime, 
			 									x310847_g_MonsterInfo[monsterIndex].dir,
			 									x310847_g_MonsterInfo[monsterIndex].name, 
			 									x310847_g_MonsterInfo[monsterIndex].title )
			
			  x310847_g_MonsterObjId2MonsterId[sceneId][objId] = 0;
			  
			  if iter ~= posIndex then
			  	randArray[posIndex] = randArray[iter]
			  	randArray[iter] = pos		
			  end	  			  
			  
			  iter = iter + 1;
			  
			  if iter > posCount then
			  	 iter = 1
			  end
	end
	
	monsterIndex = monsterIndex + 1
	while iter <= x310847_g_CurrentRushTotalCount[sceneId] do
			
				local posIndex = random( iter, posCount )
			  local pos = randArray[posIndex];
			  
			  local objId = CreateMonster( sceneId, 
			 									x310847_g_MonsterInfo[monsterIndex].id, 
			 									pos.x,
			 									pos.z,
			 									x310847_g_MonsterInfo[monsterIndex].baseAI, 
			 									x310847_g_MonsterInfo[monsterIndex].highAI, 
			 									x310847_g_ScriptId, 
			 									-1, 
			 									x310847_g_MonsterInfo[monsterIndex].campId, 
			 									x310847_g_MonsterInfo[monsterIndex].liveTime, 
			 									x310847_g_MonsterInfo[monsterIndex].dir,
			 									x310847_g_MonsterInfo[monsterIndex].name, 
			 									x310847_g_MonsterInfo[monsterIndex].title )
			
			  x310847_g_MonsterObjId2MonsterId[sceneId][objId] = 1;
			  
			  if iter ~= posIndex then
			  	randArray[posIndex] = randArray[iter]
			  	randArray[iter] = pos		
			  end	  			  
			  
			  iter = iter + 1;		
			  
			  if iter > posCount then
			  	 iter = 1
			  end	
	end
		
end
