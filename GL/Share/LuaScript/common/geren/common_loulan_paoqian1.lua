--DECLARE_QUEST_INFO_START--

x300757_var_FileId 					= 	300757                  

x300757_var_QuestKind 				= 	1                       
x300757_var_LevelLess					= 	30                      

x300757_var_QuestTarget				= 	"将货物安全运到@npc_137501"          
x300757_var_QuestInfo				= 	"\t杀死@npc_72004的@npc_72005,找到@npc_137600"            
x300757_var_ContinueInfo				= 	"怎么还没人送货过来啊？今天送货的人呢？"  
x300757_var_QuestCompleted			= 	"一路辛苦了，这是给您的奖励，请收下！"  
x300757_var_QuestHelp				=	""          


x300757_var_ExtTarget					=	{ {type=20,n=1,target="@npc_72005"} }



x300757_var_BonusItem					=	{}	
x300757_var_BonusMoney6               =   0  

x300757_var_BonusChoiceItem           =   {}

x300757_var_Mis_Count   = 3				

--DECLARE_QUEST_INFO_STOP--


x300757_MP_ISCOMPLETE				= 7	


x300757_TARGET_ITEMID1				= -2



x300757_var_BusScriptId				= 300760


x300757_var_SubQuestID				=	{ { varQuest=7556, varQuestName = "【个人】黑金押运", varQuestTarget = "  将飞行器交给@npc_123829", QuestInfo = "\t一路小赚，押的少风险小啊。\n\t您可以通过王国押运官并抵押#G5两现银#W就可以领取一架#G飞行器#W，当您将飞行器安全护送到指定地点，系统将会#G返还押金#W并奖励您#G2两现银(银卡)#W工钱。\n\t有#G江湖请柬#W或#G朝廷请柬#W状态的玩家奖励为现银，否则奖励为银卡。\n",QuestHelp = "\t您必须#r绑定密保卡后#w才能领取任务，护送途中如果您离开飞行器过远，飞行器会意识到危险而#g停止前进#w。\n\t如果飞行器受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t当您离开飞行器一段时间或掉线，飞行器将消失，此时#g任务失败#w，您的#g押金#w将丢失。", SubmitNPCGUID = 123829, varCostMoney =5000, BonusMoney = 2000, varExpBonus = 0,NPCName = "@npc_123829",Questruse="将运金飞行器送到楼兰外城的@npc_123829处！",AcceptId = 281,SubmitId = 282,varLevelLess	= 30,varLevelMax = 40,BaoDanId=13080011 }, 
										  {	varQuest=7557, varQuestName = "【个人】黑金押运", varQuestTarget = "  将飞行器交给@npc_500113", QuestInfo = "\t略有风险，满足一点点小贪心。\n\t您可以通过王国押运官并抵押#G10两现银#W就可以领取一架#G飞行器#W，当您将飞行器安全护送到指定地点，系统将会#G返还押金#W并奖励您#G4两现银(银卡)#W工钱。\n\t有#G江湖请柬#W或#G朝廷请柬#W状态的玩家奖励为现银，否则奖励为银卡。\n",QuestHelp = "\t您必须#r绑定密保卡后#w才能领取任务，护送途中如果您离开飞行器过远，飞行器会意识到危险而#g停止前进#w。\n\t如果飞行器受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t当您离开飞行器一段时间或掉线，飞行器将消失，此时#g任务失败#w，您的#g押金#w将丢失。",	SubmitNPCGUID = 500113, varCostMoney = 10000, BonusMoney = 4000, varExpBonus = 0,NPCName = "@npc_500113",Questruse="将运金飞行器送到楼兰古道的@npc_500113处！",AcceptId = 291,SubmitId = 292,varLevelLess = 40,varLevelMax = 50,BaoDanId=13080012 },
										  {	varQuest=7558, varQuestName = "【个人】黑金押运", varQuestTarget = "  将飞行器交给@npc_125512", QuestInfo = "\t舍得，舍得，不舍哪会有得？下定决心才能大富大贵，风险大回报一定丰厚。\n\t您可以通过王国押运官并抵押#G15两现银#W就可以领取一架#G飞行器#W，当您将飞行器安全护送到指定地点，系统将会#G返还押金#W并奖励您#G6两现银(银卡)#W工钱。\n\t有#G江湖请柬#W或#G朝廷请柬#W状态的玩家奖励为现银，否则奖励为银卡。\n",QuestHelp = "\t您必须#r绑定密保卡后#w才能领取任务，护送途中如果您离开飞行器过远，飞行器会意识到危险而#g停止前进#w。\n\t如果飞行器受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t当您离开飞行器一段时间或掉线，飞行器将消失，此时#g任务失败#w，您的#g押金#w将丢失。",SubmitNPCGUID = 125512, varCostMoney = 15000,BonusMoney = 6000,varExpBonus = 0,NPCName = "@npc_125512",Questruse="将运金飞行器送到边塞的@npc_125512处！",AcceptId = 301,SubmitId = 302,varLevelLess = 50,varLevelMax = 60,BaoDanId=13080013 },
										  {	varQuest=7546, varQuestName = "【个人】黑金押运", varQuestTarget = "  将飞行器交给@npc_125512", QuestInfo = "\t舍得，舍得，不舍哪会有得？下定决心才能大富大贵，风险大回报一定丰厚。\n\t您可以通过王国押运官并抵押#G30两现银#W就可以领取一架#G飞行器#W，当您将飞行器安全护送到指定地点，系统将会#G返还押金#W并奖励您#G12两现银(银卡)#W工钱。\n\t有#G江湖请柬#W或#G朝廷请柬#W状态的玩家奖励为现银，否则奖励为银卡。\n",QuestHelp = "\t您必须#r绑定密保卡后#w才能领取任务，护送途中如果您离开飞行器过远，飞行器会意识到危险而#g停止前进#w。\n\t如果飞行器受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t当您离开飞行器一段时间或掉线，飞行器将消失，此时#g任务失败#w，您的#g押金#w将丢失。",SubmitNPCGUID = 125512, varCostMoney = 30000,BonusMoney = 12000,varExpBonus = 0,NPCName = "@npc_125512",Questruse="将运金飞行器送到边塞的@npc_125512处！",AcceptId = 761,SubmitId = 762,varLevelLess = 60,varLevelMax = 70,BaoDanId=13080014 },
										  { varQuest=7547, varQuestName = "【个人】黑金押运", varQuestTarget = "  将飞行器交给@npc_125512", QuestInfo = "\t舍得，舍得，不舍哪会有得？下定决心才能大富大贵，风险大回报一定丰厚。\n\t您可以通过王国押运官并抵押#G40两现银#W就可以领取一架#G飞行器#W，当您将飞行器安全护送到指定地点，系统将会#G返还押金#W并奖励您#G16两现银(银卡)#W工钱。\n\t有#G江湖请柬#W或#G朝廷请柬#W状态的玩家奖励为现银，否则奖励为银卡。\n",QuestHelp = "\t您必须#r绑定密保卡后#w才能领取任务，护送途中如果您离开飞行器过远，飞行器会意识到危险而#g停止前进#w。\n\t如果飞行器受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t当您离开飞行器一段时间或掉线，飞行器将消失，此时#g任务失败#w，您的#g押金#w将丢失。",SubmitNPCGUID = 125512, varCostMoney = 40000,BonusMoney = 16000,varExpBonus = 0,NPCName = "@npc_125512",Questruse="将运金飞行器送到边塞的@npc_125512处！",AcceptId = 771,SubmitId = 772,varLevelLess = 70,varLevelMax = 80,BaoDanId=13080015 },
										  { varQuest=7548, varQuestName = "【个人】黑金押运", varQuestTarget = "  将飞行器交给@npc_125512", QuestInfo = "\t舍得，舍得，不舍哪会有得？下定决心才能大富大贵，风险大回报一定丰厚。\n\t您可以通过王国押运官并抵押#G50两现银#W就可以领取一架#G飞行器#W，当您将飞行器安全护送到指定地点，系统将会#G返还押金#W并奖励您#G20两现银(银卡)#W工钱。\n\t有#G江湖请柬#W或#G朝廷请柬#W状态的玩家奖励为现银，否则奖励为银卡。\n",QuestHelp = "\t您必须#r绑定密保卡后#w才能领取任务，护送途中如果您离开飞行器过远，飞行器会意识到危险而#g停止前进#w。\n\t如果飞行器受到袭击并死亡，您的任务将失败，同时押金将被抢走。\n\t当您离开飞行器一段时间或掉线，飞行器将消失，此时#g任务失败#w，您的#g押金#w将丢失。",SubmitNPCGUID = 125512, varCostMoney = 50000,BonusMoney = 20000,varExpBonus = 0,NPCName = "@npc_125512",Questruse="将运金飞行器送到边塞的@npc_125512处！",AcceptId = 781,SubmitId = 782,varLevelLess = 80,varLevelMax = 150,BaoDanId=13080016 },
										}
						


