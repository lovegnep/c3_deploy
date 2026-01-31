 x300638_var_FileId = 300638
x300638_LevelLess		=	60
x300638_NeedExploit		= 28
x300638_var_DayLimited	=	1
x300638_var_GameId		=	1034
x300638_var_QuestName = "【国家】领取帮会津贴"
x300638_var_TalkContent1 = "\t帮会津贴，是每一个为帮会作出贡献的帮众都可以领取的奖励。\n\t参与#G完成护送神兽#W的次数，#G帮会战的战果#W，将直接影响每周帮会津贴的多少。\n\t等级不低于#G60#W，每周功勋值不低于#G28点#W的玩家，每#G周日#W可以在我这里领取一周的帮会津贴。\n\t确定要领取帮会津贴吗？#r"
x300638_var_TalkContent2 = "\t帮会津贴，是每一个为帮会作出贡献的帮众都可以领取的奖励。\n\t参与#G护送神兽#W的次数，将直接影响每周帮会津贴的多少。\n\t等级不低于#G60#W，每周功勋值不低于#G28点#W的玩家，每#G周日#W可以在我这里领取一周的帮会津贴。\n\t确定要领取帮会津贴吗？#r"
x300638_var_Multiple = 2*20  -- 金奖励倍率
x300638_var_Multiple_nSilver = 2  -- 银奖励倍率

-- 参加跨服帮会战的津贴基数
x300638_var_GoldBase = 3*1000		-- 金
x300638_var_SilverBase = 15*1000	-- 银

--Gameopen
x300638_var_GameOpen = 1096



function x300638_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x300638_var_GameId)<=0 then
		return
	end
	
	TalkAppendButton(varMap, x300638_var_FileId, x300638_var_QuestName,3)
			
end

function x300638_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
	if GetGameOpenById(x300638_var_GameId)<=0 then
		return
	end

	StartTalkTask(varMap)
	
	local nGold = 2*1000
	local nSilver = 10*1000
	
	local varCount1 = 0
	local varCount2 = 0
	local varCount3 = 0
	local varCount = 0
	if GetGameOpenById( x300638_var_GameOpen ) <= 0 then
		varCount1 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_WIN_COUNT[1], MD_GUILD_BHZ_WIN_COUNT[2], MD_GUILD_BHZ_WIN_COUNT[3])
		varCount2 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_LOSE_COUNT[1], MD_GUILD_BHZ_LOSE_COUNT[2], MD_GUILD_BHZ_LOSE_COUNT[3])
		varCount3 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_PING_COUNT[1], MD_GUILD_BHZ_PING_COUNT[2], MD_GUILD_BHZ_PING_COUNT[3])
		
		if x300638_IsNewPeroid(varMap, varPlayer,MD_GUILD_BHZ_DATE)>0 then
			varCount1 = 0
			varCount2 = 0
			varCount3 = 0
		end
		
		nGold = nGold + varCount1*4*1000+(varCount2+varCount3)*2*1000
		nSilver = nSilver + varCount1*20*1000+ (varCount2+varCount3)*10*1000
	else
		-- 跨服帮战参加次数
		varCount = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_JOINCOUNT_THISWEEK[1], MD_MGUILD_JOINCOUNT_THISWEEK[2], MD_MGUILD_JOINCOUNT_THISWEEK[3])
	
		-- 是否一周内
		if x300638_IsNewPeroid(varMap, varPlayer, MD_MGUILD_FIRSTJOINDAY_THISWEEK)>0 then
			varCount = 0
		end
		
		-- 根据参加次数给奖励
		nGold = nGold + varCount * x300638_var_GoldBase
		nSilver = nSilver + varCount * x300638_var_SilverBase
	end
		
	

	

	-- 神兽护送
	local varCount4 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_WEEK_COUNT[1], MD_GUILD_YB_WEEK_COUNT[2], MD_GUILD_YB_WEEK_COUNT[3])

	if x300638_IsNewPeroid(varMap, varPlayer,MD_GUILD_YB_DATE)>0 then
		varCount4 = 0
	end
	local nExploit = GetExploit(varMap,varPlayer)
	local award1 = "您现在拥有#G"..nExploit.."点#W功勋值";
	local award2_1 = 0
	local award2_2 = 0
	award2_1 = "您本周参加了#G"..(varCount1+varCount2+varCount3).."次#W帮会战";
	award2_2 = "您本周参加了#G"..(varCount).."次#W跨服帮会战";
	local award3 = "您本周顺利护送了#G"..varCount4.."次#W神兽";
	
	local nguildYB1 = 0
	local nguildYB2 = 0
	if GetGameOpenById( x300638_var_GameOpen ) <= 0 then
		nguildYB1 = 0
		nguildYB2 = 0
	else
		nguildYB1 = 300
		nguildYB2 = 1500
	end 
	nGold = (nGold + varCount4*(1*1000+nguildYB1)) * x300638_var_Multiple
	nSilver = (nSilver + varCount4*(5*1000+nguildYB2)) * x300638_var_Multiple_nSilver
	local ding=0
	local liang=0
	local wen=0
	ding = floor( nGold / (1000*1000) )
	liang = floor( mod(nGold,1000*1000)/ 1000 )
	wen = mod(nGold,1000)
	local award4 = format("您将获得#R%d锭%d两%d文#W金卡奖励", ding,liang,wen);
	ding = floor( nSilver / (1000*1000) )
	liang = floor( mod(nSilver,1000*1000)/ 1000 )
	wen = mod(nSilver,1000)
	local award5 = format("您将获得#R%d锭%d两%d文#W银卡奖励", ding,liang,wen);
	TalkAppendString(varMap,"#Y"..x300638_var_QuestName)
	local blank=" #r";
	
	if GetGameOpenById( x300638_var_GameOpen ) <= 0 then  
		TalkAppendString(varMap,x300638_var_TalkContent1..blank..award1..blank..award2_1..blank..award3..blank..award4..blank..award5)
	else   
		TalkAppendString(varMap,x300638_var_TalkContent2..blank..award1..blank..award3..blank..award4..blank..award5)
	end
  	
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300638_var_FileId, -1);
	if  nExploit < 28 then
		local Readme_1 = "您将获得#R0锭0两0文#W金卡奖励"
		local Readme_2 = "您将获得#R0锭0两0文#W银卡奖励"
		StartTalkTask(varMap)
		if GetGameOpenById( x300638_var_GameOpen ) <= 0 then
			TalkAppendString(varMap,x300638_var_TalkContent1..blank..award1..blank..award2_1..blank..award3..blank..Readme_1..blank..Readme_2)
		else
			TalkAppendString(varMap,x300638_var_TalkContent2..blank..award1..blank..award3..blank..Readme_1..blank..Readme_2)
		end
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300638_var_FileId, -1);
	end
	
