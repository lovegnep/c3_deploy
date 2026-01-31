x300658_var_FileId = 300658
x300658_var_QuestName = "【国家】领取青龙守护津贴"
x300658_var_GameId =1092
x300658_var_GongValud = 32
x300658_var_Multiple = 2*5
x300658_var_Empireextra = 10000*5

function x300658_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	if GetGameOpenById(x300658_var_GameId) > 0 then
		
		TalkAppendButton(varMap,x300658_var_FileId, x300658_var_QuestName, 3)
		
	end
	
end

function x300658_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CHUGUO_COUNT, x300658_var_FileId,-1,"ProcReturn1")
end

function x300658_ProcReturn1(varMap, varPlayer,QuestData,varQuest)
	local varCount = QuestData + 1
	local maxcount = x300658_GetMaxChuGuo(varMap, varPlayer) + 1

	if varCount < -1 then
		return
	end

	if varCount == -1 then
		varCount = 0
	end
				
	if varCount > 10000 then
		varCount = 10000
	end
	
	local awardExp =0;
	local awardJinKa =0;
	local awardShengWang =0;
	local awardRongyu =0;
	
	local awardExp1 =0;
	local awardJinKa1 =0;
	local awardShengWang1 =0;
	local awardRongyu1 =0;
	
	local RawardExp =0;
	local RawardJinKa =0;
	local RawardShengWang =0;
	local RawardRongyu =0;
	
	local RawardExp1 =0;
	local RawardJinKa1 =0;
	local RawardShengWang1 =0;
	local RawardRongyu1 =0;
	
	local RawardExp2 =0;
	local RawardJinKa2 =0;
	local RawardShengWang2 =0;
	local RawardRongyu2 =0;
	
	local RawardExp3 =0;
	local RawardJinKa3 =0;
	local RawardShengWang3 =0;
	local RawardRongyu3 =0;

	local varLevel = GetLevel(varMap, varPlayer)
	local toggle = 0
		if IsQinglongZhuque(varMap, varPlayer, 0) > 0 then
			awardRongyu =floor(varCount*3/10)
			awardExp =floor(varLevel*70*varCount)
			awardJinKa =floor(100*varCount*0.5/10) * x300658_var_Multiple
			awardShengWang =floor(varCount*3)
			RawardRongyu2 =floor(maxcount*3/10)
			RawardExp2 =floor(varLevel*70*maxcount)
			RawardJinKa2 =floor(100*maxcount*0.5/10) * x300658_var_Multiple
			RawardShengWang2 =floor(maxcount*3)			
		elseif IsInCountrySpecialGuild(varMap, varPlayer,0) > 0 then
			awardRongyu1 =floor(varCount*3/40)
			awardExp1 =floor(varLevel*70/4*varCount)
			awardShengWang1 =floor(varCount*3/4)
			awardJinKa1 =floor(100*varCount*0.5/10/4) * x300658_var_Multiple
			RawardRongyu3 =floor(maxcount*3/40)
			RawardExp3 =floor(varLevel*70/4*maxcount)
			RawardShengWang3 =floor(maxcount*3/4)
			RawardJinKa3 =floor(100*maxcount*0.5/10/4) * x300658_var_Multiple			
		else 
			toggle = -1
		end
		
		local ding=0
		local liang=0
		local wen=0
		
		local ding1=0
		local liang1=0
		local wen1=0
		
		StartTalkTask(varMap)
		local nExploit = GetExploit(varMap,varPlayer)
		if IsQinglongZhuque(varMap, varPlayer, 0) > 0 then
			awardJinKa =floor(100*varCount*0.5/10) * x300658_var_Multiple
		
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardJinKa = awardJinKa + x300658_var_Empireextra 
				end
							
			ding = floor( awardJinKa / (1000*1000) )
			liang = floor( mod(awardJinKa,1000*1000)/ 1000 )
			wen = mod(awardJinKa,1000)
		elseif IsInCountrySpecialGuild(varMap, varPlayer,0) > 0 then
			awardJinKa1 =floor(100*varCount*0.5/10/4) * x300658_var_Multiple
		
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardJinKa1 = awardJinKa1 + x300658_var_Empireextra 
				end
							
			ding1 = floor( awardJinKa1 / (1000*1000) )
			liang1 = floor( mod(awardJinKa1,1000*1000)/ 1000 )
			wen1 = mod(awardJinKa1,1000)
		end
	if x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardJinKa = awardJinKa - x300658_var_Empireextra
					awardJinKa1 = awardJinKa1 - x300658_var_Empireextra
				end
		 RawardExp = floor(awardExp*x300658_RuoGuoMulti(varMap, varPlayer))
		 RawardJinKa   = floor(awardJinKa * x300658_RuoGuoMulti(varMap, varPlayer))
		 RawardShengWang = floor(awardShengWang * x300658_RuoGuoMulti(varMap, varPlayer))
		 RawardRongyu = floor(awardRongyu * x300658_RuoGuoMulti(varMap, varPlayer))
		 RawardExp1 = floor(awardExp1 * x300658_RuoGuoMulti(varMap, varPlayer))
		 RawardJinKa1 = floor(awardJinKa1 * x300658_RuoGuoMulti(varMap, varPlayer))
 		 RawardShengWang1 = floor(awardShengWang1 * x300658_RuoGuoMulti(varMap, varPlayer))
		 RawardRongyu1 = floor(awardRongyu1 * x300658_RuoGuoMulti(varMap, varPlayer))
		 if RawardExp >= RawardExp2 - awardExp  then
		 	RawardExp = RawardExp2 - awardExp
		 end
		 if RawardJinKa >= RawardJinKa2 - awardJinKa then
		 	RawardJinKa = RawardJinKa2 - awardJinKa
		 end	
		 if RawardShengWang >= RawardShengWang2 - awardShengWang then
		 	RawardShengWang = RawardShengWang2 - awardShengWang
		 end	
		 if RawardRongyu >= RawardRongyu2 - awardRongyu then
		 	RawardRongyu = RawardRongyu2 - awardRongyu
		 end	
		 if RawardExp1 >= RawardExp3 - awardExp1 then
		 	RawardExp1 = RawardExp3 - awardExp1
		 end	
		 if RawardJinKa1 >= RawardJinKa3 - awardJinKa1 then
		 	RawardJinKa1 = RawardJinKa3 - awardJinKa1
		 end	
		 if RawardShengWang1 >= RawardShengWang3 - awardShengWang1 then
		 	RawardShengWang1 = RawardShengWang3 - awardShengWang1
		 end	
		 if RawardRongyu1 >= RawardRongyu3 - awardRongyu1 then
		 	RawardRongyu1 = RawardRongyu3 - awardRongyu1
		 end		 		 
	end
		
		local varReadme = "#Y【国家】领取青龙守护津贴#r";
		local Readme2 = "\t#W青龙守护津贴，是每一个为守护国家做出贡献的，达到#R60级#W的#G青龙守护帮会成员#W及#G青龙之主#W都可以领取的奖励。#r"
		local Readme3 = "\t在发布#G出国令#W时间内，每个玩家完成#G出国任务的次数#W将直接影响当天守护津贴的多少。#r"
		local Readme4 = "\t每#G周一#W到#G周日#W，每天出国令期间#G出国任务的完成次数#W将会#G累计#W，在#G周日#W，可以领取一周的守护津贴。在功勋值足够的基础上，#G帮众#W领取#G基本#W津贴，#G帮主#W领取#G四倍#W津贴。#r"
		local Readme5 = "\t守护帮会成员每周功勋值不低于#G32#W点，每#G周日#W可以在我这里领取一周的守护津贴，功勋值是每人在出国令期间完成出国任务时获得。#r\t请问您是否要领取？"
		local Readme6 = "\n\t#R皇帝国青龙守护帮会成员，额外获得#R10两现金的奖励。#W#r"
		local award1 = format("#W您将获得#R%d#W荣誉奖励#r", awardRongyu);
		local award2 = format("您将获得#R%d#W经验奖励#r", awardExp);
		local award3 = format("您将获得#R%d#W声望奖励#r", awardShengWang);
		local award4 = format("您将获得#R%d#K锭#R%d#K两#R%d#K文现金奖励", ding,liang,wen);
		local award5 = format("#W您将获得#R%d#W荣誉奖励#r", awardRongyu1);
		local award6 = format("您将获得#R%d#W经验奖励#r", awardExp1);
		local award7 = format("您将获得#R%d#W声望奖励#r", awardShengWang1);
		local award8 = format("您将获得#R%d#K锭#R%d#K两#R%d#K文现金奖励", ding1,liang1,wen1);
		local Raward1 = format("#W弱国额外获得#R%d#W荣誉奖励#r", RawardRongyu);
		local Raward2 = format("弱国额外获得#R%d#W经验奖励#r", RawardExp);
		local Raward3 = format("弱国额外获得#R%d#W声望奖励#r", RawardShengWang);
		local Raward4 = format("弱国额外获得#R#{_MONEY%d}#W现金奖励", RawardJinKa);
		local Raward5 = format("#W弱国额外获得#R%d#W荣誉奖励#r", RawardRongyu1);
		local Raward6 = format("弱国额外获得#R%d#W经验奖励#r", RawardExp1);
		local Raward7 = format("弱国额外获得#R%d#W声望奖励#r", RawardShengWang1);
		local Raward8 = format("弱国额外获得#R#{_MONEY%d}#W现金奖励", RawardJinKa1);
		local award = "您现在拥有#G"..nExploit.."点#W功勋值";
		local blank=" #r";
		local varMsg = format(varReadme..Readme2..Readme3..Readme4..Readme5)
			if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					varMsg = format(varReadme..Readme2..Readme3..Readme4..Readme6..Readme5) 
				end
			TalkAppendString(varMap,varMsg)
		if toggle == 0 then
			if IsQinglongZhuque(varMap, varPlayer, 0) > 0 then
			TalkAppendString(varMap,award..blank..award1..award2..award3..award4)
				if RawardRongyu > 0 or RawardExp > 0 or RawardShengWang > 0 or RawardJinKa > 0 then
					TalkAppendString(varMap,Raward1..Raward2..Raward3..Raward4)
				end
			elseif IsInCountrySpecialGuild(varMap, varPlayer,0) > 0 then
			TalkAppendString(varMap,award..blank..award5..award6..award7..award8)
				if RawardRongyu1> 0 or RawardExp1> 0 or RawardShengWang1 > 0 or RawardJinKa1 > 0 then
					TalkAppendString(varMap,Raward5..Raward6..Raward7..Raward8)
				end
			end
		end
		StopTalkTask(varMap)	
		DeliverTalkInfo(varMap,varPlayer,-1,x300658_var_FileId,-1)
		return 	
