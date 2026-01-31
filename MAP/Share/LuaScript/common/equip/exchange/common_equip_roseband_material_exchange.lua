--装备打星材料兑换 钻石切割
x570080_var_FileId 										= 570080

x570080_var_CountLimit		 						= 30 --次数上限,与MD挂钩,MD最多只能承载3次

x570080_var_LevelLimit								=	90 --等级限制

x570080_var_MDTable										= {			--存放MD的表
	{MD_ROSEBAND_MATERIAL_EXCHANGE_SENIOR},
	{MD_ROSEBAND_MATERIAL_EXCHANGE_MEDIUM},
	{MD_ROSEBAND_MATERIAL_EXCHANGE_JUNIOR}
}

x570080_var_Senior_Item								=	"钻石原石明亮切割" --高级切割选项
x570080_var_Medium_Item								=	"钻石原石光彩切割" --中级切割选项
x570080_var_Junior_Item								=	"钻石原石火彩切割" --初级切割选项

x570080_var_ConfirmTable							= {
{Confirm	=	"#Y钻石原石明亮切割#W\n\t稳定的钻石切割方式，每次切割将消耗一块钻石原石，可以获得#R7个#W#G明亮的彩钻#W。90级以上的玩家可以使用#G明亮的彩钻#W为十星装备进行十星启动。\n\t你现在要进行钻石原石明亮切割吗？\n \n#G小提示：\n\t每周最多进行#R3次#G明亮切割#G。"}, 	--高级切割提示
{Confirm	= "#Y钻石原石光彩切割#W\n\t不稳定的钻石切割方式，每次切割将消耗一块钻石原石，可以随机获得#R4个至8个#W#G明亮的彩钻#W。90级以上的玩家可以使用#G明亮的彩钻#W为十星装备进行十星启动。\n\t你现在要进行钻石原石光彩切割吗？\n \n#G小提示：\n\t每周最多进行#R3次#G光彩切割。"}, 	--中级切割提示
{Confirm	=	"#Y钻石原石火彩切割#W\n\t非常不稳定的钻石切割方式，每次切割将消耗一块钻石原石，可以随机获得#R1个至9个#W#G明亮的彩钻#W。90级以上的玩家可以使用#G明亮的彩钻#W为十星装备进行十星启动。\n\t你现在要进行钻石原石火彩切割吗？\n \n#G小提示：\n\t每周最多进行#R3次#G火彩切割。"}	--初级切割提示
}

x570080_var_Material									=	{ --原材料表
	{itemId = 11990113, count = 1},
	{itemId = 11990113, count = 1},
	{itemId = 11990113, count = 1}
}

x570080_var_ExchangeProp							=	{ --兑换的道具表
	{itemId = 11990122, minCount = 7, maxCount = 7},
	{itemId = 11990122, minCount = 4, maxCount = 8},
	{itemId = 11990122, minCount = 1, maxCount = 9},
}

x570080_var_Temp_Index								=	-1;
x570080_var_Temp_TalkNpc							=	-1;

function x570080_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, varIndex )	
	WriteLog(1, format("x570080_ProcEventEntry --- varMap=%d varPlayer=%d varTalknpc=%d varIndex =%d",
				varMap, varPlayer, varTalknpc, varIndex))
	
	if GetLevel( varMap, varPlayer ) < x570080_var_LevelLimit then 
		Msg2Player(varMap, varPlayer, "您的等级不足90级，无法使用此模块。", 8, 2)
		Msg2Player(varMap, varPlayer, "您的等级不足90级，无法使用此模块。", 8, 3)
		return
	end
	
	if (varIndex > 3) then
		WriteLog(1, format("Error x570080_ProcEventEntry --- Invalide Param : Index %d", varIndex))
	else
		x570080_var_Temp_Index = varIndex
		x570080_var_Temp_TalkNpc = varTalknpc
		StartTalkTask(varMap)
		TalkAppendString(varMap, x570080_var_ConfirmTable[varIndex].Confirm)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570080_var_FileId, -1)
	end
	
end

function x570080_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	x570080_var_Temp_Index = -1
	x570080_var_Temp_TalkNpc = -1
	
	TalkAppendButton(varMap,x570080_var_FileId,x570080_var_Senior_Item, 3, 1);
	TalkAppendButton(varMap,x570080_var_FileId,x570080_var_Medium_Item, 3, 2);
	TalkAppendButton(varMap,x570080_var_FileId,x570080_var_Junior_Item, 3, 3);
