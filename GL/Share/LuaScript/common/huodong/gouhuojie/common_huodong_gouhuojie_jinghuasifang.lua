

--DECLARE_QUEST_INFO_START--
x310850_var_FileId = 310850
x310850_var_QuestIdPre =-1
x310850_var_QuestId = 10700
x310850_var_LevelLess	= 	10
x310850_var_QuestIdNext = -1
x310850_var_DemandKill ={{varId=8016 ,varNum=1},{varId=8017 ,varNum=1}}

x310850_var_ExtTarget={{type=20,n=5,target="\t前往王城各地使用圣洁火炬驱散王城中的寒阴之气。"}}
x310850_var_QuestName="【活动】篝火节的仪式"

x310850_var_QuestInfo="\t春回大地，万物复苏。王城中的生灵却仍然笼罩着寒冬的积郁之气，久久不肯散去。勇士，手持这把圣洁火炬去驱散这些积郁之气，让王城迎来真正的春天！"  
x310850_var_QuestTarget={"    前往","击杀#G未净化的寒冬怨灵"}		
x310850_var_QuestCompleted="\t非常好，我能感受到王城的春意愈发的浓郁了！我相信很快王城将迎来真正的春天！"
x310850_var_ContinueInfo="\t寒冬的积郁之气不除净，真正的春天是没法到来的！"
x310850_var_QuestHelp =	""
x310850_var_DemandItem ={}
x310850_var_ExpBonus = 4000
x310850_var_BonusMoney1 =0
x310850_var_BonusMoney2 =0
x310850_var_BonusMoney3 =0
x310850_var_BonusMoney4 =0
x310850_var_BonusMoney5 =0
x310850_var_BonusMoney6 =0
x310850_var_BonusItem	=	{{item=13810522,n=1},{item=12110210,n=2}}
x310850_var_BonusChoiceItem ={}
--x310850_var_NpcGUID = {{ guid = 138011, varName = "金虎"} }
x310850_var_Skill	= {}
--DECLARE_QUEST_INFO_STOP--
x310850_var_NPCTalk ={
"这是神兵留下来最后的力量，一定要挡住他们！",
"这些力量只能暂时提升你的能力，抓紧时间击退他们！",
"不要担心，奋勇厮杀，只有经历战场的士兵才能得到真正的历练！",
}
 x310850_var_place = {
"@npc_80020",
"@npc_80021",
"@npc_80022",
"@npc_80023",
"@npc_80024",
"@npc_80025",
"@npc_80026",
"@npc_80027",
"@npc_80028",
"@npc_80029",
"@npc_80030",
}

 x310850_var_placename = {
"王城西南",
"王城西南",
"王城西南",
"王城西门",
"记忆之门附近",
"王城北部",
"王城东北",
"王城东南",
"王城银币摊附近",
"王城东南",
"王城南门",
}

x310850_var_placepos = {
{x=212 , y=172,},
{x=202 , y=162,},
{x=202 , y=122,},
{x=188 , y=96 ,},
{x=198 , y=53 ,},
{x=237 , y=60 ,},
{x=300 , y=40 ,},
{x=313 , y=147,},
{x=284 , y=143,},
{x=265 , y=215,},
{x=245 , y=212,},

}


function x310850_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  local perYear, perMonth, perDay = GetYearMonthDay();
  if ( perYear == 2012 and perMonth == 4 and perDay >= 17 and perDay <= 30  ) then
		if IsQuestHaveDone(varMap, varPlayer, x310850_var_QuestId) > 0 then
			return
		end

		if GetLevel(varMap,varPlayer) < x310850_var_LevelLess then
			return 
		end
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310850_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310850_var_QuestId, varState, -1 )	
	end		 
end

