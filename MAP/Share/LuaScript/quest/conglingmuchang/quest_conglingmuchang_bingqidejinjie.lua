

--DECLARE_QUEST_INFO_START--
x203541_var_FileId = 203541
x203541_var_QuestIdPre =-1
x203541_var_QuestId = 3295
x203541_var_LevelLess	= 	10
x203541_var_QuestIdNext = {3269,3270,3271,3272,3273,3274,3275,3276,3277,3278,3279,3280}
x203541_var_Name	={}
x203541_var_ExtTarget={{type=20,n=1,target="找到@npc_138609，在其指引下飞临王城"}}
x203541_var_QuestName="【新手】目标：王城！"
x203541_var_QuestInfo="\t我们的王城，就在前方！\n\t那里有更高级的武器，技能，马匹，更有着无数和你一样的年轻士兵等候着你的到来。\n\t去找王城御卫长报导吧，幸运的小子！"  
x203541_var_QuestTarget="找到@npc_123828"		
x203541_var_QuestCompleted="\t欢迎来到王城，新兵！"					
x203541_var_ContinueInfo=""
x203541_var_QuestHelp =	""
x203541_var_DemandItem ={}
x203541_var_ExpBonus = 4000
x203541_var_BonusMoney1 =200
x203541_var_BonusMoney2 =0
x203541_var_BonusMoney3 =0
x203541_var_BonusMoney4 =0
x203541_var_BonusMoney5 =0
x203541_var_BonusMoney6 =0
x203541_var_BonusItem	=	{}
x203541_var_BonusChoiceItem ={}
x203541_var_NpcGUID ={{ guid = 123828, varName = "王城御卫长"},{ guid = 138609, varName = "王城接应人",} }
--DECLARE_QUEST_INFO_STOP--     
x203541_var_FileIdNext =203700

x203541_var_Carinfo 				= {
	{CarType = 54,BaseAI = 3,AIScript = 3, CarName = "圣鹰", TimerTick=1}
}
x203541_var_AddBuffId 	= 1210
x203541_var_Zone_Pos_X    = {180,188}  --目的地的X范围 ， city_loulanwangcheng_area.ini配置
x203541_var_Zone_Pos_Z    = {105,116} --目的地的z范围 ， city_loulanwangcheng_area.ini配置

function x203541_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local country = GetCurCountry(varMap, varPlayer)
	if country ~= 0 or GetLevel(varMap, varPlayer) < 10 then return end
	if IsQuestHaveDone(varMap, varPlayer, x203541_var_QuestId) > 0 then
		return 
	end
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsHaveQuest(varMap,varPlayer, x203541_var_QuestId) <= 0 then						
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203541_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203541_var_QuestId, varState, -1 )
	end
		
end

function x203541_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203541_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203541_var_ExpBonus )
		end
		if x203541_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203541_var_BonusMoney1 )
		end
		if x203541_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203541_var_BonusMoney2 )
		end
		if x203541_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203541_var_BonusMoney3 )
		end
		if x203541_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203541_var_BonusMoney4 )
		end
		if x203541_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203541_var_BonusMoney5 )
		end
		if x203541_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203541_var_BonusMoney6 )
		end
		for varI, item in x203541_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203541_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203541_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,witch)	
	if IsQuestHaveDone(varMap, varPlayer, x203541_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203541_var_QuestId) > 0 then
		if witch == -1 then
			if x203541_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203541_var_QuestName)
						TalkAppendString(varMap,x203541_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203541_var_FileId, x203541_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203541_var_QuestName)
						TalkAppendString(varMap,x203541_var_QuestCompleted)
						TalkAppendString(varMap," ")
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_WANCHENG_QUEDING, 1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_WANCHENG_WENHAO, 0)
						x203541_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203541_var_FileId, x203541_var_QuestId);
			end
		elseif witch == 3 then
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_RENWUMIANBAN_DUIHUA,0 )
			x203541_ProcCreateBus(varMap, varPlayer)
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203541_var_QuestId)
				--if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
			  	SetQuestByIndex(varMap,varPlayer,varQuestIdx,4,1)
		end
			
  elseif x203541_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203541_var_QuestName)
			TalkAppendString(varMap,x203541_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203541_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203541_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203541_var_QuestHelp )
			end
			x203541_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203541_var_FileId, x203541_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 ) 	
  end
	
