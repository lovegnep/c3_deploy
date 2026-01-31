

--DECLARE_QUEST_INFO_START--
x203315_var_FileId = 203315
x203315_var_QuestIdPre ={721,722}
x203315_var_QuestId = 723
x203315_var_LevelLess	= 	80 
x203315_var_QuestIdNext = 724
x203315_var_Name	={}
x203315_var_noDemandItem ={{varId=13060029,varNum=1}}
x203315_var_ExtTarget={{type=20,n=1,target="到@npc_115038放出穿云箭"}}
x203315_var_QuestName="【剧情】决战巴格达城外<五>"
x203315_var_QuestInfo="\t巴格达现在已经被水完全围困，扎兰丁的左右翼大军也都已经被我们消灭，是发动总攻的时候了！\n\t在空地上点燃这个，他们看到信号就会到这里汇合。"  
x203315_var_QuestTarget=""		
x203315_var_QuestCompleted="\t哈哈，此一战扎兰丁已是穷途末路，看他还能逃到哪里去！ "					
x203315_var_ContinueInfo="\t你手里拿着烟花做什么呢？"
x203315_var_QuestHelp =	"#G您可以点击键盘上的#RB#G键，打开背包。然后右键点击#R穿云箭#G进行使用。"
x203315_var_DemandItem ={}
x203315_var_BonusMoney1 =800
x203315_var_BonusMoney2 =0
x203315_var_BonusMoney3 =0
x203315_var_BonusMoney4 =0
x203315_var_BonusMoney5 =91
x203315_var_BonusMoney6 =0
x203315_var_BonusItem	=	{}
x203315_var_BonusChoiceItem ={}
x203315_var_ExpBonus = 528000
x203315_var_NpcGUID ={{ guid = 115009, varName = "旭烈兀"} }
--DECLARE_QUEST_INFO_STOP--
x203315_var_doing = 0
x203315_var_guobaoyu =-1
x203315_var_badu =-1
x203315_var_xuliewu=-1
x203315_var_zhalanding =-1
x203315_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203315_var_Buf1   = 7520


function x203315_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203315_var_QuestId) > 0 then
		return 
	end
  if IsQuestHaveDone(varMap, varPlayer, x203315_var_QuestIdPre[1])> 0 then   
	  if IsQuestHaveDone(varMap, varPlayer, x203315_var_QuestIdPre[2])> 0 then 
						if IsHaveQuest(varMap,varPlayer, x203315_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203315_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203315_var_QuestId, varState, -1 )
						end
		end
	end
end

function x203315_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203315_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203315_var_ExpBonus )
		end
		if x203315_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203315_var_BonusMoney1 )
		end
		if x203315_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203315_var_BonusMoney2 )
		end
		if x203315_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203315_var_BonusMoney3 )
		end
		if x203315_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203315_var_BonusMoney4 )
		end
		if x203315_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203315_var_BonusMoney5 )
		end
		if x203315_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203315_var_BonusMoney6 )
		end
		for varI, item in x203315_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203315_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203315_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203315_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203315_var_QuestId) > 0 then
			if x203315_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203315_var_QuestName)
						TalkAppendString(varMap,x203315_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203315_var_FileId, x203315_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203315_var_QuestName)
						TalkAppendString(varMap,x203315_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203315_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203315_var_FileId, x203315_var_QuestId);
			end
  elseif x203315_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203315_var_QuestName)
			TalkAppendString(varMap,x203315_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203315_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203315_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203315_var_QuestHelp )
			end
			x203315_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203315_var_FileId, x203315_var_QuestId);
  end
	
end


function x203315_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203315_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203315_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
			return 1
	end
	return 0
end

function x203315_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203315_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203315_var_QuestId  )
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
		
		if x203315_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		  StartItemTask(varMap)                                                    
			ItemAppend( varMap,x203315_var_noDemandItem[1].varId, x203315_var_noDemandItem[1].varNum )             
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x203315_var_QuestId, x203315_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203315_Msg2toplayer( varMap, varPlayer,0)
						DeliverItemListSendToPlayer(varMap,varPlayer) 
		  		end
	  		else                                                             
		  		StartTalkTask(varMap)                                      
		  		TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  		StopTalkTask(varMap)                                        
		  		DeliverTalkTips(varMap,varPlayer)                      
	   		end           	        
	 	end                                                                    
	     
end


function x203315_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203315_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203315_var_QuestId)
	  x203315_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x203315_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x203315_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203315_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203315_var_BonusChoiceItem do
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

function x203315_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203315_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203315_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203315_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203315_var_QuestId) > 0 then
				x203315_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203315_var_QuestId)
				x203315_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203315_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203315_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203315_var_QuestIdNext )	
end

function x203315_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203315_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203315_var_ExpBonus);
  	end
		if x203315_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203315_var_BonusMoney1 )
	  end
		if x203315_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203315_var_BonusMoney2 )
	  end
		if x203315_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203315_var_BonusMoney3 )
		end
		if x203315_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203315_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203315_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203315_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203315_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203315_var_BonusMoney6)
		end
