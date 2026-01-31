



x700045_CSP_B_MONSTER2		=	40

x700045_var_FileId = 700045


x700045_Fuben_FileId = 700031

x700045_var_TalkTitle = "解救时迁"
x700045_var_TalkContent = "\t哎呀，不好，你们怎么进来了，刚才我被困在袋中时听那扈三娘和祝家兄弟商量，要将金银细软搬到别处，同时在祝家庄内设下天罗地网，要拿咱弟兄向官府讨赏，大家快些分开走，迟了恐怕难逃虎口！"

function x700045_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	
	
	x700045_DispatchTalkInfo( varMap, varPlayer, varTalknpc,which )
	
end








function x700045_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local bCreatMonster2 = GetFubenData_Param(varMap, x700045_CSP_B_MONSTER2 ) ;


	if bCreatMonster2<=0 then
	
		TalkAppendButton(varMap, x700045_var_FileId, x700045_var_TalkTitle,3,1)
	end
			
end



function x700045_DispatchTalkInfo( varMap, varPlayer, varTalknpc, nParam )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700045_var_TalkTitle)
		TalkAppendString(varMap,x700045_var_TalkContent)
		

	StopTalkTask()





	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700045_var_FileId, -1);
end





function x700045_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700045_ProcAccept( varMap, varPlayer )

	
	LuaCallNoclosure( x700045_Fuben_FileId, "ProcNpcTalk1", varMap, varPlayer) ;
	
end