end




function x300638_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	if GetGameOpenById(x300638_var_GameId)<=0 then
		return
	end
	if GetGuildID(varMap, varPlayer)<0 then
		x300638_ShowTips(varMap, varPlayer, "很抱歉，您还没有加入帮会，不能领取。")
		return 0;
	end

	if GetLevel(varMap, varPlayer) < x300638_LevelLess then
		x300638_ShowTips(varMap, varPlayer, format("很抱歉，等级未达到%d级，不能领取。",x300638_LevelLess))
		return 0;
	end

	if GetWeek() ~=0 then
		x300638_ShowTips(varMap, varPlayer, "很抱歉，只能在周日领取。")
		return 0;
	end

	if GetExploit(varMap,varPlayer) < x300638_NeedExploit then
		x300638_ShowTips(varMap, varPlayer, format("很抱歉，您的功勋值不足%d，不能领取。",x300638_NeedExploit))
		return 0;
	end

	if x300638_GetDayCount(varMap, varPlayer)>=x300638_var_DayLimited then
		x300638_ShowTips(varMap, varPlayer,"很抱歉，您本周已领取过帮会津贴了，请下周日再来")
		return 0;
	end

    return 1
end




function x300638_ProcAccept( varMap, varPlayer )
	if GetGameOpenById(x300638_var_GameId)<=0 then
		return
	end

	x300638_ProcGiveReward( varMap, varPlayer)
	
end

