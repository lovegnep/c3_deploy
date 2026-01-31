

x300671_var_FileId = 300671
x300671_var_QuestName = "【帮会】帮会跑商"
x300671_var_QuestId = 7026

x300671_var_Min_Level = 20

x300671_var_SubmitParamIndex = 0
x300671_var_SubmitMoney = 10000

x300671_Item_Goods = { 13030122, 13030123, 13030124, 13030125, 13030126, 13030127 }
x300671_Item_GoodsCount = 3
x300671_Item_Money = 13030128

x300671_Max_Count = 100
x300671_var_MoneyBuff = 8353
x300671_gameopenid = 1029


function x300671_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300671_gameopenid)<=0 then
		return
	end

	
	if GetGuildID(varMap, varPlayer) ~= -1 then
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest);
		TalkAppendButton(varMap, varQuest, x300671_var_QuestName, varState, -1)
	end
end

function x300671_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		local varLevel = GetLevel(varMap,varPlayer)
		local nExp = varLevel*3000
		local GuildMoney =20
		local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
		local explevel = maxlevel - 10
	
		if nExp> 0 then
			AddQuestExpBonus(varMap, nExp )
		end
end




function x300671_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	if GetGuildID(varMap, varPlayer) == -1 then
		return
	end

		local varLevel = GetLevel(varMap,varPlayer)
		local GuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
		local nExp = varLevel*3000
		local GuildMoney =20
		local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
		local explevel = maxlevel - 10
	
		if GetGameOpenById(x300671_gameopenid)<=0 then
			return
		end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 1 then	
	 	if GetGuildID(varMap, varPlayer) == -1 then
	 		StartTalkTask(varMap)
			TalkAppendString(varMap,"你已经不在帮会中，请加入帮会后再继续本任务！")
			StopTalkTask()
			DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300671_var_FileId, varQuest,0);
			return
		end	
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 6) == 0 then	
		
			if x300671_IsQuestCompleted( varMap, varPlayer, varQuest ) == 1 then 
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y【帮会】帮会跑商")
				TalkAppendString(varMap,"\t这么快就赚回这么多？\n\t不错，帮会不会亏待于你。这是你的奖励。#r")
				TalkAppendString(varMap,"#Y奖励内容：")
					TalkAppendString(varMap,"#W经验值："..nExp)
				TalkAppendString(varMap,"#W帮会金钱：20两")
				
				
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300671_var_FileId, varQuest);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y【帮会】帮会跑商")
				TalkAppendString(varMap,"\t一个帮会的强大，不是靠个人之力，需要所有帮众的努力进取。\n\t你也应该为大家做些事情。#r")
				
				
				
				
				
				
				
				
				
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300671_var_FileId, varQuest);		
			end
			return
		end
		
	end

	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_GET_MONEY_COUNT, x300671_var_FileId, varQuest, "ProcAcceptQuest", varTalknpc );
	
end

function x300671_ProcAcceptQuest(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	if GetGameOpenById(x300671_gameopenid)<=0 then
		return
	end

	if GetGuildID(varMap, varPlayer) == -1 then
		return
	end

	local varCount = 99-(QuestData)
	local varLevel = GetLevel(varMap,varPlayer)
	local nExp = varLevel*3000

	local GuildMoney =20
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local explevel = maxlevel - 10
	StartTalkTask(varMap)
	local Readme_1 = ""		
	local Readme_2 = "\t我这里有一些帮会的物资需要出售给商人@npc_123833，@npc_123834，@npc_123835为帮会赚取金钱。另外，在王城内的神秘商人@npc_123836常会以#G高价收购所有货物#W。\n\t每次跑商需要缴纳#R5#W两银卡或现银作为押金，完成任务返还5两银卡，如果任务失败，押金将被#R没收#W！#r"
	local varReadme = Readme_1 .. Readme_2
	TalkAppendString(varMap,"#Y【帮会】帮会跑商")
	TalkAppendString(varMap,varReadme)
	TalkAppendString(varMap,"#W#G帮会本日跑商剩余次数：#Y"..varCount.."#G次#r")
	TalkAppendString(varMap,"#Y奖励内容：")
		TalkAppendString(varMap,"#W经验值："..nExp)
	TalkAppendString(varMap,"#W帮会金钱：20两")
	
	
	
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300671_var_FileId, varQuest);
	
