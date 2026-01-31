--DECLARE_QUEST_INFO_START--

x300987_var_FileId 	  = 300987
x300987_var_QuestName = "【个人】契丹赋税"
x300987_var_QuestID = 9098  --需要配置任务id,这个任务id仅仅是借用已经存在的
x300987_var_Zone_Pos_X    = {235,245}  --目的地的X范围 ， city_loulanwangcheng_area.ini配置
x300987_var_Zone_Pos_Z    = {130,155} --目的地的z范围 ， city_loulanwangcheng_area.ini配置

x300987_var_QuestTarget = "  押运契丹部赋税，并向@npc_144237报告"
x300987_var_QuestTarget1 ="@npc_144237"
x300987_var_QuestInfo = "\t我契丹耶律一族早年受铁木真大汗知遇之恩，不敢相忘。今后人富泽安康，定当按时缴纳赋税，并将丰年多产之数尽数上缴，以谢皇恩！还要劳烦将军护送赋税。"

x300987_var_QuestHelp = "\t乘坐大元飞行器押运赋税，定然无人敢劫持。"
x300987_var_SubmitInfo = "\t这位将军辛苦了，此税收我会尽数如实登记入案，但其涉及保密内容，还望将军莫与他人言之。"

x300987_var_strQuestAccept      = "你接受了任务：【个人】契丹赋税"

--DECLARE_QUEST_INFO_STOP--


x300987_var_Carinfo ={
			{CarType = 45,BaseAI = 3,AIScript = 3, CarName = "大元飞行器", TimerTick=1000}

		}
x300987_var_ScenePatrol	=	{
								{varMap=44, patrolId=0, PosX=478, PosZ=390, CarType = 45} --参见city_loulanwangcheng_patrolpoint.ini配置
							}


x300987_var_AddBuffId = 1210


x300987_var_RewardTable       = {
                                { minLevel = 70, maxLevel = 80,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 160,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250013, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
}



--npc入口
function x300987_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if IsHaveQuestNM( varMap, varPlayer, x300987_var_QuestID ) == 0 then		

		local playerLevel = GetLevel( varMap, varPlayer);
		local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300987_var_QuestID);
		TalkAppendButton( varMap, x300987_var_QuestID, x300987_var_QuestName, 8);
		
	end

	return 0
	
end


function x300987_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == 44 and varTalkNpcGUID == 144237 then
		if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
			x300987_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有此任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		end
	elseif varMap == 44 and varTalkNpcGUID == 144459 then 
		Level = GetLevel(varMap,varPlayer)
		
		if Level < 70 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"抱歉，70级才可接受此任务。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end		
		
		x300987_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	end
end



--玩家接受任务的时候，创造一个bus,并把玩家放在bus里面
function x300987_ProcAccept(varMap, varPlayer, varTalknpc)
	
end




function x300987_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能上车。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，乘坐战车状态不能领取任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
end


function x300987_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if IsBusMember(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已处于护送/押运状态，无法领取新的押运任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您已处于护送/押运状态，无法领取新的押运任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
			if  x300987_GetDayCount(varMap, varPlayer) >= 1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"很抱歉，您今天任务次数已满，请明天再来做吧！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
			end
			
			if IsQuestFullNM( varMap, varPlayer )==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
			end
			
			local haveImpact = IsHaveSpecificImpact(varMap, varPlayer, 7629)
			if(haveImpact > 0) then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "请取消战车加护状态后，再领取此任务")
				StopTalkTask()
				DeliverTalkTips(varMap, varPlayer)
				
				return 0
			end		
			
			if IsInChariot(varMap, varPlayer) > 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"抱歉，乘坐战车状态不能领取任务。")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
			end

			
			local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x300987_var_QuestID ) 
			if varRet > 0 then 
				varRet = AddQuestNM( varMap, varPlayer,x300987_var_QuestID)
				if varRet > 0 then
					local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300987_var_QuestID )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
				end
			elseif varRet == 0 then
				local varText = "任务获取失败，添加失败"
				Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
				return 0
			elseif varRet == -1 then
				local varText = "背包已满,请整理后再来接任务"
				Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
				return 0
			elseif varRet == -2 then
				local varText = "任务已满，添加任务失败"
				Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
				return 0
 			end
			
			StartTalkTask( varMap)
			TalkAppendString( varMap, x300987_var_strQuestAccept);
			StopTalkTask( varMap);
			DeliverTalkTips( varMap, varPlayer);
			Msg2Player( varMap, varPlayer, x300987_var_strQuestAccept, 8, 2)
			Msg2Player( varMap, varPlayer, x300987_var_strQuestAccept, 8, 3)

			x300987_ProcCreateBus(varMap, varPlayer)	
