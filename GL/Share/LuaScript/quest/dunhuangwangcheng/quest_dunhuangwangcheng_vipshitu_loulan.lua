

--DECLARE_QUEST_INFO_START--
x256280_var_FileId = 256280
x256280_var_QuestIdPre =-1
x256280_var_QuestId = 2620
x256280_var_LevelLess	= 	41 
x256280_var_LevelMax	= 	160 
x256280_var_QuestIdNext = -1
x256280_var_Name	={}
x256280_var_MasterDistance = 15
x256280_var_ExtTarget={{type=20,n=1,target="在金币商店贵宾区一星麒麟商店购买一个#G师恩难谢#W，和师傅组队将其交给师徒管理员"}}
x256280_var_QuestName="【个人】师徒之情"
x256280_var_QuestInfo="\t如果你还没有师傅，你可以在我这里寻找一位。\n\t当你找到师傅之后，我建议，在金币商店贵宾区一星麒麟商店购买一个#G师恩难谢#W，然后和你的师傅组队一起来我这里，我会好好的奖励你们。"  
x256280_var_QuestTarget=""		
x256280_var_QuestCompleted="\t很好，看来你们师徒二人相处的不错，这是我给你们的一些小小的奖励。"					
x256280_var_ContinueInfo="\t在金币商店贵宾区一星麒麟商店购买一个#G师恩难谢#W，和师傅组队将其交给师徒管理员。"
x256280_var_QuestHelp =	""
x256280_var_DemandItem =	{12030211}						
x256280_var_BonusMoney1 =0
x256280_var_BonusMoney2 =0
x256280_var_BonusMoney3 =0
x256280_var_BonusMoney4 =0
x256280_var_BonusMoney5 =0
x256280_var_BonusMoney6 =0
x256280_var_BonusItem	=	{}
x256280_var_BonusChoiceItem ={}
x256280_var_ExpBonus = 1660000
x256280_var_GoodBadValue =35000
x256280_var_NpcGUID ={{ guid = 123726, varName = "巴耶赛特"} }
--DECLARE_QUEST_INFO_STOP--

x256280_var_BonusMoney8 =0
x256280_var_GuildExpBonus =0


function x256280_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local varLevel = GetLevel(varMap, varPlayer) 
	if varLevel < x256280_var_LevelLess  then	
		return
	end



	if IsQuestHaveDone(varMap, varPlayer, x256280_var_QuestId) > 0 then 
		return 
	end
	
	
	if IsHaveQuest(varMap,varPlayer, x256280_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256280_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256280_var_QuestId, varState, -1 )
	
	end

end

function x256280_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256280_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256280_var_ExpBonus )
		end
		if x256280_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256280_var_BonusMoney1 )
		end
		if x256280_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256280_var_BonusMoney2 )
		end
		if x256280_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256280_var_BonusMoney3 )
		end
		if x256280_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256280_var_BonusMoney4 )
		end
		if x256280_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256280_var_BonusMoney5 )
		end
		if x256280_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256280_var_BonusMoney6 )
		end
		for varI, item in x256280_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256280_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256280_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256280_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256280_var_QuestId) > 0 then
			if x256280_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256280_var_QuestName)
				TalkAppendString(varMap,x256280_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256280_var_FileId, x256280_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256280_var_QuestName)
				TalkAppendString(varMap,x256280_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256280_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256280_var_FileId, x256280_var_QuestId);
			end
  elseif x256280_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256280_var_QuestName)
			TalkAppendString(varMap,x256280_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256280_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256280_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256280_var_QuestHelp )
			end
			x256280_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256280_var_FileId, x256280_var_QuestId);
  end
	
end


function x256280_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256280_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x256280_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x256280_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
	
end


function x256280_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256280_var_QuestId) > 0 then
				return 
		end
		
		
		
		
		
		
		
		
		
		
		
		
	
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
















		
		if x256280_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then

					local retmiss = AddQuest( varMap, varPlayer, x256280_var_QuestId, x256280_var_FileId, 0, 0, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256280_Msg2toplayer( varMap, varPlayer,0)
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,1 )
						
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,1 )
		  			
					for varI, item in x256280_var_DemandItem do
						
						if GetItemCount(varMap,varPlayer,item) >= 1 then	
						
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256280_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,0 )
							
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,0 )
						end
					end
					
					end
		  			
	 	end                                                                    
	     
end