x300757_var_nGoldsRate = 10			-- 金卡比率

function x300757_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0;
end




function x300757_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,varExtIdx)	
		
	local varIndex = 1
	for varI,itm in x300757_var_SubQuestID do
		if varI == varExtIdx then
			varQuest = itm.varQuest
			varIndex = varI
			break
		end
	end

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest > 0) then
		local varDone = x300757_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex);
		if(varDone > 0) then
			if varExtIdx ~= -1 then
				x300757_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varIndex) 
			end
		else
			if varExtIdx ~= -1 then
				x300757_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varIndex ) 
			end
		end
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if x300757_var_SubQuestID[varIndex].SubmitNPCGUID ~= varTalkNpcGUID then
			x300757_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )	
		else
			StartTalkTask(varMap)

			
			TalkAppendString(varMap,"你没有此任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		end
	end
end




function x300757_ProcAcceptCheck( varMap, varPlayer,varQuest )
	
	local bindCard = IsBindPWCard(varMap, varPlayer)
	local bindPhone = IsBindPhone(varMap, varPlayer)
	local PWCardEnable = PWCardEnable(varMap, varPlayer)
		
	if PWCardEnable == 1 and bindCard == 0 and bindPhone == 0 then
		local varReadme = "帐号绑定卡片密保或电话密保后您才能接受该任务,详细资讯请参见官方网站帐号中心"	
		
		
		
		
		
		
		Msg2Player(varMap,varPlayer,varReadme,8,2)	
		ShowMsgBoxMibaoka(varMap,varPlayer,0)
		return 0
	end
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能接此任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	
	for BaoDanId,BaoDanItm in x300757_var_SubQuestID do
		if HaveItem(varMap, varPlayer, BaoDanItm.BaoDanId) > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"有保单时不能在接此任务")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
	end

	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	local money = GetMoney(varMap, varPlayer,0)	
	local varCostMoney = 10000
	local varLevelLess = x300757_var_SubQuestID[1].varLevelLess
	local varLevelMax = x300757_var_SubQuestID[1].varLevelMax
	for varI,itm in x300757_var_SubQuestID do
		if itm.varQuest == varQuest then
			varCostMoney = itm.varCostMoney
			varLevelLess = itm.varLevelLess
			varLevelMax = itm.varLevelMax
			break
		end
	end
	
	if money < varCostMoney then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您身上的现银不足以支付押金，不能领取任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您身上的现银不足以支付押金，不能领取任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0;		
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
		TalkAppendString(varMap, "组队跟随状态下不可以接跑钱任务!");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "组队跟随状态下不可以接跑钱任务！" 
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
	
	if x300757_GetDayCount(varMap, varPlayer) >= x300757_var_Mis_Count then
	  	StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您今天任务次数已满，请明天再来做吧！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "很抱歉，您今天任务次数已满，请明天再来做吧！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest > 0) then
		return 0;
	else
				
				
				
				
		return 1;
	end
