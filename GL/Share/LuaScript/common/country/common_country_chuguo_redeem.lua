x300636_var_FileId = 300636
x300636_var_QuestName = "【国家】领取出国津贴"
x300636_var_GameId =1009
x300636_var_Level = 60
x300636_var_Multiple = 2*5
x300636_var_Empireextra = 15000*5

function x300636_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	if GetGameOpenById(x300636_var_GameId) > 0 then
		TalkAppendButton(varMap,x300636_var_FileId, x300636_var_QuestName, 3)
	end
	
end

function x300636_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CHUGUO_COUNT, x300636_var_FileId,-1,"ProcReturn1")
end

function x300636_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x300636_Newking(varMap, varPlayer,QuestData,varQuest)
	local curDay = GetDayTime()
	if curDay == QuestData then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，当天上台的国王帮成员或大臣不能领取工资");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，当天上台的国王帮成员或大臣不能领取工资",4,2)
		return
	end
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CHUGUO_COUNT, x300636_var_FileId,-1,"ProcReturn3")
end

function x300636_ProcAccept( varMap, varPlayer)
	
	local hour,minute,second = GetHourMinSec()
	if GetWeek() ~= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只能在周日领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只能在周日领取。",8,2)
		return
	end

	
		if GetExploit(varMap, varPlayer) < 38 then
			if x300631_GetOfficialQuestId(varMap, varPlayer)==-2 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，国王帮成员才可以领取出国津贴。")
				DeliverTalkTips(varMap, varPlayer)
				StopTalkTask(varMap)
				Msg2Player(varMap,varPlayer,"很抱歉，国王帮成员才可以领取出国津贴。",8,2)		
				return
			end
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您的功勋值不足38，不能领取。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您的功勋值不足38，不能领取。",8,2)		
			return
		end	
	
	if	GetLevel(varMap, varPlayer) < x300636_var_Level then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取出国津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取出国津贴。",8,2)
		return
	end
	
	if CountryIsFortuneTime(varMap, varPlayer, 1) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，出国期间不能领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，出国期间不能领取。",8,2)
		return
	end

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_CHUGUO_DATE[1], MD_CHUGUO_DATE[2], MD_CHUGUO_DATE[3])
	local lastFortune = GetFortuneLastTime(varMap, varPlayer, 1)

	if varLastday ~= 0 and GetDayOfYear() == varLastday then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，已经领过出国津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，已经领过出国津贴。",8,2)
		return
	end
	
	local Shouhu = GetPlayerGameData(varMap, varPlayer, MD_SHOUHU_DATE[1], MD_SHOUHU_DATE[2], MD_SHOUHU_DATE[3])
--	if GetDayOfYear() ==Shouhu  then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap, "很抱歉，您已经领过本周青龙（朱雀）守护津贴。")
--		DeliverTalkTips(varMap, varPlayer)
--		StopTalkTask(varMap)
--		Msg2Player(varMap,varPlayer,"很抱歉，您已经领过本周青龙（朱雀）守护津贴。",8,2)
--		return
--	end
	if lastFortune > 0 then 
	
		local officalId = x300636_GetOfficialQuestId(varMap, varPlayer)
		if officalId == -2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您不能领取津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您不能领取津贴。",8,2)
			return
		elseif officalId ~= -1 then
			GetCountryQuestData(varMap,varPlayer,officalId, x300636_var_FileId,-1,"ProcReturn2")
			return
		end	
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap, "还未发布出国令")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"还未发布出国令",8,2)
		return
	end
	
	GetJoinGuildTime(varMap,varPlayer,x300636_var_FileId)
end

function x300636_ProcMemberJoinTimeReturn( varMap, varPlayer, param )

	if param == -1 or GetCurrentTime()-param<24*3600 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您加入国王帮的时间低于24小时，不能领取津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您加入国王帮的时间低于24小时，不能领取津贴。",8,2)
		return		
	end
	
	local officalId = x300636_GetOfficialQuestId(varMap, varPlayer)
	if officalId == -1 then
		x300636_ProcReturn2(varMap, varPlayer,-1,varQuest)
		return
	end
	
	GetCountryQuestData(varMap,varPlayer,officalId, x300636_var_FileId,-1,"ProcReturn2")

