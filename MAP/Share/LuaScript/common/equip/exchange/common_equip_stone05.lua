



x570014_var_FileId 					= 570014

x570014_var_LevelMin					= 60
x570014_var_LevelMax					= 100


x570014_var_ItemId					= 11990113
x570014_var_NeedItemCount				= 2	
x570014_var_ExtraType					=	4 
x570014_var_EXCItemName       = "钻石原石"
x570014_var_ExtraCount				=	2000 
x570014_var_BonusItemId				= 11000218



x570014_var_QuestName				= "【兑换】海蓝钻石"
x570014_var_EnterInfo					= "\n\t您需要2个#G钻石原石#W和2000#G帮贡#W兑换1个#G海蓝钻石#W！"






function x570014_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    
  TalkAppendButton(varMap, x570014_var_FileId, x570014_var_QuestName,3,1);
end




function x570014_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
	
		TalkAppendString(varMap,"#Y"..x570014_var_QuestName)
		
		TalkAppendString(varMap,x570014_var_EnterInfo) 
		
		local suipiannum = GetItemCount(varMap, varPlayer, x570014_var_ItemId) 
		local banggongnum = GetGuildUserPoint( varMap, varPlayer )                    
		local strText1 = format("\n\t您现在有#R%d颗#W#G%s#W！",suipiannum,x570014_var_EXCItemName)  
		local strText2 = format("\n\t您现在有#R%d#W点#G帮贡#W！",banggongnum) 
		
		TalkAppendString(varMap,strText1)
		TalkAppendString(varMap,strText2)                                      		                 		
    AddQuestItemBonus(varMap, x570014_var_BonusItemId,1)
		

	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570014_var_FileId, -1);
end





function x570014_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570014_ProcAccept( varMap, varPlayer )

	x570014_ProcRequestSubmit(varMap, varPlayer);
end









function x570014_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570014_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570014_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570014_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570014_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570014_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570014_var_ItemId )

	if ItemCnt<x570014_var_NeedItemCount then
		local varStr =  format("原石不足%d个！",x570014_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local nExtraCount = 0

	if x570014_var_ExtraType==1 then		
		nExtraCount = GetHonor(varMap, varPlayer)
	elseif x570014_var_ExtraType==2 then	
		nExtraCount = GetShengWang( varMap, varPlayer )
    elseif x570014_var_ExtraType==3 then  
        nExtraCount = GetMoney( varMap, varPlayer, 0 )
    elseif x570014_var_ExtraType==4 then  
        nExtraCount = GetGuildUserPoint( varMap, varPlayer )
	else
		return 0;
	end

	if nExtraCount<x570014_var_ExtraCount then
		local varStr = ""

		if x570014_var_ExtraType==1 then		
			varStr = format("您荣誉不足%d！",x570014_var_ExtraCount)
		elseif x570014_var_ExtraType==2 then	
			varStr = format("您声望不足%d！",x570014_var_ExtraCount)
		elseif x570014_var_ExtraType==3 then  
			varStr = format("您现银不足%d两！",x570014_var_ExtraCount/1000)
        elseif x570014_var_ExtraType==4 then  
   			varStr = format("您帮贡不足%d！",x570014_var_ExtraCount)
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

function x570014_ProcApproveRequest(varMap, varPlayer)

	if x570014_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,x570014_var_ItemId,x570014_var_NeedItemCount) ~= 1 then return 0 end


		local nExtraCount;
		local iRet=-1;
		if x570014_var_ExtraType==1 then		
			nExtraCount = GetHonor(varMap, varPlayer)
			iRet = SubHonor(varMap, varPlayer,x570014_var_ExtraCount)
		elseif x570014_var_ExtraType==2 then	
			nExtraCount = GetShengWang( varMap, varPlayer )
			iRet = SetShengWang(varMap, varPlayer, nExtraCount-x570014_var_ExtraCount)
		elseif x570014_var_ExtraType==3 then  
            nExtraCount = GetMoney(varMap, varPlayer, 0 )
            CostMoney(varMap, varPlayer, 0, x570014_var_ExtraCount)            
        elseif x570014_var_ExtraType==4 then  
            nExtraCount = GetGuildUserPoint( varMap, varPlayer )
            SubGuildUserPoint(varMap,varPlayer,x570014_var_ExtraCount)
		else
			return 0;
		end

		
		

			
		
	end
		
	
	
end


function x570014_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570014_var_BonusItemId, 1 )
	
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

