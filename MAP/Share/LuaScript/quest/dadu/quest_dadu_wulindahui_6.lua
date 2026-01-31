--这是明教任务的第一个脚本，不是武林大会的！这是假的，浪费感情啊！！！

--DECLARE_QUEST_INFO_START--
x270009_var_FileId = 270009
x270009_var_QuestIdPre =3532
x270009_var_QuestId = 3533
x270009_var_LevelLess	= 	50 
x270009_var_QuestIdNext = 3534
x270009_var_Name	={}
x270009_var_ExtTarget={{type=20,n=1,target="探听清楚明教的状况"}}
x270009_var_QuestName="【主线】明教惊魂<二>"
x270009_var_QuestInfo="\t罢罢罢，世人笑我太痴颠，我笑世人看不穿！拿好，这便是布袋和尚给你备下的厚礼！"  
x270009_var_QuestTarget=""		
x270009_var_QuestCompleted="\t#Y@myname#W大侠，阳某人误会了你，真是惭愧，惭愧！请大侠安神定绪，稍事休息，杨某还有要事相求。"					
x270009_var_ContinueInfo="\t这些波斯人，莫不是吃了熊心豹子胆，居然敢闯入我们这里撒野？"
x270009_var_QuestHelp =	""
x270009_var_DemandItem ={}
x270009_var_BonusMoney1 =376
x270009_var_BonusMoney2 =0
x270009_var_BonusMoney3 =0
x270009_var_BonusMoney4 =0
x270009_var_BonusMoney5 =110
x270009_var_BonusMoney6 =0
x270009_var_BonusItem	=	{}
x270009_var_BonusChoiceItem ={}
x270009_var_ExpBonus = 93000
x270009_var_doing = 0
x270009_var_acceptid =0
x270009_var_kanshou = 0
x270009_var_kanshou2 = 0
x270009_var_budaiheshang = 0
x270009_var_guozixing =0
x270009_var_liufutong = 0
x270009_var_yangdingtian = 0
x270009_var_yangxiao = 0
x270009_var_fanyao = 0
x270009_var_suduona = 0
x270009_var_bosijiaotu = 0
x270009_var_bosijiaotu2 = 0
x270009_var_bosijiaotu3 = 0
x270009_var_bosijiaotu4 = 0
x270009_var_mingjiaodizi =0
x270009_var_mingjiaodizi2 =0
x270009_var_mingjiaodizi3 =0
x270009_var_mingjiaodizi4 =0
x270009_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x270009_var_NpcGUID ={{ guid = 139806, varName = "阳顶天"} }
--DECLARE_QUEST_INFO_STOP--


function x270009_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270009_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270009_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x270009_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270009_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270009_var_QuestId, varState, -1 )
		end
	end
end

function x270009_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270009_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270009_var_ExpBonus )
		end
		if x270009_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270009_var_BonusMoney1 )
		end
		if x270009_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270009_var_BonusMoney2 )
		end
		if x270009_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270009_var_BonusMoney3 )
		end
		if x270009_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270009_var_BonusMoney4 )
		end
		if x270009_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270009_var_BonusMoney5 )
		end
		if x270009_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270009_var_BonusMoney6 )
		end
		for varI, item in x270009_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270009_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270009_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270009_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270009_var_QuestId) > 0 then
			if x270009_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270009_var_QuestName)
						TalkAppendString(varMap,x270009_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270009_var_FileId, x270009_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270009_var_QuestName)
						TalkAppendString(varMap,x270009_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270009_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270009_var_FileId, x270009_var_QuestId);
			end
  elseif x270009_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270009_var_QuestName)
			TalkAppendString(varMap,x270009_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270009_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270009_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270009_var_QuestHelp )
			end
			x270009_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270009_var_FileId, x270009_var_QuestId);
  end
	
end


function x270009_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270009_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270009_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270009_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
	
end

