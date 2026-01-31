

--DECLARE_QUEST_INFO_START--
x270000_var_FileId = 270000
x270000_var_QuestIdPre =3532
x270000_var_QuestId = 3533
x270000_var_LevelLess	= 	76 
x270000_var_QuestIdNext = 3534
x270000_var_Name	={}
x270000_var_ExtTarget={{type=20,n=1,target="探听清楚明教的状况"}}
x270000_var_QuestName="【主线】非友即敌"
x270000_var_QuestInfo="\t我明教一向独来独往，从不与各派为敌，今日之事，这位朋友，你却怨不得我了！\n\t拿好，这便是布袋和尚给你备下的厚礼！"  
x270000_var_QuestTarget=""		
x270000_var_QuestCompleted="\t#y@myname#w大侠，阳某人已派人查过你的来历和为人，此事确实是我们误会了你，只因半个月前，波斯明教教主突然上门拜访，宣言我教至宝圣火令乃波斯明教所有，要求我们归还圣火令给波斯明教。我教的镇教之宝岂可拱手让人？当即我便拒绝了。"					
x270000_var_ContinueInfo="\t这些波斯人，莫不是吃了熊心豹子胆，居然敢闯入我们这里撒野？"
x270000_var_QuestHelp =	""
x270000_var_DemandItem ={}
x270000_var_BonusMoney1 =0
x270000_var_BonusMoney2 =0
x270000_var_BonusMoney3 =0
x270000_var_BonusMoney4 =0
x270000_var_BonusMoney5 =86
x270000_var_BonusMoney6 =0
x270000_var_BonusItem	=	{}
x270000_var_BonusChoiceItem ={}
x270000_var_ExpBonus = 380000
x270000_var_doing = 0
x270000_var_acceptid =-1
x270000_var_kanshou = -1
x270000_var_kanshou2 = -1
x270000_var_budaiheshang = -1
x270000_var_liufutong = -1
x270000_var_guozixing = -1
x270000_var_yangdingtian = -1
x270000_var_yangxiao = -1
x270000_var_fanyao = -1
x270000_var_suduona = -1
x270000_var_bosijiaotu = -1
x270000_var_bosijiaotu2 = -1
x270000_var_bosijiaotu3 = -1
x270000_var_bosijiaotu4 = -1
x270000_var_mingjiaodizi =-1
x270000_var_mingjiaodizi2 =-1
x270000_var_hanshantong =-1
x270000_var_xushouhui =-1
x270000_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x270000_var_NpcGUID ={{ guid = 139806, varName = "阳顶天"} }
--DECLARE_QUEST_INFO_STOP--


function x270000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270000_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270000_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x270000_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270000_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270000_var_QuestId, varState, -1 )
		end
	end
end

function x270000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270000_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270000_var_ExpBonus )
		end
		if x270000_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270000_var_BonusMoney1 )
		end
		if x270000_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270000_var_BonusMoney2 )
		end
		if x270000_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270000_var_BonusMoney3 )
		end
		if x270000_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270000_var_BonusMoney4 )
		end
		if x270000_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270000_var_BonusMoney5 )
		end
		if x270000_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270000_var_BonusMoney6 )
		end
		for varI, item in x270000_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270000_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270000_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270000_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270000_var_QuestId) > 0 then
			if x270000_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270000_var_QuestName)
						TalkAppendString(varMap,x270000_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270000_var_FileId, x270000_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270000_var_QuestName)
						TalkAppendString(varMap,x270000_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270000_var_FileId, x270000_var_QuestId);
			end
  elseif x270000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270000_var_QuestName)
			TalkAppendString(varMap,x270000_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270000_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270000_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270000_var_QuestHelp )
			end
			x270000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270000_var_FileId, x270000_var_QuestId);
	else
			Msg2Player(varMap, varPlayer, "您现在的状态无法接受此任务！", 0, 3)
  end
	
end


function x270000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270000_var_QuestIdPre)> 0 then
				if IsHaveQuest(varMap,varPlayer, 7537) > 0 then
						return 0
				elseif IsHaveQuest(varMap,varPlayer, 7538) > 0 then
						return 0
				elseif IsHaveQuest(varMap,varPlayer, 7539) > 0 then
						return 0
				elseif IsHaveSpecificImpact(varMap, varPlayer, 7516) > 0 then
						return 0
				elseif IsHaveSpecificImpact(varMap, varPlayer, 7517) > 0 then
						return 0
				end
				return 1
		end
		return 0

