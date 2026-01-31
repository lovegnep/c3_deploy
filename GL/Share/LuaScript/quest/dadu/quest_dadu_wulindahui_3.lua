

--DECLARE_QUEST_INFO_START--
x270006_var_FileId = 270006
x270006_var_QuestIdPre =3572
x270006_var_QuestId = 3573
x270006_var_LevelLess	= 	77 
x270006_var_QuestIdNext = 3574
x270006_var_Name	={}
x270006_var_ExtTarget={{type=20,n=1,target="弄清事情真相"}}
x270006_var_QuestName="【主线】真相"
x270006_var_QuestInfo="\t我郭破虏行得正，站得直，从不做那些伤天害理之事，你若硬说是我所为，我也没有什么好解释的。\n\t多言无益，你请回吧，武林大会之时，我自会对此事有所交代。"  
x270006_var_QuestTarget=""		
x270006_var_QuestCompleted="\t苍天有眼！幸而智丈大师及时出现，我丐帮才保住了我丐帮百年侠义之名。否则我就是丐帮的千古罪人。"					
x270006_var_ContinueInfo="\t事情还没有弄清楚，大侠稍安勿躁！"
x270006_var_QuestHelp =	""
x270006_var_DemandItem ={}
x270006_var_BonusMoney1 =0
x270006_var_BonusMoney2 =0
x270006_var_BonusMoney3 =0
x270006_var_BonusMoney4 =0
x270006_var_BonusMoney5 =87
x270006_var_BonusMoney6 =0
x270006_var_BonusItem	=	{}
x270006_var_BonusChoiceItem ={}
x270006_var_ExpBonus = 540000
x270006_var_doing = 0
x270006_var_acceptid =-1
x270006_var_jiazhizhang = -1
x270006_var_guoponu = -1
x270006_var_heshang1 = -1
x270006_var_heshang2 =-1
x270006_var_heshang3 = -1
x270006_var_heshang4 = -1
x270006_var_zhangsanfeng = -1
x270006_var_fenglingshitai = -1
x270006_var_hezudao = -1
x270006_var_chenyouliang = -1
x270006_var_zhenzhizhang = -1
x270006_var_dingshangyi = -1
x270006_var_wangshisan = -1
x270006_var_lengxiaoqi = -1
x270006_var_lixuanyi = -1
x270006_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
--DECLARE_QUEST_INFO_STOP--


function x270006_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270006_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270006_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270006_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270006_var_QuestId, varState, -1 )
	end
end

function x270006_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270006_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270006_var_ExpBonus )
		end
		if x270006_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270006_var_BonusMoney1 )
		end
		if x270006_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270006_var_BonusMoney2 )
		end
		if x270006_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270006_var_BonusMoney3 )
		end
		if x270006_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270006_var_BonusMoney4 )
		end
		if x270006_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270006_var_BonusMoney5 )
		end
		if x270006_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270006_var_BonusMoney6 )
		end
		for varI, item in x270006_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270006_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270006_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270006_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270006_var_QuestId) > 0 then
			if x270006_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270006_var_QuestName)
						TalkAppendString(varMap,x270006_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270006_var_FileId, x270006_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270006_var_QuestName)
						TalkAppendString(varMap,x270006_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270006_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270006_var_FileId, x270006_var_QuestId);
			end
  elseif x270006_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270006_var_QuestName)
			TalkAppendString(varMap,x270006_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270006_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270006_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270006_var_QuestHelp )
			end
			x270006_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270006_var_FileId, x270006_var_QuestId);
  end
	
end


function x270006_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270006_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270006_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270006_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
	
end

