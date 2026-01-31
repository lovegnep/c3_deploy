--DECLARE_QUEST_INFO_START--

x300909_var_FileId 	  = 300909
x300909_var_QuestKind 				= 	1                       
x300909_var_Mis_Count   = 3
x300909_var_QuestId = 7032


x300909_var_ExtTarget					=	{ {type=20,n=1,target="战车"} }

x300909_var_ContinueInfo				= 	"\t如果不清除这些阿兰人，送往中国的贡品就不会按时完成。"
x300909_var_QuestCompleted			= 	"\t您已经将战车安全护送到此！请收下您应得的奖励！"

x300909_var_QuestName = "【个人】战车护送"
x300909_var_LevelLess = 70

x300909_var_BusScriptId = 300911

x300909_var_QuestTarget = "  将战车交给@npc_132154"
x300909_var_QuestInfo = "\t你知道#G屠城战#W吗？我们正为它的到来而#G备战#W，我急需一批勇士将战车护送到#G敦煌王城#W，交给#G阿鲁图#W，在你将战车顺利护送给他之后，会获得#G高额#W的#G经验#W奖励。\n\t每人每天只可护送#G三次#W战车，随着护送#G次数#W的#G增加#W，获得的#G经验#W也会越来越多，当然，#G花费#W的现银也会#G更多#W。本次护送，你需花费#R%d两#W现银。"
x300909_var_QuestHelp = "\t#G护送途中如果你离开战车过远，战车会因无人引导而停止前进！\n\t#G如果战车受到袭击被摧毁，任务失败！#G如果你离开战车超过5分钟，战车将丢失，任务失败！#G领取战车后，所花费的现银不会返还，#R国运期间#G会增加国家实力榜积分，#R同时获得#G双倍奖励！"
x300909_var_SubmitNPCGUID = 132154
x300909_var_NPCName = "@npc_132154"
x300909_var_Questruse="将战车送到敦煌王城的@npc_132154处！"

x300909_ChangleToggleWorld = {} --哪几个World开放经验奖励双倍

--15:28 2013/7/24 新加参数
x300909_var_nExpRate = 1			-- 经验比率
x300909_var_nMoneyRate = 0.048			-- 现银比率
x300909_var_nGoldsRate = 0.048			-- 金卡比率
--DECLARE_QUEST_INFO_STOP--
							

function x300909_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel(varMap,varPlayer)
	
	if varLevel < x300909_var_LevelLess then
		return
	end

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x300909_var_QuestId )
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varHaveQuest <= 0 then
		if x300909_var_SubmitNPCGUID ~= varTalkNpcGUID then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300909_var_QuestId)
			TalkAppendButton(varMap,x300909_var_QuestId,x300909_var_QuestName,varState,0);
		end
	end

end


function x300909_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
		if IsNewServer()==1 then
		--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
		--			Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到70级，无法进行战车押运！",8,3)
       	--	return 0
    --	end
    end

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300909_var_QuestId)
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	
	if x300909_var_SubmitNPCGUID ~= varTalkNpcGUID then
	
		if(varHaveQuest > 0) then
			local varDone = x300909_CheckSubmit(varMap, varPlayer, varTalknpc);
			if(varDone > 0) then
				if varExtIdx ~= -1 then
					x300909_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,0) 
				end
			else
				if varExtIdx ~= -1 then
					x300909_DispatchContinueInfo( varMap, varPlayer, varTalknpc,0 ) 
				end
			end
		else
			if x300909_var_SubmitNPCGUID ~= varTalkNpcGUID then
				x300909_DispatchQuestInfo( varMap, varPlayer, varTalknpc,0 )	
			else
				

				
				StartTalkTask(varMap)
				TalkAppendString(varMap,"你没有此任务！")
				StopTalkTask()
				DeliverTalkMenu(varMap,varPlayer,varTalknpc);
			end
		end
	else
	
		if(varHaveQuest > 0) then
			x300909_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,0) 
		
		
			
			
			
			
		end
	end
	
end