end

function x300671_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x300671_gameopenid)<=0 then
		return
	end
	
	if GetGuildID(varMap, varPlayer) == -1 then
		return
	end
	
	local GuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
	if GuildLevel < 3 then
		Msg2Player(varMap,varPlayer,"很抱歉，只有帮会等级不低于三级才能接取【帮会】帮会跑商任务",8,3) 
		return 
	end	
	
	
	if GetGameOpenById(x300671_gameopenid)<=0 then
		return
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end	

	if GetLevel(varMap, varPlayer) < x300671_var_Min_Level then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t等级过低，不能接受此任务");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"等级过低，不能接受此任务",8,2)	
		return
	end
	
	if GetGuildID(varMap, varPlayer) == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t你已经不在帮会中，请加入帮会后再继续本任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"你已经不在帮会中，请加入帮会后再继续本任务！",8,2)	
		return
	end
	
	local subsillertype=1
	if CostMoney(varMap, varPlayer, 1, 5000) == -1 then
		subsillertype = 0
		if CostMoney(varMap, varPlayer, 0, 5000) == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "\t现银或银卡不足，不能接受此任务");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,"现银或银卡不足，不能接受此任务",8,2)				
			return
		end
	end
	

	
	x300671_DelQuestItems(varMap, varPlayer)
	if x300671_AddQuestItems(varMap, varPlayer) == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t背包空间不足，不能接受任务！你的背包至少需要4个空格。");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"背包空间不足，不能接受任务！你的背包至少需要4个空格。",8,2)	
		
		AddMoney(varMap,varPlayer,subsillertype,5000)
		
		return
	end
	
	AddQuestNM(varMap, varPlayer, x300671_var_QuestId);
	
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	SetQuestParam(varMap, varPlayer, varQuestIdx, 0, 0)
	
	local varStr = format("您领取了任务：%s", x300671_var_QuestName)
	Msg2Player(varMap,varPlayer,"你缴纳了5两银子的押金。",8,2)
	Msg2Player(varMap,varPlayer,varStr,8,2)	
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);	
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, 0)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
	x300671_ProcQuestLogRefresh(varMap, varPlayer, varQuest)
	
	
	GamePlayScriptLog(varMap, varPlayer, 1321)

end



function x300671_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
    
	if GetGameOpenById(x300671_gameopenid)<=0 then
		return
	end	
	
	if GetGuildID(varMap, varPlayer) == -1 then
		return
	end
	
	local GuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
	if GuildLevel < 3 then 
		return 
	end		
	
	if varQuest == nil or varQuest < 0 then
        return 0
    end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	
		return 0
	end
	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end
	
	if HaveItem(varMap, varPlayer,x300671_Item_Money) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "帮会银票不存在，不能交任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"帮会银票不存在，不能交任务！",8,2)			
		return 0		
	end
	
	if GetGuildID(varMap, varPlayer) == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你已经不在帮会中，请加入帮会后再继续本任务！")
		StopTalkTask()
		DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300671_var_FileId, varQuest,0);
		return 0
	end		

	if x300671_IsQuestCompleted(varMap, varPlayer, varQuest) ~= 1 then 
		return 0
	end
	
	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_GET_MONEY_COUNT, x300671_var_FileId, varQuest, "ProcQuestComplete" );
	
end


