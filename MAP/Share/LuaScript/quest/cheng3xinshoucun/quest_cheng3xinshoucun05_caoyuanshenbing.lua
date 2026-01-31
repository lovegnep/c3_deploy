

--DECLARE_QUEST_INFO_START--
x203368_var_FileId = 203368
x203368_var_QuestIdPre =3203
x203368_var_QuestId = 3204
x203368_var_LevelLess	= 	1
x203368_var_QuestIdNext = 3205
x203368_var_Name	={}
x203368_var_ExtTarget={
	[0] ={type=20,n=1,target="找到@npc_138012"},
	[1] ={type=20,n=1,target="找到@npc_138013"},
	[2] ={type=20,n=1,target="找到@npc_138014"},
	[3] ={type=20,n=1,target="找到@npc_138015"},
	[4] ={type=20,n=1,target="找到@npc_138016"},
	[5] ={type=20,n=1,target="找到@npc_138017"},
	[6] ={type=20,n=1,target="找到@npc_138018"},
	[7] ={type=20,n=1,target="找到@npc_138019"},
	[8] ={type=20,n=1,target="找到@npc_138020"},
	[9] ={type=20,n=1,target="找到@npc_138021"},
	[10]={type=20,n=1,target="找到@npc_138022"},
	[11]={type=20,n=1,target="找到@npc_138023"},									
}
x203368_var_QuestName="【新手】神兵之灵"
x203368_var_QuestInfo="\t过了这道朝圣之门，就能看到那些草原神兵了，选择一把作为自己的护身之器，开始你的勇士之路吧！\n\t获得新兵器之后，记得按下“B”键打开背包，右键点击你刚刚获得的武器，就可以装备上新武器了。\n\t村长穆图正在前方等着你呢，赶紧去吧！"  
x203368_var_QuestTarget={
	[0]= {"找到@npc_138012"},
	[1]= {"找到@npc_138013"},
	[2]= {"找到@npc_138014"},
	[3]= {"找到@npc_138015"},
	[4]= {"找到@npc_138016"},
	[5]= {"找到@npc_138017"},
	[6]= {"找到@npc_138018"},
	[7]= {"找到@npc_138019"},
	[8]= {"找到@npc_138020"},
	[9]= {"找到@npc_138021"},
	[10]={"找到@npc_138022"},
	[11]={"找到@npc_138023"},
}
x203368_var_QuestCompleted="\t真没想到你这么快就来了！\n\t看来你在前面两位长老那里得到了不少收获啊。"					
x203368_var_ContinueInfo="\t新兵器还称手么？"
x203368_var_QuestHelp =	"#G你只需要耐心观察，就找到属于自己的神兵。#W"
x203368_var_DemandItem ={}
x203368_var_ExpBonus = 163
x203368_var_BonusMoney1 =0
x203368_var_BonusMoney2 =0
x203368_var_BonusMoney3 =0
x203368_var_BonusMoney4 =0
x203368_var_BonusMoney5 =0
x203368_var_BonusMoney6 =0
x203368_var_BonusChoiceItem ={}
x203368_var_BonusItem	=	{
	[0] ={item=10011002,n=1},
	[1] ={item=10021002,n=1},
	[2] ={item=10031002,n=1},
	[3] ={item=10041002,n=1},
	[4] ={item=10051002,n=1},
	[5] ={item=10061002,n=1},
	[6] ={item=10351012,n=1},
	[7] ={item=10361012,n=1},
	[8] ={item=10371012,n=1},
	[9] ={item=10381012,n=1},
	[10]={item=10391012,n=1},
	[11]={item=10401012,n=1},
}
x203368_var_NpcGUID ={
	[0] = { guid = 138012, varName = "刀"}, 
	[1] = { guid = 138013, varName = "剑"}, 
	[2] = { guid = 138014, varName = "弓"}, 
	[3] = { guid = 138015, varName = "枪"}, 
	[4] = { guid = 138016, varName = "仗"}, 
	[5] = { guid = 138017, varName = "槌"}, 
	[6] = { guid = 138018, varName = "矛"}, 
	[7] = { guid = 138019, varName = "令"}, 
	[8] = { guid = 138020, varName = "弩"}, 
	[9] = { guid = 138021, varName = "铳"}, 
	[10]= { guid = 138022, varName = "圣十字"}, 
	[11]= { guid = 138023, varName = "幡"}, 
	
}
--DECLARE_QUEST_INFO_STOP--
x203368_var_NPCTalk = {
"这兵器送给你，别忘记装备上它。",
}
x203368_var_effect = {
	73,
	74,
	75,
	76,
	77,
	78,
	79,
	80,
	81,
	82,
	83,
	84,
}