function x300909_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300909_var_QuestName);
		TalkAppendString(varMap, format(x300909_var_QuestInfo,x300909_CalcCostMoney(varMap, varPlayer)/1000) )
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300909_var_QuestTarget)
		TalkAppendString( varMap, " ")
		
		if x300909_var_QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x300909_var_QuestHelp )
		end
		
		
		
		local varExperience = x300909_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x300909_CalcMoney(varMap, varPlayer)
			if Money > 0 then
				AddQuestMoneyBonus2( varMap, Money)
			end
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x300909_CalcGolds(varMap, varPlayer)
			if Golsds > 0 then
				AddQuestMoneyBonus3( varMap, Golsds)	
			end		
		end

	StopTalkTask(varMap);

	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300909_var_FileId,  x300909_var_QuestId);
end





function x300909_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varIndex )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300909_var_QuestName)
		local info = format(x300909_var_QuestInfo,x300909_CalcCostMoney(varMap, varPlayer)/1000)
		TalkAppendString(varMap,format("%s", info))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

  		

		
		local varExperience = x300909_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x300909_CalcMoney(varMap, varPlayer)
			if Money > 0 then
				AddQuestMoneyBonus2( varMap, Money)
			end
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x300909_CalcGolds(varMap, varPlayer)
			if Golsds > 0 then
				AddQuestMoneyBonus3( varMap, Golsds)	
			end		
		end

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300909_var_FileId, x300909_var_QuestId,0);

end





function x300909_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varIndex )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300909_var_QuestName)
		TalkAppendString(varMap,x300909_var_QuestCompleted)
		TalkAppendString(varMap," ")

		
		local varExperience = x300909_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end
			
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x300909_CalcMoney(varMap, varPlayer)
			if Money > 0 then
				AddQuestMoneyBonus2( varMap, Money)
			end
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x300909_CalcGolds(varMap, varPlayer)
			if Golsds > 0 then
				AddQuestMoneyBonus3( varMap, Golsds)	
			end		
		end
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300909_var_FileId , x300909_var_QuestId);

end




function x300909_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	--2011-4-13 by rj 增加对押运交付任务人通过外挂进行的接受任务操作
	local varTalkNpcGUID = GetMonsterGUID(varMap, varTalknpc)
	if varTalkNpcGUID == x300909_var_SubmitNPCGUID then
		return
	end

	
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能接此任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x300909_var_LevelLess then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您的等级不能领取此任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您的等级不能领取此任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	if GetMoney(varMap, varPlayer,0) < x300909_CalcCostMoney(varMap, varPlayer) then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您身上的现银不足，不能领取战车！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您身上的现银不足，不能领取战车！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0;		
	end

	if IsTeamFollow(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "组队跟随状态下不可以接护送任务");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "组队跟随状态下不可以接护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	if IsBusMember(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已处于护送/押运状态，无法领取新的押运任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您已处于护送/押运状态，无法领取新的押运任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end

	if x300909_GetDayCount(varMap, varPlayer) >= x300909_var_Mis_Count then
		local varReadme = "很抱歉，您今天任务次数已满，请明天再来做吧！" 
	  	StartTalkTask(varMap)
		TalkAppendString(varMap,varReadme );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
		
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300909_var_QuestId);
	if(varHaveQuest > 0) then
		return 0;
	end
	
	
	local varCount = x300909_GetDayCount(varMap, varPlayer)
	LuaCallNoclosure( x300909_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,x300909_var_QuestId,varCount+1)

end




function x300909_CheckSubmit(varMap, varPlayer, varTalknpc)
	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	if x300909_var_SubmitNPCGUID ~= varTalkNpcGUID then
		return 0
	end

	return 1;

end




function x300909_ProcAccept( varMap, varPlayer )
	
end