function x300671_ProcQuestComplete(varMap, varPlayer,QuestData,varQuest,varTalknpc)


	if GetGameOpenById(x300671_gameopenid)<=0 then
		return
	end	
	
	if GetGuildID(varMap, varPlayer) == -1 then
		return
	end
	
	local GuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
	if GuildLevel < 3 then 
		return 
	end		
	
	if varQuest == nil or varQuest < 0 then
        return 0
    end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	
		return 0
	end
	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end
	
	if HaveItem(varMap, varPlayer,x300671_Item_Money) <= 0 then	
		return 0		
	end
	
	if GetGuildID(varMap, varPlayer) == -1 then
		return 0
	end		

	if x300671_IsQuestCompleted(varMap, varPlayer, varQuest) ~= 1 then 
		return 0
	end


	if QuestData >= x300671_Max_Count-1 then
		local message = "任务次数已满"
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap, varPlayer, message, 8, 2)
		return
	end

	
	DelQuestNM( varMap, varPlayer, varQuest)
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,3)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,3)

    
    local varId = GetGuildID( varMap, varPlayer)
    if varId ~= -1 then
        AddGuildActivity( varMap, varPlayer, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM6) )
    end
	
	
	x300671_DelQuestItems(varMap, varPlayer)
	
	local message = format("您完成了任务：%s", x300671_var_QuestName);
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 8, 2);
	
	local guildid = GetGuildID(varMap,varPlayer);
	SetGuildQuestData(varMap, guildid, GD_GUILD_INDEX_GET_MONEY_COUNT, 1, 1 );	
	
	x300671_GiveBonus(varMap,varPlayer,99 - QuestData)
	
	
	GamePlayScriptLog(varMap, varPlayer, 1322)
end


function x300671_GiveBonus(varMap,varPlayer,varCount)
	
	
	local varLevel = GetLevel(varMap,varPlayer)
	local nExp = varLevel*3000
	local money =5000
	local moneymes = "返还跑商押金5两银卡。"
	local varName =GetName(varMap,varPlayer)
	
	local banghuimes = format("#G玩家#Y%s#G顺利的完成了#Y【帮会】帮会跑商#G任务，帮会金钱增加了#Y20#G两。帮会本日跑商任务剩余#Y%s#G次。",varName,varCount-1)

	local guildid = GetGuildID(varMap, varPlayer)
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local explevel = maxlevel - 10

	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	
	AddExp(varMap,varPlayer,nExp)
	
	AddMoney( varMap, varPlayer, 1, money )
	Msg2Player(varMap, varPlayer, moneymes, 8, 2);
	Msg2Player(varMap, varPlayer,"你获得了#R经验"..nExp.."点#cffcf00的奖励。",8,2)
	
	AddGuildMoney(varMap,varPlayer,20000)
	
	local ruoguoopen = IsOpenWeakCountryCheck()
	if maxlevel >= 70 and ruoguoopen == 1 then
		if selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 then
		local GuildMoneyrg = floor(((( 0.2 - selfscore / allscore) * 10 + 0.5) * 20000)/1000)*1000
			if GuildMoneyrg > 20000 then 
			   GuildMoneyrg = 20000
			end
			AddGuildMoney(varMap,varPlayer,GuildMoneyrg)
			local varMsg = GuildMoneyrg/1000
			local banghuimesrg = format("弱国额外增加帮会金钱#Y"..varMsg.."#G两。")
			LuaAllScenceM2Guild(varMap, banghuimesrg, guildid, 0,1)
		end
	end
	LuaAllScenceM2Guild(varMap, banghuimes, guildid, 0,1)
end

function x300671_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
end

function x300671_ProcQuestAbandon( varMap, varPlayer, varQuest )
	
	DelQuestNM( varMap, varPlayer, varQuest)
	x300671_DelQuestItems(varMap, varPlayer)
	
	local message = format("您放弃了任务：%s", x300671_var_QuestName);
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 8, 2);
	
end

