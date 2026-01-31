

--DECLARE_QUEST_INFO_START--
x203710_var_FileId = 203710
x203710_var_QuestIdPre = 3295
x203710_var_QuestId = 3279
x203710_var_LevelLess	= 	1
x203710_var_QuestIdNext = 3291
x203710_var_Name	={}
x203710_var_ExtTarget={{type=20,n=1,target="找到@npc_123758学习并使用2级苦修祷言"}}
x203710_var_QuestName="【新手】职业的进阶"
x203710_var_QuestInfo="\t你已经熟悉了生存的必要条件和王城周围的环境，现在你需要加强的就是你的自身实力了，王城的技能大师可以帮你快速地提升自身的能力。\n\t现在，你可以去找他了。"  
x203710_var_QuestTarget=""		
x203710_var_QuestCompleted="\t我就是这里的技能大师，如果你愿意，我将是你终生的导师。\n\t活到老学到老，等你觉得自己杀敌变得缓慢的时候记得来找我学习新的技能。"					
x203710_var_ContinueInfo="\t不清楚如何提升技能等级？在我这里就可以学习、提升先知的技能。\n\t点击#G先知技能学习#W按钮就能进入技能学习介面，里面#G明亮的技能#W表示你现在能掌握的技能，点击相应图示即可学习技能，当然你要有一定的经验和银子！\n\t最后记得学习完技能后，要将自己#G技能栏内技能的图示#W拖到下方#G快捷栏内#W，才能在需要的时候，方便快捷的使用。"
x203710_var_QuestHelp =	"#G您可以按下键盘上的#R2#G键，或者左键点击您下方技能快捷栏中的#R苦修祷言#G技能。#W"
x203710_var_DemandItem ={}
x203710_var_ExpBonus = 855
x203710_var_BonusMoney1 =132
x203710_var_BonusMoney2 =0
x203710_var_BonusMoney3 =0
x203710_var_BonusMoney4 =0
x203710_var_BonusMoney5 =20
x203710_var_BonusMoney6 =0
x203710_var_BonusItem	=	{}
x203710_var_BonusChoiceItem ={}
x203710_var_NpcGUID ={{ guid = 123758, varName = "隐修士技能大师"} } 
--DECLARE_QUEST_INFO_STOP--


function x203710_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203710_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203710_var_QuestIdPre)> 0 then
		if GetZhiye( varMap, varPlayer)==10 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203710_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203710_var_QuestId, varState, -1 )
		end
	end
end

function x203710_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203710_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203710_var_ExpBonus )
		end
		if x203710_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203710_var_BonusMoney1 )
		end
		if x203710_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203710_var_BonusMoney2 )
		end
		if x203710_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203710_var_BonusMoney3 )
		end
		if x203710_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203710_var_BonusMoney4 )
		end
		if x203710_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203710_var_BonusMoney5 )
		end
		if x203710_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203710_var_BonusMoney6 )
		end
		for varI, item in x203710_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203710_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203710_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203710_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203710_var_QuestId) > 0 then
			if x203710_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203710_var_QuestName)
						TalkAppendString(varMap,x203710_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203710_var_FileId, x203710_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203710_var_QuestName)
						TalkAppendString(varMap,x203710_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203710_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203710_var_FileId, x203710_var_QuestId);
			end
  elseif x203710_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203710_var_QuestName)
			TalkAppendString(varMap,x203710_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203710_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203710_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203710_var_QuestHelp )
			end
			x203710_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203710_var_FileId, x203710_var_QuestId);
  end
	
end


function x203710_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203710_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203710_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203710_var_QuestId )
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 23,0 ) 
	        return 1
	end
	return 0
	
end

function x203710_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203710_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203710_var_QuestId  )
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
		if x203710_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203710_var_QuestId, x203710_var_FileId, 0, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203710_Msg2toplayer( varMap, varPlayer,0)
		  			  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 23,1 )
		  			if x203710_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203710_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	   				end
		  		end
	 	end                                                                    
	     
end


function x203710_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203710_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203710_var_QuestId)
	  x203710_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 23,0 )
			
end

function x203710_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203710_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203710_var_BonusChoiceItem do
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

function x203710_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203710_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203710_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203710_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203710_var_QuestId) > 0 then
				x203710_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203710_var_QuestId)
				
				x203710_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203710_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203710_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203710_var_QuestIdNext )	
end

function x203710_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203710_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203710_var_ExpBonus);
  	end
		if x203710_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203710_var_BonusMoney1 )
	  end
		if x203710_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203710_var_BonusMoney2 )
	  end
		if x203710_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203710_var_BonusMoney3 )
		end
		if x203710_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203710_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203710_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203710_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203710_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203710_var_BonusMoney6)
		end
end

function x203710_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203710_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203710_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203710_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203710_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203710_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203710_var_QuestName.."！", 0, 3)
				if x203710_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203710_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203710_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203710_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203710_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203710_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203710_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203710_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203710_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203710_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203710_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203710_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203710_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203710_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203710_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203710_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203710_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203710_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203710_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203710_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
local bFind  = 0
    for varI ,item in x203710_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203710_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203710_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203710_var_QuestId, varState, -1 )
		end
end

function x203710_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203710_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203710_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203710_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203710_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203710_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
