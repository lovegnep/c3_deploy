

--DECLARE_QUEST_INFO_START--
x200001_var_FileId = 200001
x200001_var_QuestIdPre = 2 
x200001_var_QuestId = 20  
x200001_var_LevelLess	= 	10 
x200001_var_QuestIdNext = -1
x200001_var_Name	={}
x200001_var_ExtTarget={{type=20,n=6,target="消灭6个@npc_13018"}}
x200001_var_QuestName="【剧场】击杀马贼"
x200001_var_QuestInfo="\t在我们南方的温都尔丘陵有不少马贼，去把那些马贼除掉。"  
x200001_var_QuestTarget="消灭6个@npc_13018，回报@npc_101003"		
x200001_var_QuestCompleted="\t太好了，今天晚上让我们在草原上好好庆祝一番！\n#G(小提示：此任务可以获得附加属性点的装备奖励，增加#R力量#G，适合#R武士，剑侠，十字军和圣火使#G使用；增加#R敏捷#G，适合#R骑射，火枪，刺客和近卫军#G使用；增加#R智力#G，适合#R先知，萨满，僧侣和隐修士#G使用。)"					
x200001_var_ContinueInfo="\t这些马贼真是草原上的祸患，一定要想个办法一举除掉他们。"
x200001_var_QuestHelp =	"#G按下I键可以寻找并加入一个队伍。"
x200001_var_DemandItem ={}
x200001_var_ExpBonus = 1495
x200001_var_BonusMoney1 =176
x200001_var_BonusMoney2 =0
x200001_var_BonusMoney3 =0
x200001_var_BonusMoney4 =0
x200001_var_BonusMoney5 =25
x200001_var_BonusMoney6 =0
x200001_var_BonusItem	=	{
{item=10235989,n=1},
{item=10235990,n=1},
{item=10235991,n=1},
{item=10235992,n=1},
{item=10235993,n=1},
{item=10235994,n=1},
{item=10235995,n=1},
{item=10235996,n=1},
{item=10235997,n=1},
{item=10235998,n=1},
{item=10235999,n=1},
{item=10236000,n=1},
}     
x200001_var_BonusChoiceItem ={}
















x200001_var_NpcGUID ={{ guid = 101003 , varName = "札木合"}}

--DECLARE_QUEST_INFO_STOP--


function x200001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,103,0 )
	if IsQuestHaveDone(varMap, varPlayer, x200001_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x200001_var_QuestIdPre)> 0 then

		 if IsHaveQuest(varMap,varPlayer, x200001_var_QuestId) <= 0 then
			 local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200001_var_QuestId)
			 TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200001_var_QuestId, varState, -1 )
		 end

	end
end

function x200001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x200001_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x200001_var_ExpBonus )
		end
		if x200001_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x200001_var_BonusMoney1 )
		end
		if x200001_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x200001_var_BonusMoney2 )
		end
		if x200001_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x200001_var_BonusMoney3 )
		end
		if x200001_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x200001_var_BonusMoney4 )
		end
		if x200001_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x200001_var_BonusMoney5 )
		end
		if x200001_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x200001_var_BonusMoney6 )
		end
		for varI, item in x200001_var_BonusItem do
			if varI == GetZhiye(varMap, varPlayer)+1 then
		   	AddQuestItemBonus(varMap, item.item, item.n)
		   	end
	  end
		for varI, item in x200001_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x200001_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x200001_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x200001_var_QuestId) > 0 then
			if x200001_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200001_var_QuestName)
						TalkAppendString(varMap,x200001_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x200001_var_FileId, x200001_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200001_var_QuestName)
						TalkAppendString(varMap,x200001_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x200001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x200001_var_FileId, x200001_var_QuestId);
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,3,1 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   end
  elseif x200001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x200001_var_QuestName)
			TalkAppendString(varMap,x200001_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")  
			for varI, item in x200001_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x200001_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x200001_var_QuestHelp )
			end
			x200001_DispatchQuestInfo( varMap, varPlayer, varTalknpc )		 
	  	StopTalkTask() 
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x200001_var_FileId, x200001_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x200001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x200001_var_QuestIdPre)> 0 then 
			
			  return 1
	    end
	 
		return 0

end

function x200001_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x200001_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==6 then 
				
	        return 1
	  end
	  return 0
	
end

function x200001_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x200001_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x200001_var_QuestId  )
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
   	if x200001_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
   				local retmiss = AddQuest( varMap, varPlayer, x200001_var_QuestId, x200001_var_FileId, 1, 0, 0,1)
   				if retmiss ==0 then
   					Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
   					return 0
   				else
   	  			x200001_Msg2toplayer( varMap, varPlayer,0)
   	  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 49,1 )
   	  		end
    	end                                                                    
	     
end


function x200001_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x200001_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x200001_var_QuestId)
	  x200001_Msg2toplayer( varMap, varPlayer,1)
			
end

function x200001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x200001_var_BonusItem do
		if GetZhiye(varMap, varPlayer)+1 == j then
		ItemAppend( varMap, item.item, item.n )
		end
  end
  for j, item in x200001_var_BonusChoiceItem do
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

function x200001_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x200001_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200001_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200001_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x200001_var_QuestId) > 0 then
				x200001_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x200001_var_QuestId)
				x200001_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x200001_var_BonusItem do
					if varI == GetZhiye(varMap, varPlayer)+1 then
 						ItemAppend( varMap, item.item, item.n )
					end
				end
				for varI, item in x200001_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,3,0 )
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end  
     
end

function x200001_GetBonus( varMap, varPlayer,varTalknpc)
	  if x200001_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x200001_var_ExpBonus);
  	end
		if x200001_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x200001_var_BonusMoney1 )
	  end
		if x200001_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x200001_var_BonusMoney2 )
	  end
		if x200001_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x200001_var_BonusMoney3 )
		end
		if x200001_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x200001_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x200001_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x200001_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x200001_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x200001_var_BonusMoney6)
		end
end

function x200001_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x200001_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x200001_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200001_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200001_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200001_var_QuestName.."！", 0, 3)
				if x200001_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x200001_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x200001_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x200001_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x200001_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x200001_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x200001_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x200001_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x200001_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x200001_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x200001_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x200001_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x200001_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x200001_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x200001_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==575 then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x200001_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x200001_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 6 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)	
											Msg2Player(varMap, humanObjId, format("您击毙了马贼  %d/6", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x200001_CheckSubmit( varMap, humanObjId)
										end
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) == 6 then
															SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,6)
															SetQuestByIndex(varMap,humanObjId,varQuestIdx,7,1)
															LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 49,0 )
																
									end
                end
            end
		end
	end
end


function x200001_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

end

function x200001_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)

end

function x200001_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)

end

function x200001_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x200001_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x200001_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x200001_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200001_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200001_var_QuestId, varState, -1 )
		end
end

function x200001_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x200001_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x200001_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200001_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200001_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x200001_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x200001_ProcScneneTimer(varMap)









































































































































end





function x200001_CloseTimer( varMap, TimerIndex )







end