end

function x300636_GetOfficialQuestId(varMap, varPlayer)
	local officalId = -1
	local selfGuildId = GetGuildID(varMap, varPlayer)
	local countryGuildId = GetCountryKingGuildId(varMap, varPlayer)
	
	if IsKing(varMap, varPlayer) > 0 then
		officalId = CD_INDEX_CHUGUO_KING
	elseif IsCountryOffical(varMap, varPlayer) > 0 then
		if IsSpecialCountryOffical(varMap, varPlayer, 7 ) > 0 then  
			officalId = CD_INDEX_CHUGUO_QUEEN
		elseif IsSpecialCountryOffical(varMap, varPlayer, 6 ) > 0 then 
			officalId = CD_INDEX_CHUGUO_GENERAL
		elseif IsSpecialCountryOffical(varMap, varPlayer, 5 ) > 0 then 
			officalId = CD_INDEX_CHUGUO_RMINISTER	
		elseif IsSpecialCountryOffical(varMap, varPlayer, 4 ) > 0 then 
			officalId = CD_INDEX_CHUGUO_LMINISTER	
		elseif IsSpecialCountryOffical(varMap, varPlayer, 3 ) > 0 then  
			officalId = CD_INDEX_CHUGUO_RGUARD	
		elseif IsSpecialCountryOffical(varMap, varPlayer, 2 ) > 0 then 
			officalId = CD_INDEX_CHUGUO_LGUARD
		end
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		officalId = -1
	else
		officalId = -2
	end
	
	return officalId
end

function x300636_ProcReturn1(varMap, varPlayer,QuestData,varQuest)

	
	local varCount = QuestData + 1
	local maxcount = x300636_GetMaxChuGuo(varMap, varPlayer) + 1

	if varCount < -1 then
		return
	end

	if varCount == -1 then
		varCount = 0
	end
				
