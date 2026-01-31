

--DECLARE_QUEST_INFO_START--
x203381_var_FileId = 203381
x203381_var_QuestIdPre =3213
x203381_var_QuestId = 3214
x203381_var_LevelLess	= 	1
x203381_var_QuestIdNext = 3215
x203381_var_DemandKill ={{varId=12002 ,varNum=5},{varId=12007 ,varNum=1}}

x203381_var_ExtTarget={{type=20,n=5,target="前往@npc_80009接受力量灌注，并击败正在村子的肆虐的@npc_80007"}}
x203381_var_QuestName="【新手】血与火"

x203381_var_QuestInfo="\t勇士们，为了忽必烈大汗的王国，为了我们的家园，为了长生天的召唤，战斗吧！将这些敌人驱赶出我们的过境，将所有的敌人消灭在我们的铁骑之下！\n\t冲锋吧！我的勇士！胜利的号角在等着我们！"  
x203381_var_QuestTarget=""		
x203381_var_QuestCompleted="\t干得好！这才是我带的士兵，这才是一个真正的勇士该有的样子！"
x203381_var_ContinueInfo="\t只有经历战场的士兵才能得到真正的历练！"
x203381_var_QuestHelp =	""
x203381_var_DemandItem ={}
x203381_var_ExpBonus = 5700
x203381_var_BonusMoney1 =11
x203381_var_BonusMoney2 =0
x203381_var_BonusMoney3 =0
x203381_var_BonusMoney4 =0
x203381_var_BonusMoney5 =12
x203381_var_BonusMoney6 =0
x203381_var_BonusItem	=	{}
x203381_var_BonusChoiceItem ={}
x203381_var_NpcGUID = {{ guid = 138011, varName = "金虎"} }
x203381_var_Skill	= {}
--DECLARE_QUEST_INFO_STOP--
x203381_var_NPCTalk ={
"这是神兵留下来最后的力量，一定要挡住他们！",
"这些力量只能暂时提升你的能力，抓紧时间击退他们！",
"不要担心，奋勇厮杀，只有经历战场的士兵才能得到真正的历练！",
}



function x203381_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203381_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203381_var_QuestIdPre) > 0 then

			if IsHaveQuest(varMap,varPlayer, x203381_var_QuestId) <= 0 then
					local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203381_var_QuestId)
					TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203381_var_QuestId, varState, -1 )			 
			end

	end
end

function x203381_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203381_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203381_var_ExpBonus )
		end
		if x203381_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203381_var_BonusMoney1 )
		end
		if x203381_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203381_var_BonusMoney2 )
		end
		if x203381_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203381_var_BonusMoney3 )
		end
		if x203381_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203381_var_BonusMoney4 )
		end
		if x203381_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203381_var_BonusMoney5 )
		end
		if x203381_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203381_var_BonusMoney6 )
		end
		for varI, item in x203381_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203381_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203381_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203381_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203381_var_QuestId) > 0 then
			if x203381_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203381_var_QuestName) 
						TalkAppendString(varMap,x203381_var_ContinueInfo)
						
						StopTalkTask()	
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203381_var_FileId, x203381_var_QuestId); 
						
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203381_var_QuestName)
						TalkAppendString(varMap,x203381_var_ContinueInfo)
						
						StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203381_var_FileId, x203381_var_QuestId);
					elseif which ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203381_var_QuestName)
						TalkAppendString(varMap,x203381_var_ContinueInfo)
						
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203381_var_FileId, x203381_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203381_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203381_var_QuestName)
						TalkAppendString(varMap,x203381_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203381_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203381_var_FileId, x203381_var_QuestId);
			end
  elseif x203381_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203381_var_QuestName)
			TalkAppendString(varMap,x203381_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203381_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203381_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203381_var_QuestHelp )
			end
			x203381_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203381_var_FileId, x203381_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end



function x203381_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203381_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203381_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203381_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203381_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203381_var_DemandKill[1].varNum then
  		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
  		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,0 )
        return 1
	end
	return 0
end