function x310850_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x310850_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x310850_var_ExpBonus*GetLevel(varMap,varPlayer) )
		end
		if x310850_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x310850_var_BonusMoney1 )
		end
		if x310850_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x310850_var_BonusMoney2 )
		end
		if x310850_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x310850_var_BonusMoney3 )
		end
		if x310850_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x310850_var_BonusMoney4 )
		end
		if x310850_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x310850_var_BonusMoney5 )
		end
		if x310850_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x310850_var_BonusMoney6 )
		end
		for varI, item in x310850_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x310850_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x310850_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x310850_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x310850_var_QuestId) > 0 then
			if x310850_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x310850_var_QuestName) 
						TalkAppendString(varMap,x310850_var_ContinueInfo)
						
						StopTalkTask()	
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310850_var_FileId, x310850_var_QuestId); 

					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x310850_var_QuestName)
						TalkAppendString(varMap,x310850_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x310850_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310850_var_FileId, x310850_var_QuestId);
			end
  elseif x310850_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x310850_var_QuestName)
			TalkAppendString(varMap,x310850_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x310850_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x310850_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x310850_var_QuestHelp )
			end
			x310850_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310850_var_FileId, x310850_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end



function x310850_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local count = x310850_GetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1)
	local saimadate = x310850_GetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE1)
	if saimadate == GetDayOfYear() then
		if count == 1 then
			Msg2Player(varMap, varPlayer, "你今天已经完成了篝火节的仪式任务，请明天再来", 0, 3)
			return 0
		end
	end
	return 1
end

function x310850_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310850_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 4 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
  		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
        return 1
	end
	return 0
end

function x310850_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x310850_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x310850_var_QuestId  )
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
		if x310850_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			local retmiss = AddQuest( varMap, varPlayer, x310850_var_QuestId, x310850_var_FileId, 1, 0, 0,0)
			if retmiss ==0 then
				Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
				return 0
			else
				GamePlayScriptLog( varMap, varPlayer, 3121)
  			x310850_Msg2toplayer( varMap, varPlayer,0)
  			
  			local today = GetDayOfYear()
			x310850_SetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE1,today)
  			end
			
  			local index = random(1,getn(x310850_var_place))
  			
	 		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310850_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,5,index)
			x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)	
			StartItemTask(varMap)
			ItemAppend( varMap, 12271022,1 )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				Msg2Player(varMap, varPlayer, "获得圣洁火炬", 0, 2)
				DeliverItemListSendToPlayer(varMap,varPlayer)
			end
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310850_var_QuestId)
			--SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)	
	 	end                                                                    
	     
end


function x310850_ProcQuestAbandon(varMap, varPlayer, varQuest)	

		if IsHaveQuest(varMap,varPlayer, x310850_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x310850_var_QuestId)
		GamePlayScriptLog( varMap, varPlayer, 3123)
	  	x310850_Msg2toplayer( varMap, varPlayer,1)
	  	local today = GetDayOfYear()
  		local count = x310850_GetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1)
  		if today == x310850_GetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE1) then
  			if count ~= 1 then
  				x310850_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1,1)
  			end
  		else
  			x310850_SetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE1,today)
  			x310850_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1,1)
  		end
  		DelItemByIDInBag(varMap, varPlayer,12271022,1)
end

function x310850_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x310850_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x310850_var_BonusChoiceItem do
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

function x310850_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x310850_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x310850_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x310850_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x310850_var_QuestId) > 0 then
				GamePlayScriptLog( varMap, varPlayer, 3122)
				x310850_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x310850_var_QuestId)
				x310850_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x310850_var_BonusItem do
 					ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x310850_var_BonusChoiceItem do
					if item.item == varRadioSelected then
    			    ItemAppendBind( varMap, item.item, item.n )
					end
	    		end
	    		StopItemTask(varMap,varPlayer)
	    		DeliverItemListSendToPlayer(varMap,varPlayer)
				local today = GetDayOfYear()
	    		local count = x310850_GetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1)
	    		if today == x310850_GetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE1) then
	    			if count ~= 1 then
	    				x310850_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1,1)
	    			end
	    		else
	    	    	x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT1,1)
	    			x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE1,today)
	    		end 
	    		DelItemByIDInBag(varMap, varPlayer,12271022,1)
   end
end