end




function x300757_ProcQuestAccept( varMap, varPlayer,varTalknpc,varQuest )

	--2011-4-13 by rj 增加对押运交付任务人通过外挂进行的接受任务操作
	local varTalkNpcGUID = GetMonsterGUID(varMap, varTalknpc)
	for i, item in x300757_var_SubQuestID do
		if varTalkNpcGUID == item.SubmitNPCGUID then
			return
		end
	end

	if ( x300757_ProcAcceptCheck( varMap, varPlayer,varQuest ) ~= 1 ) then
		
		return 0;
	end

	
	if GetGameOpenById(1018)>0 then
		local varRet = LuaCallNoclosure(300824, "StartDati", varMap, varPlayer, 1018);

		if varRet~=1 then
			return 0;
		end
	end
	
	
	for varI,itm in x300757_var_SubQuestID do
		if varQuest == itm.varQuest then
			LuaCallNoclosure( x300757_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,varQuest,varI)
			break
		end
	end

	
    
end

function  x300757_ProcDatiFail(varMap, varPlayer)

	if GetGameOpenById(1018)>0 then
		local varReadme = "答题失败，记次一次"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)

		x300757_SetDayCount(varMap, varPlayer)
	end
end

function x300757_ProcHeiJinDatiSuccess(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local varIndex = 1
	local nQuestId=0;

	
	for varI,itm in x300757_var_SubQuestID do
		if nLevel >= itm.varLevelLess and nLevel<itm.varLevelMax then
			nQuestId = itm.varQuest
			varIndex = varI
			break
		end
	end

	if nQuestId==0 then
		return
	end


	local PosX,PosZ = GetWorldPos(varMap, varPlayer)
	local varX=205
	local z=172

	local dis = (PosX-varX)*(PosX-varX)+(PosZ-z)*(PosZ-z)

	if dis>18 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "距离太远，不能接任务");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	

	if ( x300757_ProcAcceptCheck( varMap, varPlayer,nQuestId ) ~= 1 ) then
		
		return 0;
	end

	for varI,itm in x300757_var_SubQuestID do
		if nQuestId == itm.varQuest then
			LuaCallNoclosure( x300757_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,nQuestId,varI)
			break
		end
	end

	AddExp(varMap, varPlayer,500)  