function x300909_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	
		return 0
	end

	
	local varValid = IsValidMyselfBus(varMap, varPlayer,varQuest)

	if varValid == 0 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "您护送的战车离您太远了，无法提交任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您护送的战车离您太远了，无法提交任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
   
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local varRet = DelQuest( varMap, varPlayer, varQuest) 
	if varRet == 1 then 

		
		GamePlayScriptLog(varMap,varPlayer,1422)
		AddCountryStrength(varMap, varPlayer, 1)	
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "恭喜，您为国家实力榜贡献了#R1个#O积分。");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"恭喜，您为国家实力榜贡献了#R1个#O积分。",8,2)	
		
		local varReadme = "您完成了任务："..x300909_var_QuestName
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您完成了任务："..x300909_var_QuestName);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		local ret = CountryIsFortuneTime(varMap,varPlayer,0)
		if ret == 1  then   -- 国运令期间期间			
			local varExperience = x300909_CalcExperience(varMap, varPlayer)
			if varExperience > 0 then
				local varExp1 = varExperience * 2
				AddExp(varMap, varPlayer,varExp1)
				varReadme = varReadme .. "#r获得#R经验"..varExperience.."点#o的奖励#r国运令期间额外获得#R经验"..varExperience.."点#o的奖励"
				
				StartTalkTask(varMap)
				TalkAppendString(varMap, "获得#R经验"..varExperience.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				
				StartTalkTask(varMap)
				TalkAppendString(varMap, "国运令期间额外获得#R经验"..varExperience.."点#o的奖励")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
			if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
				local varMoney = x300909_CalcMoney(varMap, varPlayer)
				if varMoney > 0 then
					local Money = varMoney * 2
					local varMoney1 = floor(varMoney / 1000)
					AddMoney( varMap, varPlayer, 0, Money)
					varReadme = varReadme .. "#r获得#R银卡"..varMoney1.."两#o的奖励#r国运令期间额外获得#R银卡"..varMoney1.."两#o的奖励"
					
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R银卡"..varMoney1.."两#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					
					StartTalkTask(varMap)
					TalkAppendString(varMap, "国运令期间额外获得#R银卡"..varMoney1.."两#o的奖励")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end				
			elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
				local varGolds = x300909_CalcGolds(varMap, varPlayer)
				if varGolds > 0 then
					local Golds = varGolds * 2
					local varGolds1 = floor(varGolds / 1000)
					AddMoney( varMap, varPlayer, 3, Golds)
					varReadme = varReadme .. "#r获得#R金卡"..varGolds1.."两#o的奖励#r国运令期间额外获得#R金卡"..varGolds1.."两#o的奖励"
					
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R金卡"..varGolds1.."两#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					
					StartTalkTask(varMap)
					TalkAppendString(varMap, "国运令期间额外获得#R金卡"..varGolds1.."两#o的奖励")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end			
			end			
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			LuaCallNoclosure( 256223, "FinishYayun", varMap, varPlayer)			
		else
			local varExperience = x300909_CalcExperience(varMap, varPlayer)
			if varExperience > 0 then
				AddExp(varMap, varPlayer,varExperience)
				varReadme = varReadme .. "#r获得#R经验"..varExperience.."点#o的奖励"
			StartTalkTask(varMap)
				TalkAppendString(varMap, "获得#R经验"..varExperience.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end
			if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
				local varMoney = x300909_CalcMoney(varMap, varPlayer)
				if varMoney > 0 then
					AddMoney( varMap, varPlayer, 0, varMoney)
					local varMoney1 = floor(varMoney / 1000)
					varReadme = varReadme .. "#r获得#R银卡"..varMoney1.."两#o的奖励"
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R银卡"..varMoney1.."两#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end				
			elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
				local varGolds = x300909_CalcGolds(varMap, varPlayer)
				if varGolds > 0 then
					AddMoney( varMap, varPlayer, 3, varGolds)
					local varGolds1 = floor(varGolds / 1000)
					varReadme = varReadme .. "#r获得#R金卡"..varGolds1.."两#o的奖励"
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R金卡"..varGolds1.."两#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end			
			end			
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			LuaCallNoclosure( 256223, "FinishYayun", varMap, varPlayer)
		end
		        
		x300909_SetDayCount(varMap, varPlayer)
		
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			if GetBusQuestID(varMap, varBusID) == varQuest then
				DeleteBus(varMap, varBusID,1)
			end
		end 
		x300909_GuoYun(varMap, varPlayer, varQuest)
	end

	return 0
end





function x300909_ProcQuestAbandon( varMap, varPlayer,varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300909_var_QuestId );
	if varHaveQuest > 0 then

		if IsBusMember(varMap, varPlayer) == 1 then
			local varBusID  =  GetBusId(varMap, varPlayer)
			if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
				
				if GetBusQuestID(varMap, varBusID) == x300909_var_QuestId then
					DeleteBus(varMap, varBusID,1)
				end
			else
				local varReadme = "很抱歉，您与您的护送目标在同一场景才能放弃任务，请先找到您的护送目标再选择放弃！"
				StartTalkTask(varMap)
				TalkAppendString(varMap, "现在不能放弃任务！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,varReadme,8,2)
				return
			end				
		end

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300909_var_QuestId); 
		DelQuest(varMap, varPlayer, x300909_var_QuestId);
						
		
		GamePlayScriptLog(varMap,varPlayer,1424)

		local varReadme = "您放弃了任务：【个人】战车护送"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)

		x300909_SetDayCount(varMap, varPlayer)
	end

end


function x300909_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300909_var_QuestId )

	if varHaveQuest > 0 then
		if varTalkNpcGUID == x300909_var_SubmitNPCGUID then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300909_var_QuestId)
			TalkAppendButton(varMap, x300909_var_QuestId, x300909_var_QuestName,7,0);
		end
	end

