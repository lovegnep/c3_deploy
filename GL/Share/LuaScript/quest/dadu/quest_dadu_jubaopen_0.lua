

--DECLARE_QUEST_INFO_START--
x270013_var_FileId = 270013
x270013_var_QuestIdPre =3591
x270013_var_QuestId = 3592
x270013_var_LevelLess	= 	55 
x270013_var_QuestIdNext = 3593
x270013_var_Name	={}
x270013_var_ExtTarget={{type=20,n=3,target="到院中@npc_143175后找出复制的桑哥并杀掉他们"}}
x270013_var_QuestName="【主线】萧墙之患<二>"
x270013_var_QuestInfo="\t（桑哥望着你的眼睛很认真地说）\n\t我不知道该怎么说这件事，你跨进后边的一个院子，如果看见了其他的“我”请让他永远消失。记住，不要迟疑，让他们全部消失！"  
x270013_var_QuestTarget=""		
x270013_var_QuestCompleted="\t（见你很快地出来桑哥很诧异的看着你）\n\t你，你把“他们”全部清理了？！"					
x270013_var_ContinueInfo="\t咄咄怪事，咄咄怪事！"
x270013_var_QuestHelp =	""
x270013_var_DemandItem ={}
x270013_var_BonusMoney1 =376
x270013_var_BonusMoney2 =0
x270013_var_BonusMoney3 =0
x270013_var_BonusMoney4 =0
x270013_var_BonusMoney5 =66
x270013_var_BonusMoney6 =0
x270013_var_BonusItem	=	{}
x270013_var_BonusChoiceItem ={}
x270013_var_ExpBonus = 171000
x270013_var_GroupPoint	={ {type=10,varId =18,target = "假桑哥"} }
--DECLARE_QUEST_INFO_STOP--


function x270013_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270013_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270013_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270013_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270013_var_QuestId, varState, -1 )
	end
end

function x270013_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270013_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270013_var_ExpBonus )
		end
		if x270013_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270013_var_BonusMoney1 )
		end
		if x270013_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270013_var_BonusMoney2 )
		end
		if x270013_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270013_var_BonusMoney3 )
		end
		if x270013_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270013_var_BonusMoney4 )
		end
		if x270013_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270013_var_BonusMoney5 )
		end
		if x270013_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270013_var_BonusMoney6 )
		end
		for varI, item in x270013_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270013_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270013_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270013_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270013_var_QuestId) > 0 then
			if x270013_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270013_var_QuestName)
						TalkAppendString(varMap,x270013_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270013_var_FileId, x270013_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270013_var_QuestName)
						TalkAppendString(varMap,x270013_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270013_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270013_var_FileId, x270013_var_QuestId);
			end
  elseif x270013_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270013_var_QuestName)
			TalkAppendString(varMap,x270013_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270013_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270013_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270013_var_QuestHelp )
			end
			x270013_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270013_var_FileId, x270013_var_QuestId);
  end
	
end


function x270013_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270013_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270013_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270013_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >=3 then 
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1
	  end
	  return 0
	
end

function x270013_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270013_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270013_var_QuestId  )
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
		if x270013_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270013_var_QuestId, x270013_var_FileId, 1, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270013_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x270013_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270013_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270013_var_QuestId)
	  x270013_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270013_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270013_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270013_var_BonusChoiceItem do
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

function x270013_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270013_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270013_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270013_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270013_var_QuestId) > 0 then
				x270013_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270013_var_QuestId)
				x270013_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270013_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270013_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270013_var_QuestIdNext )	
end

function x270013_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270013_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270013_var_ExpBonus);
  	end
		if x270013_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270013_var_BonusMoney1 )
	  end
		if x270013_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270013_var_BonusMoney2 )
	  end
		if x270013_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270013_var_BonusMoney3 )
		end
		if x270013_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270013_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270013_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270013_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270013_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270013_var_BonusMoney6)
		end
end

function x270013_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270013_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270013_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270013_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270013_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270013_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270013_var_QuestName.."！", 0, 3)
				if x270013_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270013_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270013_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270013_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270013_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270013_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270013_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270013_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270013_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270013_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270013_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270013_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270013_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270013_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270013_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==3900 then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x270013_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x270013_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 3 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("杀死复制的桑哥   %d/3", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x270013_CheckSubmit( varMap, humanObjId)
										end
                end
            end
		end
	end
end


function x270013_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )

end

function x270013_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
end

function x270013_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x270013_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270013_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x270013_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270013_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270013_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270013_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270013_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270013_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270013_Growpoint(varMap,varPlayer,which)
		if IsHaveQuest(varMap,varPlayer, x270013_var_QuestId) <= 0 then
				return 1
		end
		if which ==0 then
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270013_var_QuestId)
				if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 3 then
							return 0
				else
							Msg2Player(varMap, varPlayer, "您已经完成了任务！", 0, 3)
							return 1
				end
		elseif which == 1 then
			local varX,z =GetWorldPos(varMap,varPlayer)
			local creatid =CreateMonster(varMap, 3900,varX+1,z+1,5,1,-1,-1,21,20000,180,"复制的桑哥")
			SendSpecificImpactToUnit(varMap, creatid, creatid, creatid, 8712, 0);
     end
    		return 1
		
end