end


function x300658_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x300658_ProcAccept( varMap, varPlayer)
	local hour,minute,second = GetHourMinSec()
		if GetWeek() ~= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，只能在周日领取。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，只能在周日领取。",8,2)
			return
		end
		if	GetLevel(varMap, varPlayer) < 60 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，达到60级才可以领取青龙守护津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取青龙守护津贴。",8,2)
			return
		end
		if IsInCountrySpecialGuild(varMap, varPlayer,0)~=1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，青龙守护帮会成员才可以领取青龙守护津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，青龙守护帮会成员才可以领取青龙守护津贴。",8,2)		
			return
		end
		
		if GetExploit(varMap, varPlayer) < x300658_var_GongValud then
			local varMsg = format("很抱歉，您的功勋值不足%d点，不能领取。",x300658_var_GongValud)
			StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg)
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,varMsg,8,2)		
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
		
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_SHOUHU_DATE[1], MD_SHOUHU_DATE[2], MD_SHOUHU_DATE[3])
		local lastFortune = GetFortuneLastTime(varMap, varPlayer, 1)

		if varLastday ~= 0 and GetDayOfYear() == varLastday then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，已经领过青龙守护津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，已经领过青龙守护津贴。",8,2)
			return
		end
		
		local chuguo = GetPlayerGameData(varMap, varPlayer, MD_CHUGUO_DATE[1], MD_CHUGUO_DATE[2], MD_CHUGUO_DATE[3]) 
		if  GetDayOfYear() == chuguo then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您已经领过本周出国津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您已经领过本周出国津贴。",8,2)
			return
		end
		
		local guoyun = GetPlayerGameData(varMap, varPlayer, MD_GUOYUN_DATE[1], MD_GUOYUN_DATE[2], MD_GUOYUN_DATE[3]) 
		if  GetDayOfYear() == guoyun  then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您已经领过本周国运津贴。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您已经领过本周国运津贴。",8,2)
			return
		end
		
		if lastFortune <= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "还未发布出国令")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"还未发布出国令",8,2)
			return
		end
		
		GetJoinGuildTime(varMap,varPlayer,x300658_var_FileId)
