

--DECLARE_QUEST_INFO_START--
x203313_var_FileId = 203313
x203313_var_QuestIdPre =676
x203313_var_QuestId = 671
x203313_var_LevelLess	= 	75
x203313_var_QuestIdNext = -1
x203313_var_Name	={}
x203313_var_ExtTarget={{type=20,n=1,target="找到@npc_114033，保护两位公主一起逃出红沙漠"}}
x203313_var_QuestName="【剧情】逃出生天"
x203313_var_QuestInfo="\t趁他们的主力还没有到，快赶到东边的山脚下，那里有一条小路，马匹可以顺利通过，忽必烈和贵由正在那里等着我们。"  
x203313_var_QuestTarget=""		
x203313_var_QuestCompleted="\t太好了，这里一切都已经准备好了，公主正在车上等待你们。趁他们还没有追上来，快保护两位公主从小路走！"					
x203313_var_ContinueInfo=	""
x203313_var_QuestHelp =	""
x203313_var_DemandItem ={}
x203313_var_BonusMoney1 =750
x203313_var_BonusMoney2 =0
x203313_var_BonusMoney3 =0
x203313_var_BonusMoney4 =0
x203313_var_BonusMoney5 =86
x203313_var_BonusMoney6 =0
x203313_var_BonusItem	=	{}
x203313_var_BonusChoiceItem ={}
x203313_var_ExpBonus = 440000
x203313_var_NpcGUID ={{ guid = 114033, varName = "贵由"}}

--DECLARE_QUEST_INFO_STOP--
x203313_var_doing = 0
x203313_var_mohemo = -1
x203313_var_zhalanding = -1
x203313_var_quchulv = -1
x203313_var_shibing1 = -1
x203313_var_shibing2 = -1
x203313_var_hedan = -1
x203313_var_xuliewu = -1
x203313_var_alibuge = -1
x203313_var_baierda = -1
x203313_var_mengguyongshi1 = -1
x203313_var_mengguyongshi2 = -1
x203313_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}






function x203313_PlayeffectToNearPlayer(varMap,varTalknpc,nEffect)

	if IsObjValid(varMap,varTalknpc) ~= 1 then
		return
	end
	
	local varHumanCount = GetScenePlayerCount( varMap )
	for varI=0,varHumanCount do

		local varObj = GetScenePlayerObjId(varMap,varI)
		if IsPlayerStateNormal(varMap,varObj) == 1 then
			
			if GetDist(varMap,varObj,varTalknpc,25 ) <= 25 then
				LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,varObj,nEffect)
			end
		end
	end

end

function x203313_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel( varMap, varPlayer) < x203313_var_LevelLess then
		return
   end

	if IsQuestHaveDone(varMap, varPlayer, x203313_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203313_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203313_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203313_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203313_var_QuestId, varState, -1 )
						end
			
	end
end

function x203313_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203313_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203313_var_ExpBonus )
		end
		if x203313_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203313_var_BonusMoney1 )
		end
		if x203313_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203313_var_BonusMoney2 )
		end
		if x203313_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203313_var_BonusMoney3 )
		end
		if x203313_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203313_var_BonusMoney4 )
		end
		if x203313_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203313_var_BonusMoney5 )
		end
		if x203313_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203313_var_BonusMoney6 )
		end
		for varI, item in x203313_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203313_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203313_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203313_var_QuestId) > 0 then
		return 
	end
	if GetLevel( varMap, varPlayer) < x203313_var_LevelLess then
		return
   end
	if IsHaveQuest(varMap,varPlayer, x203313_var_QuestId) > 0 then
			if x203313_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203313_var_QuestName)
						TalkAppendString(varMap,x203313_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203313_var_FileId, x203313_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203313_var_QuestName)
						TalkAppendString(varMap,x203313_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203313_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203313_var_FileId, x203313_var_QuestId);
			end
  elseif x203313_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203313_var_QuestName)
			TalkAppendString(varMap,x203313_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203313_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203313_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203313_var_QuestHelp )
			end
			x203313_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203313_var_FileId, x203313_var_QuestId);
  end
	
end


function x203313_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		
						return 1
		

end

function x203313_CheckSubmit( varMap, varPlayer, varTalknpc)


	        return 1
	
end

function x203313_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203313_var_QuestId) > 0 then
				return 
		end
			if GetLevel( varMap, varPlayer) < x203313_var_LevelLess then
		return
   end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203313_var_QuestId  )
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
	
		if x203313_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203313_var_QuestId, x203313_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
				
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203313_Msg2toplayer( varMap, varPlayer,0)
		  			StartItemTask(varMap)
							for varI, item in x203313_var_DemandItem do
 								ItemAppend( varMap, item.item, item.varNum )
							end
    				StopItemTask(varMap,varPlayer)
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203313_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203313_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203313_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203313_var_QuestId)
	  x203313_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203313_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203313_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203313_var_BonusChoiceItem do
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

