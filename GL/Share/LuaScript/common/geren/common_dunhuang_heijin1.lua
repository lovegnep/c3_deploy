--DECLARE_QUEST_INFO_START--

x300846_var_FileId 	  = 300846
x300846_var_QuestKind 				= 	1                       
x300846_var_Mis_Count   = 3
x300846_var_QuestId = 7608;
x300846_var_LevelLess	=	30
x300846_var_QuestKind 				= 	1                        

x300846_var_NPCDialog = "\t我是官府任命的矿主，负责将这里产出的黄金发往王国各地。但是现在世道太乱，敌对势力经常通过武力抢夺我们的黄金，我看兄台气宇不凡，能否帮助我运送黄金？"

x300846_var_ContinueInfo				= 	"\t如果不清除这些阿兰人，送往中国的贡品就不会按时完成。"
x300846_var_QuestCompleted			= 	"\t您已经将官府交给您的马车安全护送到此了？请收下官府给您的奖励！"


x300846_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
--DECLARE_QUEST_INFO_STOP--

x300846_var_BusScriptId = 300852


x300846_var_SubQuestID = {	  { varQuest=7608, varQuestName = "【个人】官府押运", varQuestTarget = "  将马车交给@npc_132154", QuestInfo = "\t您可以通过王国押运官并花费#G1两现银（银卡）#W就可以领取一辆#G马车#W，当您将马车安全护送到指定地点，系统将会给与您#G海量经验#W。\n",QuestHelp = "\t#G护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#G如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#G当您离开马车一段时间或掉线，马车将消失，此时任务失败。\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。", SubmitNPCGUID = 132154, varCostMoney =1000, coef1 = 100,coef2 = 2.5,coef3 = 20,coef4 =1,coef5 =2,NPCName = "@npc_132154",Questruse="将马车送到敦煌外城的@npc_132154处！",AcceptId = 51,SubmitId = 52,varLevelLess = 30,varLevelMax = 40 }, 
							  {	varQuest=7609, varQuestName = "【个人】官府押运", varQuestTarget = "  将马车交给@npc_134515", QuestInfo = "\t您可以通过王国押运官并花费#G2两现银（银卡）#W就可以领取一匹#G马车#W，当您将马车安全护送到指定地点，系统将会给与您#G海量经验#W。\n",QuestHelp = "\t#G护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#G如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#G当您离开马车一段时间或掉线，马车将消失，此时任务失败。\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。", SubmitNPCGUID = 134515, varCostMoney = 2000, coef1 = 100,coef2 = 2.5,coef3 = 20,coef4 =1,coef5 =2,NPCName = "@npc_134515",Questruse="将马车送到敦煌古道的@npc_134515处！",AcceptId = 61,SubmitId = 62,varLevelLess = 40,varLevelMax = 50 },
							  {	varQuest=7610, varQuestName = "【个人】官府押运", varQuestTarget = "  将马车交给@npc_134514", QuestInfo = "\t您可以通过王国押运官并花费#G3两现银（银卡）#W就可以领取一辆#G马车#W，当您将马车安全护送到指定地点，系统将会给与您#G海量经验#W。\n",QuestHelp = "\t#G护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#G如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#G当您离开马车一段时间或掉线，马车将消失，此时任务失败。\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。",SubmitNPCGUID = 134514, varCostMoney = 3000,coef1 = 100,coef2 = 2.5,coef3 = 20,coef4 =1,coef5 =2,NPCName = "@npc_134514",Questruse="将马车送到边塞的@npc_134514处！",AcceptId = 71,SubmitId = 72,varLevelLess = 50,varLevelMax = 60 },
							  {	varQuest=7611, varQuestName = "【个人】官府押运", varQuestTarget = "  将马车交给@npc_134514", QuestInfo = "\t您可以通过王国押运官并花费#G5两现银（银卡）#W就可以领取一辆#G马车#W，当您将马车安全护送到指定地点，系统将会给与您#G海量经验#W。\n",QuestHelp = "\t#G护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#G如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#G当您离开马车一段时间或掉线，马车将消失，此时任务失败。\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。",SubmitNPCGUID = 134514, varCostMoney = 5000,coef1 = 100,coef2 = 2.5,coef3 = 20,coef4 =1,coef5 =2,NPCName = "@npc_134514",Questruse="将马车送到边塞的@npc_134514处！",AcceptId = 81,SubmitId = 82,varLevelLess = 60,varLevelMax = 70 },
							  { varQuest=7612, varQuestName = "【个人】官府押运", varQuestTarget = "  将马车交给@npc_134514", QuestInfo = "\t您可以通过王国押运官并花费#G6两现银（银卡）#W就可以领取一辆#G马车#W，当您将马车安全护送到指定地点，系统将会给与您#G海量经验#W。\n",QuestHelp = "\t#G护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#G如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#G当您离开马车一段时间或掉线，马车将消失，此时任务失败。\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。",SubmitNPCGUID = 134514, varCostMoney = 6000,coef1 = 100,coef2 = 2.5,coef3 = 20,coef4 =1,coef5 =2,NPCName = "@npc_134514",Questruse="将马车送到边塞的@npc_134514处！",AcceptId = 741,SubmitId = 742,varLevelLess = 70,varLevelMax = 80 },
							  { varQuest=7613, varQuestName = "【个人】官府押运", varQuestTarget = "  将马车交给@npc_134514", QuestInfo = "\t您可以通过王国押运官并花费#G7两500文现银（银卡）#W就可以领取一辆#G马车#W，当您将马车安全护送到指定地点，系统将会给与您#G海量经验#W。\n",QuestHelp = "\t#G护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#G如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#G当您离开马车一段时间或掉线，马车将消失，此时任务失败\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。",SubmitNPCGUID = 134514, varCostMoney = 7500,coef1 = 100,coef2 = 2.5,coef3 = 20,coef4 =1,coef5 =2,NPCName = "@npc_134514",Questruse="将马车送到边塞的@npc_134514处！",AcceptId = 751,SubmitId = 752,varLevelLess = 80,varLevelMax = 150 },
						}