end

function x270000_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270000_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
	
end

function x270000_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270000_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270000_var_QuestId  )
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
		if x270000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				if x270000_var_doing == 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270000_var_QuestId, x270000_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270000_Msg2toplayer( varMap, varPlayer,0)
		  			x270000_var_PROTECTINFO.StartTime = GetCurrentTime()
						x270000_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270000, "ProcScneneTimer", 1)
						if x270000_var_PROTECTINFO.ScneneTimerIndex >= 0 then
								x270000_var_doing = 1
								x270000_var_acceptid = varPlayer
								x270000_var_kanshou=CreateMonster(varMap, 1610,63.6096,254.8053,3,1,-1,-1,20,65000,330,"明教弟子")
								x270000_var_kanshou2=CreateMonster(varMap, 1610,59.0725,256.2261,3,1,-1,-1,20,65000,30,"明教弟子")
								x270000_var_budaiheshang =FindMonsterByGUID( varMap,139823)
								SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8700, 0);
								Msg2Player(varMap, varPlayer, "你被点中穴位装在了一个大口袋里！", 0, 3)
								if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
									MonsterDoAction(varMap, x270000_var_budaiheshang, 2, -1) 
								end
						end
		  		end
				else
					Msg2Player(varMap, varPlayer, "任务暂时无法接受！", 0, 3)
				end
		else
				Msg2Player(varMap, varPlayer, "您现在的状态无法接受此任务！", 0, 3)
	 	end                                                                    
	     
end


function x270000_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270000_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270000_var_QuestId)
	  x270000_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270000_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270000_var_BonusChoiceItem do
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

function x270000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270000_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270000_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270000_var_QuestId) > 0 then
				x270000_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270000_var_QuestId)
				x270000_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270000_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270000_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270000_var_QuestIdNext )	
end

function x270000_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270000_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270000_var_ExpBonus);
  	end
		if x270000_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270000_var_BonusMoney1 )
	  end
		if x270000_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270000_var_BonusMoney2 )
	  end
		if x270000_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270000_var_BonusMoney3 )
		end
		if x270000_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270000_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270000_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270000_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270000_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270000_var_BonusMoney6)
		end
end

function x270000_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270000_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270000_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270000_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270000_var_QuestName.."！", 0, 3)
				if x270000_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270000_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270000_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270000_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270000_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270000_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270000_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270000_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270000_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270000_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270000_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270000_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270000_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270000_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270000_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270000_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270000_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270000_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270000_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270000_var_QuestId, varState, -1 )
		end
end