--	if varCount > 22400 then
--		varCount = 22400
--	end
	--修改为要求出国成功次数减半
	if varCount > 11200 then
		varCount = 11200
	end
	
	local awardRongyu =0;
	local awardExp =0;
	local awardJinKa =0;
	
	local awardRongyu1 =0;
	local awardExp1 =0;
	local awardJinKa1 =0;	
	
	local awardRongyu2 =0;
	local awardExp2 =0;
	local awardJinKa2 =0;	

	local selfGuildId = GetGuildID(varMap, varPlayer)
	local countryGuildId = GetCountryKingGuildId(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	
	local toggle = 0

	if IsKing(varMap, varPlayer) > 0 then
		awardRongyu =floor(varCount/10)
		awardExp =floor(varLevel*80*varCount/10)
		awardJinKa =floor(100*varCount/10) * x300636_var_Multiple
		
		awardRongyu2 =floor(maxcount/10)
		awardExp2 =floor(varLevel*80*maxcount/10)
		awardJinKa2 =floor(100*maxcount/10) * x300636_var_Multiple
	elseif IsCountryOffical(varMap, varPlayer) > 0 then
		awardRongyu =floor(varCount*0.5/10)
		awardExp =floor(varLevel*80*varCount*0.5/10)
		awardJinKa =floor(100*varCount*0.5/10) * x300636_var_Multiple
		
		awardRongyu2 =floor(maxcount*0.5/10)
		awardExp2 =floor(varLevel*80*maxcount*0.5/10)
		awardJinKa2 =floor(100*maxcount*0.5/10) * x300636_var_Multiple
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		awardRongyu =floor(varCount*0.25/10)
		awardExp =floor(varLevel*80*varCount*0.25/10)
		awardJinKa =floor(100*varCount*0.25/10) * x300636_var_Multiple
		
		awardRongyu2 =floor(maxcount*0.25/10)
		awardExp2 =floor(varLevel*80*maxcount*0.25/10)
		awardJinKa2 =floor(100*maxcount*0.25/10) * x300636_var_Multiple
	else
		toggle =1
	end

	local ding=0
	local liang=0
	local wen=0

	
	StartTalkTask(varMap)
	local nExploit = GetExploit(varMap,varPlayer)
	if IsKing(varMap, varPlayer) > 0 then
		awardJinKa =floor(100*varCount/10) * x300636_var_Multiple
		
		if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
			awardJinKa = awardJinKa + x300636_var_Empireextra 
		end		
		
		ding = floor( awardJinKa / (1000*1000) )
		liang = floor( mod(awardJinKa,1000*1000)/ 1000 )
		wen = mod(awardJinKa,1000)
	elseif IsCountryOffical(varMap, varPlayer) > 0 then
		awardJinKa =floor(100*varCount*0.5/10) * x300636_var_Multiple
		
		if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
			awardJinKa = awardJinKa + x300636_var_Empireextra 
		end		
				
		ding = floor( awardJinKa / (1000*1000) )
		liang = floor( mod(awardJinKa,1000*1000)/ 1000 )
		wen = mod(awardJinKa,1000)
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		awardJinKa =floor(100*varCount*0.25/10) * x300636_var_Multiple
		
		if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
			awardJinKa = awardJinKa + x300636_var_Empireextra 
		end		
				
		ding = floor( awardJinKa / (1000*1000) )
		liang = floor( mod(awardJinKa,1000*1000)/ 1000 )
		wen = mod(awardJinKa,1000)
	end
	if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardJinKa = awardJinKa - x300636_var_Empireextra
				end		
		 awardRongyu1 = floor(awardRongyu*x300636_RuoGuoMulti(varMap, varPlayer))
		 awardExp1   = floor(awardExp * x300636_RuoGuoMulti(varMap, varPlayer))
		 awardJinKa1 = floor(awardJinKa * x300636_RuoGuoMulti(varMap, varPlayer))
		 if awardRongyu1 >= awardRongyu2 - awardRongyu  then
		 	awardRongyu1 = awardRongyu2 - awardRongyu
		 end
		 if awardExp1 >= awardExp2 - awardExp then
		 	awardExp1 = awardExp2 - awardExp
		 end
		 if awardJinKa1 >= awardJinKa2 - awardJinKa  then
		 	awardJinKa1 = awardJinKa2 - awardJinKa 
		 end
	end
	local varReadme = "#Y【国家】领取出国津贴#r";
	local Readme2 = "#W    出国津贴是对在出国任务中做出巨大贡献的#G国家官员#W和#G国王帮会成员#W准备的津贴。#r"
	local Readme3 = "    在发布#G出国令#W时间内，每个玩家#G完成出国任务#W的次数将直接影响当天出国任务津贴的多少。#r"
	local Readme4 = "    每周一到周日，每天出国令期间出国任务的完成次数将会累计，在周日，可以领取一周的出国津贴。在功勋值足够的基础上，#G国王#W领取#G四倍#W津贴，#G国家大臣#W领取#G两倍#W的津贴，#G国王帮众#W领取#G一倍#W的津贴。#r"
	local Readme5 = "    达到#G60级#W的王者卫队成员每周的功勋值必须达到#G38#W点以上才可以领取出国津贴，功勋值是每人在出国令期间完成出国任务时获得。#r\t请问您是否要领取？"
	local Readme6 = "\t#R皇帝国国王帮成员，额外获得#R15两现金的奖励。#W#r"
	local award1 = format("#W您将获得#R%d#W荣誉奖励#r", awardRongyu);
	local award2 = format("您将获得#R%d#W经验奖励#r", awardExp);
	local award3 = format("您将获得#R%d锭%d两%d#W文现金奖励", ding,liang,wen);
	local award4 = format("#W弱国额外获得#R%d#W荣誉奖励#r", awardRongyu1);
	local award5 = format("弱国额外获得#R%d#W经验奖励#r", awardExp1);
	local award6 = format("弱国额外获得获得#R#{_MONEY%d}#W现金奖励", awardJinKa1);
	local award = "您现在拥有#G"..nExploit.."点#W功勋值";
	local blank=" #r";
	if toggle == 0 then
			local varMsg = format(varReadme..Readme2..Readme3..Readme4..Readme5..blank..award..blank..award1..award2..award3)
			if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					varMsg = format(varReadme..Readme2..Readme3..Readme4..Readme6..Readme5..blank..award..blank..award1..award2..award3) 
			end
		TalkAppendString(varMap,varMsg)
		if awardRongyu1 > 0 or awardExp1 > 0 or awardJinKa1 > 0 then
		TalkAppendString(varMap,award4..award5..award6)
		end
	else
			local varMsg = format(varReadme..Readme2..Readme3..Readme4..Readme5)
			if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					varMsg = format(varReadme..Readme2..Readme3..Readme4..Readme6..Readme5) 
			end	
		TalkAppendString(varMap,varMsg)
	end
	StopTalkTask(varMap)	
	DeliverTalkInfo(varMap,varPlayer,-1,x300636_var_FileId,-1)

	return 	
end

function x300636_ProcReturn2(varMap, varPlayer,QuestData,varQuest)

	if QuestData>=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，此职位已经领过出国津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，此职位已经领过出国津贴。",8,2)
		return		
	end
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CREATEKING_DATE, x300636_var_FileId,-1,"Newking")
end

