

--DECLARE_QUEST_INFO_START--
x203304_var_FileId = 203304
x203304_var_QuestIdPre =476
x203304_var_QuestId = 477
x203304_var_LevelLess	= 	45 
x203304_var_QuestIdNext = 480
x203304_var_DemandKill ={{varId=834,varNum=1}}
x203304_var_Name	={"回鹘公主"}
x203304_var_ExtTarget={{type=20,n=1,target="击败@npc_22015"}}
x203304_var_QuestName="【剧场】回鹘公主的考验<二>"
x203304_var_QuestInfo="\t方才大家都看到我们的御卫队长轻易就败下阵来，可是我们回鹘国的第一勇士--璖参玱ぃ狝盢瓁眤翴碭┷"  
x203304_var_QuestTarget=""		
x203304_var_QuestCompleted="\t看来我的这些手下，均非将军的敌手啊。成吉思汗有将军您这样的天人相助，怎能不成就一番大事？！"
x203304_var_ContinueInfo="\t将军坚持住，只要将军再胜一场，我的侍从们必定从此对大汗和将军佩服的五体投地！"
x203304_var_QuestHelp =	"#G如果您过久没有击败范统，范统会自行消失，您可以放弃并重新接取本任务。"
x203304_var_DemandItem ={}
x203304_var_ExpBonus = 214000
x203304_var_BonusMoney1 =376
x203304_var_BonusMoney2 =0
x203304_var_BonusMoney3 =0
x203304_var_BonusMoney4 =0
x203304_var_BonusMoney5 =71
x203304_var_BonusMoney6 =0
x203304_var_BonusItem	={}
x203304_var_BonusChoiceItem ={}
x203304_var_NpcGUID = 103001
x203304_var_Buf1 = 2092
x203304_var_npcid = 0
--DECLARE_QUEST_INFO_STOP--


function x203304_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    
	if IsQuestHaveDone(varMap, varPlayer, x203304_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203304_var_QuestIdPre)> 0 then 
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203304_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203304_var_QuestId, varState, -1 )
	end
end

function x203304_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203304_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203304_var_ExpBonus )
		end
		if x203304_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203304_var_BonusMoney1 )
		end
		if x203304_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203304_var_BonusMoney2 )
		end
		if x203304_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203304_var_BonusMoney3 )
		end
		if x203304_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203304_var_BonusMoney4 )
		end
		if x203304_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203304_var_BonusMoney5 )
		end
		if x203304_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203304_var_BonusMoney6 )
		end
		for varI, item in x203304_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203304_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end





function x203304_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
    x203304_var_npcid =   varTalknpc
	if IsQuestHaveDone(varMap, varPlayer, x203304_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203304_var_QuestId) > 0 then
			if x203304_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203304_var_QuestName)
						TalkAppendString(varMap,x203304_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203304_var_FileId, x203304_var_QuestId);
			else
          
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203304_var_QuestName)
						TalkAppendString(varMap,x203304_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203304_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203304_var_FileId, x203304_var_QuestId);
			end
  elseif x203304_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203304_var_QuestName)
			TalkAppendString(varMap,x203304_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203304_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203304_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203304_var_QuestHelp )
			end
			x203304_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203304_var_FileId, x203304_var_QuestId);
  end
end

function x203304_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203304_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x203304_var_LevelLess then
		return 0
	end
	return 1
end

function x203304_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203304_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203304_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1
	end
	return 0
end

function x203304_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203304_var_QuestId) > 0 then
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203304_var_QuestId  )
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
		
		if x203304_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203304_var_QuestId, x203304_var_FileId, 1, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			
            CreateMonster(varMap, 834,211,223,5,1,-1,-1,21,120000)
						x203304_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203304_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	    			
		  		end
	 	end                                                                    
	     
end

function x203304_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203304_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203304_var_QuestId)
	  x203304_Msg2toplayer( varMap, varPlayer,1)
end

function x203304_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203304_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203304_var_BonusChoiceItem do
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

function x203304_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x203304_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203304_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203304_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203304_var_QuestId) > 0 then
				x203304_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203304_var_QuestId)
                x203304_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203304_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203304_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		    end
    		    StopItemTask(varMap,varPlayer)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203304_var_QuestIdNext )	
   end
end

function x203304_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
end

function x203304_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203304_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203304_var_ExpBonus);
  	end
		if x203304_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203304_var_BonusMoney1 )
	  end
		if x203304_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203304_var_BonusMoney2 )
	  end
		if x203304_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203304_var_BonusMoney3 )
		end
		if x203304_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203304_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203304_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203304_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203304_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203304_var_BonusMoney6)
		end
end

function x203304_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203304_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203304_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203304_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203304_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203304_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203304_var_QuestName.."！", 0, 3)
				if x203304_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203304_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203304_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203304_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203304_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203304_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203304_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203304_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203304_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203304_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203304_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203304_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203304_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203304_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x203304_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==x203304_var_DemandKill[1].varId then
			local varQuest = x203304_var_QuestId
			local guid = GetMonsterGUID(varMap, varPlayer)
			local varX,z = GetWorldPos(varMap,varPlayer)
			local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
			for varI = 0, Num-1 do
				local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
				if humanObjId >= 0 then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						if IsHaveQuestNM(varMap, humanObjId, x203304_var_QuestId) == 1 then
	    	        local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest)
		            SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, 1)
				        SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1)
				        Msg2Player( varMap, humanObjId, format("击败回鹘第一勇士   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 8, 3)
				        Msg2Player( varMap, humanObjId, format("击败回鹘第一勇士   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 8, 2)
				 		end
			    end
				end
			end
	end 
end

function x203304_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203304_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203304_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203304_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203304_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203304_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203304_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203304_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203304_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203304_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





