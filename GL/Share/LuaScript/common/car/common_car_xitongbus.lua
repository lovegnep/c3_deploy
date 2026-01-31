





x310080_var_FileId = 310080


x310080_var_AddBuffId = 1210
x310080_var_BusGameImpact = 7043

x310080_var_AvoidItem	=	12030055


x310080_var_Carinfo ={
			{CarType = 53,BaseAI = 3,AIScript = 3,Script = 310080, CarName = "玄武飞艇—南路", TimerTick=10000},
			{CarType = 53,BaseAI = 3,AIScript = 3,Script = 310080, CarName = "玄武飞艇", TimerTick=10000},
			{CarType = 53,BaseAI = 3,AIScript = 3,Script = 310080, CarName = "玄武飞艇—西路", TimerTick=10000},
		}

x310080_var_ErrorMessage_AlreadyInBus	=	"你现在无法乘坐飞艇"
x310080_var_ErrorMessage_BusFull			=	"车上已经没有空位了，请等待下一辆！"
x310080_var_ErrorMessage_buff					= "请变身结束后再乘坐飞艇"
x310080_var_AskForEnterMessage	=	"#Y【玄武飞艇】#W\n\t是否要乘坐飞艇？"

x310080_var_Bufflist  ={ 22090, 22091, 22092, 22093, 22094, 22095, 22096, 22097, 22098,22099}

x310080_var_ScenePatrol	=	{
													{varMap=50,  patrolId=0, PosX=220, PosZ=257, CarType = 32},
													{varMap=50,  patrolId=0, PosX=220, PosZ=257, CarType = 33},
													{varMap=50,  patrolId=0, PosX=220, PosZ=257, CarType = 34},
													{varMap=150, patrolId=0, PosX=220, PosZ=257, CarType = 32},
													{varMap=150, patrolId=0, PosX=220, PosZ=257, CarType = 33},
													{varMap=150, patrolId=0, PosX=220, PosZ=257, CarType = 34},
													{varMap=250, patrolId=0, PosX=220, PosZ=257, CarType = 32},
													{varMap=250, patrolId=0, PosX=220, PosZ=257, CarType = 33},
													{varMap=250, patrolId=0, PosX=220, PosZ=257, CarType = 34},
													{varMap=350, patrolId=0, PosX=220, PosZ=257, CarType = 32},
													{varMap=350, patrolId=0, PosX=220, PosZ=257, CarType = 33},
													{varMap=350, patrolId=0, PosX=220, PosZ=257, CarType = 34}
												}

x310080_var_SceneInfo = {
													{varMap=50 , countryID=0,BusFaceDir = 270},
													{varMap=150, countryID=1,BusFaceDir = 270},
													{varMap=250, countryID=2,BusFaceDir = 270},
													{varMap=350, countryID=3,BusFaceDir = 270},
												}
x310080_exprate =0.2		
x310080_silvercardrate =0.2																					
function x310080_GetCountryID(varMap)

	for varI, item in x310080_var_SceneInfo do
		if item.varMap == varMap then
			return item.countryID
		end
	end

	return -1
end												

function x310080_GetBusFaceDir(varMap)

	for varI, item in x310080_var_SceneInfo do
		if item.varMap == varMap then
			return item.BusFaceDir
		end
	end

	return 0
end	

function x310080_GetStartPos(varMap, varIndex)

	local varCount = 1
	for varI, item in x310080_var_ScenePatrol do
		if item.varMap == varMap then
			if varCount < varIndex then
				varCount = varCount + 1
			else
				return item.PosX, item.PosZ;
			end
		end
	end
	return 0, 0;

end

function x310080_var_SetPatrol(varMap, varTalknpc, patrolId)
	for varI, item in x310080_var_ScenePatrol do
		if item.varMap == varMap then
		
			
			SetBusPatrolId(varMap , varTalknpc, patrolId);
		end
	end

end


function x310080_ProcDelayTime(varMap, varTalknpc, paraDelayTime)
   
    for varI, item in x310080_var_ScenePatrol do
		if item.varMap == varMap then
			
			patrolId = item.patrolId
		
			SetBusPatrolId(varMap , varTalknpc, patrolId);
		end
	end

end

function x310080_GetRandomTime()
	return 6000
end




function x310080_ProcCreateBus(varMap, countryID)

	local varI=2;
	local PosX, PosZ = x310080_GetStartPos(varMap, varI);
	local nFaceDir = x310080_GetBusFaceDir(varMap)
	
	
	
	
	CreateBus(varMap, x310080_var_Carinfo[varI].CarType, PosX, PosZ, x310080_var_Carinfo[varI].BaseAI, x310080_var_Carinfo[varI].AIScript, x310080_var_FileId, -1, x310080_var_AddBuffId, -1,-1,nFaceDir)
	
