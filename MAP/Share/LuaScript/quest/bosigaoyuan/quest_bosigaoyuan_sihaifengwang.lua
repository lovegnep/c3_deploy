

--DECLARE_QUEST_INFO_START--
x203318_var_FileId = 203318
x203318_var_QuestIdPre = 770
x203318_var_QuestId = 771
x203318_var_LevelLess	= 	84
x203318_var_QuestIdNext = -1
x203318_var_Name	={}
x203318_var_ExtTarget={{type=20,n=1,target="向@npc_116000禀报战况"}}
x203318_var_QuestName="【剧场】四海封王"
x203318_var_QuestInfo="\t哈哈，如今不死魔君扎兰丁也已经束手就擒，从此以后亚洲广阔的土地上，再也没人能够与我大蒙古帝国为敌，快将这个好消息禀报给大汗！"  
x203318_var_QuestTarget=""		
x203318_var_QuestCompleted="\t#y@myname#w，怎么？是大汗让你来的？是刚才封汗大典上大汗看出我神情异常了吧。"					
x203318_var_ContinueInfo="\t庆功宴马上就要开始了！"
x203318_var_QuestHelp =	""
x203318_var_DemandItem ={}
x203318_var_ExpBonus = 626000
x203318_var_BonusMoney1 =840
x203318_var_BonusMoney2 =0
x203318_var_BonusMoney3 =0
x203318_var_BonusMoney4 =0
x203318_var_BonusMoney5 =96
x203318_var_BonusMoney6 =0
x203318_var_BonusItem	=	{}
x203318_var_BonusChoiceItem ={}
x203318_var_doing = 0
x203318_var_accid = -1
x203318_var_mengguwushi1 = -1
x203318_var_mengguwushi2 = -1
x203318_var_mengguwushi3 = -1
x203318_var_mengguwushi4 = -1
x203318_var_mengguwushi5 = -1
x203318_var_mengguwushi6 = -1
x203318_var_mengguwushi7 = -1
x203318_var_mengguwushi8 = -1
x203318_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203318_var_NpcGUID ={{ guid = 116000, varName = "成吉思汗"}, {guid = 116003, varName ="速不台"}}
--DECLARE_QUEST_INFO_STOP--


function x203318_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203318_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203318_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x203318_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203318_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203318_var_QuestId, varState, -1 )
		end
	end
end

