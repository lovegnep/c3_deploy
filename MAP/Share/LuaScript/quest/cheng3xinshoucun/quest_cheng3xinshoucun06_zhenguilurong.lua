

--DECLARE_QUEST_INFO_START--
x203369_var_FileId = 203369
x203369_var_QuestIdPre =3204
x203369_var_QuestId = 3205
x203369_var_LevelLess	= 	1 
x203369_var_QuestIdNext = 3206
x203369_var_DemandKill ={{varId=11971,varNum=3}}

x203369_var_ExtTarget={{type=20,n=3,target="猎杀3只@npc_80000获得鹿茸"}}
x203369_var_QuestName="【新手】鹿茸相赠"

x203369_var_QuestInfo="\t新兵器可能还不是很称手，不过只要多使用几次，就会得心应手了！\n\t村西面雪山脚下有一大群美丽的花鹿，你去割下几只鹿茸拿给草原之花塔娜，她正需要这些东西入药呢。"  
x203369_var_QuestTarget="  猎杀3只@npc_80000获得鹿茸"		
x203369_var_QuestCompleted="\t我等你很久了，年轻人，听村中各位长老对你的评价都很高啊！像你这样的青年俊杰，如今可真是不多见了。"
x203369_var_ContinueInfo="\t去哪里弄到鹿茸呢？"
x203369_var_QuestHelp =	"#G\t你可以点击任务寻路中的蓝色字找到怪物，再用滑鼠左键点击怪物，就可以攻击并消灭它们。"
x203369_var_DemandItem ={}
x203369_var_ExpBonus = 180
x203369_var_BonusMoney1 =5
x203369_var_BonusMoney2 =0
x203369_var_BonusMoney3 =0
x203369_var_BonusMoney4 =0
x203369_var_BonusMoney5 =12
x203369_var_BonusMoney6 =0
x203369_var_BonusItem	=	{}
x203369_var_BonusChoiceItem ={}
x203369_var_NpcGUID = {{ guid = 138005, varName = "草原之花塔娜"} }
--DECLARE_QUEST_INFO_STOP--
x203369_var_itemid = 13020310
x203369_var_npctalk = {
"父亲说，这草原上的赤龙胆草，是长生天赐给我们的宝贝。",
}


function x203369_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203369_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203369_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x203369_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203369_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203369_var_QuestId, varState, -1 )
					 
				end
	end
end

function x203369_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203369_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203369_var_ExpBonus )
		end
		if x203369_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203369_var_BonusMoney1 )
		end
		if x203369_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203369_var_BonusMoney2 )
		end
		if x203369_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203369_var_BonusMoney3 )
		end
		if x203369_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203369_var_BonusMoney4 )
		end
		if x203369_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203369_var_BonusMoney5 )
		end
		if x203369_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203369_var_BonusMoney6 )
		end
		for varI, item in x203369_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203369_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203369_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203369_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203369_var_QuestId) > 0 then
			if x203369_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203369_var_QuestName)
						TalkAppendString(varMap,x203369_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203369_var_FileId, x203369_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203369_var_QuestName)
						TalkAppendString(varMap,x203369_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203369_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203369_var_FileId, x203369_var_QuestId);
			end
  elseif x203369_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203369_var_QuestName)
			TalkAppendString(varMap,x203369_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			
			for varI, item in x203369_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203369_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203369_var_QuestHelp )
			end
			x203369_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
				
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203369_var_FileId, x203369_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end



function x203369_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203369_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203369_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203369_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203369_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203369_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,0 )
	        return 1
	end
	return 0
end

function x203369_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203369_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203369_var_QuestId  )
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
		if x203369_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203369_var_QuestId, x203369_var_FileId, 1, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203369_Msg2toplayer( varMap, varPlayer,0)
						
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203369_var_QuestId)       
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,1 )
		  		end
	 	end                                                                    
	     
end


function x203369_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203369_var_QuestId) <= 0 then
				return 
		end
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203369_var_QuestId)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		
		local a = DelQuest(varMap, varPlayer, x203369_var_QuestId)
		if a>0 then
	  x203369_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	  local num = GetItemCount(varMap, varPlayer,x203369_var_itemid)
	  if num >0 then
	  DelItem(varMap, varPlayer,x203369_var_itemid,num)
	  end
	  end
end

function x203369_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203369_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203369_var_BonusChoiceItem do
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

function x203369_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203369_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203369_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203369_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203369_var_QuestId) > 0 then
				x203369_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203369_var_QuestId)			
				x203369_GetBonus( varMap, varPlayer,varTalknpc)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
				LuaCallNoclosure( 203370, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203369_var_QuestIdNext )	
				local num = GetItemCount(varMap, varPlayer,x203369_var_itemid)
				if num > 0 then
				DelItem(varMap, varPlayer,x203369_var_itemid,num)
				end
		  		NpcTalk(varMap,varTalknpc,x203369_var_npctalk[1],varPlayer)
   end
end

function x203369_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203369_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203369_var_ExpBonus);
  	end
		if x203369_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203369_var_BonusMoney1 )
	  end
		if x203369_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203369_var_BonusMoney2 )
	  end
		if x203369_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203369_var_BonusMoney3 )
		end
		if x203369_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203369_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203369_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203369_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203369_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203369_var_BonusMoney6)
		end
end

function x203369_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203369_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203369_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203369_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203369_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203369_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203369_var_QuestName.."！", 0, 3)
				if x203369_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203369_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203369_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203369_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203369_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203369_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203369_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203369_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203369_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203369_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203369_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203369_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203369_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203369_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203369_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203369_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203369_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203369_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203369_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
		end
end



function x203369_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

	if	varObjData ==x203369_var_DemandKill[1].varId then
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
	                 if IsHaveQuest(varMap,humanObjId, x203369_var_QuestId) > 0 then
	                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203369_var_QuestId)
						if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 3 then
								SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
								Msg2Player(varMap, humanObjId, format("你获得鹿茸 %d/3", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
								StartItemTask(varMap)	
									ItemAppend( varMap, x203369_var_itemid,1 )
								DeliverItemListSendToPlayer(varMap,varPlayer)
								x203369_CheckSubmit( varMap, humanObjId)
								if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203369_var_DemandKill[1].varNum then	
										--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
								end
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
								local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203369_var_QuestId)
								if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 3 then
								SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
								Msg2Player(varMap, humanObjId, format("你获得鹿茸 %d/3", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
								StartItemTask(varMap)	
									ItemAppend( varMap, x203369_var_itemid,1 )
								DeliverItemListSendToPlayer(varMap,varPlayer)
								x203369_CheckSubmit( varMap, humanObjId)
								if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203369_var_DemandKill[1].varNum then	
										--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
								end
								end
								
							end
						end
					end
			end
		end
	end
	

end


function x203369_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203369_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203369_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203369_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203369_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203369_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203369_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203369_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203369_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203369_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
