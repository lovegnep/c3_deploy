

--DECLARE_QUEST_INFO_START--
x256261_var_FileId = 256261
x256261_var_QuestIdPre =3067
x256261_var_QuestId = 2601
x256261_var_LevelLess	= 	35
x256261_var_QuestIdNext = 4229
x256261_var_Name	={}
x256261_var_ExtTarget={{type=20,n=1,target="兑换一件世传帽子"}}
x256261_var_QuestName="【个人】龙眼石兑换"
x256261_var_QuestInfo="\t亲爱的朋友，在我的手中有很多更高级的世传君主套装，换上这些套装你的能力会有更多的提升。你手中如果有足够的龙眼石，不妨考虑兑换一件。\n\t点击龙眼石兑换后，会打开龙眼石兑换商店。左键点击选择兑换物品（#G建议兑换世传帽子#W），在龙眼石数量足够的情况下点击兑换，兑换就会达成。"  
x256261_var_QuestTarget=""		
x256261_var_QuestCompleted="\t这件装备必然对你日后成长和能力提高起到不可低估的作用。\n\t一定要记住，日后再获得龙眼石还可以来我这里兑换装备。"					
x256261_var_ContinueInfo="\t你不想兑换一件世传帽子吗？"
x256261_var_QuestHelp =	""
x256261_var_DemandItem =	   {10244001, 10244011, 10244021,	10244031,	10244041,	10244051,	10264001,	10264011,	10264021,	10264031,	10264041,	10264051,	10204001, 10204011,	10204021,	10204031,	10204041,	10204051,10204061,10269218,10249218,10204071,10269222,10249222,10204081,10269226,10249226,10204091,10269230,10249230,10204101,10269234,10249234,10204111,10269238,10249238}						
x256261_var_ExpBonus = 24000
x256261_var_BonusMoney1 =176
x256261_var_BonusMoney2 =0
x256261_var_BonusMoney3 =0
x256261_var_BonusMoney4 =0
x256261_var_BonusMoney5 =21
x256261_var_BonusMoney6 =0
x256261_var_BonusItem	=	{}
x256261_var_BonusChoiceItem ={}
x256261_var_NpcGUID ={{ guid = 126042, varName = "龙眼石兑换"} }
--DECLARE_QUEST_INFO_STOP--

x256261_var_MaxLevel   = 50

function x256261_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256261_var_LevelLess or varLevel >= x256261_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256261_var_QuestId) > 0 then
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x256261_var_QuestIdPre)> 0 then 
	if IsHaveQuest(varMap,varPlayer, x256261_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256261_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256261_var_QuestId, varState, -1 )
	end
	end

end

function x256261_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256261_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256261_var_ExpBonus )
		end
		if x256261_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256261_var_BonusMoney1 )
		end
		if x256261_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256261_var_BonusMoney2 )
		end
		if x256261_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256261_var_BonusMoney3 )
		end
		if x256261_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256261_var_BonusMoney4 )
		end
		if x256261_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256261_var_BonusMoney5 )
		end
		if x256261_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256261_var_BonusMoney6 )
		end
		for varI, item in x256261_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256261_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256261_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256261_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256261_var_QuestId) > 0 then
			if x256261_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256261_var_QuestName)
				TalkAppendString(varMap,x256261_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256261_var_FileId, x256261_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256261_var_QuestName)
				TalkAppendString(varMap,x256261_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256261_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256261_var_FileId, x256261_var_QuestId);
			end
  elseif x256261_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256261_var_QuestName)
			TalkAppendString(varMap,x256261_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256261_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256261_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256261_var_QuestHelp )
			end
			x256261_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256261_var_FileId, x256261_var_QuestId);
  end
	
end


function x256261_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256261_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x256261_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x256261_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
	
end


function x256261_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256261_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256261_var_QuestId  )
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
		
		if x256261_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then

					local retmiss = AddQuest( varMap, varPlayer, x256261_var_QuestId, x256261_var_FileId, 0, 0, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256261_Msg2toplayer( varMap, varPlayer,0)
		  			
					for varI, item in x256261_var_DemandItem do
						if GetItemCount(varMap,varPlayer,x256261_var_DemandItem[varI]) >= 1 then		
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256261_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
					
					end
		  			
	 	end                                                                    
	     
end


function x256261_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256261_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256261_var_QuestId)
	  x256261_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256261_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256261_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256261_var_BonusChoiceItem do
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

function x256261_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256261_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256261_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256261_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256261_var_QuestId) > 0 then
				x256261_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256261_var_QuestId)
				x256261_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256261_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256261_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256261_var_QuestIdNext )	
end

function x256261_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256261_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256261_var_ExpBonus);
  	end
		if x256261_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256261_var_BonusMoney1 )
	  end
		if x256261_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256261_var_BonusMoney2 )
	  end
		if x256261_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256261_var_BonusMoney3 )
		end
		if x256261_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256261_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256261_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256261_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256261_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256261_var_BonusMoney6)
		end
end

function x256261_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256261_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256261_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256261_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256261_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256261_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256261_var_QuestName.."！", 0, 3)
				if x256261_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256261_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256261_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256261_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256261_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256261_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256261_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256261_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256261_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256261_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256261_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256261_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256261_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256261_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256261_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256261_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256261_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256261_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256261_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest,optype)
	if	optype	==	0	then
		return
	end
	
	for varI, item in x256261_var_DemandItem do
	
		if varItemData == item then

			if GetItemCount(varMap,varPlayer,item) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256261_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		  	else
		  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256261_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		  	end
		  	
		  	break
	  	
	  	end
	  	
	end

end


function x256261_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256261_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256261_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256261_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256261_var_QuestId, varState, -1 )
		end
end

function x256261_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256261_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256261_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256261_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256261_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256261_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