function x300638_ProcGiveReward( varMap, varPlayer)
	
	local nGold = 2*1000
	local nSilver = 10*1000
	local varCount1 = 0
	local varCount2 = 0
	local varCount3 = 0
	local varCount = 0
	
	if GetGameOpenById( x300638_var_GameOpen ) <= 0 then
		varCount1 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_WIN_COUNT[1], MD_GUILD_BHZ_WIN_COUNT[2], MD_GUILD_BHZ_WIN_COUNT[3])
		varCount2 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_LOSE_COUNT[1], MD_GUILD_BHZ_LOSE_COUNT[2], MD_GUILD_BHZ_LOSE_COUNT[3])
		varCount3 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_PING_COUNT[1], MD_GUILD_BHZ_PING_COUNT[2], MD_GUILD_BHZ_PING_COUNT[3])
		
		if x300638_IsNewPeroid(varMap, varPlayer,MD_GUILD_BHZ_DATE)>0 then
			varCount1 = 0
			varCount2 = 0
			varCount3 = 0
		end
		
		nGold = nGold + varCount1*4*1000+(varCount2+varCount3)*2*1000
		nSilver = nSilver + varCount1*20*1000+ (varCount2+varCount3)*10*1000
		
	else
		-- 跨服帮战参加次数
		varCount = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_JOINCOUNT_THISWEEK[1], MD_MGUILD_JOINCOUNT_THISWEEK[2], MD_MGUILD_JOINCOUNT_THISWEEK[3])
	
		-- 是否一周内
		if x300638_IsNewPeroid(varMap, varPlayer, MD_MGUILD_FIRSTJOINDAY_THISWEEK)>0 then
			varCount = 0
		end
		
		-- 根据参加次数给奖励
		nGold = nGold + varCount * x300638_var_GoldBase
		nSilver = nSilver + varCount * x300638_var_SilverBase
	end

	-- 神兽护送次数
	local varCount4 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_WEEK_COUNT[1], MD_GUILD_YB_WEEK_COUNT[2], MD_GUILD_YB_WEEK_COUNT[3])
	
	if x300638_IsNewPeroid(varMap, varPlayer,MD_GUILD_YB_DATE)>0 then
		
		varCount4 = 0
	end
	
	local nguildYB1 = 0
	local nguildYB2 = 0
	if GetGameOpenById( x300638_var_GameOpen ) <= 0 then
		nguildYB1 = 0
		nguildYB2 = 0
	else
		nguildYB1 = 300
		nguildYB2 = 1500
	end 
	nGold = (nGold + varCount4*(1*1000+nguildYB1)) * x300638_var_Multiple
	nSilver = (nSilver + varCount4*(5*1000+nguildYB2)) * x300638_var_Multiple_nSilver

	AddMoney(varMap, varPlayer, 3, nGold)
	AddMoney(varMap, varPlayer, 1, nSilver)

	x300638_ShowTips(varMap, varPlayer,format("获得%d两金卡",nGold/1000))
	x300638_ShowTips(varMap, varPlayer,format("获得%d两银卡",nSilver/1000))

	x300638_SetDayCount(varMap, varPlayer)

	
	GamePlayScriptLog(varMap, varPlayer, 1351)
	
	local varStr = 0
	if GetGameOpenById( x300638_var_GameOpen ) <= 0 then
		varStr = format("x300638_ProcGiveReward guid = %X, varName=%s, nGold= %d, nSilver=%d, varCount1 = %d, varCount2 = %d, varCount3 = %d varCount4 =%d",GetPlayerGUID( varMap,varPlayer ),GetName(varMap, varPlayer),nGold,nSilver,varCount1,varCount2,varCount3,varCount4)
	else
		varStr = format("x300638_ProcGiveReward guid = %X, varName=%s, nGold= %d, nSilver=%d, varCount = %d, varCount4 =%d", GetPlayerGUID( varMap,varPlayer ),GetName(varMap, varPlayer),nGold,nSilver,varCount, varCount4)
	end
	WriteLog(1, varStr)
	
end



function x300638_SaveGuildWeekResult(varMap,guildId, nValue)



	if GetGameOpenById(x300638_var_GameId)<=0 then
		return
	end
	if nValue ~=0 and nValue ~=1 and nValue ~=2 then
		return
	end

	local varMapType = GetSceneType(varMap) ;
	if varMapType~=2 then
		local varStr = format("x300638_SaveGuildWeekResult not Banghuizhan Scene= %d",varMap)
		WriteLog(1, varStr)
		return
	end

	local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varPlayer = GetScenePlayerObjId( varMap,varI)
        if varPlayer >= 0 then
            local nGuildId = GetGuildID( varMap,varPlayer )
            if nGuildId == guildId then
				
				local varCount1 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_WIN_COUNT[1], MD_GUILD_BHZ_WIN_COUNT[2], MD_GUILD_BHZ_WIN_COUNT[3])
				local varCount2 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_LOSE_COUNT[1], MD_GUILD_BHZ_LOSE_COUNT[2], MD_GUILD_BHZ_LOSE_COUNT[3])
				local varCount3 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_PING_COUNT[1], MD_GUILD_BHZ_PING_COUNT[2], MD_GUILD_BHZ_PING_COUNT[3])
				if x300638_IsNewPeroid(varMap, varPlayer,MD_GUILD_BHZ_DATE)>0 then
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_DATE[1], MD_GUILD_BHZ_DATE[2], MD_GUILD_BHZ_DATE[3], GetDayOfYear())
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_WIN_COUNT[1], MD_GUILD_BHZ_WIN_COUNT[2], MD_GUILD_BHZ_WIN_COUNT[3], 0)
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_LOSE_COUNT[1], MD_GUILD_BHZ_LOSE_COUNT[2], MD_GUILD_BHZ_LOSE_COUNT[3], 0)
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_PING_COUNT[1], MD_GUILD_BHZ_PING_COUNT[2], MD_GUILD_BHZ_PING_COUNT[3], 0)
					varCount1 = 0
					varCount2 = 0
					varCount3 = 0
				end
				
				if nValue==2 then
					varCount1 = varCount1 + 1
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_WIN_COUNT[1], MD_GUILD_BHZ_WIN_COUNT[2], MD_GUILD_BHZ_WIN_COUNT[3], varCount1)
				elseif nValue==1 then
					varCount2 = varCount2 + 1
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_LOSE_COUNT[1], MD_GUILD_BHZ_LOSE_COUNT[2], MD_GUILD_BHZ_LOSE_COUNT[3], varCount2)
				elseif nValue==0 then
					varCount3 = varCount3 + 1
					SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_PING_COUNT[1], MD_GUILD_BHZ_PING_COUNT[2], MD_GUILD_BHZ_PING_COUNT[3], varCount3)
				end
            end
        end
    end

