




--DECLARE_QUEST_INFO_START--


x300859_var_QuestId 				= 	7575                     
x300859_var_FileId 					= 	300859                  
x300859_var_QuestKind 				= 	1                       
x300859_var_LevelLess					= 	30                      


x300859_var_QuestName				= 	"【国家】国家守边"
x300859_var_QuestTarget				= 	"我国正面临敌国严重的骚扰和威胁，需要大家共同出力，守卫边关。你愿意接受此任务，守卫边关一段时间吗？"
x300859_var_QuestInfo				= 	"您接受任务后，经过一段时间即可向我汇报军情，并完成任务得到奖励。当您的#g计时器#w变成#r红色#w时就可准备找我#g回复#w了，如#g错过#w时间，任务就会#g失败#w，请你注意时间。"
x300859_var_ContinueInfo				= 	"你还在等什么？快去守边"
x300859_var_QuestCompleted			= 	"守边完成"
x300859_var_QuestHelp				=	"  #W任务期间死亡，离线或超时，任务自动置成失败状态，找明安重新领取。"          


x300859_var_ExtTarget					=	{ {type=20,n=1,target="守边"}}



x300859_var_ExpBonus					= 	0;
x300859_var_BonusItem					=	{}	

x300859_var_BonusMoney1               = 	0
x300859_var_BonusMoney2               =   0
x300859_var_BonusMoney3               =   0
x300859_var_Exp_Drop               =   10
x300859_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300859_var_Quest_Id				=	7575

x300859_var_DayCountLimited			=	3
x300859_var_BuffId					=	7764		


function x300859_GetQuestId( varMap, varPlayer )
	return x300859_var_Quest_Id
end

function x300859_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300859_var_LevelLess then
       return
    end

	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300859_var_QuestName,8,1);
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x300859_var_QuestName,varState,varState);

	end


	
end





function x300859_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300859_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
	else
		if varExt==7 then 
			x300859_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		
		else
			
			x300859_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
end


function x300859_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )

	return 1;

end

function x300859_CheckRequest(varMap, varPlayer)
	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300859_var_LevelLess then
		x300859_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300859_ShowTips(varMap, varPlayer, "你已经有这个任务，接受任务失败")
		return 0;
	end

	if x300859_var_DayCountLimited >0 then
		local varDayCount = x300859_GetDayCount(varMap, varPlayer)
		if varDayCount>= x300859_var_DayCountLimited then
			x300859_ShowTips(varMap, varPlayer, "很抱歉，您已经接取过了【国家】国家守边任务3次，请明日再来接！")
			return 0;
		end
	end

	return 1;

end

