

--DECLARE_QUEST_INFO_START--
x203713_var_FileId = 203713
x203713_var_LevelLess	= 	20
x203713_var_QuestName="【主线】职业的进阶"
x203713_var_QuestInfo="\t虽然你已经具备相当的实力自保，但你还需要进一步提升自身的实力。\n\t去找王城的技能大师吧，他可以帮你快速地提升技能的威力。"  
x203713_var_QuestTarget=""		
x203713_var_QuestCompleted="\t活到老学到老，等你觉得自己杀敌变得缓慢的时候记得去找技能大师学习新的技能。"					
x203713_var_ContinueInfo="\t不清楚如何提升技能等级？在技能大师那里就可以学习、提升自己的技能。\n\t点击#G技能学习#W按钮就能进入技能学习介面，里面#G明亮的技能#W表示你现在能掌握的技能，点击相应图示即可学习技能，当然你要有一定的经验和银子！\n\t最后记得学习完技能后，要将自己#G技能栏内技能的图示#W拖到下方#G快捷栏内#W，才能在需要的时候，方便快捷的使用。"
x203713_var_QuestHelp =	"#G您可以按下键盘上的#R2#G键，或者左键点击您下方技能快捷栏中的技能来使用。#W"
x203713_var_DemandItem ={}
x203713_var_ExpBonus = 1500
x203713_var_BonusMoney1 =258
x203713_var_BonusMoney2 =0
x203713_var_BonusMoney3 =0
x203713_var_BonusMoney4 =0
x203713_var_BonusMoney5 =37
x203713_var_BonusMoney6 =0

x203713_var_BonusChoiceItem ={}
--DECLARE_QUEST_INFO_STOP--

x203713_var_Name	={}
x203713_var_QuestIdPre =4261
x203713_var_QuestIdNext = 5962
x203713_var_QuestId = {4276,4277,4278,4279,4280,4281,4282,4283,4284,4285,4286,4287}
x203713_var_BonusItem	=	{
						 }
x203713_var_ExtTarget={{type=20,n=1,target="找到@npc_126043学习并#R使用#W3级#R勇冠三军#W"},
					 {type=20,n=1,target="找到@npc_126044学习并#R使用#W3级#R七星剑阵#W"},
					 {type=20,n=1,target="找到@npc_126046学习并#R使用#W3级#R自由之歌#W"},
					 {type=20,n=1,target="找到@npc_126045学习并#R使用#W3级#R散兵队形#W"},
					 {type=20,n=1,target="找到@npc_126048学习并#R使用#W3级#R神灯之光#W"},
					 {type=20,n=1,target="找到@npc_126047学习并#R使用#W3级#R冥神附体#W"},
					 {type=20,n=1,target="找到@npc_126049学习并#R使用#W3级#R光明圣战#W"},
					 {type=20,n=1,target="找到@npc_126050学习并#R使用#W3级#R无名业火#W"},
					 {type=20,n=1,target="找到@npc_126051学习并#R使用#W3级#R疾风烈火#W"},
					 {type=20,n=1,target="找到@npc_126052学习并#R使用#W3级#R临兵列阵#W"},
					 {type=20,n=1,target="找到@npc_126054学习并#R使用#W3级#R苦修祷言#W"},
					 {type=20,n=1,target="找到@npc_126053学习并#R使用#W3级#R浮屠咒#W"},
					 }
x203713_var_QuestTarget={"  找到@npc_126043学习并#R使用#W3级#R勇冠三军#W",
					 "  找到@npc_126044学习并#R使用#W3级#R七星剑阵#W",
					 "  找到@npc_126046学习并#R使用#W3级#R自由之歌#W",
					 "  找到@npc_126045学习并#R使用#W3级#R散兵队形#W",
					 "  找到@npc_126048学习并#R使用#W3级#R神灯之光#W",
					 "  找到@npc_126047学习并#R使用#W3级#R冥神附体#W",
					 "  找到@npc_126049学习并#R使用#W3级#R光明圣战#W",
					 "  找到@npc_126050学习并#R使用#W3级#R无名业火#W",
					 "  找到@npc_126051学习并#R使用#W3级#R疾风烈火#W",
					 "  找到@npc_126052学习并#R使用#W3级#R临兵列阵#W",
					 "  找到@npc_126054学习并#R使用#W3级#R苦修祷言#W",
					 "  找到@npc_126053学习并#R使用#W3级#R浮屠咒#W",
					   }
x203713_var_NpcGUID ={ guid = 126002, varName = "刀"}


function x203713_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local zhiye= GetZhiye( varMap, varPlayer)
	if IsQuestHaveDone(varMap, varPlayer, x203713_var_QuestId[zhiye+1]) > 0 then
		return 
	end
	
	if varQuest ~= x203713_var_QuestId[zhiye+1] then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x203713_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x203713_var_QuestId[zhiye+1]) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203713_var_QuestId[zhiye+1])
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203713_var_QuestId[zhiye+1], varState, -1 )
		end
	end
end

