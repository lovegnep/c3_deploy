





x310395_var_FileId 		= 310395


x310395_var_Title			=	"金龙印兑换"

x310395_var_ItemId 		= 11000597

x310395_var_CostMoney    = 3000


function x310395_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap,x310395_var_FileId,x310395_var_Title, 3, 0)
	
end

function x310395_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

		StartTalkTask(varMap)
	
		TalkAppendString(varMap,"#Y"..x310395_var_Title)
		TalkAppendString(varMap,format( "\t@item_%d#W是时装纹龙的必备道具。每周在我这里可以兑换一次@item_%d。\n\t#W是否花费#R3#W两金卡/现金换取一个@item_%d#W？", x310395_var_ItemId, x310395_var_ItemId , x310395_var_ItemId))
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310395_var_FileId, -1);

end

function x310395_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end

function x310395_CheckExchange(varMap, varPlayer)
	
	
	local weekDay = GetWeek()
	if weekDay ~= 0 and weekDay ~= 6 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"只有每六，日可兑换一次！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	local weekIndex = GetWeekIndex()
	local week = GetPlayerGameData(varMap, varPlayer, MD_WULONG_DUIHUAN_DATE[1], MD_WULONG_DUIHUAN_DATE[2], MD_WULONG_DUIHUAN_DATE[3])
	if weekIndex == week then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你这周已经兑换过一次！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	
	return 1
	
end

function x310395_ProcExchange(varMap, varPlayer)

	if GetGoldMode( varMap, varPlayer) == 1 then
        if CostMoney( varMap, varPlayer, 2, x310395_var_CostMoney,313) ~= 1 then
            if CostMoney(varMap, varPlayer, 3, x310395_var_CostMoney) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310395_var_CostMoney), 8, 3)
                return 0
            end
        end
    else
        if CostMoney( varMap, varPlayer, 3, x310395_var_CostMoney) ~= 1 then
            if CostMoney(varMap, varPlayer, 2, x310395_var_CostMoney,313) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310395_var_CostMoney), 8, 3)
                return 0
            end
        end
    end

	StartItemTask(varMap)
	ItemAppendBind( varMap, x310395_var_ItemId, 1 )
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"兑换完成！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1;
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end
end



function x310395_ProcAccept( varMap, varPlayer )
	local iRet = x310395_CheckExchange(varMap, varPlayer)

	if iRet>0 then
		if x310395_ProcExchange(varMap, varPlayer)>0 then
			
			local weekIndex = GetWeekIndex()
			SetPlayerGameData(varMap, varPlayer, MD_WULONG_DUIHUAN_DATE[1], MD_WULONG_DUIHUAN_DATE[2], MD_WULONG_DUIHUAN_DATE[3], weekIndex)
		end
	end
end
