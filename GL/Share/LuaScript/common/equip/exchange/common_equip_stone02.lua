



x570011_var_FileId 					= 570011

x570011_var_LevelMin					= 40
x570011_var_LevelMax					= 100


x570011_var_ItemId					= 11990112
x570011_var_NeedItemCount				= 1	
x570011_var_ExtraType					=	1 
x570011_var_ExtraCount				=	1000 
x570011_var_BonusItemId				= 11000215



x570011_var_QuestName				= "【兑换】国传水火钻石"
x570011_var_EnterInfo					= "\t1个#g国传钻石碎片#w和1000#g荣誉#w\n\t兑换1个#g国传水火钻石#w。"






function x570011_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570011_var_FileId, x570011_var_QuestName,3,1);
	
end




function x570011_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570011_var_QuestName)
		TalkAppendString(varMap,x570011_var_EnterInfo)
        AddQuestItemBonus(varMap, x570011_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570011_var_FileId, -1);
end





function x570011_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570011_ProcAccept( varMap, varPlayer )

	x570011_ProcRequestSubmit(varMap, varPlayer);
end









function x570011_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570011_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570011_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570011_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570011_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570011_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570011_var_ItemId )

	if ItemCnt<x570011_var_NeedItemCount then
		local varStr =  format("碎片不足%d个！",x570011_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local nExtraCount = 0

	if x570011_var_ExtraType==1 then		
		nExtraCount = GetHonor(varMap, varPlayer)
        
	elseif x570011_var_ExtraType==2 then	
		nExtraCount = GetShengWang( varMap, varPlayer )
	else
		return 0;
	end

	if nExtraCount<x570011_var_ExtraCount then
		local varStr = ""

		if x570011_var_ExtraType==1 then		
			varStr = format("您荣誉不足%d！",x570011_var_ExtraCount)
		elseif x570011_var_ExtraType==2 then	
			varStr = format("您声望不足%d！",x570011_var_ExtraCount)
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

function x570011_ProcApproveRequest(varMap, varPlayer)
	
	if x570011_GetBonus(varMap, varPlayer)>0 then
	
		if DelItem(varMap, varPlayer,x570011_var_ItemId,x570011_var_NeedItemCount) ~= 1 then return 0 end

	
		local nExtraCount;
		local iRet=-1;
		if x570011_var_ExtraType==1 then		
			nExtraCount = GetHonor(varMap, varPlayer)
			iRet = SubHonor(varMap, varPlayer,x570011_var_ExtraCount)
		elseif x570011_var_ExtraType==2 then	
			nExtraCount = GetShengWang( varMap, varPlayer )
			iRet = SetShengWang(varMap, varPlayer, nExtraCount-x570011_var_ExtraCount)
		else
			return 0;
		end

	end
		
	
	
end


function x570011_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570011_var_BonusItemId, 1 )
	
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

