



x570010_var_FileId 					= 570010

x570010_var_LevelMin					= 40
x570010_var_LevelMax					= 100


x570010_var_ItemId					= 11990112
x570010_var_NeedItemCount				= 2	
x570010_var_ExtraType					=	1 
x570010_var_ExtraCount				=	1000 
x570010_var_BonusItemId				= 11000214



x570010_var_QuestName				= "【兑换】国传海蓝钻石"
x570010_var_EnterInfo					= "\t2个#g国传钻石碎片#w和1000#g荣誉#w\n\t兑换1个#g国传海蓝钻石#w。"






function x570010_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570010_var_FileId, x570010_var_QuestName,3,1);
	
end




function x570010_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570010_var_QuestName)
		TalkAppendString(varMap,x570010_var_EnterInfo)
        AddQuestItemBonus(varMap, x570010_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570010_var_FileId, -1);
end





function x570010_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570010_ProcAccept( varMap, varPlayer )

	x570010_ProcRequestSubmit(varMap, varPlayer);
end









function x570010_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570010_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570010_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570010_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570010_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570010_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570010_var_ItemId )

	if ItemCnt<x570010_var_NeedItemCount then
		local varStr =  format("碎片不足%d个！",x570010_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local nExtraCount = 0

	if x570010_var_ExtraType==1 then		
		nExtraCount = GetHonor( varMap, varPlayer )
	elseif x570010_var_ExtraType==2 then	
		nExtraCount = GetShengWang( varMap, varPlayer )
	else
		return 0;
	end

	if nExtraCount<x570010_var_ExtraCount then
		local varStr = ""

		if x570010_var_ExtraType==1 then		
			varStr = format("您荣誉不足%d！",x570010_var_ExtraCount)
		elseif x570010_var_ExtraType==2 then	
			varStr = format("您声望不足%d！",x570010_var_ExtraCount)
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

function x570010_ProcApproveRequest(varMap, varPlayer)

	if x570010_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,x570010_var_ItemId,x570010_var_NeedItemCount) ~= 1 then return 0 end

		
		local nExtraCount;
		local iRet=-1;
		if x570010_var_ExtraType==1 then		
			nExtraCount = GetHonor( varMap, varPlayer )
			iRet = SubHonor(varMap, varPlayer, x570010_var_ExtraCount)
		elseif x570010_var_ExtraType==2 then	
			nExtraCount = GetShengWang( varMap, varPlayer )
			iRet = SetShengWang(varMap, varPlayer, nExtraCount-x570010_var_ExtraCount)
		else
			return 0;
		end

			
			
	end
	
		
	
	
end


function x570010_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570010_var_BonusItemId, 1 )
	
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

