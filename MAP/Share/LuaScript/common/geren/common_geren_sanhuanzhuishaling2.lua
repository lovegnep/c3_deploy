--DECLARE_QUEST_INFO_START--

x270352_var_FileId 					= 270352                  
x270352_var_QuestId 				= 1392                    

x270352_var_QuestKind 				= 1                       
x270352_var_LevelLess					= 20                      

x270352_var_QuestName				= "【个人】三环任务(通缉令)"                
x270352_var_QuestTarget				= "  到%s消灭%s(%d/1)"          
x270352_var_QuestInfo				= "\t杀死@npc_72004的@npc_72005,找到@npc_137600"            
x270352_var_ContinueInfo				= "\t除掉那些野兽了么？"  
x270352_var_QuestCompleted			= "\t这么快就回来了？真是不错！\n\t不过，我还是建议你组织一支3人以上的队伍，在我这里挑战#G三环任务#W或#G三环任务（三番令）#W，获得更丰厚的奖励！"  
x270352_var_QuestCompleted1			= "\t你选择了使用悬赏令完成任务，你将会获得#G5倍#W的奖励，同时消耗#G5环#W任务次数！"  
x270352_var_QuestHelp				= ""   


x270352_var_ExtTarget					= { {type=20,n=10 ,target=""} }



x270352_var_ExpBonus					= { 90, 117, 162 , 297 }                    	
x270352_var_BonusItem					= {}	

x270352_var_BonusMoney1               = 0    
x270352_var_BonusMoney2               = 0   
x270352_var_BonusMoney3               = 0    
x270352_var_BonusMoney4               = 0  
x270352_var_BonusMoney5               = 0  
x270352_var_BonusMoney6               = 0  

x270352_var_BonusChoiceItem           = {}


--DECLARE_QUEST_INFO_STOP--


x270352_MP_TARGET1					= 1         
x270352_MP_TARGET2					= 2         
x270352_MP_TARGET3					= 3         
x270352_MP_TARGET4					= 4         
x270352_MP_TARGET5					= 5         
x270352_MP_TARGET6					= 6         
x270352_MP_COMPLETE                 = 7         
x270352_MP_ISCOMPLETE				= 0	        


x270352_var_strAcceptQuest          = "您接受了任务：【个人】三环任务(通缉令)"

x270352_var_strAbandonQuest         = "您放弃了任务：【个人】三环任务(通缉令)"

x270352_var_strFinishQuest          = "您完成了任务：【个人】三环任务(通缉令)"


x270352_TARGET_OBJID1				= 9500
x270352_TARGET_OBJID2				= -2
x270352_TARGET_OBJID3				= -2
x270352_TARGET_OBJID4				= -2
x270352_TARGET_OBJID5				= -2


x270352_TARGET_ITEMID1				= -2

x270352_var_PunishTime                = 2


x270352_var_PlayerMinLevel            = 20

x270352_var_PlayerMaxLevel            = 150

x270352_SubmitNPCGUID				= 129041	


x270352_var_QuestDescription        = "\t#Y@myname#W，见到你太好了，我正有事要找你呢！\n\t最近，有很多怪物从三环副本中逃了出来，四处作恶，闹得整个王国人心惶惶的。你是否愿意帮我们除去这些怪物？\n（每次接取本任务需要消耗一个#G通缉令#W，#G通缉令#W可在王城贸易区杂货商人处购买。）\n \n#G小提示：\n等级相当（相差5级以内）的玩家一起组队领取本任务，任务目标相同。#W"

x270352_var_QuestBook               = "组队进行任务可以极大的提高完成任务的速度"

x270352_var_QuestContinue           = "\t你还没杀掉那只怪物吗？"

x270352_var_strQuestTarget          = "  使用背包中的@item_13810160#W搜寻并消灭在%s的#G%s#W(%d/1)"

x270352_var_ItemID                    = 11990016 
x270352_var_AcceptItemID              = 11990017		
x270352_var_SubmitItemID              = 13810160