function x300859_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if x300859_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300859_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varMyQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = AddQuestNM( varMap, varPlayer, varMyQuest ) 
		
	if varRet > 0 then
		local varStr = "您接受了任务:【国家】国家守边";
		x300859_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 ) 

		
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x300859_var_BuffId,0 )

		
		return 1
	else
		
		x300859_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300859_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300859_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务:【国家】国家守边"
	    x300859_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

		CancelSpecificImpact(varMap, varPlayer, x300859_var_BuffId);
		x300859_SetDayCount(varMap, varPlayer)
	else
		x300859_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300859_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )
	
	if x300859_CheckSubmit(varMap, varPlayer )>0 then
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
			LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,5)
			LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,5)
			local varStr = "您完成了任务:【国家】国家守边";
			x300859_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			x300859_GiveReward(varMap,varPlayer)

			
			x300859_SetDayCount(varMap, varPlayer)
			x300859_SetSuccessCount(varMap, varPlayer)

			CancelSpecificImpact( varMap, varPlayer, x300859_var_BuffId)
			
		else
			x300859_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300859_GiveReward(varMap,varPlayer)
	
	local varLevel = GetLevel(varMap, varPlayer)
	local ExpBonus1 = varLevel*15000*x300859_var_Exp_Drop;
	local ExpBonus2 = varLevel*15000*x300859_var_Exp_Drop;
	local varExpBonus = 0;
	if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			varExpBonus = ExpBonus1;
	elseif GetLevel(varMap, varPlayer) >=70 then
			varExpBonus = ExpBonus2;
	end 
	local varDayCount = x300859_GetDayCount(varMap, varPlayer)
    if varDayCount == 0 then
		local varExpBonus = floor(varExpBonus*0.15*0.3)
		AddExp(varMap, varPlayer, varExpBonus);
		AddHonor(varMap, varPlayer, 15);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R荣誉15点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		local varReadme = "#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉15点#o的奖励"
  		Msg2Player(varMap,varPlayer,varReadme,4,2)
			if GetLevel(varMap, varPlayer) >=80 then
				local tf = 180
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "获得#R天赋%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1 then
			AddExp(varMap, varPlayer, varExpBonus);
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
			
			
			
			Msg2Player(varMap,varPlayer,"#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励",4,2)
			if GetLevel(varMap, varPlayer) >=80 then
				local tf = 180
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "国运令额外获得天赋#R%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o国运令额外获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end
			
			
			
			
				
				
				
				
				
				
			
			
		end
	elseif varDayCount == 1 then
		local varExpBonus = floor(varExpBonus*0.5*0.3)
		AddExp(varMap, varPlayer, varExpBonus);
		AddHonor(varMap, varPlayer, 35);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R荣誉35点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		local varReadme = "#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉35点#o的奖励"
  		Msg2Player(varMap,varPlayer,varReadme,4,2)
			if GetLevel(varMap, varPlayer) >=80 then
				local tf = 180
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "获得#R天赋%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1 then
			AddExp(varMap, varPlayer, varExpBonus);
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
			
			
			
			Msg2Player(varMap,varPlayer,"#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励",4,2)
			if GetLevel(varMap, varPlayer) >=80 then
				local tf = 180
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "国运令额外获得天赋#R%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o国运令额外获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end			
			
			
			
			
				
				
				
				
				
				
			
		end
	elseif varDayCount == 2 then
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,18)
		local varExpBonus = floor(varExpBonus*0.5*0.7)
		AddExp(varMap, varPlayer, varExpBonus);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		
		local nExpBonus1 = 0

		
		
		local varMsg = "guojiashoubian: varName="..GetName(varMap, varPlayer)..",guid="..GetPlayerGUID( varMap,varPlayer )..",nSuccssCount="..x300859_GetSuccessCount(varMap, varPlayer)

		WriteLog(1,varMsg)
		


		if x300859_GetSuccessCount(varMap, varPlayer)>=2 then
			nExpBonus1 = floor(varExpBonus*0.05)
			AddExp(varMap, varPlayer, nExpBonus1);
			StartTalkTask(varMap);
			TalkAppendString(varMap, "#o额外获得#R经验"..nExpBonus1.."点#o的奖励");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
		end

		AddHonor(varMap, varPlayer, 50);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R荣誉50点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		local varReadme = ""
		if nExpBonus1==0 then
			varReadme = "#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉50点#o的奖励"
		else
			varReadme = "#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉50点#o的奖励#r额外获得#R经验"..nExpBonus1.."点#o的奖励"
  		
		end
		Msg2Player(varMap,varPlayer,varReadme,4,2)
			if GetLevel(varMap, varPlayer) >=80 then
				local tf = 180
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "获得#R天赋%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		
		if varRet == 1 then
			AddExp(varMap, varPlayer, varExpBonus);
			
			nExpBonus1 = 0;
			if x300859_GetSuccessCount(varMap, varPlayer)>=2 then
				nExpBonus1 = floor(varExpBonus*0.05)
				AddExp(varMap, varPlayer, nExpBonus1);
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o国运令额外获得#R经验"..nExpBonus1.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end

			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
			
			
			
			

			if nExpBonus1==0 then
				Msg2Player(varMap,varPlayer,"#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励#o",4,2)
			else
				Msg2Player(varMap,varPlayer,"#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励#o#r国运令额外获得#R经验"..nExpBonus1.."点#o的奖励",4,2)
			end
			if GetLevel(varMap, varPlayer) >=80 then
				local tf = 180
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "国运令额外获得天赋#R%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o国运令额外获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end
			
			
			
			
				
				
				
				
				
				
			
			
		end
	end
end



function x300859_CheckSubmit(varMap, varPlayer )
	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

	if varCompleted<=0 then
		return 0
	end

	return 1;
end











function x300859_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2],DQ_SHOUBIAN_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2],DQ_SHOUBIAN_DAYCOUNT[3] );
	return varDaycount;



	

end




function x300859_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2], DQ_SHOUBIAN_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2], DQ_SHOUBIAN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2], DQ_SHOUBIAN_DAYCOUNT[3], 1)
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_COUNT[1], DQ_SHOUBIAN_COUNT[2], DQ_SHOUBIAN_COUNT[3], 0)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2], DQ_SHOUBIAN_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2], DQ_SHOUBIAN_DAYCOUNT[3], varDaycount+1)
	end
	
	
	
