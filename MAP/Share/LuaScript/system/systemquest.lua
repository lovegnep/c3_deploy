



x888891_var_FileId = 888891

x888891_var_AcceptMessage		= "#cffcf00您接受了任务：%s"
x888891_var_AbandonMessage	= "#cffcf00您放弃了任务：%s"
x888891_var_CompleteMessage	= "#cffcf00您完成了%s任务！"
x888891_var_AbandonErrorMessage	= "#cffcf00任务%s不能被放弃！"
x888891_var_BlueItemQuestList = {
									{misId = 9410, varScript = 300783},
								}
x888891_var_KadiziPoint =3
--需要自动化的任务
x888891_var_automission = {
3200,3201,3202,3203,3204,3205,3206,3211,3207,3208,3209,3210,3212,3213,3214,3295,3395,3498,3795,3269,3270,3271,3272,3273,3274,3275,3276,3277,3278,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3620,6002,6003,3369,3370,3371,3372,3373,3374,3375,3376,3377,3378,3379,3380,3381,3382,3383,3384,3385,3386,3387,3388,3389,3390,3391,3392,3621,6102,6103,3462,3463,3464,3465,3466,3467,3468,3469,3470,3471,3472,3473,3474,3475,3476,3477,3478,3479,3480,3481,3482,3483,3484,3485,3622,6202,6203,3769,3770,3771,3772,3773,3774,3775,3776,3777,3778,3779,3780,3781,3782,3783,3784,3785,3786,3787,3788,3789,3790,3791,3792,3623,6302,6303,1,2,20,3,4,5,7,8,9,19,6,10,11,13,14,15,16,17,18,3644,3645,3646,3647,3216,3316,3416,3716,3266,3366,3457,3766,3268,3368,3458,3768,3652,3653,3654,3655,3640,3641,3642,3643,3648,3649,3650,3651,6005,6105,6205,6305,50,51,52,53,54,55,56,57,58,60,59,61,62,63,64,66,3660,3661,3662,3663,4260,4261,4262,4263,4264,4265,4266,4267,4268,4269,4270,4271,4272,4273,4274,4275,4276,4277,4278,4279,4280,4281,4282,4283,4284,4285,4286,4287,4288,4289,4290,4291,4292,4293,4294,4295,4296,4297,4298,4299,4300,4301,4302,4303,4304,4305,4306,4307,4308,4309,4310,4311,4212,4213,4214,4215,4216,4217,4218,4219,2695,2696,2697,2698,4240,4241,4242,4243,4204,4205,4206,4207,4382,4383,4384,4385,4050,4051,4052,4053,4054,4055,4056,4057,4208,4209,4210,4211,2639,2640,2641,2642,2671,2672,2673,2674,2675,2676,2677,2678,2679,2680,2681,2682,4244,4245,4246,4247,4360,4361,4362,4363,3656,3657,3658,3659,6007,6107,6207,6307,100,101,102,103,104,105,106,108,109,110,111,112,113,114,117,115,116,123,124,125,126,127,6009,6109,6209,6309,1040,1041,1062,1064,1043,1045,1046,1047,1048,1049,1050,1055,1056,1066,1058,1059,1065,1067,1068,1069,1070,2699,2700,2701,2702,4002,4003,4004,4005,4220,4221,4222,4223,4224,4225,4226,4227,4248,4249,4250,4251,4312,4313,4314,4315,4316,4317,4318,4319,4320,4321,4322,4323,4324,4325,4326,4327,4328,4329,4330,4331,4332,4333,4334,4335,4336,4337,4338,4339,4340,4341,4342,4343,4344,4345,4346,4347,4348,4349,4350,4351,4352,4353,4354,4355,4356,4357,4358,4359,6011,6111,6211,6311
}
--需要关闭泡泡的任务
x888891_var_closepaopaomission = {
	[108]={6003,6103,6203,6303},
	[109]={6005,6105,6205,6305},
	[110]={6007,6107,6207,6307},
	[111]={6009,6109,6209,6309},
	[112]={6011,6111,6211,6311},
	[114]={6011,6111,6211,6311},
}