function x270006_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270006_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270006_var_QuestId  )
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
		if x270006_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				if x270006_var_doing == 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270006_var_QuestId, x270006_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270006_Msg2toplayer( varMap, varPlayer,0)
		  			x270006_var_PROTECTINFO.StartTime = GetCurrentTime()
						x270006_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270006, "ProcScneneTimer", 1)
						if x270006_var_PROTECTINFO.ScneneTimerIndex >= 0 then
								x270006_var_doing = 1
								x270006_var_acceptid = varPlayer
								x270006_var_jiazhizhang=CreateMonster(varMap, 31,73,61,3,1,-1,-1,20,78000,270,"假智丈禅师")
								x270006_var_heshang1=CreateMonster(varMap, 1059,72,62,3,1,-1,-1,20,93000,270,"空寂")
								x270006_var_heshang2=CreateMonster(varMap, 1059,71,63,3,1,-1,-1,20,93000,270,"空色")
								x270006_var_heshang3=CreateMonster(varMap, 1059,71,60,3,1,-1,-1,20,93000,270,"空思")
								x270006_var_heshang4=CreateMonster(varMap, 1059,71,59,3,1,-1,-1,20,93000,270,"空空")
								x270006_var_zhangsanfeng=CreateMonster(varMap, 419,72,51,3,1,-1,-1,20,93000,225,"张三丰")
								x270006_var_fenglingshitai=CreateMonster(varMap, 1646,71,53,3,1,-1,-1,20,93000,225,"风陵师太")
								x270006_var_hezudao=CreateMonster(varMap, 1942,71,50,3,1,-1,-1,20,93000,225,"何足道")
								if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
										SetPatrolId(varMap, x270006_var_jiazhizhang, 40)
								end
								if IsObjValid (varMap,x270006_var_heshang1) == 1 then
										SetPatrolId(varMap, x270006_var_heshang1, 41)
								end
								if IsObjValid (varMap,x270006_var_heshang2) == 1 then
										SetPatrolId(varMap, x270006_var_heshang2, 42)
								end
								if IsObjValid (varMap,x270006_var_heshang3) == 1 then
										SetPatrolId(varMap, x270006_var_heshang3, 43)
								end
								if IsObjValid (varMap,x270006_var_heshang4) == 1 then
										SetPatrolId(varMap, x270006_var_heshang4, 44)
								end
								if IsObjValid (varMap,x270006_var_zhangsanfeng) == 1 then
										SetPatrolId(varMap, x270006_var_zhangsanfeng, 45)
								end
								if IsObjValid (varMap,x270006_var_fenglingshitai) == 1 then
										SetPatrolId(varMap, x270006_var_fenglingshitai, 46)
								end
								if IsObjValid (varMap,x270006_var_hezudao) == 1 then
										SetPatrolId(varMap, x270006_var_hezudao, 47)
								end
								x270006_var_guoponu =FindMonsterByGUID( varMap,139331)
								x270006_var_dingshangyi =FindMonsterByGUID( varMap,139333)
								x270006_var_wangshisan =FindMonsterByGUID( varMap,139334)
								x270006_var_lengxiaoqi =FindMonsterByGUID( varMap,139335)
								x270006_var_lixuanyi =FindMonsterByGUID( varMap,139332)
						end
					end
				else
					Msg2Player(varMap, varPlayer, "任务暂时无法接受！", 0, 3)
				end

	 	end                                                                    
	     
end


function x270006_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270006_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270006_var_QuestId)
	  x270006_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270006_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270006_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270006_var_BonusChoiceItem do
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

function x270006_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270006_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270006_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270006_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270006_var_QuestId) > 0 then
				x270006_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270006_var_QuestId)
				x270006_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270006_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270006_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270006_var_QuestIdNext )	
end

function x270006_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270006_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270006_var_ExpBonus);
  	end
		if x270006_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270006_var_BonusMoney1 )
	  end
		if x270006_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270006_var_BonusMoney2 )
	  end
		if x270006_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270006_var_BonusMoney3 )
		end
		if x270006_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270006_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270006_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270006_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270006_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270006_var_BonusMoney6)
		end
end

function x270006_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270006_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270006_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270006_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270006_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270006_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270006_var_QuestName.."！", 0, 3)
				if x270006_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270006_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270006_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270006_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270006_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270006_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270006_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270006_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270006_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270006_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270006_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270006_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270006_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270006_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270006_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270006_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270006_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270006_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270006_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270006_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  
end