end





function x300859_GetSuccessCount(varMap, varPlayer)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2],DQ_SHOUBIAN_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varCount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_COUNT[1], DQ_SHOUBIAN_COUNT[2],DQ_SHOUBIAN_COUNT[3] );
	return varCount;



	

end




function x300859_SetSuccessCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2], DQ_SHOUBIAN_DATE[3])

	if varLastday ~= varToday then
		
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_COUNT[1], DQ_SHOUBIAN_COUNT[2], DQ_SHOUBIAN_COUNT[3], 1)
	else
		local varCount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_COUNT[1], DQ_SHOUBIAN_COUNT[2], DQ_SHOUBIAN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_COUNT[1], DQ_SHOUBIAN_COUNT[2], DQ_SHOUBIAN_COUNT[3], varCount+1)
	end
	
	
	
end





function x300859_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	local varDayCount = x300859_GetDayCount(varMap, varPlayer)
	
	TalkAppendString(varMap,"#Y".."【国家】国家守边")
	TalkAppendString(varMap,"  我国正面临敌国严重的骚扰和威胁，需要大家共同出力，守卫边塞。你愿意接受此任务，守卫边塞一段时间吗？")
	TalkAppendString(varMap," ")

	
	TalkAppendString( varMap,"#Y任务目标：")
	TalkAppendString( varMap,"  您接受任务后，守卫边塞，在@npc_131511附近守卫，每隔一段时间，会自动获得经验奖励。经过一段时间即可向我汇报军情，并完成任务得到奖励，当达到80级时可获得天赋值奖励。")
	TalkAppendString( varMap," ")
	local fixInh = RefixInherenceExp( varMap, varPlayer, 180)

	if varDayCount == 0 then
		local localexp1 = (GetLevel( varMap, varPlayer )) * 15000*0.15*0.3*x300859_var_Exp_Drop
		local localexp2 = (GetLevel( varMap, varPlayer )) * 15000*0.15*0.3*x300859_var_Exp_Drop
		local localexp = 0
		if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			localexp = localexp1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			localexp = localexp2;
		end 
		if GetLevel(varMap, varPlayer) >=80 then
			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：15点#r  天赋值："..fixInh.."点")
			TalkAppendString(varMap," ")	
		else
		TalkAppendString(varMap,"#Y任务奖励：")
		TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：15点")
		TalkAppendString(varMap," ")
		end	
	elseif varDayCount == 1 then	
		local localexp1 = (GetLevel( varMap, varPlayer )) * 15000* 0.3*0.5*x300859_var_Exp_Drop
		local localexp2 = (GetLevel( varMap, varPlayer )) * 15000* 0.3*0.5*x300859_var_Exp_Drop
		local localexp = 0
		if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			localexp = localexp1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			localexp = localexp2;
		end 
		if GetLevel(varMap, varPlayer) >=80 then
			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：35点#r  天赋值："..fixInh.."点")
			TalkAppendString(varMap," ")	
		else
		TalkAppendString(varMap,"#Y任务奖励：")
		TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：35点")
		TalkAppendString(varMap," ")
		end	
	elseif varDayCount == 2 then
		local localexp1 = (GetLevel( varMap, varPlayer )) * 15000*0.5*0.7*x300859_var_Exp_Drop
		local localexp2 = (GetLevel( varMap, varPlayer )) * 15000*0.5*0.7*x300859_var_Exp_Drop
		local localexp = 0
		if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			localexp = localexp1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			localexp = localexp2;
		end 
		if GetLevel(varMap, varPlayer) >=80 then
			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：50点#r  天赋值："..fixInh.."点")
			TalkAppendString(varMap," ")	
		else
		TalkAppendString(varMap,"#Y任务奖励：")
		TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：50点")
		TalkAppendString(varMap," ")
		end	
	end
		
		

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300859_var_FileId, varQuest,0);
end