function x888891_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	--QuestCom(varMap,varPlayer,2699)
--	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,2639)  
--	SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)     
--	SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) > 0 then	
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			if questState == 7 then
				--x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_WANCHENG_WENHAO,1)
			elseif questState ==5 then
				--x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_JIESHOU_GANTANHAO,1)
			end
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
			return 1
		end
	end

	return 0
end


function x888891_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	

		if  IsNpcHaveQuestNM(varMap, varPlayer, varTalknpc, varQuest) == 1 then

			local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
			if varRet > 0 then	
				DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, varQuest )
				x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_WANCHENG_WENHAO,0)				 
				x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_JIESHOU_GANTANHAO,0)
				x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_JIESHOU_QUEDING,1)
			else
				local varText = "#cffcf00未知错误，无法接新的任务"
				if varRet == -1 then
					varText = "#cffcf00等级不足，无法接新的任务"
				elseif varRet == -2 then
					varText = "#cffcf00等级过高，无法接新的任务"
				elseif varRet == -3 then
					varText = "#cffcf00金钱不足，无法接新的任务"
				elseif varRet == -4 then
					varText = "#cffcf00您不是本国玩家，无法接新的任务"
				elseif varRet == -5 then
					varText = "#cffcf00职业类型不符，无法接新的任务"
				elseif varRet == -6 then
					varText = "#cffcf00阵营不符，无法接新的任务"
				elseif varRet == -7 then
					varText = "#cffcf00此人无此任务"
				end
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		else
			local varText = "#cffcf00此人无此任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			QuestComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
				x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_WANCHENG_WENHAO,0)				 
				x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_JIESHOU_GANTANHAO,0)
				x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_WANCHENG_QUEDING,1)
				--激活王城中心传送
				if varQuest == 3652 or varQuest == 3653 or varQuest == 3654 or varQuest == 3655 then
					if IsQuestHaveDone(varMap, varPlayer, varQuest) <= 0 then
						local temp ="#cffcf00您已经开通了#G中心广场#W#cffcf00传送！#W"  
						QuestCom(varMap,varPlayer,1520)
						Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", temp,500),8,3)
						AddExp(varMap, varPlayer,500)
					end
				end

		else
			QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		end
	end
end


function x888891_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
		local retAddQuest = AddQuestNM( varMap, varPlayer, varQuest ) 
		for varI = 0, 4 do
			local varMap, PosX, PosZ, tips = GetAskWayPosNM(varMap, varPlayer, varQuest, varI)
			if varMap ~= -1 then
				LuaCallNoclosure( UTILITY_SCRIPT, "AskTheWayPos", varMap, varPlayer, varMap, PosX, PosZ, tips )
			end
		end
		
		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x888891_var_AcceptMessage, varQuestName);
		local varText = message
		if retAddQuest == 0 then
			varText = "#cffcf00添加任务失败"

            StartTalkTask(varMap)
		    TalkAppendString(varMap, varText);
		    StopTalkTask(varMap)
		    DeliverTalkTips(varMap,varPlayer)
            
            return 1

		elseif retAddQuest == -1 then
			
            varText = "#cffcf00背包已满,请整理后再来接任务"
            
            StartTalkTask(varMap)
		    TalkAppendString(varMap, varText);
		    StopTalkTask(varMap)
		    DeliverTalkTips(varMap,varPlayer)

            return 1

		elseif retAddQuest == -2 then
            varText = "#cffcf00您的任务已满！"

            StartTalkTask(varMap)
		    TalkAppendString(varMap, varText);
		    StopTalkTask(varMap)
		    DeliverTalkTips(varMap,varPlayer)

            return 1
        end

        Msg2Player(varMap, varPlayer, varText, 0, 2)
		Msg2Player(varMap, varPlayer, varText, 0, 3)
		
		--对后续2类型(后续直接弹出任务列表)进行支持
		local AfterQuestType, AfterQuestScript = GetAfterQuestIdNM(varMap, varPlayer, varQuest)
		
		if AfterQuestType == 2 then
			local targetGUID = GetMonsterGUID(varMap, varTalknpc)
			StartTalkTask(varMap)
				local npcType = GetMonsterDataID(varMap, varTalknpc)
				local strText = "&&"..targetGUID.."&&"
				TalkAppendString(varMap, strText);
				OnNPCClickedQuestNM(varMap, varPlayer, varTalknpc, targetGUID)
				ShowNpcQuestEventList(varMap, varPlayer, varTalknpc)
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end
		
		return 1
	end

	return 0
