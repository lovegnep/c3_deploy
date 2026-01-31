x700043_CSP_PAO_STATUS				=	15
x700043_CSP_HUMAN_COUNT				=	240
x700043_CSP_OBJID_START             =   241
x700043_CSP_B_GETBONUS_START		=	230
x700043_CSP_GUID_START              =   248

x700043_var_FileId = 700043


x700043_Fuben_FileId = 700003

function x700043_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700043_DispatchGetBonusInfo( varMap, varPlayer, varTalknpc,which )
	
	
end








function x700043_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	


	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
	local bFind = 0;

	for varI=0, 5 do
        local paramidx = x700043_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			local bGetBonus = GetFubenData_Param(varMap,x700043_CSP_B_GETBONUS_START+varI)
			
			if bGetBonus>0 then
				return
			end

			bFind = 1;
			break;
           
        end
    end

	
	if bFind<=0 then
		return
	end

	 
	
	TalkAppendButton(varMap, x700043_var_FileId, "领取奖励",0,-1)
		
end





function x700043_DispatchGetBonusInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y".."\t玄灵道长的奖励")
		TalkAppendString(varMap,"确定领取奖励吗？")
		

		


	StopTalkTask()


	



	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700043_var_FileId, -1);
end





function x700043_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700043_ProcAccept( varMap, varPlayer )

	
	x700043_ProcRequestGetBonus(varMap, varPlayer )
	
end

function x700043_ProcRequestGetBonus(varMap, varPlayer )
	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
	local bFind = 0;

	for varI=0, 5 do
        local paramidx = x700043_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)	
        if nGUID == myGuid then

			local bGetBonus = GetFubenData_Param(varMap,x700043_CSP_B_GETBONUS_START+varI)
			if bGetBonus>0 then
				StartTalkTask(varMap);
				TalkAppendString(varMap, "你已经领取过奖励");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap, varPlayer);
				return
			end

			SetFubenData_Param(varMap,x700043_CSP_B_GETBONUS_START+varI, 1)

			bFind = 1;
			break;
           
        end
    end
	
	

	if bFind<=0 then
		return
	end

	x700043_GiveBonusToHuman(varMap, varPlayer )
end

function x700043_GiveBonusToHuman(varMap, varPlayer )
	local nStatus = GetFubenData_Param(varMap, x700043_CSP_PAO_STATUS )
	local varLevel = GetLevel(varMap, varPlayer)
	
	local nMoney =0
	if nStatus==1 then
		nMoney = varLevel*50
	elseif nStatus==2 then
		nMoney = varLevel*100+varLevel*50
	else
		return
	end
	

	local strMoney = x700043_GetMoneyName(varMap,nMoney)
	local varStr = format("获得%s的银卡奖励",strMoney)

	AddMoney(varMap, varPlayer, 1, nMoney)

	
	
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask(varMap);
	DeliverTalkTips(varMap, varPlayer);
end


function x700043_GetMoneyName(varMap,nMoney)
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

	
	varStr = varStr..format("%d文",wen)

	return varStr;
	
end






