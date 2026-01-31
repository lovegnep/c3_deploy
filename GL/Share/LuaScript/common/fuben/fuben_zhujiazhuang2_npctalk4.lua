



x700048_CSP_B_BOSS3		=	37

x700048_var_FileId = 700048


x700048_Fuben_FileId = 700031

x700048_var_TalkTitle = "水曰润下"
x700048_var_TalkContent = "\t 此物晶莹剔透，似乎内有灵气游动，不知打开会有什么东西出现。看来这就是扈三娘的五行异术的“水”。"

function x700048_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700048_DispatchTalkInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700048_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local bCreatMonster2 = GetFubenData_Param(varMap, x700048_CSP_B_BOSS3 ) ;


	if bCreatMonster2<=0 then
	
		TalkAppendButton(varMap, x700048_var_FileId, x700048_var_TalkTitle,3,1)
	end
			
end



function x700048_DispatchTalkInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700048_var_TalkTitle)
		TalkAppendString(varMap,x700048_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700048_var_FileId, -1);
end





function x700048_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700048_ProcAccept( varMap, varPlayer )

	
	LuaCallNoclosure( x700048_Fuben_FileId, "ProcNpcTalk4", varMap, varPlayer) ;
	
end