end


function x888891_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
															
	local NeedKilledNum, InstIndex, ObjName = GetQuestNeedKillObjInfoNM( varMap, varPlayer, varQuest, varObjData, varObj )


	if NeedKilledNum == 0 then 
		local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
                    local varItemCount, varItem, ItemRand, ItemDropNum = GetQuestItemNM( varMap, humanObjId, varQuest, InstIndex )
                            
                    if varItemCount > 0 then
                        local ItemNumOnPlayer = GetItemCount( varMap, humanObjId, varItem )
                        if ItemNumOnPlayer < varItemCount then
                            local droprand = random(100)
                            if droprand <= ItemRand then
                                local dropnum = random(ItemDropNum)
                                if dropnum == 0 then
                                    dropnum = 1
                                end
                                if dropnum > varItem - ItemNumOnPlayer then
                                    dropnum = varItem - ItemNumOnPlayer
                                end
                                StartItemTask(varMap)
                                ItemAppend( varMap, varItem, dropnum )
                                local varRet = StopItemTask(varMap,humanObjId)
                                if varRet > 0 then
                                    DeliverItemListSendToPlayer(varMap,humanObjId)
                                else
                                    StartTalkTask(varMap)
                                    TalkAppendString(varMap,"#cffcf00物品栏已满，无法得到任务物品！")
                                    StopTalkTask(varMap)
                                    DeliverTalkTips(varMap,humanObjId)
                                end
                            end
                        end
                    end
                end
            end
		end
	elseif NeedKilledNum > 0 then 
		local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, HumenNum-1 do
				local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
                if humanObjId ~= -1 then
                    if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
                                local varText = "";
                                local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest )
                                local KilledNum = GetQuestParam( varMap, humanObjId, varQuestIdx, InstIndex )

                            if KilledNum < NeedKilledNum then
                                    SetQuestByIndex( varMap, humanObjId, varQuestIdx, InstIndex, KilledNum+1 )
                                    if KilledNum == NeedKilledNum - 1 then
                                            
                                                
                                                StartTalkTask(varMap)
                                                if ObjName == "" then
                                                    if NeedKilledNum > 1 then
                                                        varText = format( "#cffcf00您击毙了怪物(%d/%d)", KilledNum+1, NeedKilledNum )
                                                    else
                                                        varText = format( "#cffcf00您击毙了怪物(%d/%d)", KilledNum+1, NeedKilledNum )
                                                    end
                                                else
                                                    if NeedKilledNum > 1 then
                                                        varText = format( "#cffcf00您击毙了%s(%d/%d)", ObjName, KilledNum+1, NeedKilledNum )
                                                    else
                                                        varText = format( "#cffcf00您击毙了%s(%d/%d)", ObjName, KilledNum+1, NeedKilledNum )
                                                    end
                                                end
                                                TalkAppendString( varMap, varText )
                                                StopTalkTask( varMap )
                                                DeliverTalkTips( varMap, humanObjId )
                                            

                                            local MisCareNPC = QuestCareNPCNM( varMap, humanObjId, varQuestIdx )
                                            if MisCareNPC == 0 then 
                                                local varRet = QuestCheckSubmitNM( varMap, humanObjId, humanObjId, varQuest, varQuestIdx ) 
                                                if varRet > 0 then 
                                                    return x888891_QuestComplate( varMap, humanObjId, humanObjId, -1, varQuest )
                                                end
                                            end
                                    else
                                            StartTalkTask(varMap)
                                            if ObjName == "" then
                                                varText = format( "#cffcf00您击毙了怪物(%d/%d)", KilledNum+1, NeedKilledNum )
                                            else
                                                varText = format( "#cffcf00您击毙了%s(%d/%d)", ObjName, KilledNum+1, NeedKilledNum )
                                            end
                                            TalkAppendString( varMap, varText )
                                            StopTalkTask( varMap )
                                            DeliverTalkTips( varMap, humanObjId )
                                    end
                            end
                    end
                end
		end
	end
	return 0