end

function x310080_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)

	local varI=2;
	
	local countryID = x310080_GetCountryID(varMap)	
		
	if countryID == -1 then
		return
	end

	SetBusTitle(varMap , busId, x310080_var_Carinfo[varI].CarName);
	SetBusCountryID(varMap , busId, countryID);
	SetBusCurCamp(varMap , busId, countryID);
	SetDelayTimeAfterCreate( varMap, busId, 10000, varI+3 );
	
	SetBusTimerTick(varMap , busId, x310080_GetRandomTime());
	
	SetBusTimerOpen(varMap, busId, 1);
	
	SendSpecificImpactToUnit(varMap, busId, busId, busId, 7060, 0)
	
end





function x310080_ProcEventEntry(varMap, varPlayer, varTalknpc)	


	local iLevel = GetLevel(varMap, varPlayer)
	if iLevel < 20 then
		local varStr = "你的等级不足20，无法乘坐飞艇";
		StartTalkTask(varMap)
			TalkAppendString(varMap, varStr);
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap, varPlayer, varStr, CHAT_TYPE_NORMAL, CHAT_RIGHTDOWN);
		return 0
	end

	local bIsBusMoving = IsBusMoving(varMap, varTalknpc)
	if bIsBusMoving > 0 then
		local varStr = "飞艇已经开出，无法乘坐飞艇";
		StartTalkTask(varMap)
			TalkAppendString(varMap, varStr);
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap, varPlayer, varStr, CHAT_TYPE_NORMAL, CHAT_RIGHTDOWN);
		return 0
	end
	
	local varStr = x310080_var_AskForEnterMessage;
	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, 310080, -1);
	
end

function x310080_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能乘坐飞艇。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	
	x310080_ProcIntoBusEvent(varMap, varPlayer, varTalknpc);
end

function x310080_ProcAccept(varMap, varPlayer, varTalknpc)
	x310080_ProcIntoBusEvent(varMap, varPlayer, varTalknpc);
end

function x310080_ProcBusEnterScene(varMap, varTalknpc)
	
	
	

end

function x310080_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
x310080_ProcEventEntry(varMap, varPlayer, varTalknpc)
end

function x310080_CheckAndDisplayError(varMap, varPlayer, varTalknpc)

	local InBus = IsBusMember(varMap, varPlayer)	
	local varStr;
	if InBus == 1 then
		varStr = x310080_var_ErrorMessage_AlreadyInBus;
		StartTalkTask(varMap)
			TalkAppendString(varMap, varStr)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap, varPlayer, varStr, CHAT_TYPE_NORMAL, CHAT_RIGHTDOWN);
		return 0;
	end
			
	local BusSize = GetBusSize(varMap,varTalknpc) 
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)
	
	if BusSize<=MemberNum  then
		varStr = x310080_var_ErrorMessage_BusFull;
		StartTalkTask(varMap)
			TalkAppendString(varMap, varStr)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap, varPlayer, varStr, CHAT_TYPE_NORMAL, CHAT_RIGHTDOWN);
		return 0;
	end
	
	for varI, item in x310080_var_Bufflist do
			if IsHaveSpecificImpact( varMap, varPlayer, item) == 1 then
				varStr = x310080_var_ErrorMessage_buff;
				StartTalkTask(varMap)
					TalkAppendString(varMap, varStr)
				StopTalkTask()
				DeliverTalkTips(varMap, varPlayer)
				Msg2Player(varMap, varPlayer, varStr, CHAT_TYPE_NORMAL, CHAT_RIGHTDOWN);
				return 0;
			end	
	end
	return 1
end





function x310080_DeleteBus(varMap, busId)

	local busSize = GetBusSize(varMap, busId)
	for	varI = 0, busSize - 1 do
		local varObj = GetBusMemberObjId(varMap, busId, varI)
		if varObj ~= -1 then
			DelBusMember(varMap, varObj, busId)
			SetWanFaExpMult(  varMap, varObj,  0 )
			CancelSpecificImpact(varMap,varObj, 7060)
		end
	end
			
	DeleteBus(varMap, busId,1)
	
end






function x310080_RecordData(varMap, varPlayer,varIndex)
	SetPlayerGameData(varMap,varPlayer,MD_BUS_PATROL_RECORD[1],MD_BUS_PATROL_RECORD[2],MD_BUS_PATROL_RECORD[3],varIndex + 1)
