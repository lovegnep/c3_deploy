

--DECLARE_QUEST_INFO_START--
x203515_var_FileId = 203515
x203515_var_QuestIdPre =3200
x203515_var_QuestId = 3217
x203515_var_LevelLess	= 	1 
x203515_var_QuestIdNext = 3241

x203515_var_ExtTarget={{type=20,n=3,target="向@npc_125001讨教职业发展"}}
x203515_var_QuestName="【新手】初识职业"
x203515_var_QuestTalk={"武士的现状","武士的特点","如何能成为宗师"}
x203515_var_QuestInfo="\t作为一个初入世界的新人，首先必须要对自己的职业有明确的认识。\n\t我的朋友智者哈达，年轻时游历世界，见多识广。他一定可以为你做出有关你的职业的指点。"  
x203515_var_QuestTarget="向@npc_125001讨教职业发展"		
x203515_var_QuestCompleted="\t绝世武功并非朝夕而蹴，只有持之以恒的练习，才能成为一代宗师。"
x203515_var_ContinueInfo={"\t从商周时代，中国就拥有了虎贲甲士，即武士。中国几千年的战争史上，武士一直是军队的重要组成部分。",
												"\t武士们凭藉锋利的兵刃，坚固的盔甲，健硕的体格，旺盛的斗志活跃于与敌人的正面交锋中。",
												"\t技能均为近程伤害技能，以单目标攻击技能为主，配有部分多目标技能。\n"}
x203515_var_QuestHelp =	"#G您可以用滑鼠#R左键#G点击@npc_125001，和他对话。您可以点击键盘上的#RQ#G键，打开任务列表，选中你要完成的任务，点击#R任务目标#G中的蓝色字体来进行自动寻路。"
x203515_var_DemandItem ={}
x203515_var_ExpBonus = 23
x203515_var_BonusMoney1 =11
x203515_var_BonusMoney2 =0
x203515_var_BonusMoney3 =0
x203515_var_BonusMoney4 =0
x203515_var_BonusMoney5 =12
x203515_var_BonusMoney6 =0
x203515_var_BonusItem	=	{}
x203515_var_BonusChoiceItem ={}
x203515_var_NpcGUID = {{ guid = 125001, varName = "长老哈达"} }

--DECLARE_QUEST_INFO_STOP--
x203515_var_Carinfo 				= {
	{CarType = 51,BaseAI = 3,AIScript = 3, CarName = "雄鹰", TimerTick=1}
}
x203515_var_AddBuffId 	= 1210
x203515_var_Zone_Pos_X    = {285,305}  --目的地的X范围 ， city_loulanwangcheng_area.ini配置
x203515_var_Zone_Pos_Z    = {345,365} --目的地的z范围 ， city_loulanwangcheng_area.ini配置


function x203515_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203515_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203515_var_QuestIdPre) > 0 then
		if GetZhiye( varMap, varPlayer)==0 then
				if IsHaveQuest(varMap,varPlayer, x203515_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203515_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203515_var_QuestId, varState, -1 )
					  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 )					 
				end
		end
	end
end

function x203515_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203515_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203515_var_ExpBonus )
		end
		if x203515_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203515_var_BonusMoney1 )
		end
		if x203515_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203515_var_BonusMoney2 )
		end
		if x203515_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203515_var_BonusMoney3 )
		end
		if x203515_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203515_var_BonusMoney4 )
		end
		if x203515_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203515_var_BonusMoney5 )
		end
		if x203515_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203515_var_BonusMoney6 )
		end
		for varI, item in x203515_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203515_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203515_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203515_var_QuestId)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203515_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203515_var_QuestId) > 0 then
			if x203515_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203515_var_QuestName) 
						TalkAppendString(varMap,x203515_var_ContinueInfo[1])
						TalkAppendButton(varMap, varQuest, x203515_var_QuestTalk[1],0,0)
						StopTalkTask()	
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,1 )		
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203515_var_FileId, x203515_var_QuestId); 
						
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203515_var_QuestName)
						TalkAppendString(varMap,x203515_var_ContinueInfo[2])
						TalkAppendButton(varMap, varQuest, x203515_var_QuestTalk[2],1,1)
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203515_var_FileId, x203515_var_QuestId);
					elseif which ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203515_var_QuestName)
						TalkAppendString(varMap,x203515_var_ContinueInfo[3])
						TalkAppendButton(varMap, varQuest, x203515_var_QuestTalk[3],0,2)
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,2)
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203515_var_FileId, x203515_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203515_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203515_var_QuestName)
						TalkAppendString(varMap,x203515_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203515_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,3)
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203515_var_FileId, x203515_var_QuestId);
			end
  elseif x203515_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203515_var_QuestName)
			TalkAppendString(varMap,x203515_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
			for varI, item in x203515_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203515_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203515_var_QuestHelp )
			end
			x203515_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203515_var_FileId, x203515_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end

function x203515_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203515_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203515_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203515_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203515_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
	        return 1
	end
	return 0
end

function x203515_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203515_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203515_var_QuestId  )
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
		if x203515_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203515_var_QuestId, x203515_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203515_Msg2toplayer( varMap, varPlayer,0)
					x203515_ProcCreateBus(varMap, varPlayer)

	    			
		  		end
	 	end                                                                    
	     
end
function x203515_ProcCreateBus(varMap, varPlayer)

	local varI=1;
	
	local PosX, PosZ = GetWorldPos(varMap, varPlayer);  --获取创建bus的起始坐标
	local PosY = 80
	local nFaceDir = 0
	local ret = CreateBusEx(varMap, x203515_var_Carinfo[varI].CarType, PosX,PosY,PosZ, x203515_var_Carinfo[varI].BaseAI, x203515_var_Carinfo[varI].AIScript, x203515_var_FileId, varPlayer, x203515_var_AddBuffId, -1,-1,nFaceDir)
	