function x310850_GetBonus( varMap, varPlayer,varTalknpc)
	if x310850_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x310850_var_ExpBonus*GetLevel(varMap,varPlayer));
  	end
	if x310850_var_BonusMoney1 > 0 then
	   AddMoney( varMap, varPlayer, 1, x310850_var_BonusMoney1 )
	end
	if x310850_var_BonusMoney2 > 0 then
	   AddMoney( varMap, varPlayer, 0, x310850_var_BonusMoney2 )
	end
	if x310850_var_BonusMoney3 > 0 then
    AddMoney( varMap, varPlayer, 3, x310850_var_BonusMoney3 )
	end
	if x310850_var_BonusMoney4 > 0 then
	local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x310850_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
	end
	if x310850_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x310850_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
	end
	if x310850_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x310850_var_BonusMoney6)
	end
end

function x310850_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x310850_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x310850_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x310850_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x310850_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x310850_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x310850_var_QuestName.."！", 0, 3)
				if x310850_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x310850_var_ExpBonus*GetLevel(varMap,varPlayer).."#cffcf00的奖励", 0, 2)
  			end
				if x310850_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x310850_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x310850_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x310850_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x310850_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x310850_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x310850_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x310850_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x310850_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x310850_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x310850_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x310850_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x310850_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
--    local bFind  = 0
--    for varI ,item in x310850_var_NpcGUID do
--        if item.guid == varTalkNpcGUID then
--            bFind = 1
--            break
--        end
--    end
--    if bFind == 0 then
--        return
--    end
--		if IsHaveQuest(varMap,varPlayer, x310850_var_QuestId) > 0 then
--				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310850_var_QuestId)
--				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310850_var_QuestId, varState, -1 )
--				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
--		end
end

function x310850_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	if IsHaveQuest(varMap,varPlayer, x310850_var_QuestId) <= 0 then return end
    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310850_var_QuestId)
	--x310850_var_QuestTarget[1] ="前往"..x310850_var_place[index].."使用#G背包中（B键）的#W圣洁火炬，驱散寒冬的积郁之气。"
	StartTalkTask( varMap)
	x310850_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    AddQuestLogCustomText( varMap,
							"",									
                            x310850_var_QuestName,
                           	x310850_var_QuestTarget[1]..x310850_var_place[GetQuestParam(varMap,varPlayer,varQuestIdx,5)].."使用#G背包中（B键）#W的圣洁火炬"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1)),
                            "",       
                            "\t使用#G背包中的圣洁火炬#W或者击杀积郁之气聚集而成的#G寒阴之灵#W都能净化王城的积郁之气",
                            x310850_var_QuestInfo,
                            x310850_var_QuestHelp			
                            )
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
	
	
end

