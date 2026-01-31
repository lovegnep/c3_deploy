

--DECLARE_QUEST_INFO_START--
x270001_var_FileId = 270001
x270001_var_QuestIdPre =3538
x270001_var_QuestId = 3539
x270001_var_LevelLess	= 	76 
x270001_var_QuestIdNext = 3534
x270001_var_Name	={}
x270001_var_ExtTarget={{type=20,n=1,target="藏在马房的@npc_141392处偷听谈话"}}
x270001_var_QuestName="【主线】同流合污"
x270001_var_QuestInfo="\t下毒和圣火令丢失这两件事，我们经过一番查访，乃是波斯明教所作。三天前我尾随几个身着怪异服饰的人，发现了波斯明教与另一个帮会几次秘密聚集同在一个地方不知密谋什么，这些人来历不明，很可能是对我教不利。我这就赶回总坛见教主，请你帮我继续监视他们的动静。\n\t记住，万不可打草惊蛇！一有收获，请即刻回报阳教主！"  
x270001_var_QuestTarget=""		
x270001_var_QuestCompleted="\t（阳顶天听罢“嘿嘿”冷笑说道）\n\t哼哼，想不到波斯明教竟沦落到与拜火教这种江湖匪类同流合污！这拜火教只不过是些江湖宵小汇集而成，不足为惧。可未料这波斯明教，为了解开圣火令的秘密，竟然对同根生的我们痛下杀手！"					
x270001_var_ContinueInfo="\t可有何发现？"
x270001_var_QuestHelp =	""
x270001_var_DemandItem ={}
x270001_var_BonusMoney1 =0
x270001_var_BonusMoney2 =0
x270001_var_BonusMoney3 =0
x270001_var_BonusMoney4 =0
x270001_var_BonusMoney5 =86
x270001_var_BonusMoney6 =0
x270001_var_BonusItem	=	{}
x270001_var_BonusChoiceItem ={}
x270001_var_ExpBonus = 400000
x270001_var_doing = 0
x270001_var_acceptid =0
x270001_var_bosimingjiao = -1
x270001_var_zhongtudiren = -1
x270001_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x270001_var_NpcGUID ={{ guid = 139806, varName = "阳顶天"} }
x270001_var_GroupPoint	={ {type=10,varId =13,target = "草堆"} } 
--DECLARE_QUEST_INFO_STOP--


function x270001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270001_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270001_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x270001_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270001_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270001_var_QuestId, varState, -1 )
		end
	end
end

function x270001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270001_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270001_var_ExpBonus )
		end
		if x270001_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270001_var_BonusMoney1 )
		end
		if x270001_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270001_var_BonusMoney2 )
		end
		if x270001_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270001_var_BonusMoney3 )
		end
		if x270001_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270001_var_BonusMoney4 )
		end
		if x270001_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270001_var_BonusMoney5 )
		end
		if x270001_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270001_var_BonusMoney6 )
		end
		for varI, item in x270001_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270001_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270001_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270001_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270001_var_QuestId) > 0 then
			if x270001_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270001_var_QuestName)
						TalkAppendString(varMap,x270001_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270001_var_FileId, x270001_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270001_var_QuestName)
						TalkAppendString(varMap,x270001_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270001_var_FileId, x270001_var_QuestId);
			end
  elseif x270001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270001_var_QuestName)
			TalkAppendString(varMap,x270001_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270001_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270001_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270001_var_QuestHelp )
			end
			x270001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270001_var_FileId, x270001_var_QuestId);
  end
	
end


function x270001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270001_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270001_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270001_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
end

function x270001_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270001_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270001_var_QuestId  )
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
		
		if x270001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270001_var_QuestId, x270001_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270001_Msg2toplayer( varMap, varPlayer,0)
						if x270001_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270001_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x270001_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270001_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270001_var_QuestId)
	  x270001_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270001_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270001_var_BonusChoiceItem do
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