end




function x300757_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	if x300757_var_SubQuestID[varIndex].SubmitNPCGUID ~= varTalkNpcGUID then
		return 0
	end

	return 1;

end




function x300757_ProcQuestAbandon(varMap, varPlayer, varQuest)

	for varI,itm in x300757_var_SubQuestID do
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
			
			
			local ItemCnt = GetItemCount( varMap, varPlayer, itm.BaoDanId )
			if ItemCnt > 0 then 
				if DelItem(varMap, varPlayer,itm.BaoDanId,1) ~= 1 then return 0 end
			end

			local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, itm.varQuest); 
			DelQuest(varMap, varPlayer, itm.varQuest);
							
			
			GamePlayScriptLog(varMap,varPlayer,itm.SubmitId+1)

			local varReadme = "您放弃了任务：【个人】黑金押运"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varReadme);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)

			x300757_SetDayCount(varMap, varPlayer)

			break
		end
	end

end




function x300757_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )

	local BonusMoney = 0
	local varExpBonus = 0
	local varCostMoney = 0
	for varI,itm in x300757_var_SubQuestID do
		if varQuest == itm.varQuest then
			BonusMoney = itm.BonusMoney
			varExpBonus = itm.varExpBonus
			varCostMoney = itm.varCostMoney
			break
		end
	end

	
    if varExpBonus > 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		varExpBonus = varExpBonus * varLevel
		AddExp(varMap, varPlayer, varExpBonus);
		
		
		
		
  		
	end

	if BonusMoney > 0 then

	local buffId1 = 9011
	local buffId2 = 9013
	local buffId3 = 9012
	
	local bHaveImpact1 = IsHaveSpecificImpact( varMap, varPlayer, buffId1 )
	local bHaveImpact2 = IsHaveSpecificImpact( varMap, varPlayer, buffId2 )
	local bHaveImpact3 = IsHaveSpecificImpact( varMap, varPlayer, buffId3 )


		if (bHaveImpact1==1 or bHaveImpact2 == 1 ) then
		StartTalkTask(varMap)
		local  Money = floor(BonusMoney/1000)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您完成了任务了：【个人】黑金押运");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"获得#R现银"..Money.."两#o的奖励");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"您完成了任务了：【个人】黑金押运#r获得#R现银"..Money.."两#o的奖励",8,2)

		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1  then   
			BonusMoney = BonusMoney * 2
			StartTalkTask(varMap)
			TalkAppendString(varMap,"国运期间额外获得#R现银"..Money.."两#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"国运期间额外#r获得#R现银"..Money.."两#o的奖励",8,2)
		end

	    AddMoney( varMap, varPlayer, 0, BonusMoney )
		elseif (bHaveImpact3 == 1) then
			BonusMoney = BonusMoney * x300757_var_nGoldsRate
			StartTalkTask(varMap)
			local  Money = floor(BonusMoney / 1000)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您完成了任务了：【个人】黑金押运");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"获得#R金卡"..Money.."两#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"您完成了任务了：【个人】黑金押运#r获得#R金卡"..Money.."两#o的奖励",8,2)

			local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
			if varRet == 1  then   
				BonusMoney = BonusMoney * 2
				StartTalkTask(varMap)
				TalkAppendString(varMap,"国运期间额外获得#R金卡"..Money.."两#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"国运期间额外#r获得#R金卡"..Money.."两#o的奖励",8,2)
			end
			AddMoney( varMap, varPlayer, 3, BonusMoney )
   else
       	StartTalkTask(varMap)
		local  Money = floor(BonusMoney/1000)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您完成了任务了：【个人】黑金押运");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"获得#R银卡"..Money.."两#o的奖励");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"您完成了任务了：【个人】黑金押运#r获得#R银卡"..Money.."两#o的奖励",8,2)

		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1  then   
			BonusMoney = BonusMoney * 2
			StartTalkTask(varMap)
			TalkAppendString(varMap,"国运期间额外获得#R银卡"..Money.."两#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"国运期间额外#r获得#R银卡"..Money.."两#o的奖励",8,2)
		end

	    AddMoney( varMap, varPlayer, 1, BonusMoney )

		end
		
	end

	
	if varCostMoney > 0 then
		AddMoney( varMap, varPlayer, 0, varCostMoney )
		local  Money = floor(varCostMoney/1000)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"返还押金#R现银"..Money.."两");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,format("返还押金#R现银"..Money.."两"),8,2)
	end
		
 	
	for varI, item in x300757_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300757_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			
			return
		end
    end

end




function x300757_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected,varQuest)

	if x300757_GetDayCount(varMap, varPlayer) >= x300757_var_Mis_Count then
		return
	end

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest <= 0) then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "你没有这个任务，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你没有这个任务，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0		
	end
	
	
	local varValid = IsValidMyselfBus(varMap, varPlayer,varQuest)
	if varValid == 0 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "飞行器离你太远了，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "飞行器离你太远了，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end

	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, varQuest);
	if varHaveQuest > 0 then

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)

		local result = x300757_CheckPlayerBagFull(varMap,varPlayer,varRadioSelected)
		if result == 1 then
			if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
				return
			end

			for varI,itm in x300757_var_SubQuestID do
				if varQuest == itm.varQuest then
					
					GamePlayScriptLog(varMap,varPlayer,itm.SubmitId)
					local ItemCnt = GetItemCount( varMap, varPlayer, itm.BaoDanId )
					if ItemCnt > 0 then 
						if DelItem(varMap, varPlayer,itm.BaoDanId,1) ~= 1 then return 0 end
					end
					
					
					local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
					if varRet == 1  then   
						local addMoney = itm.varCostMoney * 0.4
						local addMoney1 =itm.varCostMoney * 0.4/1000
						 StartTalkTask(varMap)
						TalkAppendString(varMap, "国运期间您为国家资源贡献了#R"..addMoney1.."两#O金钱");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
						local varReadme = "国运期间您为国家资源贡献了#R"..addMoney1.."两#O金钱" 
						Msg2Player(varMap,varPlayer,varReadme,8,2)
						AddCountryResource( varMap,varPlayer,2,addMoney,0 )
						
					end

					break;			
				end
			end
			
			x300757_GetBonus( varMap,varPlayer,varTalknpc,varRadioSelected,varQuest )

			x300757_SetDayCount(varMap, varPlayer)
						
			local varBusID  =  GetBusId(varMap, varPlayer)
		  	if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
		     	
				if GetBusQuestID(varMap, varBusID) == varQuest then
		  			DeleteBus(varMap, varBusID,1)
				end
		  	end 
		else
			StartTalkTask( varMap )
			TalkAppendString( varMap,"包裹已满！")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer);
		end

	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end

