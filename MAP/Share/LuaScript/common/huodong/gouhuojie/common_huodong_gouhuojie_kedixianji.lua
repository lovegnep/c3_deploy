

--DECLARE_QUEST_INFO_START--
x310853_var_FileId = 310853
x310853_var_QuestIdPre =-1
x310853_var_QuestId = 10701
x310853_var_LevelLess	= 	40
x310853_var_QuestIdNext = -1
x310853_var_Name	={}
x310853_var_ExtTarget={
	{type=20,n=1,target="\t破坏敌方王城及王城周边的篝火堆"},
}
x310853_var_QuestName="【活动】篝火节的斗志"
x310853_var_QuestInfo="\t我们无法容忍敌对国家也在举行这神圣的篝火仪式，你作为王国的勇士有责任去破坏他们篝火堆。记住，这是正义的行为。"  
x310853_var_QuestTarget={
	[ 50]={{"  尝试破坏@npcsp_楼兰瀚月关篝火堆_400751(%d/1)",	 "  #G尝试破坏@npcsp_楼兰瀚月关篝火堆_400751(%d/1)#W",  },
				 {"  尝试破坏@npcsp_楼兰南城炮台篝火堆_400752(%d/1)","  #G尝试破坏@npcsp_楼兰南城炮台篝火堆_400752(%d/1)#W",},
				 {"  尝试破坏@npcsp_楼兰城内篝火堆_400750(%d/1)"  ,  "  #G尝试破坏@npcsp_楼兰城内篝火堆_400750(%d/1)#W",},  },
	[150]={{"  尝试破坏@npcsp_天山瀚月关篝火堆_400755(%d/1)",  "  #G尝试破坏@npcsp_天山瀚月关篝火堆_400755(%d/1)#W",  },
				 {"  尝试破坏@npcsp_天山南城炮台篝火堆_400756(%d/1)","  #G尝试破坏@npcsp_天山南城炮台篝火堆_400756(%d/1)#W",},
				 {"  尝试破坏@npcsp_天山城内篝火堆_400754(%d/1)"  ,  "  #G尝试破坏@npcsp_天山城内篝火堆_400754(%d/1)#W",},  },
	[250]={{"  尝试破坏@npcsp_昆仑瀚月关篝火堆_400758(%d/1)",  "  #G尝试破坏@npcsp_昆仑瀚月关篝火堆_400758(%d/1)#W",  },
			 	 {"  尝试破坏@npcsp_昆仑南城炮台篝火堆_400759(%d/1)","  #G尝试破坏@npcsp_昆仑南城炮台篝火堆_400759(%d/1)#W",},
				 {"  尝试破坏@npcsp_昆仑城内篝火堆_400757(%d/1)"  ,  "  #G尝试破坏@npcsp_昆仑城内篝火堆_400757(%d/1)#W",},  },
	[350]={{"  尝试破坏@npcsp_敦煌瀚月关篝火堆_400761(%d/1)",  "  #G尝试破坏@npcsp_敦煌瀚月关篝火堆_400761(%d/1)#W",  },
				 {"  尝试破坏@npcsp_敦煌南城炮台篝火堆_400762(%d/1)","  #G尝试破坏@npcsp_敦煌南城炮台篝火堆_400762(%d/1)#W",},
				 {"  尝试破坏@npcsp_敦煌城内篝火堆_400760(%d/1)"  ,  "  #G尝试破坏@npcsp_敦煌城内篝火堆_400760(%d/1)#W",},  },
}
x310853_var_QuestCompleted="\t不要灰心，神圣火焰不是那么容易破坏的，你还是非常出色的干扰了敌国的篝火仪式，这些奖励你就拿去吧！"					
x310853_var_ContinueInfo="\t敌国危机重重，不过不要担心，尽力而为就好了。"
x310853_var_QuestHelp =	"\t#G当你一个人的力量很难行走于敌国境内的时候，组队前往将是一个不错的选择#W"
x310853_var_DemandItem ={}
x310853_var_ExpBonus = 15000
x310853_var_BonusMoney1 =0
x310853_var_BonusMoney2 =0
x310853_var_BonusMoney3 =0
x310853_var_BonusMoney4 =0
x310853_var_BonusMoney5 =0
x310853_var_BonusMoney6 =0
x310853_var_BonusChoiceItem ={}
x310853_var_BonusItem	=	{
	{item=13810522,n=5},{item=12110210,n=4}
}
x310853_var_NpcGUID ={
	[ 50]={{guid = 400751, varName = "大篝火堆",},
			   {guid = 400752, varName = "小篝火堆",},
			   {guid = 400750, varName = "小篝火堆",},},                                             
	[150]={{guid = 400755, varName = "大篝火堆",},                                               
				 {guid = 400756, varName = "小篝火堆",},                                               
				 {guid = 400754, varName = "小篝火堆",},},
	[250]={{guid = 400758, varName = "大篝火堆",},
			 	 {guid = 400759, varName = "小篝火堆",},
				 {guid = 400757, varName = "小篝火堆",},},
	[350]={{guid = 400761, varName = "大篝火堆",},
				 {guid = 400762, varName = "小篝火堆",}, 
				 {guid = 400760, varName = "小篝火堆",},},
}
--DECLARE_QUEST_INFO_STOP--
x310853_var_NPCTalk = {
"这兵器送给你，别忘记装备上它。",
}
x310853_var_countrytable = {}

