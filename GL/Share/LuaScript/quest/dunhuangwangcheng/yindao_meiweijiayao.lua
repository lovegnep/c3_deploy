

--DECLARE_QUEST_INFO_START--
x256207_var_FileId = 256207
x256207_var_QuestId = 1482
x256207_var_LevelLess	= 	40 
x256207_var_QuestIdNext = -1
x256207_var_Name	={}
x256207_var_ExtTarget={{type=20,n=50,target="获得50条@item_13015012"}}
x256207_var_QuestName="【队伍】美味佳肴"
x256207_var_QuestInfo="\t吃过鲨鱼肉么？现在已经风靡全城，你何不趁机也捞上一笔？进入@npcsp_和氏璧_138513，帮我带来50条@item_13015012#w吧！\n\t此外，参加#g益者三友#w或者#g天坛灯谜会#w都有可能获得@item_13015012#w。"  
x256207_var_QuestTarget="获得50条@item_13015012#W"		
x256207_var_QuestCompleted="\t呵呵，相信这美味佳肴会继续流行下去吧。"					
x256207_var_ContinueInfo="\t你还没有完成任务吗？赶快去帮我带来50条@item_13015012#W吧！"
x256207_var_QuestHelp =	""
x256207_var_DemandItem ={}
x256207_var_BonusMoney1 =0
x256207_var_BonusMoney2 =0
x256207_var_BonusMoney3 =0
x256207_var_BonusMoney4 =0
x256207_var_BonusMoney5 =0
x256207_var_BonusMoney6 =0
x256207_var_BonusItem	=	{}
x256207_var_BonusChoiceItem ={{item=12050228,n=1},{item=12050229,n=1},{item=12050230,n=1}}
x256207_var_ExpBonus = 200000

x256207_var_ReplyNpc = 140417

x256207_var_ItemId  = 13015012
x256207_var_NeedItemCount	= 50
x256207_var_MonsterName	=	"幼鲨"


--DECLARE_QUEST_INFO_STOP--


function x256207_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	
	if nLevel<x256207_var_LevelLess then
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x256207_var_QuestId) > 0 then
		return 
	end
	
	if IsHaveQuest(varMap,varPlayer, x256207_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256207_var_QuestId)

			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256207_var_QuestId, varState, -1 )
	end
end

function x256207_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256207_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256207_var_ExpBonus )
		end
		if x256207_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256207_var_BonusMoney1 )
		end
		if x256207_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256207_var_BonusMoney2 )
		end
		if x256207_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256207_var_BonusMoney3 )
		end
		if x256207_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256207_var_BonusMoney4 )
		end
		if x256207_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256207_var_BonusMoney5 )
		end
		if x256207_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256207_var_BonusMoney6 )
		end
		for varI, item in x256207_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256207_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256207_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256207_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256207_var_QuestId) > 0 then
		if x256207_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x256207_var_QuestName)
					TalkAppendString(varMap,x256207_var_ContinueInfo)
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256207_var_FileId, x256207_var_QuestId);
		else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x256207_var_QuestName)
					TalkAppendString(varMap,x256207_var_QuestCompleted)
					TalkAppendString(varMap," ")
					x256207_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
					StopTalkTask()
					DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256207_var_FileId, x256207_var_QuestId);
		end
  elseif x256207_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256207_var_QuestName)
			TalkAppendString(varMap,x256207_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")

			TalkAppendString( varMap,x256207_var_QuestTarget)
			
			if x256207_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256207_var_QuestHelp )
			end
			x256207_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256207_var_FileId, x256207_var_QuestId);
  end
	
end


function x256207_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local nLevel = GetLevel(varMap, varPlayer)
	
	if nLevel<x256207_var_LevelLess then
		return 0
	end
	return 1
		

end

function x256207_CheckSubmit( varMap, varPlayer, varTalknpc)
	if IsHaveQuestNM(varMap,varPlayer,x256207_var_QuestId) <= 0 then
		
		return 0
    end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256207_var_QuestId )

	local Num = GetItemCount( varMap, varPlayer, x256207_var_ItemId )
	
	if Num < x256207_var_NeedItemCount then 
		
		return 0;
	end

	return 1;
	
end

function x256207_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256207_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256207_var_QuestId  )
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
		
		
		if x256207_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				local retmiss = AddQuest( varMap, varPlayer, x256207_var_QuestId, x256207_var_FileId, 1, 0, 1,1)
				if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
				else
		  			x256207_Msg2toplayer( varMap, varPlayer,0)
						
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256207_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	    			
		  		end
	 	end                                                                    
	     
end


function x256207_ProcQuestAbandon(varMap, varPlayer, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256207_var_QuestId) <= 0 then
		return 
	end
	local n = GetItemCount( varMap, varPlayer, x256207_var_ItemId );

	
	if n > 0 then
		if DelItem(varMap, varPlayer,x256207_var_ItemId,n) ~= 1 then return 0 end
		
	end




	DelQuest(varMap, varPlayer, x256207_var_QuestId)
	x256207_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256207_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256207_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256207_var_BonusChoiceItem do
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

