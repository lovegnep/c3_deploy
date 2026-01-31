



x310016_var_FileId 					= 310016

x310016_var_LevelMin					= 20
x310016_var_LevelMax					= 100
x310016_var_DayCountUntil				= 1

x310016_var_ItemIdList				= {12030328,12030329,12030330,12030331,12030332}

x310016_var_NeedItemCount				= 1	

x310016_var_QuestName				= "【个人】收集神石"
x310016_var_EnterInfo					= "\t听说了吗？从七月十四日开始，每天收集齐全#y“成”，“吉”，“思”，“汗”，“china joy”#w字样的神石交给我，每天可以完成一次，如果是第#r888#w次完成这个任务的幸运儿，你就有可能获得#y显卡#w或#y笔记本#w的超值大奖！\n\t当你接受了“#g天降宝箱#w”任务后，在就有可能从那些箱子中获得这些石头，在每天#y12：30-24：00#w中，请带给我五块神石#y\n“成”字神石 * 1\n“吉”字神石 * 1\n“思”字神石 * 1\n“汗”字神石 * 1\n“chinajoy”字神石 * 1#w"

x310016_var_BonusItem1 = 12030209
x310016_var_BonusItem2 = 11000300
x310016_var_BonusItem3 = 12010020
x310016_var_BonusItem4 = 12030200
x310016_var_BonusItem5 = 12041101

x310016_GameId = 1017


x310016_var_EnterTime					=	{                       
											{min=12*60+30,  max=24*60+0},
											
										}






function x310016_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetGameOpenById(x310016_GameId)<=0 then
		return
	end

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x310016_var_LevelMin then
       return
    end

    if varLevel > x310016_var_LevelMax then
		 return
    end
	
	TalkAppendButton(varMap, x310016_var_FileId, x310016_var_QuestName,5,1);
	
end




function x310016_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	if GetGameOpenById(x310016_GameId)<=0 then
		x310016_ShowTips(varMap, varPlayer,"此活动已关闭");
		return
	end

	local varLevel = GetLevel(varMap, varPlayer)
	local nYinkaBonus = varLevel*600;
	local str1 = format("#Y%d银卡#W\n",nYinkaBonus)
 	local varExpBonus = varLevel*4500;
	local str2 = format("#Y%d点的经验#W\n",varExpBonus) 
	local nShengWangBonus = 1000
	
	local str3 = format("#Y%d点声望#W\n", nShengWangBonus) 
	
	local str4 = "#Y@itemid_"..x310016_var_BonusItem1.."\n#W"
	local str5 = "#Y@itemid_"..x310016_var_BonusItem2.."\n#W"
	local str6 = "#Y@itemid_"..x310016_var_BonusItem3.."\n#W"
	local str7 = "#Y@itemid_"..x310016_var_BonusItem4.."\n#W"
	local str8 = "#Y@itemid_"..x310016_var_BonusItem5.."\n#W"
  local str9 ="\n你还可能获得以下奖励中的一种：\n"
	local varStr = "\n你会获得固定奖励：\n"..str2..str9..str1..str3..str4..str5..str6..str7..str8


	StartTalkTask(varMap)
	
  
  	
		
		TalkAppendString(varMap,"#Y"..x310016_var_QuestName)
		TalkAppendString(varMap,x310016_var_EnterInfo..varStr)
		
		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310016_var_FileId, -1);
end





function x310016_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310016_ProcAccept( varMap, varPlayer )
	if GetGameOpenById(x310016_GameId)<=0 then
		x310016_ShowTips(varMap, varPlayer,"此活动已关闭");
		return
	end

	x310016_ProcRequestSubmit(varMap, varPlayer);
end









function x310016_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)
	if GetGameOpenById(x310016_GameId)<=0 then
		x310016_ShowTips(varMap, varPlayer,"此活动已关闭");
		return
	end

	if nFlag== nil then
		return
	end

	x310016_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x310016_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x310016_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x310016_ProcApproveRequest(varMap, varPlayer)
	end
end

