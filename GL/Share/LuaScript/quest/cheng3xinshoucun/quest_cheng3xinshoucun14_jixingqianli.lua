

--DECLARE_QUEST_INFO_START--
x203379_var_FileId = 203379
x203379_var_QuestIdPre =3212
x203379_var_QuestId = 3213
x203379_var_LevelLess	= 	1 
x203379_var_QuestIdNext = 3214

x203379_var_ExtTarget={{type=20,n=1,target="通过@npc_80008迅速前往村子进行救援"}}
x203379_var_QuestName="【新手】萨满教大师"
x203379_var_QuestTalk=""
x203379_var_QuestInfo="\t王城的人已经得到消息了，他们正派大队人马赶来，已经有一队人马到了村子里了！\n\t你也赶紧赶回村子与他们一同并肩作战吧！"  
x203379_var_QuestTarget="  找到@npc_138010共同抵御海都的入侵"		
x203379_var_QuestCompleted="\t幸亏你行事机灵，否则，我们怕是没有办法及时赶到了！"
x203379_var_ContinueInfo="\t不要怯懦，为了家园，为了那些老人和孩子！"
x203379_var_QuestHelp =	""
x203379_var_DemandItem ={}
x203379_var_ExpBonus = 2200
x203379_var_BonusMoney1 =11
x203379_var_BonusMoney2 =0
x203379_var_BonusMoney3 =0
x203379_var_BonusMoney4 =0
x203379_var_BonusMoney5 =12
x203379_var_BonusMoney6 =0
x203379_var_BonusItem	=	{}
x203379_var_BonusChoiceItem ={}
x203379_var_NpcGUID = {{ guid = 138010, varName = "王城卫兵"} }

--DECLARE_QUEST_INFO_STOP--
x203379_var_Carinfo 				= {
	{CarType = 55,BaseAI = 3,AIScript = 3, CarName = "圣鹰", TimerTick=1}
}
x203379_var_AddBuffId 	= 1210
x203379_var_Zone_Pos_X    = {294,304}  --目的地的X范围 ， city_loulanwangcheng_area.ini配置
x203379_var_Zone_Pos_Z    = {318,328} --目的地的z范围 ， city_loulanwangcheng_area.ini配置



x203379_var_NPCTalk ={
"快！四位萨满教的大长老搭建了一座传送阵，可以将你快速送回村子！",
}


function x203379_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203379_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203379_var_QuestIdPre) > 0 then
		if IsHaveQuest(varMap,varPlayer, x203379_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203379_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203379_var_QuestId, varState, -1 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 )					 
		end
	end
end

function x203379_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203379_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203379_var_ExpBonus )
		end
		if x203379_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203379_var_BonusMoney1 )
		end
		if x203379_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203379_var_BonusMoney2 )
		end
		if x203379_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203379_var_BonusMoney3 )
		end
		if x203379_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203379_var_BonusMoney4 )
		end
		if x203379_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203379_var_BonusMoney5 )
		end
		if x203379_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203379_var_BonusMoney6 )
		end
		for varI, item in x203379_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203379_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203379_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203379_var_QuestId)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203379_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203379_var_QuestId) > 0 then
			if x203379_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,0)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203379_var_QuestName)
				TalkAppendString(varMap,x203379_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203379_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203379_var_FileId, x203379_var_QuestId);
			end
  elseif x203379_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203379_var_QuestName)
			TalkAppendString(varMap,x203379_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
			for varI, item in x203379_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203379_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203379_var_QuestHelp )
			end
			x203379_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203379_var_FileId, x203379_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end

function x203379_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203379_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203379_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203379_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203379_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
	        return 1
	end
	return 0
end

function x203379_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203379_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203379_var_QuestId  )
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
		if x203379_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203379_var_QuestId, x203379_var_FileId, 0, 1, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203379_Msg2toplayer( varMap, varPlayer,0)
					LastMount(varMap,varPlayer)
		    		NpcTalk(varMap,varTalknpc,x203379_var_NPCTalk[1],varPlayer)
		    		--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 ) 
		  		end
	 	end                                                                    
	     