end

function x300658_ProcMemberJoinTimeReturn( varMap, varPlayer, param )
	
	if param == -1 or GetCurrentTime()-param<24*3600 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您加入青龙守护帮的时间低于24小时，不能领取津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您加入青龙守护帮的时间低于24小时，不能领取津贴。",8,2)
		return		
	end
	
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CREATE_QINGLONG_DATE, x300658_var_FileId,-1,"Newqinglong")
end

function x300658_Newqinglong(varMap, varPlayer,QuestData,varQuest)
	local curDay = GetDayTime()
		if curDay == QuestData then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "很抱歉，当天上台的青龙守护成员不能领取工资");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"很抱歉，当天上台的青龙守护成员不能领取工资",4,2)
			return
		end
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_CHUGUO_COUNT, x300658_var_FileId,-1,"ProcReturn2")
end


function x300658_ProcReturn2(varMap, varPlayer,QuestData,varQuest)
	local selfGuildId = GetGuildID(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local officalId = -1
	local lastFortune = GetFortuneLastTime(varMap, varPlayer, 1)
	
	local varCount = QuestData + 1
	local maxcount = x300658_GetMaxChuGuo(varMap, varPlayer) + 1
	if varCount < -1 then
		return
	end
	if varCount == -1 then
		varCount = 0
	end
	if varCount > 10000 then
		varCount = 10000
	end
	
	if IsQinglongZhuque(varMap, varPlayer, 0) > 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		AddHonor( varMap, varPlayer, floor(varCount*3/10) )
		local varStr=format("#o获得#R荣誉%d点#o的奖励", floor(varCount*3/10))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				local honor = floor(varCount*3/10*x300658_RuoGuoMulti(varMap, varPlayer))
					if honor >= floor(maxcount*3/10) - floor(varCount*3/10) then
						honor = floor(maxcount*3/10) - floor(varCount*3/10)
					end
				AddHonor( varMap, varPlayer, honor )
				local varStr1=format("#o弱国额外获得#R荣誉%d点#o的奖励",honor)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end				
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		AddExp( varMap, varPlayer, floor(varLevel*70*varCount) )
		varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*70*varCount))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				local exp = floor(varLevel*70*varCount*x300658_RuoGuoMulti(varMap, varPlayer))
					if exp >= floor(varLevel*70*maxcount) - floor(varLevel*70*varCount) then
						exp = floor(varLevel*70*maxcount) - floor(varLevel*70*varCount)
					end
				AddExp( varMap, varPlayer, exp )
				local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end			
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local awardMoney = floor(100*varCount*0.5) * x300658_var_Multiple
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardMoney = awardMoney + x300658_var_Empireextra*10  
				end			
		--AddMoney( varMap, varPlayer,3, floor(awardMoney/10) )
		--更现金奖励
		AddGold(varMap, varPlayer, floor(awardMoney/10) )	
		varStr = format( "获得#R现金#{_MONEY%d}#o的奖励", floor(awardMoney/10))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardMoney = awardMoney - x300658_var_Empireextra*10 
				end
				local money = floor(awardMoney/10 * x300658_RuoGuoMulti(varMap, varPlayer))
					if money >= floor(100*maxcount*0.5 * x300658_var_Multiple/10) - floor(awardMoney/10) then
					 money = floor(100*maxcount*0.5 * x300658_var_Multiple/10) - floor(awardMoney/10)
					end
				--AddMoney( varMap, varPlayer,3, money)
				--更现金奖励
				AddGold(varMap, varPlayer, money )	
				varStr1 = format( "弱国额外获得#R现金#{_MONEY%d}#o的奖励", money)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end		
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, varStr,4,2)
		
		local varShengWang = GetShengWang( varMap, varPlayer )
		local nShengWang1 = floor(3*varCount)
		varShengWang = varShengWang + nShengWang1
		SetShengWang( varMap, varPlayer, varShengWang )
		varStr=format("#o获得#R声望%d点#o的奖励",nShengWang1)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
				if  x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
					local varShengWang = GetShengWang( varMap, varPlayer )
					local nShengWang2 = floor(3*varCount*x300658_RuoGuoMulti(varMap, varPlayer))
						if nShengWang2 >= floor(3*maxcount) - floor(3*varCount) then
							nShengWang2 = floor(3*maxcount) - floor(3*varCount)
						end
					varShengWang = varShengWang + nShengWang2
					SetShengWang( varMap, varPlayer, varShengWang )
					varStr1 = format("弱国额外获得#R声望%d#o的奖励", nShengWang2)
					TalkAppendString(varMap, varStr1);
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end		
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, varStr,4,2)
		SetPlayerGameData(varMap, varPlayer, MD_SHOUHU_DATE[1], MD_SHOUHU_DATE[2], MD_SHOUHU_DATE[3], GetDayOfYear())
		
			GamePlayScriptLog( varMap, varPlayer, 1441)
			
	elseif IsInCountrySpecialGuild(varMap, varPlayer,0) > 0 then 
		local varLevel = GetLevel(varMap, varPlayer)
		AddHonor( varMap, varPlayer, floor(varCount*3/10/4) )
		local varStr=format("#o获得#R荣誉%d点#o的奖励", floor(varCount*3/10/4))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				local honor = floor(varCount*3/10/4*x300658_RuoGuoMulti(varMap, varPlayer)) 
					if honor >= floor(maxcount*3/10/4) - floor(varCount*3/10/4) then
						honor = floor(maxcount*3/10/4) - floor(varCount*3/10/4)
					end
				AddHonor( varMap, varPlayer, honor )
				local varStr1=format("#o弱国额外获得#R荣誉%d点#o的奖励", honor)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end			
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		AddExp( varMap, varPlayer, floor(varLevel*70*varCount/4) )
		varStr=format("#o获得#R经验%d点#o的奖励", floor(varLevel*70*varCount/4))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				local exp = floor(varLevel*70*varCount/4*x300658_RuoGuoMulti(varMap, varPlayer))
					if exp >= floor(varLevel*70*maxcount/4) - floor(varLevel*70*varCount/4) then
						exp = floor(varLevel*70*maxcount/4) - floor(varLevel*70*varCount/4)
					end
				AddExp( varMap, varPlayer, exp)
				local varStr1=format("#o弱国额外获得#R经验%d点#o的奖励", exp)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end			
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)

		local varShengWang = GetShengWang( varMap, varPlayer )
		local nShengWang1 = floor(varCount*3/4)
		varShengWang = varShengWang + nShengWang1
		SetShengWang( varMap, varPlayer, varShengWang )
		varStr=format("#o获得#R声望%d点#o的奖励",nShengWang1)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
				if  x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
					local varShengWang = GetShengWang( varMap, varPlayer )
					local nShengWang2 = floor(varCount*3/4*x300658_RuoGuoMulti(varMap, varPlayer))
						if nShengWang2 >=  floor(maxcount*3/4) -  floor(varCount*3/4) then
							nShengWang2 = floor(maxcount*3/4) -  floor(varCount*3/4)
						end
					varShengWang = varShengWang + nShengWang2
					SetShengWang( varMap, varPlayer, varShengWang )
					varStr1 = format("弱国额外获得#R声望%d#o的奖励", nShengWang2)
					TalkAppendString(varMap, varStr1);
					Msg2Player(varMap,varPlayer,varStr1,4,2)
				end				
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,4,2)
		SetPlayerGameData(varMap, varPlayer, MD_SHOUHU_DATE[1], MD_SHOUHU_DATE[2], MD_SHOUHU_DATE[3], GetDayOfYear())

		local awardMoney = floor(100*varCount*0.5/4) * x300658_var_Multiple
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardMoney = awardMoney + x300658_var_Empireextra*10 
				end			
		--AddMoney( varMap, varPlayer,3, floor(awardMoney/10) )
		--更现金奖励
		AddGold(varMap, varPlayer, floor(awardMoney/10) )	
		varStr = format( "获得#R现金#{_MONEY%d}#o的奖励", floor(awardMoney/10))
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
			if  x300658_RuoGuoMulti(varMap, varPlayer) > 0 then
				if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
					awardMoney = awardMoney - x300658_var_Empireextra*10 
				end				
				local money =  floor(awardMoney/10 * x300658_RuoGuoMulti(varMap, varPlayer))
					if money >= floor(100*maxcount*0.5/4 * x300658_var_Multiple/10) - floor(awardMoney/10) then
						money = floor(100*maxcount*0.5/4 * x300658_var_Multiple/10) - floor(awardMoney/10)
					end
				--AddMoney( varMap, varPlayer,3, money)
				--更现金奖励
				AddGold(varMap, varPlayer, money )	
				varStr1 = format( "弱国额外获得#R现金#{_MONEY%d}#o的奖励", money)
				TalkAppendString(varMap, varStr1);
				Msg2Player(varMap,varPlayer,varStr1,4,2)
			end			
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, varStr,4,2)
		
		
			GamePlayScriptLog( varMap, varPlayer, 1441)
	end
		
end
function x300658_RuoGuoMulti(varMap, varPlayer)
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
				if x300658_IsMinGuo(varMap, varPlayer) == 1 then
					local multi = allscore*0.25/selfscore	
					return multi      
				end
			end
		end
		return 0
end
function x300658_IsMinGuo(varMap, varPlayer)
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

function x300658_GetMaxChuGuo(varMap, varPlayer)
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
