

x310222_var_LevelMax					= 40

x310222_var_GameId					= 1023
x310222_var_NeedMoney					= 10000

--DECLARE_QUEST_INFO_START--

x310222_var_FileId 					= 	310222                  

x310222_var_LevelLess					= 	25                      


x310222_var_QuestName				= 	"新兵速成"

x310222_var_MaxKillNum				= 20

x310222_var_MaxCount					= 5


--DECLARE_QUEST_INFO_STOP--


function x310222_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	
		
	

	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then
		local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState);
	end
	
end


function x310222_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById(x310222_var_GameId) ~= 1 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "服务器等级第一名达到65级，才可开启新兵速成任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"服务器等级第一名达到65级，才可开启新兵速成任务",8,2)	
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	

		x310222_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
		
	
	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local killcount = GetQuestParam(varMap, varPlayer, varQuestIdx, 0)
		if killcount == x310222_var_MaxKillNum then
			x310222_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
			
		else
			x310222_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
			
		end
	end
end



function x310222_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById(x310222_var_GameId) ~= 1 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "服务器等级第一名达到65级，才可开启新兵速成任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"服务器等级第一名达到65级，才可开启新兵速成任务",8,2)	
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end
	local  WorldID = GetWorldID(varMap,varPlayer)
	local  toplevel = GetToplistCount(WorldID,0)
	local  guid,varLevelMax = GetToplistInfo(WorldID,0,toplevel-1)
	if GetLevel(varMap, varPlayer) < x310222_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return 0
	end

	if GetLevel(varMap, varPlayer) > ( varLevelMax-10) then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return 0
	end 

	local varDaycount = x310222_GetDayCount(varMap, varPlayer)
	if varDaycount >= x310222_var_MaxCount then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "每日只能接取五次此任务，请明日再来");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
	end
	
	
	if varDaycount > 0 then
		if IsEnoughGold(varMap, varPlayer,x310222_var_NeedMoney) < 1 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "你的金钱不足，无法领取任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"你的金钱不足，无法领取任务",8,2)
			return 0
		end
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			x310222_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
			if varDaycount > 0 then
				
				local goldMode = GetGoldMode(varMap, varPlayer)
				
				if goldMode == 1 then
					local cash = GetMoney(varMap, varPlayer,2)
					if cash >= x310222_var_NeedMoney then
						CostMoney(varMap, varPlayer, 2, x310222_var_NeedMoney,321)
					end
				else
					local cash = GetMoney(varMap, varPlayer,2)
					local bind = GetMoney(varMap, varPlayer,3)
					if bind >= x310222_var_NeedMoney then
						CostMoney(varMap, varPlayer, 3, x310222_var_NeedMoney)
					elseif cash >= x310222_var_NeedMoney then
						CostMoney(varMap, varPlayer, 2, x310222_var_NeedMoney,321)
					end
				end
			end

			StartTalkTask(varMap);
				TalkAppendString(varMap, "您接受了任务:【个人】新兵速成");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您接受了任务:【个人】新兵速成",8,2)
                        GamePlayScriptLog(varMap, varPlayer, 1301)
			return 1
		elseif varRet == -2 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "任务已满，无法接受任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0
		else
			StartTalkTask(varMap);
				TalkAppendString(varMap, "接受任务错误");
			StopTalkTask();		
			DeliverTalkTips(varMap, varPlayer);
			return 0
		end
	elseif varRet ==-1 then  
		StartTalkTask(varMap);
			TalkAppendString(varMap, "你等级过低，不能接收任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	elseif varRet ==-2 then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "超过最大等级限制");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	end

	return 0
end



function x310222_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM( varMap,varPlayer,varQuest )<= 0 then
        return 0
    end
    
	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest, varButtonClick ) 
	if varRet == 1 then 
		x310222_SetDayCount(varMap, varPlayer)
		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您完成了任务:【个人】新兵速成");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您完成了任务:【个人】新兵速成",8,2)

		x310222_GiveReward(varMap,varPlayer)
		
		x310222_SetFirst(varMap, varPlayer)
		
        GamePlayScriptLog(varMap, varPlayer, 1302)
		
		return 1 
	else 
		StartTalkTask(varMap);
			TalkAppendString(varMap, "完成任务错误");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
	end
	return 0