function x203368_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if IsQuestHaveDone(varMap, varPlayer, x203368_var_QuestId) > 0 then
		return 
	end
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203368_var_QuestIdPre)> 0 then
			if IsHaveQuest(varMap,varPlayer, x203368_var_QuestId) <= 0 then
					local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203368_var_QuestId)
					TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203368_var_QuestId, varState, -1 )
			end
	end
	
end

function x203368_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		local zhiye =GetZhiye(varMap, varPlayer)
		if x203368_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203368_var_ExpBonus )
		end
		if x203368_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203368_var_BonusMoney1 )
		end
		if x203368_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203368_var_BonusMoney2 )
		end
		if x203368_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203368_var_BonusMoney3 )
		end
		if x203368_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203368_var_BonusMoney4 )
		end
		if x203368_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203368_var_BonusMoney5 )
		end
		if x203368_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203368_var_BonusMoney6 )
		end
		for varI, item in x203368_var_BonusItem do
			if varI == zhiye then
		   	AddQuestItemBonus(varMap, item.item, item.n)
		   	end
	  end
		for varI, item in x203368_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203368_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varEx)	
	if IsQuestHaveDone(varMap, varPlayer, x203368_var_QuestId) > 0 then
		return 
	end
	local zhiye =GetZhiye(varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x203368_var_QuestId) > 0 then
		if varEx == -1 then
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,2,0)
			if x203368_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203368_var_QuestName)
						TalkAppendString(varMap,x203368_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203368_var_FileId, x203368_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,3,1)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203368_var_QuestName)
						TalkAppendString(varMap,x203368_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203368_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203368_var_FileId, x203368_var_QuestId);
			end
		elseif varEx == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x203368_var_QuestName)
			TalkAppendString(varMap,"\t神兵之灵似乎和你有了一些感应，似乎......在轻轻的呼唤着你。")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203368_var_FileId, x203368_var_QuestId);
--			if IsHaveSpecificImpact( varMap, varPlayer, 7068) ~= 1 then
--		 		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7068, 0)
--		 	end
			LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer,x203368_var_effect[zhiye+1] )
			
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203368_var_QuestId) 
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,16,0 )
			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,1 )
	  		NpcTalk(varMap,varTalknpc,"神兵之灵似乎和你有了一些感应，似乎...在轻轻的呼唤着你。",varPlayer)
		end
	  elseif x203368_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203368_var_QuestName)
			TalkAppendString(varMap,x203368_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203368_var_ExtTarget do
				if varI == zhiye then
					TalkAppendString( varMap,item.target)
				end
			end 
			if x203368_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203368_var_QuestHelp )
			end
			x203368_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203368_var_FileId, x203368_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
	
end


function x203368_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203368_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x203368_var_QuestId)
	return GetQuestParam(varMap,varPlayer,varQuestIdx,0)	
end

function x203368_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203368_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203368_var_QuestId  )
		if varFrontQuest1 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
				return 0
			end
		end
		if varFrontQuest2 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
				return 0
			end
		end
		if varFrontQuest3 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
				return 0
			end
		end
		
		if x203368_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203368_var_QuestId, x203368_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203368_Msg2toplayer( varMap, varPlayer,0)
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
	    			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )
		  		end
	 	end                                                                    
	     
