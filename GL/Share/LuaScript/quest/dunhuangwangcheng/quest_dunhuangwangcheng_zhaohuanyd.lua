

--DECLARE_QUEST_INFO_START--
x256233_var_FileId = 256233

x256233_var_QuestId = 3125
x256233_var_LevelLess	= 	30

x256233_var_DemandKill ={{varId=2533,varNum=1}}
x256233_var_Name	={"boss"}
x256233_var_ExtTarget={{type=20,n=1,target="前往#G轮回台#W使用“#G巨兽魂石#W”召唤并消灭其中隐藏的巨兽"}}
x256233_var_QuestName="【副本】轮回台的巨兽"
x256233_var_QuestInfo="\t你可曾听说过轮回台中隐藏巨兽的传说？\n\t听说只要拥有那巨兽魂石，就可以在轮回台内召唤出这可怕的怪兽。"  
x256233_var_QuestTarget=""		
x256233_var_QuestCompleted="\t你们真不简单！这是你们应得的奖励！"
x256233_var_ContinueInfo="“还没发现那可怕的巨兽吗？你可以在金币商店贵宾区一星麒麟商店购买#G巨兽魂石”#W来召唤它。"
x256233_var_QuestHelp =	"#G“巨兽魂石”#W可以在金币商店贵宾区一星麒麟商店购买，但需要您的转点达到一定的金额，才能获得其中购买相应物品的权力。"
x256233_var_DemandItem ={}
x256233_var_BonusMoney1 =0
x256233_var_BonusMoney2 =0
x256233_var_BonusMoney3 =0
x256233_var_BonusMoney4 =0
x256233_var_BonusMoney5 =0
x256233_var_BonusMoney6 =0
x256233_var_BonusItem	={}
x256233_var_BonusChoiceItem ={}
x256233_var_ExpBonus = 450000

x256233_var_NpcGUID ={{ guid = 150525, varName = "轮回台出口"} }
x256233_var_Buf1 = 2092
x256233_var_npcid = 0
--DECLARE_QUEST_INFO_STOP--
x256233_var_ExpBonus1 = 100000


function x256233_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    
    
	if IsQuestHaveDone(varMap, varPlayer, x256233_var_QuestId) > 0 then
		return 
	end
	
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256233_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256233_var_QuestId, varState, -1 )
	
end

function x256233_DispatchQuestInfo( varMap, varPlayer, varTalknpc )

		if x256233_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256233_var_ExpBonus )
		end
		if x256233_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256233_var_BonusMoney1 )
		end
		if x256233_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256233_var_BonusMoney2 )
		end
		if x256233_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256233_var_BonusMoney3 )
		end
		if x256233_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256233_var_BonusMoney4 )
		end
		if x256233_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256233_var_BonusMoney5 )
		end
		if x256233_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256233_var_BonusMoney6 )
		end
		for varI, item in x256233_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x256233_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end





function x256233_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
    x256233_var_npcid =   varTalknpc
	if IsQuestHaveDone(varMap, varPlayer, x256233_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256233_var_QuestId) > 0 then
			if x256233_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256233_var_QuestName)
						TalkAppendString(varMap,x256233_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256233_var_FileId, x256233_var_QuestId);
			else
          
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256233_var_QuestName)
						TalkAppendString(varMap,x256233_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256233_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256233_var_FileId, x256233_var_QuestId);
			end
  elseif x256233_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256233_var_QuestName)
			TalkAppendString(varMap,x256233_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256233_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256233_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256233_var_QuestHelp )
			end
			x256233_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256233_var_FileId, x256233_var_QuestId);
  end
end

function x256233_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x256233_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x256233_var_LevelLess then
		return 0
	end
	return 1
end

function x256233_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256233_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x256233_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1
	end
	return 0
end

function x256233_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256233_var_QuestId) > 0 then
				return 
		end
		
		
















		
		if x256233_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256233_var_QuestId, x256233_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			
           
						x256233_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256233_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	    			
		  		end
	 	end                                                                    
	     
