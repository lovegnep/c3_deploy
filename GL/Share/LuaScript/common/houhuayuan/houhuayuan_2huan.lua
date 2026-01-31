--DECLARE_QUEST_INFO_START--
x300989_var_FileId 	  = 300989
x300989_var_QuestKind 				= 	1                       
x300989_var_Mis_Count   = 1
x300989_var_LevelLess					= 	70 

x300989_var_QuestName = "【个人】中饱私囊"

x300989_var_NPCDialog = "\t不知这位将军可否多辛劳一下，将此些物品送与波斯王子。沿途野兽出没，劫匪众多，当然此事完成之后，我也将给予将军不菲的银两，还望将军笑纳。"

x300989_var_QuestInfo = "\t经过仔细察看押运之物，不仅有耶律荣多缴赋税，还有各部族上缴之物。可见赋税征收使定然中饱私囊与波斯王子暗中勾结！为避开眼线，将计就计送往大元公主阔阔真处，告发纳速刺与波斯王子贪污赋税之事。"

x300989_var_QuestHelp = "\t此次虽为秘密押运，但所押运钱财数量之多实在惊人，小心歹人途中劫持。"

x300989_var_QuestTarget = "  将战车交给@npc_144134"
x300989_var_NPCName = "@npc_144134"
x300989_var_ExtTarget					=	{ {type=20,n=1,target="战车"} }
x300989_var_QuestCompleted = "\t噢？你说此押运之钱财物品是由各部族所上缴国家赋税！纳速刺好大的胆子，国家赋税也敢中饱私囊，如此蛀虫不除，我大元不得安定。"
--DECLARE_QUEST_INFO_STOP--


x300989_var_coef1 = 1000

x300989_var_coef2 = 0.3

x300989_var_coef3 = 20
x300989_var_coef4 =1 
x300989_var_coef5 = 2 



x300989_var_yajin = 10000
x300989_var_BusScriptId = 300990

x300989_var_QuestID = 9099;

x300989_var_MinLevel = 50

x300989_var_MaxLevel = 100
x300989_var_BusIndex = 3


x300989_var_RewardTable       = {
                                { minLevel = 70, maxLevel = 80,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 160,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250013, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
}

x300989_var_strQuestAccept      = "你接受了任务：【个人】中饱私囊"



function x300989_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, x300989_var_QuestID ) == 0 then		
		
		local playerLevel = GetLevel( varMap, varPlayer);
		--if( playerLevel >= x300989_var_MinLevel and playerLevel <= x300989_var_MaxLevel) then
			local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300989_var_QuestID);
			TalkAppendString(varMap, x300989_var_NPCDialog );
			TalkAppendButton( varMap, x300989_var_QuestID, x300989_var_QuestName, 8);
		--end
		
	end

	return 0
end



function x300989_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300989_var_QuestName);
		TalkAppendString(varMap, x300989_var_QuestInfo)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300989_var_QuestTarget)
		
		if x300989_var_QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x300989_var_QuestHelp )
		end
		
		
		
		
		local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300989_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end

		
		
	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300989_var_FileId, x300989_var_QuestID);
end





function x300989_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
	
	StartTalkTask(varMap)

	
	TalkAppendString(varMap,"#Y"..x300989_var_QuestName)
	TalkAppendString(varMap,x300989_var_QuestCompleted)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)

    for varI, item in x300989_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
			
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300989_var_FileId , x300989_var_QuestID);

end