function x203713_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		local zhiye= GetZhiye( varMap, varPlayer)
		if x203713_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203713_var_ExpBonus )
		end
		if x203713_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203713_var_BonusMoney1 )
		end
		if x203713_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203713_var_BonusMoney2 )
		end
		if x203713_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203713_var_BonusMoney3 )
		end
		if x203713_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203713_var_BonusMoney4 )
		end
		if x203713_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203713_var_BonusMoney5 )
		end
		if x203713_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203713_var_BonusMoney6 )
		end
		
		

		for varI, item in x203713_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203713_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	 local zhiye= GetZhiye( varMap, varPlayer)
	if IsQuestHaveDone(varMap, varPlayer, x203713_var_QuestId[zhiye+1]) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203713_var_QuestId[zhiye+1]) > 0 then
			if x203713_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203713_var_QuestName)
						TalkAppendString(varMap,x203713_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203713_var_FileId, x203713_var_QuestId[zhiye+1]);
			else
						
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_WANCHENG_QUEDING, 1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_WANCHENG_WENHAO, 0)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203713_var_QuestName)
						TalkAppendString(varMap,x203713_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203713_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203713_var_FileId, x203713_var_QuestId[zhiye+1]);
			end
  elseif x203713_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203713_var_QuestName)
			TalkAppendString(varMap,x203713_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			
			TalkAppendString( varMap,x203713_var_ExtTarget[zhiye+1].target)

			if x203713_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203713_var_QuestHelp )
			end
			x203713_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203713_var_FileId, x203713_var_QuestId[zhiye+1]);
  
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
 end
	
end


function x203713_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203713_CheckSubmit( varMap, varPlayer, varTalknpc)
	local zhiye= GetZhiye( varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203713_var_QuestId[zhiye+1] )
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then
	    return 1
	end
	return 0
	
end

function x203713_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		local zhiye= GetZhiye( varMap, varPlayer)
		if IsQuestHaveDone(varMap, varPlayer, x203713_var_QuestId[zhiye+1]) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203713_var_QuestId[zhiye+1]  )
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
		
		if x203713_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203713_var_QuestId[zhiye+1], x203713_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203713_Msg2toplayer( varMap, varPlayer,0)
		  			 
		  				if x203713_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203713_var_QuestId[zhiye+1])                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 90,0 )	
	    				end
	    			x203713_ProcQuestLogRefresh( varMap, varPlayer, x203713_var_QuestId[zhiye+1])
		  			end
	 	end                                                                    
	     
end


function x203713_ProcQuestAbandon(varMap, varPlayer, varQuest)
		local zhiye= GetZhiye( varMap, varPlayer)
		for i , item in x203713_var_QuestId do 
			if IsHaveQuest(varMap,varPlayer, item) > 0 then
				if DelQuest(varMap, varPlayer, item) > 0 then
					 x203713_Msg2toplayer( varMap, varPlayer,1)
				end
			end
		end
			
end

function x203713_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local zhiye= GetZhiye( varMap, varPlayer)
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)	
		
  for j, item in x203713_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppend( varMap, item.item, item.n )
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

function x203713_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	local zhiye= GetZhiye( varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x203713_var_QuestId[zhiye+1]) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203713_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203713_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203713_var_QuestId[zhiye+1]) > 0 then
				x203713_Msg2toplayer( varMap, varPlayer,2)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,13,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 23,0 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 90,0 )
				QuestCom(varMap, varPlayer, x203713_var_QuestId[zhiye+1])
				QuestCom(varMap, varPlayer, 6001)
				x203713_GetBonus( varMap, varPlayer,varTalknpc)
				
				StartItemTask(varMap)
 				
				for varI, item in x203713_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x203713_GetBonus( varMap, varPlayer,varTalknpc)

	 	if x203713_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203713_var_ExpBonus);
  		end
		if x203713_var_BonusMoney1 > 0 then
	    	AddMoney( varMap, varPlayer, 1, x203713_var_BonusMoney1 )
	 	end
		if x203713_var_BonusMoney2 > 0 then
	    	AddMoney( varMap, varPlayer, 0, x203713_var_BonusMoney2 )
	 	end
		if x203713_var_BonusMoney3 > 0 then
	    	AddMoney( varMap, varPlayer, 3, x203713_var_BonusMoney3 )
		end
		if x203713_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203713_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203713_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203713_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203713_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203713_var_BonusMoney6)
		end
end

function x203713_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203713_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203713_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203713_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203713_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203713_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203713_var_QuestName.."！", 0, 3)
				if x203713_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203713_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203713_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203713_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203713_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203713_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203713_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203713_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203713_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203713_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203713_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203713_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203713_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203713_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203713_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203713_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203713_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203713_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203713_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203713_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local zhiye= GetZhiye( varMap, varPlayer)
	local bFind  = 0
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 90,1 )
	  
	if x203713_var_NpcGUID.guid ~= varTalkNpcGUID then
		return
	end
	
	if IsHaveQuest(varMap,varPlayer, x203713_var_QuestId[zhiye+1]) > 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203713_var_QuestId[zhiye+1])
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203713_var_QuestId[zhiye+1], varState, -1 )
	

	end
end

function x203713_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    local zhiye= GetZhiye( varMap, varPlayer)
    local strTarget = format( "任务已经完成，请回报")
    local varTalknpc = 0
	if zhiye < 0 or zhiye > 11 then
		return
	else
    strTarget = x203713_var_QuestTarget[zhiye+1] 
    end   	
	varTalknpc = x203713_var_NpcGUID.guid

	StartTalkTask( varMap)
		x203713_DispatchQuestInfo( varMap, varPlayer, -1 )
        AddQuestLogCustomText( varMap,
                                "",                             
                                x203713_var_QuestName,          
                                strTarget,
                                "@npc_"..varTalknpc,                             
                                x203713_var_QuestTarget[zhiye+1],
                                "\t虽然你已经具备相当的实力自保，但你还需要进一步提升自身的实力。\n\t去找王城的技能大师吧，他可以帮你快速地提升技能的威力。",
                                ""
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x203713_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203713_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203713_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203713_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203713_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203713_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