end

function x310080_GetRecordData(varMap, varPlayer,varIndex)
	local result = GetPlayerGameData(varMap, varPlayer, MD_BUS_PATROL_RECORD[1], MD_BUS_PATROL_RECORD[2],MD_BUS_PATROL_RECORD[3] )
	return result - 1
end







function x310080_ProcIntoBusEvent(varMap, varPlayer, varTalknpc)
	
	local bIsBusMoving = IsBusMoving(varMap, varTalknpc)
	if bIsBusMoving > 0 then
		local varStr = "飞艇已经开出，无法乘坐飞艇";
		StartTalkTask(varMap)
			TalkAppendString(varMap, varStr);
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap, varPlayer, varStr, CHAT_TYPE_NORMAL, CHAT_RIGHTDOWN);
	
		return 0
	end

	
	if x310080_CheckAndDisplayError(varMap, varPlayer, varTalknpc) > 0 then
		AddBusMember(varMap, varPlayer, varTalknpc);

		SendSpecificImpactToUnit(varMap, varMap, varMap, varMap, 7060, 0)
		--隐藏玩家名字
    	ChangePlayerProperty(varMap, varPlayer, 0, 1)
		LuaCallNoclosure( 203782, "FinishGongche", varMap, varPlayer)
		LuaCallNoclosure( 203783, "FinishGongche", varMap, varPlayer)
		LuaCallNoclosure( 203784, "FinishGongche", varMap, varPlayer)
		LuaCallNoclosure( 203785, "FinishGongche", varMap, varPlayer)
		
		
		GamePlayScriptLog( varMap, varPlayer, 391)
		return 1;
	end
	return 0;
end






function x310080_ProcLeaveBusEvent(varMap, varPlayer,BusId)
   local nPlayerX, nPlayerZ = GetWorldPos(varMap, varPlayer)
	 
	 if IsPosCanGo(varMap,nPlayerX,nPlayerZ) >0 then
		 DelBusMember(varMap, varPlayer,BusId)
		 CancelSpecificImpact(varMap,varPlayer, 7060)
		 ChangePlayerProperty(varMap, varPlayer, 0, 0)
	 else
	 
	 Msg2Player(varMap,varPlayer,"很抱歉，您不能在这里下飞艇",8,3)
	 return 0
	 end
	 
end




function x310080_ProcTime(varMap,BusId)

	local bIsBusMoving = IsBusMoving(varMap, BusId)
	if bIsBusMoving <= 0 then
		return 0
	end

	local MemberNum = GetBusMemberCount(varMap,BusId)

	if MemberNum <= 0 then
		x310080_DeleteBus( varMap, BusId )
		return 0;
	end
	
	
	
	local pos
	for pos=0, tonumber(MemberNum ) do
		local varTalknpc = GetBusMemberObjId(varMap, BusId, pos)
		if varTalknpc > 0 then
		
			local nLevel = GetLevel( varMap, varTalknpc )
			
			
			local bonusExp = nLevel * 100 *x310080_exprate
			AddExp( varMap,varTalknpc, bonusExp )
			local varStr = "获得经验："..bonusExp.."点"
			
			StartTalkTask( varMap )
			TalkAppendString( varMap, varStr )
			StopTalkTask()
			DeliverTalkTips( varMap, varTalknpc )

			
			local bonusExpExt = floor((MemberNum-1)* 0.14 * bonusExp)
			if bonusExpExt > 0 then
			
				AddExp( varMap,varTalknpc, bonusExpExt )
				varStr = "额外获得经验："..bonusExpExt.."点"
					
				StartTalkTask( varMap )
				TalkAppendString( varMap, varStr )
				StopTalkTask()
				DeliverTalkTips( varMap, varTalknpc )
			end

			
			local bonusMoney = nLevel * 3*x310080_silvercardrate 
			AddMoney( varMap, varTalknpc, 1, bonusMoney)
            varStr = format( "获得银卡：#{_MONEY%d}", bonusMoney)

			StartTalkTask( varMap )
			TalkAppendString( varMap, varStr )
			StopTalkTask()
			DeliverTalkTips( varMap, varTalknpc )
			
		end
	end

	
	StopBusTimer(varMap,BusId)
	SetBusTimerTick(varMap , BusId, x310080_GetRandomTime());
	
end


function x310080_ProcLifeTimeOut(varMap,BusId)

end

function x310080_ProcWaitTimeOut(varMap,BusId)
	x310080_DeleteBus( varMap, BusId )
end

function x310080_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
end

function x310080_ProcDie(varMap,BusId,idKiller)
end