function x300846_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
end



function x300846_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	
	local varIndex = 1
	for varI,itm in x300846_var_SubQuestID do
		if varI == varExtIdx then
			varQuest = itm.varQuest
			varIndex = varI
			break
		end
	end

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest > 0) then
		local varDone = x300846_CheckSubmit(varMap, varPlayer, varTalknpc,varIndex);
		if(varDone > 0) then
			if varExtIdx ~= -1 then
				x300846_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varIndex) 
			end
		else
			if varExtIdx ~= -1 then
				x300846_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varIndex ) 
			end
		end
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if x300846_var_SubQuestID[varIndex].SubmitNPCGUID ~= varTalkNpcGUID then
			x300846_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )	
		else
			StartTalkTask(varMap)

			
			TalkAppendString(varMap,"你没有此任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		end
	end
		  
end



function x300846_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300846_var_SubQuestID[varIndex].varQuestName);
		TalkAppendString(varMap, x300846_var_SubQuestID[varIndex].QuestInfo)
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300846_var_SubQuestID[varIndex].varQuestTarget)
		TalkAppendString( varMap, " ")
		
		if x300846_var_SubQuestID[varIndex].QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x300846_var_SubQuestID[varIndex].QuestHelp )
		end
		
		
		
		local varLevel = GetLevel( varMap, varPlayer);
		local varExperience = x300846_var_SubQuestID[varIndex].coef1 * x300846_var_SubQuestID[varIndex].coef2 * varLevel * x300846_var_SubQuestID[varIndex].coef3;
		if varLevel >= 70 then
			varExperience = varLevel*9000
		end
		AddQuestExpBonus( varMap, varExperience);

	StopTalkTask(varMap);

	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300846_var_FileId,  x300846_var_SubQuestID[varIndex].varQuest);