function x300636_ProcReturn3(varMap, varPlayer,QuestData,varQuest)
	
	local selfGuildId = GetGuildID(varMap, varPlayer)
	local countryGuildId = GetCountryKingGuildId(varMap, varPlayer)
	local officalId = -1
	local varCountry = GetCurCountry(varMap, varPlayer)
	local lastFortune = GetFortuneLastTime(varMap, varPlayer, 1)

	
	local varCount = QuestData + 1
	local maxcount = x300636_GetMaxChuGuo(varMap, varPlayer) + 1
	if varCount < -1 then
		return
	end
	if varCount == -1 then
		varCount = 0
	end
	--if varCount > 22400 then
	--	varCount = 22400
	--end
	--修改为要求出国成功次数减半
	if varCount > 11200 then
		varCount = 11200
	end
	
	
		if IsKing(varMap, varPlayer) > 0 then

			local varLevel = GetLevel(varMap, varPlayer)
			
			AddHonor( varMap, varPlayer, floor(varCount/10) )			
			local varStr=format("#o获得#R荣誉%d点#o的奖励", floor(varCount/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
				local rongyu = floor(varCount/10*x300636_RuoGuoMulti(varMap, varPlayer))
					if rongyu >= floor(maxcount/10) - floor(varCount/10) then
						rongyu = floor(maxcount/10) - floor(varCount/10)
					end
					AddHonor( varMap, varPlayer, rongyu )
					local varStr1=format("#o弱国额外获得#R荣誉%d点#o的奖励", rongyu)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end			
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,4,2)

			AddExp( varMap, varPlayer, floor(varLevel*80*varCount/10) )
			varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*80*varCount/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
					local exp = floor(varLevel*80*varCount/10*x300636_RuoGuoMulti(varMap, varPlayer))
					if exp >= floor(varLevel*80*maxcount/10) - floor(varLevel*80*varCount/10) then
						exp = floor(varLevel*80*maxcount/10) - floor(varLevel*80*varCount/10)
					end
					AddExp( varMap, varPlayer, exp )
					local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end	
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,4,2)

			local awardMoney = 100*varCount * x300636_var_Multiple
			
			if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
				awardMoney = awardMoney + x300636_var_Empireextra*10 
			end	
							
			--AddMoney( varMap, varPlayer,3, floor(awardMoney/10) )
			--更改为送现金
			AddGold(varMap, varPlayer, floor(awardMoney/10) )
			varStr = format( "获得#R现金#{_MONEY%d}#o的奖励", floor(awardMoney/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
			
					if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
						awardMoney = awardMoney - x300636_var_Empireextra*10 
					end	
											
					local money = floor(awardMoney/10*x300636_RuoGuoMulti(varMap, varPlayer))
					if money >= floor(100*maxcount * x300636_var_Multiple/10) - floor(awardMoney/10) then
					 money = floor(100*maxcount * x300636_var_Multiple/10) - floor(awardMoney/10)
					end
					--AddMoney( varMap, varPlayer,3, money )
					--更改为送现金
					AddGold(varMap, varPlayer, money )
					local varStr1=format("#o弱国额外获得#R现金#{_MONEY%d}#o的奖励", money)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end	
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, varStr,4,2)

			officalId = x300636_GetOfficialQuestId(varMap, varPlayer)
			SetPlayerGameData(varMap, varPlayer, MD_CHUGUO_DATE[1], MD_CHUGUO_DATE[2], MD_CHUGUO_DATE[3], GetDayOfYear())
			SetCountryQuestData(varMap, varCountry, officalId, GetDayOfYear() )

			
			GamePlayScriptLog( varMap, varPlayer, 981)
			
		elseif IsCountryOffical(varMap, varPlayer) > 0 then

			local varLevel = GetLevel(varMap, varPlayer)

			AddHonor( varMap, varPlayer, floor(varCount*0.5/10) )
			local varStr=format("#o获得#R荣誉%d点#o的奖励", floor(varCount*0.5/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
				local rongyu = floor(varCount*0.5/10*x300636_RuoGuoMulti(varMap, varPlayer))
					if rongyu >= floor(maxcount*0.5/10) - floor(varCount*0.5/10) then
						rongyu = floor(maxcount*0.5/10) - floor(varCount*0.5/10)
					end
					AddHonor( varMap, varPlayer, rongyu )
					local varStr1=format("#o弱国额外获得#R荣誉%d点#o的奖励", rongyu)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end	
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,4,2)

			AddExp( varMap, varPlayer, floor(varLevel*40*varCount/10) )
			varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*40*varCount/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
					local exp = varLevel*40*varCount/10*x300636_RuoGuoMulti(varMap, varPlayer)
						if exp >= varLevel*40*maxcount/10 - varLevel*40*varCount/10 then
						 exp = varLevel*40*maxcount/10 - varLevel*40*varCount/10
						end
					AddExp( varMap, varPlayer, exp )
					local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end				
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,4,2)

			local awardMoney = 50*varCount * x300636_var_Multiple
			
			if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
				awardMoney = awardMoney + x300636_var_Empireextra*10 
			end		
			
			--AddMoney( varMap, varPlayer,3, floor(awardMoney/10) )
			--更改为送现金
			AddGold(varMap, varPlayer, floor(awardMoney/10) )		
			varStr = format( "获得#R现金#{_MONEY%d}#o的奖励", floor(awardMoney/10) )
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
			
					if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
						awardMoney = awardMoney - x300636_var_Empireextra*10 
					end		
									
					local money = floor(awardMoney/10*x300636_RuoGuoMulti(varMap, varPlayer))
						if money >= floor(50*maxcount * x300636_var_Multiple/10)  - floor(awardMoney/10)  then
							money = floor(50*maxcount * x300636_var_Multiple/10)  - floor(awardMoney/10) 
						end
					--AddMoney( varMap, varPlayer,3, money )
					--更改为送现金
					AddGold(varMap, varPlayer, money )	
					local varStr1=format("#o弱国额外获得#R现金#{_MONEY%d}#o的奖励", money)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end				
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, varStr,4,2)
			
			officalId = x300636_GetOfficialQuestId(varMap, varPlayer)
			SetPlayerGameData(varMap, varPlayer, MD_CHUGUO_DATE[1], MD_CHUGUO_DATE[2], MD_CHUGUO_DATE[3], GetDayOfYear())
			SetCountryQuestData(varMap, varCountry, officalId, GetDayOfYear() )
		
			
			GamePlayScriptLog( varMap, varPlayer, 981)
			
		elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		
			local varLevel = GetLevel(varMap, varPlayer)

			AddHonor( varMap, varPlayer, floor(varCount*0.25/10) )
			local varStr=format("#o获得#R荣誉%d点#o的奖励", floor(varCount*0.25/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
					local honor = floor(varCount*0.25/10*x300636_RuoGuoMulti(varMap, varPlayer))
						if honor >= floor(maxcount*0.25/10) - floor(varCount*0.25/10) then
						 honor = floor(maxcount*0.25/10) - floor(varCount*0.25/10)
						end
					AddHonor( varMap, varPlayer, honor )
					local varStr1=format("#o弱国额外获得#R荣誉%d点#o的奖励", honor)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end	
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,4,2)

			AddExp( varMap, varPlayer, floor(varLevel*20*varCount/10) )
			varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*20*varCount/10))
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
					local exp = floor(varLevel*20*varCount/10*x300636_RuoGuoMulti(varMap, varPlayer)) 
					if exp >= floor(varLevel*20*maxcount/10) - floor(varLevel*20*varCount/10) then
						exp = floor(varLevel*20*maxcount/10) - floor(varLevel*20*varCount/10)
					end
					AddExp( varMap, varPlayer, exp )
					local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end				
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,4,2)

			local awardMoney = 25*varCount * x300636_var_Multiple
			
			if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
				awardMoney = awardMoney + x300636_var_Empireextra*10 
			end	
						
			--AddMoney( varMap, varPlayer,3, floor(awardMoney/10) )
			--更改为送现金
			AddGold(varMap, varPlayer, floor(awardMoney/10) )	
			varStr = format( "获得#R现金#{_MONEY%d}#o的奖励", floor(awardMoney/10) )
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if x300636_RuoGuoMulti(varMap, varPlayer) > 0 then
			
					if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
						awardMoney = awardMoney - x300636_var_Empireextra*10 
					end	
									
					local money = floor(awardMoney/10*x300636_RuoGuoMulti(varMap, varPlayer))
						if money >= floor(25*maxcount * x300636_var_Multiple/10) - floor(awardMoney/10) then
						 money = floor(25*maxcount * x300636_var_Multiple/10) - floor(awardMoney/10)
						end
					--AddMoney( varMap, varPlayer,3, money )
					--更改为送现金
					AddGold(varMap, varPlayer, money )
					local varStr1=format("#o弱国额外获得#R现金#{_MONEY%d}#o的奖励", money)
					TalkAppendString(varMap, varStr1)
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end			
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, varStr,4,2)
			SetPlayerGameData(varMap, varPlayer, MD_CHUGUO_DATE[1], MD_CHUGUO_DATE[2], MD_CHUGUO_DATE[3], GetDayOfYear())
			
			
			GamePlayScriptLog( varMap, varPlayer, 981)
			
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您不能领取津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您不能领取津贴。",8,2)
		end
