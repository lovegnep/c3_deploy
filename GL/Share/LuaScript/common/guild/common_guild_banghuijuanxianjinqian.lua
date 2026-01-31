
x300634_var_FileId = 300634

x300634_var_QuestName = "【帮会】帮会募集"

x300634_var_RefreshName1 = "刷新帮会募集#R（现金500文）"
x300634_var_RefreshName2 = "相关说明"
x300634_var_RefreshName3 = "确定募集"

x300634_var_RefreshDepiction = "#Y【刷新帮会募集说明】#W\n\n\n\t使用刷新帮会募集功能可以刷新不同星级的帮会募集，星级越高的帮会募集获得的奖励越高。帮会募集最高四星。\n#Y注意事项#W：\n\t使用刷新帮会募集功能消耗500文现金。"    

x300634_var_CollectRefreshButton_Index = 2000    --帮会募集刷新按钮Index
x300634_var_DepictionRefreshButton_Index = 3000  --查看帮会募集刷新说明按钮Index
x300634_var_OKButton_Index = 4000                --确定募集按钮Index
x300634_var_DepictionReturnButton_Index = 5000   --帮会募集刷新说明界面返回按钮Index

--所有帮会募集方式。GuildExp(帮会经验)、GuildMoney（帮会金钱）、MyExp（玩家经验增加系数）、MyGuildPoint（帮贡）、NyGuildShiMing（使命点）、
--OpenRate（第一次打开几率,总共合计100）、RefreshRate（刷新功能几率,总共合计100）
x300634_var_AllCollects = {
	{level = "#K一星#Y", GuildExp = 2, GuildMoney = 20000, MyExp = 1, MyGuildPoint = 100, NyGuildShiMing=1, OpenRate=70, RefreshRate = 0},
	{level = "#G二星#Y", GuildExp = 3, GuildMoney = 20000, MyExp = 1.2, MyGuildPoint = 100, NyGuildShiMing=1, OpenRate=25, RefreshRate = 50},
	{level = "#B三星#Y", GuildExp = 5, GuildMoney = 20000, MyExp = 1.5, MyGuildPoint = 120, NyGuildShiMing=1, OpenRate=5, RefreshRate = 35},
	{level = "#R四星#Y", GuildExp = 8, GuildMoney = 20000, MyExp = 2, MyGuildPoint = 150, NyGuildShiMing=1, OpenRate=0, RefreshRate = 15},
}

--所有参加活动玩家
--x300634_var_AllPlayer = {}


--DECLARE_QUEST_INFO_STOP--

--function x300634_InitPlayer()
	--local player = {}
	--player.count = 0  --玩家当天打开募集窗口次数
	--player.index = -1 --帮会募集方式索引
	--player.date = GetDayTime() --玩家最近一次打开帮会募集界面日期
	--return player
--end

function x300634_GetDepiction( varMap, varPlayer, varIndex )     --获取帮会募集奖励描述
  local localexp = x300634_GetEncourageExp( varMap, varPlayer, varIndex )
  local guildMoney = x300634_var_AllCollects[varIndex].GuildMoney/1000
    
	local Readme_1 = "#Y【帮会】帮会募集（" .. x300634_var_AllCollects[varIndex].level .. "）#W"
	
	local Readme_2 = "\t#r#Y\t当前为"..x300634_var_AllCollects[varIndex].level.."帮会募集（最高为四星）"
	
	local Readme_3 = "\n     \n"

	local Readme_4 = "\t您可以通过捐助一个".."#G募集券".."#W".."来提升".."#G"..x300634_var_AllCollects[varIndex].GuildExp.."点帮会经验，"..guildMoney.."两帮会金钱".."#W同时您也将会获得".."#G"..localexp.."点经验#W，#G"..x300634_var_AllCollects[varIndex].MyGuildPoint.."帮贡#W，#G"..x300634_var_AllCollects[varIndex].NyGuildShiMing.."点使命点#W。当帮主发布#G募集令#W时2小时内捐助募集券可获得翻倍奖励！"

	local Readme_5 = "#r#Y您是否要参与帮会募集?"
	
	
	
	local varReadme = Readme_1 .. Readme_2 .. Readme_3 .. Readme_4 .. Readme_5
	return varReadme
