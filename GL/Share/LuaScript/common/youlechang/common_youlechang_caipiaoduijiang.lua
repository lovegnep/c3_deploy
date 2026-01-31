x310336_var_FileId 		= 310336

x310336_var_ScriptName	= "兑取乐透大奖！"

x310336_var_SubmitItem	= 12035005 

x310336_var_TitleInfo		= "#Y【个人】幸运乐透大奖\n\t#W幸运乐透大奖，那可是一笔巨额的财富！它的得主，究竟会是谁呢？\n\t你是这个天上人间·麒麟里最幸运的人吗？\n\t如果你这次没有中奖，记得下周继续来试试你的运气；要是你是那最幸运的家伙，更要记得每周来这里看看我，朋友！"
		
x310336_var_GameId = 1041
function x310336_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	if GetGameOpenById(x310336_var_GameId) <= 0 then
		Msg2Player(varMap,varPlayer,"此活动已关闭",8,3)
		return
	end
			local wday, week = GetWeek()
  if wday ~= 0 and wday ~= 6 then
      Msg2Player( varMap, varPlayer, "周六、周日才能领奖", 8, 3)
      return
  end
	local curTime = GetMinOfDay()		
	if curTime < 540 or curTime>= 1370 then
		Msg2Player( varMap, varPlayer, "非正常时间无法领奖", 8, 3)
		return
		end
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x310336_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310336_var_FileId, x310336_var_FileId)
end


function x310336_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
    TalkAppendButton(varMap,x310336_var_FileId,x310336_var_ScriptName,3,0)
end

function x310336_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x310336_ProcAccept( varMap, varPlayer )

	local varBagIdx = FindFirstBagIndexOfItem( varMap, varPlayer, x310336_var_SubmitItem)
	if varBagIdx < 0 then
		local varMsg = format("没有#{_ITEM%d}。", x310336_var_SubmitItem)
		Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		return
	end
	local firstTime = GetItemParam( varMap, varPlayer, varBagIdx, 8, 2)
	local currtime = GetDayOfYear()
	if currtime ~= firstTime then
		Msg2Player( varMap, varPlayer, "已经超过了保质期，无法兑换奖励,请丢弃此道具！", 8, 3)
		return
	end
	
	local varIndex = GetItemParam( varMap, varPlayer, varBagIdx, 4, 2 )
	
	local caipiao1 = GetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO1)
	local caipiao2 = GetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO1)
	local caipiao3 = GetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO1)
	local caipiao4 = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO2)
	local caipiao5 = GetCountryParam( varMap, 1, CD_YOULECHANG_CAIPIAO2)
	local caipiao6 = GetCountryParam( varMap, 2, CD_YOULECHANG_CAIPIAO2)
	local caipiao7 = GetCountryParam( varMap, 3, CD_YOULECHANG_CAIPIAO2)
	
	if caipiao1 == -1 and caipiao2 == -1 and caipiao3 == -1 and caipiao4 == -1 and
		caipiao5 == -1 and caipiao6 == -1 and caipiao7 == -1 then
		Msg2Player( varMap, varPlayer, "很抱歉，现在还没有开出幸运号码", 8, 3)
		return
	end
	
	local varRet = 0
	if varIndex == caipiao1 then
		varRet = 1
	elseif varIndex == caipiao2 then
		varRet = 1
	elseif varIndex == caipiao3 then
		varRet = 1
	elseif varIndex == caipiao4 then
		varRet = 1
	elseif varIndex == caipiao5 then
		varRet = 1
	elseif varIndex == caipiao6 then
		varRet = 1
	elseif varIndex == caipiao7 then
		varRet = 1
	end
	
	if varRet == 0 then
		Msg2Player( varMap, varPlayer, "很抱歉，您手中的号码不在今天已开出的幸运号码之内", 8, 3)
		return
	end
	
	if DelItem( varMap, varPlayer, x310336_var_SubmitItem, 1) ~= 1 then return 0 end
	
	GamePlayScriptLog(varMap, varPlayer, 1612)
	
	local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)-1000
	AddMoney(varMap,varPlayer,1,varCount*1000)
	
	Msg2Player( varMap, varPlayer, format("恭喜你中了乐透大奖！你获得了#{_MONEY%d}银卡的奖励！", varCount*1000), 8, 3)
end
