--DECLARE_QUEST_INFO_START--
x330050_var_FileId          			= 330050
x330050_var_QuestName       			= "【个人】铁人三项的挑战"
x330050_var_QuestInfo					= "\t快速完成1次铁人三项？我也觉得这个挑战有点高端，但你放心，如果你真的完成这个任务，我保证你以后可以永远用体力值完成铁人三项任务。"
x330050_var_QuestCompleted				= "\t干的不错！以后你可以用体力值完成铁人三项任务了。"
x330050_var_QuestRuse					= "\t#W快速完成#R1次#W铁人三项\n\t（#W在铁人三项中获得双倍奖励，即为快速完成1次铁人三项）"
x330050_var_QuestHelp					= "\t该任务完成后，你可以永远用体力值来完成铁人三项任务。"
x330050_var_LevelLess = 70
x330050_var_QuestId						= 1401
x330050_var_AcceptNPC					= 139094
x330050_var_GetPlayerExp				= 310000
x330050_var_GetPlayerSilver				= 4800
--DECLARE_QUEST_INFO_STOP--

function x330050_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	if GetLevel(varMap, varPlayer) < 70 then
		return
		end

	if IsQuestHaveDone(varMap, varPlayer, x330050_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuestNM(varMap,varPlayer, x330050_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x330050_var_QuestId)
		TalkAppendButton(varMap, x330050_var_QuestId, x330050_var_QuestName, varState)
	end
	
end



function x330050_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)

	
	if IsHaveQuestNM( varMap, varPlayer, x330050_var_QuestId ) > 0 then
		local bDone = x330050_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x330050_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x330050_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local AcceptNPCGUID = x330050_var_AcceptNPC		
		if AcceptNPCGUID == varTalkNpcGUID  then
			x330050_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end	
end



function x330050_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x330050_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local retmiss = AddQuest( varMap, varPlayer, x330050_var_QuestId, x330050_var_FileId, 0, 0, 0, 1)
    if retmiss == 0 then
        Msg2Player(varMap, varPlayer, "接受任务失败！", 8, 3)
        return 0
    else
    		Msg2Player(varMap, varPlayer, "您接受了任务"..x330050_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x330050_var_QuestName.."！", 0, 3)    
        local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x330050_var_QuestId)                                                  
       
        SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, 0)
        x330050_ProcQuestLogRefresh( varMap, varPlayer, x330050_var_QuestId)
    end
                   
                                               
end





function x330050_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x330050_var_QuestName)
		TalkAppendString(varMap,x330050_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x330050_var_GetPlayerExp
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varSilver = format("#{_MONEY%d}",x330050_var_GetPlayerSilver)				
		if x330050_var_GetPlayerSilver > 0 then	
	        AddQuestMoneyBonus1(varMap,x330050_var_GetPlayerSilver)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x330050_var_FileId, varQuest)

end




function x330050_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)
--
--		--任务继续信息
		TalkAppendString(varMap,"#Y"..x330050_var_QuestName)
--		TalkAppendString(varMap,format("%s", x330050_var_QuestInfo))
--		TalkAppendString(varMap," ")
--
--		--任务目标
--		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "\t本任务完成后，你可以永远用体力值来完成铁人三项任务，快去完成吧。");
--
--		--1、经验
--		local level = GetLevel(varMap, varPlayer)
--		local ExpBonus = x330050_var_GetPlayerExp
--		if ExpBonus> 0 then
--			AddQuestExpBonus(varMap, ExpBonus )
--		end
--		local varSilver = format("#{_MONEY%d}",x330050_var_GetPlayerSilver)				
--		if x330050_var_GetPlayerSilver > 0 then	
--	        TalkAppendString(varMap,"#W银卡:"..varSilver)		        	                	        	        
--	    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x330050_var_FileId, varQuest,0);



end


function x330050_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..x330050_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x330050_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：".."\n"..x330050_var_QuestRuse.."\n")

		--提示信息
		if x330050_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x330050_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x330050_var_GetPlayerExp
		local varSilver = format("#{_MONEY%d}",x330050_var_GetPlayerSilver)		
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus.."点")
				TalkAppendString(varMap,"#W银卡:"..varSilver)
		end
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x330050_var_FileId, varQuest)
end



function x330050_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x330050_var_QuestId)  
    local neizheng = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    local strTarget = format( "  找到@npc_139100，快速完成铁人三项任务（%d/1）", neizheng)
	local SubmitNPC = format("@npc_%s", x330050_var_AcceptNPC)
	local varSilver = format("#{_MONEY%d}",x330050_var_GetPlayerSilver)
	local Jiangli	= format("#Y\n奖励内容:\n#W经验值:%s点\n#W银卡:"..varSilver, x330050_var_GetPlayerExp)
	
	StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x330050_var_QuestName,          
                                strTarget,
                                SubmitNPC,                             
                                "去找@npc_139100，快速完成1次铁人三项。\n"..Jiangli,
                                x330050_var_QuestInfo,
                                x330050_var_QuestHelp
                             )

	StopTalkTask(varMap)
	DeliverTalkRefreshQuest( varMap, varPlayer, x330050_var_QuestId);
end



function x330050_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x330050_var_QuestId )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x330050_var_QuestId)
	local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
	if varHaveQuest > 0 then
		if varTalkNpcGUID == x330050_var_AcceptNPC  then
			if QuestNum < 1 then
				TalkAppendButton(varMap, x330050_var_QuestId, x330050_var_QuestName,6, 1)
			else
				TalkAppendButton(varMap, x330050_var_QuestId, x330050_var_QuestName,7, 1)			
			end
		end
	end

end



function x330050_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)				
	if x330050_var_AcceptNPC == varTalkNpcGUID  then
		if QuestNum < 1 then
			return 0
		else
			return 1
		end
	end
end




function x330050_ProcQuestAbandon( varMap, varPlayer,varQuest )


	DelQuestNM( varMap, varPlayer, x330050_var_QuestId)
	local Readme = format("你放弃了任务：%s",x330050_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)
	
end



function x330050_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);



	if(varHaveQuest <= 0) then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "你没有这个任务，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你没有这个任务，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0		
	end



	if varHaveQuest > 0 then
		
		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end						
		x330050_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end



function x330050_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )

    AddExp(varMap, varPlayer, x330050_var_GetPlayerExp)
 	AddMoney( varMap, varPlayer, 1, x330050_var_GetPlayerSilver)   
	QuestCom(varMap, varPlayer, x330050_var_QuestId)    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330050_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x330050_var_GetPlayerExp.."点#cffcf00的奖励")
    StopTalkTask(varMap)
    local Silver =format("#{_MONEY%d}",x330050_var_GetPlayerSilver)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R银卡"..Silver.."#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)     
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x330050_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x330050_var_GetPlayerExp),8,2)
    Msg2Player(varMap,varPlayer,format("获得银卡奖励#R%s#cffcf00",Silver ),8,2)
   
    
end