end



function x888891_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	
	
	if IsQuestCanAbandonNM(varQuest) <= 0 then
		local message = format(x888891_var_AbandonErrorMessage, varQuestName);

        Msg2Player(varMap, varPlayer, message, 0, 2)
		Msg2Player(varMap, varPlayer, message, 0, 3)
		return		
	end
	
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		local message = format(x888891_var_AbandonMessage, varQuestName);

        Msg2Player(varMap, varPlayer, message, 0, 2)
		Msg2Player(varMap, varPlayer, message, 0, 3)


	else
		
		
	end
end

function x888891_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local npcName = GetName( varMap, varTalknpc )
	if npcName == "" then	
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if guid ~= -1 then 
		if guid == varTalkNpcGUID then	
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
	if questState == 7 then
		--x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_WANCHENG_WENHAO,1)
	end
end




function x888891_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varQuestName = GetQuestNameNM(varMap, varPlayer, varQuest);
		local varText = "#cffcf00您没有接受相关任务！"
		if varQuestName == nil or varQuestName == "" then
			varText = "#cffcf00您没有接受相关任务！"
		else
			varText = format("#cffcf00您没有接受%s！", varQuestName);
		end
		StartTalkTask(varMap)
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )

		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
	if varRet > 0 then
		for k,v in x888891_var_closepaopaomission do
			for i,j in v do
				if j == varQuest then
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,k,0)
				end
			end
		end
		
		x888891_showpaopao(varMap,varPlayer,varQuest,MAOPAO_WANCHENG_QUEDING,1)
		return x888891_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	end
	return 0
end


function x888891_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM( varMap,varPlayer,varQuest )<= 0 then
        return 0
    end
    
	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest,varButtonClick ) 
	if varRet == 1 then 
		
		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x888891_var_CompleteMessage, varQuestName);

        Msg2Player(varMap, varPlayer, message, 0, 2)
		Msg2Player(varMap, varPlayer, message, 0, 3)

        
        QuestBonusNotItemNM(varMap, varPlayer, varQuest )
		x888891_DisplayAwardInfo(varMap, varPlayer, varTalknpc, varQuest, varButtonClick)

        
        QuestBonusItemNM(varMap, varPlayer, varQuest ,varButtonClick)





		if varMap == 569 then
			if varQuest >= 10400 and varQuest <= 10424 then
				 LuaCallNoclosure(270204, "ProcQuestAward",  varMap, varPlayer, varTalknpc ,varQuest)
			end
		end			


		local AfterQuestType, AfterQuestScript = GetAfterQuestIdNM(varMap, varPlayer, varQuest)
		
		--对后续2类型(后续直接弹出任务列表)进行支持
		if AfterQuestType == 2 then
			local targetGUID = GetMonsterGUID(varMap, varTalknpc)
			StartTalkTask(varMap)
				local npcType = GetMonsterDataID(varMap, varTalknpc)
				local strText = "&&"..targetGUID.."&&"
				TalkAppendString(varMap, strText);
				OnNPCClickedQuestNM(varMap, varPlayer, varTalknpc, targetGUID)
				ShowNpcQuestEventList(varMap, varPlayer, varTalknpc)
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end
		
		if AfterQuestScript ~= -1 then
			if AfterQuestType == 0 then
				
				x888891_ProcEventEntry( varMap, varPlayer, varTalknpc, AfterQuestScript )
			else
				
				PushAfterQuestNM( varMap, varPlayer, varTalknpc, AfterQuestScript )
			end
		end
		return 1 
	else 
		StartTalkTask(varMap)
		local varText = "#cffcf00未知错误，无法完成任务"
		if varRet == -2 then
			varText = "#cffcf00请选择奖励物品"
		elseif varRet == -3 then
			varText = "#cffcf00背包已满,请整理后再来交任务"
		elseif varRet == -4 then
			varText = "#cffcf00扣除任务物品失败"
		end
		TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	return 0
