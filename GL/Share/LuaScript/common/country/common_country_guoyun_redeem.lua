  x300631_var_FileId = 300631
x300631_var_QuestName = "【国家】领取国运津贴"
x300631_var_GameId =1008
x300631_var_Level = 60
function x300631_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	if GetGameOpenById(x300631_var_GameId) > 0 then
		TalkAppendButton(varMap,x300631_var_FileId, x300631_var_QuestName, 3)
	end
	
end

function x300631_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_GUOYUN_COUNT, x300631_var_FileId,-1,"ProcReturn1")	
end

function x300631_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x300631_Newking(varMap, varPlayer,QuestData,varQuest)
	local curDay = GetDayTime()
	if curDay == QuestData then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，当天上台的国王帮成员或大臣不能领取工资");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，当天上台的国王帮成员或大臣不能领取工资",4,2)
		return
	end
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_GUOYUN_COUNT, x300631_var_FileId,-1,"ProcReturn3")
end

function x300631_ProcAccept( varMap, varPlayer )

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
				TalkAppendString(varMap, "很抱歉，国王帮成员才可以领取国运津贴。")
				DeliverTalkTips(varMap, varPlayer)
				StopTalkTask(varMap)
				Msg2Player(varMap,varPlayer,"很抱歉，国王帮成员才可以领取国运津贴。",8,2)		
				return
			end
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您的功勋值不足38，不能领取。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您的功勋值不足38，不能领取。",8,2)		
			return
		end
	
	if	GetLevel(varMap, varPlayer) < x300631_var_Level then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取国运津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取国运津贴。",8,2)
		return
	end
		
	if CountryIsFortuneTime(varMap, varPlayer, 0) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，国运期间不能领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，国运期间不能领取。",8,2)
		return
	end

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUOYUN_DATE[1], MD_GUOYUN_DATE[2], MD_GUOYUN_DATE[3])
	local lastFortune = GetFortuneLastTime(varMap, varPlayer, 0)

	if varLastday ~= 0 and GetDayOfYear() == varLastday then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，已经领过国运津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，已经领过国运津贴。",8,2)
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
	
		local officalId = x300631_GetOfficialQuestId(varMap, varPlayer)
		
		if officalId == -2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您不能领取津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您不能领取津贴。",8,2)
			return
		elseif officalId ~= -1 then
			GetCountryQuestData(varMap,varPlayer,officalId, x300631_var_FileId,-1,"ProcReturn2")
			return			
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap, "还未发布国运令")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"还未发布国运令",8,2)
		return
	end
		
	GetJoinGuildTime(varMap,varPlayer,x300631_var_FileId)
end

function x300631_ProcMemberJoinTimeReturn( varMap, varPlayer, param )

	if param == -1 or GetCurrentTime()-param<24*3600 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您加入国王帮的时间低于24小时，不能领取津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您加入国王帮的时间低于24小时，不能领取津贴。",8,2)
		return		
	end
	
	local officalId = x300631_GetOfficialQuestId(varMap, varPlayer)
	if officalId == -1 then
		x300631_ProcReturn2(varMap, varPlayer,-1,varQuest)
		return
	end
	
	GetCountryQuestData(varMap,varPlayer,officalId, x300631_var_FileId,-1,"ProcReturn2")
end

function x300631_GetOfficialQuestId(varMap, varPlayer)
	local officalId = -1
	local selfGuildId = GetGuildID(varMap, varPlayer)
	local countryGuildId = GetCountryKingGuildId(varMap, varPlayer)
	
	if IsKing(varMap, varPlayer) > 0 then
		officalId = CD_INDEX_GUOYUN_KING
	elseif IsCountryOffical(varMap, varPlayer) > 0 then
		if IsSpecialCountryOffical(varMap, varPlayer, 7 ) > 0 then  
			officalId = CD_INDEX_GUOYUN_QUEEN
		elseif IsSpecialCountryOffical(varMap, varPlayer, 6 ) > 0 then 
			officalId = CD_INDEX_GUOYUN_GENERAL
		elseif IsSpecialCountryOffical(varMap, varPlayer, 5 ) > 0 then 
			officalId = CD_INDEX_GUOYUN_RMINISTER	
		elseif IsSpecialCountryOffical(varMap, varPlayer, 4 ) > 0 then 
			officalId = CD_INDEX_GUOYUN_LMINISTER	
		elseif IsSpecialCountryOffical(varMap, varPlayer, 3 ) > 0 then  
			officalId = CD_INDEX_GUOYUN_RGUARD	
		elseif IsSpecialCountryOffical(varMap, varPlayer, 2 ) > 0 then 
			officalId = CD_INDEX_GUOYUN_LGUARD
		end
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		officalId = -1
	else
		officalId = -2
	end
	
	return officalId
