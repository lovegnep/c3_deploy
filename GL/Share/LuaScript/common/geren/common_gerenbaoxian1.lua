--DECLARE_QUEST_INFO_START--

x300610_var_FileId 	  = 300610
x300610_var_QuestKind 				= 	1                       
x300610_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
x300610_QuestName = "【黑金】保险"

--DECLARE_QUEST_INFO_STOP--	  
						

x300610_var_SubQuestID				=	{ { varQuest=7556,BaoDanId=13080011,varCostMoney=250 }, 
										  {	varQuest=7557,BaoDanId=13080012,varCostMoney=500 },
										  {	varQuest=7558,BaoDanId=13080013,varCostMoney=750 },
										  {	varQuest=7546,BaoDanId=13080014,varCostMoney=1500 },
										  { varQuest=7547,BaoDanId=13080015,varCostMoney=2000 },
										  { varQuest=7548,BaoDanId=13080016,varCostMoney=2500 },
										}

function x300610_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if x300610_IsHaveCashbox(varMap, varPlayer) == 1 then
		TalkAppendButton(varMap,x300610_var_FileId,x300610_QuestName,3);
	end

end




function x300610_ProcEventEntry( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)
	local Readme_1 ="\t世上没有白吃的午餐，如果您对您押运的黑金进行投保的话，您需要付给我#G押金的5%#W做为保金。#r"
	local Readme_2 ="\t无论您押运黑金达成与否，您缴付的保金都不会退还给您。#r"
	local Readme_3 ="\t如果您押运黑金时。您的飞行器被敌人劫走，或因异常情况飞行器丢失。您都可以在黑金押运的任务回复人那里提交您的#g保单#w，换取#g理赔单#w。#r"
	local Readme_4 ="\t您领取了#g理赔单#w后，可以回到我这里#g提交理赔单#w，如果您提交的#g理赔单#w没有问题，我们将对您进行#g赔付#w，赔付的金额为您领取黑金押运任务时的#g押金的一半#w。#r"
	local Readme_5 ="\t少侠，您现在需要马上进行投保吗？"
	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	TalkAppendString(varMap,varReadme)
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300610_var_FileId, -1);

end


function x300610_IsHaveCashbox( varMap, varPlayer )

	local BusObjId = GetBusId(varMap,varPlayer)
	if BusObjId ~= -1 then
		if GetBusType(varMap,BusObjId) == 0 then 
			return 1
		end
	end

	return 0

end




function x300610_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	if x300610_IsHaveCashbox(varMap, varPlayer) == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，您不在护送状态不能参加投保！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		Msg2Player(varMap,varPlayer,"很抱歉，您不在护送状态不能参加投保！",8,2)
		return
	end

	local SubIndex = 0
	for varI,itm in x300610_var_SubQuestID do
		if IsHaveQuest(varMap, varPlayer, itm.varQuest) > 0 then
			SubIndex = varI
			break;
		end
	end

	if SubIndex == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，只有领取了黑金押运任务才能参加投保！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		Msg2Player(varMap,varPlayer,"很抱歉，只有领取了黑金押运任务才能参加投保！",8,2)
		return		
	end

	local IsHaveBaoDan = 0
	for varI,itm in x300610_var_SubQuestID do
		if HaveItem(varMap, varPlayer, itm.BaoDanId) > 0 then
			IsHaveBaoDan = 1
			break;
		end
	end

	if IsHaveBaoDan == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，您的身上已经有保单了，请先兑换理赔单赔付后才能再次申请投保！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		Msg2Player(varMap,varPlayer,"很抱歉，您的身上已经有保单了，请先兑换理赔单赔付后才能再次申请投保！",8,2)
		return		
	end

	local money = GetMoney(varMap, varPlayer,0)	
	if money < x300610_var_SubQuestID[SubIndex].varCostMoney then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，您身上的现银不足以支付保险！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不足以支付保险！",8,2)
		return
	end

	StartItemTask( varMap )
	ItemAppend( varMap, x300610_var_SubQuestID[SubIndex].BaoDanId, 1 )
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		local varNum = CostMoney( varMap , varPlayer ,0, x300610_var_SubQuestID[SubIndex].varCostMoney,301)	
		if varNum == -1 then
			
			return
		end

		local varReadme = "投保完成,扣除保费现银#R#{_MONEY"..x300610_var_SubQuestID[SubIndex].varCostMoney.."}" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)

		StartTalkTask(varMap)
		TalkAppendString(varMap,"投保完成！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer);
		
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，您的背包空间不足，请整理背包！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		Msg2Player(varMap,varPlayer, "很抱歉，您的背包空间不足，请整理背包！",8,2)
		return 0
	end

end




function x300610_ProcAccept( varMap, varPlayer )
end



function x300610_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300610_ProcQuestAbandon( varMap, varPlayer,varQuest )
end

