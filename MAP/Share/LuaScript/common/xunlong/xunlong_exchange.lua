
x310055_var_ScritpId  =  310055

x310055_var_UICommandID = 100
x310055_var_QuestName = "天龙魂兑换"
x310055_var_ContinueInfo="\t#W您有#R%d#W个@item_%d#W，可以兑换成#R%d#W个@item_%d#W，要进行兑换吗？"
x310055_var_ItemId_src = 12030026
x310055_var_ItemId_target  = 12030108




function x310055_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x310055_var_ScritpId, x310055_var_QuestName,3);
end




function x310055_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	local nSrcItemCount = GetItemCountInBag( varMap, varPlayer, x310055_var_ItemId_src)
	local nTargetItemCount = nSrcItemCount
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310055_var_QuestName)
		TalkAppendString(varMap,format(x310055_var_ContinueInfo,nSrcItemCount,x310055_var_ItemId_src,nTargetItemCount,x310055_var_ItemId_target))
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310055_var_ScritpId, -1)

end





function x310055_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x310055_ProcAccept(varMap, varPlayer, varTalknpc)

	local nSrcItemCount = GetItemCountInBag( varMap, varPlayer, x310055_var_ItemId_src)	
	local nTargetItemCount = nSrcItemCount
	
	if nSrcItemCount > 0 then	
	
		local varRet = DelItemByIDInBag(varMap,varPlayer,x310055_var_ItemId_src,nSrcItemCount)
		if varRet <= 0 then
 			StartTalkTask(varMap)
				TalkAppendString(varMap,format("#cffcf0删除%d个@item_%d失败",nSrcItemCount,x310055_var_ItemId_src))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
            return
		end

		StartItemTask(varMap)
			ItemAppend( varMap, x310055_var_ItemId_target, nTargetItemCount )
		varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			StartTalkTask(varMap)
				TalkAppendString(varMap,format("#cffcf00恭喜您，兑换了%d个@item_%d",nTargetItemCount,x310055_var_ItemId_target))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else			
			
			StartItemTask(varMap)
				ItemAppend( varMap, x310055_var_ItemId_src, nSrcItemCount )
			StopItemTask(varMap,varPlayer)
					
			StartTalkTask(varMap)
				TalkAppendString(varMap,format("#cffcf00抱歉，兑换%d个@item_%d失败",nTargetItemCount,x310055_var_ItemId_target))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			

		end
	else
        Msg2Player(varMap, varPlayer, "您的背包中没有沉寂的天龙魂，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "您的背包中没有沉寂的天龙魂，无法兑换", 0, 3)	
	end
	    
end




















