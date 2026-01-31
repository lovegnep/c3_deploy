
x300174_var_FileId = 300174
x300174_var_FarScriptId = 300160
x300174_var_BuffId = 7646

function x300174_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	
	
	if varMap ~= 0 and varMap ~= 14 then
		return
	end
	
    TalkAppendButton( varMap, x300174_var_FileId, "领取基础奖励", 8, 1)
end

function x300174_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
	
	
	if varMap ~= 0 and varMap ~= 14 then
		return
	end
	
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y".."大都美丽会" )
        TalkAppendString( varMap, format( "\t您是否要花费银卡（现银）#G   #{_MONEY%d}#W领取基础奖励？", GetLevel( varMap, varPlayer) * 200) )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300174_var_FileId, -1)
end

function x300174_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	
	
	if varMap ~= 0 and varMap ~= 14 then
		return 0
	end
	
    if LuaCallNoclosure( x300174_var_FarScriptId, "IsOverDay", varMap, varPlayer) == 0 then
        Msg2Player( varMap, varPlayer, "很抱歉，24小时内只能领取一次基础奖励", 8, 3)
        return 0
    end

    local costMoney = GetLevel( varMap, varPlayer) * 200
    if CostMoney( varMap, varPlayer, 1, costMoney,306) == -1 then
        if CostMoney( varMap, varPlayer, 0, costMoney,306) == -1 then
            Msg2Player( varMap, varPlayer, "很抱歉，您身上的银卡（现银）不足，不能领取基础奖励。", 8, 3)
            return 0
        end
    end

    SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300174_var_BuffId, 0)
    LuaCallNoclosure( x300174_var_FarScriptId, "SetBaseBuffTime", varMap, varPlayer, GetMinOfYear() )
end