function x203381_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203381_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203381_var_QuestId  )
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
		if x203381_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203381_var_QuestId, x203381_var_FileId, 1, 0, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203381_Msg2toplayer( varMap, varPlayer,0)
					

		  		end
	 	end                                                                    
	     
end


function x203381_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203381_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203381_var_QuestId)
	  x203381_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x203381_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203381_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203381_var_BonusChoiceItem do
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

function x203381_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203381_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203381_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203381_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203381_var_QuestId) > 0 then
				x203381_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203381_var_QuestId)
				x203381_GetBonus( varMap, varPlayer,varTalknpc) 
			  	--SetViewGroup(varMap, varPlayer,5)
				 local country = GetCurCountry(varMap, varPlayer)
			  	local questid = {3295,3395,3498,3795}	
			  	local scriptid = {203541,203641,203591,203691}		  	
				LuaCallNoclosure( scriptid[country+1], "ProcEventEntry", varMap, varPlayer, varTalknpc, questid[country+1] )	

		    	if IsHaveSpecificImpact( varMap, varPlayer, 32575) == 1 then
			 		DispelSpecificImpact( varMap, varPlayer, 32575)
			 	 end
				if IsHaveSpecificImpact( varMap, varPlayer, 32576) == 1 then
			 	 	DispelSpecificImpact(varMap, varPlayer, 32576)
			 	 end
				if IsHaveSpecificImpact( varMap, varPlayer, 32577) == 1 then
			 	 	DispelSpecificImpact(varMap,varPlayer, 32577)
			 	end
   end
end

function x203381_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203381_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203381_var_ExpBonus);
  	end
		if x203381_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203381_var_BonusMoney1 )
	  end
		if x203381_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203381_var_BonusMoney2 )
	  end
		if x203381_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203381_var_BonusMoney3 )
		end
		if x203381_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203381_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203381_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203381_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203381_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203381_var_BonusMoney6)
		end
end

function x203381_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203381_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203381_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203381_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203381_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203381_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203381_var_QuestName.."！", 0, 3)
				if x203381_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203381_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203381_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203381_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203381_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203381_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203381_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203381_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203381_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203381_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203381_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203381_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203381_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203381_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203381_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203381_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203381_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203381_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203381_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
		end
end



function x203381_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

