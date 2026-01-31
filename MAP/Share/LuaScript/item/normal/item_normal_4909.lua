
		
x404909_var_FileId = 404909 


x404909_var_DestSceneName = "练功人偶"
x404909_var_Get_Exp_Max_Cnt = 10 
x404909_var_BossType  = 9526
x404909_var_QuestID = 9091 


x404909_var_Max_Monster_Per_Scene		=  10		

function x404909_GetMonsterCount(varMap, varPlayer)
	local varCount = 0;
	local nMonsterCount = GetMonsterCount(varMap)
	for varI=1,nMonsterCount do
    	local varObj		 	= 	GetMonsterObjID(varMap,varI-1)
		
			local npcType 		= 	GetMonsterDataID(varMap,varObj)

			if npcType == 9526 or npcType == 9527 then
				varCount = varCount + 1
			end
		
	end
	
	return varCount
end


function x404909_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if varMap == 14 then 
		Msg2Player( varMap, varPlayer, "不能在舞厅使用该道具", 8, 3)
		return 
	end
	SetPlayerRuntimeData(varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER,varBagIdx) 
	local nCnt  =  x404909_GetDayCount(varMap, varPlayer) + 1
	if    nCnt  >  x404909_var_Get_Exp_Max_Cnt then
		  local varText = "#Y专攻训练：\n\t#W您今天可以获得专攻点数的杀人上限#R已满#W，不能再通过击败练功人偶获得专攻点数。\n \n#Y专防训练：\n\t#W练功人偶可以#G帮助#W您完成“防御之路”任务，击败练功人偶相当于击败#G任何职业#W的玩家。\n \n#Y荣誉：\n\t#W本日荣誉未满的情况下，击败练功人偶仍可以获得荣誉。\n \n\t#R您是否要坚持使用？"
		  StartTalkTask(varMap)
		  TalkAppendString(varMap, varText)
		  StopTalkTask(varMap)
		  
		  
		  DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x404909_var_FileId, x404909_var_QuestID,  0)
		  
		  return 
	else
		  x404909_ProcMyTask( varMap, varPlayer)
	end

end

function x404909_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x404909_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x404909_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x404909_ProcDeplete( varMap, varPlayer )

	return 0
end

function x404909_ProcActivateOnce( varMap, varPlayer )
end

function x404909_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x404909_ProcDie(varMap, varPlayer, varKiller)
	
	
	
	
	
	
	
	
	
	
	local killerLevel = GetLevel(varMap, varKiller)
	local diedLevel   = killerLevel
	

	
	local honor = (diedLevel * diedLevel / (killerLevel + diedLevel)) / 2
	local killerCountry = GetCurCountry(varMap, varKiller)
	
	if killerCountry == 0 then  
		LuaCallNoclosure(300980,"x300980_Reset_Cnt",varMap, varKiller) --楼兰脚本
	elseif killerCountry == 1 then
		LuaCallNoclosure(300981,"x300981_Reset_Cnt",varMap, varKiller) --天山脚本
	elseif killerCountry == 2 then
		LuaCallNoclosure(300982,"x300982_Reset_Cnt",varMap, varKiller) --昆仑脚本 
	elseif killerCountry == 3 then
		LuaCallNoclosure(300983,"x300983_Reset_Cnt",varMap, varKiller) --敦煌脚本
	end

	
	local tempHonor = floor(honor);
	if honor >= tempHonor + 0.5 then
		honor = tempHonor + 1
	else
		honor = tempHonor
	end
	
	local realHonor = x404909_IsCanAddHonor(varMap, varPlayer, varKiller, honor)
	if  realHonor ~= -1 then
		SetHonorInfo(varMap, varKiller, "HONORNUM", GetHonorInfo(varMap, varKiller, "HONORNUM") + realHonor)
		AddHonor(varMap, varKiller, realHonor)
		local szMsg = "获得荣誉#G" .. realHonor .. "#o点"
		local killerName = GetName(varMap,varKiller)
		LuaScenceM2Player(varMap, varKiller, szMsg, killerName, CHAT_RIGHTDOWN, 1 )	
		
		local totalHonor = GetHonor(varMap,varKiller)
		--WriteLog(1,format("===========new=========== todayHonor=%d, totalHonor=%d", GetHonorInfo(varMap, varKiller, "HONORNUM"), totalHonor))
	end
	
	
	
	
			local nCnt  =  x404909_GetDayCount(varMap, varKiller) + 1
			if    nCnt  >  x404909_var_Get_Exp_Max_Cnt then
				  return -1
			else
				local strMSG = AddInherenceZhuanGongExp(varMap,varKiller)
				Msg2Player(varMap,varKiller,strMSG,8,2)
				x404909_SetDayCount(varMap, varKiller)
			end

end






function x404909_GetDayCount(varMap, varPlayer)
	if x404909_var_Get_Exp_Max_Cnt > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DATE[1], MD_TISHENSHADAI_DATE[2], MD_TISHENSHADAI_DATE[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DAYCOUNT[1], MD_TISHENSHADAI_DAYCOUNT[2], MD_TISHENSHADAI_DAYCOUNT[3])
		return varDaycount

	end
	return 0