function x310850_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
--	if	varObjData ==x310850_var_DemandKill[1].varId  then
--	--获取仇恨列表个数
--	local  num =GetMonsterThreatListCount(varMap, varObj)
--	local mark = 0
--	--判断仇恨列表里面是否有玩家
--	if num >0 then
--		for i=0,num do
--			local PlayerId = GetMonsterThreat(varMap, varObj, i)
--			if GetObjType(varMap, varObj) == 1 then
--				mark =1
--				break
--			end
--		end
--	end
--	--秒杀怪走这里
--	if num <=0 or mark ==0 then
--		local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
--		for varI = 0, KilledNum-1 do
--			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
--            if humanObjId ~= -1 then
--                 if IsHaveQuest(varMap,humanObjId, x310850_var_QuestId) > 0 then
--                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x310850_var_QuestId)
--					if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 4 then
--						SetQuestByIndex(varMap,humanObjId,varQuestIdx,1,GetQuestParam(varMap,humanObjId,varQuestIdx,1)+1)
--						Msg2Player(varMap, humanObjId, format("你击毙了寒阴之灵"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1))), 0, 3)
--						x310850_CheckSubmit( varMap, humanObjId)
--						x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)	
--					end
--                end
--            end
--		end
--		return
--	end
--
--	local KillerObj = {}
--
----------------------------只要进入仇恨列表就共享怪物计次Begin----------------------------
--	local KilledNum = GetMonsterThreatListCount( varMap, varObj ) --取得这个怪物仇恨列表中的人数
--	for i = 0, KilledNum-1 do
--		local PlayerId = GetMonsterThreat(varMap, varObj, i) --取得这个怪物仇恨列表的人的varObj
--		if (PlayerId ~= -1) and (IsObjValid (varMap,PlayerId) == 1 ) then
--			local TeamNum = 1
--			local humanObjId = PlayerId
--			local TeamId = GetTeamId(varMap, PlayerId)
--				if TeamId ~= -1 then
--					TeamNum = GetNearTeamCount(varMap, PlayerId)
--				end
--				for j = 0, TeamNum -1 do
--					if TeamId ~= -1 then
--						humanObjId = GetNearTeamMember(varMap, PlayerId, j)
--					end
--					if 1 ~= KillerObj[humanObjId] then
--						KillerObj[humanObjId] = 1
--						if IsHaveQuest( varMap, humanObjId, varQuest ) > 0 then	--如果这个人拥有任务
--						
--							local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x310850_var_QuestId)
--							if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 4 then
--								SetQuestByIndex(varMap,humanObjId,varQuestIdx,1,GetQuestParam(varMap,humanObjId,varQuestIdx,1)+1)
--								Msg2Player(varMap, humanObjId, format("你击毙了寒阴之灵"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1))), 0, 3)
--								x310850_CheckSubmit( varMap, humanObjId)
--								x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)	
--							end
--							
--						end
--					end
--				end
--		end
--	end
--
--
--	-----------------------------------------------------------------------	
--	--击杀海都	
--	-----------------------------------------------------------------------
--elseif varObjData ==x310850_var_DemandKill[2].varId then
--
--	--获取仇恨列表个数
--	local  num =GetMonsterThreatListCount(varMap, varObj)
--	local mark = 0
--	--判断仇恨列表里面是否有玩家
--	if num >0 then
--		for i=0,num do
--			local PlayerId = GetMonsterThreat(varMap, varObj, i)
--			if GetObjType(varMap, varObj) == 1 then
--				mark =1
--				break
--			end
--		end
--	end
--	--秒杀怪走这里
--	if num <=0 or mark ==0 then
--		local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
--		for varI = 0, KilledNum-1 do
--			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
--            if humanObjId ~= -1 then
--                 if IsHaveQuest(varMap,humanObjId, x310850_var_QuestId) > 0 then
--                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x310850_var_QuestId)
--					if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 4 then
--						SetQuestByIndex(varMap,humanObjId,varQuestIdx,1,4)
--						Msg2Player(varMap, humanObjId, "你击毙了寒阴之王"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1)), 0, 3)
--						x310850_CheckSubmit( varMap, humanObjId)
--						x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)	
--					end
--                end
--            end
--		end
--		return
--	end
--
--	local KillerObj = {}
--
----------------------------只要进入仇恨列表就共享怪物计次Begin----------------------------
--	local KilledNum = GetMonsterThreatListCount( varMap, varObj ) --取得这个怪物仇恨列表中的人数
--	for i = 0, KilledNum-1 do
--		local PlayerId = GetMonsterThreat(varMap, varObj, i) --取得这个怪物仇恨列表的人的varObj
--		if (PlayerId ~= -1) and (IsObjValid (varMap,PlayerId) == 1 ) then
--			local TeamNum = 1
--			local humanObjId = PlayerId
--			local TeamId = GetTeamId(varMap, PlayerId)
--				if TeamId ~= -1 then
--					TeamNum = GetNearTeamCount(varMap, PlayerId)
--				end
--				for j = 0, TeamNum -1 do
--					if TeamId ~= -1 then
--						humanObjId = GetNearTeamMember(varMap, PlayerId, j)
--					end
--					if 1 ~= KillerObj[humanObjId] then
--						KillerObj[humanObjId] = 1
--						if IsHaveQuest( varMap, humanObjId, varQuest ) > 0 then	--如果这个人拥有任务
--						    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x310850_var_QuestId)
--							if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 4 then
--								SetQuestByIndex(varMap,humanObjId,varQuestIdx,1,4)
--								Msg2Player(varMap, humanObjId, "你击毙了寒阴之王"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1)), 0, 3)
--								x310850_CheckSubmit( varMap, humanObjId)
--								x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)	
--							end
--						end
--					end
--				end
--		end
--	end
--	end
end


function x310850_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
end