x270352_var_MonsterTable              = {
                                        { minLevel = 20, maxLevel = 29, monList = { { varId = 3840, varObj = 400040, varMap = 250, varName = "角木熊星",     Place = "西方" ,		posName = "@npc_4000402"  }, { varId = 3841, varObj = 400041, varMap = 250, varName = "奎木狼星",   Place = "东方" ,	 posName = "@npc_4000412"  }, { varId = 3842, varObj = 400042, varMap = 250, varName = "毕月乌星",   Place = "东北方" , posName = "@npc_4000422"	}, { varId = 3843, varObj = 400043, varMap = 250, varName = "翼火蛇星",   		Place = "北方" ,   posName = "@npc_4000432"  }, { varId = 3844,varObj = 400044, varMap = 250, varName = "胃土彘星", Place = "北方" ,posName = "@npc_4000442"  }, { varId = 3845,varObj = 400045, varMap = 250, varName = "女土蝠星", Place = "西北方" ,posName = "@npc_4000452" } }},  
                                        { minLevel = 30, maxLevel = 34, monList = { { varId = 3846, varObj = 400046, varMap = 304, varName = "鬼金羊星",     Place = "南方" ,		posName = "@npc_4000462"  }, { varId = 3847, varObj = 400047, varMap = 304, varName = "尾火虎星",   Place = "西南方" , posName = "@npc_4000472"	 }, { varId = 3849, varObj = 400049, varMap = 304, varName = "龙堡守卫",   Place = "北方" ,		posName = "@npc_4000492"  }, { varId = 3850, varObj = 400050, varMap = 304, varName = "蓝龙", 					Place = "东方" ,   posName = "@npc_4000502"  } }},
                                        { minLevel = 35, maxLevel = 39, monList = { { varId = 3849, varObj = 400049, varMap = 304, varName = "龙堡守卫",     Place = "北方" ,		posName = "@npc_4000492"  }, { varId = 3850, varObj = 400050, varMap = 304, varName = "蓝龙", 			Place = "东方" ,	 posName = "@npc_4000502"  }, { varId = 3852, varObj = 400052, varMap = 305, varName = "长爪翼龙",   Place = "东方" ,   posName = "@npc_4000522"	}, { varId = 3853, varObj = 400053, varMap = 305, varName = "厌火异兽",   		Place = "西南方" , posName = "@npc_4000532"  } }}, 
                                        { minLevel = 40, maxLevel = 44, monList = { { varId = 3852, varObj = 400052, varMap = 305, varName = "长爪翼龙",     Place = "东方" ,   posName = "@npc_4000522"  }, { varId = 3853, varObj = 400053, varMap = 305, varName = "厌火异兽",   Place = "西南方" , posName = "@npc_4000532"	 }, { varId = 3854, varObj = 400054, varMap = 305, varName = "探宝矿工",   Place = "东方" ,		posName = "@npc_4000542"  }, { varId = 3856, varObj = 400056, varMap = 305, varName = "地穴恶魔",   		Place = "东北方" , posName = "@npc_4000562"  } }}, 
                                        { minLevel = 45, maxLevel = 49, monList = { { varId = 3854, varObj = 400054, varMap = 305, varName = "探宝矿工",     Place = "东方" ,		posName = "@npc_4000542"  }, { varId = 3856, varObj = 400056, varMap = 305, varName = "地穴恶魔",   Place = "东北方" , posName = "@npc_4000562"	 }, { varId = 3858, varObj = 400058, varMap = 306, varName = "国王子民",   Place = "东南方" , posName = "@npc_4000582"	}, { varId = 3859, varObj = 400059, varMap = 306, varName = "狼人布鲁斯", 		Place = "西方" ,	 posName = "@npc_4000592"	 } }}, 
                                        { minLevel = 50, maxLevel = 54, monList = { { varId = 3858, varObj = 400058, varMap = 306, varName = "国王子民",     Place = "东南方" , posName = "@npc_4000582"	}, { varId = 3859, varObj = 400059, varMap = 306, varName = "狼人布鲁斯", Place = "西方" ,	 posName = "@npc_4000592"	 }, { varId = 3862, varObj = 400062, varMap = 306, varName = "血蝙蝠", 		 Place = "东方" ,		posName = "@npc_4000622"  }, { varId = 3863, varObj = 400063, varMap = 306, varName = "死亡骑士",   		Place = "东北方" , posName = "@npc_4000632"  } }}, 
                                        { minLevel = 55, maxLevel = 59, monList = { { varId = 3862, varObj = 400062, varMap = 306, varName = "血蝙蝠", 		   Place = "东方" ,		posName = "@npc_4000622"  }, { varId = 3863, varObj = 400063, varMap = 306, varName = "死亡骑士",   Place = "东北方" , posName = "@npc_4000632"	 }, { varId = 3864, varObj = 400064, varMap = 307, varName = "喷毒红蛛",   Place = "东南方" , posName = "@npc_4000642"	}, { varId = 3866, varObj = 400066, varMap = 307, varName = "巨钳毒蝎",   		Place = "西北方" , posName = "@npc_4000662"  } }}, 
                                        { minLevel = 60, maxLevel = 64, monList = { { varId = 3864, varObj = 400064, varMap = 307, varName = "喷毒红蛛",     Place = "东南方" , posName = "@npc_4000642"  }, { varId = 3866, varObj = 400066, varMap = 307, varName = "巨钳毒蝎", 	Place = "东北方" , posName = "@npc_4000662"  }, { varId = 3868, varObj = 400068, varMap = 307, varName = "祝家庄护院", Place = "东方" ,		posName = "@npc_4000682"  }, { varId = 3869, varObj = 400069, varMap = 307, varName = "祝家庄乡勇", 		Place = "东北方" , posName = "@npc_4000692"  } }}, 
 																				{ minLevel = 65, maxLevel = 69, monList = { { varId = 3868, varObj = 400068, varMap = 307, varName = "祝家庄护院",   Place = "东方" ,		posName = "@npc_4000682"	}, { varId = 3869, varObj = 400069, varMap = 307, varName = "祝家庄乡勇", Place = "东北方" , posName = "@npc_4000692"  }, { varId = 3870, varObj = 400070, varMap = 308, varName = "冰之灵", 		 Place = "中部" ,		posName = "@npc_4000702"  }, { varId = 3871, varObj = 400071, varMap = 308, varName = "炎之灵", 				Place = "东方" ,	 posName = "@npc_4000712"  } }}, 
                                        { minLevel = 70, maxLevel = 74, monList = { { varId = 3870, varObj = 400070, varMap = 308, varName = "冰之灵",       Place = "中部" ,		posName = "@npc_4000702"  }, { varId = 3871, varObj = 400071, varMap = 308, varName = "炎之灵", 		Place = "东方" ,	 posName = "@npc_4000712"  }, { varId = 3872, varObj = 400072, varMap = 308, varName = "地之灵", 		 Place = "北方" ,		posName = "@npc_4000722"  }, { varId = 3873, varObj = 400073, varMap = 308, varName = "突厥蛮卫",   		Place = "东北方" , posName = "@npc_4000732"  } }}, 
                                        { minLevel = 75, maxLevel = 79, monList = { { varId = 3872, varObj = 400072, varMap = 308, varName = "地之灵",       Place = "北方" ,		posName = "@npc_4000722"  }, { varId = 3873, varObj = 400073, varMap = 308, varName = "突厥蛮卫", 	Place = "东北方" , posName = "@npc_4000732"  }, { varId = 3874, varObj = 400074, varMap = 309, varName = "聚之灵", 		 Place = "西北方" , posName = "@npc_4000742"  }, { varId = 3875, varObj = 400075, varMap = 309, varName = "突厥禁军", 			Place = "东北方" , posName = "@npc_4000752"  } }}, 
                                        { minLevel = 80, maxLevel = 84, monList = { { varId = 3874, varObj = 400074, varMap = 309, varName = "聚之灵",       Place = "西北方" , posName = "@npc_4000742"  }, { varId = 3875, varObj = 400075, varMap = 309, varName = "突厥禁军", 	Place = "东北方" , posName = "@npc_4000752"  }, { varId = 3876, varObj = 400076, varMap = 309, varName = "扈家庄庄丁", Place = "西南方" ,	posName = "@npc_4000762"  }, { varId = 3877, varObj = 400077, varMap = 309, varName = "祝家庄庄丁", 		Place = "东方" ,	 posName = "@npc_4000772"  } }}, 
                                        { minLevel = 85, maxLevel = 89, monList = { { varId = 3876, varObj = 400076, varMap = 309, varName = "扈家庄庄丁",   Place = "西南方" ,	posName = "@npc_4000762"  }, { varId = 3877, varObj = 400077, varMap = 309, varName = "祝家庄庄丁", Place = "东方" ,	 posName = "@npc_4000772"  }, { varId = 3878, varObj = 400078, varMap = 310, varName = "县衙官兵",   Place = "中部" ,		posName = "@npc_4000782"  }, { varId = 3879, varObj = 400079, varMap = 310, varName = "突厥蛮兵",   		Place = "中部" ,	 posName = "@npc_4000792"  } }}, 
                                        { minLevel = 90, maxLevel = 94, monList = { { varId = 3878, varObj = 400078, varMap = 310, varName = "县衙官兵",     Place = "中部" ,		posName = "@npc_4000782"  }, { varId = 3879, varObj = 400079, varMap = 310, varName = "突厥蛮兵", 	Place = "中部" ,	 posName = "@npc_4000792"  }, { varId = 3880, varObj = 400080, varMap = 310, varName = "灰壳蟹", 		 Place = "北方" ,		posName = "@npc_4000802"  }, { varId = 3881, varObj = 400081, varMap = 310, varName = "金国怯薛军", 		Place = "中部" ,   posName = "@npc_4000812"  } }}, 
                                        { minLevel = 95, maxLevel = 99, monList = { { varId = 3880, varObj = 400080, varMap = 310, varName = "灰壳蟹",       Place = "北方" ,		posName = "@npc_4000802"  }, { varId = 3881, varObj = 400081, varMap = 310, varName = "金国怯薛军", Place = "中部" ,	 posName = "@npc_4000812"  },	{ varId = 3882, varObj = 400082, varMap = 311, varName = "金国质子军", Place = "西北方" , posName = "@npc_4000822"  }, { varId = 3883, varObj = 400083, varMap = 311, varName = "随军巫师",   		Place = "东北方" , posName = "@npc_4000832"  } }}, 
                                        { minLevel = 100,maxLevel =160, monList = { { varId = 3882, varObj = 400082, varMap = 311, varName = "金国质子军",   Place = "西北方" , posName = "@npc_4000822"  }, { varId = 3883, varObj = 400083, varMap = 311, varName = "随军巫师", 	Place = "东北方" , posName = "@npc_4000832"  }, { varId = 3884, varObj = 400084, varMap = 311, varName = "神机营精锐", Place = "西方" ,		posName = "@npc_4000842"  }, { varId = 3885, varObj = 400085, varMap = 311, varName = "金国乌月营斥候", Place = "东南方" , posName = "@npc_4000852"  } }},
}