end




function x300757_CheckPlayerBagFull( varMap ,varPlayer,selectRadio )

	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x300757_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

	for j, item in x300757_var_BonusChoiceItem do
		if item.item == selectRadio then
			ItemAppend( varMap, item.item, item.n )
			break
		end
	end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet <= 0 then
		result = 0
	end

	return result
end




function x300757_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300757_var_SubQuestID[varIndex].varQuestName)
		TalkAppendString(varMap,format("%s", x300757_var_SubQuestID[varIndex].QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", x300757_var_SubQuestID[varIndex].varQuestTarget))
		TalkAppendString( varMap," ")

		
		if x300757_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300757_var_SubQuestID[varIndex].QuestHelp))
			TalkAppendString(varMap," ")
		end

		

		
		local varExpBonus = x300757_var_SubQuestID[varIndex].varExpBonus
		if varExpBonus > 0 then
			local varLevel = GetLevel(varMap, varPlayer)
			varExpBonus = x300757_var_SubQuestID[varIndex].varExpBonus * varLevel
			AddQuestExpBonus(varMap, varExpBonus )
		end

		

		if x300757_var_SubQuestID[varIndex].BonusMoney > 0 then
    		local buffId1 = 9011
	        local buffId2 = 9013
	        local buffId3 = 9012
	        local bHaveImpact1 = IsHaveSpecificImpact( varMap, varPlayer, buffId1 )
	        local bHaveImpact2 = IsHaveSpecificImpact( varMap, varPlayer, buffId2 )
	        local bHaveImpact3 = IsHaveSpecificImpact( varMap, varPlayer, buffId3 )

	        if (bHaveImpact1==1 or bHaveImpact2 == 1) then

			AddQuestMoneyBonus2(varMap, x300757_var_SubQuestID[varIndex].BonusMoney )
			elseif (bHaveImpact3 == 1) then
				local BonusMoney = x300757_var_SubQuestID[varIndex].BonusMoney * x300757_var_nGoldsRate
				AddQuestMoneyBonus3(varMap, BonusMoney )				
		    else 
		    AddQuestMoneyBonus1(varMap, x300757_var_SubQuestID[varIndex].BonusMoney )
		end
		end

		
		if x300757_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300757_var_BonusMoney6 )
		end


		
		for varI, item in x300757_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300757_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end

	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300757_var_FileId, x300757_var_SubQuestID[varIndex].varQuest);
