x700040_CSP_CURRENT_STEP			=	22
x700040_CSP_B_FIGTHING				=	24
x700040_MAX_TOTAL_STEP				=	10
x700040_CSP_HUMAN_TALKPARAM_START	=	230
x700040_CSP_HUMAN_COUNT				=	240
x700040_CSP_OBJID_START             =   241
x700040_CSP_B_GETBONUS_START		=	220
x700040_CSP_B_MISSION_FAILED		=	27

x700040_CSP_LAST_TICKOUNT			=	247
x700040_CSP_GUID_START              =   248  

x700040_var_FileId = 700040


x700040_Fuben_FileId = 700001

function x700040_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	if which>=0 then	
		x700040_DispatchPlayInfo( varMap, varPlayer, varTalknpc,which )
	
		
	end
	
end








function x700040_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nCurrentGameStep = GetFubenData_Param(varMap, x700040_CSP_CURRENT_STEP )
	local bFighting = GetFubenData_Param(varMap, x700040_CSP_B_FIGTHING )
	local bFailed = GetFubenData_Param(varMap, x700040_CSP_B_MISSION_FAILED )



	if bFighting>0 then
		return
	end

	if bFailed>0 then
		return
	end


	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	local bFind = 0;
	for varI=0, 5 do
        local paramidx = x700040_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			local bGetBonus = GetFubenData_Param(varMap,x700040_CSP_B_GETBONUS_START+varI)
			
			if bGetBonus>0 then
				return
			end

            bFind = 1
            break
        end
    end


	if bFind<=0 then
		return
	end

	 
	if nCurrentGameStep<=0 then
		TalkAppendButton(varMap, x700040_var_FileId, "抵挡妖魔的袭击",0,nCurrentGameStep)
	elseif nCurrentGameStep>0 then
		if nCurrentGameStep<x700040_MAX_TOTAL_STEP then
			TalkAppendButton(varMap, x700040_var_FileId, "对抗更强大的妖魔",0,nCurrentGameStep)
			
		
			
		end
	end
end





function x700040_DispatchPlayInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y".."\t帮助我抵抗这些妖魔，保护炼妖炉不被破坏，我会给你们丰厚的奖励！")
		TalkAppendString(varMap,"\n\t开始抵挡妖魔的袭击！")
		

		


	StopTalkTask()


	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700040_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			SetFubenData_Param(varMap,x700040_CSP_HUMAN_TALKPARAM_START+varI, nParam)
            break
        end
    end

	


	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700040_var_FileId, -1);
end



function x700040_DispatchGetBonusInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y".." 领取奖励")
		TalkAppendString(varMap,"确定领取奖励吗？")
		

		


	StopTalkTask()


	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700040_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			SetFubenData_Param(varMap,x700040_CSP_HUMAN_TALKPARAM_START+varI, nParam)
            break
        end
    end
	
	


	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700040_var_FileId, -1);
end





function x700040_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700040_ProcAccept( varMap, varPlayer )

	local nParam = -2;
	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700040_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			nParam = GetFubenData_Param(varMap,x700040_CSP_HUMAN_TALKPARAM_START+varI)
            break
        end
    end

	
	if nParam>=0 then
		LuaCallNoclosure( x700040_Fuben_FileId, "ProcNpcTalk", varMap, varPlayer,nParam ) ;
	
		
	end
end

function x700040_ProcRequestGetBonus(varMap, varPlayer )
	local nCurrentGameStep = GetFubenData_Param(varMap, x700040_CSP_CURRENT_STEP )
	local bFighting = GetFubenData_Param(varMap, x700040_CSP_B_FIGTHING )
	local bFailed = GetFubenData_Param(varMap, x700040_CSP_B_MISSION_FAILED )

	if bFailed>0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很可惜，你没能顺利的保护炼妖炉");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, varPlayer);
		return
	end

	if bFighting>0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "还有妖魔在肆虐，你还不能领取奖励");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, varPlayer);
		return
	end

	
		
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
	local bFind = 0;
	for varI=0, 5 do
        local paramidx = x700040_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)	
        if nGUID == myGuid then

			local bGetBonus = GetFubenData_Param(varMap,x700040_CSP_B_GETBONUS_START+varI)
			if bGetBonus>0 then
				StartTalkTask(varMap);
				TalkAppendString(varMap, "你已经领取过奖励");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap, varPlayer);
				return
			end

			SetFubenData_Param(varMap,x700040_CSP_B_GETBONUS_START+varI, 1)

			bFind = 1;
			break;
        end
    end
	
	

	if bFind<=0 then
		return
	end

	x700040_GiveBonusToHuman(varMap, varPlayer )
end

function x700040_GiveBonusToHuman(varMap, varPlayer )
	local nCurrentGameStep = GetFubenData_Param(varMap, x700040_CSP_CURRENT_STEP )
	local nLevel = GetLevel(varMap, varPlayer)
	
	local varCount = 0;

	local varItem = 0;
	
	if nLevel>=20 and nLevel <=39 then
		varItem = 11000200
	elseif nLevel>=40 and nLevel <=59 then
		varItem = 11000201
	elseif nLevel>=60 and nLevel <=79 then
		varItem = 11000202
	elseif nLevel>=80  then
		varItem = 11000203
	else
		return
	end

	if nCurrentGameStep==1 then
		varCount = 1
	elseif nCurrentGameStep>=2 and nCurrentGameStep<10 then
		varCount =1*(nCurrentGameStep-1)
	elseif nCurrentGameStep>=10 then
		varCount = 10
	end
	

	local nSuccess = 0;

	for varI=1, varCount do
		StartItemTask(varMap)
		ItemAppend( varMap, varItem, 1 )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			nSuccess = nSuccess+1
		end
	end

	local varStr = format("你获得了%d个星尘的奖励！",varCount,nSuccess)

	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end











