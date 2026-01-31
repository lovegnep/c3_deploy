--强效练功人偶"	12030218

x580254_g_ScriptId = 580254
x580254_g_MissionName = "强效练功人偶"

--一次最多显示的奖品数
x580254_g_MaxOnceAwardNum = 1
x580254_g_ItemBonus =	{	{zhiye=-1,id=12030218,num=1}	--强效练功人偶"
						}


--点击（NPC）
function x580254_ProcEnumEvent( sceneId, selfId, targetId, MissionId )
	return 0
	
end



--点击（按钮）点击该任务后执行此脚本
function x580254_ProcEventEntry( sceneId, selfId, targetId,state,index )	
	
	--未判断背包是否有足够空间

	x580254_DispatchMissionInfo( sceneId, selfId, targetId,index)

end

function x580254_DispatchMissionInfo( sceneId, selfId, targetId,index)

	SetPlayerRuntimeData( sceneId, selfId, RD_HUMAN_CURR_AWARD_INDEX, index )

	local title,text,scriptId,BagNeedSpace,MinSpliceNum = GetAwardInfo( sceneId, selfId,index )--根据索引从表中得到奖励
	local str = format("%s \n  %s",title,text)

	StartTalkTask(sceneId)
	TalkAppendString(sceneId,str)
	StopTalkTask(sceneId)
	DeliverTalkMenu(sceneId,selfId,targetId)
	DeliverTalkInfo(sceneId, selfId, targetId, x580254_g_ScriptId, -1);

end

--领奖
function x580254_AddAward( sceneId, selfId,itemNum,index, dbIndex )

	StartItemTask( sceneId )

	local	zhiye = GetZhiye(sceneId, selfId)

	local IsHaveItem = 0
	for i,itm in x580254_g_ItemBonus do
		if itm.zhiye == -1 then
			IsHaveItem = 1
			ItemAppendBind( sceneId, itm.id, itm.num*itemNum )	
		elseif itm.zhiye == zhiye then 
			IsHaveItem = 1
			ItemAppendBind( sceneId, itm.id, itm.num*itemNum )	
		end
	end

	local ret = StopItemTask( sceneId, selfId )
	if ret > 0 then
		if IsHaveItem == 1 then
			DeliverItemListSendToPlayer(sceneId,selfId) 
		end
	else
		--失败写LOG
		local logFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" --GUID，世界ID，姓名，等级，当前场景，DBIndex,ItemIndex,成功(1) / 失败(0)
		local logMsg = format(logFmtMsg,GetPlayerGUID( sceneId,selfId ),GetWorldId(sceneId,selfId),GetName( sceneId,selfId ),GetLevel(sceneId,selfId),sceneId,dbIndex,index,0,GetServerIndex(),GetWorldID(sceneId,selfId))
		WriteLog(16,logMsg)
		return
	end

--	AddMoney( sceneId, selfId, 3, 12000000*itemNum,101 ) 

	local title,text,scriptId,BagNeedSpace,MinSpliceNum = GetAwardInfo( sceneId, selfId,index )--根据索引从表中得到奖励

	--领奖成功
	StartTalkTask(sceneId)
	local DoneMSG =  format("恭喜您，您获得了"..title..itemNum.."个")
	TalkAppendString(sceneId,DoneMSG)
	StopTalkTask(sceneId)
	DeliverTalkTips(sceneId,selfId)

	--写成功LOG
	local logFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" --GUID，世界ID，姓名，等级，当前场景，DBIndex,ItemIndex,成功(1) / 失败(0)
	local logMsg = format(logFmtMsg,GetPlayerGUID( sceneId,selfId ),GetWorldId(sceneId,selfId),GetName( sceneId,selfId ),GetLevel(sceneId,selfId),sceneId,dbIndex,index,1,GetServerIndex(),GetWorldID(sceneId,selfId))
	WriteLog(16,logMsg)

end



--**********************************
--接受
--**********************************
function x580254_ProcAccept( sceneId, selfId )
end

function x580254_ProcAcceptCheck( sceneId, selfId, NPCId )
	return 1
end
--点击（确定）
function x580254_ProcQuestAccept( sceneId, selfId, NPCId )
end

--**********************************
--放弃
--**********************************
function x580254_ProcQuestAbandon( sceneId, selfId, MissionId )
end
--**********************************
--继续
--**********************************
function x580254_OnContinue( sceneId, selfId, targetId )
end
--**********************************
--检测是否可以提交
--**********************************
function x580254_CheckSubmit( sceneId, selfId )
end
--**********************************
--提交
--**********************************
function x580254_ProcQuestSubmit( sceneId, selfId, targetId,selectRadioId, MissionId )
end
--**********************************
--杀死怪物或玩家
--**********************************
function x580254_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )
end
--**********************************
--进入区域事件
