 
x270354_var_FileId	= 270354
x270354_var_QuestId	=	{1390 , 1391, 1392, 1393}
x270354_var_QuestScriptId	=	{270350 , 270351, 270352, 270353}




function x270354_ProcEventEntry( varMap, varPlayer,varTalknpc )            
	StartTalkTask(varMap)                                             
	TalkAppendString(varMap,"\t哈哈！还是外面的世界好啊，这次终于不用继续在那暗无天日的地方待着了。")     
	StopTalkTask(varMap)
	local varQuestIdx = -1                                               
	if IsHaveQuest(varMap,varPlayer, 1390) > 0 then
		varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1390) 
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) <= 0 then	                     
		 	TalkAppendButton(varMap, x270354_var_QuestId[1], "你并不属于这里！",0, 1)
		end                  
	end                                               
	if IsHaveQuest(varMap,varPlayer, 1391) > 0 then
		varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1391) 
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) <= 0 then	                     
		 	TalkAppendButton(varMap, x270354_var_QuestId[2], "你并不属于这里！",0, 1)
		end                  
	end                                             
	if IsHaveQuest(varMap,varPlayer, 1392) > 0 then
		varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1392) 
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) <= 0 then	                     
		 	TalkAppendButton(varMap, x270354_var_QuestId[3], "你并不属于这里！",0, 1)
		end                  
	end                                              
	if IsHaveQuest(varMap,varPlayer, 1393) > 0 then
		varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1393) 
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) <= 0 then	                     
		 	TalkAppendButton(varMap, x270354_var_QuestId[4], "你并不属于这里！",0, 1)
		end                  
	end	                                                                  
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)                      
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)                       
end                                                                    

