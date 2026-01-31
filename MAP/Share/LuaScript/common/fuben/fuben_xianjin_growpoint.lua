


x700083_CSP_GUID_START              =   248

x700083_var_ScriptList = {700099,700098,700029,700097,700100,700101}
x700083_var_bGathered_StartList ={220,220,220,220,220,220}

function x700083_ProcGpCreate(varMap,growPointType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)

end



function x700083_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	return 0;
	
end

function x700083_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	
	return 0;
	
end



function x700083_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
	
	local varScriptFileId = GetFubenData_Param(varMap, 1);

	local varIndex =0

	for varI,item in x700083_var_ScriptList do
		varIndex = varIndex +1
		if item==varScriptFileId then
			break;
		end
	end

	if varIndex<=0 then
		return
	end

	
	x700083_ProcAnwer(varMap,varPlayer,varIndex)
	

	
end


function x700083_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end


function x700083_ProcAnwer(varMap,varPlayer, varIndex)

	local nParam_Gathered_Start = x700083_var_bGathered_StartList[varIndex]

	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	

	for varI=0, 5 do
        local paramidx = x700083_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
		nGUID = format("%u", nGUID)
		
		

        if nGUID == myGuid then

			local bGathered = GetFubenData_Param(varMap, nParam_Gathered_Start+varI);
			
			
			if bGathered<=0 then
				
				x700083_GetXianJinFubenBonus(varMap,varPlayer, varIndex, varI)
				
				
			else
				x700083_ShowTips(varMap, varPlayer, "您只能采集一次！")
				
			end

			
			break;
           
        end
    end
end


