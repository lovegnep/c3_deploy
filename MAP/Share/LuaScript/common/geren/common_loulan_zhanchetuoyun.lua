--DECLARE_QUEST_INFO_START--

x300762_var_FileId 	  = 300762
x300762_var_QuestKind 				= 	1                       
x300762_var_Mis_Count   = 1
x300762_var_ExtTarget					=	{ {type=20,n=1,target="战车"} }
x300762_var_QuestName = "托运战车"

--DECLARE_QUEST_INFO_STOP--

x300762_CostGold		= 3000

x300762_var_QuestId = 7031
x300762_var_DestPosX = 235
x300762_var_DestPosZ = 442
				

function x300762_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x300762_var_FileId,x300762_var_QuestName,3,-1)

end





function x300762_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )

	

	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t当您领取战车护送后，并花费#Y3两金卡（现金）#W我们就能将战车传送到距离目的地很近的地方。#r\t选择现金消费，您可以按B键打开包裹介面，在#G优先使用#W#Y现金/金卡#W处打上对勾即可。");
		StopTalkTask(varMap)
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300762_var_FileId,  -1);
		return
	
	
				
				
					
					
					
					
					
					
				
			
				
				
					
					
					
					
					
					
				
			

end



function x300762_IsCanAccept( varMap, varPlayer )
	
	local varHaveQuest = 0
	varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300762_var_QuestId )
	if varHaveQuest > 0 then
		local varValid = IsValidMyselfBus(varMap, varPlayer,x300762_var_QuestId)
		if varValid == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您的战车没在附近，无法托运,请找到战车再来。");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"很抱歉，您的战车没在附近，无法托运,请找到战车再来。",8,2)
			return 0
		end
	


		
		if GetGoldMode( varMap, varPlayer ) == 1 then
			
			if GetMoney(varMap, varPlayer,2) < x300762_CostGold then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
				return -2
			end
		else 
			
			if GetMoney(varMap, varPlayer,3) < x300762_CostGold then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您身上携带的金卡不够支付本次托运费用。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的金卡不够支付本次托运费用。",8,2)	
				return -2
			end
		end

		return 1
					
	end

	
		
		
		
		
		
		
	
		
		 StartTalkTask(varMap)
		 TalkAppendString(varMap, "很抱歉，您必须先领取战车，才能进行托运！");
		 StopTalkTask(varMap)
		 DeliverTalkTips(varMap,varPlayer)
		 Msg2Player(varMap,varPlayer,"很抱歉，您必须先领取战车，才能进行托运！",8,2)
	

	return -1;

end





function x300762_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest )
				
	local bRet = x300762_IsCanAccept( varMap, varPlayer )

	if bRet ~= 1 then
		return
	end

	
	if GetGoldMode( varMap, varPlayer ) == 1 then
		
		if CostMoney( varMap, varPlayer, 2,x300762_CostGold,301 ) == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
			return
		end
	else 
		
		if CostMoney( varMap, varPlayer, 3,x300762_CostGold,301 ) == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您身上携带的金卡不够支付本次托运费用。");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的金卡不够支付本次托运费用。",8,2)	
			return
		end
	end

	local InBus = IsBusMember(varMap, varPlayer)

	if InBus ~= 1 then
		return
	end

	local BusId = GetBusId(varMap, varPlayer)

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300762_var_QuestId )
	if varHaveQuest > 0 then

		if BusId ~=-1 then
			SetBusPos(varMap,BusId,x300762_var_DestPosX, x300762_var_DestPosZ)
			SetPos(varMap, varPlayer,x300762_var_DestPosX, x300762_var_DestPosZ)
			else
			ReadyBusChangeScene(varMap, 50,BusId)
			NewWorld(varMap, varPlayer, 50, x300762_var_DestPosX, x300762_var_DestPosZ, x300762_var_FileId)	
			DeleteBus(varMap, BusId,0)			
		end

		
			
			
		
	end

end





function x300762_ProcAccept( varMap, varPlayer )	
end



function x300762_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300762_ProcQuestAbandon( varMap, varPlayer,varQuest )  	
end


function x300762_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end




function x300762_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300762_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

end