end

function x300631_ProcReturn1(varMap, varPlayer,QuestData,varQuest)
	local varCount = QuestData + 1
	local maxcount = x300631_GetMaxGuoYun(varMap, varPlayer) + 1
	
	if varCount < -1 then
		return
	end

	if varCount == -1 then
		varCount = 0
	end
	
	--if varCount > 21000 then
	--	varCount = 21000
	--end
	--在线人数问题次数减半
	if varCount > 10500 then
		varCount = 10500
	end
	
	local awardExp =0;
	local awardShengWang =0;
	local awardYinKa =0;
	
	local awardExp1 =0;
	local awardShengWang1 =0;
	local awardYinKa1 =0;
	
	local awardExp2 =0;
	local awardShengWang2 =0;
	local awardYinKa2 =0;
	

	local selfGuildId = GetGuildID(varMap, varPlayer)
	local countryGuildId = GetCountryKingGuildId(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	
	local toggle = 0
	if IsKing(varMap, varPlayer) > 0 then
		awardExp =floor(varLevel*12*varCount)
		awardShengWang =varCount
		awardYinKa =varLevel*varCount*2
		
		awardExp2 =floor(varLevel*12*maxcount)
		awardShengWang2 =maxcount
		awardYinKa2 =varLevel*maxcount*2
	elseif IsCountryOffical(varMap, varPlayer) > 0 then
		awardExp =floor(varLevel*12*varCount*0.5)
		awardShengWang =floor(varCount*0.5)
		awardYinKa =floor(varLevel*varCount*0.5*2)
		
		awardExp2 =floor(varLevel*12*maxcount*0.5)
		awardShengWang2 =floor(maxcount*0.5)
		awardYinKa2 =floor(varLevel*maxcount*0.5*2)	
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		awardExp =floor(varLevel*12*varCount*0.25)
		awardShengWang =floor(varCount*0.25)
		awardYinKa =floor(varLevel*varCount*0.25*2)
		
		awardExp2 =floor(varLevel*12*maxcount*0.25)
		awardShengWang2 =floor(maxcount*0.25)
		awardYinKa2 =floor(varLevel*maxcount*0.25*2)	
	else
		toggle =1
	end

	local ding=0
	local liang=0
	local wen=0
	
	StartTalkTask(varMap)
	local nExploit = GetExploit(varMap,varPlayer)
	if IsKing(varMap, varPlayer) > 0 then
		awardYinKa =floor(varLevel*varCount*2)
		ding = floor( awardYinKa / (1000*1000) )
		liang = floor( mod(awardYinKa,1000*1000)/ 1000 )
		wen = mod(awardYinKa,1000)
	elseif IsCountryOffical(varMap, varPlayer) > 0 then
		awardYinKa =floor(varLevel*varCount*0.5*2)
		ding = floor( awardYinKa / (1000*1000) )
		liang = floor( mod(awardYinKa,1000*1000)/ 1000 )
		wen = mod(awardYinKa,1000)
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
		awardYinKa =floor(varLevel*varCount*0.25*2)
		ding = floor( awardYinKa / (1000*1000) )
		liang = floor( mod(awardYinKa,1000*1000)/ 1000 )
		wen = mod(awardYinKa,1000)
	end
	if x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
		 awardExp1 = floor(awardExp*x300631_RuoGuoMulti(varMap, varPlayer))
		 awardShengWang1   = floor(awardShengWang * x300631_RuoGuoMulti(varMap, varPlayer))
		 awardYinKa1 = floor(awardYinKa * x300631_RuoGuoMulti(varMap, varPlayer))
		 if awardExp1 >= awardExp2 - awardExp then
		 	awardExp1 = awardExp2 - awardExp
		 end
		 if awardShengWang1 >= awardShengWang2 - awardShengWang then
		 	awardShengWang1 = awardShengWang2 - awardShengWang
		 end
		 if awardYinKa1 >= awardYinKa2 - awardYinKa then
		  awardYinKa1 = awardYinKa2 - awardYinKa
		 end
	end
	local varReadme = "#Y【国家】领取国运津贴#r";
	local Readme2 = "#W    国运津贴是对在国运中做出巨大贡献的#G国家官员#W和#G国王帮会成员#W准备的津贴。#r"
	local Readme3 = "    在发布#G国运令#W时间内，#G官府押运的完成次数#W将直接影响当天国运津贴的多少。#r"
	local Readme4 = "    每周一到周日，每天国运令期间官府押运的完成次数将会累计，在周日，可以领取一周的国运津贴。在功勋值足够的基础上，#G国王#W领取#G四倍#W津贴，#G国家大臣#W领取#G两倍#W的津贴，#G国王帮众#W领取#G一倍#W的津贴。#r"
	local Readme5 = "    达到#G60级#W的王者卫队成员每周的功勋值必须达到#G38#W点以上才可以领取国运津贴，功勋值是每人在出国令期间完成出国任务时获得。#r\t请问您是否要领取？"
	local award1 = format("#W您将获得#R%d#W经验奖励#r", awardExp);
	local award2 = format("您将获得#R%d#W声望奖励#r", awardShengWang);
	local award3 = format("您将获得#R%d锭%d两%d文#W金卡奖励", ding,liang,wen);
	local award4 = format("#W弱国额外获得#R%d#W经验奖励#r", awardExp1);
	local award5 = format("弱国额外获得#R%d#W声望奖励#r", awardShengWang1);
	local award6 = format("弱国额外获得#R#{_MONEY%d}#W金卡奖励", awardYinKa1);	
	local award = "您现在拥有#G"..nExploit.."点#W功勋值"
	local blank=" #r";
	if toggle == 0 then
		TalkAppendString(varMap,varReadme..Readme2..Readme3..Readme4..Readme5..blank..award..blank..award1..award2..award3)
		if awardExp1 > 0 or awardShengWang1 > 0 or awardYinKa1 > 0 then
			TalkAppendString(varMap,award4..award5..award6)
		end
	else
		TalkAppendString(varMap,varReadme..Readme2..Readme3..Readme4..Readme5)
	end
	StopTalkTask(varMap)	
	DeliverTalkInfo(varMap,varPlayer,-1,x300631_var_FileId,-1)

	return 

end


function x300631_ProcReturn2(varMap, varPlayer,QuestData,varQuest)
	
	if QuestData>=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，此职位已经领过国运津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，此职位已经领过国运津贴。",8,2)
		return		
	end
	
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CREATEKING_DATE, x300631_var_FileId,-1,"Newking")
	