end


function x300987_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300987_var_QuestName);
		TalkAppendString(varMap, x300987_var_QuestInfo)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300987_var_QuestTarget)
		
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x300987_var_QuestHelp )
		
			local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300987_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
		
	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300987_var_FileId, x300987_var_QuestID);
end


function x300987_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
	StartTalkTask(varMap)

	
	TalkAppendString(varMap,"#Y"..x300987_var_QuestName)
	TalkAppendString(varMap,x300987_var_SubmitInfo)
	TalkAppendString(varMap," ")
	
		local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300987_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end


	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300987_var_FileId , x300987_var_QuestID);
end

function x300987_ProcCreateBus(varMap, varPlayer)   

	local varI=1;
	
	local PosX, PosZ = GetWorldPos(varMap, varPlayer);  --获取创建bus的起始坐标
	local nFaceDir = 0
	
	local ret = CreateBus(varMap, x300987_var_Carinfo[varI].CarType, PosX, PosZ, x300987_var_Carinfo[varI].BaseAI, x300987_var_Carinfo[varI].AIScript, 300988, varPlayer, x300987_var_AddBuffId, -1,-1,nFaceDir)
end

function x300987_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end


	--local varBusID  =  GetBusId(varMap, varPlayer)
	--if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
	--	DeleteBus(varMap, varBusID,1)
	--end

	if x300987_GiveReward(varMap,varPlayer,varButtonClick) <= 0  then
		return 0
	end
	x300987_SetDayCount(varMap, varPlayer)	


	DelQuestNM( varMap, varPlayer, varQuest)
	SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 3101, 0)
	local varReadme = "您完成了任务：【个人】契丹赋税"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	
end

function x300987_ProcQuestAbandon( varMap, varPlayer,varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	if IsBusMember(varMap, varPlayer) == 1 then
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			--if GetBusQuestID(varMap, varBusID) == varQuest then
				LuaCallNoclosure(300988, "ProcLeaveBusEvent", varMap, varPlayer,varBusID)
				--DeleteBus(varMap, varBusID,1)
			--end
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
	local varReadme = "您放弃了任务：【个人】契丹赋税"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	--x300987_SetDayCount(varMap, varPlayer)
  	
end


function x300987_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	if varTalkNpcGUID == submitGuid then	
		TalkAppendButtonNM( varMap, varPlayer, -1, varQuest, 7, x300987_var_FileId ) 
	end
end



function x300987_QuestLogRefresh( varMap, varPlayer, varQuest)

		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
		if varHaveQuest > 0 then
		
			StartTalkTask(varMap)	
			local varLevel = GetLevel(varMap, varPlayer)
		    AddQuestLogCustomText( varMap,
									"",							
									x300987_var_QuestName,      
									x300987_var_QuestTarget,	
									x300987_var_QuestTarget1,			
									x300987_var_QuestHelp,      
									x300987_var_QuestInfo,		
									""							
									)
									
										local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300987_var_RewardTable do
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

function x300987_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300987_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300987_GetDayCount(varMap, varPlayer)
	
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3])
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3])
	return varDaycount
end


--任务完成的时候计次，任务失败或者放弃不计次
function x300987_SetDayCount(varMap, varPlayer)
	
    local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3])
	if varLastday ~= varToday then
			
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3], 1)		
	else
				
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3], varDaycount+1)		
	end
end



function x300987_GiveReward(varMap,varPlayer,varRadioSelected)
	local varLogFmtMsg         = "x300987_GiveReward(varMap,varPlayer,varRadioSelected) : %d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,varMap,varPlayer,varRadioSelected)
	WriteLog(12,varLogMsg) --QUICK_LOG_QUEST

	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    for varI, item in x300987_var_RewardTable do
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
        for varI, item in x300987_var_RewardTable do
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




function x300987_ProcMapPlayerLeave( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, x300987_var_QuestID) == 0 then	
		return
	end

	if IsBusMember(varMap, varPlayer) == 1 then
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			--if GetBusQuestID(varMap, varBusID) == varQuest then
				LuaCallNoclosure(300988, "ProcLeaveBusEvent", varMap, varPlayer,varBusID)
				--DeleteBus(varMap, varBusID,1)
			--end
		end
	end
end
function x300987_CheckComplete( varMap, varPlayer, varTalknpc, varQuest,varExtIdx)
		local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x300987_var_QuestID )
		if 		GetQuestParam( varMap, varTalknpc, varQuestIdx, 0) == 1 and
		   		GetQuestParam( varMap, varTalknpc, varQuestIdx, 7) == 1 then
		   		
		   		return 1
		   		
		end
		
		return 0
end
