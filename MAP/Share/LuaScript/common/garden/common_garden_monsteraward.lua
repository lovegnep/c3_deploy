x801003_var_FileId = 801003

-- 预定义设置
x801003_var_Define =
{
	defaultstring ="\t没想到会有那么强的敌人，还好大家一起齐心协力将他们驱逐出了我们的庄园，如果仅凭我一人之力恐怕已经……\n\t勇士！我这里备了一份薄礼以敬您的勇气与智慧。",
	eventtip ="领取慰劳奖励",
	eventstring ="#Y【领取清剿入侵者奖励说明】#W\n\t每当庄园受到入侵时，如果在它们撤离前将他们全部击退，就可以到我这领取一份慰劳奖励。",
	award = {invalid = 0, timeropen = 1, timerflag = 2, timerclose = 3}	,
}

function x801003_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		StartTalkTask(varMap)
		TalkAppendString(varMap,x801003_var_Define.eventstring)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x801003_var_FileId, -1);
end

function x801003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)		

	if x801003_HaveTimerAward(varMap, varPlayer) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x801003_var_Define.defaultstring)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x801003_var_FileId, -1);
			
			TalkAppendButton(varMap, x801003_var_FileId, x801003_var_Define.eventtip,3,0)
	end	
end

function x801003_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end


function x801003_ProcAccept( varMap, varPlayer )
		if x801003_HaveTimerAward(varMap, varPlayer) ~= 1 then
			Msg2Player( varMap, varPlayer, "您已经领取过了奖励", 8, 3 )	
			return
		end	
		
		--道具
--		if GetBagSpace(varMap, varPlayer) <= 0 then
--			Msg2Player( varMap, varPlayer, "您的背包满了，请整理您的背包", 8, 3 )	
--			return
--		end
		
--		local nToolNum = 1 --
--		local nToolID = 12271046
--		StartItemTask(varMap)
--		ItemAppendBind(varMap, nToolID, nToolNum)			
--		local ret = StopItemTask(varMap,varPlayer)
--		if ret <= 0 then
--			Msg2Player(varMap, varPlayer, "您的背包满了，请整理您的背包", 8, 3)
--			return
--		end
		
--		DeliverItemListSendToPlayer(varMap, varPlayer)
--		local varStr = "#Y您获得了：#G#{_ITEM"..nToolID.."}" .. nToolNum .. "#Y个！"
--		Msg2Player(varMap, varPlayer, varStr, 8, 3)	
--		WriteLog(1, format("garden monster award: guid:%X,nToolID:%d,nToolNum:%d", varGUID, nToolID, nToolNum))	
		
		--经验
		local nLevel = GetLevel(varMap, varPlayer)
		local exp = nLevel * 20000
		AddExp( varMap, varPlayer, exp )
  	local nstr = format("获得#G%d点#cffcf00经验值的奖励",exp)
  	Msg2Player(varMap,varPlayer,nstr,8,2)
		
		--清理标记
		local varWorld = GetWorldId(varMap, varPlayer)
		local varGUID = GetGUID(varMap, varPlayer)
		SetGardenGiftFlag(varMap, varWorld, varGUID, x801003_var_Define.award.timerclose)
end

function x801003_HaveTimerAward( varMap, varPlayer )
	local varWorld = GetWorldId(varMap, varPlayer)
	local varGUID = GetGUID(varMap, varPlayer)
	local flag = 	GetGardenGiftFlag(varMap, varWorld, varGUID)
	if flag == x801003_var_Define.award.timerflag then --当前只有定时领奖
		return 1
	end		
	return 0
end