function x270352_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel( varMap,varPlayer)
	if(varLevel < x270352_var_PlayerMinLevel) then
		 return 1;
	end

    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId);
    if(varHaveQuest <= 0 and varLevel >= x270352_var_PlayerMinLevel) then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270352_var_QuestId)
        TalkAppendButton(varMap,x270352_var_QuestId,x270352_var_QuestName,varState, 30);
    end
end




function x270352_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varExtIdx)	
	
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId)
	if( varHaveQuest > 0) then
		local varDone = x270352_CheckSubmit(varMap, varPlayer, varTalknpc)
		if(varDone > 0) then
			if varExtIdx ~= -1 then
				x270352_DispatchCompletedInfo( varMap, varPlayer, varTalknpc, varExtIdx) 
			end
		else
			if varExtIdx ~= -1 then
				x270352_DispatchContinueInfo( varMap, varPlayer, varTalknpc ) 
			end
			if varExtIdx == 1 then
						SetMonsterCamp(varMap,varTalknpc,21)                                                        
						NpcTalk(varMap, varTalknpc, "既然事已败露，只好和你拼个鱼死网破！", -1)                     
						StartTalkTask(varMap)                                                                
						TalkAppendString(varMap,"\t面前的怪物突然露出一副凶恶的嘴脸，向你冲来！")                  
						StopTalkTask()                                                                         
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203330_var_FileId, x203330_var_QuestId);
			end
		end
	else
		if varExtIdx == 1000 then
    	local varLevel = GetLevel( varMap, varPlayer)
        
        if varLevel > x270352_var_PlayerMaxLevel then
    		StartTalkTask( varMap)
                TalkAppendString( varMap, "您已经是一个高于70级的大侠了，这点小事还是不用劳烦您了。");
    		StopTalkTask( varMap)
    		DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return 1
        end
			x270352_DispatchQuestInfo( varMap, varPlayer, varTalknpc )	
		else
	    	local varLevel = GetLevel( varMap, varPlayer)
	        
	        if varLevel > x270352_var_PlayerMaxLevel then
	    		StartTalkTask( varMap)
	                TalkAppendString( varMap, "您已经是一个高于70级的大侠了，这点小事还是不用劳烦您了。");
	    		StopTalkTask( varMap)
	    		DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	            return 1
	        end
	        
	        local Times = x270352_GetTimes( varMap, varPlayer)
	        
	        if mod(Times,10) == 0 then
				x270352_DispatchMenuInfo( varMap, varPlayer, varTalknpc )	
			else
				x270352_DispatchQuestInfo( varMap, varPlayer, varTalknpc )	
			end
		end
	end