function x310016_CheckRequest(varMap, varPlayer)

	if( x310016_var_DayCountUntil > 0 ) then
		
		if x310016_GetDayCount(varMap, varPlayer) >= x310016_var_DayCountUntil then

			local varStr = format("每天只能完成%d次本任务，明天再来吧。",x310016_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end

	for varI,item in x310016_var_ItemIdList do
		local ItemCnt = GetItemCount( varMap, varPlayer, item )

		if ItemCnt<x310016_var_NeedItemCount then
			local varStr = format("你身上似乎没有@itemid_%d。",item)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();

			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end

	local hour,minute,sec =GetHourMinSec();

	local nowtime = hour*60+minute
	

	
	for varI, item in x310016_var_EnterTime do
		if nowtime >= item.min and nowtime <= item.max then
			
			
			return 1;
			
		end
	end
	x310016_ShowTips(varMap, varPlayer,"活动还没开始呢，请留意公告，耐心等待。");
	return 0;

end

function x310016_ProcApproveRequest(varMap, varPlayer)
	
	if GetGameOpenById(x310016_GameId)<=0 then
		x310016_ShowTips(varMap, varPlayer,"此活动已关闭");
		return
	end

	local nRet1, iRandom = x310016_GetBonusTest(varMap, varPlayer)

	if nRet1==0 then
		x310016_ShowTips(varMap, varPlayer,"背包空间不足，无法获得奖励物品,请先整理背包");
	end
	
	local iRet=0;
	for varI,item in x310016_var_ItemIdList do
		iRet = DelItem(varMap, varPlayer,item,x310016_var_NeedItemCount)
	end



	if iRet>0 then
		x310016_GetBonus(varMap, varPlayer,iRandom)
		x310016_SetDayCount(varMap, varPlayer);

		
		local myGuid = GetPlayerGUID( varMap,varPlayer )

		GetCountryQuestDataNM(varMap,myGuid,0, CD_INDEX_CHINAJOY_DATE, x310016_var_FileId,-1,"ProcGetChinaJoyDate",1)
	end
		
	
	
end


function x310016_ProcGetChinaJoyDate(varMap, varPlayer,QuestData,varQuest)

	
	
	local varToday = GetDayOfYear()

	

	if varToday~=QuestData then
		SetCountryQuestData(varMap, 0, CD_INDEX_CHINAJOY_DATE,varToday)
		SetCountryQuestData(varMap, 0, CD_INDEX_CHINAJOY_TIMES,0)
		
		local myGuid = GetPlayerGUID( varMap,varPlayer )
		GetCountryQuestDataNM(varMap,myGuid,0, CD_INDEX_CHINAJOY_TIMES, x310016_var_FileId,-1,"ProcGetChinaJoyTimes",1)
		
	else
		local myGuid = GetPlayerGUID( varMap,varPlayer )
		GetCountryQuestDataNM(varMap,myGuid,0, CD_INDEX_CHINAJOY_TIMES, x310016_var_FileId,-1,"ProcGetChinaJoyTimes",1)
	end

	
end

function x310016_ProcGetChinaJoyTimes(varMap, varPlayer,QuestData,varQuest)

	
	SetCountryQuestData(varMap, 0, CD_INDEX_CHINAJOY_TIMES,QuestData+1)
	x310016_ProcCompleteTimes(varMap, varPlayer, QuestData+1)


	
end


function x310016_ProcCompleteTimes(varMap, varPlayer, nTimes)
	
	
	local guid = GetPlayerGUID( varMap,varPlayer )	

	if nTimes==nil then
		return
	end

	
	if nTimes==888 then
		
		
		

		
		GamePlayScriptLog(varMap, varPlayer, 892)

		local varStr = GetName(varMap,varPlayer).."恭喜！你是第"..nTimes.."个完成了收集神石任务的玩家，你很有可能获得显卡或笔记本的奖励哦！"

		LuaAllScenceM2Wrold (varMap,varStr, 0, 1)

		x310016_ShowTips(varMap, varPlayer,"恭喜你，你很有可能获得显卡或笔记本的奖励哦！");
	end

	

	
	GamePlayScriptLog(varMap, varPlayer, 882)

	
end

function x310016_GetBonusTest(varMap, varPlayer)

	if GetGameOpenById(x310016_GameId)<=0 then
		x310016_ShowTips(varMap, varPlayer,"此活动已关闭");
		return 0
	end

	local varLevel = GetLevel(varMap, varPlayer)



	local iRandom = random(1,1000)
	local nRet1 = 1;

	if iRandom<=370 then
		
	elseif iRandom<=780 then
		
	elseif iRandom<=820 then
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, x310016_var_BonusItem1, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
		else
			nRet1 = 0
		end
	elseif iRandom<=821 then
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, x310016_var_BonusItem2, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
		else
			nRet1 = 0
		end
	elseif iRandom<=850 then
		
		StartItemTask(varMap)
			ItemAppend( varMap, x310016_var_BonusItem3, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
		else
			nRet1 = 0
		end
	elseif iRandom<=900 then
		
		StartItemTask(varMap)
			ItemAppend( varMap, x310016_var_BonusItem4, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
		else
			nRet1 = 0
		end
	elseif iRandom<=1000 then
		
		StartItemTask(varMap)
			ItemAppend( varMap, x310016_var_BonusItem5, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
		else
			nRet1 = 0
		end

	
	end
	
	return nRet1,iRandom
end

function x310016_GetBonus(varMap, varPlayer, iRandom)

	if GetGameOpenById(x310016_GameId)<=0 then
		x310016_ShowTips(varMap, varPlayer,"此活动已关闭");
		return
	end

	local varLevel = GetLevel(varMap, varPlayer)











	

	if iRandom<=370 then

		local nYinkaBonus = varLevel*600;
		if nYinkaBonus > 0 then
			AddMoney(varMap, varPlayer, 1, nYinkaBonus)
			
			
			
		local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)			
		end
	elseif iRandom<=780 then
		local nShengWangBonus = 1000
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + nShengWangBonus
		SetShengWang( varMap, varPlayer, varShengWang )
		
		local varStr = format("您获得了%d点声望值的奖励。", nShengWangBonus)
		Msg2Player(varMap,varPlayer,varStr,4,2)
		Msg2Player(varMap,varPlayer,varStr,4,3)
		local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)	
	elseif iRandom<=820 then
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, x310016_var_BonusItem1, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			DeliverItemListSendToPlayer(varMap,varPlayer)
		

			x310016_ShowTips(varMap, varPlayer, "获得奖励物品@itemid_"..x310016_var_BonusItem1)

			local varStr = "恭喜玩家"..GetName(varMap, varPlayer).."在收集神石的活动中获得奖励物品@itemid_"..x310016_var_BonusItem1

			LuaAllScenceM2Wrold (varMap,varStr, 0, 1)
					local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)	
		end
	elseif iRandom<=821 then
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, x310016_var_BonusItem2, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			DeliverItemListSendToPlayer(varMap,varPlayer)
		

			x310016_ShowTips(varMap, varPlayer, "获得奖励物品@itemid_"..x310016_var_BonusItem2)

			local varStr = "恭喜玩家"..GetName(varMap, varPlayer).."在收集神石的活动中获得奖励物品@itemid_"..x310016_var_BonusItem2

			LuaAllScenceM2Wrold (varMap,varStr, 0, 1)
					local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)	
		end
	elseif iRandom<=850 then
		
		StartItemTask(varMap)
			ItemAppend( varMap, x310016_var_BonusItem3, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			DeliverItemListSendToPlayer(varMap,varPlayer)
		

			x310016_ShowTips(varMap, varPlayer, "获得奖励物品@itemid_"..x310016_var_BonusItem3)

			local varStr = "恭喜玩家"..GetName(varMap, varPlayer).."在收集神石的活动中获得奖励物品@itemid_"..x310016_var_BonusItem3

			LuaAllScenceM2Wrold (varMap,varStr, 0, 1)
					local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)	
		end
	elseif iRandom<=900 then
		
		StartItemTask(varMap)
			ItemAppend( varMap, x310016_var_BonusItem4, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			DeliverItemListSendToPlayer(varMap,varPlayer)
		

			x310016_ShowTips(varMap, varPlayer, "获得奖励物品@itemid_"..x310016_var_BonusItem4)

			local varStr = "恭喜玩家"..GetName(varMap, varPlayer).."在收集神石的活动中获得奖励物品@itemid_"..x310016_var_BonusItem4

			LuaAllScenceM2Wrold (varMap,varStr, 0, 1)
					local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)	
		end
	elseif iRandom<=1000 then
		
		StartItemTask(varMap)
			ItemAppend( varMap, x310016_var_BonusItem5, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			DeliverItemListSendToPlayer(varMap,varPlayer)
		

			x310016_ShowTips(varMap, varPlayer, "获得奖励物品@itemid_"..x310016_var_BonusItem5)

			local varStr = "恭喜玩家"..GetName(varMap, varPlayer).."在收集神石的活动中获得奖励物品@itemid_"..x310016_var_BonusItem5

			LuaAllScenceM2Wrold (varMap,varStr, 0, 1)
					local varExpBonus = varLevel*4500;
			AddExp(varMap, varPlayer, varExpBonus);
			
			local varStr = format("你获得%d点的经验奖励",varExpBonus)
			Msg2Player(varMap,varPlayer,varStr,4,2)	
		end

	end
	
end

function x310016_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end





function x310016_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DATE[1], MD_CHINAJOY_DATE[2],MD_CHINAJOY_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DAYCOUNT[1], MD_CHINAJOY_DAYCOUNT[2],MD_CHINAJOY_DAYCOUNT[3] );

	return varDaycount;

	

end




function x310016_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DATE[1], MD_CHINAJOY_DATE[2], MD_CHINAJOY_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DATE[1], MD_CHINAJOY_DATE[2], MD_CHINAJOY_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DAYCOUNT[1], MD_CHINAJOY_DAYCOUNT[2], MD_CHINAJOY_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DAYCOUNT[1], MD_CHINAJOY_DAYCOUNT[2], MD_CHINAJOY_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_CHINAJOY_DAYCOUNT[1], MD_CHINAJOY_DAYCOUNT[2], MD_CHINAJOY_DAYCOUNT[3], varDaycount+1)
	end
	
	
	
end
