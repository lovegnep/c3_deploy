



x700050_CSP_B_BOSS5		=	39

x700050_var_FileId = 700050


x700050_Fuben_FileId = 700031

x700050_var_TalkTitle = "土爰稼穑"
x700050_var_TalkContent = "\t 此物厚重无华，似乎内有灵气游动，不知打开会有什么东西出现。看来这就是扈三娘的五行异术的“土”。"

function x700050_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700050_DispatchTalkInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700050_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local bCreatMonster2 = GetFubenData_Param(varMap, x700050_CSP_B_BOSS5 ) ;


	if bCreatMonster2<=0 then
	
		TalkAppendButton(varMap, x700050_var_FileId, x700050_var_TalkTitle,3,1)
	end
			
end



function x700050_DispatchTalkInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700050_var_TalkTitle)
		TalkAppendString(varMap,x700050_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700050_var_FileId, -1);
end





function x700050_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700050_ProcAccept( varMap, varPlayer )

	
	LuaCallNoclosure( x700050_Fuben_FileId, "ProcNpcTalk6", varMap, varPlayer) ;
	
end

