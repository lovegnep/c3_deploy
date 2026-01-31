

--DECLARE_QUEST_INFO_START--
x203375_var_FileId = 203375
x203375_var_QuestIdPre =3209
x203375_var_QuestId = 3210
x203375_var_LevelLess	= 	1
x203375_var_QuestIdNext = 3212
x203375_var_Name	={}
x203375_var_ExtTarget={
	{type=20,n=1,target="拷问@npc_137834，逼他说出实情"},								
}
x203375_var_QuestName="【新手】刚抓到的俘虏"
x203375_var_QuestInfo="\t这些不正常的现象绝不是偶然，正好他们抓获了一个形迹可疑的农夫，你过去拷问一番，看看能不能问出点有用的情报！"  
x203375_var_QuestTarget={
	{"  拷问@npc_137834，逼他说出实情"},
}
x203375_var_QuestCompleted="\t事情已经超出了我们的预料，必须立刻采取行动！"					
x203375_var_ContinueInfo="\t还不快去，我担心会有更大的阴谋隐藏其中。"
x203375_var_QuestHelp =	"#G在某些时候你必须要狠下心，才能有所收获。#W"
x203375_var_DemandItem ={}
x203375_var_ExpBonus = 163
x203375_var_BonusMoney1 =0
x203375_var_BonusMoney2 =0
x203375_var_BonusMoney3 =0
x203375_var_BonusMoney4 =0
x203375_var_BonusMoney5 =0
x203375_var_BonusMoney6 =0
x203375_var_BonusChoiceItem ={}
x203375_var_BonusItem	=	{}
x203375_var_NpcGUID ={
	{ guid = 137834, varName = "被抓获的海都探子"}, 
}
--DECLARE_QUEST_INFO_STOP--
x203375_var_NPCTalk = {
"神兵在手，天下你有",
"勤加磨练才能让兵器发挥更大的作用",
}

function x203375_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203375_var_QuestId) > 0 then
		return 
	end
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203375_var_QuestIdPre)> 0 then
			if IsHaveQuest(varMap,varPlayer, x203375_var_QuestId) <= 0 then
					local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203375_var_QuestId)
					TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203375_var_QuestId, varState, -1 )
			end
	end
	
end

function x203375_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		local zhiye =GetZhiye(varMap, varPlayer)
		if x203375_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203375_var_ExpBonus )
		end
		if x203375_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203375_var_BonusMoney1 )
		end
		if x203375_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203375_var_BonusMoney2 )
		end
		if x203375_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203375_var_BonusMoney3 )
		end
		if x203375_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203375_var_BonusMoney4 )
		end
		if x203375_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203375_var_BonusMoney5 )
		end
		if x203375_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203375_var_BonusMoney6 )
		end
		for varI, item in x203375_var_BonusItem do
			if varI == zhiye then
		   	AddQuestItemBonus(varMap, item.item, item.n)
		   	end
	  end
		for varI, item in x203375_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203375_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varEx)	
	if IsQuestHaveDone(varMap, varPlayer, x203375_var_QuestId) > 0 then
		return 
	end
	local zhiye =GetZhiye(varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x203375_var_QuestId) > 0 then
		
		 if x203375_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
			if varEx == 2 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203375_var_QuestName)
				TalkAppendString(varMap,"\t（海都探子痛苦的挣扎着，闭紧了双眼，咬紧了牙关。。。一道道血痕不断的渗出鲜血）")
				TalkAppendButton( varMap, x203375_var_QuestId, "用刀抵住海都探子的脖子", 1, 3 )
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203375_var_FileId, x203375_var_QuestId);
	  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,1 )	
	  			NpcTalk(varMap,varTalknpc,"有本事就杀了我啊！",varPlayer)
		  	elseif varEx == 3 then
		  		StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203375_var_QuestName)
				TalkAppendString(varMap,"\t（海都探子不断的颤抖着，喉结艰难的微微动了一下，一丝鲜血顺着脖子流淌下来。。。）")
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203375_var_FileId, x203375_var_QuestId);
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203375_var_QuestId) 
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,0 )
				--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )
		  		NpcTalk(varMap,varTalknpc,"你。。。你。。。不。不要杀我！海都大王陛下会摧毁你们所有人，所有！。",varPlayer)
		  	elseif varEx == 4 then
		  		StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203375_var_QuestName)
				TalkAppendString(varMap,"\t（海都探子不屑一顾的瞪了你一眼。。鼻子发出不满的哼哼声，头偏了向一边。。。）")
				TalkAppendButton( varMap, x203375_var_QuestId, "用鞭子抽打海都探子", 1, 2 )
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203375_var_FileId, x203375_var_QuestId);
		  		NpcTalk(varMap,varTalknpc,"哼，别以为我会告诉你什么，我什么都不会说！",varPlayer)
		  		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,1 )
					
			end
		else
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 )
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203375_var_QuestName)
				TalkAppendString(varMap,x203375_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203375_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203375_var_FileId, x203375_var_QuestId);
		end
  elseif x203375_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203375_var_QuestName)
			TalkAppendString(varMap,x203375_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203375_var_ExtTarget do
				TalkAppendString( varMap,item.target)
			end 
			if x203375_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203375_var_QuestHelp )
			end
			x203375_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203375_var_FileId, x203375_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
	