end

function x203515_GetRandomTime()
	return 1000
end

function x203515_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)

	local varI=1;
	
	local countryID = 0
		
	SetBusTitle(varMap , busId, x203515_var_Carinfo[varI].CarName);
	SetBusCountryID(varMap , busId, countryID);
	SetBusCurCamp(varMap , busId, countryID);
	SetDelayTimeAfterCreate( varMap, busId, 1000, varI+3 );  --设置m_DelayAfterCreateTimer定时器
	
	SetBusTimerTick(varMap , busId, x203515_GetRandomTime()); --设置m_LogicTimer定时器
	
	SetBusTimerOpen(varMap, busId, 1);
	
	SendSpecificImpactToUnit(varMap, busId, busId, busId, 7060, 0)  --设置技能？？?

	AddBusMember(varMap, varPlayer,busId)
end


function x203515_ProcIntoBusEvent(varMap, varPlayer, varTalknpc)

	AddBusMember(varMap, varTalknpc,varPlayer);
	SendSpecificImpactToUnit(varMap, varMap, varMap, varMap, 7060, 0)

end


function x203515_ProcLeaveBusEvent(varMap, varPlayer,BusId)

	 DelBusMember(varMap, varPlayer,BusId)
	 CancelSpecificImpact(varMap,varPlayer, 7060)
	 x203515_DeleteBus(varMap, BusId)
	 --DelQuestNM( varMap, varPlayer, x203515_var_QuestId)
end


function x203515_ProcTime(varMap,BusId)


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
	if x203515_CheckArrivedZone(varMap,varTalknpc) == 1 then 
		local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x203515_var_QuestId )
		local varPlayer = GetBusMemberObjId(varMap, BusId, 0)
		SetQuestByIndex( varMap, varTalknpc, varQuestIdx, 0, 1 )
		SetQuestByIndex( varMap, varTalknpc, varQuestIdx, 7, 1 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,0 )

		x203515_DeleteBus( varMap, BusId )
		return 0
	end
	
	local MemberNum = GetBusMemberCount(varMap,BusId)

	if MemberNum <= 0 then
		x203515_DeleteBus( varMap, BusId )
		return 0;
	end
	
	StopBusTimer(varMap,BusId)
	SetBusTimerTick(varMap , BusId, x203515_GetRandomTime())	
		

	
end


function x203515_DeleteBus(varMap, busId)

		local varObj = GetBusMemberObjId(varMap, busId, 0)
		if varObj ~= -1 then
			DelBusMember(varMap, varObj, busId)
			SetWanFaExpMult(  varMap, varObj,  0 )
			CancelSpecificImpact(varMap,varObj, 7060)
		end
		
	DeleteBus(varMap, busId,1)
	
end


--SetDelayTimeAfterCreate会回调
function x203515_ProcDelayTime(varMap, varTalknpc, paraDelayTime)
	SetBusPatrolId(varMap , varTalknpc, 0)
end


function x310080_GetRandomTime()
	return 30000
end


--检测玩家是否到达了目的地
function x203515_CheckArrivedZone(varMap,varTalknpc)
	local varPosX , varPosZ = GetWorldPos(varMap,varTalknpc)
	if (varPosX >= 	x203515_var_Zone_Pos_X[1] and varPosX <= 	x203515_var_Zone_Pos_X[2]) and
	   (varPosZ >= 	x203515_var_Zone_Pos_Z[1] and varPosZ <= 	x203515_var_Zone_Pos_Z[2]) then
	   return 1
	end
	return 0		
end


function x203515_GetBusFaceDir(varMap)
	return 90
end	




function x203515_CheckAndDisplayError(varMap, varPlayer, varTalknpc)
	return 1
end


function x203515_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if IsObjValid (varMap,varBusID) ~= 1 then
        return
    end

	local CarName = GetName( varMap, varPlayer ).."的飞行器"
	SetBusTitle(varMap , varBusID, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)

end



function x203515_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203515_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203515_var_QuestId)
	    x203515_Msg2toplayer( varMap, varPlayer,1)
	  
	if IsBusMember(varMap, varPlayer) == 1 then
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			x203515_ProcLeaveBusEvent(varMap, varPlayer,varBusID)
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

function x203515_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203515_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203515_var_BonusChoiceItem do
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

function x203515_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203515_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203515_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203515_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203515_var_QuestId) > 0 then
				x203515_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203515_var_QuestId)
				QuestCom(varMap, varPlayer, 3240)
				x203515_GetBonus( varMap, varPlayer,varTalknpc)
					
				
				
					
				
			  
			  	 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,0)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203515_var_QuestIdNext )	
   end
end

function x203515_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203515_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203515_var_ExpBonus);
  	end
		if x203515_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203515_var_BonusMoney1 )
	  end
		if x203515_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203515_var_BonusMoney2 )
	  end
		if x203515_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203515_var_BonusMoney3 )
		end
		if x203515_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203515_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203515_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203515_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203515_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203515_var_BonusMoney6)
		end
end

function x203515_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203515_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203515_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203515_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203515_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203515_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203515_var_QuestName.."！", 0, 3)
				if x203515_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203515_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203515_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203515_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203515_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203515_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203515_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203515_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203515_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203515_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203515_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203515_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203515_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203515_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203515_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203515_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203515_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203515_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203515_var_QuestId, 7, -1 )
		end
end



function x203515_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203515_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203515_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203515_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203515_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203515_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203515_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203515_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203515_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203515_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203515_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
