



x700049_CSP_B_BOSS4		=	38

x700049_var_FileId = 700049


x700049_Fuben_FileId = 700031

x700049_var_TalkTitle = "火曰炎上"
x700049_var_TalkContent = "\t 此物炽如烧炭，似乎内有灵气游动，不知打开会有什么东西出现。看来这就是扈三娘的五行异术的“火”。"

function x700049_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700049_DispatchTalkInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700049_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local bCreatMonster2 = GetFubenData_Param(varMap, x700049_CSP_B_BOSS4 ) ;


	if bCreatMonster2<=0 then
	
		TalkAppendButton(varMap, x700049_var_FileId, x700049_var_TalkTitle,3,1)
	end
			
end



function x700049_DispatchTalkInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700049_var_TalkTitle)
		TalkAppendString(varMap,x700049_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700049_var_FileId, -1);
end





function x700049_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700049_ProcAccept( varMap, varPlayer )

	
	LuaCallNoclosure( x700049_Fuben_FileId, "ProcNpcTalk5", varMap, varPlayer) ;
	
end

