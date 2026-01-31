



x570070_var_FileId 					= 570070

x570070_var_LevelMin					= 75
x570070_var_LevelMax					= 100


x570070_var_ItemId1					= 11000220
x570070_var_NeedItemCount1				= 1	
x570070_var_ItemId2					= 11010014
x570070_var_NeedItemCount2				= 1	
x570070_var_BonusItemId				= 11000227



x570070_var_QuestName				= "【兑换】碧彩金刚"
x570070_var_EnterInfo					= "\n\t1颗#G晕光钻石#W和1个#G夜明珠#W兑换1颗#G晕光金刚#W。"






function x570070_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570070_var_FileId, x570070_var_QuestName,3,1);
	
end




function x570070_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		local suipiannum = GetItemCount(varMap, varPlayer, x570070_var_ItemId1)      
		local yemingzhu = GetItemCount(varMap, varPlayer, x570070_var_ItemId2)       
		local strText1 = format("\n\t您现在有#R%d颗#W#G晕光钻石#W！",suipiannum) 
		local strText2 = format("\n\t您现在有#R%d颗#W#G夜明珠#W！",yemingzhu)    
		                                                                         
		
		TalkAppendString(varMap,"#Y"..x570070_var_QuestName)
		TalkAppendString(varMap,x570070_var_EnterInfo)
		TalkAppendString(varMap,strText1)     
		TalkAppendString(varMap,strText2)     
        AddQuestItemBonus(varMap, x570070_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570070_var_FileId, -1);
end





function x570070_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570070_ProcAccept( varMap, varPlayer )

	x570070_ProcRequestSubmit(varMap, varPlayer);
end









function x570070_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570070_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570070_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570070_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570070_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570070_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570070_var_ItemId1 )

	if ItemCnt<x570070_var_NeedItemCount1 then
		local varStr =  format("晕光钻石不足%d个！",x570070_var_NeedItemCount1)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x570070_var_ItemId2 )

	if ItemCnt<x570070_var_NeedItemCount2 then
		local varStr =  format("夜明珠不足%d个！",x570070_var_NeedItemCount2)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	

	return 1;
	
end

function x570070_ProcApproveRequest(varMap, varPlayer)

	if x570070_GetBonus(varMap, varPlayer)>0 then
		local iRet = DelItem(varMap, varPlayer,x570070_var_ItemId1,x570070_var_NeedItemCount1)
    local iRet = DelItem(varMap, varPlayer,x570070_var_ItemId2,x570070_var_NeedItemCount2)

	end
		
	
	
end


function x570070_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570070_var_BonusItemId, 1 )
	
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