end


--向客户端发送相应消息
function x570080_SendClientMsg(varMap, varPlayer, msg)
		StartTalkTask(varMap)
		TalkAppendString(varMap, msg)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, x570080_var_Temp_TalkNpc)
end

--判断玩家次数是否已满
function x310165_IsFullTime(varMap, varPlayer, varIndex)
	WriteLog(1, format("x310165_IsFullTime --- varMap=%d varPlayer=%d varIndex =%d",
				varMap, varPlayer, varIndex))

	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[1], 
								MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[2], MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[3])
	if (varToday == varLastday) then --本周
		local countMD = x570080_var_MDTable[varIndex][1]
		local count	=	GetPlayerGameData(varMap, varPlayer, countMD[1], countMD[2], countMD[3])
		if (count >= x570080_var_CountLimit) then
			--return 1
		end
	end	

	return 0
end

function x570080_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	if (x570080_var_Temp_Index == -1 or x570080_var_Temp_TalkNpc == -1) then
		WriteLog(1, format("x570080_ProcAcceptCheck --- Error index or npc %d, %d",
				x570080_var_Temp_Index, x570080_var_Temp_TalkNpc))
		return 0
	end
	
	--次数验证
	if (x310165_IsFullTime(varMap, varPlayer, x570080_var_Temp_Index) == 1) then
		x570080_SendClientMsg(varMap, varPlayer, "\t很抱歉，本周不能再做此操作,请尝试其他切割方式或下周再来。")
		return 0
	end

	return 1
end

--添加MD次数
function x570080_AddTime(varMap, varPlayer)
	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[1], 
													MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[2], MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[3])
	
	if (varToday ~= varLastday) then --不是本周
		--设置为本周
		SetPlayerGameData(varMap, varPlayer, MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[1], 
								MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[2], MD_ROSEBAND_MATERIAL_EXCHANGE_DATE[3], varToday)	
	
		-- 清掉所有记录
		for i, value in x570080_var_MDTable do
			SetPlayerGameData(varMap, varPlayer, value[1][1], value[1][2], value[1][3], 0)
		end
	end
	local MDCount = x570080_var_MDTable[x570080_var_Temp_Index][1]
	local currentCount = GetPlayerGameData(varMap, varPlayer, MDCount[1], MDCount[2], MDCount[3])
	SetPlayerGameData(varMap, varPlayer, MDCount[1], MDCount[2], MDCount[3], currentCount + 1)
	WriteLog(1, format("x570080_AddTime ---varToday = %d, varLastday = %d, currentCount = %d", 
						varToday, varLastday, currentCount))
end

function x570080_ProcAccept( varMap, varPlayer )
	WriteLog(1, format("x570080_ProcAccept --- varMap=%d varPlayer=%d varIndex =%d",
				varMap, varPlayer, x570080_var_Temp_Index))
	
	local needProp = x570080_var_Material[x570080_var_Temp_Index] --需要的道具
	local remianCount = GetItemCount(varMap, varPlayer, needProp.itemId)
	if (remianCount < needProp.count) then
		Msg2Player(varMap, varPlayer, "很抱歉，您身上没有足够的钻石原石", 8, 2)
		x570080_SendClientMsg(varMap, varPlayer, "很抱歉，您身上没有足够的钻石原石。")
		return
	end

	local exchageProp = x570080_var_ExchangeProp[x570080_var_Temp_Index] --兑换的道具
	local addCount = random(exchageProp.minCount, exchageProp.maxCount)
	
	StartItemTask(varMap)
	ItemAppendBind(varMap, exchageProp.itemId, addCount)
	if StopItemTask(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, "你的背包已满，请整理后再来。", 8, 2)
			x570080_SendClientMsg(varMap, varPlayer, "你的背包已满，请整理后再来")
	else
	  DeliverItemListSendToPlayer(varMap, varPlayer)
	  local str = format("兑换完成，您获得了%d个@item_%d",addCount,exchageProp.itemId)
	  Msg2Player(varMap, varPlayer, str, 8, 3)
	  x570080_AddTime(varMap, varPlayer)
	  if DelItem(varMap, varPlayer, needProp.itemId, needProp.count) == 0 then
			WriteLog(1, format("x570080_ProcAccept Error DelItem Fail --- varMap=%d varPlayer=%d needProp.itemId =%d needProp.count = %d",
				varMap, varPlayer, needProp.itemId, needProp.count))
		end
	end
	
end