function x270001_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270001_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270001_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270001_var_QuestId) > 0 then
				x270001_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270001_var_QuestId)
				x270001_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270001_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270001_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x270001_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270001_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270001_var_ExpBonus);
  	end
		if x270001_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270001_var_BonusMoney1 )
	  end
		if x270001_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270001_var_BonusMoney2 )
	  end
		if x270001_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270001_var_BonusMoney3 )
		end
		if x270001_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270001_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270001_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270001_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270001_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270001_var_BonusMoney6)
		end
end

function x270001_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270001_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270001_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270001_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270001_var_QuestName.."！", 0, 3)
				if x270001_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270001_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270001_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270001_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270001_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270001_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270001_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270001_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270001_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270001_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270001_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270001_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270001_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270001_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270001_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270001_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270001_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270001_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270001_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270001_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270001_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270001_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270001_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270001_var_QuestId, varState, -1 )
		end
end

function x270001_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270001_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270001_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270001_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270001_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270001_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270001_Growpoint( varMap, varPlayer,openorremove)
		if IsHaveQuest(varMap,varPlayer, x270001_var_QuestId) <= 0 then
				return 1
		end
		if IsHaveQuest(varMap,varPlayer, 7537) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveQuest(varMap,varPlayer, 7538) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveQuest(varMap,varPlayer, 7539) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveSpecificImpact(varMap, varPlayer, 7516) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveSpecificImpact(varMap, varPlayer, 7517) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		end
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270001_var_QuestId)
		if openorremove == 0 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then
					return 0
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t又小又脏的竹筐！\n\t你已经知道你想要的了，不用再到这里面去受罪了。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 1
			end
		elseif openorremove == 1 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then
				if x270001_var_doing == 0 then
					x270001_var_PROTECTINFO.StartTime = GetCurrentTime()
					x270001_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270001, "ProcScneneTimer", 1)
					if x270001_var_PROTECTINFO.ScneneTimerIndex >= 0 then
							x270001_var_doing = 1
							x270001_var_acceptid = varPlayer
							x270001_var_bosimingjiao=CreateMonster(varMap, 15004,31,180,3,1,-1,-1,20,41000,180,"波斯明教")
							x270001_var_zhongtudiren=CreateMonster(varMap, 89,42,195,3,1,-1,-1,20,41000,180,"中原人")
							if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
									SetPatrolId(varMap, x270001_var_bosimingjiao, 17)
							end
							if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
									SetPatrolId(varMap, x270001_var_zhongtudiren, 18)
							end
							return 1
					end
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t你刚刚要钻进竹筐，发现里面已经有一个人了")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 0
				end
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t又小又脏的竹筐！\n\t你已经知道你想要的了，不用再到这里面去受罪了。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 0
			end
		end
end

