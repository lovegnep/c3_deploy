

--DECLARE_QUEST_INFO_START--
x256298_var_FileId = 256298
x256298_var_QuestIdPre =2615
x256298_var_QuestId = 2638
x256298_var_LevelLess	= 	42 
x256298_var_QuestIdNext = -1
x256298_var_Name	={}
x256298_var_ExtTarget={{type=20,n=1,target="在金币商店贵族专属区二等青铜商店购买一个VIP募集券交给帮会管理员"}}
x256298_var_QuestName="【个人】第一次帮会募集"
x256298_var_QuestInfo="\t经验和帮贡有一个很重要也很简单的获得方式：帮会募集。我想，你首先应当熟悉一下帮会募集的流程。在#G金币商店贵族专属区二等青铜商店#W购买一个#GVIP募集券#W交给我吧"  
x256298_var_QuestTarget=""		
x256298_var_QuestCompleted="\t很好，虽然这#GVIP募集券#W只能上交一次，但以后你每天都可以在普通的金币商店购买普通的#G募集券#W交给我。"					
x256298_var_ContinueInfo="\t怎么？还没有拿来#GVIP募集券#W吗？"
x256298_var_QuestHelp =	"VIP募集券在金币商店贵族专属区二等青铜商店可以购买，但需要您的充值达到一定的金额，才能获得其中购买相应物品的许可权。每个帮会每天最多接受50个VIP募集券。"
x256298_var_DemandItem =	{11990116}						
x256298_var_BonusMoney1 =0
x256298_var_BonusMoney2 =0
x256298_var_BonusMoney3 =0
x256298_var_BonusMoney4 =0
x256298_var_BonusMoney5 =0
x256298_var_BonusMoney6 =0
x256298_var_BonusItem	=	{}
x256298_var_BonusChoiceItem ={}
x256298_var_ExpBonus = 1200000
x256298_var_BonusMoney8 =300
x256298_var_GuildExpBonus =1
x256298_var_NpcGUID ={{ guid = 132022, varName = "帮会管理员"} }
--DECLARE_QUEST_INFO_STOP--

x256298_var_MaxLevel      = 160



function x256298_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256298_var_LevelLess or varLevel >= x256298_var_MaxLevel then
		return
	end
	if GetGuildID( varMap, varPlayer ) == -1 then
		
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256298_var_QuestId) > 0 then 
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x256298_var_QuestIdPre)> 0 then 
	if IsHaveQuest(varMap,varPlayer, x256298_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256298_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256298_var_QuestId, varState, -1 )
	end
	end

end

function x256298_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256298_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256298_var_ExpBonus )
		end
		if x256298_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256298_var_BonusMoney1 )
		end
		if x256298_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256298_var_BonusMoney2 )
		end
		if x256298_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256298_var_BonusMoney3 )
		end
		if x256298_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256298_var_BonusMoney4 )
		end
		if x256298_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256298_var_BonusMoney5 )
		end
		if x256298_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256298_var_BonusMoney6 )
		end
		if x256298_var_BonusMoney8 > 0 then
			AddQuestMoneyBonus8(varMap, x256298_var_BonusMoney8 )
		end
		if x256298_var_GuildExpBonus>0 then
			AddQuestGuildExpBonus(varMap,x256298_var_GuildExpBonus)
		end
		for varI, item in x256298_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256298_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256298_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256298_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256298_var_QuestId) > 0 then
			if x256298_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256298_var_QuestName)
				TalkAppendString(varMap,x256298_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256298_var_FileId, x256298_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256298_var_QuestName)
				TalkAppendString(varMap,x256298_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256298_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256298_var_FileId, x256298_var_QuestId);
			end
  elseif x256298_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256298_var_QuestName)
			TalkAppendString(varMap,x256298_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256298_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256298_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256298_var_QuestHelp )
			end
			x256298_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256298_var_FileId, x256298_var_QuestId);
  end
	
end


function x256298_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256298_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x256298_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x256298_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
	
end


function x256298_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256298_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
















		
		if x256298_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then

					local retmiss = AddQuest( varMap, varPlayer, x256298_var_QuestId, x256298_var_FileId, 0, 0, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256298_Msg2toplayer( varMap, varPlayer,0)
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,1 )
		  			
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,1 )
					for varI, item in x256298_var_DemandItem do
						if GetItemCount(varMap,varPlayer,item) >= 1 then		
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256298_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,0 )
		  					
		  					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,0 )
						end
					end
					
					end
		  			
	 	end                                                                    
	     
end


function x256298_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256298_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256298_var_QuestId)
	  x256298_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,0 )
		
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,0 )	
end

function x256298_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256298_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256298_var_BonusChoiceItem do
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

function x256298_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256298_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256298_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256298_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif GetGuildID( varMap, varPlayer ) == -1 then
		
				StartTalkTask(varMap)
				TalkAppendString(varMap,"你需要先加入一个帮会！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
		
	else
				GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_VIP_COLLECT_COUNT, x256298_var_FileId, -1, "ProcReturn1" );		
   	end
   
end