function x203318_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203318_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203318_var_ExpBonus )
		end
		if x203318_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203318_var_BonusMoney1 )
		end
		if x203318_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203318_var_BonusMoney2 )
		end
		if x203318_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203318_var_BonusMoney3 )
		end
		if x203318_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203318_var_BonusMoney4 )
		end
		if x203318_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203318_var_BonusMoney5 )
		end
		if x203318_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203318_var_BonusMoney6 )
		end
		for varI, item in x203318_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203318_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203318_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x203318_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203318_var_QuestId) > 0 then
		if which == -1 then   
			if x203318_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203318_var_QuestName)
						TalkAppendString(varMap,x203318_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203318_var_FileId, x203318_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203318_var_QuestName)
						TalkAppendString(varMap,x203318_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203318_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203318_var_FileId, x203318_var_QuestId);
			end
		elseif which == 1 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203318_var_QuestId)                                                  
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    StartTalkTask(varMap)
			TalkAppendString(varMap,format("参观庆功宴   %d/1", GetQuestParam(varMap,varPlayer,varQuestIdx,0) ))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"今天是我是最高兴的日子！")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203318_var_FileId, x203318_var_QuestId);
			x203318_var_chengjisihan =FindMonsterByGUID( varMap,116000)
			x203318_var_guobaoyu =FindMonsterByGUID( varMap,116009)
			x203318_var_hubilie=FindMonsterByGUID( varMap,116007)
			x203318_var_badu =FindMonsterByGUID( varMap,116019)
			x203318_var_mengge =FindMonsterByGUID( varMap,116006)
			x203318_var_qiuchuji =FindMonsterByGUID( varMap,116005)
			x203318_var_xuliewu =FindMonsterByGUID( varMap,116004)
			x203318_var_subutai =FindMonsterByGUID( varMap,116003)
			x203318_var_zhebie =FindMonsterByGUID( varMap,116002)
	    
	    		x203318_var_PROTECTINFO.StartTime = GetCurrentTime()
					x203318_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203318, "ProcScneneTimer", 1)
					if x203318_var_PROTECTINFO.ScneneTimerIndex >=0 then
							x203318_var_doing = 1
							x203318_var_accid = varPlayer
							x203318_var_mengguwushi1=CreateMonster(varMap, 932,198,198,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi2=CreateMonster(varMap, 932,195,198,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi3=CreateMonster(varMap, 932,191,198,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi4=CreateMonster(varMap, 932,188,198,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi5=CreateMonster(varMap, 932,188,195,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi6=CreateMonster(varMap, 932,191,195,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi7=CreateMonster(varMap, 932,194,195,3,1,-1,-1,20,70000,0)
							x203318_var_mengguwushi8=CreateMonster(varMap, 932,198,195,3,1,-1,-1,20,70000,0)
							
									
							
							if IsObjValid (varMap,x203318_var_hubilie) == 1 then
									SetPatrolId(varMap, x203318_var_hubilie, 9)
							end
							if IsObjValid (varMap,x203318_var_badu) == 1 then
									SetPatrolId(varMap, x203318_var_badu, 7)
							end
							if IsObjValid (varMap,x203318_var_mengge) == 1 then
									SetPatrolId(varMap, x203318_var_mengge, 10)
							end
							
									
							
							if IsObjValid (varMap,x203318_var_xuliewu) == 1 then
									SetPatrolId(varMap, x203318_var_xuliewu, 8)
							end							
							
									
							
							
									
							
							x203318_var_chengjisihan =varTalknpc
							if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
									NpcTalk(varMap, x203318_var_chengjisihan, "勇士们，让我们举杯畅饮！", -1)
							end
          end
	   
	  end
  elseif x203318_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203318_var_QuestName)
			TalkAppendString(varMap,x203318_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203318_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203318_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203318_var_QuestHelp )
			end
			x203318_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203318_var_FileId, x203318_var_QuestId);
  end
	
end


function x203318_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203318_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203318_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203318_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
end

function x203318_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203318_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203318_var_QuestId  )
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
		if x203318_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203318_var_QuestId, x203318_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203318_Msg2toplayer( varMap, varPlayer,0)
						if x203318_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203318_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x203318_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203318_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203318_var_QuestId)
	  x203318_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203318_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203318_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203318_var_BonusChoiceItem do
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

function x203318_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203318_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203318_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203318_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203318_var_QuestId) > 0 then
				x203318_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203318_var_QuestId)
				x203318_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203318_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203318_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x203318_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203318_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203318_var_ExpBonus);
  	end
		if x203318_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203318_var_BonusMoney1 )
	  end
		if x203318_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203318_var_BonusMoney2 )
	  end
		if x203318_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203318_var_BonusMoney3 )
		end
		if x203318_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203318_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203318_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203318_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203318_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203318_var_BonusMoney6)
		end
end

function x203318_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203318_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203318_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203318_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203318_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203318_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203318_var_QuestName.."！", 0, 3)
				if x203318_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203318_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203318_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203318_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203318_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203318_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203318_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203318_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203318_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203318_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203318_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203318_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203318_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203318_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203318_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203318_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203318_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203318_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203318_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203318_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	
		if IsHaveQuest(varMap,varPlayer, x203318_var_QuestId) > 0 then
			
				if varTalkNpcGUID == x203318_var_NpcGUID[1].guid then	
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203318_var_QuestId)
					if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then 
						TalkAppendButton(varMap, x203318_var_QuestId, "请列位功臣举起手中金杯",0,1)
					end
				elseif varTalkNpcGUID == x203318_var_NpcGUID[2].guid then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203318_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203318_var_QuestId, varState, -1 )
				end
		end
end