end

function x300634_GetEncourageExp( varMap, varPlayer, varIndex ) --获取帮会募集个人经验的奖励
	local varLevel = GetLevel( varMap, varPlayer )
	local localexp = 0
	if  varLevel < 70 then
		localexp = varLevel * 20000 * x300634_var_AllCollects[varIndex].MyExp
	elseif varLevel >= 70 and varLevel < 80 then
		localexp = varLevel * 36000 * x300634_var_AllCollects[varIndex].MyExp
	elseif varLevel >= 80 and varLevel < 90 then
		localexp = varLevel * 36000*2 * x300634_var_AllCollects[varIndex].MyExp
	elseif varLevel >= 90 and varLevel < 200 then
		localexp = varLevel * 36000*2.6 * x300634_var_AllCollects[varIndex].MyExp
	end
	return localexp
end

function x300634_ProcEventEntry( varMap, varPlayer, varTalknpc , varIDEvent, varButtonIndex)
  --local snid = GetGUID(varMap, varPlayer)
  
	if GetGuildOfficial(varMap, varPlayer) == -1 then
	    return
	end
	
	if 1000 == varButtonIndex then  --帮会募集Button触发
	    local day_cur = GetDayOfYear()
	    local isOpen = GetPlayerGameData(varMap, varPlayer, MD_Guild_ISFIRSE_OPEN[1], MD_Guild_ISFIRSE_OPEN[2], MD_Guild_ISFIRSE_OPEN[3])
	    local openDay = GetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_OPENDAY[1], MD_Guild_AWARD_OPENDAY[2], MD_Guild_AWARD_OPENDAY[3])
	    --if not x300634_var_AllPlayer[snid] then
	    --   x300634_var_AllPlayer[snid] = x300634_InitPlayer()
	    --end
	    --Msg2Player(varMap, varPlayer, "day_cur:"..day_cur..", isOpen:"..isOpen..", openDay:"..openDay, 8, 2)	
	    
	    if openDay ~= day_cur or 0 == isOpen then --玩家当天还没打开过募集界面
	        --x300634_var_AllPlayer[snid].date = day_cur
	        --x300634_var_AllPlayer[snid].count = 0
	        SetPlayerGameData(varMap, varPlayer, MD_Guild_ISFIRSE_OPEN[1], MD_Guild_ISFIRSE_OPEN[2], MD_Guild_ISFIRSE_OPEN[3], 1)
	        SetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_OPENDAY[1], MD_Guild_AWARD_OPENDAY[2], MD_Guild_AWARD_OPENDAY[3], day_cur)
	        
	        local curRate = random(1, 100)
			    local curIndex = 1
			    local collectsNum = getn(x300634_var_AllCollects)
			    local sunRate = x300634_var_AllCollects[curIndex].OpenRate
			    while curRate > sunRate and curIndex <= collectsNum do
			        curIndex = curIndex + 1
			        sunRate = sunRate + x300634_var_AllCollects[curIndex].OpenRate
			    end
			    SetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3], curIndex)
	    end
	    
	    local awardIndex = GetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3])
		
		  --x300634_var_AllPlayer[snid].count = x300634_var_AllPlayer[snid].count + 1
		  --Msg2Player(varMap, varPlayer, "index......"..x300634_var_AllPlayer[snid].index, 8, 2)	
		
		  local varReadme = x300634_GetDepiction( varMap, varPlayer, awardIndex )
				
		  StartTalkTask(varMap)
		  TalkAppendString(varMap, varReadme)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName1, 3, x300634_var_CollectRefreshButton_Index)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName3, 3, x300634_var_OKButton_Index)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName2, 1, x300634_var_DepictionRefreshButton_Index)
		  StopTalkTask(varMap)
		  DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
	elseif varButtonIndex == x300634_var_CollectRefreshButton_Index   then             --帮会募集刷新Button触发
	
		  local day_human
	    local count_human
	    local day_cur = GetDayTime()
	    
	    --判断是否已经募集过
	    day_human,count_human = GuildGetCashBuildTimes(varMap, varPlayer)
	    if day_cur == day_human and count_human > 0 then
		      StartTalkTask(varMap);
		      TalkAppendString(varMap, "很抱歉，你今天已经进行过帮会募集。")
		      StopTalkTask(varMap)
		      DeliverTalkTips(varMap,varPlayer)
		      Msg2Player(varMap,varPlayer,"很抱歉，您每天只能进行1次帮会募集，请明日再来！", 8, 2)			
		      return
	    end
	
	    local awardIndex = GetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3])
	    if 4 == awardIndex then
	        Msg2Player(varMap, varPlayer, "已经是最高星级。", 8, 2)
	        return
	    end
	    
      if GetMoney(varMap, varPlayer, 2) < 500 then            ---判断金卡数量。2是CU_GOLD  3是CU_BINDGOLD
			    StartTalkTask(varMap)
			    TalkAppendString(varMap, "现金不足500文，刷新帮会募集失败。")
			    StopTalkTask(varMap)
			    DeliverTalkTips(varMap, varPlayer)
			    Msg2Player(varMap, varPlayer, "很抱歉，您的现金数不足，刷新帮会募集失败！", 8, 2)		
			    return
      end
        
      --local costMode = GetGoldMode(varMap, varPlayer)   --获取优先结算方式
			if CostMoney(varMap, varPlayer, 2, 500) ~= 1 then
			    return
			end
        
      local curRate = random(1, 100)
		  local curIndex = 1
		  local collectsNum = getn(x300634_var_AllCollects)
		  local sunRate = x300634_var_AllCollects[curIndex].RefreshRate
		  while curRate > sunRate and curIndex <= collectsNum do
			    curIndex = curIndex + 1
			    sunRate = sunRate + x300634_var_AllCollects[curIndex].RefreshRate
		  end
		  --x300634_var_AllPlayer[snid].index = curIndex
		  --x300634_var_AllPlayer[snid].count = x300634_var_AllPlayer[snid].count + 1
		  SetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3], curIndex)
		
		  local varReadme = x300634_GetDepiction( varMap, varPlayer, curIndex )
		
		  StartTalkTask(varMap)
		  TalkAppendString(varMap, varReadme)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName1, 3, x300634_var_CollectRefreshButton_Index)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName3, 3, x300634_var_OKButton_Index)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName2, 1, x300634_var_DepictionRefreshButton_Index)
		  StopTalkTask(varMap)
		  DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		  Msg2Player(varMap, varPlayer, "完成刷新帮会募集", 8, 2)
	
	elseif varButtonIndex == x300634_var_DepictionRefreshButton_Index then        --显示帮会募集刷新说明Button触发
		  StartTalkTask(varMap)
	    TalkAppendString(varMap, x300634_var_RefreshDepiction)
	    TalkAppendButton(varMap, x300634_var_FileId, "返回", 3, x300634_var_DepictionReturnButton_Index)
	    StopTalkTask(varMap)
	    DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	    --DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300634_var_FileId, -1 )
	    
	elseif varButtonIndex == x300634_var_OKButton_Index then        --确定募集Button触发
		  if 0 == x300634_ProcAccept( varMap, varPlayer ) then
			    return
		  end
		
		  local awardIndex = GetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3])
		  StartTalkTask(varMap)
	    TalkAppendString(varMap, "您顺利进行了一次"..x300634_var_AllCollects[awardIndex].level.."帮会募集。")
	    StopTalkTask(varMap)
	    DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	    
	elseif varButtonIndex == x300634_var_DepictionReturnButton_Index then        --帮会募集刷新说明界面返回Button触发
	    local awardIndex = GetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3])
		  local varReadme = x300634_GetDepiction( varMap, varPlayer, awardIndex )
		
		  StartTalkTask(varMap)
		  TalkAppendString(varMap, varReadme)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName1, 3, x300634_var_CollectRefreshButton_Index)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName3, 3, x300634_var_OKButton_Index)
		  TalkAppendButton(varMap, x300634_var_FileId, x300634_var_RefreshName2, 1, x300634_var_DepictionRefreshButton_Index)
		  StopTalkTask(varMap)
		  DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	else
	    return
	end