function x270009_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270009_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270009_var_QuestId  )
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
		if x270009_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				if x270009_var_doing == 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270009_var_QuestId, x270009_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270009_Msg2toplayer( varMap, varPlayer,0)
		  			
		  			x270009_var_PROTECTINFO.StartTime = GetCurrentTime()
						x270009_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270009, "ProcScneneTimer", 1)
						x270009_var_doing = 1
						x270009_var_acceptid = varPlayer
						x270009_var_kanshou=CreateMonster(varMap, 1610,24,313,3,1,-1,-1,20,-1,180,"明教弟子")
						x270009_var_kanshou2=CreateMonster(varMap, 1610,25,309,3,1,-1,-1,20,-1,0,"明教弟子")
						x270009_var_budaiheshang =FindMonsterByGUID( varMap,139823)
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, x270009_var_budaiheshang, 1281, 0);
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8700, 0);
						MonsterDoAction(varMap, x270009_var_budaiheshang, 2, -1) 
					end
				else
					Msg2Player(varMap, varPlayer, "任务暂时无法接受！", 0, 3)
				end

	 	end                                                                    
	     
end


function x270009_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270009_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270009_var_QuestId)
	  x270009_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270009_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270009_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270009_var_BonusChoiceItem do
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

function x270009_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270009_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270009_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270009_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270009_var_QuestId) > 0 then
				x270009_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270009_var_QuestId)
				x270009_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270009_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270009_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270009_var_QuestIdNext )	
end

function x270009_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270009_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270009_var_ExpBonus);
  	end
		if x270009_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270009_var_BonusMoney1 )
	  end
		if x270009_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270009_var_BonusMoney2 )
	  end
		if x270009_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270009_var_BonusMoney3 )
		end
		if x270009_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270009_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270009_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270009_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270009_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270009_var_BonusMoney6)
		end
end

function x270009_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270009_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270009_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270009_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270009_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270009_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270009_var_QuestName.."！", 0, 3)
				if x270009_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270009_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270009_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270009_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270009_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270009_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270009_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270009_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270009_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270009_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270009_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270009_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270009_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270009_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270009_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270009_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270009_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270009_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270009_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270009_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270009_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270009_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270009_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270009_var_QuestId, varState, -1 )
		end
end

