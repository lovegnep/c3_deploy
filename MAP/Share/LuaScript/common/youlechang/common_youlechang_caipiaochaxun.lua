x310337_var_FileId 		= 310337

x310337_var_ScriptName	= "查询本次乐透大奖号码"

x310337_var_TitleInfo		= "#Y乐透大奖开奖号码\n\t#W这可是一个激动人心的数字，它代表着巨额的财富！本次乐透大奖的中奖号码是：\n"
x310337_var_TitleInfo1		= "#W\n\t亲爱的朋友，你中奖了吗？如果这次的号码和你无缘，请期待下次的开奖！"
x310337_var_TitleInfo2		= "#W\t不要心急，当前还没有开出幸运号码。感谢你的关注，祝福下一个中奖的玩家就是你！"

						
function x310337_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	local varIndex = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
	if varIndex <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
        return
	end	
    local append = 0
	if varIndex > 0 then
	StartTalkTask(varMap)
		-- TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)

		varIndex = GetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO1)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\t\t\t#Y"..varIndex)
		end
		varIndex = GetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO1)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\n\t\t\t#Y"..varIndex)
		end
		varIndex = GetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO1)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\n\t\t\t#Y"..varIndex)
		end
		varIndex = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO2)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\n\t\t\t#Y"..varIndex)
		end
		varIndex = GetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO2)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\n\t\t\t#Y"..varIndex)
		end
		varIndex = GetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO2)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\n\t\t\t#Y"..varIndex)
		end
		varIndex = GetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO2)
		if varIndex > 0 then
            if append == 0 then
                TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo)
                append = 1
            end
			TalkAppendString(varMap,"\n\t\t\t#Y"..varIndex)
		end
        if append == 1 then
            TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo1)
        else
            TalkAppendString(varMap,"#Y"..x310337_var_TitleInfo2)
        end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)  
	end
end


function x310337_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap,x310337_var_FileId,x310337_var_ScriptName,3,0)
end

function x310337_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x310337_ProcAccept( varMap, varPlayer )
end