end



function x203379_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203379_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203379_var_QuestId)
	    x203379_Msg2toplayer( varMap, varPlayer,1)
end

function x203379_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203379_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203379_var_BonusChoiceItem do
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

function x203379_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203379_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203379_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203379_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203379_var_QuestId) > 0 then
				x203379_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203379_var_QuestId)
				QuestCom(varMap, varPlayer, 3240)
				x203379_GetBonus( varMap, varPlayer,varTalknpc)	  
			  	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,0)
				LuaCallNoclosure( 203381, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203379_var_QuestIdNext )	
   end
end

function x203379_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203379_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203379_var_ExpBonus);
  	end
		if x203379_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203379_var_BonusMoney1 )
	  end
		if x203379_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203379_var_BonusMoney2 )
	  end
		if x203379_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203379_var_BonusMoney3 )
		end
		if x203379_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203379_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203379_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203379_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203379_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203379_var_BonusMoney6)
		end
end

function x203379_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203379_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203379_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203379_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203379_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203379_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203379_var_QuestName.."！", 0, 3)
				if x203379_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203379_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203379_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203379_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203379_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203379_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203379_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203379_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203379_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203379_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203379_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203379_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203379_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203379_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203379_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203379_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
	if IsHaveQuest(varMap,varPlayer, x203379_var_QuestId) > 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203379_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203379_var_QuestId, varState, -1 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
	end
end



function x203379_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203379_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203379_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then return end
	if IsHaveQuest(varMap,varPlayer, x203379_var_QuestId) > 0 and varArea == 6 then

		--创建假摄像机
		--x203379_ProcCreateBus(varMap, varPlayer)
	--	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203379_var_QuestId)
	  --	SetQuestByIndex(varMap,varPlayer,varQuestIdx,4,1)
  		
		Msg2Player(varMap, varPlayer, "你通过了萨满构建的传送阵迅速抵达了圣山脚下", 0, 3)
    	SetPos(varMap, varPlayer,298,309)
		if IsHaveSpecificImpact( varMap, varPlayer, 7720) ~= 1 then
	 		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7720, 0)
	 	 end
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	 	LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer,85)
	 	LuaCallNoclosure( UTILITY_SCRIPT, "StopBkgSound", varMap, varPlayer)
	 	LuaCallNoclosure( UTILITY_SCRIPT, "PlaySound", varMap, varPlayer,7)
	end
end

function x203379_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203379_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	--LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203379_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203379_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203379_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203379_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203379_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203379_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203379_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203379_ProcCreateBus(varMap, varPlayer)

	local varI=1;
	
	local PosX, PosZ = GetWorldPos(varMap, varPlayer);  --获取创建bus的起始坐标
	local PosY = 70
	local nFaceDir = 0
	local ret = CreateBus(varMap, x203379_var_Carinfo[varI].CarType, PosX,PosZ, x203379_var_Carinfo[varI].BaseAI, x203379_var_Carinfo[varI].AIScript, x203379_var_FileId, varPlayer, x203379_var_AddBuffId, -1,-1,nFaceDir)
	
end

function x203379_GetRandomTime()
	return 500
end

function x203379_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)

	local varI=1;
	
	local countryID = GetCurCountry(varMap,varPlayer)
		
	SetBusTitle(varMap , busId, "");
	SetBusCountryID(varMap , busId, countryID);
	SetBusCurCamp(varMap , busId, countryID);
	SetDelayTimeAfterCreate( varMap, busId, 500, varI+3 );  --设置m_DelayAfterCreateTimer定时器
	
	SetBusTimerTick(varMap , busId, x203379_GetRandomTime()); --设置m_LogicTimer定时器
	
	SetBusTimerOpen(varMap, busId, 1);
	
	SendSpecificImpactToUnit(varMap, busId, busId, busId, 7060, 0)  --设置技能？？?

	AddBusMember(varMap, varPlayer,busId,0)
	--第三个参数 XX属性  第四个参数 是否隐藏 1 为隐藏
	ChangePlayerProperty(varMap, varPlayer, 0, 1)
