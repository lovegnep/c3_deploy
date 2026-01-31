--DECLARE_QUEST_INFO_START--
x330049_var_FileId          			= 330049
x330049_var_QuestName       			= "【个人】国家内政的职责"
x330049_var_QuestInfo					= "\t国家内政体现一个人对国家责任心的强弱，责任心强的人，理应得到帝国的嘉奖。从现在开始去完成#R3轮#W国家内政，你今后就可以用体力值完成国家内政任务了。"
x330049_var_QuestCompleted				= "\t干的不错，以后你就可以用体力值来一直完成国家内政任务了。"
x330049_var_QuestRuse					= "\t#W完成#R3轮#W国家内政任务"
x330049_var_QuestHelp					= "\t该任务完成后，你可以永远用体力值来完成国家内政任务"
x330049_var_LevelLess = 65
x330049_var_QuestId						= 1400
x330049_var_AcceptNPC					= 139094
x330049_var_QuestNPC					= {123745, 126041, 129042, 132041}
x330049_var_GetPlayerExp				= 223000
x330049_var_GetPlayerSilver				= 4500
--DECLARE_QUEST_INFO_STOP--
function x330049_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    	if GetLevel(varMap, varPlayer) < 65 then
		return
		end

	if IsQuestHaveDone(varMap, varPlayer, x330049_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuestNM(varMap,varPlayer, x330049_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x330049_var_QuestId)
		TalkAppendButton(varMap, x330049_var_QuestId, x330049_var_QuestName, varState)
	end
	
end



function x330049_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)

	
	if IsHaveQuestNM( varMap, varPlayer, x330049_var_QuestId ) > 0 then
		local bDone = x330049_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x330049_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x330049_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local AcceptNPCGUID = x330049_var_AcceptNPC		
		if AcceptNPCGUID == varTalkNpcGUID  then
			x330049_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end	
end



function x330049_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x330049_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local retmiss = AddQuest( varMap, varPlayer, x330049_var_QuestId, x330049_var_FileId, 0, 0, 0, 1)
    if retmiss == 0 then
        Msg2Player(varMap, varPlayer, "接受任务失败！", 8, 3)
        return 0
    else
				Msg2Player(varMap, varPlayer, "您接受了任务"..x330049_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x330049_var_QuestName.."！", 0, 3)        
        local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x330049_var_QuestId)                                                  
       
        SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, 0)
        x330049_ProcQuestLogRefresh( varMap, varPlayer, x330049_var_QuestId)
    end
                   
                                               
end



function x330049_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x330049_var_QuestName)
--		TalkAppendString(varMap,format("%s", x330049_var_QuestInfo))
--		TalkAppendString(varMap," ")

		--任务目标
--		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "\t本任务完成后，你可以永远用体力值来完成国家内政任务，快去完成吧。");

--		--1、经验
--		local level = GetLevel(varMap, varPlayer)
--		local ExpBonus = x330049_YunBiaoExp(varMap, varPlayer)
--		if ExpBonus> 0 then
--			AddQuestExpBonus(varMap, ExpBonus )
--		end
--		local varSilver = format("#{_MONEY%d}",x330049_var_GetPlayerSilver)		
--		if varSilver > 0 then	
--	        TalkAppendString(varMap,"#W银卡:"..varSilver)		        	                	        	        
--	    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x330049_var_FileId, varQuest,0);



end


function x330049_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x330049_var_QuestName)
		TalkAppendString(varMap,x330049_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x330049_var_GetPlayerExp
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	
		if x330049_var_GetPlayerSilver > 0 then	
			local varSilver = format("#{_MONEY%d}",x330049_var_GetPlayerSilver)		
	        TalkAppendString(varMap,"#W银卡:"..varSilver)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x330049_var_FileId, varQuest)

end





function x330049_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..x330049_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x330049_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：".."\n"..x330049_var_QuestRuse.."\n")

		--提示信息
		if x330049_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x330049_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x330049_var_GetPlayerExp
		local varSilver = format("#{_MONEY%d}",x330049_var_GetPlayerSilver)	
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus.."点")
				TalkAppendString(varMap,"#W银卡:"..varSilver)
		end
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x330049_var_FileId, varQuest)
end



function x330049_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x330049_var_QuestId)  
    local neizheng = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    local strTarget = format( "  找到@npc_%s,完成3轮国家内政任务（%d/3）", x330049_GetPlayerCountry(varMap, varPlayer), neizheng)
	local SubmitNPC = format("@npc_%s", x330049_var_AcceptNPC)
	local varSilver = format("#{_MONEY%d}",x330049_var_GetPlayerSilver)
	local Jiangli	= format("#Y\n奖励内容:\n#W经验值:%s点\n#W银卡:"..varSilver, x330049_var_GetPlayerExp)
	
	StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x330049_var_QuestName,          
                                strTarget,
                                SubmitNPC,                             
                                "去找@npc_123745，完成他发布的一整轮任务。\n"..Jiangli,
                                x330049_var_QuestInfo,
                                x330049_var_QuestHelp
                             )

	StopTalkTask(varMap)
	DeliverTalkRefreshQuest( varMap, varPlayer, x330049_var_QuestId);
end



function x330049_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x330049_var_QuestId )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x330049_var_QuestId)
	local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
	if varHaveQuest > 0 then
		if varTalkNpcGUID == x330049_var_AcceptNPC  then
			if QuestNum < 3 then
				TalkAppendButton(varMap, x330049_var_QuestId, x330049_var_QuestName,6, 1)
			else
				TalkAppendButton(varMap, x330049_var_QuestId, x330049_var_QuestName,7, 1)			
			end
		end
	end

end



function x330049_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)				
	if x330049_var_AcceptNPC == varTalkNpcGUID  then
		if QuestNum < 3 then
			return 0
		else
			return 1
		end
	end
end




function x330049_ProcQuestAbandon( varMap, varPlayer,varQuest )


	DelQuestNM( varMap, varPlayer, x330049_var_QuestId)
	local Readme = format("你放弃了任务：%s",x330049_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)
	
end



function x330049_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

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
		x330049_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x330049_GetPlayerCountry(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x330049_var_QuestNPC[1]
	elseif nCountryIdx == 1 then
		return x330049_var_QuestNPC[2]
	elseif nCountryIdx == 2 then	
		return x330049_var_QuestNPC[3]
	elseif nCountryIdx == 3 then
		return x330049_var_QuestNPC[4]
	end

end


function x330049_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )

    AddExp(varMap, varPlayer, x330049_var_GetPlayerExp)
 	AddMoney( varMap, varPlayer, 1, x330049_var_GetPlayerSilver)   
	QuestCom(varMap, varPlayer, x330049_var_QuestId)    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330049_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x330049_var_GetPlayerExp.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    local Silver =format("#{_MONEY%d}",x330049_var_GetPlayerSilver)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R银卡"..Silver.."#cffcf00文的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)     
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x330049_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x330049_var_GetPlayerExp),8,2)
    Msg2Player(varMap,varPlayer,format("获得银卡奖励#R%s#cffcf00",Silver ),8,2)
   
    
end