end

function x300634_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end


function x300634_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end


function x300634_ProcAccept( varMap, varPlayer )
	if GetGuildOfficial(varMap, varPlayer) == -1 then
		StartTalkTask(varMap);TalkAppendString(varMap, "帮会募集失败。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您不是帮会成员，无法进行帮会募集。",8,2)
		return 0
	end
	
	if  GetItemCount( varMap, varPlayer, 11990110 ) < 1 then
		StartTalkTask(varMap);TalkAppendString(varMap, "帮会募集失败。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您包裹中没有募集券，帮会募集失败！",8,2)		
		return 0
	end
	
	if x300634_CanCashBuild(varMap,varPlayer)==0 then
		StartTalkTask(varMap);TalkAppendString(varMap, "帮会募集失败。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您每天只能进行1次帮会募集，请明日再来！",8,2)			
		return 0
	end
		
	if DelItem( varMap, varPlayer, 11990110, 1) ~= 1 then 
		return 0 
	end
	
	Msg2Player(varMap,varPlayer,"【帮会】帮会募集:扣除一个募集券",8,2)
	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_MULTI_MISSION_MUJI, x300634_var_FileId,-1,"ProcReturn1",-1)
    
    local varId = GetGuildID( varMap, varPlayer)
    if varId ~= -1 then
        AddGuildActivity( varMap, varPlayer, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM4) )
    end
    return 1
