x300150_var_FileId = 300150
x300150_var_Buf1	= 9825


x300150_var_METAIL_GAME_INVALID = -1
x300150_var_METAIL_GAME_STARTING = 0
x300150_var_METAIL_GAME_STARTED = 1
x300150_var_METAIL_GAME_THINK = 2
x300150_var_METAIL_GAME_FINISH = 3


x300150_var_METAIL_GAME_ITEM_NUM = 3


x300150_var_TotalQuests = 20
x300150_var_ThinkTimeLen = 5000



function x300150_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4 )
	
	local varMapType = GetSceneType(varMap);
	if varMapType ~= 0 then
		return
	end
	
	MentalGameAskRandSeed( varMap, varAct )
	
	SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_STARTING )

	SetSystemTimerTick( varMap, x300150_var_FileId, "ProcMapTimerTick", varAct, 30*1000 ) 
end


function x300150_ProcMapTimerTick( varMap, varAct, varTime )
	
	

	local varStatus = GetMentalGameStatus( varMap )
	
	if varStatus == x300150_var_METAIL_GAME_STARTING then
		
		
		SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_STARTED )
		
		SetSystemTimerTick( varMap, x300150_var_FileId, "ProcMapTimerTick", varAct, 5000 ) 

	elseif varStatus == x300150_var_METAIL_GAME_STARTED then
		
		local varMentalGameCycle = GetMentalGameCycle( varMap )
		if varMentalGameCycle < x300150_var_TotalQuests then
		
			
			MentalGameBroadCastQuiz( varMap, varAct, varMentalGameCycle, 0 ) 
			
			SetSystemTimerTick( varMap, x300150_var_FileId, "ProcMapTimerTick", varAct, x300150_var_ThinkTimeLen ) 

			SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_THINK )

			IncMentalGameCycle( varMap )	
			
			MentalGameAskNameList( varMap, varAct )	
		elseif varMentalGameCycle == x300150_var_TotalQuests then
			SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_STARTED )
			SetSystemTimerTick( varMap, x300150_var_FileId, "ProcMapTimerTick", varAct, 5*1000 ) 
			IncMentalGameCycle( varMap )	
			MentalGameAskNameList( varMap, varAct )	
		else
			SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_FINISH )
			
			MentalGameGiveAward( varMap, varAct )
			MentalGameFinished( varMap,varAct) 

		end
		
	elseif varStatus == x300150_var_METAIL_GAME_THINK then
		
		SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_STARTED )
	
		SetSystemTimerTick( varMap, x300150_var_FileId, "ProcMapTimerTick", varAct, 11*1000 ) 

	elseif varStatus == x300150_var_METAIL_GAME_FINISH then
	
	    MentalGameGiveAward( varMap, varAct )
		SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_INVALID )
		
	end
end


function x300150_StartGame( varMap, varAct )

	


  
	InitMentalGame( varMap, varAct )	
	
	
	SetAllPlayerRuntimeDataInScene( varMap, RD_HUMAN_MENTALGAME, -1 )

	
	SetMentalGameStatus( varMap, x300150_var_METAIL_GAME_STARTING )

	
	
	BroadCastMentalGameStart(varMap, varAct)

end




-- 不成功返回 -1 将使程序不设置答题 Mutex 状态 
function x300150_ProcSignUpSuccessed( varMap, varPlayer, varAct )

	
	local varStatus = GetMentalGameStatus( varMap )
	
	if varStatus ~= x300150_var_METAIL_GAME_STARTING then
		return -1
	end
	

	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，乘坐战车状态不能参与智力竞赛。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -1
	end		
	
	local nSignUpIndex = SignUpMentalGame( varMap, varPlayer, varAct )
	if nSignUpIndex == -1 then
		return -1
	end
	
	

	
	SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_MENTALGAME, nSignUpIndex)
	
	
	
	
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300150_var_Buf1, 0);
	
	
	InitMentalGame_Player( varMap, varPlayer, x300150_var_METAIL_GAME_ITEM_NUM );
	
	GamePlayScriptLog( varMap, varPlayer, 91)
	
	ShowMentalGameInterface( varMap, varPlayer, varAct )
	
	return 1
end



function x300150_ProcUnSignUp( varMap, varPlayer, varAct )
	
	CancelSpecificImpact(varMap, varPlayer, x300150_var_Buf1);
end

function x300150_GiveAward( varMap, varPlayer, score, sortid )














	local gudingjiangli = ( GetLevel(varMap, varPlayer) * 2000 ) /2;
	local fujiajiangli	= 0
	
		if score < 460 then
			fujiajiangli = ( GetLevel(varMap, varPlayer) * score * 10 ) /2;
		else
			fujiajiangli = ( GetLevel(varMap, varPlayer) * score * 10 )
		end	
	local paimingjiangli = gudingjiangli + fujiajiangli;
	local paimingtishi;
	if sortid < 3 then
		if sortid == 0 then
			paimingjiangli = paimingjiangli * 2;



		elseif sortid == 1 then
			paimingjiangli = paimingjiangli * 1.5;



		else
			paimingjiangli = paimingjiangli * 1.2



		end
	end
	AddExp(varMap, varPlayer, paimingjiangli);
	
	GamePlayScriptLog( varMap, varPlayer, 92)
	
	local varStr = "";
	if(sortid < 3) then
		if(fujiajiangli > 0) then
			varStr = format("#o在本次智力竞赛活动中你获得了#r#R%d点经验#o的固定奖励,#r#R%d点经验#o的附加奖励,#r由于您在本次答题中获得了#R第%d名#o,#r您获得了#R%d点经验#o的总奖励！", gudingjiangli, fujiajiangli, sortid+1, paimingjiangli);
		else
			varStr = format("#o在本次智力竞赛活动中你获得了#r#R%d点经验#o的固定奖励,#r由于您在本次答题中获得了#R第%d名#o,#r您获得了#R%d点经验#o的总奖励！", gudingjiangli, sortid+1, paimingjiangli);
		end
	else
		if(fujiajiangli > 0) then
			varStr = format("#o在本次智力竞赛活动中你获得了#r#R%d点经验#o的固定奖励,#r#R%d点经验#o的附加奖励,#r您获得了#R%d点经验#o的总奖励！", gudingjiangli, fujiajiangli, paimingjiangli);
		else
			varStr = format("#o在本次智力竞赛活动中你获得了#r#R%d点经验#o的固定奖励,#r您获得了#R%d点经验#o的总奖励！", gudingjiangli, paimingjiangli);
		end
		
	end
	Msg2Player(varMap, varPlayer, varStr, 4, 2);
end