function x300859_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)
		local varDayCount = x300859_GetDayCount(varMap, varPlayer)
		TalkAppendString(varMap,"#Y【国家】国家守边#r")

		TalkAppendString( varMap,"  国家守边时间未到，快去守卫边塞！#r")
	
		TalkAppendString(varMap,"#Y任务小提示：")
		TalkAppendString(varMap,"  在@npc_131511附近守卫，每隔一段时间，会自动获得经验奖励。#r")
		local fixInh = RefixInherenceExp( varMap, varPlayer, 180)
		if varDayCount == 0 then
			local localexp1 = (GetLevel( varMap, varPlayer ))* 15000 *0.15*0.3*x300859_var_Exp_Drop
			local localexp2 = (GetLevel( varMap, varPlayer ))* 15000 *0.15*0.3*x300859_var_Exp_Drop
			local localexp = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				localexp = localexp1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				localexp = localexp2;
			end 
			if GetLevel(varMap, varPlayer) >=80 then
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：15点#r  天赋值："..fixInh.."点")
				TalkAppendString(varMap," ")	
			else
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：15点")
				TalkAppendString(varMap," ")
			end	
			elseif varDayCount == 1 then	
			local localexp1 = (GetLevel( varMap, varPlayer )) * 15000*0.3*0.5*x300859_var_Exp_Drop
			local localexp2 = (GetLevel( varMap, varPlayer )) * 15000*0.3*0.5*x300859_var_Exp_Drop
			local localexp = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				localexp = localexp1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				localexp = localexp2;
			end 
			if GetLevel(varMap, varPlayer) >=80 then
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：35点#r  天赋值："..fixInh.."点")
				TalkAppendString(varMap," ")	
			else
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：35点")
				TalkAppendString(varMap," ")
			end	
			
			elseif varDayCount == 2 then
			local localexp1 = (GetLevel( varMap, varPlayer ))* 15000*0.5*0.7*x300859_var_Exp_Drop
			local localexp2 = (GetLevel( varMap, varPlayer ))* 15000*0.5*0.7*x300859_var_Exp_Drop
			local localexp = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				localexp = localexp1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				localexp = localexp2;
			end 
			if GetLevel(varMap, varPlayer) >=80 then
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：50点#r  天赋值："..fixInh.."点")
				TalkAppendString(varMap," ")	
			else
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：50点")
				TalkAppendString(varMap," ")
			end	
				
			
			end
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300859_var_FileId, varQuest,0);
	


end




function x300859_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	

	StartTalkTask(varMap)
		local varDayCount = x300859_GetDayCount(varMap, varPlayer)
		local fixInh = RefixInherenceExp( varMap, varPlayer, 180)		
		TalkAppendString(varMap,"#Y【国家】国家守边")
		TalkAppendString(varMap,"  好的，非常感谢，由于您协助防守边塞，我们的边塞稳定很多。")
		if varDayCount == 0 then
			local localexp1 = (GetLevel( varMap, varPlayer )) * 15000*0.15*0.3*x300859_var_Exp_Drop
			local localexp2 = (GetLevel( varMap, varPlayer )) * 15000*0.15*0.3*x300859_var_Exp_Drop
			local localexp = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				localexp = localexp1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				localexp = localexp2;
			end 
			if GetLevel(varMap, varPlayer) >=80 then
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：15点#r  天赋值："..fixInh.."点")
				TalkAppendString(varMap," ")	
			else
			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：15点")
			TalkAppendString(varMap," ")
			end	
	
		elseif varDayCount == 1 then	
			local localexp1 = (GetLevel( varMap, varPlayer )) * 15000* 0.3*0.5*x300859_var_Exp_Drop
			local localexp2 = (GetLevel( varMap, varPlayer )) * 15000* 0.3*0.5*x300859_var_Exp_Drop
			local localexp = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				localexp = localexp1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				localexp = localexp2;
			end 
			if GetLevel(varMap, varPlayer) >=80 then
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：35点#r  天赋值："..fixInh.."点")
				TalkAppendString(varMap," ")	
			else
			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：35点")
			TalkAppendString(varMap," ")
			end	
	
		elseif varDayCount == 2 then
			local localexp1 = (GetLevel( varMap, varPlayer )) * 15000*0.5*0.7*x300859_var_Exp_Drop
			local localexp2 = (GetLevel( varMap, varPlayer )) * 15000*0.5*0.7*x300859_var_Exp_Drop
			local localexp = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				localexp = localexp1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				localexp = localexp2;
			end
			if GetLevel(varMap, varPlayer) >=80 then
				TalkAppendString(varMap,"#Y任务奖励：")
				TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：50点#r  天赋值："..fixInh.."点")
				TalkAppendString(varMap," ")	
			else
			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..floor(localexp).."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
			end	
		
	
	end

		
		
		
		

		
		
		
		
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300859_var_FileId, varQuest);
	LuaCallNoclosure( 256290, "FinishShoubian", varMap, varPlayer)