end

function x256233_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256233_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256233_var_QuestId)
		
	  x256233_Msg2toplayer( varMap, varPlayer,1)
end

function x256233_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256233_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x256233_var_BonusChoiceItem do
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

function x256233_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x256233_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256233_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256233_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256233_var_QuestId) > 0 then
				x256233_Msg2toplayer( varMap, varPlayer,2)
				
				QuestCom(varMap, varPlayer, x256233_var_QuestId)
                x256233_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256233_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256233_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		    end
    		    StopItemTask(varMap,varPlayer)
    		    local varCount = GetNearTeamCount(varMap, varPlayer)
    			if varCount > 0 then
	    			for varI = 0,varCount - 1 do
	    				
	    				local varObj = GetNearTeamMember(varMap, varPlayer, varI)
		    			if IsPlayerStateNormal(varMap,varObj ) == 1 and varObj ~= varPlayer then 
		    				AddExp(varMap, varObj, x256233_var_ExpBonus1);
		    			end
	    				
	    			end
    			end
				
   end
end

function x256233_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   	  local bFind  = 0
    for varI ,item in x256233_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256233_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256233_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256233_var_QuestId, varState, -1 )
		end
end

function x256233_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256233_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256233_var_ExpBonus);
  	end
		if x256233_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256233_var_BonusMoney1 )
	  end
		if x256233_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256233_var_BonusMoney2 )
	  end
		if x256233_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256233_var_BonusMoney3 )
		end
		if x256233_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256233_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256233_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256233_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256233_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256233_var_BonusMoney6)
		end
end

function x256233_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256233_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256233_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256233_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256233_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务："..x256233_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务："..x256233_var_QuestName.."！", 0, 3)
				if x256233_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256233_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256233_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256233_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256233_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256233_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256233_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256233_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256233_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256233_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256233_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256233_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256233_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256233_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x256233_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==x256233_var_DemandKill[1].varId then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x256233_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x256233_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 1 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("消灭轮回台的隐藏巨兽   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x256233_CheckSubmit( varMap, humanObjId)
										end
                end
            end
		end
	end
end


function x256233_ProcUseItem( varMap, varPlayer, varBagIdx, varImpact )
	local varMapType = GetSceneType(varMap) ;
	if varMapType == 1 then 	
	
		local fubentype = GetFubenData_Param(varMap,0) ;		
		local fubenscript = GetFubenData_Param(varMap,1) ; 	
		local varLevel =GetLevel(varMap, varPlayer)
		if IsQuestHaveDone(varMap, varPlayer, x256233_var_QuestId) > 0 then
				Msg2Player(varMap, varPlayer, "你已经完成过本任务了。", 0, 3)
				return 
		end
		if IsHaveQuest(varMap,varPlayer, x256233_var_QuestId) > 0 then
				Msg2Player(varMap, varPlayer, "你已经接受了这个任务", 0, 3)
				return
		end
		if 	fubentype==FUBEN_FUTUTA4  then      	
			if varLevel	>=	x256233_var_LevelLess	 then
				
			   		AddQuest( varMap, varPlayer, x256233_var_QuestId, x256233_var_FileId, 1, 0, 0,1)
			   		Msg2Player(varMap, varPlayer, "你接受了任务：【副本】轮回台的巨兽", 0, 3)
     		   		CreateMonster(varMap, 2533,62,58,5,1,-1,-1,21,1200000)
     		   		if DelItem( varMap,varPlayer,12030033,1 )	 ~= 1 then return 0 end
     		
     		else
    		   Msg2Player(varMap, varPlayer, "你的等级不足", 0, 3)	
    		end
    	end
    else 
    		Msg2Player(varMap, varPlayer, "只有在轮回台副本内才能召唤巨兽", 0, 3)	
    	
	end
end

function x256233_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256233_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256233_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256233_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256233_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256233_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256233_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256233_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256233_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256233_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