end

function x888891_DisplayAwardInfo(varMap, varPlayer, varTalknpc, varButtonClick, varQuest, moneyType, money, expAward, honorType, honor, vigorType,vigor, guildRewardType,guildReward)
	if varQuest >= 0 then
		moneyType, money, expAward, honorType, honor, vigorType,vigor, guildRewardType,guildReward = AwardMoneyExpHonorNM(varMap, varPlayer, varTalknpc, varButtonClick, varQuest)
	end

	if expAward > 0 then
		Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00经验值的奖励。", expAward),4,2)
	end

    if money > 0 then
		if moneyType == 0 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G#{_MONEY%d}#cffcf00银币的奖励。", money),4,2)
		elseif moneyType == 1 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G#{_MONEY%d}#cffcf00银卡的奖励。", money),4,2)
		elseif moneyType == 2 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G#{_MONEY%d}#cffcf00金币的奖励。", money),4,2)
		elseif moneyType == 3 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G#{_MONEY%d}#cffcf00金卡的奖励。", money),4,2)
		else
		end
	end

	if honor > 0 then
		if honorType == 0 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00声望值的奖励。", honor),4,2)
		elseif honorType == 1 then	
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00声望值的奖励。", honor),4,2)
		elseif honorType == 2 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00PK值的奖励。", honor),4,2)
		elseif honorType == 3 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00荣誉值的奖励。", honor),4,2)
		elseif honorType == 4 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00帮贡值的奖励。", honor),4,2)
		elseif honorType == 5 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00文采值的奖励。", honor),4,2)
		elseif honorType == 6 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00威望值的奖励。", honor),4,2)
		elseif honorType == 7 then 
			Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00天赋值的奖励。", honor),4,2)
		end
	end

    if vigorType >= 0 and vigor > 0 then
        
        if vigorType == 0 then              
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00活力值的奖励。", vigor),4,2)
        elseif vigorType == 1 then          
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00魅力值的奖励。", vigor),4,2)
        elseif vigorType == 2 then          
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00天赋值的奖励。", vigor),4,2)
        end
    end

    if guildRewardType ~= nil and  guildRewardType >= 0 and guildReward > 0 then
        
        if guildRewardType == 0 then
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d点#cffcf00帮会经验值的奖励。", guildReward),4,2)
        elseif guildRewardType == 1 then
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d袋#cffcf00国家资源-食物的奖励。", guildReward),4,2)
        elseif guildRewardType == 2 then
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d两#cffcf00国家资源-金钱的奖励。", guildReward),4,2)
        elseif guildRewardType == 3 then
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d根#cffcf00国家资源-木材的奖励。", guildReward),4,2)
        elseif guildRewardType == 4 then
            Msg2Player(varMap,varPlayer,format("#cffcf00获得#G%d块#cffcf00国家资源-金属的奖励。", guildReward),4,2)
        end
    end

end


