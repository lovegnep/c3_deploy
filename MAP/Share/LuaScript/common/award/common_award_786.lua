
x581786_var_FileId = 581786
x581786_var_QuestName = "领取战车底盘大礼包"

--一次最多显示的奖品数
x581786_var_MaxOnceAwardNum = 5

x581786_var_ItemBonus =	{
							{zhiye=-1,varId=12500102,varNum=1}
						}

--点击（NPC）
function x581786_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end



--点击（按钮）点击该任务后执行此脚本
function x581786_ProcDefaultEvent( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	--未判断背包是否有足够空间

	x581786_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x581786_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )--根据索引从表中得到奖励
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x581786_var_FileId, -1);

end

--领奖
function x581786_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x581786_var_ItemBonus do
		if itm.zhiye == -1 then
			IsHaveItem = 1
			ItemAppendBind( varMap, itm.varId, itm.varNum*itemNum )	
		elseif itm.zhiye == zhiye then 
			IsHaveItem = 1
			ItemAppendBind( varMap, itm.varId, itm.varNum*itemNum )	
		end
	end

	local ret = StopItemTask( varMap, varPlayer )
	if ret > 0 then
		if IsHaveItem == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	else
		--失败写LOG
		local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" --GUID，世界ID，姓名，等级，当前场景，DBIndex,ItemIndex,成功(1) / 失败(0)
		local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
		WriteLog(16,varLogMsg)
		return
	end

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )--根据索引从表中得到奖励

	--领奖成功
	StartTalkTask(varMap)
	local DoneMSG = "恭喜您，您获得了"..title..itemNum.."个"
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
function x581786_ProcDoAccept( varMap, varPlayer )
end

function x581786_CheckCanAccept( varMap, varPlayer, varTalknpc )
	return 1
end
--点击（确定）
function x581786_CheckAndAccept( varMap, varPlayer, varTalknpc )
end

--**********************************
--放弃
--**********************************
function x581786_ProcAbandon( varMap, varPlayer, varQuest )
end
--**********************************
--继续
--**********************************
function x581786_ProcContinue( varMap, varPlayer, varTalknpc )
end
--**********************************
--检测是否可以提交
--**********************************
function x581786_CheckSubmit( varMap, varPlayer )
end
--**********************************
--提交
--**********************************
function x581786_ProcSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
--**********************************
--杀死怪物或玩家
--**********************************
function x581786_ProcKillObject( varMap, varPlayer, varObjData, varObj, varQuest )
end
--**********************************
--进入区域事件