function x300671_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, x300671_var_SubmitParamIndex)
	local strTarget = "  在@npc_123834，@npc_123835，@npc_123833处，出售帮会货物赚取足够金钱("..nMoney.."/"..x300671_var_SubmitMoney..")";
	
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 6) == 1 then	
		strTarget = "  任务失败，请重新领取"
	end
	
	StartTalkTask( varMap)
		local varLevel = GetLevel(varMap,varPlayer)
		local nExp = varLevel*3000
		local GuildMoney =20
		local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
		local explevel = maxlevel - 10
	
	AddQuestLogCustomText( varMap,
							"",                             
							x300671_var_QuestName,          
							strTarget,
							"",
                             
							"\t找到城东商人，城西商人，楼兰猎场商人及王城游商，将身上的帮会货物出售给他们，一定要赚取足够的金钱才能完成任务。#Y\n奖励内容：\n#W经验值："..nExp.."\n#W帮会金钱：20两",
							"\t帮会的发展离不开帮会金钱。\n\t我这里有一些帮会的物资待售，听说城东商人@npc_123834，城西商人@npc_123835，楼兰猎场商人@npc_123833正在收购它们。\n\t你带着这些物资，卖给商人们,为帮会赚取足够的金钱吧。\n\t值得注意的是，王城内有位神秘的商人，名叫@npc_123836，他常常会以#G高价收购所有货物#W。\n\t帮会货物共有以下种类：#G波斯金鞍，大宛马铠，高丽山参，大理灵芝，南洋珍珠和琉球珊瑚。",
							"\t神秘商人会在王城的广场区域游走，要找到王城游商可不是个容易的事。")
		TalkAppendString(varMap,"#Y奖励内容：")
			TalkAppendString(varMap,"#W经验值："..nExp)
		TalkAppendString(varMap,"#W帮会金钱：20两")
	StopTalkTask()	
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
	
	
	if x300671_IsQuestCompleted(varMap, varPlayer, varQuest) == 1 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
	end
	
end


function x300671_IsQuestCompleted(varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, x300671_var_SubmitParamIndex)
	if nMoney > x300671_var_SubmitMoney then
		return 1
	else
		return 0
	end

end


function x300671_AddQuestItems(varMap, varPlayer)
	local item1, item2, item3
	local nTotalNum = getn(x300671_Item_Goods)
	item1 = x300671_Item_Goods[ random(1,nTotalNum) ]
	item2 = x300671_Item_Goods[ random(1,nTotalNum) ]
	while item2 == item1 do
		item2 = x300671_Item_Goods[ random(1,nTotalNum) ]
	end
	item3 = x300671_Item_Goods[ random(1,nTotalNum) ]
	while item3==item2 or item3==item1 do
		item3 = x300671_Item_Goods[ random(1,nTotalNum) ]
	end
	
	if GetBagSpace(varMap, varPlayer) < 4 then
		return 0
	end
	StartItemTask(varMap)
	ItemAppend(varMap, item1, 1)
	ItemAppend(varMap, item2, 1)
	ItemAppend(varMap, item3, 1)
	ItemAppend(varMap, x300671_Item_Money, 1)
    local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
	end
	return varRet
end


function x300671_DelQuestItems(varMap, varPlayer)
	local varI = 0
	for varI, item in x300671_Item_Goods do
		if HaveItem(varMap,varPlayer,item)>0 then
			if DelItem(varMap,varPlayer,item,1) ~= 1 then return 0 end
		end
	end
	
	if HaveItem(varMap,varPlayer,x300671_Item_Money) > 0 then
		if DelItem(varMap,varPlayer,x300671_Item_Money,1) ~= 1 then return 0 end
	end
end


function x300671_ProcLeaveGuild(varMap, varPlayer, varQuest)

	DelQuestNM( varMap, varPlayer, varQuest)
	x300671_DelQuestItems(varMap, varPlayer)
	
	local message = format("您已经不在帮会中了，删除了任务：%s", x300671_var_QuestName);
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 8, 2);	
	
end