function x203313_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203313_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203313_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203313_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203313_var_QuestId) > 0 then
				x203313_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203313_var_QuestId)
				x203313_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203313_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203313_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		
    			if x203313_var_doing==0 then
						if x203313_var_mohemo==-1 then
    			    			x203313_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
										x203313_var_doing =1
										x203313_var_mohemo=CreateMonster(varMap, 851,207,137,3,1,-1,-1,20,35000,180,"摩诃末")
									  x203313_var_zhalanding=CreateMonster(varMap, 852,203,136,3,1,-1,-1,20,35000,180,"扎兰丁")
									  x203313_var_quchulv=CreateMonster(varMap, 854,208,140,3,1,-1,-1,20,35000,180,"屈出律")
									  x203313_var_shibing1=CreateMonster(varMap, 843,207,145,3,1,-1,-1,20,35000,180,"突厥士兵")
										x203313_var_shibing2=CreateMonster(varMap, 843,197,141,3,1,-1,-1,20,35000,180,"突厥士兵")
										x203313_var_shibing2=CreateMonster(varMap, 843,103,143,3,1,-1,-1,20,35000,180,"突厥士兵")
										x203313_var_hedan=CreateMonster(varMap, 859,209,130,3,1,-1,-1,20,35000,0,"合丹")
										x203313_var_xuliewu=CreateMonster(varMap, 859,203,126,3,1,-1,-1,20,35000,0,"旭烈兀")
										x203313_var_alibuge=CreateMonster(varMap, 859,214,119,3,1,-1,-1,20,35000,0,"阿里不哥")
										x203313_var_baierda=CreateMonster(varMap, 859,207,118,3,1,-1,-1,20,35000,0,"拜尔答")
    			          x203313_var_PROTECTINFO.StartTime = GetCurrentTime()
										x203313_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203313, "ProcScneneTimer", 1)
    			  end
    			
    								
												
										
									
										
						  		
					  			
					
								
								
								
								
								
					end
	 	end        
									
    		

   
end


function x203313_ProcScneneTimer(varMap)
	if x203313_var_doing==1   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 3   then
						x203313_var_doing = 2
						if IsObjValid (varMap,x203313_var_zhalanding) == 1 then
								NpcTalk(varMap, x203313_var_zhalanding, "嘿嘿，想走？哪有那么容易！", -1)
						end
		end
	elseif x203313_var_doing==2   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 6   then
						x203313_var_doing = 3
						if IsObjValid (varMap,x203313_var_mohemo) == 1 then
								NpcTalk(varMap, x203313_var_mohemo, "留下两位公主，我或许可以考虑放你们一条生路！", -1)
						end
		end
	elseif x203313_var_doing==3   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 10   then
						x203313_var_doing = 4
						if IsObjValid (varMap,x203313_var_zhalanding) == 1 then
								NpcTalk(varMap, x203313_var_zhalanding, "我们才是真正的亚洲之王，成吉思汗算什么东西！", -1)
						end
		end
	elseif x203313_var_doing==4   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 15   then
						x203313_var_doing = 5
						if IsObjValid (varMap,x203313_var_hedan) == 1 then
								NpcTalk(varMap, x203313_var_hedan, "旭烈兀，你们快走！", -1)
						end
		end
	elseif x203313_var_doing==5   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 20   then
						x203313_var_doing = 6
						if IsObjValid (varMap,x203313_var_hedan) == 1 then
								NpcTalk(varMap, x203313_var_hedan, "勇士们，猎狗终须山上死，大将难免阵前亡！为了我们大蒙古国的荣誉，和他们拼了！", -1)
								
								
								x203313_PlayeffectToNearPlayer(varMap,x203313_var_hedan,14)
						end
		end
	elseif x203313_var_doing==6   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 25   then
						x203313_var_doing = 7
						if IsObjValid (varMap,x203313_var_xuliewu) == 1 then
								NpcTalk(varMap, x203313_var_xuliewu, "合丹，合丹！", -1)	
						end
		end
	elseif x203313_var_doing==7   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 31   then
						x203313_var_doing = 8
						if IsObjValid (varMap,x203313_var_hedan) == 1 then							
									NpcTalk(varMap, x203313_var_hedan, "旭烈兀，我像英雄一样的死去没有怨恨，只求你帮我照顾好贵由！", -1)
						end	
		end
	elseif x203313_var_doing==8   then
		if GetCurrentTime() - x203313_var_PROTECTINFO.StartTime >= 35   then
						x203313_var_doing = 9
						x203313_CloseTimer(varMap, x203313_var_PROTECTINFO.ScneneTimerIndex)
					end
	end
end





function x203313_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203313_var_doing = 0
	x203313_var_mohemo = -1
	x203313_var_zhalanding = -1
	x203313_var_quchulv = -1
	x203313_var_shibing1 = -1
	x203313_var_shibing2 = -1
	x203313_var_hedan = -1
	x203313_var_xuliewu = -1
	x203313_var_mengguyongshi1 = -1
	x203313_var_mengguyongshi2 = -1
	x203313_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203313_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203313_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203313_var_ExpBonus);
  	end
		if x203313_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203313_var_BonusMoney1 )
	  end
		if x203313_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203313_var_BonusMoney2 )
	  end
		if x203313_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203313_var_BonusMoney3 )
		end
		if x203313_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203313_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203313_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203313_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203313_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203313_var_BonusMoney6)
		end
end

function x203313_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203313_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203313_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203313_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203313_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203313_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203313_var_QuestName.."！", 0, 3)
				if x203313_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203313_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203313_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203313_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203313_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203313_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203313_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203313_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203313_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203313_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203313_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203313_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203313_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203313_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203313_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203313_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203313_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203313_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203313_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203313_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203313_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203313_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203313_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203313_var_QuestId, varState, -1 )
		end
end

function x203313_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203313_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203313_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203313_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203313_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203313_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