function x256298_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)
		

	if QuestData >= 49 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，每个帮会每天只能接受50次VIP募集券，请明日再来")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	elseif DelQuest(varMap, varPlayer, x256298_var_QuestId) > 0 then
				local guildid = GetGuildID(varMap,varPlayer);
				SetGuildQuestData(varMap, guildid, GD_GUILD_INDEX_VIP_COLLECT_COUNT, 1, 1 );	
				x256298_Msg2toplayer( varMap, varPlayer,2)
				if DelItem( varMap,varPlayer,11990116,1 ) ~= 1 then return 0 end
				QuestCom(varMap, varPlayer, x256298_var_QuestId)
				
				x256298_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256298_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256298_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x256298_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256298_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256298_var_ExpBonus);
  	end
		if x256298_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256298_var_BonusMoney1 )
	  end
		if x256298_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256298_var_BonusMoney2 )
	  end
		if x256298_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256298_var_BonusMoney3 )
		end
		if x256298_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256298_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256298_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256298_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256298_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256298_var_BonusMoney6)
		end

		if x256298_var_BonusMoney8 > 0 then
		AddGuildUserPoint(varMap,varPlayer,x256298_var_BonusMoney8)	
		local BonusMoney8 = x256298_var_BonusMoney8
		local pointText = "获得#R帮贡"..BonusMoney8.."点#o的奖励"
		StartTalkTask(varMap)
		TalkAppendString(varMap, pointText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
  		Msg2Player(varMap,varPlayer,pointText,8,2)
		end

	local bangExp = x256298_var_GuildExpBonus 
	if bangExp > 0 then
		AddGuildExp(varMap,varPlayer,bangExp)
		StartTalkTask(varMap)
		TalkAppendString(varMap, "获得#R帮会经验"..bangExp.."点#o的奖励");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
  		Msg2Player(varMap,varPlayer,"获得#R帮会经验"..bangExp.."点#o的奖励",8,2)
	end
end

function x256298_Msg2toplayer( varMap, varPlayer,type)
			if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256298_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256298_var_QuestName.."！", 0, 3)
			elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256298_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256298_var_QuestName.."！", 0, 3)
			elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256298_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256298_var_QuestName.."！", 0, 3)
			if x256298_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256298_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
			if x256298_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256298_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
			if x256298_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256298_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
			if x256298_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256298_var_BonusMoney3.."文#Y的奖励", 0, 2)
			end
			if x256298_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256298_var_BonusMoney4.."#Y的奖励", 0, 2)
			end
			if x256298_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256298_var_BonusMoney5.."#Y的奖励", 0, 2)
			end
			if x256298_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256298_var_BonusMoney6.."#Y的奖励", 0, 2)
			end
		end
end

function x256298_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256298_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256298_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256298_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256298_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest,optype)
	if	optype	==	0	then
		return
	end
	
	for varI, item in x256298_var_DemandItem do
	
		if varItemData == item then

			if GetItemCount(varMap,varPlayer,item) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256298_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 25,0 )
		  			
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 46,0 )
		  	else
		  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256298_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		  	end
		  	
		  	break
	  	
	  	end
	  	
	end

end


function x256298_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256298_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256298_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256298_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256298_var_QuestId, varState, -1 )
		end
end

function x256298_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256298_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256298_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256298_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256298_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	
end

function x256298_OpenCheck( varMap, varPlayer, varTalknpc )
	
end

function x256298_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	if IsHaveQuest(varMap,varPlayer, x256298_var_QuestId) ~= 1 then
		return 
	end
	
	StartTalkTask(varMap)	
	if x256298_var_ExpBonus> 0 then
		AddQuestExpBonus(varMap, x256298_var_ExpBonus )
	end
	if x256298_var_BonusMoney1 > 0 then
		AddQuestMoneyBonus1(varMap, x256298_var_BonusMoney1 )
	end
	if x256298_var_BonusMoney2 > 0 then
		AddQuestMoneyBonus2(varMap, x256298_var_BonusMoney2 )
	end
	if x256298_var_BonusMoney3 > 0 then
		AddQuestMoneyBonus3(varMap, x256298_var_BonusMoney3 )
	end
	if x256298_var_BonusMoney4 > 0 then
		AddQuestMoneyBonus4(varMap, x256298_var_BonusMoney4 )
	end
	if x256298_var_BonusMoney5 > 0 then
		AddQuestMoneyBonus5(varMap, x256298_var_BonusMoney5 )
	end
	if x256298_var_BonusMoney6 > 0 then
		AddQuestMoneyBonus6(varMap, x256298_var_BonusMoney6 )
	end
	if x256298_var_BonusMoney8 > 0 then
		AddQuestMoneyBonus8(varMap, x256298_var_BonusMoney8 )
	end
	if x256298_var_GuildExpBonus>0 then
		AddQuestGuildExpBonus(varMap,x256298_var_GuildExpBonus)
	end
	for varI, item in x256298_var_BonusItem do
	   	AddQuestItemBonus(varMap, item.item, item.n)
 	end
	for varI, item in x256298_var_BonusChoiceItem do
    	AddQuestRadioItemBonus(varMap, item.item, item.n)
  	end
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, x256298_var_QuestId);
end
