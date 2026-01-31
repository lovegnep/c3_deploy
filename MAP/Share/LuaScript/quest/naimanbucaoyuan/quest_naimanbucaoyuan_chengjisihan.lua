

--DECLARE_QUEST_INFO_START--
x202001_var_FileId = 202001
x202001_var_QuestIdPre =1027
x202001_var_QuestId = 1028
x202001_var_LevelLess	= 	30 
x202001_var_QuestIdNext = 1032
x202001_var_Name	={}
x202001_var_ExtTarget={{type=20,n=1,target="在@npc_105104处参加称汗仪式"}}
x202001_var_QuestName="【剧场】成吉思汗"
x202001_var_QuestInfo="\t大汗即将归来，你愿意来参加封汗大典吗？这个机会不是每个人都能遇到的！"  
x202001_var_QuestTarget=""		
x202001_var_QuestCompleted="\t我蒙古终于统一在一位伟大的可汗之下了，这真是我蒙古之幸！"					
x202001_var_ContinueInfo=""
x202001_var_QuestHelp =	""
x202001_var_DemandItem ={}
x202001_var_ExpBonus = 55000
x202001_var_BonusMoney1 =285
x202001_var_BonusMoney2 =0
x202001_var_BonusMoney3 =0
x202001_var_BonusMoney4 =0
x202001_var_BonusMoney5 =49
x202001_var_BonusMoney6 =0
x202001_var_BonusItem	=	{{item=13020015,n=1}}
x202001_var_BonusChoiceItem ={}
x202001_var_doing = 0
x202001_var_huoerci = -1
x202001_var_kuokuochu = -1
x202001_var_yuelunfuren = -1
x202001_var_heelun = -1
x202001_var_huazheng = -1
x202001_var_chengjisihan = -1
x202001_var_muhuali = -1
x202001_var_zhebie = -1
x202001_var_shuchi = -1
x202001_var_chahetai = -1
x202001_var_zhelemie = -1
x202001_var_chilaowen = -1
x202001_var_wokuotai = -1
x202001_var_tuolei = -1
x202001_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
--DECLARE_QUEST_INFO_STOP--


function x202001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x202001_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x202001_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x202001_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x202001_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x202001_var_QuestId, varState, -1 )
		elseif IsHaveQuest(varMap,varPlayer, x202001_var_QuestId) > 0 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202001_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then 
						TalkAppendButton(varMap, x202001_var_QuestId, "参加封汗大典！",0,1)
			else
					local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x202001_var_QuestId)
					TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x202001_var_QuestId, varState, -1 )
			end
		end
	end
end

function x202001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x202001_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x202001_var_ExpBonus )
		end
		if x202001_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x202001_var_BonusMoney1 )
		end
		if x202001_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x202001_var_BonusMoney2 )
		end
		if x202001_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x202001_var_BonusMoney3 )
		end
		if x202001_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x202001_var_BonusMoney4 )
		end
		if x202001_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x202001_var_BonusMoney5 )
		end
		if x202001_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x202001_var_BonusMoney6 )
		end
		for varI, item in x202001_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x202001_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x202001_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x202001_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x202001_var_QuestId) > 0 then
		if which == -1 then   
			if x202001_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x202001_var_QuestName)
						TalkAppendString(varMap,x202001_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x202001_var_FileId, x202001_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x202001_var_QuestName)
						TalkAppendString(varMap,x202001_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x202001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x202001_var_FileId, x202001_var_QuestId);
			end
		elseif which == 1 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202001_var_QuestId)                                                  
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    StartTalkTask(varMap)
			TalkAppendString(varMap,format("参加封汗大典   %d/1", GetQuestParam(varMap,varPlayer,varQuestIdx,0) ))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"在大典过程中，请保持肃静！")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x202001_var_FileId, x202001_var_QuestId);
	    if x202001_var_doing == 0 then
	    		x202001_var_PROTECTINFO.StartTime = GetCurrentTime()
					x202001_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 202001, "ProcScneneTimer", 1)
					if x202001_var_PROTECTINFO.ScneneTimerIndex >=0 then
							x202001_var_doing = 1
							x202001_var_huoerci=CreateMonster(varMap, 91,29,135,3,1,-1,-1,20,63000,180,"豁儿赤")
							if IsObjValid (varMap,x202001_var_huoerci) == 1 then
									SetPatrolId(varMap, x202001_var_huoerci, 11)
							end
							x202001_var_kuokuochu =varTalknpc
          end
	    end
	  end
  elseif x202001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x202001_var_QuestName)
			TalkAppendString(varMap,x202001_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x202001_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x202001_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x202001_var_QuestHelp )
			end
			x202001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x202001_var_FileId, x202001_var_QuestId);
  end
	
