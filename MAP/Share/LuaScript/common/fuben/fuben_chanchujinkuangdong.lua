







x700093_var_FileId		=	700093

x700093_CSP_BOSS3_ID		=	29
FUBEN_HUANGJINKUANGDONG		=	700012

x700093_var_ExitPos= { varMap = {50,50,50,50}, varX=130, z=70, varScript=x700093_var_FileId }


function x700093_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	x700093_ShowTips(varMap, varPlayer, varStr)

	local countryId = GetCurCountry( varMap, varPlayer )
	
	if varArea == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferFunc",varMap,varPlayer,x700093_var_ExitPos.varMap[countryId+1],x700093_var_ExitPos.varX, x700093_var_ExitPos.z)
	elseif varArea == 1 then
		local nBoss3ID = LuaCallNoclosure(FUBEN_HUANGJINKUANGDONG,"GetFubenData_Param",varMap,x700093_CSP_BOSS3_ID)
		if nBoss3ID == -1 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferFunc",varMap,varPlayer,x700093_var_ExitPos.varMap[countryId+1],x700093_var_ExitPos.varX, x700093_var_ExitPos.z)
		end
	end
end


function x700093_ProcMapTimerTick( varMap, monsterobjid )

end


function x700093_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x700093_ProcEventEntry( varMap, monsterobjid )

end

function x700093_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end