end




function x300909_QuestLogRefresh( varMap, varPlayer, varQuest)

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300909_var_QuestId );
	if varHaveQuest > 0 then
	
		StartTalkTask(varMap)
		
		local varExperience = x300909_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x300909_CalcMoney(varMap, varPlayer)
			if Money > 0 then
				AddQuestMoneyBonus2( varMap, Money)
			end
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x300909_CalcGolds(varMap, varPlayer)
			if Golsds > 0 then
				AddQuestMoneyBonus3( varMap, Golsds)	
			end		
		end

		AddQuestLogCustomText( varMap,
								"",						
								x300909_var_QuestName,        
								x300909_var_QuestTarget,		
								x300909_var_NPCName,			
								x300909_var_Questruse,               
								format(x300909_var_QuestInfo,x300909_CalcCostMoney(varMap, varPlayer)/1000),	
								""					
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x300909_var_QuestId);
	end

end

function x300909_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300909_QuestLogRefresh( varMap, varPlayer, varQuest );
end




function x300909_GetDayCount(varMap, varPlayer)

	if x300909_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_DATE[1], MD_ZHANCHEYAYUN_DATE[2], MD_ZHANCHEYAYUN_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3])
		return varDaycount

	end

	return 0
end




function x300909_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_DATE[1], MD_ZHANCHEYAYUN_DATE[2], MD_ZHANCHEYAYUN_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_DATE[1], MD_ZHANCHEYAYUN_DATE[2], MD_ZHANCHEYAYUN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3], varDaycount+1)
	end
end


function x300909_CalcCostMoney(varMap, varPlayer)
	local varCount = x300909_GetDayCount(varMap, varPlayer)
	if varCount == 0 then
		return 75000
	elseif varCount == 1 then
		return 150000
	elseif varCount == 2 then
		return 225000
	end
	return 0
end


function x300909_CalcExperience(varMap, varPlayer)
	local varCount = x300909_GetDayCount(varMap, varPlayer)
	local varLevel = GetLevel(varMap,varPlayer)
	local Toggle = x300909_CheckMissonToggle( varMap, varPlayer )
	local zhancheexp = 0
	if varCount == 0 then
		if varLevel < 80 then
			zhancheexp = varLevel*30000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheexp = varLevel*30000*2
			else 
				zhancheexp = varLevel*30000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheexp = varLevel*30000*2.6
			else 
				zhancheexp = varLevel*30000*1.3
			end
		end
	elseif varCount == 1 then
		if varLevel < 80 then
			zhancheexp = varLevel*60000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheexp = varLevel*60000*2
			else 
				zhancheexp = varLevel*60000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheexp = varLevel*60000*2.6
			else 
				zhancheexp = varLevel*60000*1.3
			end
		end
	elseif varCount == 2 then
		if varLevel < 80 then
			zhancheexp = varLevel*100000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheexp = varLevel*100000*2
			else 
				zhancheexp = varLevel*100000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheexp = varLevel*100000*2.6
			else 
				zhancheexp = varLevel*100000*1.3
			end
		end
	end
	return zhancheexp * x300909_var_nExpRate