function x270000_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270000_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270000_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270000_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270000_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270000_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270000_ProcScneneTimer(varMap)
	if x270000_var_doing==1   then
		if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 2   then
						x270000_var_doing = 2
						if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
								NpcTalk(varMap, x270000_var_budaiheshang, "波斯人的走狗，拿个破盒子来试探我们你以为我们看不出来吗？", -1)
						end
		end
	elseif x270000_var_doing==2   then
		if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 4   then
						x270000_var_doing = 3
						if IsObjValid (varMap,x270000_var_kanshou) == 1 then
								NpcTalk(varMap, x270000_var_kanshou, "小样，你一上山就发现你不对劲！", -1)								
						end
		end
	elseif x270000_var_doing == 3   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 7   then
        		x270000_var_doing =4
						if IsObjValid (varMap,x270000_var_kanshou2) == 1 then
								NpcTalk(varMap, x270000_var_kanshou2, "是啊，还敢过来领赏，老子倒要赏你个死法，让你选！", -1)
						end
			end
	elseif x270000_var_doing == 4   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 10   then
						x270000_var_doing =5
						if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
								SetMonsterDir(varMap,x270000_var_budaiheshang,120)
								NpcTalk(varMap, x270000_var_budaiheshang, "！！！！！", -1)
						end
						if IsObjValid (varMap,x270000_var_kanshou) == 1 then
								SetMonsterDir(varMap,x270000_var_kanshou,20)
								NpcTalk(varMap, x270000_var_kanshou, "！！！！！", -1)



						end
						if IsObjValid (varMap,x270000_var_kanshou2) == 1 then
								SetMonsterDir(varMap,x270000_var_kanshou2,50)
								NpcTalk(varMap, x270000_var_kanshou2, "！！！！！", -1)
						end
            x270000_var_guozixing =FindMonsterByGUID( varMap,139832)
						x270000_var_liufutong =FindMonsterByGUID( varMap,139833)
						x270000_var_yangdingtian =FindMonsterByGUID( varMap,139806)
						x270000_var_yangxiao =FindMonsterByGUID( varMap,139808)
						x270000_var_fanyao =FindMonsterByGUID( varMap,139807)
						x270000_var_mingjiaodizi =FindMonsterByGUID( varMap,139802)
						x270000_var_mingjiaodizi2 =FindMonsterByGUID( varMap,139803)
						x270000_var_hanshantong =FindMonsterByGUID( varMap,139818)
						x270000_var_xushouhui =FindMonsterByGUID( varMap,139830)
						if IsObjValid (varMap,x270000_var_guozixing) == 1 then
								SetPatrolId(varMap, x270000_var_guozixing, 5)
						end
						if IsObjValid (varMap,x270000_var_liufutong) == 1 then
								SetPatrolId(varMap, x270000_var_liufutong, 6)
						end												
						if IsObjValid (varMap,x270000_var_yangdingtian) == 1 then
								SetPatrolId(varMap, x270000_var_yangdingtian, 11)

						end
						if IsObjValid (varMap,x270000_var_yangxiao) == 1 then
								SetPatrolId(varMap, x270000_var_yangxiao, 10)
						end
						if IsObjValid (varMap,x270000_var_fanyao) == 1 then
								SetPatrolId(varMap, x270000_var_fanyao, 9)
						end
						if IsObjValid (varMap,x270000_var_mingjiaodizi) == 1 then
								SetPatrolId(varMap, x270000_var_mingjiaodizi, 4)
						end
						if IsObjValid (varMap,x270000_var_mingjiaodizi2) == 1 then
								SetPatrolId(varMap, x270000_var_mingjiaodizi2, 4)
						end
						if IsObjValid (varMap,x270000_var_hanshantong) == 1 then
								SetPatrolId(varMap, x270000_var_hanshantong, 8)
						end
						if IsObjValid (varMap,x270000_var_xushouhui) == 1 then
								SetPatrolId(varMap, x270000_var_xushouhui, 7)
						end
			end
	elseif x270000_var_doing == 5   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 13   then
				x270000_var_doing =6
				if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
						NpcTalk(varMap, x270000_var_budaiheshang, "什么，这么快就来了？你们快去！", -1)
				end
			end
	elseif x270000_var_doing == 6   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 16   then
						x270000_var_doing =7
						if IsObjValid (varMap,x270000_var_kanshou2) == 1 then
								NpcTalk(varMap, x270000_var_kanshou2, "是！", -1)
						end
						if IsObjValid (varMap,x270000_var_kanshou) == 1 then
								NpcTalk(varMap, x270000_var_kanshou, "是！", -1)
						end
						if IsObjValid (varMap,x270000_var_kanshou) == 1 then
								SetPatrolId(varMap, x270000_var_kanshou, 1)
						end
						if IsObjValid (varMap,x270000_var_kanshou2) == 1 then
								SetPatrolId(varMap, x270000_var_kanshou2, 2)
						end
			end
	elseif x270000_var_doing == 7   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 18   then
						x270000_var_doing =8
						if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
								NpcTalk(varMap, x270000_var_budaiheshang, "哼！以为我们中毒就对付不了你们了吗？", -1)
						end
			end
	elseif x270000_var_doing == 8   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 21   then
						x270000_var_doing =9
						if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
								NpcTalk(varMap, x270000_var_budaiheshang, "走，我带你去见你的主子去！", -1)
						end
            x270000_var_suduona=CreateMonster(varMap, 1608,105.1726,158.7841,3,1,-1,-1,20,36000,0,"苏多娜","波斯明教")
						x270000_var_bosijiaotu=CreateMonster(varMap, 1609,102.2551,160.5167,3,1,-1,-1,20,36000,0)
						x270000_var_bosijiaotu2=CreateMonster(varMap, 1609,103.6684,160.6781,3,1,-1,-1,20,36000,0)
						x270000_var_bosijiaotu3=CreateMonster(varMap, 1609,106.7171,160.4448,3,1,-1,-1,20,36000,0)
						x270000_var_bosijiaotu4=CreateMonster(varMap, 1609,108.3455,160.5882,3,1,-1,-1,20,36000,0)
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								SetPatrolId(varMap, x270000_var_suduona, 12)
						end
						if IsObjValid (varMap,x270000_var_bosijiaotu) == 1 then
								SetPatrolId(varMap, x270000_var_bosijiaotu, 14)
						end
						if IsObjValid (varMap,x270000_var_bosijiaotu2) == 1 then
								SetPatrolId(varMap, x270000_var_bosijiaotu2, 13)
						end
						if IsObjValid (varMap,x270000_var_bosijiaotu3) == 1 then
								SetPatrolId(varMap, x270000_var_bosijiaotu3, 15)
						end
						if IsObjValid (varMap,x270000_var_bosijiaotu4) == 1 then
								SetPatrolId(varMap, x270000_var_bosijiaotu4, 16)
						end
			end
	elseif x270000_var_doing == 9   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 22   then
						x270000_var_doing =10
						if IsPlayerStateNormal(varMap,x270000_var_acceptid) ==1 then
							if IsHaveQuest(varMap,x270000_var_acceptid, x270000_var_QuestId) > 0 then
								SetPos(varMap,x270000_var_acceptid,100,178)
							end
						end
						if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
								SetPos(varMap,x270000_var_budaiheshang,101,180)
								SetMonsterDir(varMap,x270000_var_budaiheshang,190)
								SetMonsterDir(varMap,x270000_var_yangdingtian,180)
								SetMonsterDir(varMap,x270000_var_yangxiao,140)
								SetMonsterDir(varMap,x270000_var_fanyao,185)
								SetMonsterDir(varMap,x270000_var_mingjiaodizi,140)
								SetMonsterDir(varMap,x270000_var_mingjiaodizi2,140)
								SetMonsterDir(varMap,x270000_var_hanshantong,340)
								SetMonsterDir(varMap,x270000_var_xushouhui,120)
						end
			end
	elseif x270000_var_doing == 10   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 25   then
						x270000_var_doing =11
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								NpcTalk(varMap, x270000_var_suduona, "小女子苏多娜给阳教主请安！", -1)
						end
			end
	elseif x270000_var_doing == 11   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 28   then
						x270000_var_doing =12
						if IsObjValid (varMap,x270000_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270000_var_yangdingtian, "废话少说，你们擅闯明教圣地，所为何事？", -1)
						end
			end
	elseif x270000_var_doing == 12   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 31   then
						x270000_var_doing =13
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								NpcTalk(varMap, x270000_var_suduona, "好，教主如此爽快，我就不绕弯子了。我们特地来收回我教圣物“圣火令”的！", -1)
						end
			end
	elseif x270000_var_doing == 13   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 34   then
						x270000_var_doing =14
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								NpcTalk(varMap, x270000_var_suduona, "我们拿到圣火令打开它却发现缺少了一样东西，我想这东西一定在阳教主身上。", -1)
						end
			end
	elseif x270000_var_doing == 14   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 37   then
						x270000_var_doing =15
						if IsObjValid (varMap,x270000_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270000_var_yangdingtian, "什么？这么说本教失踪的圣火令是被你等拿走了，那休怪阳某人不客气了。", -1)
						end
			end
	elseif x270000_var_doing == 15   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 40   then
						x270000_var_doing =16
						if IsObjValid (varMap,x270000_var_budaiheshang) == 1 then
								NpcTalk(varMap, x270000_var_budaiheshang, "臭娘们，来了你就别想走了。留在这里让我破破戒！", -1)
						end
			end
	elseif x270000_var_doing == 16   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 43   then
						x270000_var_doing =17
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								NpcTalk(varMap, x270000_var_suduona, "哼，还敢嘴硬！你们中毒已深，现在恐怕连站都站不稳了吧。", -1)
						end
			end
	elseif x270000_var_doing == 17   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 46   then
						x270000_var_doing =18
						if IsObjValid (varMap,x270000_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270000_var_yangdingtian, "是吗？你这么确认？", -1)
						end
			end
	elseif x270000_var_doing == 18   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 48   then
						x270000_var_doing =19
						if IsObjValid (varMap,x270000_var_bosijiaotu) == 1 then
								SendSpecificImpactToUnit(varMap, x270000_var_bosijiaotu, x270000_var_bosijiaotu, x270000_var_bosijiaotu, 3060, 0);
						end
						if IsObjValid (varMap,x270000_var_bosijiaotu2) == 1 then
								SendSpecificImpactToUnit(varMap, x270000_var_bosijiaotu2, x270000_var_bosijiaotu2, x270000_var_bosijiaotu2, 3060, 0);
						end
			end
	elseif x270000_var_doing == 19   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 50   then
						x270000_var_doing =20
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								NpcTalk(varMap, x270000_var_suduona, "什么？难道毒还没有发作？", -1)
						end
			end
	elseif x270000_var_doing == 20   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 53   then
						x270000_var_doing =21
						if IsObjValid (varMap,x270000_var_suduona) == 1 then
								NpcTalk(varMap, x270000_var_suduona, "小子，原来你是明教的人！居然被你给骗了，我们走！", -1)
						end
			end
	elseif x270000_var_doing == 21   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 56   then
						x270000_var_doing =22
						if IsObjValid (varMap,x270000_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270000_var_yangdingtian, "看来我们误会这位少侠了，他并不是波斯的人。", -1)
						end
			end
	elseif x270000_var_doing == 22   then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 60   then
						x270000_var_doing =23
						if IsObjValid (varMap,x270000_var_yangdingtian) == 1 then
								NpcTalk(varMap, x270000_var_yangdingtian, "少侠！我们误以为你是波斯派来的。现在事情已经澄清了，恰好我明教正逢大难，希望你能助我教渡过难关。", -1)
						end
			end
	elseif x270000_var_doing==23 then
			if GetCurrentTime() - x270000_var_PROTECTINFO.StartTime >= 65   then
				x270000_var_doing=24
				if IsPlayerStateNormal(varMap,x270000_var_acceptid) ==1 then
					if IsHaveQuest(varMap,x270000_var_acceptid, x270000_var_QuestId) > 0 then
									local varQuestIdx = GetQuestIndexByID(varMap, x270000_var_acceptid, x270000_var_QuestId)
									SetQuestByIndex(varMap,x270000_var_acceptid,varQuestIdx,0,1)
									SetQuestByIndex(varMap,x270000_var_acceptid,varQuestIdx,7,1)
									StartTalkTask(varMap)
									TalkAppendString(varMap,format("探听清楚明教的状况   %d/1", GetQuestParam(varMap,x270000_var_acceptid,varQuestIdx,0) ))
									StopTalkTask(varMap)
									DeliverTalkTips(varMap,x270000_var_acceptid)
									CancelSpecificImpact(varMap,x270000_var_acceptid,8700)
					end
				end
				x270000_CloseTimer(varMap, x270000_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270000_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270000_var_doing =0
	x270000_var_acceptid =-1
	x270000_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
	
	SetPatrolId(varMap, x270000_var_yangdingtian, -1)
	SetPatrolId(varMap, x270000_var_yangxiao, -1)
	SetPatrolId(varMap, x270000_var_fanyao, -1)
	SetPatrolId(varMap, x270000_var_mingjiaodizi, -1)
	SetPatrolId(varMap, x270000_var_mingjiaodizi2, -1)
	SetPatrolId(varMap, x270000_var_hanshantong, -1)
	SetPatrolId(varMap, x270000_var_xushouhui, -1)
	SetPos(varMap,x270000_var_budaiheshang,64,258)
	
	
	
	
	
	
	
	
	
	
	SetMonsterDir(varMap,x270000_var_budaiheshang,200)
	
	
	
	
	
	
	
	
	
	
end

function x270000_ProcQuestLogRefresh( varMap,varPlayer,varQuest)

    
    
		

end
