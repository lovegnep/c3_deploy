--名利双享包
x581629_var_FileId = 581629
x581629_var_QuestName = "现金(成2)返还80级"

--一次最多显示的奖品数
x581629_var_MaxOnceAwardNum = 5

x581629_var_ItemBonus =	{
						
						}

--点击（NPC）
function x581629_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end



--点击（按钮）点击该任务后执行此脚本
function x581629_ProcDefaultEvent( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	--未判断背包是否有足够空间

	x581629_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x581629_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )--根据索引从表中得到奖励
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x581629_var_FileId, -1);

end

--领奖
function x581629_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )
	
	--发放现金
	AddGold(varMap, varPlayer, 1000*itemNum)
	--领奖成功
	StartTalkTask(varMap)
	local DoneMSG = format("恭喜您，您获得了现金#{_MONEY%d}。",1000*itemNum)
	TalkAppendString(varMap,DoneMSG)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	--写成功LOG
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" --GUID，世界ID，姓名，等级，当前场景，DBIndex,ItemIndex,成功(1) / 失败(0)
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end



--**********************************
--接受
--**********************************
function x581629_ProcDoAccept( varMap, varPlayer )
end

function x581629_CheckCanAccept( varMap, varPlayer, varTalknpc )
	return 1
end
--点击（确定）
function x581629_CheckAndAccept( varMap, varPlayer, varTalknpc )
end

--**********************************
--放弃
--**********************************
function x581629_ProcAbandon( varMap, varPlayer, varQuest )
end
--**********************************
--继续
--**********************************
function x581629_ProcContinue( varMap, varPlayer, varTalknpc )
end
--**********************************
--检测是否可以提交
--**********************************
function x581629_CheckSubmit( varMap, varPlayer )
end
--**********************************
--提交
--**********************************
function x581629_ProcSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
--**********************************
--杀死怪物或玩家
--**********************************
function x581629_ProcKillObject( varMap, varPlayer, varObjData, varObj, varQuest )
end
--**********************************
--进入区域事件