function x270001_ProcScneneTimer(varMap)
	if x270001_var_bosimingjiao < 0 then
			x270001_CloseTimer(varMap, x270001_var_PROTECTINFO.ScneneTimerIndex)
	elseif x270001_var_zhongtudiren < 0 then
			x270001_CloseTimer(varMap, x270001_var_PROTECTINFO.ScneneTimerIndex)
	end
	if x270001_var_doing==1   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime <= 1   then
			if IsPlayerStateNormal(varMap,x270001_var_acceptid) ==1 then
				SetPos(varMap,x270001_var_acceptid,35,193)
				SendSpecificImpactToUnit(varMap, x270001_var_acceptid, x270001_var_acceptid, x270001_var_acceptid, 8704, 0);
			end
		elseif GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 5   then
						x270001_var_doing = 2
						if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
								NpcTalk(varMap, x270001_var_zhongtudiren, "你来晚了！", -1)
						end
		end
	elseif x270001_var_doing==2   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 8   then
						x270001_var_doing = 3
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
								NpcTalk(varMap, x270001_var_bosimingjiao, "我们已经是用最快的速度了，召集所有人并不容易！", -1)
						end
		end
	elseif x270001_var_doing==3   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 11   then
						x270001_var_doing = 4
						if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
								NpcTalk(varMap, x270001_var_bosimingjiao, "还好，时间还来得及，阳顶天的功力应该没这么快恢复！", -1)
						end
		end
	elseif x270001_var_doing==4   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 14   then
						x270001_var_doing = 5
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
								NpcTalk(varMap, x270001_var_zhongtudiren, "我们的人还有一些没有到，我们就在北面的高地集合，等人都来了我们就发动进攻！", -1)
						end
		end
	elseif x270001_var_doing==5   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 17   then
						x270001_var_doing = 6
						if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
								NpcTalk(varMap, x270001_var_bosimingjiao, "别等了，夜长梦多，最好立刻进攻，有我乃颜军协助你怕什么！", -1)
						end
		end
	elseif x270001_var_doing==6   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 20   then
						x270001_var_doing = 7
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
								NpcTalk(varMap, x270001_var_zhongtudiren, "你不是说你的毒阳顶天他们是没办法解的吗？还是等人都来了妥当些好。", -1)
						end
		end
	elseif x270001_var_doing==7   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 23   then
						x270001_var_doing = 8
						if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
								NpcTalk(varMap, x270001_var_bosimingjiao, "好吧，那你们准备好了之后就点燃这个绿色信号，届时我们乃颜军从另一侧杀入。", -1)
						end
		end
	elseif x270001_var_doing==8   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 26   then
						x270001_var_doing = 9
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
								NpcTalk(varMap, x270001_var_zhongtudiren, "恩，记住我们的协议，阳顶天身上那样东西是我们的，得到之后我们会立刻离开！", -1)
						end
		end
	elseif x270001_var_doing==9   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 29   then
						x270001_var_doing = 10
						if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
								NpcTalk(varMap, x270001_var_bosimingjiao, "当然，他们明教来我海都大王的地界来撒野，一定要给他们些颜色看看。", -1)
						end
		end
	elseif x270001_var_doing==10   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 32   then
						x270001_var_doing = 11
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
								NpcTalk(varMap, x270001_var_zhongtudiren, "咦？这个筐怎么看起来有些不一样，好像大了些！", -1)
            		SetMonsterDir(varMap,x270001_var_zhongtudiren,60)
            end
		end
	elseif x270001_var_doing==11   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 35   then
						x270001_var_doing = 12
						if IsObjValid (varMap,x270001_var_bosimingjiao) == 1 then
								NpcTalk(varMap, x270001_var_bosimingjiao, "筐什么筐！到时候这筐也是你们拜火教的，赶紧去召集你的人去！", -1)
						end
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
           	 		SetMonsterDir(varMap,x270001_var_zhongtudiren,120)
            end
		end
	elseif x270001_var_doing==12   then
		if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 38   then
						x270001_var_doing = 13
						if IsObjValid (varMap,x270001_var_zhongtudiren) == 1 then
								NpcTalk(varMap, x270001_var_zhongtudiren, "好，你们等我们的消息吧！", -1)
								SetPos(varMap,x270001_var_zhongtudiren,44,211)
						end
		end
	elseif x270001_var_doing==13 then
			if GetCurrentTime() - x270001_var_PROTECTINFO.StartTime >= 41   then
				if IsPlayerStateNormal(varMap,x270001_var_acceptid) ==1 then
									local varQuestIdx = GetQuestIndexByID(varMap, x270001_var_acceptid, x270001_var_QuestId)
									SetQuestByIndex(varMap,x270001_var_acceptid,varQuestIdx,0,1)
									SetQuestByIndex(varMap,x270001_var_acceptid,varQuestIdx,7,1)
									StartTalkTask(varMap)
									TalkAppendString(varMap,format("偷听拜火教的谈话   %d/1", GetQuestParam(varMap,x270001_var_acceptid,varQuestIdx,0) ))
									StopTalkTask(varMap)
									DeliverTalkTips(varMap,x270001_var_acceptid)
									CancelSpecificImpact(varMap,x270001_var_acceptid,8704)
				end
				x270001_var_doing=14
				x270001_CloseTimer(varMap, x270001_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270001_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270001_var_doing =0
	x270001_var_acceptid =-1
	x270001_var_bosimingjiao = -1
	x270001_var_zhongtudiren = -1
	x270001_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}

end
