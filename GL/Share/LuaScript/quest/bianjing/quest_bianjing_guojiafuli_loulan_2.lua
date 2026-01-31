
--DECLARE_QUEST_INFO_START--

x260003_var_QuestId = 3135

x260003_var_FileId = 260003







x260003_var_QuestName="【国家】为国效力<二>"

x260003_var_ReplyNpcId = 125501
x260003_var_LevelLess	= 45
x260003_var_NeedLevel = 45
x260003_var_NeedExploit = 12
x260003_var_BonusItem	=	{{item=12030012,n=20}}
x260003_var_QuestTarget ="   获得12点功勋"
x260003_var_QuestMethod = "功勋大于12"              
x260003_var_QuestText = "\t这一次，我对你的期望是#G12点#W功勋值。\n\t每天在发布出国令期间#G完成出国各项任务#W，会获得一定的功勋值。\n\t当你攒够#G12点#W功勋值的时候，再来找我吧。"					
x260003_var_QuestCompleted = "\t你的功勋值不足！只有每天在发布#G出国令期间#W完成出国任务，才会获得功勋值。"
x260003_var_QuestEnd = "\t#G12点#W功勋，有一定的进步！但是还远远不足。 \n\t坚持每天完成出国任务吧。"
x260003_var_QuestHelp = "\t只有每天在发布#G出国令期间#W完成出国任务，才会获得功勋值。"					

function x260003_ShowTips(varMap, varPlayer, tip)	StartTalkTask(varMap)
    TalkAppendString(varMap, tip)
    StopTalkTask()
    DeliverTalkTips(varMap, varPlayer)
end
--DECLARE_QUEST_INFO_STOP--




function x260003_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
		local varQuestName = x260003_var_QuestName
	if varQuest ~= x260003_var_QuestId then
		if IsQuestHaveDone(varMap, varPlayer, varQuest) > 0 then
			return 
		end
	else
		if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
			return 
		end
	
	end	
		if GetPlayerGameData(varMap, varPlayer, MD_COUNTRY_FULI_2[1], MD_COUNTRY_FULI_2[2],MD_COUNTRY_FULI_2[3] ) == 1 then
			return
		end
		
		if GetLevel(varMap, varPlayer) >= x260003_var_NeedLevel then
			local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x260003_var_QuestId);
			TalkAppendButton(varMap, x260003_var_QuestId, varQuestName,varState,5);

		end
end

function x260003_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	if IsHaveQuestNM( varMap, varPlayer, x260003_var_QuestId ) > 0 then	
			local varDone = x260003_CheckSubmit(varMap, varPlayer,varTalknpc, x260003_var_QuestId);
	        if (varDone > 0) then
				x260003_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,x260003_var_QuestId) 
			else
			x260003_DispatchContinueInfo( varMap, varPlayer, varTalknpc,x260003_var_QuestId ) 
			end
	else
			x260003_DispatchQuestInfo( varMap, varPlayer, varTalknpc,x260003_var_QuestId )		
	end
end








function x260003_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	local varQuest = x260003_var_QuestId
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
		x260003_ShowTips(varMap, varPlayer, "您已经接取了该任务，请先完成当前任务")
		return 0;
	end 
	return 1
end

function x260003_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    
    local varScript = x260003_var_FileId
    local varQuestName = x260003_var_QuestName
    
    if IsQuestHaveDone(varMap, varPlayer, varQuest) > 0 then
		return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        x260003_ShowTips(varMap, varPlayer, "可接任务数量已满")
        return 
    end
		
    if x260003_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, varQuest, varScript, 0, 0, 0,1)
    
        if retmiss  > 0 then
			Msg2Player(varMap,varPlayer,"您接受了任务："..varQuestName,8,2)
			if GetExploit(varMap, varPlayer) >= x260003_var_NeedExploit then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,varQuest)                                                  
		            SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		            SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		          
			end
        else
			Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
		end
    end
end




function x260003_ProcAccept( varMap, varPlayer )
	return 1
end




function x260003_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varQuest = x260003_var_QuestId
    local varQuestName = x260003_var_QuestName
    
	if IsHaveQuest(varMap,varPlayer, varQuest) <= 0 then
		return 
	end
	DelQuest(varMap, varPlayer, varQuest)
	Msg2Player(varMap,varPlayer,"您放弃了任务："..varQuestName.."！",8,2)
end