end




function x300757_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varIndex )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300757_var_SubQuestID[varIndex].varQuestName)
		TalkAppendString(varMap,format("%s", x300757_var_SubQuestID[varIndex].QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

  		

		
		local varExpBonus = 0
		if varExpBonus> 0 then
			local varLevel = GetLevel(varMap, varPlayer)
			varExpBonus = x300757_var_SubQuestID[varIndex].varExpBonus * varLevel
			AddQuestExpBonus(varMap, varExpBonus )
		end

		
		if x300757_var_SubQuestID[varIndex].BonusMoney > 0 then
		    local buffId1 = 9011
	        local buffId2 = 9013
	        local buffId3 = 9012
	        local bHaveImpact1 = IsHaveSpecificImpact( varMap, varPlayer, buffId1 )
	        local bHaveImpact2 = IsHaveSpecificImpact( varMap, varPlayer, buffId2 )
	        local bHaveImpact3 = IsHaveSpecificImpact( varMap, varPlayer, buffId3 )

	        if (bHaveImpact1==1 or bHaveImpact2 == 1) then
			AddQuestMoneyBonus2(varMap, x300757_var_SubQuestID[varIndex].BonusMoney )
			elseif (bHaveImpact3 == 1) then
				local BonusMoney = x300757_var_SubQuestID[varIndex].BonusMoney * x300757_var_nGoldsRate
				AddQuestMoneyBonus3(varMap, BonusMoney )	
			else
			AddQuestMoneyBonus(varMap, x300757_var_SubQuestID[varIndex].BonusMoney )

		end
		end

		
		if x300757_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300757_var_BonusMoney6 )
		end


		
		for varI, item in x300757_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300757_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end

	    
	StopTalkTask()
	
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300757_var_FileId, x300757_var_SubQuestID[varIndex].varQuest,0);

end




function x300757_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varIndex )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300757_var_SubQuestID[varIndex].varQuestName)
		TalkAppendString(varMap,x300757_var_QuestCompleted)
		TalkAppendString(varMap," ")

  		

		
		local varExpBonus = x300757_var_SubQuestID[varIndex].varExpBonus
		if varExpBonus> 0 then
			local varLevel = GetLevel(varMap, varPlayer)
			varExpBonus = (1000*0.1*varLevel*15)
			AddQuestExpBonus(varMap, varExpBonus )
		end

		
		if x300757_var_SubQuestID[varIndex].BonusMoney > 0 then
			local buffId1 = 9011
	        local buffId2 = 9013
	        local buffId3 = 9012
	        local bHaveImpact1 = IsHaveSpecificImpact( varMap, varPlayer, buffId1 )
	        local bHaveImpact2 = IsHaveSpecificImpact( varMap, varPlayer, buffId2 )
	        local bHaveImpact3 = IsHaveSpecificImpact( varMap, varPlayer, buffId3 )

	        if (bHaveImpact1==1 or bHaveImpact2 == 1 ) then

			AddQuestMoneyBonus2(varMap, x300757_var_SubQuestID[varIndex].BonusMoney )
			elseif (bHaveImpact3 == 1) then
				local BonusMoney = x300757_var_SubQuestID[varIndex].BonusMoney * x300757_var_nGoldsRate
				AddQuestMoneyBonus3(varMap, BonusMoney )	
			else
			AddQuestMoneyBonus1(varMap, x300757_var_SubQuestID[varIndex].BonusMoney )
        end
		end

		
		if x300757_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300757_var_BonusMoney6 )
		end


		
		for varI, item in x300757_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300757_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300757_var_FileId, x300757_var_SubQuestID[varIndex].varQuest);

