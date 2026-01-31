--冥·天若有情(妻)（180天）"	10287356


x580300_var_FileId = 580300
x580300_var_QuestName = "冥·天若有情(妻)（180天）"

--一次最多显示的奖品数
x580300_var_MaxOnceAwardNum = 1
x580300_var_ItemBonus =	{	{zhiye=-1,varId=10287356,varNum=1}	--冥·天若有情(妻)（180天）"
						}


--点击（NPC）
function x580300_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end



--点击（按钮）点击该任务后执行此脚本
function x580300_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	--未判断背包是否有足够空间

	x580300_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580300_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )--根据索引从表中得到奖励
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580300_var_FileId, -1);

end

--领奖
function x580300_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for i,itm in x580300_var_ItemBonus do
		if itm.zhiye == -1 then
			IsHaveItem = 1
			ItemAppend( varMap, itm.varId, itm.varNum*itemNum )	
		elseif itm.zhiye == zhiye then 
			IsHaveItem = 1
			ItemAppend( varMap, itm.varId, itm.varNum*itemNum )	
		end
	end

	local ret = StopItemTask( varMap, varPlayer )
	if ret > 0 then
		if IsHaveItem == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	else
		--失败写LOG
		local logFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" --GUID，世界ID，姓名，等级，当前场景，DBIndex,ItemIndex,成功(1) / 失败(0)
		local logMsg = format(logFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
		WriteLog(16,logMsg)
		return
	end

--	AddMoney( varMap, varPlayer, 3, 12000000*itemNum,101 ) 

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )--根据索引从表中得到奖励

	--领奖成功
	StartTalkTask(varMap)
	local DoneMSG =  format("恭喜您，您获得了"..title..itemNum.."个")
	TalkAppendString(varMap,DoneMSG)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	--写成功LOG
	local logFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" --GUID，世界ID，姓名，等级，当前场景，DBIndex,ItemIndex,成功(1) / 失败(0)
	local logMsg = format(logFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,logMsg)

end



--**********************************
--接受
--**********************************
function x580300_ProcAccept( varMap, varPlayer )
end

function x580300_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end
--点击（确定）
function x580300_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end

--**********************************
--放弃
--**********************************
function x580300_ProcQuestAbandon( varMap, varPlayer, varQuest )
end
--**********************************
--继续
--**********************************
function x580300_ProcContinue( varMap, varPlayer, varTalknpc )
end
--**********************************
--检测是否可以提交
--**********************************
function x580300_CheckSubmit( varMap, varPlayer )
end
--**********************************
--提交
--**********************************
function x580300_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
--**********************************
--杀死怪物或玩家
--**********************************
function x580300_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end
--**********************************
--进入区域事件