function x888891_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest, nChangeType)
    if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		if Num < NeedNum then 

            if nChangeType == 0 then 
                StartTalkTask(varMap)
                local varText = format("#cffcf00您获得了物品#G#{_ITEM%d}#cffcf00(%d/%d)", varItemData, Num, NeedNum )
                if varText == nil then
                    varText = "";
                end
                TalkAppendString( varMap, varText )
                StopTalkTask( varMap )
                DeliverTalkTips( varMap, varPlayer )
            end
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		elseif Num >= NeedNum then
			
			
			local ShowNum = Num 
			if ShowNum > NeedNum then
				ShowNum = NeedNum
			end
			
			
            if nChangeType == 0 then 
                StartTalkTask(varMap)
                local varText = format( "#cffcf00您获得了物品#G#{_ITEM%d}#cffcf00(%d/%d)", varItemData, ShowNum, NeedNum )
                if varText == nil then
                    varText = "";
                end
                TalkAppendString( varMap, varText )
                StopTalkTask( varMap )
                DeliverTalkTips( varMap, varPlayer )
            end
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, ShowNum )         
			
			local MisCareNPC = QuestCareNPCNM( varMap, varPlayer, varQuestIdx )
			if MisCareNPC == 0 then 
				local varRet = QuestCheckSubmitNM( varMap, varPlayer, varPlayer, varQuest, varQuestIdx ) 
				if varRet > 0 then 
					return x888891_QuestComplate( varMap, varPlayer, varPlayer, -1, varQuest )
				end
			end
		end
	else
        if ObjIndex >= 0 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, 0 )         
        end

    end
end

function x888891_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

    if varQuest < 0 then
        return 0
    end

	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local QuestIdx = GetQuestEnterAreaIndexNM( varMap, varPlayer, varQuest, varArea )
	if QuestIdx == -1 then
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, QuestIdx ) == 0 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, QuestIdx, 1 )
		SendQuestEnterAreaTipsNM( varMap, varPlayer, varPlayer, varQuest, QuestIdx )
	end

	
	local MisCareNPC = QuestCareNPCNM( varMap, varPlayer, varQuestIdx )
	if MisCareNPC == 0 then 
		local varRet = QuestCheckSubmitNM( varMap, varPlayer, varPlayer, varQuest, varQuestIdx ) 
		if varRet > 0 then 
			return x888891_QuestComplate( varMap, varPlayer, varPlayer, -1, varQuest )
		end
	end

	return 1
end


function x888891_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
end


function x888891_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end




function x888891_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	

	local varItem = GetItemTableIndexByIndex( varMap, varPlayer, varBagIdx ) 
	local varQuest = GetQuestIDByItemIDNM( varMap, varPlayer, varItem )

	if varQuest == -1 then 	
		return 0
	end

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local scene, posx, posz, radii, QuestIdx, dispStr, bDispOther, otherStr, errorStr = GetQuestUseItemInfoNM( varMap, varPlayer, varQuest, varItem )
	if scene == -1 or varMap ~= scene then 
		local varText = errorStr
        if errorStr == nil or errorStr == "" then
            varText = "#cffcf00无法在这里使用这个物品，请查看任务描述！"
        end
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		return 0
	end

	if posx > 0 then 
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

		local distanceRet = radii * radii - (posx - PlayerPosX) * (posx - PlayerPosX) - (posz - PlayerPosZ) * (posz - PlayerPosZ)
		if distanceRet <= 0 then
            local varText = errorStr
            if errorStr == nil or errorStr == "" then
			    
                varText = "#cffcf00无法在这里使用这个物品，请查看任务描述！"
            end
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			return 0
		end
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, QuestIdx ) == 1 then
		return 0
	end

	
	if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, QuestIdx, 1 )
	StartTalkTask(varMap)
	TalkAppendString(varMap, dispStr)
	DeliverTalkTips(varMap,varPlayer) 
	StopTalkTask(varMap)

	
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end

	
	local MisCareNPC = QuestCareNPCNM( varMap, varPlayer, varQuestIdx )
	if MisCareNPC == 0 then 
		local varRet = QuestCheckSubmitNM( varMap, varPlayer, varPlayer, varQuest, varQuestIdx ) 
		if varRet > 0 then 
			return x888891_QuestComplate( varMap, varPlayer, varPlayer, -1, varQuest )
		end
	end

	return 1
end





