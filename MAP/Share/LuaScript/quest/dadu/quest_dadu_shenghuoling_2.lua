

--DECLARE_QUEST_INFO_START--
x270002_var_FileId = 270002
x270002_var_QuestIdPre =3542
x270002_var_QuestId = 3543
x270002_var_LevelLess	= 	76 
x270002_var_QuestIdNext = 3534
x270002_var_Name	={}
x270002_var_ExtTarget={{type=20,n=1,target="到@npc_139827处参加点燃圣火仪式"}}
x270002_var_QuestName="【主线】熊熊圣火"
x270002_var_QuestInfo="\t#y@myname#w大侠，在你的帮助下，圣火令失而复得，我教上下对你感激不尽。阳教主马上就重燃圣火，让圣火照亮世间，永远指引我们明教！"  
x270002_var_QuestTarget=""		
x270002_var_QuestCompleted="\t嗯，明教行事一向怪异，我以后还是少掺和他们的事情好了！"					
x270002_var_ContinueInfo="\t听说明教点燃圣火的仪式很特别，你见识过了么？"
x270002_var_QuestHelp =	""
x270002_var_DemandItem ={}
x270002_var_BonusMoney1 =0
x270002_var_BonusMoney2 =0
x270002_var_BonusMoney3 =0
x270002_var_BonusMoney4 =0
x270002_var_BonusMoney5 =86
x270002_var_BonusMoney6 =0
x270002_var_BonusItem	=	{}
x270002_var_BonusChoiceItem ={}
x270002_var_ExpBonus = 800000
x270002_var_doing = 0
x270002_var_accid = -1
x270002_var_yangdingtian = -1
x270002_var_xiexun = -1
x270002_var_yintianzheng = -1
x270002_var_weiyixiao = -1
x270002_var_daiyisi = -1
x270002_var_mingjiaodizi = -1
x270002_var_mingjiaodizi2 = -1
x270002_var_mingjiaodizi3 = -1
x270002_var_mingjiaodizi4 = -1
x270002_var_mingjiaodizi5 = -1
x270002_var_mingjiaodizi6 = -1
x270002_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x270002_var_NpcGUID ={{ guid = 139827, varName = "黛猗丝"}, { guid = 140419, varName = "卜运算元"}}
--DECLARE_QUEST_INFO_STOP--


function x270002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x270002_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270002_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x270002_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270002_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270002_var_QuestId, varState, -1 )
		end
	end
end

function x270002_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270002_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270002_var_ExpBonus )
		end
		if x270002_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270002_var_BonusMoney1 )
		end
		if x270002_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270002_var_BonusMoney2 )
		end
		if x270002_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270002_var_BonusMoney3 )
		end
		if x270002_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270002_var_BonusMoney4 )
		end
		if x270002_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270002_var_BonusMoney5 )
		end
		if x270002_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270002_var_BonusMoney6 )
		end
		for varI, item in x270002_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270002_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270002_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x270002_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270002_var_QuestId) > 0 then
		if which == -1 then   
			if x270002_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270002_var_QuestName)
						TalkAppendString(varMap,x270002_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270002_var_FileId, x270002_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270002_var_QuestName)
						TalkAppendString(varMap,x270002_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270002_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270002_var_FileId, x270002_var_QuestId);
			end
		elseif which == 1 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270002_var_QuestId)                                                  
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    StartTalkTask(varMap)
			TalkAppendString(varMap,format("参观点燃圣火仪式   %d/1", GetQuestParam(varMap,varPlayer,varQuestIdx,0) ))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"我听说了你所做的事情，我们明教会永远记得你的恩惠的！")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270002_var_FileId, x270002_var_QuestId);
	    if x270002_var_doing == 0 then
	    		x270002_var_PROTECTINFO.StartTime = GetCurrentTime()
					x270002_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270002, "ProcScneneTimer", 1)
					if x270002_var_PROTECTINFO.ScneneTimerIndex >=0 then
							x270002_var_doing = 1
							x270002_var_accid = varPlayer
							x270002_var_xiexun=CreateMonster(varMap, 1943,96,228,3,1,-1,-1,20,55000,180,"谢逊","金毛狮王")
							x270002_var_yintianzheng=CreateMonster(varMap, 419,97,229,3,1,-1,-1,20,55000,0,"殷天正","白眉鹰王")
							x270002_var_weiyixiao=CreateMonster(varMap, 1934,98,228,3,1,-1,-1,20,55000,0,"韦一笑","青翼蝠王")
							if IsObjValid (varMap,x270002_var_xiexun) == 1 then
									SetPatrolId(varMap, x270002_var_xiexun, 21)
							end
							if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
									SetPatrolId(varMap, x270002_var_yintianzheng, 20)
							end
							if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
									SetPatrolId(varMap, x270002_var_weiyixiao, 19)
							end
							x270002_var_daiyisi =varTalknpc
							if IsObjValid (varMap,x270002_var_daiyisi) == 1 then
									NpcTalk(varMap, x270002_var_daiyisi, "圣火仪式现在开始！", -1)
							end
          end
	    end
	  end
  elseif x270002_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270002_var_QuestName)
			TalkAppendString(varMap,x270002_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270002_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270002_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270002_var_QuestHelp )
			end
			x270002_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270002_var_FileId, x270002_var_QuestId);
  end
	