end

function x203315_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203315_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203315_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203315_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203315_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203315_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203315_var_QuestName.."！", 0, 3)
				if x203315_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203315_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203315_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203315_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203315_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203315_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203315_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203315_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203315_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203315_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203315_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203315_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203315_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203315_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203315_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203315_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203315_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
end

function x203315_ProcMapTimerTick(ssceneId, varPlayer, varScript, varQuest)
	
end

function x203315_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203315_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,0)
end

function x203315_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203315_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203315_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203315_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203315_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203315_var_QuestId, varState, -1 )
		end
end

function x203315_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203315_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203315_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203315_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203315_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203315_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203315_ProcScneneTimer(varMap, varPlayer)
	if x203315_var_doing==1   then
		if GetCurrentTime() - x203315_var_PROTECTINFO.StartTime >= 8   then
			if IsObjValid (varMap,x203315_var_guobaoyu) == 1 then
				NpcTalk(varMap, x203315_var_guobaoyu, "扎兰丁，今天就是你的末日！放下手中的武器，我们的成吉思汗以宽厚为本会宽恕你的罪恶。", -1)
			end
			
			
			
        x203315_var_doing = 2
		end
	elseif x203315_var_doing == 2   then
			if GetCurrentTime() - x203315_var_PROTECTINFO.StartTime >= 13   then
				if IsObjValid (varMap,x203315_var_badu) == 1 then
						NpcTalk(varMap, x203315_var_badu, "终于等到了这一天，我要为死去的勇士们报仇！", -1)
				end
				
				
				
        x203315_var_doing =3
			end
	elseif x203315_var_doing == 3   then
			if GetCurrentTime() - x203315_var_PROTECTINFO.StartTime >= 18   then
				if IsObjValid (varMap,x203315_var_zhalanding) == 1 then
						NpcTalk(varMap, x203315_var_zhalanding, "旭烈兀，不要太得意，总有一天，我要和你决一死战！", -1)
				end
						x203315_var_doing =4
			end
	
	elseif x203315_var_doing == 4   then
			if GetCurrentTime() - x203315_var_PROTECTINFO.StartTime >= 22   then
              
              NpcTalk(varMap, x203315_var_guobaoyu ,"消灭扎兰丁！", -1)
          if IsObjValid (varMap,x203315_var_xuliewu) == 1 then
						NpcTalk(varMap, x203315_var_xuliewu, "出发！", -1)
					end
					
					
					
					
        	
        	
        	
        	
        	
						x203315_var_doing =5
			end
	elseif x203315_var_doing == 5   then
			if GetCurrentTime() - x203315_var_PROTECTINFO.StartTime >= 25   then
						x203315_var_doing =6
						x203315_CloseTimer(varMap, x203315_var_PROTECTINFO.ScneneTimerIndex)
			end

	end
end

function x203315_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203315_var_doing = 0
	x203315_var_guobaoyu =-1
	x203315_var_badu =-1
	x203315_var_xuliewu=-1
	x203315_var_zhalanding =-1
	x203315_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
end

function x203315_useitem(varMap,varPlayer)
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203315_var_QuestId)
  		if (GetQuestParam(varMap,varPlayer,varQuestIdx,1)==1) then
         SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x203315_var_Buf1, 0);
  		    SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		 			if x203315_var_doing==0 then
		 					StartTalkTask(varMap)
							TalkAppendString(varMap,"穿云箭 1/1")
							DeliverTalkTips(varMap,varPlayer) 
							StopTalkTask(varMap)
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				 			x203315_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203315, "ProcScneneTimer", 1)
				 			if x203315_var_PROTECTINFO.ScneneTimerIndex >= 0 then
									x203315_var_guobaoyu=CreateMonster(varMap, 910,56,57,3,1,-1,-1,20,25000,210,"郭宝玉")
        					x203315_var_badu=CreateMonster(varMap, 911,59,51,3,1,-1,-1,20,25000,240,"拔都")
        					x203315_var_zhalanding=CreateMonster(varMap, 866,53,50,3,1,-1,-1,21,25000,40,"扎兰丁")
        					
        							
        					
        					x203315_var_doing =1
									x203315_var_PROTECTINFO.StartTime = GetCurrentTime()
									if DelItem(varMap, varPlayer, 13060029, 1) ~= 1 then return 0 end
							end
					else
							StartTalkTask(varMap)
							TalkAppendString(varMap,"点燃穿云箭 1/1")
							DeliverTalkTips(varMap,varPlayer) 
							StopTalkTask(varMap)
							if DelItem(varMap, varPlayer, 13060029, 1) ~= 1 then return 0 end
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
     			  	return 1
			end
			if (GetQuestParam(varMap,varPlayer,varQuestIdx,1)==0) then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"请先到空地处再使用")
				DeliverTalkTips(varMap,varPlayer) 
				StopTalkTask(varMap)
			end
           
			return 0

end
