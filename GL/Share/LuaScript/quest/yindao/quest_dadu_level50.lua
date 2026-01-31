

--DECLARE_QUEST_INFO_START--
x256299_var_FileId = 256299
x256299_var_QuestIdPre = -1
x256299_var_QuestId = 1600
x256299_var_LevelLess	= 	45 
x256299_var_QuestIdNext = 3937
x256299_var_Name	={}
x256299_var_ExtTarget={{type=20,n=1,target="按任务攻略的指引升级到50级"}}
x256299_var_QuestName="【个人】目标：五十级"
x256299_var_QuestInfo="\t你好，亲爱的朋友，我这里有些你应该知道的事情：\n\t每天的#G10：30——11：00#W，#G12：30——13：00#W，#G14：30——15：00#W，#G16：30——17：00#W，#G18：30——19：00#W，#G21：30——22：00#W魔君完颜洪烈的部将都会出现在#G凤翔府#W，击杀他们会获得大量各种奖励。\n\t大都的@npc_139100、@npc_139129、@npc_139133他们会在每天晚上#G19：30——24：00#W发布任务，完成后就会获得高额的经验回报。\n\t越是深夜兴致越是高涨？不妨#G23：00#W之后去大都的@npc_139104的店里玩玩，轻松获得大量经验。"  
x256299_var_QuestTarget=""		
x256299_var_QuestCompleted="\t五十级是一个不错的成就，但也是新的开始。\n\t我这里为你准备了一些小礼物，希望能对你的历程有所帮助。"					
x256299_var_ContinueInfo="别太心急，我为你的五十级准备了不少礼物，但是......你应该先到五十级再来。"
x256299_var_QuestHelp =	""
x256299_var_DemandItem ={}
x256299_var_ExpBonus = 2000000
x256299_var_BonusMoney1 =150000
x256299_var_BonusMoney2 =0
x256299_var_BonusMoney3 =0
x256299_var_BonusMoney4 =0
x256299_var_BonusMoney5 =0
x256299_var_BonusMoney6 =0
x256299_var_BonusItem	=	{{item=12030253,n=1},{item=11060002,n=2}}
x256299_var_BonusChoiceItem ={}
x256299_var_NpcGUID ={{ guid = 140417, varName = "包打听"} }
--DECLARE_QUEST_INFO_STOP--


x256299_var_MaxLevel      = 80


function x256299_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
     local varLevel = GetLevel(varMap, varPlayer)
	   if varLevel < x256299_var_LevelLess or varLevel >= x256299_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256299_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256299_var_QuestId) <= 0 then
		
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256299_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256299_var_QuestId, varState, -1 )
		end
	

end

function x256299_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256299_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256299_var_ExpBonus )
		end
		if x256299_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256299_var_BonusMoney1 )
		end
		if x256299_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256299_var_BonusMoney2 )
		end
		if x256299_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256299_var_BonusMoney3 )
		end
		if x256299_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256299_var_BonusMoney4 )
		end
		if x256299_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256299_var_BonusMoney5 )
		end
		if x256299_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256299_var_BonusMoney6 )
		end
		for varI, item in x256299_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256299_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256299_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256299_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256299_var_QuestId) > 0 then
			if x256299_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256299_var_QuestName)
				TalkAppendString(varMap,x256299_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256299_var_FileId, x256299_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256299_var_QuestName)
				TalkAppendString(varMap,x256299_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256299_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256299_var_FileId, x256299_var_QuestId);
			end
  elseif x256299_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256299_var_QuestName)
			TalkAppendString(varMap,x256299_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256299_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256299_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256299_var_QuestHelp )
			end
			x256299_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256299_var_FileId, x256299_var_QuestId);
  end
	
end


function x256299_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256299_CheckSubmit( varMap, varPlayer, varTalknpc)                                                 
	if GetLevel(varMap, varPlayer)>= 50 then
	   return 1
	end
	 
	return 0
	
end


function x256299_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256299_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256299_var_QuestId  )
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
		
		if x256299_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256299_var_QuestId, x256299_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256299_Msg2toplayer( varMap, varPlayer,0)
					if GetLevel(varMap, varPlayer) >= 50 then
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256299_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x256299_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256299_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256299_var_QuestId)
	  x256299_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256299_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256299_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x256299_var_BonusChoiceItem do
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

function x256299_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256299_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256299_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256299_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256299_var_QuestId) > 0 then
				x256299_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256299_var_QuestId)
				x256299_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256299_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256299_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256299_var_QuestIdNext)	
   
end

function x256299_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256299_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256299_var_ExpBonus);
  	end
		if x256299_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256299_var_BonusMoney1 )
	  end
		if x256299_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256299_var_BonusMoney2 )
	  end
		if x256299_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256299_var_BonusMoney3 )
		end
		if x256299_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256299_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256299_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256299_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256299_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256299_var_BonusMoney6)
		end
end

function x256299_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256299_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256299_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256299_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256299_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256299_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256299_var_QuestName.."！", 0, 3)
				if x256299_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256299_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256299_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256299_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256299_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256299_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256299_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256299_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256299_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256299_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256299_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256299_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256299_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256299_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256299_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256299_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256299_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256299_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256299_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256299_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256299_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256299_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256299_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256299_var_QuestId, varState, -1 )
		end
end

function x256299_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256299_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256299_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256299_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256299_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256299_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
