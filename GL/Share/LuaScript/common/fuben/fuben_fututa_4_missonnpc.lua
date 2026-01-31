


x700044_CSP_CURRENTSTEP		=	23
x700044_CSP_FUBENLEVEL	=	9
x700044_CSP_FUBENLEVEL_DUP	=	27


x700044_CSP_HUMAN_TALKPARAM_START	=	230
x700044_CSP_GUID_START              =   248


x700044_var_LevelMin					=   20                      
x700044_var_LevelMax					=   100                     

x700044_var_FileId = 700044


x700044_Fuben_FileId = 700022

function x700044_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	if which==1 then	
		x700044_DispatchUpgrade( varMap, varPlayer, varTalknpc,which ) 
	elseif which==2 then
		x700044_DispatchDegrade( varMap, varPlayer, varTalknpc,which )	
	end
	
end








function x700044_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nCurrentLevel = GetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL)
	local nStdLevel = GetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL_DUP)

	
	if nCurrentLevel< (nStdLevel+5) then
		TalkAppendButton(varMap, x700044_var_FileId, "增加难度",0,1)
	end

	if nCurrentLevel> (nStdLevel-5) then
		TalkAppendButton(varMap, x700044_var_FileId, "降低难度",0,2)
	end


	
	
	
		
end





function x700044_DispatchUpgrade( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y增加难度")
		TalkAppendString(varMap,"怪物等级增加5")
		

		


	StopTalkTask()


	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700044_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			SetFubenData_Param(varMap,x700044_CSP_HUMAN_TALKPARAM_START+varI, nParam)
            break
        end
    end

	


	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700044_var_FileId, -1);
end



function x700044_DispatchDegrade( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y降低难度")
		TalkAppendString(varMap,"怪物等级减少5")
		

		


	StopTalkTask()


	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700044_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			SetFubenData_Param(varMap,x700044_CSP_HUMAN_TALKPARAM_START+varI, nParam)
            break
        end
    end
	
	


	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700044_var_FileId, -1);
end





function x700044_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700044_ProcAccept( varMap, varPlayer )

	local nParam = 0;
	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700044_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			nParam = GetFubenData_Param(varMap,x700044_CSP_HUMAN_TALKPARAM_START+varI)
            break
        end
    end
	
	
	
	if nParam==1 then
		x700044_ProcRequestUpgrade(varMap,varPlayer)
	elseif nParam==2 then
		x700044_ProcRequestDegrade(varMap,varPlayer)
	end
end

function x700044_ProcRequestUpgrade(varMap,varPlayer)
	local nCurrentLevel = GetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL)
	local nStdLevel = GetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL_DUP)

	if nCurrentLevel< (nStdLevel+5) then
		if x700044_var_LevelMax >= (nCurrentLevel+5) then
			SetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL, nCurrentLevel+5)

			x700044_ShowTipsToAll(varMap, format("怪物等级增加5", nCurrentLevel+5))
		else
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "超过最大等级限制，增加难度失败");
			StopTalkTask(varMap);

			DeliverTalkTips(varMap, varPlayer);
			
		end
	else
		StartTalkTask(varMap);
		TalkAppendString(varMap, "难度已经最高了，增加难度失败");
		StopTalkTask(varMap);

		DeliverTalkTips(varMap, varPlayer);
	end

	
end

function x700044_ProcRequestDegrade(varMap,varPlayer)
	local nCurrentLevel = GetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL)
	local nStdLevel = GetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL_DUP)

	
	if nCurrentLevel> (nStdLevel-5) then
		if x700044_var_LevelMin <= (nCurrentLevel-5) then
			SetFubenData_Param(varMap,x700044_CSP_FUBENLEVEL, nCurrentLevel-5)

			x700044_ShowTipsToAll(varMap, format("怪物等级降低5", nCurrentLevel-5))
		else
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "超过最小等级限制，降低难度失败");
			StopTalkTask(varMap);

			DeliverTalkTips(varMap, varPlayer);
			
		end
	else
		StartTalkTask(varMap);
		TalkAppendString(varMap, "难度已经最低了，减少难度失败");
		StopTalkTask(varMap);

		DeliverTalkTips(varMap, varPlayer);
	end
end


function x700044_ShowTipsToAll(varMap, varStr)
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);

		DeliverTalkTips(varMap, humanId);
	end
end
