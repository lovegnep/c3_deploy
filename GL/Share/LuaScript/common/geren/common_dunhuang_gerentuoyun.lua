--DECLARE_QUEST_INFO_START--

x300849_var_FileId 	  = 300849
x300849_var_QuestKind 			= 	1                       
x300849_var_Mis_Count   = 1
x300849_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
x300849_var_QuestName = "托运官府马车"

--DECLARE_QUEST_INFO_STOP--

x300849_CostGold		= 3000

x300849_var_SubQuestID		=	{ {	MisID=7608,DestPosX = 94,DestPosZ = 91 },
								  {	MisID=7609,DestPosX = 106,DestPosZ = 135 },
								  {	MisID=7610,DestPosX = 208,DestPosZ = 35 },
								  {	MisID=7611,DestPosX = 208,DestPosZ = 35 },
								  {	MisID=7612,DestPosX = 208,DestPosZ = 35 },	
								  {	MisID=7613,DestPosX = 208,DestPosZ = 35 },											  
								}																		

function x300849_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	TalkAppendButton(varMap,x300849_var_FileId,x300849_var_QuestName,3,-1)

end




function x300849_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )

	

	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t当您领取官府押运后，并花费#Y3两金卡（现金）#W我们就能将官府马车传送到距离目的地很近的地方。#r\t选择现金消费，您可以按B键打开包裹介面，在#G优先使用#W#Y现金/金卡#W处打上对勾即可。");
		StopTalkTask(varMap)
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300849_var_FileId,  -1);
		return
	
	
				
				
					
					
					
					
					
					
				
			
				
				
					
					
					
					
					
					
				
			

end



function x300849_IsCanAccept( varMap, varPlayer )
	
	local varHaveQuest = 0
	for varI,itm in x300849_var_SubQuestID do

		varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID )
		if varHaveQuest > 0 then
			local varValid = IsValidMyselfBus(varMap, varPlayer,itm.MisID)
			if varValid == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您的马车没在附近，无法托运,请找到马车再来。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，您的马车没在附近，无法托运,请找到马车再来。",8,2)
				return 0
			end
		
			
			if GetGoldMode( varMap, varPlayer ) == 1 then
				
				if GetMoney(varMap, varPlayer,2) < x300849_CostGold then
					StartTalkTask(varMap)
					TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
					return -2
				end
			else 
				
				if GetMoney(varMap, varPlayer,3) < x300849_CostGold then
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

	end

	
		
		
		
		
		
		
	
		
		 StartTalkTask(varMap)
		 TalkAppendString(varMap, "很抱歉，您必须先领取官府马车，才能进行托运！");
		 StopTalkTask(varMap)
		 DeliverTalkTips(varMap,varPlayer)
		 Msg2Player(varMap,varPlayer,"很抱歉，您必须先领取官府马车，才能进行托运！",8,2)
	

	return -1;

end





function x300849_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest )
				
	local bRet = x300849_IsCanAccept( varMap, varPlayer )

	if bRet ~= 1 then
		return
	end

	
	if GetGoldMode( varMap, varPlayer ) == 1 then
		
		if CostMoney( varMap, varPlayer, 2,x300849_CostGold,301 ) == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
			return
		end
	else 
		
		if CostMoney( varMap, varPlayer, 3,x300849_CostGold,301 ) == -1 then
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

	for varI,itm in x300849_var_SubQuestID do

		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID )
		if varHaveQuest > 0 then
			if varI == 1 then
				if BusId ~=-1 then
					ReadyBusChangeScene(varMap, 358,BusId)
					NewWorld(varMap, varPlayer, 358, itm.DestPosX, itm.DestPosZ, x300849_var_FileId)	
					DeleteBus(varMap, BusId,0)	
				end
			elseif varI == 2 then
				if BusId ~=-1 then
					ReadyBusChangeScene(varMap, 386,BusId)
					NewWorld(varMap, varPlayer, 386, itm.DestPosX, itm.DestPosZ, x300849_var_FileId)	
					DeleteBus(varMap, BusId,0)	
				end
			else
				if BusId ~=-1 then
					ReadyBusChangeScene(varMap, 351,BusId)
					NewWorld(varMap, varPlayer, 351, itm.DestPosX, itm.DestPosZ, x300849_var_FileId)	
					DeleteBus(varMap, BusId,0)			
				end
			end
		end
	end

end





function x300849_ProcAccept( varMap, varPlayer )	
end



function x300849_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300849_ProcQuestAbandon( varMap, varPlayer,varQuest )  	
end


function x300849_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end




function x300849_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300849_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

end




