

x570042_var_FileId 					= 570042

x570042_var_LevelMin					= 1
x570042_var_LevelMax					= 100


x570042_var_ItemId					= 11000203
x570042_var_NeedItemCount				= 1	
x570042_var_ExtraType					=	2 
x570042_var_ExtraCount				=	5000 
x570042_var_BonusItemId				= 11000508



x570042_var_QuestName				= "【兑换】冥界声望石"
x570042_var_EnterInfo					= "\n\t#G1#W个#G天传水晶#W和#G5000声望#W兑换1颗#G冥界声望石#W。"






function x570042_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x570042_var_FileId, x570042_var_QuestName,3,1);
	
end




function x570042_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
    local suipiannum = GetItemCount(varMap, varPlayer, x570042_var_ItemId)         
    local shengwangnum = GetShengWang( varMap, varPlayer )                               		
    local strText1 = format("\n\t您现在有#R%d#W个#G天传水晶#W！",suipiannum)   		
    local strText2 = format("\n\t您现在有#R%d#W点#G声望#W！",shengwangnum)        		
		
		TalkAppendString(varMap,"#Y"..x570042_var_QuestName)
		TalkAppendString(varMap,x570042_var_EnterInfo)
		  TalkAppendString(varMap,strText1)
      TalkAppendString(varMap,strText2)   
       AddQuestItemBonus(varMap, x570042_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570042_var_FileId, -1);
end





function x570042_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570042_ProcAccept( varMap, varPlayer )

	x570042_ProcRequestSubmit(varMap, varPlayer);
end









function x570042_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570042_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570042_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570042_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570042_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570042_CheckRequest(varMap, varPlayer)

	

	local ItemCnt = GetItemCount( varMap, varPlayer, x570042_var_ItemId )

	if ItemCnt<x570042_var_NeedItemCount then
		local varStr =  format("天传水晶不足%d个！",x570042_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local nExtraCount = 0

	if x570042_var_ExtraType==1 then		
		nExtraCount = GetHonor(varMap, varPlayer)
	elseif x570042_var_ExtraType==2 then	
		nExtraCount = GetShengWang( varMap, varPlayer )
    elseif x570042_var_ExtraType==3 then  
        nExtraCount = GetPlayerGoodBadValue( varMap, varPlayer )
    elseif x570042_var_ExtraType==4 then  
        nExtraCount = GetGuildUserPoint( varMap, varPlayer )
	else
		return 0;
	end

	if nExtraCount<x570042_var_ExtraCount then
		local varStr = ""

		if x570042_var_ExtraType==1 then		
			varStr = format("您荣誉不足%d！",x570042_var_ExtraCount)
		elseif x570042_var_ExtraType==2 then	
			varStr = format("您声望不足%d！",x570042_var_ExtraCount)
		elseif x570042_var_ExtraType==3 then  
			varStr = format("您威望不足%d！",x570042_var_ExtraCount)
        elseif x570042_var_ExtraType==4 then  
   			varStr = format("您帮贡不足%d！",x570042_var_ExtraCount)
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

function x570042_ProcApproveRequest(varMap, varPlayer)

	if x570042_GetBonus(varMap, varPlayer)>0 then
		local iRet = DelItem(varMap, varPlayer,x570042_var_ItemId,x570042_var_NeedItemCount)

	
		local nExtraCount;
		local iRet=-1;
		if x570042_var_ExtraType==1 then		
			nExtraCount = GetHonor(varMap, varPlayer)
			iRet = SubHonor(varMap, varPlayer,x570042_var_ExtraCount)
		elseif x570042_var_ExtraType==2 then	
			nExtraCount = GetShengWang( varMap, varPlayer )
			iRet = SetShengWang(varMap, varPlayer, nExtraCount-x570042_var_ExtraCount)
		elseif x570042_var_ExtraType==3 then  
            nExtraCount = GetPlayerGoodBadValue(varMap, varPlayer)
            SetPlayerGoodBadValue(varMap, varPlayer, nExtraCount-x570042_var_ExtraCount)            
        elseif x570042_var_ExtraType==4 then  
            nExtraCount = GetGuildUserPoint( varMap, varPlayer )
            SubGuildUserPoint(varMap,varPlayer,x570042_var_ExtraCount)
		else
			return 0;
		end

		
		

			
		
	end
		
	
	
end


function x570042_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570042_var_BonusItemId, 1 )
	
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

