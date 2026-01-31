--DECLARE_QUEST_INFO_START--

x302619_var_ScriptId 	  = 302619
x302619_var_MissionName = "托运官府马车"

--DECLARE_QUEST_INFO_STOP--
x302619_CostGold		= 3000


x302619_var_SubMissionID		=	{
								  {	MisID=10311, DestPosX = 235, DestPosZ = 443, mapID = 150 },
								  {	MisID=10312, DestPosX = 167, DestPosZ = 187, mapID = 151 },
								  {	MisID=10313, DestPosX = 449, DestPosZ = 256, mapID = 151 },
								  {	MisID=10314, DestPosX = 449, DestPosZ = 256, mapID = 151 },
								  {	MisID=10315, DestPosX = 449, DestPosZ = 256, mapID = 151 },	
								  {	MisID=10316, DestPosX = 449, DestPosZ = 256, mapID = 151 }                                         
								}																		

								
								
								
function x302619_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	
	local level = GetLevel( varMap, varPlayer )
	if ( level >= 30 ) then
		TalkAppendButton( varMap, x302619_var_ScriptId, x302619_var_MissionName, 3, -1 )
	end
	
end



--点击（按钮）点击该任务后执行此脚本
function x302619_ProcEventEntry( varMap, varPlayer, targetId, MissionId, nExtIdx )

		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y托运护送镖车")
		TalkAppendString(varMap, "\t当您领取护送的镖车后，可以再花费#Y3两金卡（现金）#W，我们就能找人帮您将镖车传送到距离目的地很近的地方。#r\t选择现金消费，您可以按B键打开包裹介面，在#G优先使用#W#Y现金/金卡#W处打上对勾即可。");
		StopTalkTask(varMap)
		DeliverTalkInfo(varMap, varPlayer, targetId, x302619_var_ScriptId, -1);

end

--检查是否能接受此任务
--返回值：-2--现金不够  -1--没有相关任务 0--镖车不在有效距离	1--可以接受任务
function x302619_IsCanAccept( varMap, varPlayer )
	
	local bHaveMission = 0
	for i,itm in x302619_var_SubMissionID do

		bHaveMission = IsHaveQuestNM(varMap, varPlayer,itm.MisID )
		if bHaveMission > 0 then
			local valid = IsValidMyselfBus(varMap, varPlayer, itm.MisID)
			if valid == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您护送的镖车没在附近，无法托运,请找到镖车再来。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，您护送的镖车没在附近，无法托运,请找到镖车再来。",8,2)
				return 0
			end
			
			local misIndex = GetQuestIndexByID( varMap, varPlayer, itm.MisID )
			local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
			if ( missionNum == 1 ) then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，护送军粮镖车不能使用托运功能。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，护送军粮镖车不能使用托运功能。",8,2)	
				return 0
			end
		
			--得到玩家现金消费模式
			if GetGoldMode( varMap, varPlayer ) == 1 then
				-- 现金模式
				if GetMoney(varMap, varPlayer,2) < x302619_CostGold then
					StartTalkTask(varMap)
					TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
					return 0
				end
			else 
				-- 金卡模式
				if GetMoney(varMap, varPlayer,3) < x302619_CostGold then
					StartTalkTask(varMap)
					TalkAppendString(varMap, "很抱歉，您身上携带的金卡不够支付本次托运费用。");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的金卡不够支付本次托运费用。",8,2)	
					return 0
				end
			end
			
			return 1	
		end
	end

	 --没有任何分舵护送
	 StartTalkTask(varMap)
	 TalkAppendString(varMap, "很抱歉，您不能使用托运功能！");
	 StopTalkTask(varMap)
	 DeliverTalkTips(varMap,varPlayer)
	 Msg2Player(varMap,varPlayer,"很抱歉，您不能使用托运功能！",8,2)
	 return 0

end


--**********************************
--接受
--**********************************
function x302619_ProcAcceptCheck( varMap, varPlayer, targetId, MissionId )
		
	local bRet = x302619_IsCanAccept( varMap, varPlayer )

	if bRet ~= 1 then
		return
	end
	
	--for i,itm in x302619_var_SubMissionID do
	--	local bHaveMission = IsHaveQuestNM(varMap, varPlayer, itm.MisID )
	--	if bHaveMission > 0 then
	--		local misIndex = GetQuestIndexByID( varMap, varPlayer, itm.MisID )
	--		local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
	--		if ( missionNum == 3 ) then
	--			StartTalkTask(varMap)
	--			TalkAppendString(varMap, "很抱歉，护送秘药镖车不能使用托运功能。");
	--			StopTalkTask(varMap)
	--			DeliverTalkTips(varMap,varPlayer)
	--			Msg2Player(varMap,varPlayer,"很抱歉，护送秘药镖车不能使用托运功能。",8,2)	
	--			return 0
	--		end
	--	end
	--end


	--得到玩家现金消费模式
	if GetGoldMode( varMap, varPlayer ) == 1 then
		--现金模式
		if CostMoney( varMap, varPlayer, 2, x302619_CostGold, 301 ) == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次托运费用。");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次托运费用。",8,2)	
			return
		end
	else 
		--金卡模式
		if CostMoney( varMap, varPlayer, 3, x302619_CostGold, 301 ) == -1 then
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

	for i,itm in x302619_var_SubMissionID do

		local bHaveMission = IsHaveQuestNM(varMap, varPlayer, itm.MisID )
		if bHaveMission > 0 then
				if BusId ~= -1 then
					if varMap == itm.mapID then
						SetBusPos(varMap,BusId,itm.DestPosX, itm.DestPosZ)
						SetPos(varMap, varPlayer,itm.DestPosX, itm.DestPosZ)		
					else
						ReadyBusChangeScene(varMap, itm.mapID ,BusId)
						NewWorld(varMap, varPlayer, itm.mapID, itm.DestPosX, itm.DestPosZ, x302619_var_ScriptId)	
						DeleteBus(varMap, BusId,0)			
					end
				end
			--end
		end
	end

end


--**********************************
--接受
--**********************************
function x302619_ProcAccept( varMap, varPlayer )	
end

--完成任务
--返回1代表成功，0代表交任务失败
function x302619_ProcQuestSubmit( varMap, varPlayer, targetId, selectId, MissionId )
end


--********************************************************************
--放弃
--********************************************************************
function x302619_ProcQuestAbandon( varMap, varPlayer,MissionId )  	
end


function x302619_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid,misIndex, MissionId )
end

---------------------------------------------------------------------------------------------------
--任务日志刷新
---------------------------------------------------------------------------------------------------
function x302619_QuestLogRefresh( varMap, varPlayer, MissionId)
end

function x302619_ProcQuestLogRefresh( varMap, varPlayer, MissionId)

end




