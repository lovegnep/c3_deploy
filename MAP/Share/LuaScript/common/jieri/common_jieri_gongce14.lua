
x350013_var_FileId          = 350013

x350013_var_Name              = "封测领奖"

x350013_var_strErrorTime      = "请在8月10日和8月11日的20：00—20：30领取"
x350013_var_shuoming 		      = "\t为了让广大玩家在封测期间有充足的银两体验我们的各种精彩玩法，我们将给所有玩家免费发放海量封测“军饷”！人人都有，上线就有！8月10日、8月11日每晚20:00至20:30限时发放，赶快上线领取吧，过期不候哟！\n\t\n\t8月10日可获得金卡#R50两#W。\n\t8月11日可获得金卡#R100两#W。"

x350013_var_MD1 =MD_LINGJIANG_TIME1
x350013_var_MD2 =MD_LINGJIANG_TIME2
x350013_var_FeastId	  = 2


function x350013_IsFeastActive()
	
	if x350013_var_FeastId ~= MD_CURRENT_FEAST_ID then
				return 0
	end
	return 1
end


function x350013_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	
	if x350013_IsFeastActive() ~= 1	then
		return  
	end 
	
	local day = GetDayOfYear()
	if day < 221 or day > 222 then
		return
	end
	 
    TalkAppendButton( varMap, x350013_var_FileId, x350013_var_Name, 3, 1)
end


function x350013_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
	if x350013_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end

        StartTalkTask( varMap)  
            TalkAppendString( varMap, "#Y"..x350013_var_Name)  
            TalkAppendString( varMap, x350013_var_shuoming )

        StopTalkTask() 
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350013_var_FileId, -1) 
end



function x350013_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	if x350013_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
        end
	LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x350013_var_FeastId)

		local money = x350013_GetMoney( varMap, varPlayer)

    if money ~= 0 then
        AddMoney( varMap, varPlayer, 3, money)
    else
    	return 0
    end

    local varY, m, d = GetYearMonthDay()
    if d == 10 then
        SetPlayerGameData( varMap, varPlayer, x350013_var_MD1[ 1], x350013_var_MD1[ 2], x350013_var_MD1[ 3], 1)
    else
        SetPlayerGameData( varMap, varPlayer, x350013_var_MD2[ 1], x350013_var_MD2[ 2], x350013_var_MD2[ 3], 1)
    end

    return 1
end


function x350013_ProcAccept( varMap, varPlayer, varTalknpc)
end


function x350013_GetMoney( varMap, varPlayer)
	local varY, m, d = GetYearMonthDay()
        local minute = GetMinOfDay()

        if m ~= 8 then
        	Msg2Player( varMap, varPlayer, x350013_var_strErrorTime, 8, 3)
       		return 0	
        end

   	if d ~= 10 and d ~= 11 then
       		Msg2Player( varMap, varPlayer, x350013_var_strErrorTime, 8, 3)
        	return 0
        end

        if minute < 1200 or minute > 1230 then
       		Msg2Player( varMap, varPlayer,"只能在20：00—20：30领取金卡奖励", 8, 3)
        	return 0
        end
 

        if d == 10 then
        	if GetPlayerGameData( varMap, varPlayer, x350013_var_MD1[ 1], x350013_var_MD1[ 2], x350013_var_MD1[ 3] ) == 1 then
            		Msg2Player( varMap, varPlayer, "今天的奖励你已经领取过了", 8, 3)
            	return 0
        else
            return 50000
        end
    end
    if d == 11 then
        if GetPlayerGameData( varMap, varPlayer, x350013_var_MD2[ 1], x350013_var_MD2[ 2], x350013_var_MD2[ 3] ) == 1 then
            Msg2Player( varMap, varPlayer, "今天的奖励你已经领取过了", 8, 3)
            return 0
        else
            return 100000
        end
    end

end





