function x256280_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256280_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256280_var_QuestId)
	  x256280_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,0 )
		
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,0 )	
end

function x256280_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256280_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256280_var_BonusChoiceItem do
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


function x256280_IsCanSubmit( varMap, varPlayer )
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if (varTeamSize < 2) then
		return "你的队伍中不足2人，无法提交本任务。";
	end
	
	local isMasterHere = 0
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x256280_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
				isMasterHere = 1
			end
		end
	end
	
	if 0 == isMasterHere then
		return "你的师傅不在队伍中或者不在附近，无法提交本任务。";
	end
	return 1
end


function x256280_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)


  		local varTeamSize = GetTeamSize(varMap, varPlayer)
		if (varTeamSize < 2) then
			Msg2Player(varMap, varPlayer, "你要和你的师傅组队一起来完成本任务。", 0, 3)
			return 
		end
		local isMasterHere = 0
			for varI = 0, varTeamSize - 1 do
			local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
			if 1 == IsInDist(varMap, varPlayer, varTalknpc, x256280_var_MasterDistance) then
				if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
					isMasterHere = 1
				end
			end
		end
	
		if 0 == isMasterHere then
			Msg2Player(varMap, varPlayer, "你的师傅不在队伍中或者不在附近，无法完成本任务。", 0, 3)
			return
		end
	if IsHaveQuest(varMap,varPlayer, x256280_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256280_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256280_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256280_var_QuestId) > 0 then
				x256280_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256280_var_QuestId)
				if DelItem(varMap, varPlayer,12030211,1) ~= 1 then return 0 end
				x256280_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256280_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256280_var_BonusChoiceItem do
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
		    						
									if IsMaster(varMap, varPlayer, varObj) ==  1 then
										local value = GetPlayerGoodBadValue(varMap, varObj)
										value = value + x256280_var_GoodBadValue
										SetPlayerGoodBadValue(varMap, varObj, value)
										Msg2Player(varMap,  varObj, "你获得了威望：#R35000点。", 0, 3)
										Msg2Player(varMap,  varObj, "你获得了威望：#R35000点。", 0, 2)
									end
		    			end
	    				
	    			end
    			end
    		
   
  end
   
end

function x256280_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256280_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256280_var_ExpBonus);
  	end
		if x256280_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256280_var_BonusMoney1 )
	  end
		if x256280_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256280_var_BonusMoney2 )
	  end
		if x256280_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256280_var_BonusMoney3 )
		end
		if x256280_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256280_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256280_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256280_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256280_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256280_var_BonusMoney6)
		end
		
		if x256280_var_BonusMoney8 > 0 then
		AddGuildUserPoint(varMap,varPlayer,x256280_var_BonusMoney8)	
		local BonusMoney8 = x256280_var_BonusMoney8
		local pointText = "获得#R帮贡"..BonusMoney8.."点#o的奖励"
		StartTalkTask(varMap)
		TalkAppendString(varMap, pointText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
  		Msg2Player(varMap,varPlayer,pointText,8,2)
		end

	local bangExp = x256280_var_GuildExpBonus 
	if bangExp > 0 then
		AddGuildExp(varMap,varPlayer,bangExp)
		StartTalkTask(varMap)
		TalkAppendString(varMap, "获得#R帮会经验"..bangExp.."点#o的奖励");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
  		Msg2Player(varMap,varPlayer,"获得#R帮会经验"..bangExp.."点#o的奖励",8,2)
	end
end

function x256280_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256280_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256280_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256280_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256280_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256280_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256280_var_QuestName.."！", 0, 3)
				if x256280_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256280_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256280_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256280_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256280_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256280_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256280_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256280_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256280_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256280_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256280_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256280_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256280_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256280_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256280_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256280_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256280_ProcTimer(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcTimer",varMap, varPlayer, varScript, varQuest )
		
end

function x256280_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256280_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest,optype)
	if	optype	==	0	then
		return
	end
	
	for varI, item in x256280_var_DemandItem do
	
		if varItemData == item then

			if GetItemCount(varMap,varPlayer,item) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256280_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,0 )
						
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,0 )
		  	else
		  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256280_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		  	end
		  	
		  	break
	  	
	  	end
	  	
	end

end


function x256280_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256280_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256280_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256280_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256280_var_QuestId, varState, -1 )
		end
end

function x256280_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256280_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256280_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256280_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256280_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256280_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