end







function x404909_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DATE[1], MD_TISHENSHADAI_DATE[2], MD_TISHENSHADAI_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DATE[1], MD_TISHENSHADAI_DATE[2], MD_TISHENSHADAI_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DAYCOUNT[1], MD_TISHENSHADAI_DAYCOUNT[2], MD_TISHENSHADAI_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DAYCOUNT[1], MD_TISHENSHADAI_DAYCOUNT[2], MD_TISHENSHADAI_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_TISHENSHADAI_DAYCOUNT[1], MD_TISHENSHADAI_DAYCOUNT[2], MD_TISHENSHADAI_DAYCOUNT[3], varDaycount+1)		
	end
end


function x404909_ComputeZhuanJingTianfuCnt( varMap, varDeader, varKiller )

	local nCnt = x404909_GetDayCount(varMap,varKiller) + 1
	
	if nCnt > x404909_var_Get_Exp_Max_Cnt then
		return
	else
		
		
		
		local strMSG = AddInherenceZhuanGongExp(varMap,varKiller)
		
		local killerName = GetName(varMap,varKiller)
		LuaScenceM2Player(varMap, varKiller, strMSG, killerName, CHAT_RIGHTDOWN, 1 )
		
		x404909_SetDayCount(varMap,varKiller)
	end		
end


function x404909_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x404909_ProcAccept( varMap, varPlayer )
end

function x404909_ProcMyTask( varMap, varPlayer)
	
	
	if GetSceneType(varMap) ~=0 then
			StartTalkTask(varMap)
		  TalkAppendString(varMap, "这里无法使用该道具，请前往普通场景！")
		  StopTalkTask(varMap)
		  DeliverTalkTips(varMap, varPlayer)
		  return 
	end
	
	if x404909_GetMonsterCount(varMap, varPlayer) == 50 then
		  StartTalkTask(varMap)
		  TalkAppendString(varMap, "本场景内人偶过多，请击败后再继续召唤！")
		  StopTalkTask(varMap)
		  DeliverTalkTips(varMap, varPlayer)
		  return 
	end
	
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
	local nGuid   = GetGUID(varMap,    varPlayer)
	local nCampId = 21
	
	
	
	local varItemCount = GetItemCountInBag( varMap, varPlayer, 12030217)
	
	if varItemCount >= 1 then 
			local varBagIdx = GetPlayerRuntimeData( varMap, varPlayer ,RD_GUILDCONTEND_KILL_LEADER ) 
			if DelItemByIndexInBag( varMap, varPlayer,varBagIdx , 1) ~= 1 then return 0 end
	else
			
			return 0
	end
	local r0 = random(-1,1)
	local r1 = random(-1,1)
	local jingxiang = GetViewGroup(varMap,varPlayer)
	local varRet = CreateMonster( varMap, x404909_var_BossType, PlayerPosX+r0, PlayerPosZ+r1, 7, -1, x404909_var_FileId, nGuid, 21, 3*60000,0,"","",-1,jingxiang) 

	if varRet > 0 then
					local message = "练功人偶出现了"
					Msg2Player(varMap,varPlayer,message, 8, 2)
					Msg2Player(varMap,varPlayer,message, 8, 3)
	else
					local varText = format("这里无法召出练功人偶" )
					StartTalkTask(varMap)
					TalkAppendString(varMap, varText)
					StopTalkTask(varMap)
					DeliverTalkTips(varMap, varPlayer)
					Msg2Player(varMap,varPlayer,varText, 8, 2)
	end	
end





function x404909_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x404909_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	x404909_ProcMyTask( varMap, varPlayer)
end


function x404909_IsCanAddHonor(varMap, varPlayer, varKiller, varHonor)
	
	local varToday = GetDayOfYear()
	local honorDay = GetHonorInfo(varMap, varKiller, "HONORDAY") 
	if varToday ~= honorDay then
		SetHonorInfo(varMap, varKiller, "HONORDAY", varToday)
		SetHonorInfo(varMap, varKiller, "HONORNUM", 0)
	end
	
	local selfLevel = GetLevel(varMap, varKiller)
	local honorNum = GetHonorInfo(varMap, varKiller, "HONORNUM")
	local peerVipValue = GetPeerVipBenefit(varMap, varKiller, 4)
	local honorMax = 0
	
	if IsHaveSpecificImpact( varMap, varKiller, 9016) > 0 then
		honorMax = selfLevel * (40 + peerVipValue * 2)
	else
		honorMax = selfLevel * (20 + peerVipValue)
	end
	
	local totalHonor = GetHonor(varMap,varKiller)
	--WriteLog(1,format("===========old=========== todayHonor=%d, totalHonor=%d, vipBenefit=%d, maxHonorToday=%d", honorNum, totalHonor, peerVipValue, honorMax))
	
	if honorNum >= honorMax then
		Msg2Player(varMap,varKiller,"你今天已经达到每日杀人荣誉上限，今天不能再通过击杀木偶人来获得荣誉。", 8, 2) 
		return -1
	end
	
	if honorNum + varHonor > honorMax then
		return honorMax - honorNum
	end
	
	return varHonor
end
