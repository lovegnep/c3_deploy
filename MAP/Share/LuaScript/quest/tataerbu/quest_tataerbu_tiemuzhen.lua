

--DECLARE_QUEST_INFO_START--
x223001_var_FileId = 223001
x223001_var_QuestIdPre =-1
x223001_var_QuestId = 100
x223001_var_LevelLess	= 	20 
x223001_var_MaxLevel  =   50
x223001_var_QuestIdNext = 101
x223001_var_Name	={"铁木真"}
x223001_var_ExtTarget={{type=20,n=1,target="和@npc_103001交谈"}}
x223001_var_QuestName="【剧场】大战在即"
x223001_var_QuestTalk={"正是！","小小差距并不算什么。","的确如此。"}
x223001_var_QuestInfo="\t#Y@myname#W，很高兴再次见到你。目前我们正和塔塔尔人对峙着，这次又能得到你的帮助了。"  
x223001_var_QuestTarget=""		
x223001_var_QuestCompleted="\t高级的技能能让你更轻松的解决掉你的敌人，所以记得当你的等级提高以后经常回来学习新的技能。\n\t人不能一口吃成胖子，但胖子却是一口一口吃出来的。持之以恒的练习，才能成为一代宗师。"
x223001_var_ContinueInfo={"\t此次和塔塔尔部交战，我们有了一个强力的盟友—金国。金国六王爷完颜洪烈亲帅大军来帮助我们。\n\t曾几何时，我们草原人在金国的眼里不过是一群未开化的蛮子，如今金国竟然肯主动和我们结盟，不能不说这是我们这些年一个巨大的收获。 ",
												"\t金国军队衣甲鲜明，刀枪锐利，尤其是六王爷完颜洪烈的亲卫队，个个都是面带杀气的勇士，我们乞颜部的普通士兵一比之下确实差了很多。",
												"\t我们的兵器盔甲都不如金国人，但是我们不能在金国人面前堕了我们乞颜部健儿的威风！#Y@myname#W,#R我#W和#R木华黎#W将军有一些重要的事情要交给你。"}
x223001_var_QuestHelp =	""
x223001_var_DemandItem ={}
x223001_var_ExpBonus = 8977
x223001_var_BonusMoney1 =255
x223001_var_BonusMoney2 =0
x223001_var_BonusMoney3 =0
x223001_var_BonusMoney4 =0
x223001_var_BonusMoney5 =37
x223001_var_BonusMoney6 =0
x223001_var_BonusItem	=	{}
x223001_var_BonusChoiceItem ={}
x223001_var_NpcGUID = { }
--DECLARE_QUEST_INFO_STOP--

function x223001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x223001_var_LevelLess or varLevel > x223001_var_MaxLevel then
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x223001_var_QuestId) > 0 then
		return 
	end
	if GetLevel(varMap, varPlayer)>= x223001_var_LevelLess then
			
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x223001_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x223001_var_QuestId, varState, -1 )
		
	end
end

function x223001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x223001_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x223001_var_ExpBonus )
		end
		if x223001_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x223001_var_BonusMoney1 )
		end
		if x223001_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x223001_var_BonusMoney2 )
		end
		if x223001_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x223001_var_BonusMoney3 )
		end
		if x223001_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x223001_var_BonusMoney4 )
		end
		if x223001_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x223001_var_BonusMoney5 )
		end
		if x223001_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x223001_var_BonusMoney6 )
		end
		for varI, item in x223001_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x223001_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x223001_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x223001_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x223001_var_QuestId) > 0 then
			if x223001_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x223001_var_QuestName)
						TalkAppendString(varMap,x223001_var_ContinueInfo[1])
						TalkAppendButton(varMap, varQuest, x223001_var_QuestTalk[1],0,0)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x223001_var_FileId, x223001_var_QuestId);
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x223001_var_QuestName)
						TalkAppendString(varMap,x223001_var_ContinueInfo[2])
						TalkAppendButton(varMap, varQuest, x223001_var_QuestTalk[2],1,1)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x223001_var_FileId, x223001_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x223001_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x223001_var_QuestName)
						TalkAppendString(varMap,x223001_var_ContinueInfo[3])
						TalkAppendString(varMap," ")
						x223001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x223001_var_FileId, x223001_var_QuestId);
			
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   			end
  elseif x223001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x223001_var_QuestName)
			TalkAppendString(varMap,x223001_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x223001_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x223001_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x223001_var_QuestHelp )
			end
			x223001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x223001_var_FileId, x223001_var_QuestId);
  
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
 		end
end

function x223001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x223001_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x223001_var_LevelLess then
		return 0
	end
	return 1
end

function x223001_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x223001_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
	        return 1
	end
	return 0
end

function x223001_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x223001_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x223001_var_QuestId  )
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
		
		if x223001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x223001_var_QuestId, x223001_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x223001_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x223001_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end

function x223001_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x223001_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x223001_var_QuestId)
	  x223001_Msg2toplayer( varMap, varPlayer,1)
end

function x223001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x223001_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x223001_var_BonusChoiceItem do
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

function x223001_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x223001_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x223001_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x223001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x223001_var_QuestId) > 0 then
				x223001_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x223001_var_QuestId)
				x223001_GetBonus( varMap, varPlayer,varTalknpc)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x223001_var_QuestIdNext )	
   end
end

function x223001_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
end

function x223001_GetBonus( varMap, varPlayer,varTalknpc)
	  if x223001_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x223001_var_ExpBonus);
  	end
		if x223001_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x223001_var_BonusMoney1 )
	  end
		if x223001_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x223001_var_BonusMoney2 )
	  end
		if x223001_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x223001_var_BonusMoney3 )
		end
		if x223001_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x223001_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x223001_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x223001_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x223001_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x223001_var_BonusMoney6)
		end
end

function x223001_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x223001_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x223001_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x223001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x223001_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x223001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x223001_var_QuestName.."！", 0, 3)
				if x223001_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x223001_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x223001_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x223001_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x223001_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x223001_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x223001_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x223001_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x223001_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x223001_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x223001_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x223001_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x223001_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x223001_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x223001_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x223001_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x223001_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x223001_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x223001_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x223001_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x223001_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x223001_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x223001_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x223001_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x223001_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