function x260003_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x260003_CheckSubmit( varMap, varPlayer, varTalknpc,varQuest) 
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x260003_var_QuestId)
	local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x260003_var_QuestId)
	TalkAppendButton( varMap, x260003_var_QuestId,x260003_var_QuestName, 7,varState ) 
	return GetQuestParam(varMap, varPlayer, varQuestIdx, 7);
end




function x260003_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x260003_var_QuestName)
		TalkAppendString(varMap,x260003_var_QuestEnd)
		TalkAppendString(varMap," ")
		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "已完成");

		
		for varI, item in x260003_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		
		
			
		
		
		
			
		
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x260003_var_FileId, varQuest);

end





function x260003_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x260003_var_QuestName)
		TalkAppendString(varMap,format("%s", x260003_var_QuestCompleted))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成#r");
		TalkAppendString(varMap, "需要功勋值：12点");

		
		   	
	 	

	
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x260003_var_FileId, varQuest,0);

end





function x260003_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x260003_var_QuestName)
		TalkAppendString(varMap,format("%s", x260003_var_QuestText))
		TalkAppendString(varMap," ")

		
		
		
		

		
		if x260003_var_QuestHelp ~= "" then

			
			TalkAppendString(varMap,format("%s", x260003_var_QuestHelp))
			TalkAppendString(varMap," ")
		end

		
		for varI, item in x260003_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		
		
			
		
		
		
			
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x260003_var_FileId, varQuest);
end

function x260003_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return 0
	end
    local varQuestName = x260003_var_QuestName

    if GetExploit(varMap, varPlayer) < x260003_var_NeedExploit then
        
		StartTalkTask(varMap)
		TalkAppendString(varMap, "你的功勋不够，需要"..x260003_var_NeedExploit.."点才能领取奖励！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
	  	Msg2Player(varMap,varPlayer,"你的功勋不够，需要"..x260003_var_NeedExploit.."点才能领取奖励！",8,2)
    else
		StartItemTask(varMap)                                                    
        for varI, item in x260003_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        
        if StopItemTask(varMap,varPlayer) > 0 then
			if DelQuest(varMap, varPlayer, varQuest) > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer) 
				QuestCom(varMap, varPlayer, x260003_var_QuestId)
				Msg2Player(varMap,varPlayer,"您完成了任务："..varQuestName.."！",8,2)
				SetPlayerGameData(varMap, varPlayer, MD_COUNTRY_FULI_2[1], MD_COUNTRY_FULI_2[2],MD_COUNTRY_FULI_2[3], 1 ) 
			end
			if DelQuestNM( varMap, varPlayer, varQuest) < 1 then
				return 
			end
        else
            StartTalkTask(varMap)
            local varText = "背包空间不足，无法获得物品。"
            TalkAppendString(varMap,varText);
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
        end
   end
end


function x260003_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, x260003_var_QuestId) == 0 then	
		return
	end
	local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x260003_var_QuestId);
	if varTalkNpcGUID == x260003_var_ReplyNpcId then
		if GetExploit(varMap, varPlayer) < x260003_var_NeedExploit then
			TalkAppendButton(varMap, x260003_var_QuestId, x260003_var_QuestName,6,varState);
			else
			 TalkAppendButton(varMap, x260003_var_QuestId, x260003_var_QuestName,7,varState);
		end
	end
end



function x260003_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x260003_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x260003_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



function x260003_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	local varScript = x260003_var_FileId
	local varQuestName = x260003_var_QuestName
	local target =  x260003_var_QuestTarget
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							varQuestName,        
							target,		
							"@npc_"..x260003_var_ReplyNpcId,			
							x260003_var_QuestMethod,             
							x260003_var_QuestText,					
							x260003_var_QuestHelp					
							)
	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x260003_ProcExploitChanged(varMap,varPlayer, exploit)
	local varQuest = x260003_var_QuestId
    
    
	if IsQuestHaveDone(varMap, varPlayer, varQuest) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, varQuest) <= 0 then
		return
	end
	if GetPlayerGameData(varMap, varPlayer, MD_COUNTRY_FULI_2[1], MD_COUNTRY_FULI_2[2],MD_COUNTRY_FULI_2[3] ) == 1 then
		return
	end
	if GetExploit(varMap, varPlayer) >= x260003_var_NeedExploit then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,varQuest)                                                  
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
    else
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,varQuest)                                                  
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	end
end