end


function x203379_ProcIntoBusEvent(varMap, varPlayer, varTalknpc)

	AddBusMember(varMap, varTalknpc,varPlayer,0);
	SendSpecificImpactToUnit(varMap, varMap, varMap, varMap, 7060, 0)
	
end


function x203379_ProcLeaveBusEvent(varMap, varPlayer,BusId)
	 DelBusMember(varMap, varPlayer,BusId)
	 CancelSpecificImpact(varMap,varPlayer, 7060)
	 x203379_DeleteBus(varMap, BusId)
	
	 --DelQuestNM( varMap, varPlayer, x203379_var_QuestId)
end


function x203379_ProcTime(varMap,BusId)


	--在此处判断是否到达目的地
	--如果达到目的地，则删除镖车,设置任务为完成状态

	local bIsBusMoving = IsBusMoving(varMap, BusId)
	if bIsBusMoving <= 0 then
		return 0
	end


	
	--判断varTalknpc是否到达了目的地
	local varTalknpc = GetBusMemberObjId(varMap, BusId, 0)
	if varTalknpc <= 0 then
		return 0
	end
	if x203379_CheckArrivedZone(varMap,varTalknpc) == 1 then
		local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x203379_var_QuestId )
		SetQuestByIndex( varMap, varTalknpc, varQuestIdx, 7, 1 )
		SetQuestByIndex( varMap, varTalknpc, varQuestIdx, 1, 1 )
		SetPos(varMap, varTalknpc ,299,324)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varTalknpc, 4,0 )
		ChangePlayerProperty(varMap, varTalknpc, 0, 0)
		x203379_DeleteBus( varMap, BusId )
		
		return 0
	end
	
	local MemberNum = GetBusMemberCount(varMap,BusId)

	if MemberNum <= 0 then
		x203379_DeleteBus( varMap, BusId )
		return 0;
	end
	
	StopBusTimer(varMap,BusId)
	SetBusTimerTick(varMap , BusId, x203379_GetRandomTime())	
		

	
end


function x203379_DeleteBus(varMap, busId)

		local varObj = GetBusMemberObjId(varMap, busId, 0)
		if varObj ~= -1 then
			DelBusMember(varMap, varObj, busId)
			SetWanFaExpMult(  varMap, varObj,  0 )
			CancelSpecificImpact(varMap,varObj, 7060)
			
		end
		
		DeleteBus(varMap, busId,1)
		
		--LuaCallNoclosure( 203379, "ProcEventEntry", varMap, varObj, 7, 3202 )	
end


--SetDelayTimeAfterCreate会回调
function x203379_ProcDelayTime(varMap, varTalknpc, paraDelayTime)
	SetBusPatrolId(varMap , varTalknpc, 0)
end


function x310080_GetRandomTime()
	return 30000
end


--检测玩家是否到达了目的地
function x203379_CheckArrivedZone(varMap,varTalknpc)
	local varPosX , varPosZ = GetWorldPos(varMap,varTalknpc)
	if (varPosX >= 	x203379_var_Zone_Pos_X[1] and varPosX <= 	x203379_var_Zone_Pos_X[2]) and
	   (varPosZ >= 	x203379_var_Zone_Pos_Z[1] and varPosZ <= 	x203379_var_Zone_Pos_Z[2]) then
	   return 1
	end
	return 0		
end


function x203379_GetBusFaceDir(varMap)
	return 90
end	




function x203379_CheckAndDisplayError(varMap, varPlayer, varTalknpc)
	return 1
end


function x203379_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if IsObjValid (varMap,varBusID) ~= 1 then
        return
    end

	local CarName = GetName( varMap, varPlayer ).."的飞行器"
	SetBusTitle(varMap , varBusID, "")
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)

end