function x256207_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256207_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256207_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				x256207_ShowTips(varMap, varPlayer, format("所需任务物品不足%d",x256207_var_NeedItemCount))
				return 0
	elseif x256207_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256207_var_QuestId) > 0 then
				x256207_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256207_var_QuestId)
				
				x256207_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256207_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256207_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
				local n = GetItemCount( varMap, varPlayer, x256207_var_ItemId );
				if n > 0 then
					if DelItem(varMap, varPlayer,x256207_var_ItemId,n) ~= 1 then return 0 end
					
				end

   end
   
end

function x256207_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256207_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256207_var_ExpBonus);
  	end
		if x256207_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256207_var_BonusMoney1 )
	  end
		if x256207_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256207_var_BonusMoney2 )
	  end
		if x256207_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256207_var_BonusMoney3 )
		end
		if x256207_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256207_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256207_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256207_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256207_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256207_var_BonusMoney6)
		end
end

function x256207_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256207_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256207_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256207_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256207_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256207_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256207_var_QuestName.."！", 0, 3)
				if x256207_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256207_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256207_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256207_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256207_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256207_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256207_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256207_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256207_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256207_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256207_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256207_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256207_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256207_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256207_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	
	
	
	if GetName(varMap, varObj) ~= x256207_var_MonsterName then
		return
	end
	
	x256207_AddLootItem(varMap, varPlayer)

	local bHasTeam = HasTeam(varMap, varPlayer)

	

	if bHasTeam>0 then
	
		local nearteamnum = GetNearTeamCount(varMap, varPlayer);
		

		for varI=0, nearteamnum-1 do
			local memberId = GetNearTeamMember(varMap, varPlayer, varI)

			if memberId~=varPlayer then
				x256207_AddLootItem(varMap, memberId)
			end
			
		end
	end
end

function x256207_AddLootItem(varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x256207_var_QuestId) <= 0 then
		return
	end

	if HaveItem( varMap, varPlayer, x256207_var_ItemId ) <  x256207_var_NeedItemCount then
		
		
		StartItemTask(varMap)
		ItemAppendBind( varMap, x256207_var_ItemId, 1 )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)
			
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end


function x256207_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	x256207_QuestLogRefresh( varMap, varPlayer, varQuest );
end




function x256207_QuestLogRefresh( varMap, varPlayer, varQuest)
	
			
	StartTalkTask(varMap)	
		
	AddQuestLogCustomText( varMap,
							"",						
							"",
							x256207_GetQuestTask(varMap,varPlayer),
							"@npc_"..x256207_var_ReplyNpc,
							"",
							"",
							""






							)

	
	
	
	if x256207_var_ExpBonus > 0 then
		AddQuestExpBonus( varMap, x256207_var_ExpBonus)
	end

	for varI, item in x256207_var_BonusItem do
		AddQuestItemBonus(varMap, item.item, item.n)
	end

	for varI, item in x256207_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end

	

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x256207_GetQuestTask(varMap,varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256207_var_QuestId )
	local nNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	return format("  获得@item_13015012#W(%d/%d)",nNum,x256207_var_NeedItemCount)
end

function x256207_GetQuestMethod(varMap,varPlayer)
	return "攻略"
end

function x256207_GetQuestText(varMap,varPlayer)
	return "描述"
end

function x256207_GetQuestHelp(varMap,varPlayer)	
	return "任务提示"
end

function x256207_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	
end

function x256207_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
		
end

function x256207_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x256207_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
	if IsPlayerStateNormal(varMap, varPlayer) == 0 then
		
		return 
	end

	if GetHp(varMap, varPlayer) <= 0 then
		return
	end

	if varQuest==nil then
		return
	end

	
	if varItemData~=x256207_var_ItemId then
		return
	end
    
    if IsHaveQuestNM(varMap,varPlayer,x256207_var_QuestId) <= 0 then
      
		return 
    end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256207_var_QuestId )

	if x256207_var_NeedItemCount > 0 then
		local Num = GetItemCount( varMap, varPlayer, x256207_var_ItemId )
		
		if Num < x256207_var_NeedItemCount then 
			
			
			
			
			if(varQuest==0)then
				local varText = format("您获得了@item_13015012: %d/%d", Num, x256207_var_NeedItemCount);
				StartTalkTask(varMap);
					TalkAppendString(varMap,varText);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end

			

			
   			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num ) 
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			
			x256207_QuestLogRefresh( varMap, varPlayer, x256207_var_QuestId)
		elseif Num >= x256207_var_NeedItemCount then
			
			local varText = format( "您获得了@item_13015012: %d/%d", Num, x256207_var_NeedItemCount )
			if varText == nil then
				varText = "";
			end
			StartTalkTask(varMap)
			
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )     

			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			x256207_QuestLogRefresh( varMap, varPlayer, x256207_var_QuestId)
		end
	end
end


function x256207_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	
    if x256207_var_ReplyNpc ~= varTalkNpcGUID then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256207_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256207_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256207_var_QuestId, varState, -1 )
		end
end

function x256207_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
end

function x256207_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	
end

function x256207_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256207_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256207_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	
end

function x256207_OpenCheck( varMap, varPlayer, varTalknpc )
	
end

function x256207_ShowTips(varMap, varPlayer, varStr)

	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	
end
