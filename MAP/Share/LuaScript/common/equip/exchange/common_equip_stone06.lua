



x570015_var_FileId 					= 570015

x570015_var_LevelMin					= 60
x570015_var_LevelMax					= 100


x570015_var_ItemId					= 11990113
x570015_var_NeedItemCount				= 1	
x570015_var_ExtraType					=	1 
x570015_var_ExtraCount				=	6000 
x570015_var_BonusItemId				= 11000219



x570015_var_QuestName				= "【兑换】水火钻石"
x570015_var_EnterInfo					= "\n\t1颗#G钻石原石#W和6000#G荣誉#W兑换1颗#G水火钻石#W。"






function x570015_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570015_var_FileId, x570015_var_QuestName,3,1);
	
end




function x570015_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		local suipiannum = GetItemCount(varMap, varPlayer, x570015_var_ItemId)                        
		local rongyunum = GetHonor(varMap, varPlayer)                                 
		local strText1 = format("\n\t您现在有#R%d颗#W#G钻石原石#W！",suipiannum)  
		local strText2 = format("\n\t您现在有#R%d#W点#G荣誉#W！",rongyunum)                     
		
		  TalkAppendString(varMap,"#Y"..x570015_var_QuestName) 
		  TalkAppendString(varMap,x570015_var_EnterInfo)                                     
		  TalkAppendString(varMap,strText1)                                                           
		  TalkAppendString(varMap,strText2)                                      		                 
			
        AddQuestItemBonus(varMap, x570015_var_BonusItemId,1)
		

	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570015_var_FileId, -1);
end





function x570015_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570015_ProcAccept( varMap, varPlayer )

	x570015_ProcRequestSubmit(varMap, varPlayer);
end









function x570015_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570015_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570015_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570015_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570015_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570015_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570015_var_ItemId )

	if ItemCnt<x570015_var_NeedItemCount then
		local varStr =  format("原石不足%d个！",x570015_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local nExtraCount = 0

	if x570015_var_ExtraType==1 then		
		nExtraCount = GetHonor(varMap, varPlayer)
	elseif x570015_var_ExtraType==2 then	
		nExtraCount = GetShengWang( varMap, varPlayer )
    elseif x570015_var_ExtraType==3 then  
        nExtraCount = GetMoney( varMap, varPlayer, 0 )
    elseif x570015_var_ExtraType==4 then  
        nExtraCount = GetGuildUserPoint( varMap, varPlayer )
	else
		return 0;
	end

	if nExtraCount<x570015_var_ExtraCount then
		local varStr = ""

		if x570015_var_ExtraType==1 then		
			varStr = format("您荣誉不足%d！",x570015_var_ExtraCount)
		elseif x570015_var_ExtraType==2 then	
			varStr = format("您声望不足%d！",x570015_var_ExtraCount)
		elseif x570015_var_ExtraType==3 then  
			varStr = format("您现银不足%d两！",x570015_var_ExtraCount/1000)
        elseif x570015_var_ExtraType==4 then  
   			varStr = format("您帮贡不足%d！",x570015_var_ExtraCount)
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

function x570015_ProcApproveRequest(varMap, varPlayer)

	if x570015_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,x570015_var_ItemId,x570015_var_NeedItemCount) ~= 1 then return 0 end

	
		local nExtraCount;
		local iRet=-1;
		if x570015_var_ExtraType==1 then		
			nExtraCount = GetHonor(varMap, varPlayer)
			iRet = SubHonor(varMap, varPlayer,x570015_var_ExtraCount)
		elseif x570015_var_ExtraType==2 then	
			nExtraCount = GetShengWang( varMap, varPlayer )
			iRet = SetShengWang(varMap, varPlayer, nExtraCount-x570015_var_ExtraCount)
		elseif x570015_var_ExtraType==3 then  
            nExtraCount = GetMoney(varMap, varPlayer, 0 )
            CostMoney(varMap, varPlayer, 0, x570015_var_ExtraCount)            
        elseif x570015_var_ExtraType==4 then  
            nExtraCount = GetGuildUserPoint( varMap, varPlayer )
            SubGuildUserPoint(varMap,varPlayer,x570015_var_ExtraCount)
		else
			return 0;
		end

		
		

			
		
	end
		
	
	
end


function x570015_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570015_var_BonusItemId, 1 )
	
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