end





function x300846_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varIndex )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300846_var_SubQuestID[varIndex].varQuestName)
		TalkAppendString(varMap,format("%s", x300846_var_SubQuestID[varIndex].QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

  		

		
		local varLevel = GetLevel( varMap, varPlayer);
		local varExperience = x300846_var_SubQuestID[varIndex].coef1 * x300846_var_SubQuestID[varIndex].coef2 * varLevel * x300846_var_SubQuestID[varIndex].coef3;
		if varLevel >= 70 then
			varExperience = varLevel*9000
		end
		AddQuestExpBonus( varMap, varExperience);

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300846_var_FileId, x300846_var_SubQuestID[varIndex].varQuest,0);

end





function x300846_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varIndex )
	
	StartTalkTask(varMap)

	
	TalkAppendString(varMap,"#Y"..x300846_var_SubQuestID[varIndex].varQuestName)
	TalkAppendString(varMap,x300846_var_QuestCompleted)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = ceil ( (x300846_var_SubQuestID[varIndex].coef1 * x300846_var_SubQuestID[varIndex].coef2 * varLevel * x300846_var_SubQuestID[varIndex].coef3 ) )
	if varLevel >= 70 then
		varExpBonus = varLevel*9000
	end
	if varExpBonus> 0 then
		AddQuestExpBonus(varMap, varExpBonus )
	end
			
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300846_var_FileId , x300846_var_SubQuestID[varIndex].varQuest);

end




function x300846_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	--2011-4-13 by rj 增加对押运交付任务人通过外挂进行的接受任务操作
	local varTalkNpcGUID = GetMonsterGUID(varMap, varTalknpc)
	for i, item in x300846_var_SubQuestID do
		if varTalkNpcGUID == item.SubmitNPCGUID then
			return
		end
	end

	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能接此任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	local varCostMoney = 1000
	local varLevelLess = x300846_var_SubQuestID[1].varLevelLess
	local varLevelMax = x300846_var_SubQuestID[1].varLevelMax
	for varI,itm in x300846_var_SubQuestID do
		if itm.varQuest == varQuest then
			varCostMoney = itm.varCostMoney
			varLevelLess = itm.varLevelLess
			varLevelMax = itm.varLevelMax
			break
		end
	end

	if IsEnoughMoney(varMap, varPlayer,varCostMoney) ~=1 then
		local varReadme = "很抱歉，您包裹中的现银（银卡）不够支付押金，无法接取任务！" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local varLevel = GetLevel(varMap,varPlayer);
	if ( varLevel < varLevelLess or varLevel >= varLevelMax ) then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您的等级不能领取此任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您的等级不能领取此任务！" 
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

	if x300846_GetDayCount(varMap, varPlayer) >= x300846_var_Mis_Count then
		local varReadme = "很抱歉，您今天任务次数已满，请明天再来做吧！" 
	  	StartTalkTask(varMap)
		TalkAppendString(varMap,varReadme );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
		
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest > 0) then
		return 0;
	end

	for varI,itm in x300846_var_SubQuestID do
		if varQuest == itm.varQuest then
			LuaCallNoclosure( x300846_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,varQuest,varI)
			break
		end
	end

end




function x300846_CheckSubmit(varMap, varPlayer, varTalknpc,varIndex)
	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	if x300846_var_SubQuestID[varIndex].SubmitNPCGUID ~= varTalkNpcGUID then
		return 0
	end

	return 1;

end




function x300846_ProcAccept( varMap, varPlayer )
	
end