end




function x270352_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId);
	if(varHaveQuest > 0) then
		return 0;
	else
		return 1;
	end
end


function x270352_IsPunish( varMap, varPlayer)
    return 0
end

function x270352_DenoteMonsterPosition( varMap, varPlayer, varBagIdx )

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId)
	local monidx = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    
    local varName = x270352_var_MonsterTable[varIndex].monList[monidx].varName
    local posName = x270352_var_MonsterTable[varIndex].monList[monidx].posName
    local varMapx = x270352_var_MonsterTable[varIndex].monList[monidx].varMap
    
    if varMapx ~= varMap then
    	local varMsg = format( "请先前往%s再使用三环追踪符", posName)
    	Msg2Player( varMap, varPlayer, varMsg, 8, 3)
    else
    	local varObj = x270352_var_MonsterTable[varIndex].monList[monidx].varObj
    	
    	local obj =  FindMonsterByGUID(varMap, varObj)
    	if IsObjValid(varMap,obj) ~= 1 then
    		return
    	end
    	 
    	local varX, z = GetWorldPos( varMap, obj)
		Msg2Player(varMap,varPlayer,format("%s正在（%d,%d）附近游荡！", varName, varX, z), 8,3)
    end
   
end



function x270352_DelRequireQuestItem( varMap, varPlayer)
	if DelItem( varMap, varPlayer, x270352_var_AcceptItemID, 1) == 0 then
		Msg2Player( varMap, varPlayer, format( "请您先去杂货商人处购买@item_%d#cffcf00!再来接受任务", x270352_var_AcceptItemID), 8, 3)
        return 0
    end
    return 1
end      
     
function x270352_AddAcceptQuestItem( varMap, varPlayer)

	StartItemTask(varMap)
    ItemAppendBind( varMap, x270352_var_SubmitItemID,1 )
    local varRet = StopItemTask(varMap,varPlayer)
    
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "ErrorName"
	end

    if varRet > 0 then
    	Msg2Player( varMap, varPlayer, format( "你获得了1个@item_%d!", x270352_var_SubmitItemID), 8, 3)
        DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到任务道具！", varName , 2,1)
	    LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到任务道具！", varName , 3,1)
	end
	return varRet
		        
end

function x270352_GetQuestIndex( varMap, varPlayer, varTalknpc)
	local varLevel = GetLevel( varMap, varPlayer)
	local varTeamSize = GetNearTeamCount( varMap, varPlayer)
    for varI = 0, varTeamSize - 1 do
    	local memberId = GetNearTeamMember( varMap, varPlayer, varI)
        if memberId ~= varPlayer and IsPlayerStateNormal( varMap, memberId) == 1 then
            if IsInDist( varMap, varPlayer, varTalknpc, 30) == 1 then  
                local teamLevel = GetLevel( varMap, memberId)
                if abs( teamLevel - varLevel) <= 5 then
                   	if IsHaveQuestNM(varMap, memberId, x270352_var_QuestId) == 1 then
                       	local varQuestIdx = GetQuestIndexByID( varMap, memberId, x270352_var_QuestId)
                       	local midx = GetQuestParam( varMap, memberId, varQuestIdx, 1)
                       	local idx = GetQuestParam( varMap, memberId, varQuestIdx, 2)
        				return idx, midx
        		   end
                end
            end
        end
    end
    return 0,0
end

