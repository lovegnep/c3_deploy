
x310001_var_FileId = 310001
x310001_var_QuestName = "【领取战神加护】" 
x310001_var_ContinueInfo="\t当今四处怪物横行，要去迷宫的话更要小心为上。\n\t我可以为你祈求#g战神加护#w，虽说不能帮你强攻御敌，但好歹能让你精神抖擞，让你在战斗中获得更多的收益吧。\n\t#r注意：#g战神加护#w仅在#g外高加索、乌孙古道、葱岭西麓、大同路、济宁路、保定路、地下粮仓、仙人谷#w有效。\n\t每次领取将获得#g1小时#w的在该当场景中的#r经验加成#w。战神加护的时间#g可以叠加#w，也可以#g和别的经验加成奖励共同作用#w。\n\t但#r每天你只可以领取1次#w，请合理安排。"

x310001_var_SuccessInfo="你领取了一小时的战神加护"


x310001_var_LevelLimit = 20
x310001_var_BufId = 7041

x310001_var_RoundLimit= 1


x310001_SceneList = {2,3,4,5,6,7,8,9,10,11,86,87,89,186,187,189,286,287,289,386,387,389,73,173,273,373,74,174,274,374,68,168,268,368}




function x310001_NextDayReset(varMap, varPlayer)
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_DATE[1], MD_MIGONG_SHUANGBEI_DATE[2], MD_MIGONG_SHUANGBEI_DATE[3])

	if varLastday ~= GetDayOfYear() then
		SetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_DATE[1], MD_MIGONG_SHUANGBEI_DATE[2], MD_MIGONG_SHUANGBEI_DATE[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_ROUNDS[1], MD_MIGONG_SHUANGBEI_ROUNDS[2], MD_MIGONG_SHUANGBEI_ROUNDS[3], 0)
	end
end

function x310001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varCountry = GetCurCountry(varMap, varPlayer)
	local nDefaultCamp = GetSceneCamp( varMap )-16

	if GetLevel( varMap, varPlayer ) < x310001_var_LevelLimit then 
		return
	end
	if varCountry == nDefaultCamp then 
		x310001_NextDayReset(varMap, varPlayer)
		TalkAppendButton(varMap, x310001_var_FileId, x310001_var_QuestName, 3, 1)
	else 
			return
	end
	
end

function x310001_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310001_var_QuestName)
		TalkAppendString(varMap,x310001_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310001_var_FileId, -1)

end





function x310001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local curRounds = GetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_ROUNDS[1], MD_MIGONG_SHUANGBEI_ROUNDS[2], MD_MIGONG_SHUANGBEI_ROUNDS[3])

	if curRounds >= x310001_var_RoundLimit then
		local varStr = "你已经领取过战神加护了，请明天再来";
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,varStr,8,2)
		return 0
	end

	if GetLevel( varMap, varPlayer ) < x310001_var_LevelLimit then 
		StartTalkTask(varMap);
			TalkAppendString(varMap, "等级不够。");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"等级不够。",8,2)
		return 0
	end


	return 1
end

function x310001_ProcAccept( varMap, varPlayer )
	local rounds = GetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_ROUNDS[1], MD_MIGONG_SHUANGBEI_ROUNDS[2], MD_MIGONG_SHUANGBEI_ROUNDS[3])

	local varToday = GetDayOfYear() 

	if IsHaveSpecificImpact(varMap, varPlayer,x310001_var_BufId) > 0 then
		local lastContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x310001_var_BufId) - GetImpactContinuanceElapsed(varMap, varPlayer, x310001_var_BufId) 
		if lastContinuance >= 0 then
			SetImpactContinuanceByDataIndex( varMap, varPlayer, x310001_var_BufId, lastContinuance+60*60*1000 )
			ResetImpactContinuanceElapsed(varMap, varPlayer, x310001_var_BufId)

			SetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_DATE[1], MD_MIGONG_SHUANGBEI_DATE[2], MD_MIGONG_SHUANGBEI_DATE[3], varToday)
			SetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_ROUNDS[1], MD_MIGONG_SHUANGBEI_ROUNDS[2], MD_MIGONG_SHUANGBEI_ROUNDS[3], rounds+1)

			RefreshImpactByDataIndex(varMap, varPlayer,x310001_var_BufId)
		end
	else
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310001_var_BufId, 0)

		SetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_DATE[1], MD_MIGONG_SHUANGBEI_DATE[2], MD_MIGONG_SHUANGBEI_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_MIGONG_SHUANGBEI_ROUNDS[1], MD_MIGONG_SHUANGBEI_ROUNDS[2], MD_MIGONG_SHUANGBEI_ROUNDS[3], rounds+1)
	end
	
	StartTalkTask(varMap);
	TalkAppendString(varMap, x310001_var_SuccessInfo);
	StopTalkTask(varMap);
	DeliverTalkTips(varMap,varPlayer);
	Msg2Player(varMap,varPlayer,x310001_var_SuccessInfo,8,2)
	
	x310001_EnterScene(varMap,varPlayer)
	
end

function x310001_EnterScene(varMap, varPlayer)
	local sign=0;
	for varI, item in x310001_SceneList do
		if varMap == item then sign = 1 break end
	end

	if sign == 1 then
		if IsHaveSpecificImpact( varMap, varPlayer, x310001_var_BufId ) > 0 then
			
			SetWanFaExpMult( varMap, varPlayer, 0.5 )
			
		end
	else
        SetWanFaExpMult( varMap, varPlayer, 0 )
    end
end