end


function x270002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270002_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270002_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270002_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
end

function x270002_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270002_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270002_var_QuestId  )
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
		if x270002_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270002_var_QuestId, x270002_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270002_Msg2toplayer( varMap, varPlayer,0)
						if x270002_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270002_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x270002_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270002_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270002_var_QuestId)
	  x270002_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270002_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270002_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270002_var_BonusChoiceItem do
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

function x270002_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270002_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270002_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270002_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270002_var_QuestId) > 0 then
				x270002_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270002_var_QuestId)
				x270002_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270002_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270002_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x270002_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270002_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270002_var_ExpBonus);
  	end
		if x270002_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270002_var_BonusMoney1 )
	  end
		if x270002_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270002_var_BonusMoney2 )
	  end
		if x270002_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270002_var_BonusMoney3 )
		end
		if x270002_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270002_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270002_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270002_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270002_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270002_var_BonusMoney6)
		end
end

function x270002_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270002_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270002_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270002_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270002_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270002_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270002_var_QuestName.."！", 0, 3)
				if x270002_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270002_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270002_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270002_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270002_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270002_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270002_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270002_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270002_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270002_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270002_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270002_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270002_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270002_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270002_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270002_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270002_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270002_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270002_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270002_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
		if IsHaveQuest(varMap,varPlayer, x270002_var_QuestId) > 0 then
				if varTalkNpcGUID == x270002_var_NpcGUID[1].guid then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270002_var_QuestId)
					if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then 
						TalkAppendButton(varMap, x270002_var_QuestId, "教主马上来举行点燃圣火仪式",0,1)
					end
				elseif varTalkNpcGUID == x270002_var_NpcGUID[2].guid then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270002_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270002_var_QuestId, varState, -1 )
				end
		end
end