end





function x300757_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	for varI,itm in x300757_var_SubQuestID do
		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.varQuest );

		if varHaveQuest > 0 then
			if varTalkNpcGUID == itm.SubmitNPCGUID then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,itm.varQuest)
				TalkAppendButton(varMap, itm.varQuest, itm.varQuestName,7,varI);
				break;
			end
		end
	end
end




function x300757_QuestLogRefresh( varMap, varPlayer, varQuest)

	for varI,itm in x300757_var_SubQuestID do 
		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.varQuest );
		if varHaveQuest > 0 then
		
			StartTalkTask(varMap)	
			local BonusMoney = itm.BonusMoney
			local varExpBonus = itm.varExpBonus
			local buffId1 = 9011
	        local buffId2 = 9013
	        local buffId3 = 9012
	        local bHaveImpact1 = IsHaveSpecificImpact( varMap, varPlayer, buffId1 )
	        local bHaveImpact2 = IsHaveSpecificImpact( varMap, varPlayer, buffId2 )
	        local bHaveImpact3 = IsHaveSpecificImpact( varMap, varPlayer, buffId3 )

	        if (bHaveImpact1==1 or bHaveImpact2 == 1 ) then

			AddQuestMoneyBonus2(varMap,BonusMoney)
			elseif (bHaveImpact3 == 1) then
				BonusMoney = BonusMoney * x300757_var_nGoldsRate
				AddQuestMoneyBonus3(varMap, BonusMoney)	
			else
			AddQuestMoneyBonus1(varMap,BonusMoney)
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
			StopTalkTask()
			DeliverTalkRefreshQuest(varMap, varPlayer, itm.varQuest);
			break
		end
	end

end

function x300757_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	x300757_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x300757_CostMoney( varMap, varPlayer,varQuest )
	for varI,itm in x300757_var_SubQuestID do
		if varQuest == itm.varQuest  then

			local cost = CostMoney( varMap , varPlayer ,0, itm.varCostMoney,301 ) 
			if cost == -1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您包裹中的现银不够支付押金，无法接取任务!");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				local varReadme = "很抱歉，您包裹中的现银不够支付押金，无法接取任务！" 
				Msg2Player(varMap,varPlayer,varReadme,8,2)
				return 0
			else
				local playerCountry =GetCurCountry(varMap,varPlayer)
				local varCountry = "楼兰王国"
				if playerCountry == 0 then
					varCountry = "楼兰王国"
					elseif playerCountry == 1 then
					varCountry = "天山王国"
					elseif playerCountry == 2 then
					varCountry = "昆仑王国"
					elseif playerCountry == 3 then
					varCountry = "敦煌王国"
				end








				
				local varStr = "您接受了任务：【个人】黑金押运"
				
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您接受了任务：【个人】黑金押运");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				local  Money = floor(itm.varCostMoney/1000)
				local varReadme = "您接受了任务：【个人】黑金押运#r扣除押金#R"..Money.."两#o现银"
				Msg2Player(varMap,varPlayer,varReadme,8,2)
				return 1
			end	
			break
		end
	end
end


function x300757_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end





function x300757_GetDayCount(varMap, varPlayer)

	if x300757_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_DATE[1], MD_PAO_QIAN_DATE[2], MD_PAO_QIAN_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3])
		return varDaycount

	end

	return 0
end




function x300757_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_DATE[1], MD_PAO_QIAN_DATE[2], MD_PAO_QIAN_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_DATE[1], MD_PAO_QIAN_DATE[2], MD_PAO_QIAN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3], varDaycount+1)
	end
end