function x310850_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x310850_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x310850_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x310850_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310850_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310850_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310850_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310850_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310850_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x310850_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310850_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

----------------------------------------------------------------------------------------------------------------
--使用圣光火炬
----------------------------------------------------------------------------------------------------------------
function x310850_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1;     
end

function x310850_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310850_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x310850_ProcDeplete( varMap, varPlayer )

	return 1
end

function x310850_ProcActivateOnce( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310850_var_QuestId)
	--if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 4 then
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
	if x310850_var_placepos[GetQuestParam(varMap,varPlayer,varQuestIdx,5)].x ~= PlayerPosX  or x310850_var_placepos[GetQuestParam(varMap,varPlayer,varQuestIdx,5)].y ~= PlayerPosZ then 
		Msg2Player(varMap, varPlayer, "请前往指定地点再使用圣洁火炬", 0, 3)
		return 
	end
	local buffid = 7523
	local ran =random(1,12000)
	if ran > 12 then
		if GetQuestParam(varMap,varPlayer,varQuestIdx,1) < 4 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,GetQuestParam(varMap,varPlayer,varQuestIdx,1)+1)
		Msg2Player(varMap, varPlayer, "你驱散了此地寒阴之气"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1)), 0, 3)
		local index = random(1,getn(x310850_var_place))
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,5,index)
		x310850_var_QuestTarget[1] ="    前往"
		x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,buffid,0)
		NpcTalk(varMap,varPlayer,x310850_var_NPCTalk[1],varPlayer)		
		end
	elseif ran > 2 and ran <= 12 then
		if GetQuestParam(varMap,varPlayer,varQuestIdx,1) < 4 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,GetQuestParam(varMap,varPlayer,varQuestIdx,1)+1)
		Msg2Player(varMap, varPlayer, "此地寒阴之气聚集，圣洁火炬照出了一只寒阴之灵"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1)), 0, 3)
		local objId= CreateMonster(varMap,
					 8016,
					 PlayerPosX,  
					 PlayerPosZ,  
					 1,
					 -1,
					 -1, 
					 -1,  
					 21,  
					 3600000, 
					 0,
					 "寒阴之灵",
					 "")
		local index = random(1,getn(x310850_var_place))
		x310850_var_QuestTarget[1] ="    前往"
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,5,index)
		x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)	
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,buffid,0)	
		NpcTalk(varMap,varPlayer,x310850_var_NPCTalk[1],varPlayer)	
		end
	elseif ran >= 1 and ran <= 2 then
		local name= GetName(varMap,varPlayer)
		local temp = GetQuestParam(varMap,varPlayer,varQuestIdx,5)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,1) < 4 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,GetQuestParam(varMap,varPlayer,varQuestIdx,1)+1)
		Msg2Player(varMap, varPlayer, "此地散布着浓郁的寒阴之气，圣洁火炬惊扰出了恐怖的寒阴之王"..format("（%d/4）",GetQuestParam(varMap,varPlayer,varQuestIdx,1)), 0, 3)
		LuaAllScenceM2Wrold( varMap, "玩家"..name.."在"..x310850_var_placename[temp].."使用圣洁火炬时惊扰出了恐怖的寒阴之王", 5, 1 )
    	LuaAllScenceM2Wrold( varMap, "玩家"..name.."在"..x310850_var_placename[temp].."使用圣洁火炬时惊扰出了恐怖的寒阴之王", 1, 1 )
		local objId= CreateMonster(varMap,
			 8017,
			 PlayerPosX,  
			 PlayerPosZ,  
			 1,
			 970,
			 -1, 
			 -1,  
			 21,  
			 3600000, 
			 0,
			 "寒阴之王",
			 "")
		local index = random(1,getn(x310850_var_place))
		x310850_var_QuestTarget[1] ="    前往"
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,5,index)
		x310850_ProcQuestLogRefresh( varMap,varPlayer,x310850_var_QuestId)		
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,buffid,0)		
		NpcTalk(varMap,varPlayer,x310850_var_NPCTalk[1],varPlayer)
		end
	end
	x310850_CheckSubmit( varMap, varPlayer)
end

function x310850_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
