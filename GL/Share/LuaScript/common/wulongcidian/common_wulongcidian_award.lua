
x310181_var_FileId = 310181
x310181_var_GameId = 1019

function x310181_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById(x310181_var_GameId) ~= 1 then
		return
	end
	if GetWeek() ~= 0 then
	   return
	end
    TalkAppendButton(varMap,x310181_var_FileId,"我要领取乌龙辞典奖励",3,x310181_var_FileId);
        
end

function x310181_AddAward(varMap ,varPlayer, arg)
	local varExpBonus = GetLevel(varMap ,varPlayer)*arg
	AddExp(varMap, varPlayer, varExpBonus);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
end


function x310181_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	local minute =  GetMinOfDay()
	if minute < 17*60+5 then
		StartTalkTask(varMap)	
		TalkAppendString(varMap, "\t请在下午17:05后来领取")						
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end

	local varName = GetName(varMap, varPlayer)
	local varIndex = 0
	for varI=1, WULONGCIDIAN_AWARD_COUNT do
		if WULONGCIDIAN_AWARD_NAME[varI] == varName then
			varIndex = varI
		end
	end

	if varIndex >0 and varIndex <=WULONGCIDIAN_AWARD_COUNT then
		if WULONGCIDIAN_AWARD_Draw[varIndex] == 1 then
			StartTalkTask(varMap)	
			TalkAppendString(varMap, "\t你已经领取过奖励了！")						
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
	else
		StartTalkTask(varMap)	
		TalkAppendString(varMap, "\t你似乎并没有取得名次！")						
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end

	local r = random(1, 100)
	local item =0
	if idExt == x310181_var_FileId then 
		if varIndex == 1 then
			WULONGCIDIAN_AWARD_Draw[varIndex] = 1
			StartTalkTask(varMap)	
			TalkAppendString(varMap, "\t你在乌龙辞典中赢得了第一名，获得了乌龙宗师的称号！")						
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			AwardTitle(varMap,varPlayer,6)
			x310181_AddAward(varMap ,varPlayer, 100000)
		elseif varIndex == 2 then
			WULONGCIDIAN_AWARD_Draw[varIndex] = 1
			StartTalkTask(varMap)	
			TalkAppendString(varMap, "\t你在乌龙辞典中赢得了第二名，获得了乌龙高手的称号！")						
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			AwardTitle(varMap,varPlayer,7)
			x310181_AddAward(varMap ,varPlayer, 80000)
		elseif varIndex == 3 then
			WULONGCIDIAN_AWARD_Draw[varIndex] = 1
			StartTalkTask(varMap)	
			TalkAppendString(varMap, "\t你在乌龙辞典中赢得了第三名，获得了乌龙强人的称号！")						
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			AwardTitle(varMap,varPlayer,8)
			x310181_AddAward(varMap ,varPlayer, 50000)
			else
			WULONGCIDIAN_AWARD_Draw[varIndex] = 1
			StartTalkTask(varMap)
			if GetSex(varMap,varPlayer) == 0 then
				TalkAppendString(varMap, "\t你在乌龙辞典中获得了乌龙才女的称号！")
			else
				TalkAppendString(varMap, "\t你在乌龙辞典中获得了乌龙才子的称号！")
			end
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			AwardTitle(varMap,varPlayer,14)

			x310181_AddAward(varMap ,varPlayer, 30000)
		end
	
	end
	
end