end
function x300909_CalcMoney(varMap, varPlayer)
	local varCount = x300909_GetDayCount(varMap, varPlayer)
	local varLevel = GetLevel(varMap,varPlayer)
	local Toggle = x300909_CheckMissonToggle( varMap, varPlayer )
	local zhancheMoney = 0
	if varCount == 0 then
		if varLevel < 80 then
			zhancheMoney = varLevel*30000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheMoney = varLevel*30000*2
			else 
				zhancheMoney = varLevel*30000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheMoney = varLevel*30000*2.6
			else 
				zhancheMoney = varLevel*30000*1.3
			end
		end
	elseif varCount == 1 then
		if varLevel < 80 then
			zhancheMoney = varLevel*60000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheMoney = varLevel*60000*2
			else 
				zhancheMoney = varLevel*60000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheMoney = varLevel*60000*2.6
			else 
				zhancheMoney = varLevel*60000*1.3
			end
		end
	elseif varCount == 2 then
		if varLevel < 80 then
			zhancheMoney = varLevel*100000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheMoney = varLevel*100000*2
			else 
				zhancheMoney = varLevel*100000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheMoney = varLevel*100000*2.6
			else 
				zhancheMoney = varLevel*100000*1.3
			end
		end
	end
	return zhancheMoney * x300909_var_nMoneyRate
end
function x300909_CalcGolds(varMap, varPlayer)
	local varCount = x300909_GetDayCount(varMap, varPlayer)
	local varLevel = GetLevel(varMap,varPlayer)
	local Toggle = x300909_CheckMissonToggle( varMap, varPlayer )
	local zhancheGolds = 0
	if varCount == 0 then
		if varLevel < 80 then
			zhancheGolds = varLevel*30000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheGolds = varLevel*30000*2
			else 
				zhancheGolds = varLevel*30000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheGolds = varLevel*30000*2.6
			else 
				zhancheGolds = varLevel*30000*1.3
			end
		end
	elseif varCount == 1 then
		if varLevel < 80 then
			zhancheGolds = varLevel*60000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheGolds = varLevel*60000*2
			else 
				zhancheGolds = varLevel*60000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheGolds = varLevel*60000*2.6
			else 
				zhancheGolds = varLevel*60000*1.3
			end
		end
	elseif varCount == 2 then
		if varLevel < 80 then
			zhancheGolds = varLevel*100000
		elseif varLevel >=80 and varLevel < 90 then
			if Toggle == 1 then
				zhancheGolds = varLevel*100000*2
			else 
				zhancheGolds = varLevel*100000
			end
		elseif varLevel >=90 and varLevel <200 then
			if Toggle == 1 then
				zhancheGolds = varLevel*100000*2.6
			else 
				zhancheGolds = varLevel*100000*1.3
			end
		end
	end
	return zhancheGolds * x300909_var_nGoldsRate
end

function x300909_GuoYun(varMap, varPlayer, varQuest)
	if CountryIsFortuneTime(varMap, varPlayer, 0) > 0 then
		local varCountry = GetCurCountry(varMap, varPlayer)
		SetCountryQuestData(varMap, varCountry, CD_INDEX_GUOYUN_COUNT, 1, 1 )
	end
end

--------------------------------------------------------------
-- 检测当前服务器是否开放
--------------------------------------------------------------
function x300909_CheckMissonToggle( varMap, varPlayer )
	local nToggle = 0		
		for i, item in x300909_ChangleToggleWorld do 
			if GetWorldIdEx() == item then
				nToggle = 1
				break
			end
		end
	return nToggle
end
