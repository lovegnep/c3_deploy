


x700041_CSP_B_GETBUFF_START	=	234
x700041_CSP_GUID_START              =   248
x700041_var_Buff2				=	13501

x700041_var_FileId = 700041


x700041_Fuben_FileId = 700007

x700041_var_TalkTitle = "#Y".."范文虎的指教"
x700041_var_TalkContent = "确定让范文虎指点一下你吗？"

function x700041_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700041_DispatchGetBuffInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700041_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x700041_var_FileId, "获得范文虎的指点",5,1)
			
end



function x700041_DispatchGetBuffInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,x700041_var_TalkTitle)
		TalkAppendString(varMap,x700041_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700041_var_FileId, -1);
end





function x700041_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700041_ProcAccept( varMap, varPlayer )

	
	
	x700041_ProcNpcTalkGetBuff( varMap, varPlayer)
	
end






function x700041_ProcNpcTalkGetBuff( varMap, varPlayer)

	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	for varI=0, 5 do
        local paramidx = x700041_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

			local bGathered = GetFubenData_Param(varMap, x700041_CSP_B_GETBUFF_START+varI);
			
			local varStr = ""

			if bGathered<=0 then
				SetFubenData_Param(varMap, x700041_CSP_B_GETBUFF_START+varI,1);
				
				SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x700041_var_Buff2,0 )

				varStr = "您得到了范文虎的指教"
				
				
			else
				varStr = "范文虎也只能教你一次"
			end

			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			break;
           
        end
    end

	
end
