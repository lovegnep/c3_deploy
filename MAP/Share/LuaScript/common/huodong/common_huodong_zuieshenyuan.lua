

x310965_var_FileId 		= 310965
x310965_var_keyID = 11012656

--扣除的现金数量 ，单位两
x310965_var_cost = 10000

x310965_var_TitleInfo		= "\t我会带你返回大都，确定返回吗？"

						
function x310965_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt,varRadioSelected,varButtonClick)


	local x = random (0 , 2)
	if idExt == 100 then
		local varguo=GetCurCountry(varMap, varPlayer)
		if varguo == 0 then
			NewWorld(varMap,varPlayer,0,245+x,313+x,310965)
		elseif varguo == 1 then
			NewWorld(varMap,varPlayer,0,245+x,313+x,310965)
		elseif varguo == 2 then
			NewWorld(varMap,varPlayer,0,245+x,313+x,310965)
		elseif varguo == 3 then
			NewWorld(varMap,varPlayer,0,245+x,313+x,310965)
		end
	elseif idExt == 200 then
			StartItemTask(varMap)
			ItemAppend(varMap,x310965_var_keyID,1)	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		    local cm = x310965_var_cost*GetLevel( varMap, varPlayer)
			if CostMoney(varMap, varPlayer, 2, cm, 307) == 1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,format("恭喜您获得了一个大汉密令！扣除了%d两现金！",floor(cm/1000)))
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
				return 1			
			else
				StartTalkTask(varMap,varPlayer)
					TalkAppendString(varMap,"对不起，您所携带的现金不足！")	
				StopTalkTask()
				DeliverTalkTips(varMap,varPlayer)
			end		

		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end	
	--elseif idExt >=300 then
	elseif idExt >=300 and idExt <310 then
		local hour,minute,sec =GetHourMinSec()
		local time0 = 0
		local time1 = 0
		if hour == 23 and minute >= 45 then
			time0 = 1
		end
		if hour == 24 and minute <= 14 then
			time1 = 1
		end
		if time0 == 1 or time1 == 1 then
			
			Msg2Player( varMap, varPlayer, "很抱歉，罪恶深渊开放时间为每日00:15~23:45。", 8, 2)
			Msg2Player( varMap, varPlayer, "很抱歉，罪恶深渊开放时间为每日00:15~23:45。", 8, 3)
			return 0
		end
		
		local varToday = GetDayOfYear() --获取今天日期
		local HaveKey = GetItemCount(varMap,varPlayer,x310965_var_keyID)
		local value = GetPlayerGameData(varMap, varPlayer, MD_ZUIESHENYUAN_DATE[1], MD_ZUIESHENYUAN_DATE[2], MD_ZUIESHENYUAN_DATE[3])
		if value ~= varToday  then
				if HaveKey > 0 then
					if DelItem(varMap,varPlayer,x310965_var_keyID,1) == 1 then 
					SetPlayerGameData(varMap, varPlayer, MD_ZUIESHENYUAN_DATE[1], MD_ZUIESHENYUAN_DATE[2], MD_ZUIESHENYUAN_DATE[3], varToday)
					if idExt == 300 then
						NewWorld(varMap,varPlayer,436,40+x,56+x,310965)
					elseif idExt == 301 then
						NewWorld(varMap,varPlayer,437,201+x,59+x,310965)
					elseif idExt == 302 then
						NewWorld(varMap,varPlayer,438,40+x,56+x,310965)
					elseif idExt == 303 then
						NewWorld(varMap,varPlayer,439,201+x,59+x,310965)
					elseif idExt == 304 then
						NewWorld(varMap,varPlayer,440,40+x,56+x,310965)
					elseif idExt == 305 then
						NewWorld(varMap,varPlayer,441,201+x,59+x,310965)
					elseif idExt == 306 then
						NewWorld(varMap,varPlayer,442,40+x,56+x,310965)
					elseif idExt == 307 then
						NewWorld(varMap,varPlayer,443,201+x,59+x,310965)
					elseif idExt == 308 then
						NewWorld(varMap,varPlayer,444,40+x,56+x,310965)
					elseif idExt == 309 then
						NewWorld(varMap,varPlayer,445,201+x,59+x,310965)
					end
					end

				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y您身上没有大汉密令！");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 
				end
		else
		
			if idExt == 300 then
			NewWorld(varMap,varPlayer,436,40+x,56+x,310965)
		elseif idExt == 301 then
			NewWorld(varMap,varPlayer,437,201+x,59+x,310965)
		elseif idExt == 302 then
			NewWorld(varMap,varPlayer,438,40+x,56+x,310965)
		elseif idExt == 303 then
			NewWorld(varMap,varPlayer,439,201+x,59+x,310965)
		elseif idExt == 304 then
			NewWorld(varMap,varPlayer,440,40+x,56+x,310965)
		elseif idExt == 305 then
			NewWorld(varMap,varPlayer,441,201+x,59+x,310965)
		elseif idExt == 306 then
			NewWorld(varMap,varPlayer,442,40+x,56+x,310965)
		elseif idExt == 307 then
			NewWorld(varMap,varPlayer,443,201+x,59+x,310965)
		elseif idExt == 308 then
			NewWorld(varMap,varPlayer,444,40+x,56+x,310965)
		elseif idExt == 309 then
			NewWorld(varMap,varPlayer,445,201+x,59+x,310965)
			end

		end

	end

end


function x310965_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest,varImpact)

	
	if varMap == 436 or varMap == 437 or varMap == 438 or varMap == 439 or varMap == 440 or varMap == 441 or varMap == 442 or varMap == 443 or varMap == 444 or varMap == 445 then
		TalkAppendButton(varMap,x310965_var_FileId,"离开罪恶深渊",3,100)
	else
		StartTalkTask(varMap) 
		TalkAppendString(varMap,"#Y罪恶深渊")    
		TalkAppendString(varMap,"\t我是麦哲伦，大元天牢的典狱长，我手下关押着的都是帝国最邪恶最无药可救的罪犯，他们本来都应该在栅栏后度过余生。但是最近一股强大的力量开始在监狱中蔓延，犯人们开始越来越无法控制，终于叛乱爆发了，我所有的手下全都呗困在了里面，只有我逃了出来，你敢于闯入这人间地狱，查清原因并平息那里的叛乱吗？")  
		TalkAppendString(varMap,"\t#R每天第一次进入需要小号大汉密令一个，该道具只在当天生效，可重复进入，您可以量力而行选择适合您的深渊区域。每天罪恶深渊的安全开放时间为00:15~23:45。")
		local level = GetLevel(varMap, varPlayer)
        if level < 85 then
            TalkAppendString(varMap,"#Y您当前等级过低，需要达到85级才能进入罪恶深渊")
            StopTalkTask()
            return
        end

        TalkAppendButton(varMap,x310965_var_FileId,"我要购买一份大汉密令",3,200)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊一层（60~69）",3,300)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊二层（70~79）",3,301)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊三层（80~89）",3,302)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊四层（90~99）",3,303)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊五层（100~109）",3,304)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊六层（110~119）",3,305)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊七层（120~129）",3,306)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊八层（130~139）",3,307)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊九层（140~149）",3,308)
		TalkAppendButton(varMap,x310965_var_FileId,"我选择挑战深渊十层（150~159）",3,309)
		StopTalkTask()  
	end
	
end

function x310965_ProcMapTimerTick( varMap, monsterobjid )

end
function x310965_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x310965_ProcAccept( varMap, varPlayer )



 
end