end


function x300631_ProcReturn3(varMap, varPlayer,QuestData,varQuest)

	local selfGuildId = GetGuildID(varMap, varPlayer)
	local countryGuildId = GetCountryKingGuildId(varMap, varPlayer)
	local officalId = -1
	local varCountry = GetCurCountry(varMap, varPlayer)
	local lastFortune = GetFortuneLastTime(varMap, varPlayer, 0)
	
	local varCount = QuestData + 1
	local maxcount = x300631_GetMaxGuoYun(varMap, varPlayer) + 1


	if varCount < -1 then
		return
	end
	if varCount == -1 then
		varCount = 0
	end
	--if varCount > 21000 then
	--	varCount = 21000
	--end
	--在线人数问题次数减半
	if varCount > 10500 then
		varCount = 10500
	end
	
	if IsKing(varMap, varPlayer) > 0 then

		local varLevel = GetLevel(varMap, varPlayer)
		AddExp( varMap, varPlayer, floor(varLevel*12*varCount) )
		local varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*12*varCount))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
				local exp = floor(varLevel*12*varCount*x300631_RuoGuoMulti(varMap, varPlayer))
					if exp >= floor(varLevel*12*maxcount) - floor(varLevel*12*varCount)  then
						exp = floor(varLevel*12*maxcount) - floor(varLevel*12*varCount)
					end
				AddExp( varMap, varPlayer, exp )
				local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end				
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + varCount
		SetShengWang( varMap, varPlayer, varShengWang )
		varStr = format("获得#R声望%d#o的奖励", varCount)
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if  x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
					local varShengWang = GetShengWang( varMap, varPlayer )
						local shengwang = varCount*x300631_RuoGuoMulti(varMap, varPlayer)
						if shengwang >= maxcount - varCount then
						 shengwang = maxcount - varCount 
						end
						varShengWang = varShengWang + shengwang
					SetShengWang( varMap, varPlayer, varShengWang )
					varStr1 = format("弱国额外获得#R声望%d#o的奖励", shengwang)
					TalkAppendString(varMap, varStr1);
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end					
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)
		
		local awardMoney = varLevel*varCount*2
		--AddMoney( varMap, varPlayer,1, awardMoney )
		--奖励更改为金卡
		AddMoney( varMap, varPlayer,3, awardMoney )
		varStr = format( "获得#R金卡#{_MONEY%d}#o的奖励", awardMoney)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
				local money = awardMoney * x300631_RuoGuoMulti(varMap, varPlayer)
					if money >= varLevel*maxcount  - awardMoney then
						 money = varLevel*maxcount  - awardMoney
					end
				--AddMoney( varMap, varPlayer,1, money)
				--奖励更改为金卡
				AddMoney( varMap, varPlayer,3, money)
				varStr1 = format( "弱国额外获得#R金卡#{_MONEY%d}#o的奖励",money)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, varStr,4,2)

		officalId = x300631_GetOfficialQuestId(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_GUOYUN_DATE[1], MD_GUOYUN_DATE[2], MD_GUOYUN_DATE[3], GetDayOfYear())
		SetCountryQuestData(varMap, varCountry, officalId, GetDayOfYear() )
		

		
		GamePlayScriptLog( varMap, varPlayer, 991)
		
	elseif IsCountryOffical(varMap, varPlayer) > 0 then

		local varLevel = GetLevel(varMap, varPlayer)
		AddExp( varMap, varPlayer, floor(varLevel*12*varCount*0.5) )
		local varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*12*varCount*0.5))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
				local exp = floor(varLevel*12*varCount*0.5*x300631_RuoGuoMulti(varMap, varPlayer))
					if exp >= floor(varLevel*12*maxcount*0.5) - floor(varLevel*12*varCount*0.5) then
					 exp = floor(varLevel*12*maxcount*0.5) - floor(varLevel*12*varCount*0.5)
					end
				AddExp( varMap, varPlayer, exp )
				local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end		
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + (varCount*0.5)
		SetShengWang( varMap, varPlayer, floor(varShengWang) )
		varStr = format("获得#R声望%d#o的奖励", floor(varCount*0.5))
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if  x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
					local varShengWang = GetShengWang( varMap, varPlayer )
					local shengwang = varCount*0.5*x300631_RuoGuoMulti(varMap, varPlayer)
						if shengwang >= maxcount*0.5 - varCount*0.5 then
							shengwang = maxcount*0.5 - varCount*0.5
						end
						varShengWang = varShengWang + shengwang
					SetShengWang( varMap, varPlayer, varShengWang )
					varStr1 = format("弱国额外获得#R声望%d#o的奖励", shengwang)
					TalkAppendString(varMap, varStr1);
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end		
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local awardMoney = varLevel*varCount*0.5*2
		--AddMoney( varMap, varPlayer,1, floor(awardMoney) )
		--奖励更改为金卡
		AddMoney( varMap, varPlayer,3, floor(awardMoney) )		
		varStr = format( "获得#R金卡#{_MONEY%d}#o的奖励", floor(awardMoney))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
				local money = awardMoney * x300631_RuoGuoMulti(varMap, varPlayer)
					if money >= varLevel*maxcount*0.5 - varLevel*varCount*0.5 then
					 money = varLevel*maxcount*0.5 - varLevel*varCount*0.5
					end
				--AddMoney( varMap, varPlayer,1, money)
				--奖励更改为金卡
				AddMoney( varMap, varPlayer,3, money)
				varStr1 = format( "弱国额外获得#R金卡#{_MONEY%d}#o的奖励", money)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, varStr,4,2)
		
		officalId = x300631_GetOfficialQuestId(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_GUOYUN_DATE[1], MD_GUOYUN_DATE[2], MD_GUOYUN_DATE[3], GetDayOfYear())
		SetCountryQuestData(varMap, varCountry, officalId, GetDayOfYear() )
		
	
		
		GamePlayScriptLog( varMap, varPlayer, 991)
		
	elseif selfGuildId ~= -1 and countryGuildId == selfGuildId then
	
		local varLevel = GetLevel(varMap, varPlayer)
		AddExp( varMap, varPlayer, floor(varLevel*12*varCount*0.25) )
		local varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*12*varCount*0.25))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
				local exp = floor(varLevel*12*varCount*0.25*x300631_RuoGuoMulti(varMap, varPlayer)) 
					if exp >= floor(varLevel*12*maxcount*0.25) - floor(varLevel*12*varCount*0.25) then
						exp = floor(varLevel*12*maxcount*0.25) - floor(varLevel*12*varCount*0.25)
					end
				AddExp( varMap, varPlayer, exp )
				local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end				
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + (varCount*0.25)
		SetShengWang( varMap, varPlayer, floor(varShengWang) )
		varStr = format("获得#R声望%d#o的奖励", floor(varCount*0.25))
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
				if  x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
					local varShengWang = GetShengWang( varMap, varPlayer )
						local shengwang = varCount*0.25*x300631_RuoGuoMulti(varMap, varPlayer) 
							if shengwang >= floor(maxcount*0.25) - floor(varCount*0.25) then
								shengwang = floor(maxcount*0.25) - floor(varCount*0.25)
							end
					varShengWang = varShengWang + shengwang
					SetShengWang( varMap, varPlayer, varShengWang )
					varStr1 = format("弱国额外获得#R声望%d#o的奖励", shengwang)
					TalkAppendString(varMap, varStr1);
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end				
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local awardMoney = varLevel*varCount*0.25*2
		--AddMoney( varMap, varPlayer,1, floor(awardMoney) )
		--奖励更改为金卡
		AddMoney( varMap, varPlayer,3, floor(awardMoney) )
		varStr = format( "获得#R金卡#{_MONEY%d}#o的奖励", floor(awardMoney))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300631_RuoGuoMulti(varMap, varPlayer) > 0 then
				local money = awardMoney * x300631_RuoGuoMulti(varMap, varPlayer) 
					if money >= floor(varLevel*maxcount*0.25 ) - floor(awardMoney) then
					 money = floor(varLevel*maxcount*0.25 ) - floor(awardMoney)
					end
				--AddMoney( varMap, varPlayer,1, money)
				--奖励更改为金卡
				AddMoney( varMap, varPlayer,3, money)
				varStr1 = format( "弱国额外获得#R金卡#{_MONEY%d}#o的奖励", money)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, varStr,4,2)
		SetPlayerGameData(varMap, varPlayer, MD_GUOYUN_DATE[1], MD_GUOYUN_DATE[2], MD_GUOYUN_DATE[3], GetDayOfYear())
	
		
		GamePlayScriptLog( varMap, varPlayer, 991)
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您不能领取津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您不能领取津贴。",8,2)
	end	
	
end
function x300631_RuoGuoMulti(varMap, varPlayer)
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
				if x300631_IsMinGuo(varMap, varPlayer) == 1 then
					local multi = allscore*0.25/selfscore	
					return multi
				end
			end
		end
		return 0
end
function x300631_IsMinGuo(varMap, varPlayer)
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

function x300631_GetMaxGuoYun(varMap, varPlayer)
	local loulanchuguo  = GetCountryParam(varMap, 0, CD_INDEX_GUOYUN_COUNT)
	local tianshanscore = GetCountryParam(varMap, 1, CD_INDEX_GUOYUN_COUNT)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_INDEX_GUOYUN_COUNT)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_INDEX_GUOYUN_COUNT)
	local MaxCount = 0
	for varI = 0, 3 do 
		if GetCountryParam(varMap, varI, CD_INDEX_GUOYUN_COUNT) > MaxCount then
			MaxCount = GetCountryParam(varMap, varI, CD_INDEX_GUOYUN_COUNT)
		end
	end
	return MaxCount
end