end

function x300634_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)
	local curTime = GetCurrentTime()
	local isMultiple = 0
	if curTime - QuestData < 2*60*60 then
		isMultiple = 1
	end
	x300634_GetBonus( varMap,varPlayer, isMultiple )
end

function x300634_GetBonus( varMap, varPlayer, isMultiple )
  local snid = GetGUID(varMap, varPlayer)
  local localIndex = GetPlayerGameData(varMap, varPlayer, MD_Guild_AWARD_INDEX[1], MD_Guild_AWARD_INDEX[2], MD_Guild_AWARD_INDEX[3])
	local localexp = x300634_GetEncourageExp( varMap, varPlayer, localIndex )  --获取个人奖励经验
	
	AddExp ( varMap , varPlayer , localexp )			
	AddGuildExp(varMap, varPlayer, x300634_var_AllCollects[localIndex].GuildExp)			
	AddGuildUserPoint(varMap, varPlayer, x300634_var_AllCollects[localIndex].MyGuildPoint )		
	AddGuildShiMing(varMap, varPlayer, x300634_var_AllCollects[localIndex].NyGuildShiMing ) 
	AddGuildMoney (varMap, varPlayer, x300634_var_AllCollects[localIndex].GuildMoney ) 
	
	local guildMoney = x300634_var_AllCollects[localIndex].GuildMoney/1000
	
	Msg2Player(varMap,varPlayer,"【帮会】帮会募集:获得#R经验"..localexp.."点#o的奖励",8,2)
	Msg2Player(varMap,varPlayer,"【帮会】帮会募集:获得#R帮贡"..x300634_var_AllCollects[localIndex].MyGuildPoint.."点#o的奖励",8,2)
	Msg2Player(varMap,varPlayer,"获得#R经验"..localexp.."点#o的奖励",8,3)
	Msg2Player(varMap,varPlayer,"获得#R帮贡"..x300634_var_AllCollects[localIndex].MyGuildPoint.."点#o的奖励",8,3)				
	Msg2Player( varMap, varPlayer, (GetName(varMap, varPlayer)).."慷慨捐助了一个募集券，使帮会经验提高了"..x300634_var_AllCollects[localIndex].GuildExp.."点，帮会使命点提高了"..x300634_var_AllCollects[localIndex].NyGuildShiMing.."点，帮会金钱增加"..guildMoney.."两。", 6 )		
	
	--【个人】帮会除魔的贡献完成记次
	if IsHaveQuestNM( varMap, varPlayer, 1404 ) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, 1404)                                                  
		local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)       
		SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, QuestNum + 1)
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 3) >= 3 then
			SetQuestByIndex(varMap,varPlayer,varQuestIdx, 7, 1)     
			SetQuestByIndex(varMap,varPlayer,varQuestIdx, 0, 1)	        	   
		end 
		LuaCallNoclosure( 330053, "ProcQuestLogRefresh", varMap, varPlayer)  	
	end				
			
	if isMultiple == 1 then     ---发布募集令两小时内完成捐助
		local varLevel = GetLevel ( varMap , varPlayer )
		local pos = GetGuildOfficial(varMap, varPlayer)
		local localexp1 = localexp*3   ----帮主经验翻倍奖励
		local varExp = localexp*2      ------副帮主经验翻倍奖励
		local varExp1 = localexp*1     ------普通成员经验翻倍奖励
		
		local guildPoint1 = x300634_var_AllCollects[localIndex].MyGuildPoint * 3  ----帮主额外奖励帮贡
		local guildPoint2 = x300634_var_AllCollects[localIndex].MyGuildPoint * 2  ----副帮主额外奖励帮贡
		local guildPoint3 = x300634_var_AllCollects[localIndex].MyGuildPoint * 1  ----普通成员额外奖励帮贡
		local guildid =GetGuildID(varMap, varPlayer)
		
		if pos ==5 then
			if  GetGuildCacheFreeParam(guildid, GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "帮主职位只能领取一次募集令奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap, varPlayer)
				Msg2Player(varMap, varPlayer, "帮主职位只能领取一次募集令奖励", 8, 2)
				return
			end		
			
			AddExp ( varMap, varPlayer, localexp1 )
			AddGuildUserPoint(varMap, varPlayer, guildPoint1 )
			Msg2Player(varMap,varPlayer,"【帮会】帮会募集:帮会多倍额外获得#R经验"..localexp1.."点#o#r【帮会】帮会募集:帮会多倍额外获得#R帮贡"..guildPoint1.."点#o", 8, 2)
			SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
		
		elseif pos ==4 then
			if  GetGuildCacheFreeParam(guildid, GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "副帮主职位只能领取一次募集令奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"副帮主职位只能领取一次募集令奖励",8,2)
				return
			end		
			
			AddExp ( varMap , varPlayer , varExp )
			AddGuildUserPoint(varMap, varPlayer, guildPoint2 )
			Msg2Player(varMap,varPlayer,"【帮会】帮会募集:帮会多倍额外获得#R经验"..varExp.."#o点#r【帮会】帮会募集:帮会多倍额外获得#R帮贡"..guildPoint2.."点#o", 8, 2)
			SetGuildQuestData(varMap,GetGuildID(varMap, varPlayer), GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
			
		else
			AddExp ( varMap , varPlayer , varExp1 )
			AddGuildUserPoint(varMap, varPlayer, guildPoint3 )
			Msg2Player(varMap,varPlayer,"【帮会】帮会募集:帮会多倍额外获得#R经验"..varExp1.."点#o#r【帮会】帮会募集:帮会多倍额外获得#R帮贡"..guildPoint3.."点#o",8,2)
		end
	end
end

function x300634_ProcQuestAbandon( varMap, varPlayer, varQuest )

end

function x300634_ProcContinue( varMap, varPlayer, varTalknpc )

end

function x300634_CheckSubmit( varMap, varPlayer )

end

function x300634_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end

function x300634_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end

function x300634_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

end

function x300634_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

end

function x300634_CanCashBuild( varMap, varPlayer )
	local bSuc = 0
	local day_human
	local count_human
	local day_cur = GetDayTime()
	
	day_human,count_human = GuildGetCashBuildTimes(varMap, varPlayer)
	
	if day_cur ~= day_human then
		count_human = 1
		bSuc = 1
	elseif count_human < 1 then
		count_human = count_human + 1
		bSuc = 1
	else
		bSuc = 0
	end
	
	if bSuc==1 then
		GuildSetCashBuildTimes(varMap, varPlayer, day_cur, count_human )
	end
	return bSuc
end