function x300989_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == 44 and varTalkNpcGUID == 144134 then
			if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
				x300989_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 	
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"你没有此任务！")
				StopTalkTask()
				DeliverTalkMenu(varMap,varPlayer,varTalknpc);
			end
			
	elseif  varMap == 44 and varTalkNpcGUID == 144237 then
			local varBusID = IsBusMember(varMap, varPlayer);
			if(varBusID ~= 1) then
				if varExtIdx ~= x300989_var_FileId then
					x300989_DispatchQuestInfo( varMap, varPlayer, varTalknpc);
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"你没有此任务！")
					StopTalkTask()
					DeliverTalkMenu(varMap,varPlayer,varTalknpc);
				end
			else
					local varText = "您已处于护送状态，无法领取新的护送任务！"
					StartTalkTask(varMap)
					TalkAppendString(varMap, varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					local varReadme = "您已处于护送状态，无法领取新的护送任务！"
					Msg2Player(varMap,varPlayer,varReadme,8,2)
			end			
	end
		  
end





function x300989_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if IsBusMember(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已处于护送/押运状态，无法领取新的押运任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您已处于护送/押运状态，无法领取新的押运任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	if x300989_GetDayCount_1HUAN(varMap, varPlayer) <= 0 then
		local varReadme = "很抱歉，必须首先完成【个人】契丹赋税" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	if x300989_GetDayCount(varMap, varPlayer) >= 1 then
		local varReadme = "很抱歉，您今天任务次数已满，请明天再来做吧！" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end
	
		if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	
		local haveImpact = IsHaveSpecificImpact(varMap, varPlayer, 7629)
			if(haveImpact > 0) then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "请取消战车加护状态后，再领取此任务")
				StopTalkTask()
				DeliverTalkTips(varMap, varPlayer)
				
				return 0
			end			


	if IsTeamFollow(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "组队跟随状态下不可以接护送任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "组队跟随状态下不可以接护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，乘坐战车状态不能领取任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end			
	
	
	--local CurrMoney = GetMoney(varMap , varPlayer ,0)
	--if CurrMoney < x300989_var_yajin then
	--	local varReadme = "很抱歉，您包裹中的现银不够支付押金，无法接取任务！" 
	--	StartTalkTask(varMap)
	--	TalkAppendString(varMap, varReadme);
	--	StopTalkTask(varMap)
	--	DeliverTalkTips(varMap,varPlayer)
	--	Msg2Player(varMap,varPlayer,varReadme,8,2)
	--	return
	--end			
	

	if AddQuestNM( varMap, varPlayer,varQuest) == 1 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 0);	
	end

	StartTalkTask( varMap)
	TalkAppendString( varMap, x300989_var_strQuestAccept);
	StopTalkTask( varMap);
	DeliverTalkTips( varMap, varPlayer);
	Msg2Player( varMap, varPlayer, x300989_var_strQuestAccept, 8, 2)
	Msg2Player( varMap, varPlayer, x300989_var_strQuestAccept, 8, 3)

	LuaCallNoclosure( x300989_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,varQuest,x300989_var_BusIndex)
	
	
	
end





function x300989_ProcAccept( varMap, varPlayer )
	
end



function x300989_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return 0
	end

	
	local varValid = IsValidMyselfBus(varMap, varPlayer,varQuest)

	if varValid == 0 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "您护送的战车离您太远了，无法提交任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您护送的战车离您太远了，无法提交任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
   
	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
		local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
		if varRet > 0 then 
		if x300989_GiveReward(varMap,varPlayer,varButtonClick) <=0 then
			return 0
		end
		
		local varReadme = "您完成了任务：【个人】中饱私囊"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)

		local varRet = DelQuestNM( varMap, varPlayer, varQuest ) 
		if varRet == 1 then 

			
			x300989_SetDayCount(varMap, varPlayer)
			SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 3101, 0)
			local varBusID  =  GetBusId(varMap, varPlayer)
		  	if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
	  	    
				if GetBusQuestID(varMap, varBusID) == varQuest then
					DeleteBus(varMap, varBusID,1)
				end
		  	end     
		end
	end

	return 0
	
end





function x300989_ProcQuestAbandon( varMap, varPlayer,varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	if IsBusMember(varMap, varPlayer) == 1 then
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			if GetBusQuestID(varMap, varBusID) == varQuest then
				DeleteBus(varMap, varBusID,1)
			end
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

	DelQuestNM( varMap, varPlayer, varQuest)
	local varReadme = "您放弃了任务：【个人】中饱私囊"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	--x300989_SetDayCount(varMap, varPlayer)
  	
end


function x300989_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	if varTalkNpcGUID == submitGuid then	
		TalkAppendButtonNM( varMap, varPlayer, -1, varQuest, 7, x300989_var_FileId ) 
	end
end






function x300989_QuestLogRefresh( varMap, varPlayer, varQuest)

		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
		if varHaveQuest > 0 then
		
			StartTalkTask(varMap)	

		    AddQuestLogCustomText( varMap,
									"",							
									x300989_var_QuestName,      
									x300989_var_QuestTarget,	
									x300989_var_NPCName,			
									x300989_var_QuestHelp,      
									x300989_var_QuestInfo,		
									""							
									)
										local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300989_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end									
									
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		end
end

function x300989_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300989_QuestLogRefresh( varMap, varPlayer, varQuest );
end



--获取第一环任务的次数
function x300989_GetDayCount_1HUAN(varMap, varPlayer)


		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3])
		return varDaycount


end



--获取第二环任务的次数
function x300989_GetDayCount(varMap, varPlayer)


		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DATE[1], MD_HOUHUAYUAN_CIRCLE2_DATE[2], MD_HOUHUAYUAN_CIRCLE2_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[3])
		return varDaycount


end



--设置第二环任务的次数
function x300989_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DATE[1], MD_HOUHUAYUAN_CIRCLE2_DATE[2], MD_HOUHUAYUAN_CIRCLE2_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DATE[1], MD_HOUHUAYUAN_CIRCLE2_DATE[2], MD_HOUHUAYUAN_CIRCLE2_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[3], varDaycount+1)
	end
end



function x300989_GiveReward(varMap,varPlayer,varRadioSelected)

	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    for varI, item in x300989_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                if varRadioSelected == iter.varId then
                    if j <= 2 then
                        varCanBind = 1
                    end
                    varCount = iter.cnt
                    varId = iter.varId
                    break
                end
            end
            break
        end
    end

    
    if varCount == 0 then
        for varI, item in x300989_var_RewardTable do
            for j, iter in item.items do
                if varRadioSelected == iter.varId then
                    if j <= 2 then
                        varCanBind = 1
                    end
                    varCount = iter.cnt
                    varId = iter.varId
                    break
                end
            end
        end
    end

    if varId == 0 or varCount == 0 then
        return 0
    end

	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg, GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,0,varId,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16, varLogMsg)

	StartItemTask(varMap)
    if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
        if varCanBind == 1 then
            ItemAppend( varMap, varId, varCount)
        else
            ItemAppendBind( varMap, varId, varCount)
        end
    else
		ItemAppendBind( varMap, varId, varCount)
    end
		
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("您获得了物品：@itemid_%d",varId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		return 1;
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
	
end
