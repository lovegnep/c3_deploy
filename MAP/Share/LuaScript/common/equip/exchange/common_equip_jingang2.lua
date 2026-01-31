

x570033_var_FileId 					= 570033

x570033_var_LevelMin					= 80
x570033_var_LevelMax					= 100


x570033_var_ItemId1					= 11000219
x570033_var_NeedItemCount1				= 1	
x570033_var_ItemId2					= 11010014
x570033_var_NeedItemCount2				= 1	
x570033_var_BonusItemId				= 11000401



x570033_var_QuestName				= "【兑换】水火金刚"
x570033_var_EnterInfo					= "\n\t1个#G水火钻石#W和1个#G夜明珠#W兑换1个#G水火金刚#W。"


function x570033_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570033_var_FileId, x570033_var_QuestName,3,1);
	
end


function x570033_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		local suipiannum = GetItemCount(varMap, varPlayer, x570033_var_ItemId1)       
		local yemingzhu = GetItemCount(varMap, varPlayer, x570033_var_ItemId2)        
		local strText1 = format("\n\t您现在有#R%d颗#W#G水火钻石#W！",suipiannum)  
		local strText2 = format("\n\t您现在有#R%d颗#W#G夜明珠#W！",yemingzhu)     
		
		TalkAppendString(varMap,"#Y"..x570033_var_QuestName)
		TalkAppendString(varMap,x570033_var_EnterInfo)
		TalkAppendString(varMap,strText1) 
		TalkAppendString(varMap,strText2) 
		
        AddQuestItemBonus(varMap, x570033_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570033_var_FileId, -1);
end



function x570033_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x570033_ProcAccept( varMap, varPlayer )

	x570033_ProcRequestSubmit(varMap, varPlayer);
end





function x570033_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570033_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570033_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570033_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570033_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570033_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570033_var_ItemId1 )

	if ItemCnt<x570033_var_NeedItemCount1 then
		local varStr =  format("水火钻石不足%d个！",x570033_var_NeedItemCount1)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x570033_var_ItemId2 )

	if ItemCnt<x570033_var_NeedItemCount2 then
		local varStr =  format("夜明珠不足%d个！",x570033_var_NeedItemCount2)

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

function x570033_ProcApproveRequest(varMap, varPlayer)


		local iRet = DelItem(varMap, varPlayer,x570033_var_ItemId1,x570033_var_NeedItemCount1)
    local iRet1 = DelItem(varMap, varPlayer,x570033_var_ItemId2,x570033_var_NeedItemCount2)

	
	if iRet ~= 1 or iRet1 ~= 1 then return end
	 x570033_GetBonus(varMap, varPlayer)
	
end


function x570033_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570033_var_BonusItemId, 1 )
	
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