end








function x300859_QuestLogRefresh( varMap, varPlayer, varQuest)
	local varRet = x300859_CheckSubmit(varMap, varPlayer )
	local varStr=""
	if varRet==1 then
		varStr = "守边(1/1)"
	else
		varStr= "守边(0/1)"
	end
	
	local fixInh = RefixInherenceExp( varMap, varPlayer, 180)		
	StartTalkTask(varMap)	
			local varLevel = GetLevel(varMap, varPlayer)
			local nExpBonus1 = varLevel*15000*x300859_var_Exp_Drop
			local nExpBonus2 = varLevel*15000*x300859_var_Exp_Drop
			local varExpBonus = 0
			if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
				varExpBonus = nExpBonus1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				varExpBonus = nExpBonus2;
			end
			local varDayCount = x300859_GetDayCount(varMap, varPlayer)
			if varDayCount == 0 then
				local varLevel =GetLevel (varMap,varPlayer)
				local varExpBonus = floor(varExpBonus *0.15*0.3)
				if varLevel >=80 then
				AddQuestExpBonus(varMap,  varExpBonus);
				AddQuestMoneyBonus6(varMap, 15 )
					AddQuestInherenceExpBonus(varMap,fixInh)
				else
					AddQuestExpBonus(varMap,  varExpBonus);
					AddQuestMoneyBonus6(varMap, 15 )
				end
			elseif varDayCount == 1 then
				local varLevel =GetLevel (varMap,varPlayer)
				local varExpBonus = floor(varExpBonus *0.5*0.3)
				if varLevel >=80 then
				AddQuestExpBonus(varMap,  varExpBonus);
				AddQuestMoneyBonus6(varMap, 35 )
					AddQuestInherenceExpBonus(varMap,fixInh)
				else
				AddQuestExpBonus(varMap,  varExpBonus);
				AddQuestMoneyBonus6(varMap, 35 )
				end
			elseif varDayCount == 2 then
				local varExpBonus = floor(varExpBonus *0.5*0.7)
				if varLevel >=80 then
				AddQuestExpBonus(varMap,  varExpBonus);
				AddQuestMoneyBonus6(varMap, 50 )
					AddQuestInherenceExpBonus(varMap,fixInh)
				else
				AddQuestExpBonus(varMap,  varExpBonus);
				AddQuestMoneyBonus6(varMap, 50 )
			end		
			end		
		
	AddQuestLogCustomText( varMap,
							"",						
							"【国家】国家守边",        
							"  驻守@npc_54035".."十分钟",
							"@npc_131510",			
							"",               
							"  您接受任务后，守卫边塞，在@npc_131511附近守卫，每隔一段时间，会自动获得经验奖励。经过一段时间即可向@npc_131510汇报军情，并完成任务得到奖励，当达到80级时可获得天赋值奖励。",	
							"  当您在国运令期间回复任务时，你将获得双倍的经验奖励！"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x300859_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300859_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300859_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	
end

function x300859_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end

function x300859_ProcessQuestFail(varMap, varPlayer, varQuest)
end

function x300859_ProcPlayerRelive(varMap, varPlayer, varMode)
	
	local varMyQuest = x300859_GetQuestId( varMap, varPlayer )
	
	if IsHaveQuestNM(varMap,varPlayer,varMyQuest) <= 0 then
        return 
    end

	if varMode==nil then
		varMode =0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	if varMode==0 then
		if IsPlayerStateNormal(varMap,varPlayer )<=0 then
			return
		end
	end

	


	

	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

	if varCompleted<1  then   
		
		if IsHaveSpecificImpact(varMap, varPlayer, x300859_var_BuffId)<=0 then 
		
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )  
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )  
			x300859_QuestLogRefresh( varMap, varPlayer, varMyQuest)
			
			local varMsg =GetName(varMap, varPlayer).."guojiashoubian: relive and no buff and set to completed"..varMode
			WriteLog(1,varMsg)
			
		end
	else  
		
		
		
		
		
		
		
	end
end

function x300859_ProcPlayerLogin(varMap, varPlayer)
	x300859_ProcPlayerRelive(varMap, varPlayer, 1)
end







