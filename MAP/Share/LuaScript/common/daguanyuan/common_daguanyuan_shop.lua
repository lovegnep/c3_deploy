





x310374_var_FileId 		= 310374


x310374_var_Title			=	"购买生命琼浆"

x310374_var_ItemId 		= 12041097

x310374_var_CostMoney		= 4000

x310374_var_MaxCount		= 5

x310374_var_IsEnableId    = 1051

function x310374_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap,x310374_var_FileId,x310374_var_Title, 3, 0)
end

function x310374_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
        if GetGameOpenById( x310374_var_IsEnableId) <= 0 then
            Msg2Player( varMap, varPlayer, "此活动今天不开放，请改天再来", 8, 3)
            return
         end
        local varDaycount, varNum = x310374_GetDayCount(varMap, varPlayer) 
        if varNum >0 then
		   varStr = format( "#G小提示：\n\t\你今天还可以购买#R%d个@item_%d。",varNum, x310374_var_ItemId)
        else
           varStr =  format( "#G小提示：\n\t\你今天已经购买#R%d个@item_%d了，请改天再来。",x310374_var_MaxCount, x310374_var_ItemId)
        end    
		StartTalkTask(varMap)
	
		TalkAppendString(varMap,"#Y"..x310374_var_Title)
		TalkAppendString(varMap,format( "\t@item_%d#W是不可多得的绝世灵药，虽无起死人，肉白骨之功效，但只要尚有一丝生气，就足以令人恢复健康状态。这@item_%d#W是我依照祖方，精心研制而成的。\n\t你可以周六、周日每天在我这里购买#G5个#W，每次花费#R4#W两金卡/现金购买1个，你是否要购买？\n\t（@item_%d#W可以瞬间回复20000点生命和全部的怒气、能量、箭矢、子弹、魔法、灵力。冷却时间为三分钟。）", x310374_var_ItemId, x310374_var_ItemId, x310374_var_ItemId))
        TalkAppendString(varMap,varStr)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310374_var_FileId, -1);

end

function x310374_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end

function x310374_CheckExchange(varMap, varPlayer)

	local weekDay = GetWeek()
	if weekDay ~= 0 and weekDay ~= 6 then
		Msg2Player( varMap, varPlayer, "只有每六，日可以购买生命琼浆！", 8, 3)
		return 0
	end
	
	if x310374_GetDayCount(varMap, varPlayer) == 0 then
		Msg2Player( varMap, varPlayer, format("你今天已经购买过%d次了，请改日再来！", x310374_var_MaxCount), 8, 3)
		return 0
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player( varMap, varPlayer, "物品栏已满，无法得到物品！", 8, 3)
		return 0
	end
	
	return 1
end

function x310374_ProcExchange(varMap, varPlayer)
    if GetGameOpenById( x310374_var_IsEnableId) <= 0 then      
         return
    end
	local bind = 0
	if GetGoldMode( varMap, varPlayer) == 1 then
        if CostMoney( varMap, varPlayer, 2, x310374_var_CostMoney,316) ~= 1 then
			bind = 1
            if CostMoney(varMap, varPlayer, 3, x310374_var_CostMoney) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310374_var_CostMoney), 8, 3)
                return 0
            end
        end
    else
		bind = 1
        if CostMoney( varMap, varPlayer, 3, x310374_var_CostMoney) ~= 1 then
			bind = 0
            if CostMoney(varMap, varPlayer, 2, x310374_var_CostMoney,316) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310374_var_CostMoney), 8, 3)
                return 0
            end
        end
    end

	StartItemTask(varMap)
	if bind == 1 then
		ItemAppendBind( varMap, x310374_var_ItemId, 1 )
	else
		ItemAppend( varMap, x310374_var_ItemId, 1 )
	end
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		Msg2Player( varMap, varPlayer, "您顺利购买1个生命琼浆！", 8, 3)
		GamePlayScriptLog(varMap, varPlayer, 1691)
		return 1;
	else
		Msg2Player( varMap, varPlayer, "物品栏已满，无法得到物品！", 8, 3)
		return 0;
	end
end



function x310374_ProcAccept( varMap, varPlayer )
	local iRet = x310374_CheckExchange(varMap, varPlayer)

	if iRet>0 then
		if x310374_ProcExchange(varMap, varPlayer)>0 then
			x310374_SetDayCount(varMap, varPlayer)
		end
	end
end




function x310374_GetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DATE[1], MD_DAGUANYUAN_SHOP_DATE[2],MD_DAGUANYUAN_SHOP_DATE[3])
	
	if varToday ~= varLastday then
		return 1, x310374_var_MaxCount
	end
		
	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DAYCOUNT[1], MD_DAGUANYUAN_SHOP_DAYCOUNT[2],MD_DAGUANYUAN_SHOP_DAYCOUNT[3])
	if varDaycount < x310374_var_MaxCount then
		return 1, x310374_var_MaxCount-varDaycount 
	end
	return 0, 0
end




function x310374_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DATE[1], MD_DAGUANYUAN_SHOP_DATE[2],MD_DAGUANYUAN_SHOP_DATE[3])

	if varToday ~= varLastday then
		SetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DATE[1], MD_DAGUANYUAN_SHOP_DATE[2], MD_DAGUANYUAN_SHOP_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DAYCOUNT[1], MD_DAGUANYUAN_SHOP_DAYCOUNT[2], MD_DAGUANYUAN_SHOP_DAYCOUNT[3], 1)
	else
		local varCount = GetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DAYCOUNT[1], MD_DAGUANYUAN_SHOP_DAYCOUNT[2],MD_DAGUANYUAN_SHOP_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_SHOP_DAYCOUNT[1], MD_DAGUANYUAN_SHOP_DAYCOUNT[2], MD_DAGUANYUAN_SHOP_DAYCOUNT[3], varCount+1)
	end
end

