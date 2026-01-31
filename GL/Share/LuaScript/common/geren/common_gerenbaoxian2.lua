--DECLARE_QUEST_INFO_START--

x300611_var_FileId 	  = 300611
x300611_var_QuestKind 				= 	1                       
x300611_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
x300611_QuestName = "【黑金】兑换理赔单"

--DECLARE_QUEST_INFO_STOP--	  
						

x300611_var_SubQuestID				=	{ { varQuest=7556,BaoDanId=13080011,LiPeiDanId=13080017 }, 
										  {	varQuest=7557,BaoDanId=13080012,LiPeiDanId=13080018 },
										  {	varQuest=7558,BaoDanId=13080013,LiPeiDanId=13080019 },
										  {	varQuest=7546,BaoDanId=13080014,LiPeiDanId=13080020 },
										  { varQuest=7547,BaoDanId=13080015,LiPeiDanId=13080021 },
										  { varQuest=7548,BaoDanId=13080016,LiPeiDanId=13080022 },
										}

function x300611_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if x300611_GetBaoDanId(varMap, varPlayer) > 0 then
		TalkAppendButton(varMap,x300611_var_FileId,x300611_QuestName,3);
	end

end




function x300611_ProcEventEntry( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t您可以在我这里把#g保险单#w兑换成#g理赔单#w，然后您就可以去找#g押运保险麦宝#w理赔了！")
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300611_var_FileId, -1);

end


function x300611_GetBaoDanId( varMap, varPlayer )

	local BaoDanId = 0
	for varI,itm in x300611_var_SubQuestID do
		if HaveItem(varMap, varPlayer, itm.BaoDanId) > 0 then
			BaoDanId = varI
			break
		end
	end

	return BaoDanId

end




function x300611_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	local BaoDanId = x300611_GetBaoDanId(varMap, varPlayer)
	if BaoDanId == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，你必需出示保单，才能进行理赔！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		return	
	end

	local SubIndex = 0
	for varI,itm in x300611_var_SubQuestID do
		if IsHaveQuest(varMap, varPlayer, itm.varQuest) > 0 then
			SubIndex = varI
			break;
		end
	end

	if SubIndex > 0 and SubIndex == BaoDanId then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你可以直接回复黑金押运任务,不需要领取理赔单！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		return				
	end

	
	local ItemCnt = GetItemCount( varMap, varPlayer, x300611_var_SubQuestID[BaoDanId].BaoDanId )
	if ItemCnt > 0 then 
		if DelItem(varMap, varPlayer,x300611_var_SubQuestID[BaoDanId].BaoDanId,ItemCnt) ~= 1 then return 0 end
	end

	
	StartItemTask( varMap )
	ItemAppend( varMap, x300611_var_SubQuestID[BaoDanId].LiPeiDanId, 1 )
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"理赔单兑换完成，一路顺风呀！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		local varReadme = "理赔单兑换完成，一路顺风呀！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)

		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足，请整理背包！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
end




function x300611_ProcAccept( varMap, varPlayer )
end



function x300611_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300611_ProcQuestAbandon( varMap, varPlayer,varQuest )
end