end

function x310222_GiveReward(varMap,varPlayer)

	local varExpBonus = x310222_GetExp( varMap, varPlayer )
	
	AddExp(varMap, varPlayer, varExpBonus)
	StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
end


function x310222_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
		
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	if varTalkNpcGUID == submitGuid then	
		local questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end

 




function x310222_ProcQuestAbandon( varMap, varPlayer,varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return -1;
	end

	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		x310222_SetFirst(varMap, varPlayer)
		x310222_SetDayCount(varMap, varPlayer)
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您放弃了任务:【个人】新兵速成");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您放弃了任务:【个人】新兵速成",8,2)
	end
end


function x310222_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	local ObjName = GetName(varMap, varObj)

	local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, HumenNum-1 do
				local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
				
				if humanObjId ~= -1 then
					if  GetLevel(varMap, humanObjId) - GetLevel(varMap, varObj) <= 5 then
					if  GetHp(varMap, humanObjId) > 0 then
				    if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
						local varText = "";
						local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest )
						local KilledNum = GetQuestParam( varMap, humanObjId, varQuestIdx, 0 )
										
					    if KilledNum == x310222_var_MaxKillNum-1 then
						    SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, KilledNum+1 )
											SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1 )
											StartTalkTask(varMap)
											if ObjName == "" then
												varText = format( "#cffcf00【个人】新兵速成：您击毙了怪物(%d/%d)", KilledNum+1, x310222_var_MaxKillNum )
											else
												varText = format( "#cffcf00【个人】新兵速成：您击毙了%s(%d/%d)", ObjName, KilledNum+1, x310222_var_MaxKillNum )
											end
											TalkAppendString( varMap, varText )
											StopTalkTask( varMap )
											DeliverTalkTips( varMap, humanObjId )
											x310222_ProcQuestLogRefresh( varMap, humanObjId, varQuest)
									elseif KilledNum < x310222_var_MaxKillNum-1 then
											SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, KilledNum+1 )
											StartTalkTask(varMap)
											if ObjName == "" then
												varText = format( "#cffcf00【个人】新兵速成：您击毙了怪物(%d/%d)", KilledNum+1, x310222_var_MaxKillNum )
											else
												varText = format( "#cffcf00【个人】新兵速成：您击毙了%s(%d/%d)", ObjName, KilledNum+1, x310222_var_MaxKillNum )
											end
											TalkAppendString( varMap, varText )
											StopTalkTask( varMap )
											DeliverTalkTips( varMap, humanObjId )
											x310222_ProcQuestLogRefresh( varMap, humanObjId, varQuest)
					    end
				    end
				    end
				    end
				end
				
				
		end

	
end


function x310222_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end



function x310222_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310222_GetCost(varMap, varPlayer)
	local varDaycount =x310222_GetDayCount(varMap,varPlayer)
	if varDaycount > 0 then
		return 10000
	end
	return 0
end



function x310222_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)
	local awardexp = x310222_GetExp( varMap, varPlayer )
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y【个人】新兵速成")
	
	
	TalkAppendString(varMap,"   当等级排行榜第一名达到#R65级#W时，会开启新兵速成任务。最近，四国之间的矛盾渐渐加深了，我需要更多的士兵来保卫我们的国家。不过，训练新兵需要花费一些金钱，如果你愿意自负费用的话，我可以帮助你迅速变成一个训练有素的士兵。\n\t消灭等级不比你低5级以上的20只怪物，你就可以完成新兵的训练。")
	TalkAppendString(varMap," ")

	
	TalkAppendString( varMap,"#Y任务目标：")
	TalkAppendString( varMap,"   消灭等级不比你低5级以上的20只怪物，你就可以完成新兵的训练。")
	 TalkAppendString( varMap, "\n#Y任务花费：" )
        local cost = x310222_GetCost(varMap, varPlayer)
        TalkAppendString( varMap, format( "金卡:#{_MONEY%d}", cost) )
	TalkAppendString( varMap,"   \n#G小提示：\n每天可以领取五次新兵速成任务，如果世界中玩家等级越高，获得的经验也会越多。现在可以领取该任务的等级下限为25级，等级上限为低于等级排行榜上最低等级10级。每天第一次领取该任务免费。")
	TalkAppendString( varMap," ")
	
	
	
	AddQuestExpBonus(varMap,  awardexp);
			
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310222_var_FileId, varQuest,0);
end




