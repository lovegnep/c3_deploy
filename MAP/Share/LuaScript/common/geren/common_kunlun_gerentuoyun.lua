--DECLARE_QUEST_INFO_START--

x300850_var_FileId 	  = 300850
x300850_var_QuestKind 				= 	1                       
x300850_var_Mis_Count   = 1
x300850_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
x300850_var_QuestName = "托运官府马车"

--DECLARE_QUEST_INFO_STOP--

x300850_CostGold		= 3000

x300850_var_SubQuestID		=	{ {	MisID=7614,DestPosX = 94,DestPosZ = 91 },
								  {	MisID=7615,DestPosX = 163,DestPosZ = 127 },
								  {	MisID=7616,DestPosX = 55,DestPosZ = 42 	 },
								  {	MisID=7617,DestPosX = 55,DestPosZ = 42   },
								  {	MisID=7618,DestPosX = 55,DestPosZ = 42   },	
								  {	MisID=7619,DestPosX = 55,DestPosZ = 42   },											  
								}																		

function x300850_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	TalkAppendButton(varMap,x300850_var_FileId,x300850_var_QuestName,3,-1)

end




function x300850_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )

	

	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t当您领取官府押运后，并花费#Y3两金卡（现金）#W我们就能将官府马车传送到距离目的地很近的地方。#r\t选择现金消费，您可以按B键打开包裹介面，在#G优先使用#W#Y现金/金卡#W处打上对勾即可。");
		StopTalkTask(varMap)
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300850_var_FileId,  -1);
		return
	
	
				
				
					
					
					
					
					
					
				
			
				
				
					
					
					
					
					
					
				
			

end



function x300850_IsCanAccept( varMap, varPlayer )
	
	local varHaveQuest = 0
	for varI,itm in x300850_var_SubQuestID do

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
				
				if GetMoney(varMap, varPlayer,2) < x300850_CostGold then
					StartTalkTask(varMap)
					TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
					return -2
				end
			else 
				
				if GetMoney(varMap, varPlayer,3) < x300850_CostGold then
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





function x300850_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest )
				
	local bRet = x300850_IsCanAccept( varMap, varPlayer )

	if bRet ~= 1 then
		return
	end

	
	if GetGoldMode( varMap, varPlayer ) == 1 then
		
		if CostMoney( varMap, varPlayer, 2,x300850_CostGold,301 ) == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
			return
		end
	else 
		
		if CostMoney( varMap, varPlayer, 3,x300850_CostGold,301 ) == -1 then
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

	for varI,itm in x300850_var_SubQuestID do

		local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID )
		if varHaveQuest > 0 then
			if varI == 1 then
				if BusId ~=-1 then
					ReadyBusChangeScene(varMap, 258,BusId)
					NewWorld(varMap, varPlayer, 258, itm.DestPosX, itm.DestPosZ, x300850_var_FileId)	
					DeleteBus(varMap, BusId,0)		
				end
			elseif varI == 2 then
				if BusId ~=-1 then
					ReadyBusChangeScene(varMap, 286,BusId)
					NewWorld(varMap, varPlayer, 286, itm.DestPosX, itm.DestPosZ, x300850_var_FileId)	
					DeleteBus(varMap, BusId,0)		
				end
			else
				if BusId ~=-1 then
					ReadyBusChangeScene(varMap, 251,BusId)
					NewWorld(varMap, varPlayer, 251, itm.DestPosX, itm.DestPosZ, x300850_var_FileId)	
					DeleteBus(varMap, BusId,0)			
				end
			end
		end
	end

end





function x300850_ProcAccept( varMap, varPlayer )	
end



function x300850_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300850_ProcQuestAbandon( varMap, varPlayer,varQuest )  	
end


function x300850_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end




function x300850_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300850_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

end