function x270352_GetQuest( varMap, varPlayer, varTalknpc, varIndex, monIndex)
    local idx = varIndex
    local midx = monIndex
    if IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId) == 0 then
        
        local varRet, strMsg = LuaCallNoclosure( 270355, "CountCheck", varMap, varPlayer)
        if varRet == 0 then
            Msg2Player( varMap, varPlayer, strMsg, 8, 3)
            return 0, 0
        end

		if x270352_DelRequireQuestItem( varMap, varPlayer) <= 0 then                 
			return 0, 0                                                                    
		end  
		local varRet = AddQuest( varMap, varPlayer, x270352_var_QuestId, x270352_var_FileId, 1, 0, 0, 1)
    	if(varRet == 0) then
            Msg2Player( varMap, varPlayer, "任务已满，任务接受失败", 8, 3)
    		return 0, 0
    	end
		 
        LuaCallNoclosure( 270355, "UpdateCount", varMap, varPlayer, 1)                                                                        
		if x270352_AddAcceptQuestItem( varMap, varPlayer) <= 0 then 
    		return 0, 0
    	end

 		--春节补偿奖励计数
		local ncircle = x270352_GetTimes( varMap, varPlayer)
		local num = x270352_GetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SANHUAN)
    	local time = GetDayOfYear()
		if time >= 24 and time < 45 then
			if ncircle == 1 and num < 63 then
				x270352_SetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SANHUAN, num + 1)
			end
		end	        

        if varIndex == 0 and monIndex == 0 then
        	idx, midx = x270352_GetQuestIndex(varMap, varPlayer, varTalknpc)
        	if idx == 0 and midx == 0 then
            
            local varLevel = GetLevel( varMap, varPlayer)
            for varI, item in x270352_var_MonsterTable do
                if varLevel >= item.minLevel and varLevel <= item.maxLevel then
                    idx = varI
                    midx = random( 1, getn( item.monList) )
                    	if midx < 1 or midx > getn( item.monList) then
	                    	midx = 1
	                    end
                    break
                 end   
                end
            end
        end
        
        if idx < 1 or idx > getn(x270352_var_MonsterTable) then
        	idx = 1
        	local varLevel = GetLevel( varMap, varPlayer)
            for varI, item in x270352_var_MonsterTable do
                if varLevel >= item.minLevel and varLevel <= item.maxLevel then
                    idx = varI
                    break
                end
            end    
        end
        if midx < 1 or midx > getn(x270352_var_MonsterTable[idx].monList) then
        	midx = 1
        end
        
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x270352_var_QuestId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, midx)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, idx)

        
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)

        
        Msg2Player( varMap, varPlayer, x270352_var_strAcceptQuest, 8, 3)
        
        Msg2Player( varMap, varPlayer, x270352_var_strAcceptQuest, 8, 2)

    	x270352_QuestLogRefresh( varMap, varPlayer, x270352_var_QuestId )

        
        x270352_ShowQuestInfo( varMap, varPlayer, varTalknpc)

        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER, 0)
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_ASSIST, 0)

        
        GamePlayScriptLog( varMap, varPlayer, 611)
    end

    return idx, midx
end



function x270352_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId) == 0 then
		
		if GetBagSpace(varMap,varPlayer) <= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，请整理背包，再接取任务！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
		
        local varIndex = 0
        local monIndex = 0
        if GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER) == 0 then
            varIndex, monIndex = x270352_GetQuest( varMap, varPlayer, varTalknpc, 0, 0)

            local varLevel = GetLevel( varMap, varPlayer)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        else
            local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER)
            local monIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_ASSIST)
            x270352_GetQuest( varMap, varPlayer, varTalknpc, varIndex, monIndex)
        end
    else
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId)
		local completed = GetQuestParam(varMap, varPlayer, varQuestIdx, x270352_MP_ISCOMPLETE)

		if completed == 1 then
			local result = x270352_CheckPlayerBagFull(varMap,varPlayer)
			if result == 1 then
                
                if DelItem( varMap, varPlayer, x270352_var_ItemID, 1) == 0 then
                    Msg2Player( varMap, varPlayer, format( "很抱歉，你没有@item_%d#cffcc00", x270352_var_ItemID), 8, 3)
                    return
                end               
                if DelItem( varMap, varPlayer, x270352_var_SubmitItemID, 1)                           ~= 1 then return 0 end
		    				DelQuest(varMap, varPlayer, x270352_var_QuestId)
                

                Msg2Player( varMap, varPlayer, x270352_var_strFinishQuest, 8, 2)
                Msg2Player( varMap, varPlayer, x270352_var_strFinishQuest, 8, 3)

		    	x270352_GetBonus( varMap,varPlayer,varTalknpc, 0, 5)

                LuaCallNoclosure( 270355, "UpdateCount", varMap, varPlayer, 4)

                
                GamePlayScriptLog( varMap, varPlayer, 612)
		    else
		    	StartTalkTask( varMap )
				TalkAppendString( varMap,"包裹已满！")
				StopTalkTask()
				DeliverTalkTips(varMap, varPlayer);
		    end

		else
			StartTalkTask( varMap )
				TalkAppendString( varMap,"任务没有完成！")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer);
		end
	end
end




function x270352_ProcQuestAbandon( varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId);
	if varHaveQuest > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId); 
		DelQuest(varMap, varPlayer, x270352_var_QuestId);
		if DelItem( varMap, varPlayer, x270352_var_SubmitItemID, 1) ~= 1 then return 0 end
		
        StartTalkTask( varMap)
        TalkAppendString( varMap, x270352_var_strAbandonQuest)
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, x270352_var_strAbandonQuest, 8, 2)
	end
end




function x270352_CheckSubmit( varMap, varPlayer, varTalknpc)

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId);
	return GetQuestParam(varMap, varPlayer, varQuestIdx, x270352_MP_ISCOMPLETE);

end




function x270352_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick, times)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x270352_var_QuestId)
	
	local varLevel = GetLevel( varMap, varPlayer)
    local n = 0
    if varLevel >= 20 and varLevel < 40 then 
        n = 1
    elseif varLevel < 60 then
        n = 2
    elseif varLevel < 75 then
        n = 3
    else
        n = 4
    end  
	local varExp =( 1000 * 0.01 * varLevel * x270352_var_ExpBonus[n]) * times
    if varExp > 0 then
		AddExp( varMap, varPlayer, varExp)
  		Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", varExp), 8, 2)
        StartTalkTask( varMap)
        TalkAppendString( varMap, format( "获得#R经验%d点#cffcf00的奖励", varExp) )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
	end

	
	if x270352_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270352_var_BonusMoney1 * varLevel * times)
	    Msg2Player(varMap,varPlayer,format("获得#R银卡#{_MONEY%d}#cffcf00的奖励。", x270352_var_BonusMoney1 * varLevel),4,2)
        Msg2Player(varMap,varPlayer,format("获得#R银卡#{_MONEY%d}#cffcf00的奖励", x270352_var_BonusMoney1 * varLevel),8,3)
	end

	
	if x270352_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270352_var_BonusMoney2 * varLevel)
	    Msg2Player(varMap,varPlayer,format("获得#R现银#{_MONEY%d}#cffcf00的奖励。", x270352_var_BonusMoney2 * varLevel),4,2)
        Msg2Player(varMap,varPlayer,format("获得#R现银#{_MONEY%d}#cffcf00的奖励", x270352_var_BonusMoney2 * varLevel),8,3)
	end

	
	if x270352_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270352_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x270352_var_BonusMoney3),4,2)
	end

	
	if x270352_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x270352_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x270352_var_BonusMoney4),4,2)
	end

	
	if x270352_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x270352_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x270352_var_BonusMoney5),4,2)
	end

	
	if x270352_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x270352_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x270352_var_BonusMoney6),4,2)
	end

 	
		for varI, item in x270352_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x270352_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			
			return
		end
    end