function x300846_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	
		return 0
	end

	
	local varValid = IsValidMyselfBus(varMap, varPlayer,varQuest)

	if varValid == 0 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "您护送的马车离您太远了，无法提交任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您护送的马车离您太远了，无法提交任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
   
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local varRet = DelQuest( varMap, varPlayer, varQuest) 

	if varRet == 1 then 
  LuaCallNoclosure( 256291, "FinishYayun", varMap, varPlayer)
		
	local level = GetLevel(varMap,varPlayer);
			if level >=60 then --20%添加百宝囊
				local randbai = random( 1, 5)
				if randbai == 1 then
					local bai = 12030143
					local bai80 = 12030144
					StartItemTask( varMap)
					if level >=80 then
						bai = bai80
					end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer,format( "完成官府押运任务，幸运的获得了1个@item_%d", bai), 8, 3)
				end
			end
    end		
		
		
		AddCountryStrength(varMap, varPlayer, 1)	
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "恭喜，您为国家实力榜贡献了#R1个#O积分。");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"恭喜，您为国家实力榜贡献了#R1个#O积分。",8,2)		
		
		local varIndex = 1
		for varI,itm in x300846_var_SubQuestID do
			if varQuest == itm.varQuest then
				
				GamePlayScriptLog(varMap,varPlayer,itm.SubmitId)
				varIndex = varI
				break;			
			end
		end

		x300846_SetDayCount(varMap, varPlayer)
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1  then   
			local varLevel = GetLevel(varMap,varPlayer)
			local varExp = ceil (( x300846_var_SubQuestID[varIndex].coef1 * x300846_var_SubQuestID[varIndex].coef2 * varLevel * x300846_var_SubQuestID[varIndex].coef3*x300846_var_SubQuestID[varIndex].coef5 ))	
			local varExp1 = ceil ((  x300846_var_SubQuestID[varIndex].coef1 * x300846_var_SubQuestID[varIndex].coef2 * varLevel * x300846_var_SubQuestID[varIndex].coef3*x300846_var_SubQuestID[varIndex].coef4 ))
			if varLevel >= 70 then
				varExp =varLevel*9000*2
				varExp1=varLevel*9000
			end
			AddExp(varMap, varPlayer,varExp)	
			local varReadme = "您完成了任务：【个人】官府押运#r获得#R经验"..varExp1.."点#o的奖励#r国运额外获得#R经验"..varExp1.."点#o的奖励"
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您完成了任务：【个人】官府押运");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap, "获得#R经验"..varExp1.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap, "国运额外获得#R经验"..varExp1.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			
		else
			local varLevel = GetLevel(varMap,varPlayer)
			
			local varExp = ceil ((  x300846_var_SubQuestID[varIndex].coef1 * x300846_var_SubQuestID[varIndex].coef2 * varLevel * x300846_var_SubQuestID[varIndex].coef3*x300846_var_SubQuestID[varIndex].coef4 ))
			
			if varLevel >= 70 then
				varExp = varLevel*9000
			end
			
			AddExp(varMap, varPlayer,varExp)	
			local varReadme =  "您完成了任务：【个人】官府押运#r获得#R经验"..varExp.."点#o的奖励"
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您完成了任务：【个人】官府押运");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap, "获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)
		end         
		
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
				local Onlyvalue = 0
					for varI = 0, 3 do
						if GetCountryParam(varMap, varI, CD_LASTWEEK_STRONG_WEAK_JIFEN) <= selfscore then
							Onlyvalue = Onlyvalue + 1
						end
					end
					if Onlyvalue == 1 then
							local randruo = random( 1, 5)
							if randruo ==1 then
								StartItemTask(varMap)
								ItemAppendBind( varMap, 12035211, 1 )				
								ItemAppendBind( varMap, 11990051, 1 )								
								local varRet = StopItemTask(varMap,varPlayer)
								if varRet > 0 then
										DeliverItemListSendToPlayer(varMap,varPlayer)
										Msg2Player( varMap, varPlayer,format( "完成官府押运任务，幸运的获得了1个@item_%d", 12035211), 8, 3)
										Msg2Player( varMap, varPlayer,format( "完成官府押运任务，获得了1个@item_%d", 11990051), 8, 3)
										GamePlayScriptLog(varMap,varPlayer,59)
								else
										Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)								
								end
							else
								StartItemTask(varMap)			
								ItemAppendBind( varMap, 11990051, 1 )								
								local varRet = StopItemTask(varMap,varPlayer)
								if varRet > 0 then
										DeliverItemListSendToPlayer(varMap,varPlayer)
										Msg2Player( varMap, varPlayer,format( "完成官府押运任务，获得了1个@item_%d", 11990051), 8, 3)
								else
										Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)								
								end	
							end
					end
			end
		end		
		
		
		
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			if GetBusQuestID(varMap, varBusID) == varQuest then
				DeleteBus(varMap, varBusID,1)
			end
		end 
		
		x300846_GuoYun(varMap, varPlayer, varQuest)
	end

	return 0
	