if	varObjData ==x203381_var_DemandKill[1].varId  then

	--获取仇恨列表个数
	local  num =GetMonsterThreatListCount(varMap, varObj)
	local mark = 0
	--判断仇恨列表里面是否有玩家
	if num >0 then
		for i=0,num do
			local PlayerId = GetMonsterThreat(varMap, varObj, i)
			if GetObjType(varMap, varObj) == 1 then
				mark =1
				break
			end
		end
	end
	--秒杀怪走这里
	if num <=0 or mark ==0 then
		local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203381_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203381_var_QuestId)
					if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
						SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
						Msg2Player(varMap, humanObjId, format("你击毙了海都精锐 %d/5", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
						x203381_CheckSubmit( varMap, humanObjId)
					end
                end
            end
		end
		return
	end

	local KillerObj = {}

--------------------------只要进入仇恨列表就共享怪物计次Begin----------------------------
	local KilledNum = GetMonsterThreatListCount( varMap, varObj ) --取得这个怪物仇恨列表中的人数
	for i = 0, KilledNum-1 do
		local PlayerId = GetMonsterThreat(varMap, varObj, i) --取得这个怪物仇恨列表的人的varObj
		if (PlayerId ~= -1) and (IsObjValid (varMap,PlayerId) == 1 ) then
			local TeamNum = 1
			local humanObjId = PlayerId
			local TeamId = GetTeamId(varMap, PlayerId)
				if TeamId ~= -1 then
					TeamNum = GetNearTeamCount(varMap, PlayerId)
				end
				for j = 0, TeamNum -1 do
					if TeamId ~= -1 then
						humanObjId = GetNearTeamMember(varMap, PlayerId, j)
					end
					if 1 ~= KillerObj[humanObjId] then
						KillerObj[humanObjId] = 1
						if IsHaveQuest( varMap, humanObjId, varQuest ) > 0 then	--如果这个人拥有任务
						
							local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203381_var_QuestId)
							if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
								SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
								Msg2Player(varMap, humanObjId, format("你击毙了海都精锐 %d/5", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
								x203381_CheckSubmit( varMap, humanObjId)
							end
							
						end
					end
				end
		end
	end


	-----------------------------------------------------------------------	
	--击杀海都	
	-----------------------------------------------------------------------
elseif varObjData ==x203381_var_DemandKill[2].varId then

	--获取仇恨列表个数
	local  num =GetMonsterThreatListCount(varMap, varObj)
	local mark = 0
	--判断仇恨列表里面是否有玩家
	if num >0 then
		for i=0,num do
			local PlayerId = GetMonsterThreat(varMap, varObj, i)
			if GetObjType(varMap, varObj) == 1 then
				mark =1
				break
			end
		end
	end
	--秒杀怪走这里
	if num <=0 or mark ==0 then
		local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203381_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203381_var_QuestId)
					if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
						SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,5)
						Msg2Player(varMap, humanObjId, "在你的帮助下，海都大王被击杀", 0, 3)
						x203381_CheckSubmit( varMap, humanObjId)
					end
                end
            end
		end
		return
	end

	local KillerObj = {}

--------------------------只要进入仇恨列表就共享怪物计次Begin----------------------------
	local KilledNum = GetMonsterThreatListCount( varMap, varObj ) --取得这个怪物仇恨列表中的人数
	for i = 0, KilledNum-1 do
		local PlayerId = GetMonsterThreat(varMap, varObj, i) --取得这个怪物仇恨列表的人的varObj
		if (PlayerId ~= -1) and (IsObjValid (varMap,PlayerId) == 1 ) then
			local TeamNum = 1
			local humanObjId = PlayerId
			local TeamId = GetTeamId(varMap, PlayerId)
				if TeamId ~= -1 then
					TeamNum = GetNearTeamCount(varMap, PlayerId)
				end
				for j = 0, TeamNum -1 do
					if TeamId ~= -1 then
						humanObjId = GetNearTeamMember(varMap, PlayerId, j)
					end
					if 1 ~= KillerObj[humanObjId] then
						KillerObj[humanObjId] = 1
						if IsHaveQuest( varMap, humanObjId, varQuest ) > 0 then	--如果这个人拥有任务
						    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203381_var_QuestId)
							if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
								SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,5)
								Msg2Player(varMap, humanObjId, "在你的帮助下，海都大王被击杀", 0, 3)
								x203381_CheckSubmit( varMap, humanObjId)
							end
						end
					end
				end
		end
	end




		
	end







end


function x203381_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203381_var_QuestId)
	if varArea ~= 7 or IsHaveQuest(varMap,varPlayer, x203381_var_QuestId) <= 0  then return end	
	if GetQuestParam(varMap,varPlayer,varQuestIdx,4) == 1 then
		Msg2Player(varMap, varPlayer, "你已经接受过力量的灌注，身体泛起一股虚弱感，无法再次获得力量", 0, 3)
		return
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 32575) ~= 1 then
 		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32575, 0)
 	 end
	if IsHaveSpecificImpact( varMap, varPlayer, 32576) ~= 1 then
 	 	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32576, 0)
 	 end
	if IsHaveSpecificImpact( varMap, varPlayer, 32577) ~= 1 then
 	 	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32577, 0)
 	 end
	RestoreHp(varMap, varPlayer,0)   
	local npcid ={
	454,
	455,
    }                          
	NpcTalk(varMap,npcid[1],x203381_var_NPCTalk[1],varPlayer)
	NpcTalk(varMap,npcid[2],x203381_var_NPCTalk[2],varPlayer)
	Msg2Player(varMap, varPlayer, "#Y强大的力量正从你的身体源源不断的涌出", 0, 3)
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,1 ) 
	LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer,86)
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,4,1)
end

function x203381_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203381_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	--LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203381_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203381_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203381_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203381_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203381_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203381_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203381_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