end


function x203375_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203375_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x203375_var_QuestId)
	return GetQuestParam(varMap,varPlayer,varQuestIdx,0)	
end

function x203375_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203375_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203375_var_QuestId  )
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
		
		if x203375_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203375_var_QuestId, x203375_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203375_Msg2toplayer( varMap, varPlayer,0)
					--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 ) 

		  		end
	 	end                                                                    
	     
end


function x203375_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203375_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203375_var_QuestId)
	  	x203375_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203375_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	local zhiye =GetZhiye(varMap ,varPlayer)
	StartItemTask(varMap)
	for j, item in x203375_var_BonusItem do
		if zhiye == j then
		ItemAppendBind( varMap, item.item, item.n )
		end
  end
  for j, item in x203375_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppendBind( varMap, item.item, item.n )
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

function x203375_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	local zhiye =GetZhiye(varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x203375_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203375_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203375_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203375_var_QuestId) > 0 then
				x203375_Msg2toplayer( varMap, varPlayer,2)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,6,0)
				QuestCom(varMap, varPlayer, x203375_var_QuestId)
				x203375_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203375_var_BonusItem do
					if zhiye == varI then
 						ItemAppendBind( varMap, item.item, item.n )
 					end
				end
				for varI, item in x203375_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppendBind( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    	-- 	DeliverItemListSendToPlayer(varMap,varPlayer)
  			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,11,0 )
			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,19,0 )
    		
   end

   LuaCallNoclosure( 203377, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203375_var_QuestIdNext )	
end

function x203375_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203375_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203375_var_ExpBonus);
  	end
		if x203375_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203375_var_BonusMoney1 )
	  end
		if x203375_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203375_var_BonusMoney2 )
	  end
		if x203375_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203375_var_BonusMoney3 )
		end
		if x203375_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203375_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203375_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203375_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203375_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203375_var_BonusMoney6)
		end
end

function x203375_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203375_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203375_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203375_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203375_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203375_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203375_var_QuestName.."！", 0, 3)
				if x203375_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203375_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203375_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203375_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203375_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203375_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203375_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203375_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203375_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203375_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203375_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203375_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203375_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203375_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203375_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	if IsHaveQuest(varMap,varPlayer, x203375_var_QuestId) <= 0 then return end
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203375_var_QuestId)
    local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
	StartTalkTask( varMap)
	 if  x203375_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
    AddQuestLogCustomText( varMap,
							"",									
                            x203375_var_QuestName,              
                           	x203375_var_QuestTarget[1],            
                            "",       
                            x203375_var_QuestInfo, 				
                            x203375_var_QuestTarget[1],              
                            x203375_var_QuestHelp			
                            )
    else
        AddQuestLogCustomText( varMap,
							"",									
                            x203375_var_QuestName,              
                           	"@npc_"..138004,            
                            "",       
                            x203375_var_QuestInfo, 				
                            	"@npc_"..138004,    
                            x203375_var_QuestHelp			
                            )
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
	
	
end


function x203375_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203375_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203375_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203375_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203375_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203375_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203375_var_NpcGUID do
        if item.guid == varTalkNpcGUID  then
            bFind = 1
            break
        elseif varTalkNpcGUID == 138008 then
            bFind = 2
            break    
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203375_var_QuestId) > 0 and  bFind == 1 then
			if x203375_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203375_var_QuestId)
				TalkAppendString(varMap,"\n")
				TalkAppendButton( varMap, x203375_var_QuestId, "使劲的踹了踹海都探子", 1, 4 )			
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,0 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,1 )
			end
		elseif bFind == 2 and x203375_CheckSubmit( varMap, varPlayer, varTalknpc) == 1  then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203375_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203375_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,2,1 )
		end
end

function x203375_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203375_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203375_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203375_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203375_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203375_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