function x888891_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	local varQuest, varNeedItemCount, varCollNum = GetItemIdInItemBoxNM( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	if varQuest == -1 then
		return 1 
	end

	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 1
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varQuestName = GetQuestNameNM(varMap, varPlayer, varQuest)
		local varStr = "#cffcf00您没有接受相关任务！"
		if varQuestName == nil or varQuestName == "" then
			varStr = "#cffcf00您没有接受相关任务！"
		else
			varStr = format("#cffcf00您没有接受%s！", varQuestName);
		end
		StartTalkTask(varMap)
		TalkAppendString(varMap,varStr)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end

	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
	if varItemCountNow >= varNeedItemCount then
		local varStr = "#cffcf00物品已经收集齐全！"
		if varNeedItemCount > 0 then	
			varStr = "#cffcf00物品已经收集齐全！";
		else
			varStr = "#cffcf00您不需要这个物品！";
		end
		StartTalkTask(varMap)
		TalkAppendString(varMap,varStr)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end

	return 0
end


function x888891_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	local varQuest, varNeedItemCount, varCollNum = GetItemIdInItemBoxNM( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	if varQuest == -1 then
		return 1 
	end

	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
	if varItemCountNow >= varNeedItemCount then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#cffcf00物品已经收集齐全")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	
	local varItemAdd = varNeedItemCount - varItemCountNow
	if varCollNum == -1 then
		varItemAdd = 1
	else
		if varItemAdd > varCollNum then
			varItemAdd = varCollNum
		end
	end
	if varItemAdd > 1 then
		varItemAdd = random(varItemAdd)
		if varItemAdd == 0 then
			varItemAdd = 1
		end
	end

	StartItemTask( varMap )
	ItemAppend( varMap, varNeedItem, varItemAdd )
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#cffcf00无法得到采集物品，请整理道具栏！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
end


function x888891_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


function x888891_OpenCheck( varMap, varPlayer, varTalknpc )
end





function x888891_CreateBus( varMap, varPlayer, varTalknpc, varQuest )
	
	local PosX,PosZ = GetWorldPos(varMap, varPlayer)
	
	
	
	
	
	
	
	
	local  CarType, BaseAI, AIScript, EventScript, Impact, Name, Title, WaitTime,  LifeTime, PatrolID = GetQuestBusInfoNM(varMap, varPlayer, varQuest)
	
	
	local varObj = CreateBus(varMap, CarType, PosX, PosZ, BaseAI, AIScript, EventScript, varPlayer, Impact, varQuest,varTalknpc)
end



function x888891_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)

	
	

	
	local  CarType, BaseAI, AIScript, EventScript, Impact, Name, Title, WaitTime,  LifeTime, PatrolID = GetQuestBusInfoNM(varMap, varPlayer, varQuest)	
	local BusTitle = GetName( varMap, varPlayer ).."的"..Title
	SetBusTitle(varMap , busId, BusTitle)
	
	
	
	
	
	SetBusTimerTick(varMap , busId, 1000)
	SetBusTimerOpen(varMap, busId, 1)
	if WaitTime>0 then
		SetBusWaitTime(varMap , busId, WaitTime)
	end
	if LifeTime>0 then
		SetBusLifeTime(varMap , busId, LifeTime)
	end
	
	
	local BusType  = GetBusType(varMap, busId)
	local MessageStr = ""
	if BusType == 0 then
		MessageStr = "你开始运镖了"
	elseif BusType == 1 then
		
		if PatrolID == -1 then
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"资料填写补全,护送没有绑巡逻路径");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)	
			return
		end
		SetBusPatrolId(varMap , busId, PatrolID)
		MessageStr = "你开始护送了,不要离开BUS超过5米"
	else
		MessageStr = "-_!!资料填写有误,请检查"	
	end
		
	StartTalkTask(varMap)
	  TalkAppendString(varMap,MessageStr);
	StopTalkTask()
	DeliverTalkTips(varMap,varPlayer)	
end




function x888891_DeleteBus(varMap, varObj)		
	DeleteBus(varMap, varObj,1)
end





function x888891_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"你已经在车里了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
			
	local BusSize = GetBusSize(varMap,varTalknpc) 
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)
	
	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"这辆车已经人满了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	

	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )	
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end