end


function x203368_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203368_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203368_var_QuestId)
	  	x203368_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203368_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	local zhiye =GetZhiye(varMap ,varPlayer)
	StartItemTask(varMap)
	for j, item in x203368_var_BonusItem do
		if zhiye == j then
		ItemAppendBind( varMap, item.item, item.n )
		end
  end
  for j, item in x203368_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppendBind( varMap, item.item, item.n )
            break
        end
  end
  local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        if result == 1 then
            result = 0
        end
    end
	return result
end

function x203368_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	local zhiye =GetZhiye(varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x203368_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203368_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203368_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203368_var_QuestId) > 0 then
				x203368_Msg2toplayer( varMap, varPlayer,2)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,6,0)
				QuestCom(varMap, varPlayer, x203368_var_QuestId)
				x203368_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203368_var_BonusItem do
					if zhiye == varI then
 						ItemAppendBind( varMap, item.item, item.n )
 					end
				end
				for varI, item in x203368_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppendBind( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
			NpcTalk(varMap,varTalknpc,x203368_var_NPCTalk[1],varPlayer)
	 
    		
   end
   --LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,11,1 )
   --LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,19,1 )
   LuaCallNoclosure( 203369, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203368_var_QuestIdNext )	
end

function x203368_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203368_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203368_var_ExpBonus);
  	end
		if x203368_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203368_var_BonusMoney1 )
	  end
		if x203368_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203368_var_BonusMoney2 )
	  end
		if x203368_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203368_var_BonusMoney3 )
		end
		if x203368_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203368_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203368_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203368_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203368_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203368_var_BonusMoney6)
		end
end

function x203368_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203368_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203368_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203368_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203368_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203368_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203368_var_QuestName.."！", 0, 3)
				if x203368_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203368_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203368_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203368_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203368_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203368_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203368_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203368_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203368_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203368_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203368_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203368_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203368_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203368_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203368_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	if IsHaveQuest(varMap,varPlayer, x203368_var_QuestId) <= 0 then return end
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203368_var_QuestId)
    local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local zhiye = GetZhiye(varMap,varPlayer)
	StartTalkTask( varMap)
	 if  x203368_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
    AddQuestLogCustomText( varMap,
							"",									
                            x203368_var_QuestName,              
                           	x203368_var_QuestTarget[zhiye][1],            
                            "",       
                            x203368_var_QuestInfo, 				
                            x203368_var_QuestTarget[zhiye][1],              
                            x203368_var_QuestHelp			
                            )
    else
        AddQuestLogCustomText( varMap,
							"",									
                            x203368_var_QuestName,              
                           	"@npc_"..138004,            
                            "",       
                            x203368_var_QuestInfo, 				
                            	"@npc_"..138004,    
                            x203368_var_QuestHelp			
                            )
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
	
	
end


function x203368_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203368_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203368_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203368_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203368_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203368_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
	  local zhiye = GetZhiye(varMap, varPlayer)
    for varI ,item in x203368_var_NpcGUID do
        if item.guid == varTalkNpcGUID and varI == zhiye then
            bFind = 1
            break
        elseif varTalkNpcGUID == 138004 then
            bFind = 2
            break    
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203368_var_QuestId) > 0 and  bFind == 1 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203368_var_QuestId)
				TalkAppendString(varMap,"\n")
				TalkAppendButton( varMap, x203368_var_QuestId, "尝试与神兵之魂沟通", 1, 2 )		
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,16,1 )
		elseif bFind == 2 and x203368_CheckSubmit( varMap, varPlayer, varTalknpc) == 1  then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203368_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203368_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,2,1 )
		end
end

function x203368_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203368_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203368_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203368_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203368_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203368_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