x270354_var_MonsterTable              = {
                                        { minLevel = 20, maxLevel = 29, monList = { { varId = 3840, varObj = 400040, varMap = 58,  varName = "角木熊星",   Place = "西北方" , posName = "@npc_59670"  }, { varId = 3841, varObj = 400041, varMap = 58,  varName = "奎木狼星", 	Place = "东北方" , posName = "@npc_59670"  }, { varId = 3842, varObj = 400042, varMap = 58,  varName = "毕月乌星", 	 Place = "西南方" , posName = "@npc_59670"  }, { varId = 3843, varObj = 400043, varMap = 58,  varName = "翼火蛇星",    		Place = "东南方" , posName = "@npc_59670"  }, { varId = 3844, varObj = 400044,varMap = 58, varName = "胃土彘星", Place = "南方" ,posName = "@npc_59670"  }, { varId = 3845, varObj = 400045,varMap = 58, varName = "女土蝠星", Place = "南方" ,posName = "@npc_59670" } }},  
                                        { minLevel = 30, maxLevel = 34, monList = { { varId = 3846, varObj = 400046, varMap = 104, varName = "鬼金羊星",   Place = "西北方" , posName = "@npc_59671"  }, { varId = 3847, varObj = 400047, varMap = 104, varName = "尾火虎星", 	Place = "东北方" , posName = "@npc_59671"  }, { varId = 3849, varObj = 400049, varMap = 104, varName = "龙堡守卫", 	 Place = "西南方" ,	posName = "@npc_59671"  }, { varId = 3850, varObj = 400050, varMap = 104, varName = "蓝龙", 			 		Place = "东南方" , posName = "@npc_59671"  } }},
                                        { minLevel = 35, maxLevel = 39, monList = { { varId = 3849, varObj = 400049, varMap = 104, varName = "龙堡守卫",   Place = "西南方" , posName = "@npc_59671"  }, { varId = 3850, varObj = 400050, varMap = 104, varName = "蓝龙", 			Place = "东南方" , posName = "@npc_59671"  }, { varId = 3852, varObj = 400052, varMap = 105, varName = "长爪翼龙", 	 Place = "西南方" , posName = "@npc_59672"  }, { varId = 3853, varObj = 400053, varMap = 105, varName = "厌火异兽", 	 		Place = "中部" ,	 posName = "@npc_59672"  } }}, 
                                        { minLevel = 40, maxLevel = 44, monList = { { varId = 3852, varObj = 400052, varMap = 105, varName = "长爪翼龙",   Place = "西南方" , posName = "@npc_59672"  }, { varId = 3853, varObj = 400053, varMap = 105, varName = "厌火异兽", 	Place = "中部" ,	 posName = "@npc_59672"  }, { varId = 3854, varObj = 400054, varMap = 105, varName = "探宝矿工", 	 Place = "东北方" ,	posName = "@npc_59672"  }, { varId = 3856, varObj = 400056, varMap = 105, varName = "地穴恶魔",    		Place = "东方" ,	 posName = "@npc_59672"  } }}, 
                                        { minLevel = 45, maxLevel = 49, monList = { { varId = 3854, varObj = 400054, varMap = 105, varName = "探宝矿工",   Place = "东北方" , posName = "@npc_59672"  }, { varId = 3856, varObj = 400056, varMap = 105, varName = "地穴恶魔", 	Place = "东方" ,	 posName = "@npc_59672"  }, { varId = 3858, varObj = 400058, varMap = 106, varName = "国王子民",	 Place = "西方" ,   posName = "@npc_59673"  }, { varId = 3859, varObj = 400059, varMap = 106, varName = "狼人布鲁斯",  		Place = "西北方" , posName = "@npc_59673"  } }}, 
                                        { minLevel = 50, maxLevel = 54, monList = { { varId = 3858, varObj = 400058, varMap = 106, varName = "国王子民",   Place = "西方" ,   posName = "@npc_59673"  }, { varId = 3859, varObj = 400059, varMap = 106, varName = "狼人布鲁斯", Place = "西北方" , posName = "@npc_59673"  }, { varId = 3862, varObj = 400062, varMap = 106, varName = "血蝙蝠",		 Place = "中部" ,		posName = "@npc_59673"  }, { varId = 3863, varObj = 400063, varMap = 106, varName = "死亡骑士",    		Place = "东南方" , posName = "@npc_59673"  } }}, 
                                        { minLevel = 55, maxLevel = 59, monList = { { varId = 3862, varObj = 400062, varMap = 106, varName = "血蝙蝠",     Place = "中部" ,   posName = "@npc_59673"  }, { varId = 3863, varObj = 400063, varMap = 106, varName = "死亡骑士", 	Place = "东南方" , posName = "@npc_59673"  }, { varId = 3864, varObj = 400064, varMap = 107, varName = "喷毒红蛛",   Place = "中部" ,   posName = "@npc_59674"  }, { varId = 3866, varObj = 400066, varMap = 107, varName = "巨钳毒蝎",    		Place = "东北方" , posName = "@npc_59674"  } }}, 
                                        { minLevel = 60, maxLevel = 64, monList = { { varId = 3864, varObj = 400064, varMap = 107, varName = "喷毒红蛛",   Place = "中部" ,   posName = "@npc_59674"  }, { varId = 3866, varObj = 400066, varMap = 107, varName = "巨钳毒蝎", 	Place = "东北方" , posName = "@npc_59674"  }, { varId = 3868, varObj = 400068, varMap = 107, varName = "祝家庄护院", Place = "中部" ,		posName = "@npc_59674"  }, { varId = 3869, varObj = 400069, varMap = 107, varName = "祝家庄乡勇",  		Place = "东北方" , posName = "@npc_59674"  } }}, 
 										{ minLevel = 65, maxLevel = 69, monList = { { varId = 3868, varObj = 400068, varMap = 107, varName = "祝家庄护院", Place = "中部" ,		posName = "@npc_59674"	}, { varId = 3869, varObj = 400069, varMap = 107, varName = "祝家庄乡勇", Place = "东北方" , posName = "@npc_59674"  }, { varId = 3870, varObj = 400070, varMap = 108, varName = "冰之灵", 		 Place = "中部" ,		posName = "@npc_59701"  }, { varId = 3871, varObj = 400071, varMap = 108, varName = "炎之灵", 		 		Place = "西北方" , posName = "@npc_59701"  } }}, 
                                        { minLevel = 70, maxLevel = 74, monList = { { varId = 3870, varObj = 400070, varMap = 108, varName = "冰之灵",     Place = "中部" ,		posName = "@npc_59701"  }, { varId = 3871, varObj = 400071, varMap = 108, varName = "炎之灵", 		Place = "西北方" , posName = "@npc_59701"  }, { varId = 3872, varObj = 400072, varMap = 108, varName = "地之灵", 		 Place = "北方" ,		posName = "@npc_59701"  }, { varId = 3873, varObj = 400073, varMap = 108, varName = "突厥蛮卫",    		Place = "东北方" , posName = "@npc_59701"  } }}, 
                                        { minLevel = 75, maxLevel = 79, monList = { { varId = 3872, varObj = 400072, varMap = 108, varName = "地之灵",     Place = "北方" ,		posName = "@npc_59701"  }, { varId = 3873, varObj = 400073, varMap = 108, varName = "突厥蛮卫", 	Place = "东北方" , posName = "@npc_59701"  }, { varId = 3874, varObj = 400074, varMap = 109, varName = "聚之灵", 		 Place = "中部" ,   posName = "@npc_59702"  }, { varId = 3875, varObj = 400075, varMap = 109, varName = "突厥禁军", 	 		Place = "东北方" , posName = "@npc_59702"  } }}, 
                                        { minLevel = 80, maxLevel = 84, monList = { { varId = 3874, varObj = 400074, varMap = 109, varName = "聚之灵",     Place = "中部" ,   posName = "@npc_59702"  }, { varId = 3875, varObj = 400075, varMap = 109, varName = "突厥禁军", 	Place = "东北方" , posName = "@npc_59702"  }, { varId = 3876, varObj = 400076, varMap = 109, varName = "扈家庄庄丁", Place = "北方" ,		posName = "@npc_59702"  }, { varId = 3877, varObj = 400077, varMap = 109, varName = "祝家庄庄丁",  		Place = "东方" ,	 posName = "@npc_59702"  } }}, 
                                        { minLevel = 85, maxLevel = 89, monList = { { varId = 3876, varObj = 400076, varMap = 109, varName = "扈家庄庄丁", Place = "北方" ,		posName = "@npc_59702"  }, { varId = 3877, varObj = 400077, varMap = 109, varName = "祝家庄庄丁", Place = "东方" ,	 posName = "@npc_59702"  }, { varId = 3878, varObj = 400078, varMap = 110, varName = "县衙官兵",   Place = "中部" ,		posName = "@npc_59703"  }, { varId = 3879, varObj = 400079, varMap = 110, varName = "突厥蛮兵",    		Place = "东方" ,	 posName = "@npc_59703"  } }}, 
                                        { minLevel = 90, maxLevel = 94, monList = { { varId = 3878, varObj = 400078, varMap = 110, varName = "县衙官兵",   Place = "中部" ,		posName = "@npc_59703"  }, { varId = 3879, varObj = 400079, varMap = 110, varName = "突厥蛮兵", 	Place = "东方" ,	 posName = "@npc_59703"  }, { varId = 3880, varObj = 400080, varMap = 110, varName = "灰壳蟹", 		 Place = "西北方" ,	posName = "@npc_59703"  }, { varId = 3881, varObj = 400081, varMap = 110, varName = "金国怯薛军",  		Place = "东北方" , posName = "@npc_59703"  } }}, 
                                        { minLevel = 95, maxLevel = 99, monList = { { varId = 3880, varObj = 400080, varMap = 110, varName = "灰壳蟹",     Place = "西北方" ,	posName = "@npc_59703"  }, { varId = 3881, varObj = 400081, varMap = 110, varName = "金国怯薛军", Place = "东北方" , posName = "@npc_59703"  },	{ varId = 3882, varObj = 400082, varMap = 111, varName = "金国质子军", Place = "东南方" , posName = "@npc_59704"},   { varId = 3883, varObj = 400083, varMap = 111, varName = "随军巫师",    		Place = "东方" ,   posName = "@npc_59704"  } }}, 
                                        { minLevel = 100,maxLevel =160, monList = { { varId = 3882, varObj = 400082, varMap = 111, varName = "金国质子军", Place = "东南方" , posName = "@npc_59704"  }, { varId = 3883, varObj = 400083, varMap = 111, varName = "随军巫师", 	Place = "东方" ,   posName = "@npc_59704"  }, { varId = 3884, varObj = 400084, varMap = 111, varName = "神机营精锐", Place = "西方" ,		posName = "@npc_59704"  }, { varId = 3885, varObj = 400085, varMap = 111, varName = "金国乌月营斥候", Place = "东方" ,   posName = "@npc_59704"  } }}, 
}
function x270354_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
	local varQuest = 0
	local varIndex = 0
	local guid = GetMonsterGUID(varMap, varPlayer)
	local varX,z = GetWorldPos(varMap,varPlayer)
	local Num =  GetNearPlayerCount(varMap, varKiller,varX,z,30)  
	for varI = 0, Num-1 do
		local humanObjId = GetNearPlayerMember(varMap, varKiller,varI);

		if humanObjId >= 0 then
			if IsPlayerStateNormal(varMap, humanObjId) > 0 then
				if IsHaveQuestNM(varMap, humanObjId, x270354_var_QuestId[1]) == 1 then
					varQuest = x270354_var_QuestId[1]
					varIndex = 1
				elseif IsHaveQuestNM(varMap, humanObjId, x270354_var_QuestId[2]) == 1 then
					varQuest = x270354_var_QuestId[2]
					varIndex = 2
				elseif IsHaveQuestNM(varMap, humanObjId, x270354_var_QuestId[3]) == 1 then
					varQuest = x270354_var_QuestId[3]
					varIndex = 3
				elseif IsHaveQuestNM(varMap, humanObjId, x270354_var_QuestId[4]) == 1 then
					varQuest = x270354_var_QuestId[4]
					varIndex = 4
				end
				if varQuest ~= 0 then
					
	            local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest)
	            local monidx = GetQuestParam( varMap, humanObjId, varQuestIdx, 1)
	            local index = GetQuestParam( varMap, humanObjId, varQuestIdx, 2)
		            if monidx == nil or monidx == 0 or index == nil or index == 0 then
		            	return
		            end
	            local varName = x270354_var_MonsterTable[index].monList[monidx].varName
	            if guid == x270354_var_MonsterTable[ index].monList[ monidx].varObj then
		            SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, 1)
				        SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1)
				        SetQuestByIndex( varMap, humanObjId, varQuestIdx, 6, 1)
				        Msg2Player( varMap, humanObjId, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 3)
				        Msg2Player( varMap, humanObjId, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 2)
				        
				        LuaCallNoclosure( x270354_var_QuestScriptId[varIndex], "ProcQuestLogRefresh", varMap, humanObjId, varQuest)
			    		end
			    end
	        	
			end
		end
	end
end