function x888891_ProcLeaveBusEvent(varMap, varPlayer,BusId)
	local BusType  = GetBusType(varMap, BusId)
	if BusType == 0 then	
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在运镖，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
	elseif  BusType == 1 then	
		DelBusMember(varMap, varPlayer,BusId)
	end
end


function x888891_ProcTime(varMap, BusId, varQuest)
    
    
    if( IsObjValid(varMap,BusId) ~= 1 )then
        return
    end
    
	local BusPosX, BusPosZ = GetWorldPos(varMap, BusId)
	
	local EndSceneID = -1
	local EndPosX = 0
	local EndPosZ = 0
	
	
	local roadId = GetQuestXunLuIndexNM( varQuest )
	if roadId > 0 then
		EndSceneID,EndPosX,EndPosZ = GetQuestEndPosNM( roadId )
	else
        
		
		
		
		
		return
	end

	if varMap == EndSceneID then
		local distance = floor((BusPosX-EndPosX)*(BusPosX-EndPosX)+(BusPosZ-EndPosZ)*(BusPosZ-EndPosZ))
		if distance<100 then
			
			
			local  varPlayer = GetBusMemberObjId(varMap,BusId,0)
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"任务完成");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
			x888891_DeleteBus(varMap, BusId)	
			
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
			local QuestIdx = GetQuestHuSongIndexNM( varMap, varPlayer, varQuest )	
			if QuestIdx > 0 and varQuestIdx > 0 then
				if GetQuestParam( varMap, varPlayer, varQuestIdx, QuestIdx ) == 0 then
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, QuestIdx, 1 )	
				end
			end
		end
	end
end

function x888891_ProcLifeTimeOut(varMap, BusId, varQuest)
	
	
	
	local  varPlayer = GetBusMemberObjId(varMap,BusId,0)
	StartTalkTask(varMap)
	  TalkAppendString(varMap,"任务失败");
	StopTalkTask()
	DeliverTalkTips(varMap,varPlayer)
	x888891_DeleteBus(varMap, BusId)
	
	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	local varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		Msg2Player( varMap, varPlayer, "#R护送任务["..varQuestName.."]失败！", MSG2PLAYER_PARA )
	end
end

function x888891_ProcWaitTimeOut(varMap, BusId, varQuest)
	
	
	local  varPlayer = GetBusMemberObjId(varMap,BusId,0)
	StartTalkTask(varMap)
	  TalkAppendString(varMap,"任务失败");
	StopTalkTask()
	DeliverTalkTips(varMap,varPlayer)
	x888891_DeleteBus(varMap, BusId)

	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	local varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		Msg2Player( varMap, varPlayer, "#R护送任务["..varQuestName.."]失败！", MSG2PLAYER_PARA )
	end
end

function x888891_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
end

function x888891_ProcDie( varMap, varKiller , BusId, varQuest)
	
	local  varPlayer = GetBusMemberObjId(varMap,BusId,0)
	StartTalkTask(varMap)
	  TalkAppendString(varMap,"任务失败");
	StopTalkTask()
	DeliverTalkTips(varMap,varPlayer)

	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	local varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		Msg2Player( varMap, varPlayer, "#R护送任务["..varQuestName.."]失败！", MSG2PLAYER_PARA )
	end
end

function x888891_ProcSelectSubmitItem( varMap, varPlayer , varBagIdx,nGuid_Serial, nGuid_Server, nGuid_World)
	
	for varI,item in x888891_var_BlueItemQuestList do
		if IsHaveQuestNM( varMap, varPlayer, item.misId )>0 then
			LuaCallNoclosure(item.varScript,"ProcSelectSubmitItem", varMap,varPlayer,varBagIdx,nGuid_Serial, nGuid_Server, nGuid_World)
		end
	end
	return 1
end

function x888891_showpaopao(varMap,varPlayer,varQuest,paopaoid,turn)
	--判断是否是自动化任务
	local temp = 0
	for k,v in x888891_var_automission do
		if v == varQuest then
			temp = 1
			break
		end
	end

	if temp ==0 then return end
	--添加泡泡
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, paopaoid,turn ) 

end