end




function x270352_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId);
	if varHaveQuest > 0 then

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId)
		local completed = GetQuestParam(varMap, varPlayer, varQuestIdx, x270352_MP_ISCOMPLETE)

		if completed == 1 then
			local result = x270352_CheckPlayerBagFull(varMap,varPlayer)
			if result == 1 then
		    	DelQuest(varMap, varPlayer, x270352_var_QuestId)
                

                StartTalkTask( varMap)
                TalkAppendString( varMap, x270352_var_strFinishQuest)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
                Msg2Player( varMap, varPlayer, x270352_var_strFinishQuest, 8, 2)

		    	x270352_GetBonus( varMap,varPlayer,varTalknpc,varRadioSelected, 1)
	       	if DelItem( varMap, varPlayer, x270352_var_SubmitItemID, 1) ~= 1 then return 0 end

                
                GamePlayScriptLog( varMap, varPlayer, 612)
		    else
		    	StartTalkTask( varMap )
				TalkAppendString( varMap,"包裹已满！")
				StopTalkTask()
				DeliverTalkTips(varMap, varPlayer);
		    end

		else
			StartTalkTask( varMap )
				TalkAppendString( varMap,"任务没有完成！")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer);
		end
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end

end




function x270352_CheckPlayerBagFull( varMap ,varPlayer)


	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x270352_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

    
	for j, item in x270352_var_BonusChoiceItem do
		ItemAppend( varMap, item.item, item.n )
    end
		
	local varRet = StopItemTask(varMap,varPlayer)
	if(varRet > 0) then
		result = 1;
	else
		result = 0;
	end

	return result
end


function x270352_ShowQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
        
		TalkAppendString(varMap, "#Y"..x270352_var_QuestName)

		
		
		TalkAppendString( varMap, "\t这些怪物并不会在一个地方停留，他们会在对应的地图中游荡。\n\t你可以使用我给你的#G三环追踪符#W，它会告诉你怪物的具体位置。")
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x270352_var_QuestId)
        local monidx = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
        TalkAppendString( varMap, "\n#Y任务目标：")
        TalkAppendString( varMap, format( x270352_var_QuestTarget, x270352_var_MonsterTable[ varIndex].monList[ monidx].posName, x270352_var_MonsterTable[ varIndex].monList[ monidx].varName, 0) )
		TalkAppendString( varMap, " ")
	StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end

function x270352_DispatchMenuInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask(varMap)

		
		TalkAppendString(varMap, "#Y"..x270352_var_QuestName)
		TalkAppendString(varMap, "\t完成一轮通缉令等同于完成一次三环任务，每轮通缉令任务有10环，每天可以完成6轮。\n\t您即将领取的是第1环，会#G消耗一次本周的三环副本次数#W和#G一个通缉令#W。你确定要领取三环任务(通缉令)吗？\n（#G通缉令#W可在王城贸易区杂货商人处购买。）\n#Y注意#W：\n\t领取1轮本任务后，当天只可完成三环任务（三番令）2次。\n\t领取4轮本任务后，当天只可完成三环任务（三番令）1次。")
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270352_var_QuestId)
		TalkAppendButton(varMap,x270352_var_QuestId,"我要领取三环通缉令",13,1000 )	
	
		StopTalkTask()
	 DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	 
	
end



function x270352_DispatchQuestInfo( varMap, varPlayer, varTalknpc )

	local varLevel = GetLevel(varMap,varPlayer);
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap, "#Y"..x270352_var_QuestName)
		TalkAppendString(varMap, x270352_var_QuestDescription)
		
		TalkAppendString(varMap, x270352_var_QuestHelp)

		

		
		
		local varLevel= GetLevel( varMap, varPlayer)
		local n = 0
		if varLevel >= 20 and varLevel < 40 then 
			n = 1
		elseif varLevel < 60 then
			n = 2
		elseif varLevel < 75 then
			n = 3
		else
		  n = 4
		end  
		local varExp =( 1000 * 0.01 * varLevel * x270352_var_ExpBonus[n])
		if varExp > 0 then
			AddQuestExpBonus( varMap, varExp )
		end

		
		if x270352_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1( varMap, x270352_var_BonusMoney1 * varLevel)
		end

		
		if x270352_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2( varMap, x270352_var_BonusMoney2 * varLevel)
		end
		
		if x270352_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3( varMap, x270352_var_BonusMoney3 )
		end

		
		if x270352_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4( varMap, x270352_var_BonusMoney4 )
		end

		
		if x270352_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5( varMap, x270352_var_BonusMoney5 )
		end

		
		if x270352_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6( varMap, x270352_var_BonusMoney6 )
		end


		
		for varI, item in x270352_var_BonusItem do
		   	AddQuestItemBonus( varMap, item.item, item.n)
	    end

		
		for varI, item in x270352_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus( varMap, item.item, item.n)
	    end

	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270352_var_FileId, x270352_var_QuestId)
