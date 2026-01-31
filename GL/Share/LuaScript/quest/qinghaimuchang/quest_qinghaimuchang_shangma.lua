

--DECLARE_QUEST_INFO_START--
x203590_var_FileId = 203590
x203590_var_QuestIdPre =3408
x203590_var_QuestId = 3409
x203590_var_LevelLess	= 	1 
x203590_var_QuestIdNext = 3442
x203590_var_Name	={}
x203590_var_ExtTarget={{type=20,n=1,target="按下#GX#W键或点击萤幕下方的#G马#W字按钮，骑上马"}}
x203590_var_QuestName="【新手】上马"
x203590_var_QuestInfo="\t（白鹿长老轻轻地拍了拍马背对你说道）\n\t你还不会骑马吧，不会骑马的人是无法在这个世界里生存下去的，现在我来教你如何骑上马。"  
x203590_var_QuestTarget="按下#GX#W键或点击萤幕下方的#G马#W字按钮，骑上马"		
x203590_var_QuestCompleted="\t可能这第一匹马儿看上去并不是那么完美，但是它是你在这里第一个忠诚的伙伴。"					
x203590_var_ContinueInfo="\t你要先骑上马我才能教你后面的知识。"
x203590_var_QuestHelp =	"\t#G您可以按下下方快捷栏中的#R马#G按钮，也可以按下您键盘上的#RX#G键，骑上马。"
x203590_var_DemandItem ={}
x203590_var_ExpBonus = 163
x203590_var_BonusMoney1 =55
x203590_var_BonusMoney2 =0
x203590_var_BonusMoney3 =0
x203590_var_BonusMoney4 =0
x203590_var_BonusMoney5 =12
x203590_var_BonusMoney6 =0
x203590_var_BonusItem	=	{}
x203590_var_BonusChoiceItem ={}
x203590_var_NpcGUID = {}
--DECLARE_QUEST_INFO_STOP--


function x203590_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203590_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203590_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203590_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203590_var_QuestId, varState, -1 )
	end
end

function x203590_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203590_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203590_var_ExpBonus )
		end
		if x203590_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203590_var_BonusMoney1 )
		end
		if x203590_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203590_var_BonusMoney2 )
		end
		if x203590_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203590_var_BonusMoney3 )
		end
		if x203590_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203590_var_BonusMoney4 )
		end
		if x203590_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203590_var_BonusMoney5 )
		end
		if x203590_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203590_var_BonusMoney6 )
		end
		for varI, item in x203590_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203590_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203590_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203590_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203590_var_QuestId) > 0 then
			if x203590_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203590_var_QuestName)
						TalkAppendString(varMap,x203590_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203590_var_FileId, x203590_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203590_var_QuestName)
						TalkAppendString(varMap,x203590_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203590_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203590_var_FileId, x203590_var_QuestId);
			end
  elseif x203590_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203590_var_QuestName)
			TalkAppendString(varMap,x203590_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203590_var_ExtTarget do  
					TalkAppendString( varMap,item.target)
			end 
			if x203590_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:")
				TalkAppendString(varMap,x203590_var_QuestHelp )
			end
			x203590_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203590_var_FileId, x203590_var_QuestId);
  end
	
end


function x203590_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203590_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203590_CheckSubmit( varMap, varPlayer, varTalknpc)
	if GetHorseCount(varMap,varPlayer) > 0 then
			if IsHaveMount(varMap, varPlayer,1) > 0 then
	        return 1
	    elseif IsHaveMount(varMap, varPlayer,11) > 0 then
	    		return 1
	    elseif IsHaveMount(varMap, varPlayer,21) > 0 then
	    		return 1
	    elseif IsHaveMount(varMap, varPlayer,31) > 0 then
	    		return 1
	    elseif IsHaveMount(varMap, varPlayer,41) > 0 then
	    		return 1
	    elseif IsHaveMount(varMap, varPlayer,51) > 0 then
	    		return 1
	    end
	end
	return 0
end

function x203590_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203590_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203590_var_QuestId  )
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
		if x203590_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203590_var_QuestId, x203590_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203590_Msg2toplayer( varMap, varPlayer,0)
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,1 )
		  			SetQuestEvent(varMap, varPlayer, x203590_var_QuestId, 3 )
						if x203590_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203590_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)  
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,1 )
	    					
	    		      LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
	    				
	    			end
		  		end
	 	end                                                                    
	     
end


function x203590_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203590_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203590_var_QuestId)  
		 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,12,0 )  
		 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
		 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 ) 
	  x203590_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203590_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203590_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203590_var_BonusChoiceItem do
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

function x203590_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203590_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203590_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203590_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203590_var_QuestId) > 0 then
				x203590_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203590_var_QuestId)
				x203590_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203590_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203590_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end  
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 )
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203590_var_QuestIdNext )	
end

function x203590_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203590_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203590_var_ExpBonus);
  	end
		if x203590_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203590_var_BonusMoney1 )
	  end
		if x203590_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203590_var_BonusMoney2 )
	  end
		if x203590_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203590_var_BonusMoney3 )
		end
		if x203590_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203590_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203590_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203590_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203590_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203590_var_BonusMoney6)
		end
end

function x203590_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203590_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203590_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203590_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203590_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203590_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203590_var_QuestName.."！", 0, 3)
				if x203590_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203590_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203590_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203590_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203590_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203590_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203590_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203590_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203590_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203590_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203590_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203590_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203590_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203590_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203590_ProcQuestHorseChanged(varMap, varPlayer, horseId, varQuest)

end

function x203590_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203590_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203590_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203590_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203590_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203590_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x203590_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203590_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203590_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203590_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203590_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203590_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