function x310853_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if x310853_var_countrytable[1] == nil then
		x310853_var_countrytable[1] = {}
		x310853_var_countrytable[2] = {}
		x310853_var_countrytable[3] = {}
		x310853_var_countrytable[4] = {}
		local countryid = {50,150,250,350}
		for j = 1 ,4 do
			local ran=-1
			while  ran == -1 or j==ran or IsLeague( j-1, ran-1 ) == 1 do 
				ran=random(1,4)
			end
			x310853_var_countrytable[j]=countryid[ran]
		end
	end
  local perYear, perMonth, perDay = GetYearMonthDay();
  if ( perYear == 2012 and perMonth == 4 and perDay >= 17 and perDay <= 30  ) then
		if IsQuestHaveDone(varMap, varPlayer, x310853_var_QuestId) > 0 then
			return
		end
		if GetLevel(varMap,varPlayer) < x310853_var_LevelLess then
			return 
		end
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310853_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310853_var_QuestId, varState, -1 )
	end
	
end

function x310853_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x310853_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x310853_var_ExpBonus*GetLevel(varMap,varPlayer) )
		end
		if x310853_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x310853_var_BonusMoney1 )
		end
		if x310853_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x310853_var_BonusMoney2 )
		end
		if x310853_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x310853_var_BonusMoney3 )
		end
		if x310853_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x310853_var_BonusMoney4 )
		end
		if x310853_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x310853_var_BonusMoney5 )
		end
		if x310853_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x310853_var_BonusMoney6 )
		end
		for varI, item in x310853_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x310853_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x310853_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varEx)	
	if IsQuestHaveDone(varMap, varPlayer, x310853_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x310853_var_QuestId) > 0 then
		if varEx == -1 then
			if x310853_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x310853_var_QuestName)
						TalkAppendString(varMap,x310853_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310853_var_FileId, x310853_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x310853_var_QuestName)
						TalkAppendString(varMap,x310853_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x310853_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310853_var_FileId, x310853_var_QuestId);
			end
		end
	  elseif x310853_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x310853_var_QuestName)
			TalkAppendString(varMap,x310853_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x310853_var_ExtTarget do
				TalkAppendString( varMap,item.target)
			end 
			if x310853_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x310853_var_QuestHelp )
			end
			x310853_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310853_var_FileId, x310853_var_QuestId);
  end
	
end


function x310853_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local count = x310853_GetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3)
	local saimadate = x310853_GetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE3)
	if saimadate == GetDayOfYear() then
		if count == 1 then
			Msg2Player(varMap, varPlayer, "你今天已经完成过篝火节的斗志任务了，请明天再来", 0, 3)
			return 0
		end
	end
	return 1
end

function x310853_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310853_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 and GetQuestParam(varMap,varPlayer,varQuestIdx,2) == 1 and GetQuestParam(varMap,varPlayer,varQuestIdx,3) == 1 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
  		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
        return 1
	end
	return 0
end

function x310853_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x310853_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		if x310853_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x310853_var_QuestId, x310853_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
						GamePlayScriptLog( varMap, varPlayer, 3131)
			  			x310853_Msg2toplayer( varMap, varPlayer,0)
			  			
			  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310853_var_QuestId)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,4,x310853_var_countrytable[GetCurCountry(varMap,varPlayer)+1])
			  			
			  			local today = GetDayOfYear()
						x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE3,today)
		  			end
		  			
	 	end                                                                    
	     
end


function x310853_ProcQuestAbandon(varMap, varPlayer, varQuest)	

		if IsHaveQuest(varMap,varPlayer, x310853_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x310853_var_QuestId)
		GamePlayScriptLog( varMap, varPlayer, 3133)
	  	x310853_Msg2toplayer( varMap, varPlayer,1)
	  	local today = GetDayOfYear()
  		local count = x310853_GetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3)
  		if today == x310853_GetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE3) then
  			if count ~= 1 then
  				x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3,1)
  			end
  		else
  			x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE3,today)
  			x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3,1)
  		end
			
