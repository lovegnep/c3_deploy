
x920007_var_FileId 					= 920007
x920007_var_QuestName				= "【师徒】升级师傅称号"

x920007_var_Title_Cachet_Table 					= {
										{titleID = 9, titleName = "初为人师", cachet = 0, varNum = 1},
										{titleID = 10, titleName = "为人师表", cachet = 2500, varNum = 2},
										{titleID = 11, titleName = "诲人不倦", cachet = 10000, varNum = 3},
										{titleID = 12, titleName = "厚德树人", cachet = 30000 , varNum = 4},
										{titleID = 13, titleName = "名扬四海", cachet = 80000,varNum = 5},
								}

x920007_var_Title_Cachet_Table_Count				=	5


function x920007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap,x920007_var_FileId,x920007_var_QuestName,3,0);
end

function x920007_ProcEventEntry(varMap, varPlayer, varTalknpc)
	local nCurTitle = GetTitleForPrenticeCount(varMap, varPlayer)
	local varStr = nil

	if nCurTitle == 0 then
		varStr = "\t您还不是师傅，请先收一个徒弟获得师傅称号之后再来升级师傅称号。"
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)
		
		return
	end
	
	local varI = 1
	for j,item in x920007_var_Title_Cachet_Table do
		if item.titleID == nCurTitle then
			if varI >= x920007_var_Title_Cachet_Table_Count then
				varStr = "\t您的师徒称号已经为顶级了，无法升级。"
				
				StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
				StopTalkTask();
				DeliverTalkMenu( varMap, varPlayer, varTalknpc)
				
				return
			end

			break
		end
		varI = varI + 1
		
	end

	varStr = format("\t是否花费%d威望将师徒称号升级为%s?升级后你可以最多收%d个徒弟。", x920007_var_Title_Cachet_Table[varI + 1].cachet, x920007_var_Title_Cachet_Table[varI + 1].titleName , x920007_var_Title_Cachet_Table[varI + 1].varNum)
	local value = GetPlayerGoodBadValue(varMap, varPlayer)
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	TalkAppendString(varMap, "\n\t#Y你当前威望值为："..value);
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x920007_var_FileId,-1)
	
end

function x920007_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end

function x920007_ProcAccept(varMap, varPlayer, varTalknpc)
	
	local nCurTitle = GetTitleForPrenticeCount(varMap, varPlayer)
	local varRet = nil

	if nCurTitle == 0 then
		
		
		return
	end
	
	local varI = 1
	for j,item in x920007_var_Title_Cachet_Table do
		if item.titleID == nCurTitle then
			if varI >= x920007_var_Title_Cachet_Table_Count then
				
				
				return
			end

			break
		end
		varI = varI + 1
		
	end
	
	local value = GetPlayerGoodBadValue(varMap, varPlayer)
	if value < x920007_var_Title_Cachet_Table[varI + 1].cachet then
		varRet = "你的威望值不足！";
		Msg2Player(varMap,varPlayer,varRet,8,3)
		Msg2Player(varMap,varPlayer,varRet,8,2)
		return
	end

	value = value - x920007_var_Title_Cachet_Table[varI + 1].cachet

	SetPlayerGoodBadValue(varMap, varPlayer, value)

	ChangeTitleForPrenticeCount(varMap, varPlayer, x920007_var_Title_Cachet_Table[varI + 1].titleID)

	Msg2Player(varMap,varPlayer,"师傅称号升级完成",8,3)
	Msg2Player(varMap,varPlayer,"师傅称号升级完成",8,2)

end
