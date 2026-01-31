

--DECLARE_QUEST_INFO_START--
x270005_var_FileId = 270005
x270005_var_QuestIdPre =3563
x270005_var_QuestId = 3570
x270005_var_LevelLess	= 	77 
x270005_var_QuestIdNext = 3571
x270005_var_Name	={}
x270005_var_ExtTarget={{type=20,n=1,target="询问@npc_139320铁琴印的事"}}
x270005_var_QuestName="【主线】信物被损"
x270005_var_QuestInfo="\t(何足道拿起了“铁琴”仔细看了看说道)\n\t此物确实是我昆仑派信物，但多年前我已将此物送给了丐帮帮主郭破虏，他一直随身带着。而从伤痕上来看，很像是被丐帮的“落叶掌”和“打蛇八式”所伤。\n\t不过，以郭帮主的为人，也断然不会做出这种事，少侠不妨查探一下，看看郭帮主的信物还在不在。"  
x270005_var_QuestTarget=""		
x270005_var_QuestCompleted="\t没了？！此物乃是峨眉开山祖师郭襄女侠所赠，郭帮主自得了此物后，一直随身携带，怎么可能随意丢弃？"					
x270005_var_ContinueInfo="\t我怀疑有人嫁祸丐帮，因为我相信郭帮主是一个正直的人，不会来诬陷我。"
x270005_var_QuestHelp =	""
x270005_var_DemandItem ={}
x270005_var_BonusMoney1 =0
x270005_var_BonusMoney2 =0
x270005_var_BonusMoney3 =0
x270005_var_BonusMoney4 =0
x270005_var_BonusMoney5 =87
x270005_var_BonusMoney6 =0
x270005_var_BonusItem	=	{}
x270005_var_BonusChoiceItem ={}
x270005_var_ExpBonus = 480000
x270005_var_NpcGUID ={{ guid = 139320, varName = "张真人"} }
--DECLARE_QUEST_INFO_STOP--


function x270005_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270005_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270005_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270005_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270005_var_QuestId, varState, -1 )
	end
end

function x270005_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270005_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270005_var_ExpBonus )
		end
		if x270005_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270005_var_BonusMoney1 )
		end
		if x270005_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270005_var_BonusMoney2 )
		end
		if x270005_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270005_var_BonusMoney3 )
		end
		if x270005_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270005_var_BonusMoney4 )
		end
		if x270005_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270005_var_BonusMoney5 )
		end
		if x270005_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270005_var_BonusMoney6 )
		end
		for varI, item in x270005_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270005_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270005_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x270005_var_QuestId) > 0 then
		return 
	end
	if which == -1 then
		if IsHaveQuest(varMap,varPlayer, x270005_var_QuestId) > 0 then
			if x270005_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270005_var_QuestName)
						TalkAppendString(varMap,x270005_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270005_var_FileId, x270005_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270005_var_QuestName)
						TalkAppendString(varMap,x270005_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270005_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270005_var_FileId, x270005_var_QuestId);
			end
		elseif x270005_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270005_var_QuestName)
			TalkAppendString(varMap,x270005_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270005_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270005_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270005_var_QuestHelp )
			end
			x270005_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270005_var_FileId, x270005_var_QuestId);
  	end
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t这个铁琴印我的确见过，上次武林大会上，何足道把它赠与了丐帮帮主郭破虏，此事是我亲眼所见。但是郭帮主性格随和，如此惨案不会是他所为。")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270005_var_FileId, x270005_var_QuestId);
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270005_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	end
end


function x270005_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270005_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270005_CheckSubmit( varMap, varPlayer, varTalknpc)
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270005_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	    end
	 		return 0
end

function x270005_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270005_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270005_var_QuestId  )
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
		if x270005_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270005_var_QuestId, x270005_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270005_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x270005_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270005_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270005_var_QuestId)
	  x270005_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270005_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
end

function x270005_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270005_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270005_var_BonusChoiceItem do
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

function x270005_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270005_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270005_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270005_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270005_var_QuestId) > 0 then
				x270005_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270005_var_QuestId)
				x270005_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270005_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270005_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270005_var_QuestIdNext )	
end

function x270005_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270005_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270005_var_ExpBonus);
  	end
		if x270005_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270005_var_BonusMoney1 )
	  end
		if x270005_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270005_var_BonusMoney2 )
	  end
		if x270005_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270005_var_BonusMoney3 )
		end
		if x270005_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270005_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270005_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270005_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270005_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270005_var_BonusMoney6)
		end
end

function x270005_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270005_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270005_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270005_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270005_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270005_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270005_var_QuestName.."！", 0, 3)
				if x270005_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270005_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270005_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270005_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270005_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270005_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270005_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270005_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270005_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270005_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270005_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270005_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270005_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270005_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270005_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270005_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270005_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270005_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270005_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270005_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270005_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270005_var_QuestId) > 0 then
				TalkAppendButton(varMap, x270005_var_QuestId, "张真人您可知此物的主人？",0, 1)
		end
end

function x270005_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270005_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270005_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270005_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270005_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270005_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
