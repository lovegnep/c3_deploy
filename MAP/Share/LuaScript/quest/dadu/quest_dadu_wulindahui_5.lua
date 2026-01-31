

--DECLARE_QUEST_INFO_START--
x270008_var_FileId = 270008
x270008_var_QuestIdPre =3573
x270008_var_QuestId = 3575
x270008_var_LevelLess	= 	77 
x270008_var_QuestIdNext = -1
x270008_var_Name	={}
x270008_var_ExtTarget={{type=20,n=5,target="解救被困在西苑的僧人"}}
x270008_var_QuestName="【主线】解救僧人"
x270008_var_QuestInfo="\t寺内僧人有许多是天魔教徒乔装而成，那么真正的僧人最有可能是被关在了别院中，你到大相国寺#R西苑#W查看一下，救出些被困的僧人来。"  
x270008_var_QuestTarget=""		
x270008_var_QuestCompleted="\t寺中逢此大难，真是佛门不幸，武林不幸！"					
x270008_var_ContinueInfo="\t到竹筐或者西苑查查，或许僧人们被关在那里。"
x270008_var_QuestHelp =	"此任务无自动寻路，请根据剧情来完成此任务"
x270008_var_DemandItem ={}
x270008_var_BonusMoney1 =0
x270008_var_BonusMoney2 =0
x270008_var_BonusMoney3 =0
x270008_var_BonusMoney4 =0
x270008_var_BonusMoney5 =78
x270008_var_BonusMoney6 =0
x270008_var_BonusItem	=	{}
x270008_var_BonusChoiceItem ={}
x270008_var_ExpBonus = 528000
x270008_var_GroupPoint	={ {type=10,varId =15,target = "和尚堆"} }
--DECLARE_QUEST_INFO_STOP--


function x270008_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270008_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270008_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270008_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270008_var_QuestId, varState, -1 )
	end
end

function x270008_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270008_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270008_var_ExpBonus )
		end
		if x270008_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270008_var_BonusMoney1 )
		end
		if x270008_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270008_var_BonusMoney2 )
		end
		if x270008_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270008_var_BonusMoney3 )
		end
		if x270008_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270008_var_BonusMoney4 )
		end
		if x270008_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270008_var_BonusMoney5 )
		end
		if x270008_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270008_var_BonusMoney6 )
		end
		for varI, item in x270008_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270008_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270008_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, which)	
	if IsQuestHaveDone(varMap, varPlayer, x270008_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270008_var_QuestId) > 0 then
			if x270008_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270008_var_QuestName)
						TalkAppendString(varMap,x270008_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270008_var_FileId, x270008_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270008_var_QuestName)
						TalkAppendString(varMap,x270008_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270008_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270008_var_FileId, x270008_var_QuestId);
			end
  elseif x270008_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270008_var_QuestName)
			TalkAppendString(varMap,x270008_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270008_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270008_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270008_var_QuestHelp )
			end
			x270008_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270008_var_FileId, x270008_var_QuestId);
  end
	
end


function x270008_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270008_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270008_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270008_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >= 5 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	    end
	 		return 0
	
end

function x270008_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270008_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270008_var_QuestId  )
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
		if x270008_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270008_var_QuestId, x270008_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270008_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x270008_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270008_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270008_var_QuestId)
	  x270008_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270008_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x270008_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270008_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270008_var_BonusChoiceItem do
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

function x270008_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270008_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270008_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270008_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270008_var_QuestId) > 0 then
				x270008_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270008_var_QuestId)
				x270008_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270008_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270008_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x270008_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		
   end
   
end

function x270008_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270008_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270008_var_ExpBonus);
  	end
		if x270008_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270008_var_BonusMoney1 )
	  end
		if x270008_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270008_var_BonusMoney2 )
	  end
		if x270008_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270008_var_BonusMoney3 )
		end
		if x270008_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270008_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270008_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270008_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270008_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270008_var_BonusMoney6)
		end
end

function x270008_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270008_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270008_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270008_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270008_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270008_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270008_var_QuestName.."！", 0, 3)
				if x270008_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270008_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270008_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270008_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270008_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270008_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270008_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270008_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270008_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270008_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270008_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270008_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270008_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270008_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270008_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270008_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270008_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270008_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270008_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270008_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x270008_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270008_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270008_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270008_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270008_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270008_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270008_Growpoint(varMap,varPlayer,which)
		if IsHaveQuest(varMap,varPlayer, x270008_var_QuestId) <= 0 then
				return 1
		end
		if which ==0 then
							return 0
		elseif which == 1 then
				if IsHaveQuest(varMap,varPlayer, x270008_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270008_var_QuestId)
										if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 5 then
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
												Msg2Player(varMap, varPlayer, format("解救僧人   %d/5", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)
												x270008_CheckSubmit( varMap, varPlayer)
										end
										local varX,z =GetWorldPos(varMap,varPlayer)
										local creatid =CreateMonster(varMap, 13,varX,z,3,1,-1,-1,20,4000,180,"被困的僧人")
										SendSpecificImpactToUnit(varMap, creatid, creatid, creatid, 8712, 0);
        end
    		return 1
    end
		
end