end




function x270352_DispatchContinueInfo( varMap, varPlayer, varTalknpc )

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId);

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x270352_var_QuestName)
		TalkAppendString(varMap,x270352_var_QuestContinue)
		TalkAppendString(varMap," ")

	StopTalkTask()
	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end




function x270352_DispatchCompletedInfo( varMap, varPlayer, varTalknpc, varExtIdx)
    if varExtIdx == 30 then
        StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x270352_var_QuestName)
            TalkAppendString(varMap, "\t这么快就消灭了那些怪物？\n\t如果你使用#G悬赏令#W来完成任务，将会获得#G5倍#W的经验，消耗#G5环#W任务次数。#G（悬赏令在金币商城出售）\n\t#W当然，你也可以直接完成任务，获得正常的经验，只消耗一环任务次数。" )
            TalkAppendString(varMap," ")

            local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x270352_var_QuestId)
            TalkAppendButton( varMap, x270352_var_QuestId, "使用悬赏令完成任务", 3, 31)
            TalkAppendButton( varMap, x270352_var_QuestId, "直接完成任务", 3, 32)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif varExtIdx == 31 then
        if GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3] ) >= 21
            and x270352_GetTimes( varMap, varPlayer) > 5 then
            Msg2Player( varMap, varPlayer, "本周不能再使用悬赏令完成任务了。", 8, 3)
            return
        end
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3] )
        local times = x270352_GetTimes( varMap, varPlayer)
        
        if GetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3] ) >= 6 
            and x270352_GetTimes( varMap, varPlayer) > 6 then
            Msg2Player( varMap, varPlayer, "今天不能再使用悬赏令完成任务了。", 8, 3)
            return
        end
        StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x270352_var_QuestName)
            TalkAppendString(varMap, x270352_var_QuestCompleted1)
            TalkAppendString(varMap, "\t你确定要使用悬赏令么？" )
            TalkAppendString(varMap, " " )

            local varLevel= GetLevel(varMap,varPlayer)
            if varLevel >= 20 and varLevel < 40 then 
                n = 1
            elseif varLevel < 60 then
                n = 2
            elseif varLevel < 75 then
                n = 3
            else
              n = 4
            end  		
            local varExp =( 1000 * 0.01 * varLevel * x270352_var_ExpBonus[n])
            if varExp > 0 then
                AddQuestExpBonus( varMap, varExp * 5)
            end
            if x270352_var_BonusMoney1 > 0 then
                AddQuestMoneyBonus1(varMap, x270352_var_BonusMoney1 * varLevel * 5)
            end

        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270352_var_FileId, x270352_var_QuestId)
    elseif varExtIdx == 32 then
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x270352_var_QuestName)
		TalkAppendString(varMap,x270352_var_QuestCompleted)
		TalkAppendString(varMap," ")

  		

		
		
			
		
		local varLevel= GetLevel(varMap,varPlayer)
		if varLevel >= 20 and varLevel < 40 then 
			n = 1
		elseif varLevel < 60 then
			n = 2
		elseif varLevel < 75 then
			n = 3
		else
		  n = 4
		end  		
		local varExp =( 1000 * 0.01 * varLevel * x270352_var_ExpBonus[n])
		if varExp > 0 then
			AddQuestExpBonus(varMap, varExp )
		end

		
		if x270352_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270352_var_BonusMoney1 * varLevel)
		end

		
		if x270352_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270352_var_BonusMoney2 * varLevel)
		end
		
		if x270352_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270352_var_BonusMoney3 )
		end

		
		if x270352_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270352_var_BonusMoney4 )
		end

		
		if x270352_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270352_var_BonusMoney5 )
		end

		
		if x270352_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270352_var_BonusMoney6 )
		end


		
		for varI, item in x270352_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x270352_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end
	StopTalkTask()
	
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270352_var_FileId, x270352_var_QuestId);
    end
end