function x310222_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	
	
		
	
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y【个人】新兵速成")
	
	
	TalkAppendString(varMap,"   时间紧迫，你还是快去杀怪吧。")
	TalkAppendString(varMap," ")

	
	
	
	
			
	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x310222_var_FileId, varQuest,0);
end




function x310222_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local awardexp = x310222_GetExp( varMap, varPlayer )
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y【个人】新兵速成")
	
	
	TalkAppendString(varMap,"   很好，你被证明是一个合格的新兵。")
	TalkAppendString(varMap," ")

	
	
	AddQuestExpBonus(varMap,  awardexp);
			
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310222_var_FileId, varQuest);

end

function x310222_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local killcount = GetQuestParam(varMap, varPlayer, varQuestIdx, 0);

	local varStr = "  消灭20只等级适当的怪物("..killcount.."/"..tostring(x310222_var_MaxKillNum)..")";	
	StartTalkTask(varMap)	
		local awardexp = x310222_GetExp( varMap, varPlayer )

		AddQuestExpBonus(varMap,  awardexp);
			
	local count =	x310222GetDayCount(varMap, varPlayer)
	local str =format("【个人】新兵速成(%d/5)",count+1)	
	AddQuestLogCustomText( varMap,
							"",						
							str,        
							varStr,		
							"@npc_129740",			
							"和其他玩家配合可以更快地完成任务。",               
							"最近，四国之间的矛盾渐渐加深了，我需要更多的士兵来保卫我们的国家。不过，训练新兵需要花费一些金钱，如果你愿意自负费用的话，我可以帮助你迅速变成一个训练有素的士兵。消灭等级不比你低5级以上的20只怪物，你就可以完成新兵的训练。",	
							"每天可以领取五次新兵速成任务，如果世界中玩家等级越高，获得的经验也会越多。现在可以领取该任务的等级下限为25级，等级上限为低于等级排行榜上最低等级10级。每天第一次领取该任务免费。"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		
	
end




function x310222_GetDayCount(varMap, varPlayer)
	if x310222_var_MaxCount > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATE[1], MD_XINBINGSUCHENG_DATE[2], MD_XINBINGSUCHENG_DATE[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATECOUNT[1], MD_XINBINGSUCHENG_DATECOUNT[2], MD_XINBINGSUCHENG_DATECOUNT[3])
		return varDaycount

	end
	return 0
end




function x310222_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATE[1], MD_XINBINGSUCHENG_DATE[2], MD_XINBINGSUCHENG_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATE[1], MD_XINBINGSUCHENG_DATE[2], MD_XINBINGSUCHENG_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATECOUNT[1], MD_XINBINGSUCHENG_DATECOUNT[2], MD_XINBINGSUCHENG_DATECOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATECOUNT[1], MD_XINBINGSUCHENG_DATECOUNT[2], MD_XINBINGSUCHENG_DATECOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_DATECOUNT[1], MD_XINBINGSUCHENG_DATECOUNT[2], MD_XINBINGSUCHENG_DATECOUNT[3], varDaycount+1)
	end
end

function x310222_GetFirst(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_FIRST[1], MD_XINBINGSUCHENG_FIRST[2], MD_XINBINGSUCHENG_FIRST[3])
end

function x310222_SetFirst(varMap, varPlayer)
	SetPlayerGameData(varMap, varPlayer, MD_XINBINGSUCHENG_FIRST[1], MD_XINBINGSUCHENG_FIRST[2], MD_XINBINGSUCHENG_FIRST[3], 1)
end

function x310222_GetExp( varMap, varPlayer )
	local varLevel = GetLevel(varMap, varPlayer)
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local awardexp = 0
	if maxlevel > 0 then
		awardexp = maxlevel*129600
	end
	return awardexp
end
