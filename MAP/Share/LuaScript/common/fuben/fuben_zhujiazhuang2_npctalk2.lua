



x700046_CSP_B_BOSS1		=	35

x700046_var_FileId = 700046


x700046_Fuben_FileId = 700031

x700046_var_TalkTitle = "金曰从革"
x700046_var_TalkContent = "\t 此物金光闪烁，似乎内有灵气游动，不知打开会有什么东西出现。看来这就是扈三娘的五行异术的“金”。"

function x700046_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700046_DispatchTalkInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700046_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local bCreatMonster2 = GetFubenData_Param(varMap, x700031_CSP_B_BOSS1 ) ;


	if bCreatMonster2<=0 then
	
		TalkAppendButton(varMap, x700046_var_FileId, x700046_var_TalkTitle,3,1)
	end
			
end



function x700046_DispatchTalkInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700046_var_TalkTitle)
		TalkAppendString(varMap,x700046_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700046_var_FileId, -1);
end





function x700046_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700046_ProcAccept( varMap, varPlayer )

	
	LuaCallNoclosure( x700046_Fuben_FileId, "ProcNpcTalk2", varMap, varPlayer) ;
	
end