function x270009_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270009_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270009_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270009_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270009_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270009_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270009_ProcScneneTimer(varMap)
	if x270009_var_doing==1   then
		if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 2   then
						x270009_var_doing = 2
						NpcTalk(varMap, x270009_var_budaiheshang, "波斯人的走狗，拿个破盒子来试探我们你以为我们看不出来吗？", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"布袋和尚：波斯人的走狗，拿个破盒子来试探我们你以为我们看不出来吗？",0,-1)
		end
	elseif x270009_var_doing==2   then
		if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 5   then
						x270009_var_doing = 3
						NpcTalk(varMap, x270009_var_kanshou, "小子，你一进门就发现你不对劲！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"明教弟子：小子，你一进门就发现你不对劲！",0,-1)
		end
	elseif x270009_var_doing == 3   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 7   then
						NpcTalk(varMap, x270009_var_kanshou2, "是啊，还敢过来领赏，老子倒要赏你个死法，让你选！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"明教弟子：是啊，还敢过来领赏，老子倒要赏你个死法，让你选！",0,-1)
        		x270009_var_doing =4
			end
	elseif x270009_var_doing == 4   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 10   then
						LuaScenceM2Near(varMap, x270009_var_acceptid,"明教弟子：波斯明教进攻了，大家快来！",0,-1)
						SetMonsterDir(varMap,x270009_var_budaiheshang,120)
						SetMonsterDir(varMap,x270009_var_kanshou,120)
						SetMonsterDir(varMap,x270009_var_kanshou2,120)
						NpcTalk(varMap, x270009_var_budaiheshang, "！！！！！", -1)
						NpcTalk(varMap, x270009_var_kanshou, "！！！！！", -1)
						NpcTalk(varMap, x270009_var_kanshou2, "！！！！！", -1)
						x270009_var_guozixing =FindMonsterByGUID( varMap,139832)
						x270009_var_liufutong =FindMonsterByGUID( varMap,139833)
						x270009_var_yangdingtian =FindMonsterByGUID( varMap,139806)
						x270009_var_yangxiao =FindMonsterByGUID( varMap,139808)
						x270009_var_fanyao =FindMonsterByGUID( varMap,139807)
						x270009_var_mingjiaodizi =FindMonsterByGUID( varMap,139802)
						x270009_var_mingjiaodizi2 =FindMonsterByGUID( varMap,139803)
						x270009_var_mingjiaodizi3 =FindMonsterByGUID( varMap,139809)
						x270009_var_mingjiaodizi4 =FindMonsterByGUID( varMap,139810)
						SetPatrolId(varMap, x270009_var_guozixing, 7)
						SetPatrolId(varMap, x270009_var_liufutong, 8)
						SetPatrolId(varMap, x270009_var_yangdingtian, 11)
						SetPatrolId(varMap, x270009_var_yangxiao, 10)
						SetPatrolId(varMap, x270009_var_fanyao, 9)
						SetPatrolId(varMap, x270009_var_mingjiaodizi, 5)
						SetPatrolId(varMap, x270009_var_mingjiaodizi2, 6)
						SetPatrolId(varMap, x270009_var_mingjiaodizi3, 3)
						SetPatrolId(varMap, x270009_var_mingjiaodizi4, 4)
						x270009_var_doing =5
			end
	elseif x270009_var_doing == 5   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 13   then
						NpcTalk(varMap, x270009_var_budaiheshang, "什么，这么快就来了？你们快去！", -1)
            LuaScenceM2Near(varMap,  x270009_var_acceptid,"布袋和尚：什么，这么快就来了？你们快去！",0,-1)
						x270009_var_doing =6
			end
	elseif x270009_var_doing == 6   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 16   then
						x270009_var_doing =7
						NpcTalk(varMap, x270009_var_kanshou2, "是！", -1)
						NpcTalk(varMap, x270009_var_kanshou, "是！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"明教弟子：是",0,-1)
						SetPatrolId(varMap, x270009_var_kanshou, 1)
						SetPatrolId(varMap, x270009_var_kanshou2, 2)
			end
	elseif x270009_var_doing == 7   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 18   then
						x270009_var_doing =8
						NpcTalk(varMap, x270009_var_budaiheshang, "哼！以为我们中毒就对付不了你们了吗？", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"布袋和尚：哼！以为我们中毒就对付不了你们了吗？",0,-1)
			end
	elseif x270009_var_doing == 8   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 21   then
						x270009_var_doing =9
						NpcTalk(varMap, x270009_var_budaiheshang, "走，我带你去见你的主子去！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"布袋和尚：走，我带你去见你的主子去！",0,-1)
            SendSpecificImpactToUnit(varMap, x270009_var_budaiheshang, x270009_var_budaiheshang, x270009_var_budaiheshang, 1281, 0);
            x270009_var_suduona=CreateMonster(varMap, 1608,67.4494,258.27,3,1,-1,-1,20,-1,0,"苏多娜","波斯明教")
						x270009_var_bosijiaotu=CreateMonster(varMap, 1609,68.1070,256.22,3,1,-1,-1,20,-1,0)
						x270009_var_bosijiaotu2=CreateMonster(varMap, 1609,68.1941,254.3468,3,1,-1,-1,20,-1,0)
						x270009_var_bosijiaotu3=CreateMonster(varMap, 1609,68.1436,260.37,3,1,-1,-1,20,-1,0)
						x270009_var_bosijiaotu4=CreateMonster(varMap, 1609,68,262.3472,3,1,-1,-1,20,-1,0)
						SetPatrolId(varMap, x270009_var_suduona, 12)
						SetPatrolId(varMap, x270009_var_bosijiaotu, 13)
						SetPatrolId(varMap, x270009_var_bosijiaotu2, 14)
						SetPatrolId(varMap, x270009_var_bosijiaotu3, 15)
						SetPatrolId(varMap, x270009_var_bosijiaotu4, 16)
			end
	elseif x270009_var_doing == 9   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 22   then
						x270009_var_doing =10
						if IsHaveQuest(varMap,x270009_var_acceptid, x270009_var_QuestId) > 0 then
								SetPos(varMap,x270009_var_acceptid,52,265)
						end
						SetPos(varMap,x270009_var_budaiheshang,51,263)
			end
	elseif x270009_var_doing == 10   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 25   then
						x270009_var_doing =11
						NpcTalk(varMap, x270009_var_suduona, "小女子苏多娜给阳教主请安！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"苏多娜：小女子苏多娜给阳教主请安！",0,-1)
			end
	elseif x270009_var_doing == 11   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 28   then
						x270009_var_doing =12
						NpcTalk(varMap, x270009_var_yangdingtian, "废话少说，你们擅闯明教圣地，所为何事？", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"阳顶天：废话少说，你们擅闯明教圣地，所为何事？",0,-1)
			end
	elseif x270009_var_doing == 12   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 31   then
						x270009_var_doing =13
						NpcTalk(varMap, x270009_var_suduona, "好，教主如此爽快，我就不绕弯子了。我们特地来收回我教圣物“圣火令”的！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"苏多娜：好，教主如此爽快，我就不绕弯子了。我们特地来收回我教圣物“圣火令”的！",0,-1)
			end
	elseif x270009_var_doing == 13   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 34   then
						x270009_var_doing =14
						NpcTalk(varMap, x270009_var_suduona, "我们拿到圣火令打开它却发现缺少了一样东西，我想这东西一定在阳教主身上。", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"苏多娜：我们拿到圣火令打开它却发现缺少了一样东西,我想这东西一定在阳教主身上。",0,-1)
			end
	elseif x270009_var_doing == 14   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 37   then
						x270009_var_doing =15
						NpcTalk(varMap, x270009_var_yangdingtian, "什么？这么说本教失踪的圣火令是被你等拿走了，那休怪阳某人不客气了。", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"阳顶天：什么？这么说本教失踪的圣火令是被你等拿走了，那休怪阳某人不客气了。",0,-1)
			end
	elseif x270009_var_doing == 15   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 40   then
						x270009_var_doing =16
						NpcTalk(varMap, x270009_var_budaiheshang, "臭娘们，来了你就别想走了。留在这里让我破破戒！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"布袋和尚：臭娘们，来了你就别想走了。留在这里让我破破戒！",0,-1)
			end
	elseif x270009_var_doing == 16   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 43   then
						x270009_var_doing =17
						NpcTalk(varMap, x270009_var_suduona, "哼，还敢嘴硬！你们中毒已深，现在恐怕连站都站不稳了吧。", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"苏多娜：哼，还敢嘴硬！你们中毒已深，现在恐怕连站都站不稳了吧。",0,-1)
			end
	elseif x270009_var_doing == 17   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 46   then
						x270009_var_doing =18
						NpcTalk(varMap, x270009_var_yangdingtian, "是吗？你这么确认？", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"阳顶天：是吗？你这么确认？",0,-1)
			end
	elseif x270009_var_doing == 18   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 48   then
						x270009_var_doing =19
						SendSpecificImpactToUnit(varMap, x270009_var_yangdingtian, x270009_var_yangdingtian, x270009_var_yangdingtian, 3101, 0);
						SendSpecificImpactToUnit(varMap, x270009_var_yangdingtian, x270009_var_yangdingtian, x270009_var_bosijiaotu, 3060, 0);
						SendSpecificImpactToUnit(varMap, x270009_var_yangdingtian, x270009_var_yangdingtian, x270009_var_bosijiaotu2, 3060, 0);
			end
	elseif x270009_var_doing == 19   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 50   then
						x270009_var_doing =20
						NpcTalk(varMap, x270009_var_suduona, "什么？难道毒还没有发作？", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"苏多娜：什么？难道毒还没有发作？",0,-1)
			end
	elseif x270009_var_doing == 20   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 53   then
						x270009_var_doing =21
						NpcTalk(varMap, x270009_var_suduona, "小子，原来你是明教的人！居然被你给骗了，我们走！", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"苏多娜：小子，原来你是明教的人！居然被你给骗了，我们走！",0,-1)
			end
	elseif x270009_var_doing == 21   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 56   then
						x270009_var_doing =22
						NpcTalk(varMap, x270009_var_yangdingtian, "看来我们误会这位少侠了，他并不是波斯的人。", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"阳顶天：看来我们误会这位少侠了，他并不是波斯的人。",0,-1)
            DeleteMonster (varMap,x270009_var_bosijiaotu3 )
						DeleteMonster (varMap,x270009_var_bosijiaotu4 )
						DeleteMonster (varMap,x270009_var_suduona )
			end
	elseif x270009_var_doing == 22   then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 60   then
						x270009_var_doing =23
						NpcTalk(varMap, x270009_var_yangdingtian, "少侠！我们误以为你是波斯派来的。现在事情已经澄清了，恰好我明教正逢大难，希望你能助我教渡过难关。", -1)
            LuaScenceM2Near(varMap, x270009_var_acceptid,"阳顶天：少侠！我们误以为你是波斯派来的。现在事情已经澄清了，恰好我明教正逢大难，希望你能助我教渡过难关。",0,-1)
			end
	elseif x270009_var_doing==23 then
			if GetCurrentTime() - x270009_var_PROTECTINFO.StartTime >= 65   then
					if IsHaveQuest(varMap,x270009_var_acceptid, x270009_var_QuestId) > 0 then
									local varQuestIdx = GetQuestIndexByID(varMap, x270009_var_acceptid, x270009_var_QuestId)
									SetQuestByIndex(varMap,x270009_var_acceptid,varQuestIdx,0,1)
									SetQuestByIndex(varMap,x270009_var_acceptid,varQuestIdx,7,1)
									StartTalkTask(varMap)
									TalkAppendString(varMap,format("探听清楚明教的状况   %d/1", GetQuestParam(varMap,x270009_var_acceptid,varQuestIdx,0) ))
									StopTalkTask(varMap)
									DeliverTalkTips(varMap,x270009_var_acceptid)
									CancelSpecificImpact(varMap,x270009_var_acceptid,8700)
					end
				x270009_var_doing=24
				x270009_CloseTimer(varMap, x270009_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270009_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270009_var_doing =0
	x270009_var_acceptid =0
	x270009_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	DeleteMonster (varMap,x270009_var_kanshou )
	DeleteMonster (varMap,x270009_var_kanshou2 )
	SetPatrolId(varMap, x270009_var_guozixing, -1)
	SetPatrolId(varMap, x270009_var_liufutong, -1)
	SetPatrolId(varMap, x270009_var_yangdingtian, -1)
	SetPatrolId(varMap, x270009_var_yangxiao, -1)
	SetPatrolId(varMap, x270009_var_fanyao, -1)
	SetPatrolId(varMap, x270009_var_mingjiaodizi, -1)
	SetPatrolId(varMap, x270009_var_mingjiaodizi2, -1)
	SetPatrolId(varMap, x270009_var_mingjiaodizi3, -1)
	SetPatrolId(varMap, x270009_var_mingjiaodizi4, -1)
	SetPos(varMap,x270009_var_budaiheshang,22.49,311.9)
	SetPos(varMap,x270009_var_guozixing,42.8,254.6)
	SetPos(varMap,x270009_var_liufutong,47.5,254.7)
	SetPos(varMap,x270009_var_yangdingtian,45.1,255)
	SetPos(varMap,x270009_var_yangxiao,33.8,259)
	SetPos(varMap,x270009_var_fanyao,36.6,259.4)
	SetPos(varMap,x270009_var_mingjiaodizi,45.7,274.9)
	SetPos(varMap,x270009_var_mingjiaodizi2,49.7,274.8)
	SetPos(varMap,x270009_var_mingjiaodizi3,45.4,305.4)
	SetPos(varMap,x270009_var_mingjiaodizi4,50.3,305.4)
	SetMonsterDir(varMap,x270009_var_budaiheshang,90)
	SetMonsterDir(varMap,x270009_var_guozixing,0)
	SetMonsterDir(varMap,x270009_var_liufutong,0)
	SetMonsterDir(varMap,x270009_var_yangdingtian,0)
	SetMonsterDir(varMap,x270009_var_yangxiao,0)
	SetMonsterDir(varMap,x270009_var_fanyao,0)
	SetMonsterDir(varMap,x270009_var_mingjiaodizi,0)
	SetMonsterDir(varMap,x270009_var_mingjiaodizi2,0)
	SetMonsterDir(varMap,x270009_var_mingjiaodizi3,0)
	SetMonsterDir(varMap,x270009_var_mingjiaodizi4,0)
	
end

function x270009_ProcQuestLogRefresh( varMap,varPlayer,varQuest)

    
    
		

end