end


function x202001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x202001_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x202001_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202001_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
end

function x202001_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x202001_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x202001_var_QuestId  )
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
		if x202001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x202001_var_QuestId, x202001_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x202001_Msg2toplayer( varMap, varPlayer,0)
						if x202001_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202001_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x202001_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x202001_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x202001_var_QuestId)
	  x202001_Msg2toplayer( varMap, varPlayer,1)
			
end

function x202001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x202001_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x202001_var_BonusChoiceItem do
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

function x202001_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x202001_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x202001_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x202001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x202001_var_QuestId) > 0 then
				x202001_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x202001_var_QuestId)
				x202001_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x202001_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x202001_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x202001_var_QuestIdNext )	
end

function x202001_GetBonus( varMap, varPlayer,varTalknpc)
	  if x202001_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x202001_var_ExpBonus);
  	end
		if x202001_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x202001_var_BonusMoney1 )
	  end
		if x202001_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x202001_var_BonusMoney2 )
	  end
		if x202001_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x202001_var_BonusMoney3 )
		end
		if x202001_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x202001_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x202001_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x202001_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x202001_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x202001_var_BonusMoney6)
		end
end

function x202001_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x202001_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x202001_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x202001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x202001_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x202001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x202001_var_QuestName.."！", 0, 3)
				if x202001_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x202001_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x202001_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x202001_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x202001_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x202001_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x202001_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x202001_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x202001_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x202001_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x202001_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x202001_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x202001_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x202001_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x202001_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x202001_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x202001_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x202001_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x202001_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x202001_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end