function x270006_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270006_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270006_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270006_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270006_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270006_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270006_ProcScneneTimer(varMap)
	if x270006_var_doing==1   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 9   then
						x270006_var_doing = 2
						if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
								NpcTalk(varMap, x270006_var_jiazhizhang, "郭帮主，贫僧有礼了", -1)
						end
		end
	elseif x270006_var_doing==2   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 12   then
						x270006_var_doing = 3
						if IsObjValid (varMap,x270006_var_guoponu) == 1 then
								NpcTalk(varMap, x270006_var_guoponu, "就算禅师不来，郭某也要去拜访。", -1)
						end
		end
	elseif x270006_var_doing==3   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 15   then
						x270006_var_doing = 4
						if IsObjValid (varMap,x270006_var_guoponu) == 1 then
								NpcTalk(varMap, x270006_var_guoponu, "近来发生的种种事情确不是丐帮所为。", -1)
						end
		end
	elseif x270006_var_doing==4   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 18   then
						x270006_var_doing = 5
						if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
								NpcTalk(varMap, x270006_var_jiazhizhang, "但是种种证据都指向丐帮，希望郭帮主给一个合理的说法。", -1)
						end
		end
	elseif x270006_var_doing==5   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 22   then
						x270006_var_doing = 6
						if IsObjValid (varMap,x270006_var_fenglingshitai) == 1 then
								NpcTalk(varMap, x270006_var_fenglingshitai, "什么说法，铁证如山，还我徒儿命来！", -1)
						end
		end
	elseif x270006_var_doing==6   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 25   then
						x270006_var_doing = 7
						if IsObjValid (varMap,x270006_var_dingshangyi) == 1 then
								NpcTalk(varMap, x270006_var_dingshangyi, "什么你徒儿的命，说事来的还是来找事来的？", -1)
						end
		end
	elseif x270006_var_doing==7   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 28   then
						x270006_var_doing = 8
						if IsObjValid (varMap,x270006_var_zhangsanfeng) == 1 then
								NpcTalk(varMap, x270006_var_zhangsanfeng, "师太冷静，贫道也相信事有蹊跷，让郭帮主把事情说明白吧。", -1)
						end
            x270006_var_chenyouliang=CreateMonster(varMap, 28,56,73,3,1,-1,-1,20,50000,80,"陈友谅")
            if IsObjValid (varMap,x270006_var_chenyouliang) == 1 then
            		SetPatrolId(varMap, x270006_var_chenyouliang, 48)
            end
		end
	elseif x270006_var_doing==8   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 31   then
						x270006_var_doing = 9
						if IsObjValid (varMap,x270006_var_chenyouliang) == 1 then
								NpcTalk(varMap, x270006_var_chenyouliang, "禀帮主，我丐帮几个分舵遭到武当，峨眉，昆仑等派的袭击！", -1)
						end
		end
	elseif x270006_var_doing==9   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 33   then
						x270006_var_doing = 10
						if IsObjValid (varMap,x270006_var_guoponu) == 1 then
								NpcTalk(varMap, x270006_var_guoponu, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_zhangsanfeng) == 1 then
								NpcTalk(varMap, x270006_var_zhangsanfeng, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_fenglingshitai) == 1 then
								NpcTalk(varMap, x270006_var_fenglingshitai, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_hezudao) == 1 then
								NpcTalk(varMap, x270006_var_hezudao, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_dingshangyi) == 1 then
								NpcTalk(varMap, x270006_var_dingshangyi, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_wangshisan) == 1 then
								NpcTalk(varMap, x270006_var_wangshisan, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_lengxiaoqi) == 1 then
								NpcTalk(varMap, x270006_var_lengxiaoqi, "！！", -1)
						end
						if IsObjValid (varMap,x270006_var_lixuanyi) == 1 then
								NpcTalk(varMap, x270006_var_lixuanyi, "！！", -1)
						end
		end
	elseif x270006_var_doing==10   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 35   then
						x270006_var_doing = 11
						if IsObjValid (varMap,x270006_var_lixuanyi) == 1 then
								NpcTalk(varMap, x270006_var_lixuanyi, "原来你们就是意图消灭我丐帮，好，那就来吧！", -1)
						end
		end
	elseif x270006_var_doing==11   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 36   then
						x270006_var_doing = 12
						if IsObjValid (varMap,x270006_var_guoponu) == 1 then
								NpcTalk(varMap, x270006_var_guoponu, "陈友谅，此事可当真？", -1)
						end
		end
	elseif x270006_var_doing==12   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 37   then
						x270006_var_doing = 13
						if IsObjValid (varMap,x270006_var_fenglingshitai) == 1 then
								NpcTalk(varMap, x270006_var_fenglingshitai, "你们别转移视线，快把事情说清楚。", -1)
						end
		end
	elseif x270006_var_doing==13   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 40   then
						x270006_var_doing = 14
						if IsObjValid (varMap,x270006_var_lixuanyi) == 1 then
								NpcTalk(varMap, x270006_var_lixuanyi, "说什么说？都欺负到家门口了！", -1)
						end
		end
	elseif x270006_var_doing==14   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 43   then
						x270006_var_doing = 15
						if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
								NpcTalk(varMap, x270006_var_jiazhizhang, "既然丐帮如此不配合，我们只能认为这些事情是丐帮所为了！", -1)
						end
            x270006_var_zhenzhizhang=CreateMonster(varMap, 31,60,64,3,1,-1,-1,20,44000,180,"真智丈禅师")
		end
	elseif x270006_var_doing==15   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 47   then
						x270006_var_doing = 16
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "善哉善哉！施主放下屠刀立地成佛！", -1)
						end
						if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
            		SetMonsterDir(varMap,x270006_var_jiazhizhang,0)
            end
		end
	elseif x270006_var_doing==16   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 50   then
						x270006_var_doing = 17
						if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
								NpcTalk(varMap, x270006_var_jiazhizhang, "你居然出来了！你想清楚了！？", -1)
						end
		end
	elseif x270006_var_doing==17   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 53   then
						x270006_var_doing = 18
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "贫僧不能因为一己之私而让丐帮蒙此大辱！徒儿们，对不起！", -1)
						end
		end
	elseif x270006_var_doing==18   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 56   then
						x270006_var_doing = 19
						if IsObjValid (varMap,x270006_var_heshang1) == 1 then
								NpcTalk(varMap, x270006_var_heshang1, "阿弥陀佛！", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang2) == 1 then
								NpcTalk(varMap, x270006_var_heshang2, "阿弥陀佛！", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang3) == 1 then
								NpcTalk(varMap, x270006_var_heshang3, "阿弥陀佛！", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang4) == 1 then
								NpcTalk(varMap, x270006_var_heshang4, "阿弥陀佛！", -1)
						end
		end
	elseif x270006_var_doing==19   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 60   then
						x270006_var_doing = 20
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "站在你们面前的不是智丈禅师，而是天魔教的教主！", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang1) == 1 then
            		SendSpecificImpactToUnit(varMap, x270006_var_heshang1, x270006_var_heshang1, x270006_var_heshang1, 3060, 0);
            end
		end
	elseif x270006_var_doing==20   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 64   then
						x270006_var_doing = 21
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "一个月前他给我寺僧人都下了毒，控制了整个寺院，以我的名义召开了武林大会。", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang2) == 1 then
            		SendSpecificImpactToUnit(varMap, x270006_var_heshang2, x270006_var_heshang2, x270006_var_heshang2, 3060, 0);
            end
		end
	elseif x270006_var_doing==21   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 68   then
						x270006_var_doing = 22
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "他的目的就是成为武林盟主，所以他嫁祸丐帮挑起武林纷争！", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang3) == 1 then
            		SendSpecificImpactToUnit(varMap, x270006_var_heshang3, x270006_var_heshang3, x270006_var_heshang3, 3060, 0);
            end
		end
	elseif x270006_var_doing==22   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 72   then
						x270006_var_doing = 23
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "贫僧因世俗杂念，记挂着弟子所以一直不能出来揭破他的谎言。", -1)
						end
						if IsObjValid (varMap,x270006_var_heshang4) == 1 then
            		SendSpecificImpactToUnit(varMap, x270006_var_heshang4, x270006_var_heshang4, x270006_var_heshang4, 3060, 0);
            end
		end
	elseif x270006_var_doing==23   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 75   then
						x270006_var_doing = 24
						if IsObjValid (varMap,x270006_var_jiazhizhang) == 1 then
								NpcTalk(varMap, x270006_var_jiazhizhang, "看见弟子死在面前感觉如何？智丈！我要让你付出代价！", -1)
						end
		end
	elseif x270006_var_doing==24   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 78   then
						x270006_var_doing = 25
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "郭帮主，贫僧向你赔罪了！", -1)
						end
		end
	elseif x270006_var_doing==25   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 81   then
						x270006_var_doing = 26
						if IsObjValid (varMap,x270006_var_guoponu) == 1 then
								NpcTalk(varMap, x270006_var_guoponu, "禅师的气度令郭某佩服万分，您去料理徒弟的事情吧，此间事交给郭某处理！", -1)
						end
		end
	elseif x270006_var_doing==26   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 84   then
						x270006_var_doing = 27
						if IsObjValid (varMap,x270006_var_zhenzhizhang) == 1 then
								NpcTalk(varMap, x270006_var_zhenzhizhang, "多谢郭帮主，贫僧先告辞了！", -1)
						end
		end
	elseif x270006_var_doing==27   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 87   then
						x270006_var_doing = 28
						if IsObjValid (varMap,x270006_var_zhangsanfeng) == 1 then
								NpcTalk(varMap, x270006_var_zhangsanfeng, "这次误会由我等引起，请见谅！他日如有差遣我等必赴汤蹈火，告辞！", -1)
						end
		end
	elseif x270006_var_doing==28   then
		if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 90   then
						x270006_var_doing = 29
						if IsObjValid (varMap,x270006_var_fenglingshitai) == 1 then
								NpcTalk(varMap, x270006_var_fenglingshitai, "告辞！", -1)
						end
						if IsObjValid (varMap,x270006_var_hezudao) == 1 then
								NpcTalk(varMap, x270006_var_hezudao, "告辞！", -1)
						end
		end
	elseif x270006_var_doing==29 then
			if GetCurrentTime() - x270006_var_PROTECTINFO.StartTime >= 92   then
				if IsPlayerStateNormal(varMap,x270006_var_acceptid) ==1 then
					if IsHaveQuest(varMap,x270006_var_acceptid, x270006_var_QuestId) > 0 then
						local nPlayerX, nPlayerZ = GetWorldPos(varMap, x270006_var_acceptid)
						local distance1 = floor(sqrt((58-nPlayerX)*(58-nPlayerX)+(63-nPlayerZ)*(63-nPlayerZ)))
						if distance1 <= 20 then
									local varQuestIdx = GetQuestIndexByID(varMap, x270006_var_acceptid, x270006_var_QuestId)
									SetQuestByIndex(varMap,x270006_var_acceptid,varQuestIdx,0,1)
									SetQuestByIndex(varMap,x270006_var_acceptid,varQuestIdx,7,1)
									StartTalkTask(varMap)
									TalkAppendString(varMap,format("弄清事情真相   %d/1", GetQuestParam(varMap,x270006_var_acceptid,varQuestIdx,0) ))
									StopTalkTask(varMap)
									DeliverTalkTips(varMap,x270006_var_acceptid)
						end
					end
				end
				x270006_var_doing=30
				x270006_CloseTimer(varMap, x270006_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270006_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270006_var_doing =0
	x270006_var_acceptid =-1
	x270006_var_jiazhizhang = -1
	x270006_var_guoponu = -1
	x270006_var_heshang1 = -1
	x270006_var_heshang2 =-1
	x270006_var_heshang3 = -1
	x270006_var_heshang4 = -1
	x270006_var_zhangsanfeng = -1
	x270006_var_fenglingshitai = -1
	x270006_var_hezudao = -1
	x270006_var_chenyouliang = -1
	x270006_var_zhenzhizhang = -1
	x270006_var_dingshangyi = -1
	x270006_var_wangshisan = -1
	x270006_var_lengxiaoqi = -1
	x270006_var_lixuanyi = -1
	x270006_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
end