end
function x300636_RuoGuoMulti(varMap, varPlayer)
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
		if maxlevel >= 70 then
			if selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 then
				if x300636_IsMinGuo(varMap, varPlayer) == 1 then
					local multi = allscore*0.25/selfscore
					return multi
				end
			end
		end
		return 0
end
function x300636_IsMinGuo(varMap, varPlayer)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local MinGuo = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local Onlyvalue = 0
		for varI = 0, 3 do
			if GetCountryParam(varMap, varI, CD_LASTWEEK_STRONG_WEAK_JIFEN) <= MinGuo then
				Onlyvalue = Onlyvalue + 1
			end
		end
		if Onlyvalue == 1 then
			return 1
		end
	return 0
end

function x300636_GetMaxChuGuo(varMap, varPlayer)
	local loulanchuguo  = GetCountryParam(varMap, 0, CD_INDEX_CHUGUO_COUNT)
	local tianshanscore = GetCountryParam(varMap, 1, CD_INDEX_CHUGUO_COUNT)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_INDEX_CHUGUO_COUNT)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_INDEX_CHUGUO_COUNT)
	local MaxCount = 0
	for varI = 0, 3 do 
		if GetCountryParam(varMap, varI, CD_INDEX_CHUGUO_COUNT) > MaxCount then
			MaxCount = GetCountryParam(varMap, varI, CD_INDEX_CHUGUO_COUNT)
		end
	end
	return MaxCount
end