function x202001_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x202001_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x202001_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x202001_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x202001_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x202001_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x202001_ProcScneneTimer(varMap)
	if x202001_var_doing==1   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 3   then
						x202001_var_doing = 2
						x202001_var_yuelunfuren =FindMonsterByGUID( varMap,105116)
						x202001_var_heelun =CreateMonster(varMap, 61,30,108,3,1,-1,-1,20,60000,180,"孛儿帖")
						x202001_var_huazheng =CreateMonster(varMap, 61,34,110,3,1,-1,-1,20,60000,180,"华筝")
						if IsObjValid (varMap,x202001_var_huoerci) == 1 then
									NpcTalk(varMap, x202001_var_huoerci, "大汗已经得胜归来了！", -1)
						end
						if IsObjValid (varMap,x202001_var_heelun) == 1 then
								SetPatrolId(varMap, x202001_var_heelun, 0)
						end
						if IsObjValid (varMap,x202001_var_huazheng) == 1 then
								SetPatrolId(varMap, x202001_var_huazheng, 1)
						end
		end
	elseif x202001_var_doing==2   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 6   then
						x202001_var_doing = 3
						if IsObjValid (varMap,x202001_var_yuelunfuren) == 1 then
								NpcTalk(varMap, x202001_var_yuelunfuren, "想不到我儿铁木真能有今日之成就！", -1)
						end
						if IsObjValid (varMap,x202001_var_huazheng) == 1 then
								NpcTalk(varMap, x202001_var_huazheng, "父汗真厉害！", -1)
						end
						x202001_var_chengjisihan  =CreateMonster(varMap, 774,42,123,3,1,-1,-1,20,57000,180,"铁木真")
						x202001_var_muhuali  =CreateMonster(varMap, 773,42,126,3,1,-1,-1,20,57000,180,"木华黎")
						x202001_var_zhebie  =CreateMonster(varMap, 773,42,128,3,1,-1,-1,20,57000,180,"哲别")
						x202001_var_shuchi  =CreateMonster(varMap, 773,42,120,3,1,-1,-1,20,57000,180,"术赤")
						x202001_var_chahetai  =CreateMonster(varMap, 773,42,118,3,1,-1,-1,20,57000,180,"察合台")
						x202001_var_zhelemie  =CreateMonster(varMap, 773,45,127,3,1,-1,-1,20,57000,180,"者勒篾")
						x202001_var_chilaowen  =CreateMonster(varMap, 773,45,126,3,1,-1,-1,20,57000,180,"赤老温")
						x202001_var_wokuotai  =CreateMonster(varMap, 773,45,121,3,1,-1,-1,20,57000,180,"窝阔台")
						x202001_var_tuolei  =CreateMonster(varMap, 773,45,119,3,1,-1,-1,20,57000,180,"拖雷")
						if IsObjValid (varMap,x202001_var_chengjisihan) == 1 then
            		SetPatrolId(varMap, x202001_var_chengjisihan, 2)
            end
            if IsObjValid (varMap,x202001_var_muhuali) == 1 then
            		SetPatrolId(varMap, x202001_var_muhuali, 3)
            end
            if IsObjValid (varMap,x202001_var_zhebie) == 1 then
            		SetPatrolId(varMap, x202001_var_zhebie, 5)
            end
            if IsObjValid (varMap,x202001_var_shuchi) == 1 then
            		SetPatrolId(varMap, x202001_var_shuchi, 4)
            end
            if IsObjValid (varMap,x202001_var_chahetai) == 1 then
            		SetPatrolId(varMap, x202001_var_chahetai, 6)
            end
            if IsObjValid (varMap,x202001_var_zhelemie) == 1 then
            		SetPatrolId(varMap, x202001_var_zhelemie, 7)
            end
            if IsObjValid (varMap,x202001_var_chilaowen) == 1 then
            		SetPatrolId(varMap, x202001_var_chilaowen, 8)
            end
            if IsObjValid (varMap,x202001_var_wokuotai) == 1 then
            		SetPatrolId(varMap, x202001_var_wokuotai, 9)
            end
            if IsObjValid (varMap,x202001_var_tuolei) == 1 then
            		SetPatrolId(varMap, x202001_var_tuolei, 10)
            end
		end
	elseif x202001_var_doing==3   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 9   then
						x202001_var_doing = 4
						if IsObjValid (varMap,x202001_var_chengjisihan) == 1 then
								NpcTalk(varMap, x202001_var_chengjisihan, "感谢长生天赐予了我们胜利！", -1)
						end
		end
	elseif x202001_var_doing==4   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 12   then
						x202001_var_doing = 5
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "长生天说铁木真要成为整个蒙古乃至世界的大汗，即成吉思汗！", -1)
						end
		end
	elseif x202001_var_doing==5   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 18   then
						x202001_var_doing = 6
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "请大汗上承长生天的旨意，接受“成吉思汗”这个称号！", -1)
						end
		end
	elseif x202001_var_doing==6   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 21   then
						x202001_var_doing = 7
						if IsObjValid (varMap,x202001_var_muhuali) == 1 then
								NpcTalk(varMap, x202001_var_muhuali, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_zhebie) == 1 then
								NpcTalk(varMap, x202001_var_zhebie, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_shuchi) == 1 then
								NpcTalk(varMap, x202001_var_shuchi, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_chahetai) == 1 then
								NpcTalk(varMap, x202001_var_chahetai, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_zhelemie) == 1 then
								NpcTalk(varMap, x202001_var_zhelemie, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_chilaowen) == 1 then
								NpcTalk(varMap, x202001_var_chilaowen, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_wokuotai) == 1 then
								NpcTalk(varMap, x202001_var_wokuotai, "请大汗接受！", -1)
						end
						if IsObjValid (varMap,x202001_var_tuolei) == 1 then
								NpcTalk(varMap, x202001_var_tuolei, "请大汗接受！", -1)
						end
		end
	elseif x202001_var_doing==7   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 23   then
						x202001_var_doing = 8
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "力搏猛虎的铁木真！", -1)
						end
		end
	elseif x202001_var_doing==8   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 26   then
						x202001_var_doing = 9
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "智满海洋的铁木真！", -1)
						end
		end
	elseif x202001_var_doing==9   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 29   then
						x202001_var_doing = 10
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "目中有火的铁木真！", -1)
						end
    end
	elseif x202001_var_doing==10   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 32   then
						x202001_var_doing = 11
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "面上有光的铁木真！", -1)
						end
		end
	elseif x202001_var_doing==11   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 35   then
						x202001_var_doing = 12
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "我们愿！", -1)
						end
		end
	elseif x202001_var_doing==12   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 37   then
						x202001_var_doing = 13
						if IsObjValid (varMap,x202001_var_zhebie) == 1 then
								NpcTalk(varMap, x202001_var_zhebie, "作你的臂鹰！", -1)
						end
		end
	elseif x202001_var_doing==13   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 39   then
						x202001_var_doing = 14
						if IsObjValid (varMap,x202001_var_muhuali) == 1 then
								NpcTalk(varMap, x202001_var_muhuali, "作你的猎犬！", -1)
						end
		end
	elseif x202001_var_doing==14   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 41   then
						x202001_var_doing = 15
						if IsObjValid (varMap,x202001_var_shuchi) == 1 then
								NpcTalk(varMap, x202001_var_shuchi, "作你的长弓！", -1)
						end
		end
	elseif x202001_var_doing==15   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 43   then
						x202001_var_doing = 16
						if IsObjValid (varMap,x202001_var_chahetai) == 1 then
								NpcTalk(varMap, x202001_var_chahetai, "作你的利剑！", -1)
						end
		end
	elseif x202001_var_doing==16   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 45   then
						x202001_var_doing = 17
						if IsObjValid (varMap,x202001_var_tuolei) == 1 then
								NpcTalk(varMap, x202001_var_tuolei, "护你的金帐！", -1)
						end
		end
	elseif x202001_var_doing==17   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 47   then
						x202001_var_doing = 18
						if IsObjValid (varMap,x202001_var_wokuotai) == 1 then
								NpcTalk(varMap, x202001_var_wokuotai, "保你的金鞍！", -1)
						end
		end
	elseif x202001_var_doing==18   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 49   then
						x202001_var_doing = 19
						if IsObjValid (varMap,x202001_var_chilaowen) == 1 then
								NpcTalk(varMap, x202001_var_chilaowen, "以骨筑起顽城！", -1)
						end
		end
	elseif x202001_var_doing==19   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 51   then
						x202001_var_doing = 20
						if IsObjValid (varMap,x202001_var_zhelemie) == 1 then
								NpcTalk(varMap, x202001_var_zhelemie, "以血保卫可汗！", -1)
						end
		end
	elseif x202001_var_doing==20   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 53   then
						x202001_var_doing = 21
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "你，心应当铁，骨应当炭，胸应当炉，血应当汗！", -1)
						end
		end
	elseif x202001_var_doing==21   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 56   then
						x202001_var_doing = 22
						if IsObjValid (varMap,x202001_var_kuokuochu) == 1 then
								NpcTalk(varMap, x202001_var_kuokuochu, "从今起，你就是我们的成吉思汗！", -1)
						end
		end
	elseif x202001_var_doing==22   then
		if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 59   then
						x202001_var_doing = 23
						if IsObjValid (varMap,x202001_var_muhuali) == 1 then
								NpcTalk(varMap, x202001_var_muhuali, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_zhebie) == 1 then
								NpcTalk(varMap, x202001_var_zhebie, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_shuchi) == 1 then
								NpcTalk(varMap, x202001_var_shuchi, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_chahetai) == 1 then
								NpcTalk(varMap, x202001_var_chahetai, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_zhelemie) == 1 then
								NpcTalk(varMap, x202001_var_zhelemie, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_chilaowen) == 1 then
								NpcTalk(varMap, x202001_var_chilaowen, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_wokuotai) == 1 then
								NpcTalk(varMap, x202001_var_wokuotai, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_tuolei) == 1 then
								NpcTalk(varMap, x202001_var_tuolei, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_yuelunfuren) == 1 then
								NpcTalk(varMap, x202001_var_yuelunfuren, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_heelun) == 1 then
								NpcTalk(varMap, x202001_var_heelun, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_huazheng) == 1 then
								NpcTalk(varMap, x202001_var_huazheng, "成吉思汗！", -1)
						end
						if IsObjValid (varMap,x202001_var_huoerci) == 1 then
								NpcTalk(varMap, x202001_var_huoerci, "成吉思汗！", -1)
						end
		end
	elseif x202001_var_doing==23 then
			if GetCurrentTime() - x202001_var_PROTECTINFO.StartTime >= 63   then
				x202001_var_doing=24
				x202001_CloseTimer(varMap, x202001_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x202001_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x202001_var_doing = 0
	x202001_var_huoerci = -1
	x202001_var_kuokuochu = -1
	x202001_var_yuelunfuren = -1
	x202001_var_heelun = -1
	x202001_var_huazheng = -1
	x202001_var_chengjisihan = -1
	x202001_var_muhuali = -1
	x202001_var_zhebie = -1
	x202001_var_shuchi = -1
	x202001_var_chahetai = -1
	x202001_var_zhelemie = -1
	x202001_var_chilaowen = -1
	x202001_var_wokuotai = -1
	x202001_var_tuolei = -1
	x202001_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end