function x203318_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203318_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203318_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203318_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203318_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203318_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203318_ProcScneneTimer(varMap)
	if x203318_var_doing==1   then
		if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 8   then
				x203318_var_doing = 2
				if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
						NpcTalk(varMap, x203318_var_chengjisihan, "我黄金家族的子子孙孙都已经长大成材，今天，我要将我所有的土地分给这些子孙们。", -1)
						SetMonsterDir(varMap,x203318_var_badu,180)
				end
		end
	elseif x203318_var_doing==2   then
		if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 11   then
						x203318_var_doing = 3
						if IsObjValid (varMap,x203318_var_subutai) == 1 then
								NpcTalk(varMap, x203318_var_subutai, "但凭大汗吩咐。", -1)
						end
		end
	elseif x203318_var_doing==3   then
		if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 16   then
						x203318_var_doing = 4
						if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203318_var_chengjisihan, "旭烈兀！大战之中屡立奇功，虽处逆境而不惊，战绩卓着，我今册封其为西亚之王，掌管我大蒙古帝国西边辽阔的疆土。", -1)
						end
            if IsObjValid (varMap,x203318_var_xuliewu) == 1 then
								NpcTalk(varMap, x203318_var_xuliewu, "多谢大汗，旭烈兀定不负大汗所望！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi3) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi3, "成吉思汗！成吉思汗！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi1) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi1, "成吉思汗！成吉思汗！", -1)
						end
            
            
            		
            
            
            		
            
            
            		
            
            
            		
            
            
            	
            
            
            		
            
		end
	elseif x203318_var_doing==4   then
		if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 25  then
						x203318_var_doing = 5
						if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203318_var_chengjisihan, "蒙哥，勇而有谋，数次妙计破敌，居功甚伟！今封蒙哥为东亚之王！", -1)								
						end
						 if IsObjValid (varMap,x203318_var_mengge) == 1 then
								NpcTalk(varMap, x203318_var_mengge, "谢大汗，蒙哥一定永守蒙古疆土！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi6) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi6, "成吉思汗！成吉思汗！", -1)
						end
            if IsObjValid (varMap,x203318_var_mengguwushi4) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi4, "成吉思汗！成吉思汗！", -1)
						end						
		end
	elseif x203318_var_doing==5   then
	 if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 35  then
						x203318_var_doing = 6
						if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203318_var_chengjisihan, "拔都，勇猛无比，军纪严明，作战之时身先士卒！今，封拔都为欧洲之王！", -1)								
						end
						if IsObjValid (varMap,x203318_var_badu) == 1 then
								NpcTalk(varMap, x203318_var_badu, "拔都，多谢大汗！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi6) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi6, "……？……？", -1)
						end
						if IsObjValid (varMap,x203318_var_subutai) == 1 then
								NpcTalk(varMap, x203318_var_subutai, "欧洲？！什么？！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi3) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi3, "……？……？", -1)
						end
	 end
	elseif x203318_var_doing==6  then
		if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 45   then
						x203318_var_doing = 7
						if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203318_var_chengjisihan, "我希望黄金家族的子孙们牢牢记住，一个民族，只有吸收更多的文化，更多的人民，才能更加强大。亡诸国者并非是我成吉思汗，成就庞大蒙古汗国的也并非是我，而是各国、各民族，千千万万渴望和平与安定的人民。", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi1) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi1, "成吉思汗！成吉思汗！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengguwushi4) == 1 then
								NpcTalk(varMap, x203318_var_mengguwushi4, "成吉思汗！成吉思汗！", -1)
						end
		end
	elseif x203318_var_doing==7 then
	  if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 55  then
						x203318_var_doing = 8
						if IsObjValid (varMap,x203318_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203318_var_chengjisihan, "昨天我做了一个梦，梦见了我的安答札木合，梦见了屈出律，还，梦见了很多很多人。如今，他们都不在了，我，要感谢这些曾经与我为敌的人，是他们，造就了我，今天的成吉思汗！在这里，我向天，敬他们一杯！", -1)
						end
						if IsObjValid (varMap,x203318_var_mengge) == 1 then
								NpcTalk(varMap, x203318_var_mengge, "大汗！", -1)
						end
						if IsObjValid (varMap,x203318_var_xuliewu) == 1 then
								NpcTalk(varMap, x203318_var_xuliewu, "大汗……？", -1)
						end
						if IsObjValid (varMap,x203318_var_hubilie) == 1 then
								NpcTalk(varMap, x203318_var_hubilie, "大汗……", -1)
						end
						if IsObjValid (varMap,x203318_var_badu) == 1 then
								NpcTalk(varMap, x203318_var_badu, "……！", -1)
						end
			end
	elseif x203318_var_doing==8 then
			if GetCurrentTime() - x203318_var_PROTECTINFO.StartTime >= 70  then
				x203318_var_doing=9
				if x203318_var_doing ==9 then
				x203318_CloseTimer(varMap, x203318_var_PROTECTINFO.ScneneTimerIndex)
				end
			end
	  end
 end







function x203318_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203318_var_doing =0
	x203318_var_accid = -1
	x203318_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}   
	SetPos(varMap,x203318_var_badu,186,200)
	SetPos(varMap,x203318_var_xuliewu,186,194)
	SetPos(varMap,x203318_var_mengge,201,200)
	SetPos(varMap,x203318_var_hubilie,201,194)
	SetPatrolId(varMap, x203318_var_hubilie, -1)
	SetPatrolId(varMap, x203318_var_badu, -1)
  SetPatrolId(varMap, x203318_var_mengge, -1)
	SetPatrolId(varMap, x203318_var_xuliewu, -1)
	SetMonsterDir(varMap,x203318_var_badu,180)
	SetMonsterDir(varMap,x203318_var_xuliewu,180)
	SetMonsterDir(varMap,x203318_var_mengge,180)
	SetMonsterDir(varMap,x203318_var_hubilie,180)
	x203318_var_mengguwushi1 = -1
  x203318_var_mengguwushi2 = -1
  x203318_var_mengguwushi3 = -1
  x203318_var_mengguwushi4 = -1
  x203318_var_mengguwushi5 = -1
  x203318_var_mengguwushi6 = -1
end
