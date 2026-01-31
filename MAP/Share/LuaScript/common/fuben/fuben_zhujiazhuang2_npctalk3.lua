



x700047_CSP_B_BOSS2		=	36

x700047_var_FileId = 700047


x700047_Fuben_FileId = 700031

x700047_var_TalkTitle = "木曰曲直"
x700047_var_TalkContent = "\t 此木屈伸有度，似乎内有灵气游动，不知打开会有什么东西出现。看来这就是扈三娘的五行异术的“木”。"

function x700047_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700047_DispatchTalkInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700047_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local bCreatMonster2 = GetFubenData_Param(varMap, x700047_CSP_B_BOSS2 ) ;


	if bCreatMonster2<=0 then
	
		TalkAppendButton(varMap, x700047_var_FileId, x700047_var_TalkTitle,3,1)
	end
			
end



function x700047_DispatchTalkInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700047_var_TalkTitle)
		TalkAppendString(varMap,x700047_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700047_var_FileId, -1);
end





function x700047_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700047_ProcAccept( varMap, varPlayer )

	
	LuaCallNoclosure( x700047_Fuben_FileId, "ProcNpcTalk3", varMap, varPlayer) ;
	
end

