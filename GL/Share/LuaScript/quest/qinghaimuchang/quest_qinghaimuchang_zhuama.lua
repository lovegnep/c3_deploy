

--DECLARE_QUEST_INFO_START--
x203589_var_FileId = 203589
x203589_var_QuestIdPre =3407
x203589_var_QuestId = 3408
x203589_var_LevelLess	= 	1 
x203589_var_QuestIdNext = 3409
x203589_var_Name	={}
x203589_var_ExtTarget={{type=20,n=1,target="抓到一匹@npc_131027"}}
x203589_var_QuestName="【新手】白鹿长老的考验"
x203589_var_QuestInfo="\t在成吉思汗的世界中，想要成为真正的英雄，一匹好马是你必不可少的伙伴。\n\t看见我身后的这些马了吧，你首先要学会的是如何驯服它们。现在，按我教给你的方法，去选择一匹来做为你第一个伙伴吧。"  
x203589_var_QuestTarget="抓到一匹@npc_131027"		
x203589_var_QuestCompleted="\t牢记驯服它们的方法，可能今后你将会得到更多更好的坐骑。"					
x203589_var_ContinueInfo="\t你驯服它了么？"
x203589_var_QuestHelp =	"#G将鼠标移动至#R马匹#G上，点击#R左键#G一下，耐心等待抓马读条完毕，系统会提示您捕捉#R完成#G，如果失败了，很可能是由于您和马的#R距离过远#G导致的，您只需要#R靠近马匹#G，重新抓一次即可。#W"
x203589_var_DemandItem ={}
x203589_var_ExpBonus = 310
x203589_var_BonusMoney1 =5
x203589_var_BonusMoney2 =0
x203589_var_BonusMoney3 =0
x203589_var_BonusMoney4 =0
x203589_var_BonusMoney5 =12
x203589_var_BonusMoney6 =0
x203589_var_BonusItem	=	{}
x203589_var_BonusChoiceItem ={}
x203589_var_NpcGUID = {}
--DECLARE_QUEST_INFO_STOP--


function x203589_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if IsQuestHaveDone(varMap, varPlayer, x203589_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203589_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203589_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203589_var_QuestId, varState, -1 )
			
	end
end

function x203589_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203589_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203589_var_ExpBonus )
		end
		if x203589_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203589_var_BonusMoney1 )
		end
		if x203589_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203589_var_BonusMoney2 )
		end
		if x203589_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203589_var_BonusMoney3 )
		end
		if x203589_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203589_var_BonusMoney4 )
		end
		if x203589_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203589_var_BonusMoney5 )
		end
		if x203589_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203589_var_BonusMoney6 )
		end
		for varI, item in x203589_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203589_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203589_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203589_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203589_var_QuestId) > 0 then
			if x203589_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203589_var_QuestName)
						TalkAppendString(varMap,x203589_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203589_var_FileId, x203589_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203589_var_QuestName)
						TalkAppendString(varMap,x203589_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203589_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203589_var_FileId, x203589_var_QuestId);
			end
  elseif x203589_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203589_var_QuestName)
			TalkAppendString(varMap,x203589_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")  
			for varI, item in x203589_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203589_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203589_var_QuestHelp )
			end
			x203589_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
	  	 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	    
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203589_var_FileId, x203589_var_QuestId);
			
  end
	
end


function x203589_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203589_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203589_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203589_var_QuestId )
	local petnum =GetHorseCount(varMap,varPlayer)
	if petnum > 0 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,20,0 )
	else 
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,20,1 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 )
	end
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	end
	return 0
end

function x203589_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203589_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203589_var_QuestId  )
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
		if x203589_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203589_var_QuestId, x203589_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203589_Msg2toplayer( varMap, varPlayer,0)
		  			SetQuestEvent(varMap, varPlayer, x203589_var_QuestId, 3 )
		  			 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 20,1 )
						if x203589_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203589_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,1 )
	    			end
		  		end
	 	end                                                                    
	     
end


function x203589_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203589_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203589_var_QuestId)
	  x203589_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 )
			
end

function x203589_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203589_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203589_var_BonusChoiceItem do
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

function x203589_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203589_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203589_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203589_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203589_var_QuestId) > 0 then
				x203589_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203589_var_QuestId)
				x203589_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203589_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203589_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 )
   LuaCallNoclosure( 203590, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203589_var_QuestIdNext )	
end

function x203589_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203589_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203589_var_ExpBonus);
  	end
		if x203589_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203589_var_BonusMoney1 )
	  end
		if x203589_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203589_var_BonusMoney2 )
	  end
		if x203589_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203589_var_BonusMoney3 )
		end
		if x203589_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203589_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203589_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203589_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203589_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203589_var_BonusMoney6)
		end
end

function x203589_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203589_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203589_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203589_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203589_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203589_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203589_var_QuestName.."！", 0, 3)
				if x203589_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203589_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203589_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203589_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203589_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203589_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203589_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203589_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203589_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203589_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203589_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203589_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203589_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203589_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203589_ProcQuestHorseChanged(varMap, varPlayer, horseId, varQuest)
	x203589_CheckSubmit( varMap, varPlayer)
end

function x203589_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203589_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203589_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203589_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203589_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203589_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x203589_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203589_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203589_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203589_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203589_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203589_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
