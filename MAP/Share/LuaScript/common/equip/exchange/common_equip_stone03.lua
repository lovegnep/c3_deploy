



x570012_var_FileId 					= 570012

x570012_var_LevelMin					= 40
x570012_var_LevelMax					= 100


x570012_var_ItemId					= 11990112
x570012_var_NeedItemCount				= 4	
x570012_var_ExtraType					=	2 
x570012_var_ExtraCount				=	2000 
x570012_var_BonusItemId				= 11000216



x570012_var_QuestName				= "【兑换】国传晕光钻石"
x570012_var_EnterInfo					= "\t4个#g国传钻石碎片#w和2000#g声望#w\n\t兑换1个#g国传晕光钻石#w。"






function x570012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570012_var_FileId, x570012_var_QuestName,3,1);
	
end




function x570012_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570012_var_QuestName)
		TalkAppendString(varMap,x570012_var_EnterInfo)
        AddQuestItemBonus(varMap, x570012_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570012_var_FileId, -1);
end





function x570012_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570012_ProcAccept( varMap, varPlayer )

	x570012_ProcRequestSubmit(varMap, varPlayer);
end









function x570012_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570012_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570012_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570012_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570012_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570012_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570012_var_ItemId )

	if ItemCnt<x570012_var_NeedItemCount then
		local varStr =  format("碎片不足%d个！",x570012_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local nExtraCount = 0

	if x570012_var_ExtraType==1 then		
		nExtraCount = GetHonor(varMap, varPlayer)
	elseif x570012_var_ExtraType==2 then	
		nExtraCount = GetShengWang( varMap, varPlayer )
	else
		return 0;
	end

	if nExtraCount<x570012_var_ExtraCount then
		local varStr = ""

		if x570012_var_ExtraType==1 then		
			varStr = format("您荣誉不足%d！",x570012_var_ExtraCount)
		elseif x570012_var_ExtraType==2 then	
			varStr = format("您声望不足%d！",x570012_var_ExtraCount)
		else
			return 0;
		end

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	

	return 1;
	
end

function x570012_ProcApproveRequest(varMap, varPlayer)

	if x570012_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,x570012_var_ItemId,x570012_var_NeedItemCount) ~= 1 then return 0 end

		local nExtraCount;
		local iRet=-1;
		if x570012_var_ExtraType==1 then		
			nExtraCount = GetHonor(varMap, varPlayer)
			iRet = SubHonor(varMap, varPlayer,x570012_var_ExtraCount)
		elseif x570012_var_ExtraType==2 then	
			nExtraCount = GetShengWang( varMap, varPlayer )
			iRet = SetShengWang(varMap, varPlayer, nExtraCount-x570012_var_ExtraCount)
		else
			return 0;
		end

		
		

			
		
	end
		
	
	
end


function x570012_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570012_var_BonusItemId, 1 )
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"兑换完成！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1;
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end
end