end


function x203541_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203541_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203541_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
  		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
  		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,0 )
        return 1
	end
	return 0
	
end

function x203541_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203541_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203541_var_QuestId  )
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
		if x203541_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203541_var_QuestId, x203541_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203541_Msg2toplayer( varMap, varPlayer,0)
	    			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )   
	    			--SetViewGroup(varMap, varPlayer,0)
		    		if IsHaveSpecificImpact( varMap, varPlayer, 32578) ~= 1 then
			 	 		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32578, 0)
			 		end
		  		end
	 	end                                                                    
	     
end
function x203541_ProcCreateBus(varMap, varPlayer)

	local varI=1;
	
	local PosX, PosZ = GetWorldPos(varMap, varPlayer);  --获取创建bus的起始坐标
	local PosY = 20
	local nFaceDir = 0
	local ret = CreateBusEx(varMap, x203541_var_Carinfo[varI].CarType, PosX,PosY,PosZ, x203541_var_Carinfo[varI].BaseAI, x203541_var_Carinfo[varI].AIScript, x203541_var_FileId, varPlayer, x203541_var_AddBuffId, -1,-1,nFaceDir)
	
end

function x203541_GetRandomTime()
	return 500
end

function x203541_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)

	local varI=1;
	
	local countryID = GetCurCountry(varMap,varPlayer)
		
	SetBusTitle(varMap , busId, "");
	SetBusCountryID(varMap , busId, countryID);
	SetBusCurCamp(varMap , busId, countryID);
	SetDelayTimeAfterCreate( varMap, busId, 500, varI+3 );  --设置m_DelayAfterCreateTimer定时器
	
	SetBusTimerTick(varMap , busId, x203541_GetRandomTime()); --设置m_LogicTimer定时器
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 1);
	
	SendSpecificImpactToUnit(varMap, busId, busId, busId, 7060, 0)  --设置技能？？?

	AddBusMember(varMap, varPlayer,busId,0)
		--第三个参数 XX属性  第四个参数 是否隐藏 1 为隐藏
	ChangePlayerProperty(varMap, varPlayer, 0, 1)
end


function x203541_ProcIntoBusEvent(varMap, varPlayer, varTalknpc)

	AddBusMember(varMap, varTalknpc,varPlayer,0);
	SendSpecificImpactToUnit(varMap, varMap, varMap, varMap, 7060, 0)

end


function x203541_ProcLeaveBusEvent(varMap, varPlayer,BusId)

	 DelBusMember(varMap, varPlayer,BusId)
	 CancelSpecificImpact(varMap,varPlayer, 7060)
	 x203541_DeleteBus(varMap, BusId)
	 --DelQuestNM( varMap, varPlayer, x203541_var_QuestId)
end


function x203541_ProcTime(varMap,BusId)


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
	if x203541_CheckArrivedZone(varMap,varTalknpc) == 1 then 
		local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x203541_var_QuestId )
		local varPlayer = GetBusMemberObjId(varMap, BusId, 0)

		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,0 )
		ChangePlayerProperty(varMap, varPlayer, 0, 0)
		x203541_DeleteBus( varMap, BusId )
		
		return 0
	end
	
	local MemberNum = GetBusMemberCount(varMap,BusId)

	if MemberNum <= 0 then
		x203541_DeleteBus( varMap, BusId )
		return 0;
	end
	
	StopBusTimer(varMap,BusId)
	SetBusTimerTick(varMap , BusId, x203541_GetRandomTime())	
		

	
end