end





function x300846_ProcQuestAbandon( varMap, varPlayer,varQuest )

	for varI,itm in x300846_var_SubQuestID do
		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.varQuest );
		if varHaveQuest > 0 then

			if IsBusMember(varMap, varPlayer) == 1 then
				local varBusID  =  GetBusId(varMap, varPlayer)
				if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
					
					if GetBusQuestID(varMap, varBusID) == itm.varQuest then
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

			local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, itm.varQuest); 
			DelQuest(varMap, varPlayer, itm.varQuest);
							
			
			GamePlayScriptLog(varMap,varPlayer,itm.SubmitId+1)

			local varReadme = "您放弃了任务：【个人】官府押运"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varReadme);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)

			x300846_SetDayCount(varMap, varPlayer)

			break
		end
	end
  	
end


function x300846_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	for varI,itm in x300846_var_SubQuestID do
		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.varQuest );

		if varHaveQuest > 0 then
			if varTalkNpcGUID == itm.SubmitNPCGUID then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,itm.varQuest)
				TalkAppendButton(varMap, itm.varQuest, itm.varQuestName,7,varI);
				return
			end
		end
	end

end




function x300846_QuestLogRefresh( varMap, varPlayer, varQuest)

	for varI,itm in x300846_var_SubQuestID do 
		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.varQuest );
		if varHaveQuest > 0 then
		
			StartTalkTask(varMap)	
			local varLevel = GetLevel(varMap, varPlayer)
			local varExpBonus = ceil (( itm.coef1 * itm.coef2 * varLevel * itm.coef3 ))
			if varLevel >= 70 then
				varExpBonus = varLevel*9000
			end
		    if varExpBonus > 0 then
				AddQuestExpBonus(varMap,varExpBonus);
			end

			AddQuestLogCustomText( varMap,
									"",						
									itm.varQuestName,        
									itm.varQuestTarget,		
									itm.NPCName,			
									itm.Questruse,               
									itm.QuestInfo,	
									""					
									)
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, itm.varQuest);
			break
		end
	end

end

function x300846_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300846_QuestLogRefresh( varMap, varPlayer, varQuest );
end




function x300846_GetDayCount(varMap, varPlayer)

	if x300846_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_DATE[1], MD_MYSELF_CONVOY_DATE[2], MD_MYSELF_CONVOY_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3])
		return varDaycount

	end

	return 0
end




function x300846_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_DATE[1], MD_MYSELF_CONVOY_DATE[2], MD_MYSELF_CONVOY_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_DATE[1], MD_MYSELF_CONVOY_DATE[2], MD_MYSELF_CONVOY_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3], varDaycount+1)
	end
end

function x300846_GuoYun(varMap, varPlayer, varQuest)
	if CountryIsFortuneTime(varMap, varPlayer, 0) > 0 then
		local varCountry = GetCurCountry(varMap, varPlayer)
		SetCountryQuestData(varMap, varCountry, CD_INDEX_GUOYUN_COUNT, 1, 1 )
	end
end