function x270352_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

    if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
    end
        
    local varQuestIdx = 0
    local varTeamSize = GetNearTeamCount( varMap, varPlayer)
    

     
    
    local varX,z = GetWorldPos(varMap, varPlayer)
    local teamId = GetTeamId(varMap, varPlayer)
    local varCount = GetNearPlayerCount(varMap, varPlayer, varX, z, 30)
    for varI = 0, varCount - 1 do
    	local memberId = GetNearPlayerMember( varMap, varPlayer, varI)
    	if memberId ~= varPlayer and IsPlayerStateNormal( varMap, memberId) == 1 then
        	local teamId1 = GetTeamId(varMap, memberId)
        	if teamId ~= teamId1 or teamId == -1 or teamId1 == -1 then
	            if IsHaveQuestNM(varMap, memberId, x270352_var_QuestId) == 1 then
	                local varQuestIdx = GetQuestIndexByID( varMap, memberId, x270352_var_QuestId)
	                local monidx = GetQuestParam( varMap, memberId, varQuestIdx, 1)
                    local varIndex = GetQuestParam( varMap, memberId, varQuestIdx, 2)
                    local varName = x270352_var_MonsterTable[varIndex].monList[monidx].varName
                    if varObjData == x270352_var_MonsterTable[ varIndex].monList[ monidx].varId then
		                SetQuestByIndex( varMap, memberId, varQuestIdx, 0, 1)
			            SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
			            SetQuestByIndex( varMap, memberId, varQuestIdx, 6, 1)
			            Msg2Player( varMap, memberId, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 3)
			            Msg2Player( varMap, memberId, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 2)
			            x270352_QuestLogRefresh( varMap, memberId, x270352_var_QuestId)
			        end
	        	end
	        end
        end
    end
       
    
    
    
    if varTeamSize <= 1 then 
        
        if IsHaveQuest( varMap, varPlayer, x270352_var_QuestId) <= 0 then
            return
        end
        varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x270352_var_QuestId)
        local monidx = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
        local varName = x270352_var_MonsterTable[varIndex].monList[monidx].varName
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
            
            return
        end

        if varObjData == x270352_var_MonsterTable[ varIndex].monList[ monidx].varId then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, 1)
            Msg2Player( varMap, varPlayer, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 3)
            Msg2Player( varMap, varPlayer, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 2)
        else
            
            return
        end

        x270352_QuestLogRefresh( varMap, varPlayer, x270352_var_QuestId)
    else
        for varI = 0, varTeamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varPlayer, varI)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x270352_var_QuestId) > 0 then 
                    varQuestIdx = GetQuestIndexByID( varMap, memberId, x270352_var_QuestId)
                    local monidx = GetQuestParam( varMap, memberId, varQuestIdx, 1)
                    local varIndex = GetQuestParam( varMap, memberId, varQuestIdx, 2)
                    local varName = x270352_var_MonsterTable[varIndex].monList[monidx].varName
                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then
                        local questMonster = 1
                        if varObjData == x270352_var_MonsterTable[ varIndex].monList[ monidx].varId then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 0, 1)
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 6, 1)
                            Msg2Player( varMap, memberId, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 3)
                            Msg2Player( varMap, memberId, format( "%s已被消灭，【个人】三环任务(通缉令)任务完成", varName), 8, 2)
                        else
                            questMonster = 0
                        end

                        if questMonster == 1 then
                            x270352_QuestLogRefresh( varMap, memberId, x270352_var_QuestId)
                        end
                    end
                end
            end
        end
    end
end




function x270352_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270352_var_QuestId);
	
	if(varItemData == x270352_TARGET_OBJID1 ) then
		local targetcount	= GetQuestParam(varMap, varPlayer, varQuestIdx, x270352_MP_TARGET1);
		if(targetcount < x270352_var_ExtTarget[x270352_MP_TARGET1+1].n) then
			targetcount	= targetcount + 1;
			StartTalkTask(varMap);
			TalkAppendString(varMap,"已获得"..x270352_var_ExtTarget[x270352_MP_TARGET1+1].target..":"..targetcount.."/"..x270352_var_ExtTarget[x270352_MP_TARGET1+1].n);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			SetQuestByIndex(varMap, varPlayer, varQuestIdx, x270352_MP_TARGET1, targetcount )
		end
	end
	
	
	local targetcount1	= GetQuestParam(varMap, varPlayer, varQuestIdx, x270352_MP_TARGET1);
	if(targetcount1 == x270352_var_ExtTarget[x270352_MP_TARGET1+1].n) then
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, x270352_MP_ISCOMPLETE, 1 )
	end
end




function x270352_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if varTalkNpcGUID == x270352_SubmitNPCGUID then
		local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x270352_var_QuestId);
		if(varHaveQuest > 0) then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270352_var_QuestId)
			TalkAppendButton(varMap, x270352_var_QuestId, x270352_var_QuestName,varState,30);
		end
	end

end




function x270352_QuestLogRefresh( varMap, varPlayer, varQuest)
    if IsHaveQuest( varMap, varPlayer, x270352_var_QuestId) == 0 then
        return
    end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x270352_var_QuestId)
    local monidx = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    local kill = GetQuestParam( varMap, varPlayer, varQuestIdx, 6)

	StartTalkTask(varMap)
        
        local varLevel = GetLevel( varMap, varPlayer)
        local n = 0
		if varLevel >= 20 and varLevel < 40 then 
			n = 1
		elseif varLevel < 60 then
			n = 2
		elseif varLevel < 75 then
			n = 3
		else
            n = 4
		end      
		local varExp =( 1000 * 0.01 * varLevel * x270352_var_ExpBonus[n])
		if varExp > 0 then
			AddQuestExpBonus( varMap, varExp)
		end
        if x270352_var_BonusMoney1 > 0 then
            AddQuestMoneyBonus1( varMap, x270352_var_BonusMoney1 * varLevel)
        end

        AddQuestLogCustomText( varMap,
                                "",                             
                                format( "【个人】三环任务(通缉令)(%d/10)", x270352_GetTimes( varMap, varPlayer) ),           
                                format( x270352_var_strQuestTarget, x270352_var_MonsterTable[ varIndex].monList[ monidx].posName, x270352_var_MonsterTable[ varIndex].monList[ monidx].varName, kill),
                                "@npcsp_[三环副本]景彦多_129041",                             
                                x270352_var_QuestBook,
                                x270352_var_QuestDescription,
                                ""
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, x270352_var_QuestId)
end

function x270352_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    x270352_QuestLogRefresh( varMap, varPlayer, varQuest)
end




function x270352_ProcForceAddQuest( varMap, varPlayer, varTalknpc, varQuest)
end


function x270352_GetDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_XUNAN_DATE[ 1], MD_XUNAN_DATE[ 2], MD_XUNAN_DATE[ 3] )
end


function x270352_SetDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_XUNAN_DATE[ 1], MD_XUNAN_DATE[ 2], MD_XUNAN_DATE[ 3], value)
end

function x270352_GetTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHUISHA_CIRCLE[ 1], MD_ZHUISHA_CIRCLE[ 2], MD_ZHUISHA_CIRCLE[ 3] )
end

function x270352_SetTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHUISHA_CIRCLE[ 1], MD_ZHUISHA_CIRCLE[ 2], MD_ZHUISHA_CIRCLE[ 3], value)
end

function x270352_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x270352_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