function x203541_DeleteBus(varMap, busId)

		local varObj = GetBusMemberObjId(varMap, busId, 0)
		if varObj ~= -1 then
			DelBusMember(varMap, varObj, busId)
			SetWanFaExpMult(  varMap, varObj,  0 )
			CancelSpecificImpact(varMap,varObj, 7060)
			if IsHaveSpecificImpact( varMap, varObj, 32612) ~= 1 then
		 		SendSpecificImpactToUnit(varMap, varObj, varObj, varObj, 32612, 0)
		 	 end
		end
		
	DeleteBus(varMap, busId,1)

end


--SetDelayTimeAfterCreate会回调
function x203541_ProcDelayTime(varMap, varTalknpc, paraDelayTime)
	SetBusPatrolId(varMap , varTalknpc, 9)
end


function x310080_GetRandomTime()
	return 30000
end


--检测玩家是否到达了目的地
function x203541_CheckArrivedZone(varMap,varTalknpc)
	local varPosX , varPosZ = GetWorldPos(varMap,varTalknpc)
	if (varPosX >= 	x203541_var_Zone_Pos_X[1] and varPosX <= 	x203541_var_Zone_Pos_X[2]) and
	   (varPosZ >= 	x203541_var_Zone_Pos_Z[1] and varPosZ <= 	x203541_var_Zone_Pos_Z[2]) then
	   return 1
	end
	return 0		
end


function x203541_GetBusFaceDir(varMap)
	return 90
end	




function x203541_CheckAndDisplayError(varMap, varPlayer, varTalknpc)
	return 1
end


function x203541_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if IsObjValid (varMap,varBusID) ~= 1 then
        return
    end

	local CarName = GetName( varMap, varPlayer ).."的飞行器"
	SetBusTitle(varMap , varBusID, "")
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)

end

function x203541_ProcWaitTimeOut(varMap,BusId)
	
	if IsObjValid ( varMap, BusId ) ~= 1 then
   		return
  	end

	DeleteBus(varMap, BusId,1)
	
end




function x203541_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203541_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203541_var_QuestId)
	  x203541_Msg2toplayer( varMap, varPlayer,1) 
	
	if IsBusMember(varMap, varPlayer) == 1 then
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			x203541_ProcLeaveBusEvent(varMap, varPlayer,varBusID)
		else
			local varReadme = "很抱歉，您与您的护送目标在同一场景才能放弃任务，请先找到您的护送目标再选择放弃！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, "现在不能放弃任务！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			return
		end				
	end
end

function x203541_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203541_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203541_var_BonusChoiceItem do
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

function x203541_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203541_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203541_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203541_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203541_var_QuestId) > 0 then
				x203541_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203541_var_QuestId)
				x203541_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203541_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203541_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		LastMount(varMap,varPlayer)
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
   LuaCallNoclosure( x203541_var_FileIdNext, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203541_var_QuestIdNext[zhiye] )	
end

function x203541_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203541_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203541_var_ExpBonus);
  	end
		if x203541_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203541_var_BonusMoney1 )
	  end
		if x203541_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203541_var_BonusMoney2 )
	  end
		if x203541_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203541_var_BonusMoney3 )
		end
		if x203541_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203541_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203541_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203541_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203541_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203541_var_BonusMoney6)
		end
end

function x203541_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203541_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203541_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203541_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203541_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203541_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203541_var_QuestName.."！", 0, 3)
				if x203541_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203541_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203541_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203541_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203541_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203541_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203541_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203541_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203541_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203541_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203541_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203541_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203541_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203541_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203541_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203541_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203541_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203541_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203541_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203541_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	  local bFind  = 0
    for varI ,item in x203541_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203541_var_QuestId) > 0 then
			if x203541_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_RENWUMIANBAN_DUIHUA,1 )
				TalkAppendButton( varMap, x203541_var_QuestId, "乘坐圣鹰飞抵王城内", 1, 3 )
			else
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203541_var_QuestId)        
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, MAOPAO_WANCHENG_WENHAO, 1)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203541_var_QuestId, varState, -1 )
			end
		end
end

function x203541_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203541_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203541_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203541_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203541_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203541_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