function x700083_GetXianJinFubenBonus(varMap,varPlayer, varIndex, nPlayerIndex)
	local nParam_Gathered_Start = x700083_var_bGathered_StartList[varIndex]
	

	local nLevel = GetFubenData_Param(varMap, 9);
	if varIndex==1 then
		local bufflist = {9011,9012,9013}
		
		local bFind =0
		for varI, item in bufflist do
			if IsHaveSpecificImpact( varMap, varPlayer, item )>0 then
				bFind =1
				break;
				
			end
		end

		if bFind>0 then
			local nMoney = nLevel*1040
			local strMoney = x700083_GetMoneyName(varMap,nMoney)
			
			x700083_ShowTips(varMap, varPlayer, format("获得%s的现银",strMoney))
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s的现银",strMoney))
			AddMoney(varMap, varPlayer, 0, nMoney)

			SetFubenData_Param(varMap, nParam_Gathered_Start+nPlayerIndex,1);
		else
			x700083_ShowTips(varMap, varPlayer, "你没有江湖请柬，无法采集")
		end

	end


	if varIndex==2 then
		local bufflist = {9011,9012,9013}
		
		local bFind =0
		for varI, item in bufflist do
			if IsHaveSpecificImpact( varMap, varPlayer, item )>0 then
				bFind =1
				break;
				
			end
		end
		
		local nShengWangBonus = 620*4*1.3
		if bFind>0 then
			
			
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + nShengWangBonus*2
			SetShengWang( varMap, varPlayer, varShengWang )
            
            local varStr = format("您获得了%d点声望值的奖励。", nShengWangBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)
			Msg2Player(varMap,varPlayer,varStr,4,3)

			local varStr = format("江湖请柬使额外获得了%d点声望值的奖励。", nShengWangBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)
			Msg2Player(varMap,varPlayer,varStr,4,3)

			
		else
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + nShengWangBonus
			SetShengWang( varMap, varPlayer, varShengWang )
            
            local varStr = format("您获得了%d点声望值的奖励。", nShengWangBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)
			Msg2Player(varMap,varPlayer,varStr,4,3)
		end

		SetFubenData_Param(varMap, nParam_Gathered_Start+nPlayerIndex,1);
	end


	if varIndex==3 then
		local nItemId =0

		
		if nLevel>=80 then
			nItemId = 11000203
		elseif nLevel>=60 then
			nItemId = 11000202
		elseif nLevel>=40 then
			nItemId = 11000201
		else
			nItemId = 11000200
		end
		local varItemCount =37
		
		StartItemTask(varMap)
			ItemAppend( varMap, nItemId, varItemCount )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)

			SetFubenData_Param(varMap, nParam_Gathered_Start+nPlayerIndex,1);
		
			x700083_ShowTips(varMap, varPlayer, "采集完成")
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount,nItemId))
		else
			x700083_ShowTips(varMap, varPlayer, "背包空间不足，无法获得物品")
		end
	end

	if varIndex==4 then
		local nItemId =0

		if nLevel>=80 then
			nItemId = 11050004
		elseif nLevel>=65 then
			nItemId = 11050003
		elseif nLevel>=50 then
			nItemId = 11050002
		else
			nItemId = 11050001
		end
		local varItemCount =37
		
		StartItemTask(varMap)
			ItemAppend( varMap, nItemId, varItemCount )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)

			SetFubenData_Param(varMap, nParam_Gathered_Start+nPlayerIndex,1);
			x700083_ShowTips(varMap, varPlayer, "采集完成")
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount,nItemId))
		else
			x700083_ShowTips(varMap, varPlayer, "背包空间不足，无法获得物品")
		end
	end

	if varIndex==5 then
		local nItemId1 =0
		local nItemId2 =0
		local nItemId3 =0

		if nLevel>=70 then
			
			nItemId1 = 11990206
			nItemId2 = 11990306
			nItemId3 = 11030603

		elseif nLevel>=60 then
			nItemId1 = 11990205
			nItemId2 = 11990305
			nItemId3 = 11030603

		elseif nLevel>=50 then
			nItemId1 = 11990204
			nItemId2 = 11990304
			nItemId3 = 11030634

		else
			
			nItemId1 = 11990203
			nItemId2 = 11990303
			nItemId3 = 11030602
		end

		local varItemCount1 =8
		local varItemCount2 =8
		local varItemCount3 =8
		
		StartItemTask(varMap)
			ItemAppend( varMap, nItemId1, varItemCount1 )
			ItemAppend( varMap, nItemId2, varItemCount2 )
			ItemAppend( varMap, nItemId3, varItemCount3 )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)

			SetFubenData_Param(varMap, nParam_Gathered_Start+nPlayerIndex,1);
			x700083_ShowTips(varMap, varPlayer, "采集完成")
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount1,nItemId1))
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount2,nItemId2))
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount3,nItemId3))
		else
			x700083_ShowTips(varMap, varPlayer, "背包空间不足，无法获得物品")
		end
	end

	if varIndex==6 then
		local nItemId1 =11020501
		local nItemId2 =11030405
		local nItemId3 =11030501

		

		local varItemCount1 =8
		local varItemCount2 =8
		local varItemCount3 =8

		if nLevel>=70 then
			
			varItemCount1 = 46
			varItemCount2 = 46
			varItemCount3 = 104

		elseif nLevel>=60 then
			
			varItemCount1 = 39
			varItemCount2 = 39
			varItemCount3 = 78
		else
			
			varItemCount1 = 20
			varItemCount2 = 20
			varItemCount3 = 39
		end
		
		StartItemTask(varMap)
			ItemAppend( varMap, nItemId1, varItemCount1 )
			ItemAppend( varMap, nItemId2, varItemCount2 )
			ItemAppend( varMap, nItemId3, varItemCount3 )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)

			SetFubenData_Param(varMap, nParam_Gathered_Start+nPlayerIndex,1);
			x700083_ShowTips(varMap, varPlayer, "采集完成")
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount1,nItemId1))
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount2,nItemId2))
			x700083_ShowMsgToTeam(varMap, varPlayer, format("#G%s个@itemid_%d",varItemCount3,nItemId3))
		else
			x700083_ShowTips(varMap, varPlayer, "背包空间不足，无法获得物品")
		end
	end

end


function x700083_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end


function x700083_ShowMsgToTeam(varMap, varPlayer, varStr)

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end
	local teamid = GetTeamId(varMap, varPlayer);
	local teamnum = GetTeamSize(varMap, varPlayer);
	local nearteamnum = GetNearTeamCount(varMap, varPlayer);

	
	local strName =GetName(varMap, varPlayer).."获得了:"
	

	if nearteamnum>0 then
		for varI = 0, nearteamnum - 1 do
	
			local memberId = GetNearTeamMember(varMap, varPlayer, varI);
			if IsPlayerStateNormal(varMap,memberId ) > 0 then		

			LuaThisScenceM2Team (varMap, strName..varStr, teamid, 0, 0)
			end
			
		end
	else
		Msg2Player(varMap, varPlayer, strName..varStr, 0, 0)
	end

	

	
end





function x700083_GetMoneyName(varMap,nMoney)
	local ding = floor(nMoney/(1000*1000))
	local liang = floor((nMoney-ding*1000*1000)/1000)
	local wen = nMoney-(ding*1000*1000+liang*1000)

	local varStr=""
	if ding>0 then
		varStr = varStr..format("%d锭",ding)
	end

	if liang>0 then
		varStr = varStr..format("%d两",liang)
	end

	if wen>0 then
		varStr = varStr..format("%d文",wen)
	end

	return varStr;
	
end