function x270002_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270002_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270002_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270002_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270002_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270002_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270002_ProcScneneTimer(varMap)
	if x270002_var_doing==1   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 7   then
						x270002_var_doing = 2
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
								NpcTalk(varMap, x270002_var_yintianzheng, "我就知道我教会平安渡过这次难关的。", -1)
						end
		end
	elseif x270002_var_doing==2   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 10   then
						x270002_var_doing = 3
						if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
								NpcTalk(varMap, x270002_var_weiyixiao, "这次多亏了有这位少侠出手相助。", -1)
						end
		end
	elseif x270002_var_doing==3   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 13   then
						x270002_var_doing = 4
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
								NpcTalk(varMap, x270002_var_yintianzheng, "恩，能遇到少侠真乃我教之幸事！", -1)
						end
            x270002_var_mingjiaodizi=CreateMonster(varMap, 1610,93,229.7,3,1,-1,-1,20,42000,180,"明教弟子")
            x270002_var_mingjiaodizi2=CreateMonster(varMap, 1610,94,228,3,1,-1,-1,20,42000,180,"明教弟子")
            x270002_var_mingjiaodizi3=CreateMonster(varMap, 1610,92,229,3,1,-1,-1,20,42000,180,"明教弟子")
            x270002_var_mingjiaodizi4=CreateMonster(varMap, 1610,91,231,3,1,-1,-1,20,42000,180,"明教弟子")
            x270002_var_mingjiaodizi5=CreateMonster(varMap, 1610,90,232,3,1,-1,-1,20,42000,180,"明教弟子")
            x270002_var_mingjiaodizi6=CreateMonster(varMap, 1610,89,229,3,1,-1,-1,20,42000,180,"明教弟子")
            if IsObjValid (varMap,x270002_var_mingjiaodizi) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi, 22)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi2) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi2, 23)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi3) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi3, 24)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi4) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi4, 25)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi5) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi5, 26)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi6) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi6, 27)
            end
		end
	elseif x270002_var_doing==4   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 19   then
						x270002_var_doing = 5
						if IsObjValid (varMap,x270002_var_daiyisi) == 1 then
								NpcTalk(varMap, x270002_var_daiyisi, "请阳教主入场点燃圣火！", -1)
						end
		end
	elseif x270002_var_doing==5   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 21   then
						x270002_var_doing = 6
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
            		SetMonsterDir(varMap,x270002_var_yintianzheng,180)
            end
            if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
            		SetMonsterDir(varMap,x270002_var_weiyixiao,180)
            end
            if IsObjValid (varMap,x270002_var_xiexun) == 1 then
            		SetMonsterDir(varMap,x270002_var_xiexun,180)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi,180)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi2) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi2,180)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi3) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi3,180)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi4) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi4,180)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi5) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi5,180)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi6) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi6,180)
            end
            x270002_var_yangdingtian=CreateMonster(varMap, 241,91,228,3,1,-1,-1,20,34000,180,"阳顶天")
            if IsObjValid (varMap,x270002_var_yangdingtian) == 1 then
            		SetPatrolId(varMap, x270002_var_yangdingtian, 28)
            end
		end
	elseif x270002_var_doing==6   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 23   then
						x270002_var_doing = 7
						if IsObjValid (varMap,x270002_var_mingjiaodizi) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi,270)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi2) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi2,270)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi3) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi3,270)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi4) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi4,90)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi5) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi5,90)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi6) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi6,90)
            end
		end
	elseif x270002_var_doing==7   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 29   then
						x270002_var_doing = 8
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
            		SetMonsterDir(varMap,x270002_var_yintianzheng,0)
            end
            if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
            		SetMonsterDir(varMap,x270002_var_weiyixiao,0)
            end
            if IsObjValid (varMap,x270002_var_xiexun) == 1 then
            		SetMonsterDir(varMap,x270002_var_xiexun,0)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi,0)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi2) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi2,0)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi3) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi3,0)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi4) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi4,30)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi5) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi5,30)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi6) == 1 then
            		SetMonsterDir(varMap,x270002_var_mingjiaodizi6,30)
            end
		end
	elseif x270002_var_doing==8   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 35   then
						x270002_var_doing = 9
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
            		SetMonsterDir(varMap,x270002_var_yintianzheng,0)
            end
            if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
            		SetMonsterDir(varMap,x270002_var_weiyixiao,0)
            end
            if IsObjValid (varMap,x270002_var_xiexun) == 1 then
            		SetMonsterDir(varMap,x270002_var_xiexun,0)
            end
		end
	elseif x270002_var_doing==9   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 38   then
			if IsPlayerStateNormal(varMap,x270002_var_accid) ==1 then
						x270002_var_doing = 10
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
								SetPatrolId(varMap, x270002_var_yintianzheng, 29)
						end
						if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
            		SetPatrolId(varMap, x270002_var_weiyixiao, 30)
            end
            if IsObjValid (varMap,x270002_var_xiexun) == 1 then
            		SetPatrolId(varMap, x270002_var_xiexun, 31)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi, 32)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi2) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi2, 33)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi3) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi3, 34)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi4) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi4, 35)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi5) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi5, 36)
            end
            if IsObjValid (varMap,x270002_var_mingjiaodizi6) == 1 then
            		SetPatrolId(varMap, x270002_var_mingjiaodizi6, 37)
            end
            if IsPlayerStateNormal(varMap,x270002_var_accid) ==1 then
            		LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, x270002_var_accid, 6 )
            end
      end
		end
	elseif x270002_var_doing==10   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 43   then
						x270002_var_doing = 11
						if IsObjValid (varMap,x270002_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270002_var_yangdingtian, "熊熊圣火，焚我残躯！怜我世人，忧患实多！", -1)
						end
		end
	elseif x270002_var_doing==11   then
		if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 47   then
						x270002_var_doing = 12
						if IsObjValid (varMap,x270002_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270002_var_yangdingtian, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_yintianzheng) == 1 then
								NpcTalk(varMap, x270002_var_yintianzheng, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_weiyixiao) == 1 then
								NpcTalk(varMap, x270002_var_weiyixiao, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_xiexun) == 1 then
								NpcTalk(varMap, x270002_var_xiexun, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_mingjiaodizi) == 1 then
								NpcTalk(varMap, x270002_var_mingjiaodizi, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_mingjiaodizi2) == 1 then
								NpcTalk(varMap, x270002_var_mingjiaodizi2, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_mingjiaodizi3) == 1 then
								NpcTalk(varMap, x270002_var_mingjiaodizi3, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_mingjiaodizi4) == 1 then
								NpcTalk(varMap, x270002_var_mingjiaodizi4, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_mingjiaodizi5) == 1 then
								NpcTalk(varMap, x270002_var_mingjiaodizi5, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
						if IsObjValid (varMap,x270002_var_mingjiaodizi6) == 1 then
								NpcTalk(varMap, x270002_var_mingjiaodizi6, "生亦何欢，死亦何苦？为善除恶，惟我明教。", -1)
						end
		end
	elseif x270002_var_doing==12 then
			if GetCurrentTime() - x270002_var_PROTECTINFO.StartTime >= 55   then
				x270002_var_doing=13
				x270002_CloseTimer(varMap, x270002_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270002_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270002_var_doing =0
	x270002_var_accid = -1
	x270002_var_yangdingtian = -1
	x270002_var_xiexun = -1
	x270002_var_yintianzheng = -1
	x270002_var_weiyixiao = -1
	x270002_var_daiyisi = -1
	x270002_var_mingjiaodizi = -1
	x270002_var_mingjiaodizi2 = -1
	x270002_var_mingjiaodizi3 = -1
	x270002_var_mingjiaodizi4 = -1
	x270002_var_mingjiaodizi5 = -1
	x270002_var_mingjiaodizi6 = -1
	x270002_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end
