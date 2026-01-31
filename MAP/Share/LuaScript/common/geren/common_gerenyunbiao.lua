--DECLARE_QUEST_INFO_START--
x300622_var_FileId 	  = 300622
x300622_var_QuestKind 				= 	1                       
x300622_var_Mis_Count   = 1
x300622_var_LevelLess					= 	50 

x300622_var_QuestName = "【个人】官府押运"

x300622_var_NPCDialog = "\t我是官府任命的矿主，负责将这里产出的黄金发往王国各地。但是现在世道太乱，敌对势力经常通过武力抢夺我们的黄金，我看兄台气宇不凡，能否帮助我运送黄金？"

x300622_var_QuestInfo = "\t您可以通过矿主哈尔巴拉并花费#g10两现银#w就可以领取一辆#g马车#w，当您将马车安全护送到指定地点，系统将会给与您#g海量经验#w。\n"

x300622_var_QuestHelp = "\t#g护送途中如果您离开马车过远，马车会意识到危险而停止前进。\n\t#g如果马车受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t#g当您离开马车一段时间或掉线，马车将消失，此时任务失败。"

x300622_var_QuestTarget = "  将马车交给@npc_129325"
x300622_var_NPCName = "@npc_129325"
x300622_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
x300622_var_QuestCompleted = "您已经将官府交给您的马车安全护送到此了？请收下官府给您的奖励！"
--DECLARE_QUEST_INFO_STOP--


x300622_var_coef1 = 1000

x300622_var_coef2 = 0.3

x300622_var_coef3 = 20
x300622_var_coef4 =1 
x300622_var_coef5 = 2 



x300622_var_yajin = 10000
x300622_var_BusScriptId = 300623

x300622_var_QuestID = 7010;

x300622_var_MinLevel = 50

x300622_var_MaxLevel = 100
x300622_var_BusIndex = 3


function x300622_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
  	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then		
		
		local playerLevel = GetLevel( varMap, varPlayer);
		if( playerLevel >= x300622_var_MinLevel and playerLevel <= x300622_var_MaxLevel) then
			local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300622_var_QuestID);
			TalkAppendString(varMap, x300622_var_NPCDialog );
			TalkAppendButton( varMap, x300622_var_QuestID, x300622_var_QuestName, 5);
		end
		
	end

	return 0
end



function x300622_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300622_var_QuestName);
		TalkAppendString(varMap, x300622_var_QuestInfo)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300622_var_QuestTarget)
		
		if x300622_var_QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x300622_var_QuestHelp )
		end
		
		
		
		
		local playerLevel = GetLevel( varMap, varPlayer);
		
		local varExperience = x300622_var_coef1 * x300622_var_coef2 * playerLevel * x300622_var_coef3;
		AddQuestExpBonus( varMap, varExperience);
		
		
	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300622_var_FileId, x300622_var_QuestID);
end





function x300622_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
	
	StartTalkTask(varMap)

	
	TalkAppendString(varMap,"#Y"..x300622_var_QuestName)
	TalkAppendString(varMap,x300622_var_QuestCompleted)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = ceil ( (1000 * 0.3 * varLevel * 20 ) )
	if varExpBonus> 0 then
		AddQuestExpBonus(varMap, varExpBonus )
	end
			
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300622_var_FileId , x300622_var_QuestID);

end


function x300622_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		x300622_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 	
	else
		local varBusID = IsBusMember(varMap, varPlayer);
		if(varBusID ~= 1) then
			if varExtIdx ~= x300622_var_FileId then
				x300622_DispatchQuestInfo( varMap, varPlayer, varTalknpc);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"你没有此任务！")
				StopTalkTask()
				DeliverTalkMenu(varMap,varPlayer,varTalknpc);
			end
		else
				local varText = "您已处于护送状态，无法领取新的护送任务！"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				local varReadme = "您已处于护送状态，无法领取新的护送任务！"
				Msg2Player(varMap,varPlayer,varReadme,8,2)
		end			
	end
		  
end





function x300622_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end

	if x300622_GetDayCount(varMap, varPlayer) >= x300622_var_Mis_Count then
		local varReadme = "很抱歉，您今天任务次数已满，请明天再来做吧！" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	if IsTeamFollow(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "组队跟随状态下不可以接护送任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "组队跟随状态下不可以接护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
		
	local CurrMoney = GetMoney(varMap , varPlayer ,0)
	if CurrMoney < x300622_var_yajin then
		local varReadme = "很抱歉，您包裹中的现银不够支付押金，无法接取任务！" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end			
	LuaCallNoclosure( x300622_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,varQuest,x300622_var_BusIndex)
	
	
	
end





function x300622_ProcAccept( varMap, varPlayer )
	
end



function x300622_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
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
		local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
		if varRet > 0 then 
		local varRet = DelQuestNM( varMap, varPlayer, varQuest ) 
		if varRet == 1 then 

			
			GamePlayScriptLog(varMap,varPlayer,72)

			x300622_SetDayCount(varMap, varPlayer)

			local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
			if varRet == 1  then   
				local varLevel = GetLevel(varMap,varPlayer)
				local varExp = ceil (( x300622_var_coef1 * x300622_var_coef2 * varLevel * x300622_var_coef3*x300622_var_coef5 ))
				AddExp(varMap, varPlayer,varExp)	
				local varLevel = GetLevel(varMap,varPlayer)
				local varExp1 = ceil (( x300622_var_coef1 * x300622_var_coef2 * varLevel * x300622_var_coef3*x300622_var_coef4 ))
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
				local varExp = ceil (( x300622_var_coef1 * x300622_var_coef2 * varLevel * x300622_var_coef3*x300622_var_coef4 ))
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
			
			local varBusID  =  GetBusId(varMap, varPlayer)
		  	if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
		  	    
				if GetBusQuestID(varMap, varBusID) == varQuest then
					
					DeleteBus(varMap, varBusID,1)
				end
		  	end     
		end
	end

	return 0
	
end





function x300622_ProcQuestAbandon( varMap, varPlayer,varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	if IsBusMember(varMap, varPlayer) == 1 then
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			if GetBusQuestID(varMap, varBusID) == varQuest then
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

	DelQuestNM( varMap, varPlayer, varQuest)
	local varReadme = "您放弃了任务：【个人】官府押运"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	x300622_SetDayCount(varMap, varPlayer)
  	
end


function x300622_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	if varTalkNpcGUID == submitGuid then	
		TalkAppendButtonNM( varMap, varPlayer, -1, varQuest, 7, x300622_var_FileId ) 
	end
end






function x300622_QuestLogRefresh( varMap, varPlayer, varQuest)

		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
		if varHaveQuest > 0 then
		
			StartTalkTask(varMap)	
			local varLevel = GetLevel(varMap, varPlayer)
			local varExpBonus = ceil (( x300622_var_coef1 * x300622_var_coef2 * varLevel * x300622_var_coef3 ))
		    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,varExpBonus);
			end
		    AddQuestLogCustomText( varMap,
									"",							
									x300622_var_QuestName,      
									x300622_var_QuestTarget,	
									x300622_var_NPCName,			
									x300622_var_QuestHelp,      
									x300622_var_QuestInfo,		
									""							
									)
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		end
end

function x300622_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300622_QuestLogRefresh( varMap, varPlayer, varQuest );
end




function x300622_GetDayCount(varMap, varPlayer)

	if x300622_var_Mis_Count > 0 then

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




function x300622_SetDayCount(varMap, varPlayer)
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