end

function x300638_SaveGuildYunBiaoMD(varMap, varPlayer)
	if GetGameOpenById(x300638_var_GameId)<=0 then
		return
	end
	
	local varCount1 = GetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_WEEK_COUNT[1], MD_GUILD_YB_WEEK_COUNT[2], MD_GUILD_YB_WEEK_COUNT[3])
	
	if x300638_IsNewPeroid(varMap, varPlayer,MD_GUILD_YB_DATE)>0 then
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_DATE[1], MD_GUILD_YB_DATE[2], MD_GUILD_YB_DATE[3], GetDayOfYear())
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_WEEK_COUNT[1], MD_GUILD_YB_WEEK_COUNT[2], MD_GUILD_YB_WEEK_COUNT[3], 0)
		varCount1 = 0
	end
	
	varCount1 = varCount1 + 1
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_WEEK_COUNT[1], MD_GUILD_YB_WEEK_COUNT[2], MD_GUILD_YB_WEEK_COUNT[3], varCount1)
	
end







function x300638_IsNewPeroid(varMap, varPlayer, md_date)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, md_date[1], md_date[2],md_date[3] );
	
	if varToday == 500 then varToday = 0 end
	if varLastday == 500 then varLastday = 0 end
	if varLastday > varToday then
		varToday = varToday + 365
	end
	
	if varToday>=varLastday then
		local nWeek = GetWeek()
		if nWeek==0 then
			nWeek =7
		end
		if (varToday-varLastday)>=nWeek then  
			return 1
		end
	else
		return 1
	end

	return 0


end


function x300638_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end




function x300638_GetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DATE[1], MD_GUILD_JINTIE_DATE[2],MD_GUILD_JINTIE_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DAYCOUNT[1], MD_GUILD_JINTIE_DAYCOUNT[2],MD_GUILD_JINTIE_DAYCOUNT[3] );
	return varDaycount;
end




function x300638_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DATE[1], MD_GUILD_JINTIE_DATE[2], MD_GUILD_JINTIE_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DATE[1], MD_GUILD_JINTIE_DATE[2], MD_GUILD_JINTIE_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DAYCOUNT[1], MD_GUILD_JINTIE_DAYCOUNT[2], MD_GUILD_JINTIE_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DAYCOUNT[1], MD_GUILD_JINTIE_DAYCOUNT[2], MD_GUILD_JINTIE_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_JINTIE_DAYCOUNT[1], MD_GUILD_JINTIE_DAYCOUNT[2], MD_GUILD_JINTIE_DAYCOUNT[3], varDaycount+1)
	end

	SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_DATE[1], MD_GUILD_BHZ_DATE[2], MD_GUILD_BHZ_DATE[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_WIN_COUNT[1], MD_GUILD_BHZ_WIN_COUNT[2], MD_GUILD_BHZ_WIN_COUNT[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_LOSE_COUNT[1], MD_GUILD_BHZ_LOSE_COUNT[2], MD_GUILD_BHZ_LOSE_COUNT[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_BHZ_PING_COUNT[1], MD_GUILD_BHZ_PING_COUNT[2], MD_GUILD_BHZ_PING_COUNT[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_DATE[1], MD_GUILD_YB_DATE[2], MD_GUILD_YB_DATE[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_YB_WEEK_COUNT[1], MD_GUILD_YB_WEEK_COUNT[2], MD_GUILD_YB_WEEK_COUNT[3], 0)
	
	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_JOINCOUNT_THISWEEK[1], MD_MGUILD_JOINCOUNT_THISWEEK[2], MD_MGUILD_JOINCOUNT_THISWEEK[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_FIRSTJOINDAY_THISWEEK[1], MD_MGUILD_FIRSTJOINDAY_THISWEEK[2], MD_MGUILD_FIRSTJOINDAY_THISWEEK[3], 0)
end