end

function x310853_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x310853_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x310853_var_BonusChoiceItem do
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

function x310853_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x310853_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x310853_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x310853_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x310853_var_QuestId) > 0 then
				GamePlayScriptLog( varMap, varPlayer, 3132)
				x310853_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x310853_var_QuestId)
				x310853_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x310853_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x310853_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppendBind( varMap, item.item, item.n )
						end
	    		end
	    		StopItemTask(varMap,varPlayer)
	    		DeliverItemListSendToPlayer(varMap,varPlayer)
		 		local today = GetDayOfYear()
	    		local count = x310853_GetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3)
	    		if today == x310853_GetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE3) then
	    			if count ~= 1 then
	    				x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3,1)
	    			end
	    		else
	    			x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_COUNT3,1)
	    			x310853_SetMD(varMap, varPlayer,MD_GOUHUOJIE_DATE3,today)
	    		end 
    		
   end
end

function x310853_GetBonus( varMap, varPlayer,varTalknpc)
	  if x310853_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x310853_var_ExpBonus*GetLevel(varMap,varPlayer));
  	end
		if x310853_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x310853_var_BonusMoney1 )
	  end
		if x310853_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x310853_var_BonusMoney2 )
	  end
		if x310853_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x310853_var_BonusMoney3 )
		end
		if x310853_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x310853_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x310853_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x310853_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x310853_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x310853_var_BonusMoney6)
		end
end

function x310853_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x310853_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x310853_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x310853_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x310853_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x310853_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x310853_var_QuestName.."！", 0, 3)
				if x310853_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x310853_var_ExpBonus*GetLevel(varMap,varPlayer).."#cffcf00的奖励", 0, 2)
  			end
				if x310853_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x310853_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x310853_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x310853_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x310853_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x310853_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x310853_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x310853_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x310853_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x310853_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x310853_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x310853_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x310853_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	if IsHaveQuest(varMap,varPlayer, x310853_var_QuestId) <= 0 then return end
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310853_var_QuestId)
    local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local mapid = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)
	StartTalkTask( varMap)
	x310853_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    AddQuestLogCustomText( varMap,
							"",									
                            x310853_var_QuestName,              
                           	format(x310853_var_QuestTarget[mapid][1][GetQuestParam(varMap,varPlayer,varQuestIdx,1)+1],GetQuestParam(varMap,varPlayer,varQuestIdx,1)).."\n"..format(x310853_var_QuestTarget[mapid][2][GetQuestParam(varMap,varPlayer,varQuestIdx,2)+1],GetQuestParam(varMap,varPlayer,varQuestIdx,2)).."\n"..format(x310853_var_QuestTarget[mapid][3][GetQuestParam(varMap,varPlayer,varQuestIdx,3)+1],GetQuestParam(varMap,varPlayer,varQuestIdx,3)).."\n",            
                            "",    
                            x310853_var_ExtTarget[1].target,   
                            x310853_var_QuestInfo, 				
                            x310853_var_QuestHelp	
                            )
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
	
end


function x310853_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x310853_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x310853_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x310853_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x310853_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x310853_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310853_var_QuestId)
	local curmapid =GetQuestParam(varMap,varPlayer,varQuestIdx,4)  			
	local bFind  = 0
    for varI ,item in x310853_var_NpcGUID[curmapid] do
        if item.guid == varTalkNpcGUID then
            bFind = varI
            break
        end
    end
    if bFind == 0 then
        return
    end
	if IsHaveQuest(varMap,varPlayer, x310853_var_QuestId) > 0 and  bFind >0 then
		if x310853_CheckSubmit( varMap, varPlayer, varTalknpc) <=0 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310853_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,bFind,1)
		  	x310853_ProcQuestLogRefresh( varMap,varPlayer,x310853_var_QuestId)
			StartTalkTask(varMap)
			TalkAppendString(varMap," 熊熊燃烧的火焰在你的破坏下受到极大影响，似乎快要熄灭了似的")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			Msg2Player(varMap, varPlayer," 熊熊燃烧的火焰在你的破坏下受到极大影响，似乎快要熄灭了似的",0,3)
			SendSpecificImpactToUnit(varMap,varTalknpc,varTalknpc,varTalknpc,7550,0)
		  	x310853_CheckSubmit( varMap, varPlayer, varTalknpc)
		end  	
	end
end

function x310853_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310853_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310853_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310853_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310853_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310853_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
function x310853_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310853_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
