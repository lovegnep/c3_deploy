

--DECLARE_QUEST_INFO_START--
x256104_var_FileId = 256104
x256104_var_QuestIdPre =1028
x256104_var_QuestId = 1032

x256104_var_LevelLess	= 	30
x256104_var_Name	={}
x256104_var_ExtTarget={{type=20,n=1,target="将英雄神箭交给@npc_105103"}}
x256104_var_QuestName="【剧场】英雄神箭"
x256104_var_QuestInfo="\t当机遇来到你面前的时候，你能否紧紧抓住？其实人生真正重要的决策只有那么几步，如果能在这几步抓住时机，必可走出一条辉煌的人生之路。"  
x256104_var_QuestTarget=""		
x256104_var_QuestCompleted="\t历史从不曾化为尘埃，它会一直烙印在人们的心中。"					
x256104_var_ContinueInfo="\t传说铁木真的祖先，为了重返祖先故土，杀了七十头野牛，制成七十个风匣，又祭了苍天，方才点燃烟火，终于将阻碍归途的大山化出一个山口来，这就是蒙古‘化铁出山’的传说。"
x256104_var_QuestHelp =	""
x256104_var_ExpBonus = 450000
x256104_var_BonusMoney1 =460
x256104_var_BonusMoney2 =0
x256104_var_BonusMoney3 =0
x256104_var_BonusMoney4 =0
x256104_var_BonusMoney5 =2000
x256104_var_BonusMoney6 =0
x256104_var_BonusItem	=	{{item = 11000200,n=5}}
x256104_var_BonusChoiceItem ={}
x256104_var_NpcGUID ={{ guid = 105103, varName = "钥匙老人"}}
--DECLARE_QUEST_INFO_STOP--


function x256104_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x256104_var_QuestId) > 0 then
		return 
	end
				if IsHaveQuest(varMap,varPlayer, x256104_var_QuestId) > 0 then
		return 
	end	
	if GetLevel(varMap, varPlayer) >= x256104_var_LevelLess then
		if IsQuestHaveDone(varMap, varPlayer, x256104_var_QuestIdPre)> 0 then
		  if IsHaveQuest(varMap,varPlayer, x256104_var_QuestId) <= 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256104_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256104_var_QuestId, varState, -1 )
				end
		end
	end
	
end

function x256104_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256104_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256104_var_ExpBonus )
		end
		if x256104_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256104_var_BonusMoney1 )
		end
		if x256104_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256104_var_BonusMoney2 )
		end
		if x256104_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256104_var_BonusMoney3 )
		end
		if x256104_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256104_var_BonusMoney4 )
		end
		if x256104_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256104_var_BonusMoney5 )
		end
		if x256104_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256104_var_BonusMoney6 )
		end
		for varI, item in x256104_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256104_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256104_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256104_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256104_var_QuestId) > 0 then
			if x256104_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256104_var_QuestName)
						TalkAppendString(varMap,x256104_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256104_var_FileId, x256104_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256104_var_QuestName)
						TalkAppendString(varMap,x256104_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256104_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256104_var_FileId, x256104_var_QuestId);
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   end
  elseif x256104_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256104_var_QuestName)
			TalkAppendString(varMap,x256104_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256104_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256104_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256104_var_QuestHelp )
			end
			x256104_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256104_var_FileId, x256104_var_QuestId);
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x256104_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x256104_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x256104_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256104_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256104_var_QuestId  )
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
		
		
		if x256104_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256104_var_QuestId, x256104_var_FileId, 1, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256104_Msg2toplayer( varMap, varPlayer,0)		  			
		  			
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256104_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x256104_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256104_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256104_var_QuestId)
	  x256104_Msg2toplayer( varMap, varPlayer,1)
end

function x256104_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256104_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x256104_var_BonusChoiceItem do
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

function x256104_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
  local selfcountry =GetCurCountry( varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x256104_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256104_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256104_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256104_var_QuestId) > 0 then
				x256104_Msg2toplayer( varMap, varPlayer,2)
				if DelItem( varMap,varPlayer,13020015, 1 ) ~= 1 then return 0 end
				QuestCom(varMap, varPlayer, x256104_var_QuestId)
				x256104_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256104_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256104_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
				end
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   
end

function x256104_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256104_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256104_var_ExpBonus);
  	end
		if x256104_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256104_var_BonusMoney1 )
	  end
		if x256104_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256104_var_BonusMoney2 )
	  end
		if x256104_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256104_var_BonusMoney3 )
		end
		if x256104_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256104_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256104_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256104_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256104_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256104_var_BonusMoney6)
		end
end

function x256104_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256104_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256104_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256104_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256104_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256104_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256104_var_QuestName.."！", 0, 3)
				if x256104_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256104_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256104_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256104_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256104_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256104_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256104_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256104_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256104_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256104_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256104_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256104_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256104_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256104_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256104_CheckSubmit( varMap, varPlayer, varTalknpc)
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256104_var_QuestId)  
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1

end

function x256104_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256104_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256104_ProcTimer(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcTimer",varMap, varPlayer, varScript, varQuest )
		
end

function x256104_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256104_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256104_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256104_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256104_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256104_var_QuestId, varState, -1 )
		end
end

function x256104_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256104_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256104_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256104_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256104_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256104_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
