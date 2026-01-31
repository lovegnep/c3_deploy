

x570035_var_FileId 					= 570035

x570035_var_LevelMin					= 80
x570035_var_LevelMax					= 100


x570035_var_ItemId1					= 11000221
x570035_var_NeedItemCount1				= 1	
x570035_var_ItemId2					= 11010014
x570035_var_NeedItemCount2				= 2	
x570035_var_BonusItemId				= 11000403



x570035_var_QuestName				= "【兑换】炫彩金刚"
x570035_var_EnterInfo					= "\n\t1颗#G炫彩钻石#W和2个#G夜明珠#W兑换1颗#G炫彩金刚#W。"


function x570035_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570035_var_FileId, x570035_var_QuestName,3,1);
	
end


function x570035_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		local suipiannum = GetItemCount(varMap, varPlayer, x570035_var_ItemId1)       
		local yemingzhu = GetItemCount(varMap, varPlayer, x570035_var_ItemId2)        
		local strText1 = format("\n\t您现在有#R%d颗#W#G炫彩钻石#W！",suipiannum)  
		local strText2 = format("\n\t您现在有#R%d颗#W#G夜明珠#W！",yemingzhu)     
		TalkAppendString(varMap,"#Y"..x570035_var_QuestName)
		TalkAppendString(varMap,x570035_var_EnterInfo)
		TalkAppendString(varMap,strText1)  
		TalkAppendString(varMap,strText2)  
        AddQuestItemBonus(varMap, x570035_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570035_var_FileId, -1);
end



function x570035_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x570035_ProcAccept( varMap, varPlayer )

	x570035_ProcRequestSubmit(varMap, varPlayer);
end





function x570035_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570035_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570035_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570035_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570035_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570035_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570035_var_ItemId1 )

	if ItemCnt<x570035_var_NeedItemCount1 then
		local varStr =  format("炫彩钻石不足%d个！",x570035_var_NeedItemCount1)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x570035_var_ItemId2 )

	if ItemCnt<x570035_var_NeedItemCount2 then
		local varStr =  format("夜明珠不足%d个！",x570035_var_NeedItemCount2)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 3)
		return 0
	end
	

	return 1;
	
end

function x570035_ProcApproveRequest(varMap, varPlayer)


		local iRet = DelItem(varMap, varPlayer,x570035_var_ItemId1,x570035_var_NeedItemCount1)
    local iRet1 = DelItem(varMap, varPlayer,x570035_var_ItemId2,x570035_var_NeedItemCount2)
		if iRet ~= 1 or iRet1 ~= 1 then return end
		
		x570035_GetBonus(varMap, varPlayer)

end


function x570035_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570035_var_BonusItemId, 1 )
	
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

