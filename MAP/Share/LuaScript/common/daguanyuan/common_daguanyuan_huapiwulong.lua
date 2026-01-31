





x310390_var_FileId 		= 310390


x310390_var_Title			=	"金龙印兑换"

x310390_var_ItemId 		= 11000597


x310390_var_CostMoney     = 3000

function x310390_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap,x310390_var_FileId,x310390_var_Title, 3, 1)
	
end

function x310390_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

		StartTalkTask(varMap)
	
		TalkAppendString(varMap,"#Y"..x310390_var_Title)
		TalkAppendString(varMap,format( "\t@item_%d#W是时装纹龙的必备道具。只要本周进行过副本画皮或斗戏勾栏院，就能在我这里兑换一个@item_%d。\n\t#W是否花费#R3#W两金卡/现金换取一个@item_%d#W？", x310390_var_ItemId , x310390_var_ItemId , x310390_var_ItemId) )
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310390_var_FileId, -1);

end

function x310390_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end

function x310390_CheckExchange(varMap, varPlayer)
	
	local weekDay = GetWeek()
	if weekDay  ~= 6 and weekDay ~= 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"只有周六日才能兑换！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	
	local weekIndex = GetWeekIndex()
	local week = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_GOULANQUTAI_DATE[1], MD_FUBEN_GOULANQUTAI_DATE[2], MD_FUBEN_GOULANQUTAI_DATE[3])
	if weekIndex == week then
		if GetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUAPI_FLAG[1], MD_FUBEN_HUAPI_FLAG[2], MD_FUBEN_HUAPI_FLAG[3]) == 1 then
			Msg2Player( varMap, varPlayer, "你本周已经兑换过一次，不能再次兑换", 8, 3)
			return 0
		end
	else 
		Msg2Player( varMap, varPlayer, "你本周没有完成副本画皮或斗戏勾栏院，不能兑换", 8, 3)
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

function x310390_ProcExchange(varMap, varPlayer)

	if GetGoldMode( varMap, varPlayer) == 1 then  
        if CostMoney( varMap, varPlayer, 2, x310390_var_CostMoney,314) ~= 1 then
            if CostMoney(varMap, varPlayer, 3, x310390_var_CostMoney) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310390_var_CostMoney), 8, 3)
                return 0
            end
        end
    else
            if CostMoney(varMap, varPlayer, 3, x310390_var_CostMoney) ~= 1 then
            if CostMoney(varMap, varPlayer, 2, x310390_var_CostMoney,314) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310390_var_CostMoney), 8, 3)
                return 0
            end
        end
    end
    
	StartItemTask(varMap)
	ItemAppendBind( varMap, x310390_var_ItemId, 1 )
	
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



function x310390_ProcAccept( varMap, varPlayer )
	local iRet = x310390_CheckExchange(varMap, varPlayer)

	if iRet>0 then
		if x310390_ProcExchange(varMap, varPlayer)>0 then
			
			SetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUAPI_FLAG[1], MD_FUBEN_HUAPI_FLAG[2], MD_FUBEN_HUAPI_FLAG[3], 1)
		end
	end
end
