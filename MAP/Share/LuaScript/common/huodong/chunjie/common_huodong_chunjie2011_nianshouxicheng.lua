--春节活动之魔君袭城

x310804_g_ScriptId = 310804;
x310804_g_GameOpenId = 1076;

--怪物类型配置表， 第一行配置小怪，第二行配置大怪，一波就刷两种怪
--所以这个数组数目至少要等于 波次的两倍！！
x310804_g_MonsterInfo = {
													{ id = 11005, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君1
													{ id = 11020, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11006, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君2
													{ id = 11020, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11007, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君3
													{ id = 11020, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11008, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君4
													{ id = 11021, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11009, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君5
													{ id = 11021, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11010, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君6
													{ id = 11021, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11011, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君7
													{ id = 11022, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11012, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君8
													{ id = 11022, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11013, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君9
													{ id = 11022, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11014, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君0
													{ id = 11023, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11015, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君1
													{ id = 11023, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11005, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君2
													{ id = 11023, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11006, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君3
													{ id = 11024, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11007, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君4
													{ id = 11024, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11008, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君5
													{ id = 11024, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11009, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君6
													{ id = 11025, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11010, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君7
													{ id = 11025, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11011, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君8
													{ id = 11025, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11012, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君9
													{ id = 11026, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 },
													{ id = 11013, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --魔君0
													{ id = 11004, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --海都
												}

--刷出点配置表，需要配置属性为：坐标x, 坐标z
x310804_g_CreateMonsterConfigTb = {

					[50] =	{	
										{ x = 59 , z = 31  },  { x = 71 , z = 29 },
										{ x = 71 , z = 40  },  { x = 76 , z = 69 },
										{ x = 67 , z = 55  },  { x = 100, z = 76 },
										{ x = 59 , z = 66  },  { x = 109, z = 62 },
										{ x = 90 , z = 69  },  { x = 111, z = 41 },
										{ x = 113, z = 76  },  { x = 125, z = 39 },
										{ x = 110, z = 32  },  { x = 146, z = 54 },
										{ x = 145, z = 34  },  { x = 145, z = 75 },
										{ x = 128, z = 78  },  { x = 163, z = 74 },
										{ x = 174, z = 74  },  { x = 198, z = 43 },
										{ x = 201, z = 70  },  { x = 187, z = 57 },
										{ x = 180, z = 37  },  { x = 188, z = 85 },
										{ x = 194, z = 36  },  { x = 200, z = 112 },
										{ x = 187, z = 98  },  { x = 182, z = 119 },
										{ x = 187, z = 157 },  { x = 188, z = 138 },
										{ x = 186, z = 175 },  { x = 200, z = 165 },
										{ x = 178, z = 195 },  { x = 172, z = 164 },
										{ x = 166, z = 180 },  { x = 197, z = 198 },
										{ x = 143, z = 178 },  { x = 93 , z = 173 },
										{ x = 113, z = 177 },  { x = 128, z = 167 },
										{ x = 114, z = 157 },  { x = 88 , z = 181 },
										{ x = 142, z = 162 },  { x = 85 , z = 163 },
										{ x = 81 , z = 192 },  { x = 54 , z = 167 },
										{ x = 66 , z = 181 },  { x = 58 , z = 121 },
										{ x = 72 , z = 160 },  { x = 74 , z = 110 },
										{ x = 67 , z = 132 },  { x = 68 , z = 78 },
										{ x = 66 , z = 105 },  { x = 158, z = 103 },
										{ x = 19 , z = 140 },  { x = 97 , z = 138 },
										{ x = 244, z = 139 },  { x = 94 , z = 99 },
										{ x = 157, z = 135 },  { x = 181, z = 117 },
								 	},
											
					[150] =	{	
										{ x = 67 , z =40  },{ x = 121, z = 155 },
										{ x = 67 , z =57  },{ x = 114, z = 160},
										{ x = 67 , z =79  },{ x = 121, z = 171},
										{ x = 97 , z =71  },{ x = 117, z = 184},
										{ x = 61 , z =100 },{ x = 94 , z = 172},
										{ x = 19 , z =95  },{ x = 85 , z = 192},
										{ x = 16 , z =140 },{ x = 58 , z = 179},
										{ x = 67 , z =131 },{ x = 84 , z = 164},
										{ x = 62 , z =166 },{ x = 80 , z = 139},
										{ x = 77 , z =186 },{ x = 55 , z = 116},
										{ x = 133, z =175 },{ x = 74 , z = 103},
										{ x = 133, z =158 },{ x = 72 , z = 66 },
										{ x = 139, z =163 },{ x = 85 , z = 73 },
										{ x = 142, z =178 },{ x = 112, z = 82 },
										{ x = 127, z =100 },{ x = 143, z = 60 },
										{ x = 170, z =180 },{ x = 145, z = 43 },
										{ x = 187, z =189 },{ x = 121, z = 33 },
										{ x = 185, z =170 },{ x = 148, z = 79},
										{ x = 193, z =139 },{ x = 187, z = 56},
										{ x = 192, z =115 },{ x = 180, z = 101},
										{ x = 236, z =140 },{ x = 180, z = 127},
										{ x = 241, z =98  },{ x = 170, z = 162},
										{ x = 197, z =105 },{ x = 171, z = 199},
										{ x = 157, z =104 },{ x = 163, z = 136},
										{ x = 98 , z =111 },{ x = 162, z = 118},
										{ x = 167, z =74  },{ x = 89 , z = 124},
										{ x = 186, z =73  },{ x = 104, z = 129},
										{ x = 179, z =43  },{ x = 118, z = 139},
										{ x = 196, z =44  },{ x = 135, z = 142},
										{ x = 128, z =79  },{ x = 153, z = 134},
									},
											
					[250] =	{	
										{ x = 80 , z = 61  }, { x = 163, z = 80  }, 
										{ x = 61 , z = 71  }, { x = 186, z = 69  }, 
										{ x = 79 , z = 87  }, { x = 198, z = 73  }, 
										{ x = 58 , z = 110 }, { x = 180, z = 78  }, 
										{ x = 17 , z = 117 }, { x = 181, z = 111 }, 
										{ x = 20 , z = 162 }, { x = 179, z = 133 }, 
										{ x = 64 , z = 161 }, { x = 202, z = 133 }, 
										{ x = 98 , z = 149 }, { x = 200, z = 149 }, 
										{ x = 100, z = 120 }, { x = 162, z = 166 }, 
										{ x = 76 , z = 115 }, { x = 198, z = 192 }, 
										{ x = 116, z = 99  }, { x = 198, z = 225 }, 
										{ x = 119, z = 75  }, { x = 179, z = 224 }, 
										{ x = 134, z = 73  }, { x = 145, z = 185 }, 
										{ x = 140, z = 95  }, { x = 149, z = 229 }, 
										{ x = 158, z = 26  }, { x = 129, z = 206 }, 
										{ x = 96 , z = 23  }, { x = 114, z = 215 },
										{ x = 172, z = 68  }, { x = 103, z = 230 },
										{ x = 194, z = 86  }, { x = 100, z = 196 },
										{ x = 172, z = 90  }, { x = 86 , z = 215 },
										{ x = 192, z = 124 }, { x = 51 , z = 214 },
										{ x = 188, z = 151 }, { x = 62 , z = 202 },
										{ x = 238, z = 158 }, { x = 73 , z = 144 },
										{ x = 234, z = 114 }, { x = 54 , z = 147 },
										{ x = 189, z = 213 }, { x = 55 , z = 124 },
										{ x = 188, z = 184 }, { x = 66 , z = 125 },
										{ x = 128, z = 172 }, { x = 89 , z = 136 },
										{ x = 102, z = 210 }, { x = 68 , z = 97  },
										{ x = 73 , z = 217 }, { x = 60 , z = 84  },
										{ x = 145, z = 217 }, { x = 74 , z = 74  },
										{ x = 104, z = 186 }, { x = 126, z = 87  },	
									},
											
					[350] =	{	
										{ x = 62 , z = 65  }, { x = 127, z = 83 },
										{ x = 76 , z = 71  }, { x = 153, z = 85 },
										{ x = 67 , z = 90  }, { x = 170, z = 92  },
										{ x = 52 , z = 117 }, { x = 181, z = 79  },
										{ x = 71 , z = 126 }, { x = 172, z = 61  },
										{ x = 79 , z = 157 }, { x = 203, z = 77  },
										{ x = 57 , z = 152 }, { x = 178, z = 94  },
										{ x = 67 , z = 177 }, { x = 173, z = 114 },
										{ x = 53 , z = 216 }, { x = 181, z = 135 },
										{ x = 74 , z = 216 }, { x = 201, z = 132 },
										{ x = 105, z = 151 }, { x = 201, z = 146 },
										{ x = 103, z = 125 }, { x = 199, z = 194 },
										{ x = 153, z = 122 }, { x = 175, z = 211 },
										{ x = 157, z = 151 }, { x = 198, z = 221 },
										{ x = 189, z = 150 }, { x = 172, z = 179 },
										{ x = 195, z = 118 }, { x = 144, z = 191 },
										{ x = 195, z = 90  }, { x = 148, z = 218 },
										{ x = 198, z = 61  }, { x = 139, z = 228 },
										{ x = 169, z = 77  }, { x = 127, z = 219 },
										{ x = 137, z = 71  }, { x = 111, z = 230 },
										{ x = 139, z = 97  }, { x = 112, z = 215 },
										{ x = 116, z = 97  }, { x = 91 , z = 157 },
										{ x = 117, z = 70  }, { x = 89 , z = 135 },
										{ x = 158, z = 25  }, { x = 62 , z = 205 },
										{ x = 98 , z = 24  }, { x = 71 , z = 143 },
										{ x = 127, z = 181 }, { x = 52 , z = 134 },
										{ x = 108, z = 187 }, { x = 69 , z = 105 },
										{ x = 160, z = 181 }, { x = 53 , z = 87  },
										{ x = 189, z = 187 }, { x = 83 , z = 88  },
										{ x = 187, z = 218 }, { x = 99 , z = 76  },
									}
}

--波次配置表
x310804_g_RushConfigTb = {
			
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

x310804_g_MaxRushNum = 20     --总共几波 = table.getn(x310804_g_RushConfigTb)


------------------------------------------------------------------------------------------------------------------
--需要配置的内容都在上面，下面不需配置
-------------------------------------------------------------------------------------------------------------------

x310804_g_CurrentRushNum = {}; --当前是第几波
x310804_g_CurrentRushTotalCount = {}; --当前这一波总共要刷多少怪
x310804_g_CurrentRushDieCount = {};   --当前这一波死了多少怪
x310804_g_MonsterObjId2MonsterId = {};  --通过objId得到魔君id

--//////////////////////////////////////////////////////////////////////////////////
--	x310804_ProcTimingDoingStart
--/////////////////////////////////////////////////////////////////////////////////
function x310804_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	
	--检查地图是否合法
	if SceneId ~= 50 and SceneId ~= 150 and SceneId ~= 250 and SceneId ~= 350 then
		return
	end
	
	--活动是否开启
	if x310804_g_GameOpenId > 0 and GetGameOpenById( x310804_g_GameOpenId ) <= 0 then
      return
  end
  
  --第一个参数为1表示清除所有怪，用于活动结束
  if Param1 == 1 then
     
     x310804_g_CurrentRushNum[SceneId] = x310804_g_MaxRushNum;
     
     for objId, value in x310804_g_MonsterObjId2MonsterId[SceneId] do
     		 if value ~= nil then
     		 	DeleteMonster( SceneId, objId );    
     		 end
     end
  	
  	 x310804_g_MonsterObjId2MonsterId[SceneId] = {};
    	
  else -- 开始活动
  		
  		x310804_g_MonsterObjId2MonsterId[SceneId] = {};
  		x310804_g_CurrentRushNum[SceneId] = 0; 
  		x310804_g_CurrentRushTotalCount[SceneId] = 0;
  		x310804_g_CurrentRushDieCount[SceneId] = 0;
			x310804_OnRush( SceneId )
	end

end

--//////////////////////////////////////////////////////////////////////////////////
--	x310804_ProcDie 处理怪物被打死事件
--/////////////////////////////////////////////////////////////////////////////////
function x310804_ProcDie(sceneId, selfId, killerId)
	
	if IsObjValid( sceneId,killerId ) ~=1 then
		return
	end
	
	local jifenAddition = 1;
	local nKillerType = GetObjType(sceneId, killerId)
	if nKillerType == 1 or nKillerType == 3 then  --是玩家或者召唤兽弄死的，加积分
		 if x310804_g_MonsterObjId2MonsterId[sceneId][selfId] == 1 then --是魔君，加5分
		 		jifenAddition = 5;
		 end
		 SetCountryQuestData( sceneId, 3, CD_HUODONG_XINNIAN, jifenAddition, 1 );
	end
	
	x310804_g_MonsterObjId2MonsterId[sceneId][selfId] = nil;
	
	x310804_g_CurrentRushDieCount[sceneId] = x310804_g_CurrentRushDieCount[sceneId] + 1;
	
	--怪都死了，重新开始下一波
	if x310804_g_CurrentRushDieCount[sceneId] >= x310804_g_CurrentRushTotalCount[sceneId] then 
			x310804_OnRush( sceneId );
	end

end

--//////////////////////////////////////////////////////////////////////////////////
--	x310804_OnRush 开始一波
--/////////////////////////////////////////////////////////////////////////////////
function x310804_OnRush( sceneId )

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
	x310804_g_CurrentRushNum[sceneId] = x310804_g_CurrentRushNum[sceneId] + 1;
	if( x310804_g_CurrentRushNum[sceneId] > x310804_g_MaxRushNum ) then
		ThisScenceM2Country(sceneId, "本次海都袭城活动结束！", country, 5, 0)
		return
	end
	
	--广播一下
	ThisScenceM2Country(sceneId, format("海都袭城第%d波开始了，请大家做好防护！",x310804_g_CurrentRushNum[sceneId] ), country, 5 )
	ThisScenceM2Country(sceneId, format("海都袭城第%d波开始了，请大家做好防护！",x310804_g_CurrentRushNum[sceneId] ), country, 1 )
	
	local info = x310804_g_RushConfigTb[x310804_g_CurrentRushNum[sceneId]];
	
	--当前波总共要刷多少怪
	x310804_g_CurrentRushTotalCount[sceneId] = info.monsterCount + info.monsterKingCount;
	
	--当前波死了多少怪
	x310804_g_CurrentRushDieCount[sceneId] = 0;
			
	--刷怪
	local randArray = {};
	local posCount = 0;
	for i, item in x310804_g_CreateMonsterConfigTb[sceneId] do
			randArray[i] = x310804_g_CreateMonsterConfigTb[sceneId][i]
			posCount = posCount + 1;
	end
	
	local monsterIndex = ( x310804_g_CurrentRushNum[sceneId] -1 ) * 2 + 1;
	local iter = 1;
	while iter <= info.monsterCount do
			  
			  local posIndex = random( iter, posCount )
			  local pos = randArray[posIndex];
			 
			  
			  local objId = CreateMonster( sceneId, 
			 									x310804_g_MonsterInfo[monsterIndex].id, 
			 									pos.x,
			 									pos.z,
			 									x310804_g_MonsterInfo[monsterIndex].baseAI, 
			 									x310804_g_MonsterInfo[monsterIndex].highAI, 
			 									x310804_g_ScriptId, 
			 									-1, 
			 									x310804_g_MonsterInfo[monsterIndex].campId, 
			 									x310804_g_MonsterInfo[monsterIndex].liveTime, 
			 									x310804_g_MonsterInfo[monsterIndex].dir,
			 									x310804_g_MonsterInfo[monsterIndex].name, 
			 									x310804_g_MonsterInfo[monsterIndex].title )
			
			  x310804_g_MonsterObjId2MonsterId[sceneId][objId] = 0;
			  
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
	while iter <= x310804_g_CurrentRushTotalCount[sceneId] do
			
				local posIndex = random( iter, posCount )
			  local pos = randArray[posIndex];
			  
			  local objId = CreateMonster( sceneId, 
			 									x310804_g_MonsterInfo[monsterIndex].id, 
			 									pos.x,
			 									pos.z,
			 									x310804_g_MonsterInfo[monsterIndex].baseAI, 
			 									x310804_g_MonsterInfo[monsterIndex].highAI, 
			 									x310804_g_ScriptId, 
			 									-1, 
			 									x310804_g_MonsterInfo[monsterIndex].campId, 
			 									x310804_g_MonsterInfo[monsterIndex].liveTime, 
			 									x310804_g_MonsterInfo[monsterIndex].dir,
			 									x310804_g_MonsterInfo[monsterIndex].name, 
			 									x310804_g_MonsterInfo[monsterIndex].title )
			
			  x310804_g_MonsterObjId2MonsterId[sceneId][objId] = 1;
			  
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
