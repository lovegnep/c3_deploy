x310163_var_FileId 		= 310163


x310163_var_DengmiInfo	= {
							{varIndex=1,varTalknpc=-1,GUID = 141506,Done=0},
							{varIndex=2,varTalknpc=-1,GUID = 141507,Done=0},
							{varIndex=3,varTalknpc=-1,GUID = 141508,Done=0},
							{varIndex=4,varTalknpc=-1,GUID = 141509,Done=0},
						  }
						  

x310163_var_DengmiNoMD	= {
							MD_DENGMI_NO1,
							MD_DENGMI_NO2,
							MD_DENGMI_NO3,
							MD_DENGMI_NO4,
						  }




x310163_var_DengmiTimer	= { nStart = -1,varIndex = -1 }
x310163_var_DengmiArray 	= {}



x310163_var_GameId		= 1007			
x310163_var_LimitLevel	= 40			
x310163_var_LimitSceneId	= 0				


x310163_var_GameID_Right	= 961
x310163_var_GameID_Error	= 962






x310163_var_ExpBonus		= 500	
x310163_var_ExpBonus1		= 650 
x310163_var_ShengWang		= 0			
x310163_var_MoneyBonus	= 15	


x310163_var_ItemRate		= 25			
x310163_var_ItemList		= { 			
							{12030107,1}			
						  }


x310163_var_QuestGL		= 50			
x310163_var_QuestId		= 9315			
x310163_var_QuestBonus	= 13015012		




function x310163_CheckValid( varMap,varPlayer)

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel<x310163_var_LimitLevel then
		return -1
	end
	
	if varMap ~= x310163_var_LimitSceneId then
		return -2
	end
	
	return 1

end




function x310163_IsStartTimeValid()
	local h,m = x310163_GetValidTimeHourMin()
	
	local cur  = h*60  + m
	local from = 19*60 + 30
	local to   = 24*60 + 00
	if cur < from or cur > to then
		
		
		local strMsg = format("DML:<Info>x310163_IsStartTimeValid starttime invalid started  h=%d,m=%d", h, m )
    	WriteLog( 1, strMsg )
		return 0
	end
	
	return 1

end








function x310163_IsPlayerGamingFull( varMap,varPlayer )

	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_DATE[1], MD_QUEST_DENGMI_DATE[2], MD_QUEST_DENGMI_DATE[3] )
	local varCount  = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3])

	local nCurDay = GetDayOfYear()
	if nCurDay == nDate then
		if varCount >= x310163_var_MaxCount then
			return 1
		end
	end

	return 0
end




function x310163_FindNpc(varMap,varTalknpc)
	
	for n,item in x310163_var_DengmiInfo do
		if varTalknpc == item.varTalknpc then
			return n
		end
	end
	
	return -1
							
end




function x310163_SaveDateMD( varMap,varPlayer,nCurDay )

	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1],MD_DENGMI_DATE[2],MD_DENGMI_DATE[3],nCurDay)

end




function x310163_GiveJewMap( varMap,varPlayer )
	local varName = GetName(varMap,varPlayer)
	local buff 	=	9011
	local buff1 =	9013
	local buff2 =	9012
	if varName == nil then
		varName = "Error"
	end
	local varItemCount = getn(x310163_var_ItemList)
	if varItemCount > 0 and x310163_var_ItemRate > 0  then

		
		local bGet = random(1,100)
		if bGet <= x310163_var_ItemRate then
			
			
			local nGetItem = random(1,varItemCount)
			
			local itemInfo = x310163_var_ItemList[nGetItem]
			
			StartItemTask(varMap)
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1  or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
            	ItemAppend( varMap, itemInfo[1],itemInfo[2] )
            else
            	ItemAppendBind( varMap, itemInfo[1],itemInfo[2] )
            end
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet > 0 then
            	
                DeliverItemListSendToPlayer(varMap,varPlayer)
                




		    else
		    	LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到奖励物品！", varName , 2,1)
		        LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到奖励物品！", varName , 3,1)
            end
		end
	end
end




function x310163_GetBonusExp( varMap,varPlayer )

	
	if GetGameOpenById(x310163_var_GameId) ~= 1 then
		return
	end
	
	
	if x310163_CheckValid( varMap,varPlayer ) ~= 1 then
		return
	end
	
	local score = x310163_GetDengmiScore( varMap ,varPlayer)
	local varLevel = GetLevel(varMap,varPlayer)
	return varLevel*350*score
end


function x310163_GiveBonus( varMap,varPlayer, multi )

	
	if GetGameOpenById(x310163_var_GameId) ~= 1 then
		return
	end
	
	
	if x310163_CheckValid( varMap,varPlayer ) ~= 1 then
		return
	end
	
	local varLevel = GetLevel(varMap,varPlayer)
	return varLevel*875*multi
end




function x310163_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )


	if GetGameOpenById(x310163_var_GameId) ~= 1 then
		return
	end
	
	
	
	local md = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NO1[1],MD_DENGMI_NO1[2],MD_DENGMI_NO1[3])
	
    TalkAppendButton(varMap,x310163_var_FileId,"我要猜灯谜",3,x310163_var_FileId)
        
    
    x310163_InitDengmiArray( varMap, varPlayer)
end




function x310163_AddDengmiAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)

	
	local arr_answer = { {varAnswer1,11001,0},{varAnswer2,11002,0},{varAnswer3,11003,0},{varAnswer4,11004,0} }
	for varI=1,4 do
		
		local varCount = getn(arr_answer)
		local n = random(1,varCount)
		while arr_answer[n][3] == 1 do
			n = random(1,varCount)
		end
		
		arr_answer[n][3] = 1
		
		TalkAppendButton(varMap,x310163_var_FileId,arr_answer[n][1],3,arr_answer[n][2] )
	end
	
end




function x310163_SetDengmiScore( varMap ,varPlayer, score)
	if score > 20 then
		score = 20
	end
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3],score)
end

function x310163_SetDengmiScoreInc( varMap ,varPlayer, scoreInc)
	local score = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3]) + scoreInc
	if score > 20 then
		score = 20
	end
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3],score)
end



function x310163_GetDengmiScore( varMap ,varPlayer)
	local score = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3])
	return score
end



function x310163_NPCIsVisited( varMap ,varPlayer, NPCindex)
	local Is = 0
	if NPCindex == 1 then
		Is = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC1[1],MD_DENGMI_NPC1[2],MD_DENGMI_NPC1[3])
	elseif NPCindex == 2 then
		Is = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC2[1],MD_DENGMI_NPC2[2],MD_DENGMI_NPC2[3])
	elseif NPCindex == 3 then
		Is = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC3[1],MD_DENGMI_NPC3[2],MD_DENGMI_NPC3[3])
	elseif NPCindex == 4 then
		Is = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC4[1],MD_DENGMI_NPC4[2],MD_DENGMI_NPC4[3])
	end
	return Is
end



function x310163_SetNPCVisited( varMap ,varPlayer, NPCindex)
	if NPCindex == 1 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC1[1],MD_DENGMI_NPC1[2],MD_DENGMI_NPC1[3],1)
	elseif NPCindex == 2 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC2[1],MD_DENGMI_NPC2[2],MD_DENGMI_NPC2[3],1)
	elseif NPCindex == 3 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC3[1],MD_DENGMI_NPC3[2],MD_DENGMI_NPC3[3],1)
	elseif NPCindex == 4 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC4[1],MD_DENGMI_NPC4[2],MD_DENGMI_NPC4[3],1)
	end

end




function x310163_ResetDengmiMD( varMap ,varPlayer)

	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC1[1],MD_DENGMI_NPC1[2],MD_DENGMI_NPC1[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC2[1],MD_DENGMI_NPC2[2],MD_DENGMI_NPC2[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC3[1],MD_DENGMI_NPC3[2],MD_DENGMI_NPC3[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC4[1],MD_DENGMI_NPC4[2],MD_DENGMI_NPC4[3],0)
	
end



function x310163_SetDengmiMD( varMap ,varPlayer,NPCindex)
	if NPCindex == 1 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC1[1],MD_DENGMI_NPC1[2],MD_DENGMI_NPC1[3],1)
	elseif NPCindex == 2 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC2[1],MD_DENGMI_NPC2[2],MD_DENGMI_NPC2[3],1)
	elseif NPCindex == 3 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC3[1],MD_DENGMI_NPC3[2],MD_DENGMI_NPC3[3],1)
	elseif NPCindex == 4 then
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC4[1],MD_DENGMI_NPC4[2],MD_DENGMI_NPC4[3],1)
	end

end



function x310163_InitDengmiArray( varMap ,varPlayer)
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1], MD_DENGMI_DATE[2], MD_DENGMI_DATE[3] )
	local nCurDay = GetDayOfYear()
	
	local accDay = x310163_GetAcceptDate( varMap ,varPlayer)
	local varCount = QuestDengmi_GetQuestionCount()
	if varCount > 128 then varCount = 128 end
	
	for varI,item in x310163_var_DengmiInfo do
		
		local md = x310163_var_DengmiNoMD[varI]
		
		local md1 = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NO1[1],MD_DENGMI_NO1[2],MD_DENGMI_NO1[3])
		local no = GetPlayerGameData(varMap,varPlayer,md[1],md[2],md[3]) 
		if no == 0 or accDay ~= nCurDay then 
			local DengmiNo = random(0,varCount-1)
			item.nDengmi = DengmiNo

			
			local varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestDengmi_GetQuestionInfo(item.nDengmi)
			
			x310163_var_DengmiArray[DengmiNo] = {}		
			x310163_var_DengmiArray[DengmiNo].varId = varId + 100000		
			x310163_var_DengmiArray[DengmiNo].varDesc = varDesc
			x310163_var_DengmiArray[DengmiNo].varAnswer1 = varAnswer1
			x310163_var_DengmiArray[DengmiNo].varAnswer2 = varAnswer2
			x310163_var_DengmiArray[DengmiNo].varAnswer3 = varAnswer3
			x310163_var_DengmiArray[DengmiNo].varAnswer4 = varAnswer4
			x310163_var_DengmiArray[DengmiNo].varAnswer = varAnswer + 11000
			SetPlayerGameData(varMap,varPlayer,md[1],md[2],md[3], DengmiNo) 
			
		end
		
	end
end	
	

function x310163_IsDengmiFinish( varMap ,varPlayer)
	local varNpc1 = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC1[1],MD_DENGMI_NPC1[2],MD_DENGMI_NPC1[3])
	local varNpc2 = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC2[1],MD_DENGMI_NPC2[2],MD_DENGMI_NPC2[3])
	local varNpc3 = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC3[1],MD_DENGMI_NPC3[2],MD_DENGMI_NPC3[3])
	local varNpc4 = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC4[1],MD_DENGMI_NPC4[2],MD_DENGMI_NPC4[3])
	
	if varNpc1==1 and varNpc2==1 and varNpc3==1 and varNpc4==1 then
		return 1
	end
	return 0
end


function x310163_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	
	
	
	
	if GetGameOpenById(x310163_var_GameId) ~= 1 then
		
			
		StartTalkTask(varMap)
			TalkAppendString(varMap,"灯谜会已经关闭！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	
	
	
	if x310163_CheckValid( varMap,varPlayer ) ~= 1 then
		return
	end
	
	if IsHaveQuest(varMap,varPlayer, x310163_var_QuestId) <= 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t请先去找【灯谜使官】蔡德楚领取灯谜会任务。\n\t#G（每天晚上的19：30--2400常ぱ韭縊良ㄏ﹛讲紈贰祇常縊良穦ヴ叭")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 
	end
	
	
	
	if x310163_IsStartTimeValid( varMap,varPlayer ) ~= 1 then
		

		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t灯谜会还没开始呢，别心急。\n\t#G（每天晚上的19：30--2400縊良穦秨")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1], MD_DENGMI_DATE[2], MD_DENGMI_DATE[3] )
	local nCurDay = GetDayOfYear()
	if nDate == nCurDay then
		if x310163_IsDengmiFinish( varMap ,varPlayer) == 1 then
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t你已经完成了今天的大都灯谜会，请明天再来。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
			return
		end
		
	
		
		
	end
	
	
	

	for varI,item in x310163_var_DengmiInfo do
		item.varTalknpc = FindMonsterByGUID(varMap,item.GUID)
	end
	
	
	local nFind = x310163_FindNpc(varMap,varTalknpc)
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "Error"
	end
	
	if idExt == x310163_var_FileId then
		
		
		
		if x310163_NPCIsVisited( varMap ,varPlayer, nFind) == 1 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t你今天已经猜过我的灯谜了，请去其他姐妹处完成大都灯谜会。\n\t#G(4个灯谜侍女分别在大都天坛上的东、西、南、北四个方向。)")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
			return
		end
		
			
		local MD = x310163_var_DengmiNoMD[nFind]
		
		local DengmiNo = GetPlayerGameData(varMap,varPlayer,MD[1],MD[2],MD[3])
		local dm = x310163_var_DengmiArray[DengmiNo]
		
		

		
		
		StartTalkTask(varMap)
			
		TalkAppendString(varMap,dm.varDesc)
		x310163_AddDengmiAnswerOption( varMap, dm.varAnswer1, dm.varAnswer2, dm.varAnswer3, dm.varAnswer4 )
										
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
	elseif idExt >= 11001 and idExt <= 11004 then
		
		
		
		
		if x310163_NPCIsVisited( varMap ,varPlayer, nFind) == 1 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t你今天已经猜过我的灯谜了，请去其他姐妹处完成大都灯谜会。\n\t#G(4个灯谜侍女分别在大都天坛上的东、西、南、北四个方向。)")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		x310163_SetNPCVisited(varMap ,varPlayer, nFind)
			
		
	
		local MD = x310163_var_DengmiNoMD[nFind]
		
		local DengmiNo = GetPlayerGameData(varMap,varPlayer,MD[1],MD[2],MD[3])
		local dm = x310163_var_DengmiArray[DengmiNo]
		
		
		if dm.varAnswer == idExt then
			

			
			
			local varName = GetName(varMap,varPlayer)
			LuaScenceM2Player( varMap,varPlayer,"\t恭喜你猜对了灯谜",varName,3,1)
			LuaScenceM2Player( varMap,varPlayer,"\t恭喜你猜对了灯谜",varName,2,1)
			LuaScenceM2Player( varMap,varPlayer,"\t你获得了5点灯谜积分",varName,3,1)
			LuaScenceM2Player( varMap,varPlayer,"\t你获得了5点灯谜积分",varName,2,1)
			x310163_SetDengmiScoreInc(varMap,varPlayer,5)
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t恭喜你猜对了灯谜，获得#R5点#W灯谜积分。" )
				if x310163_IsDengmiFinish( varMap ,varPlayer) == 1 then
					local score,bonusExp = x310163_ProcDengmiFinish(varMap ,varPlayer)
					local strMsg = format("\t您今天获得的灯谜积分是：#R%d分#W，奖励给您#R%d经验#W欢迎您明天再来",score, bonusExp)
					local strMsg = "\t您今天完成了灯谜，欢迎您明天再来，先交任务"
					TalkAppendString(varMap,strMsg)
				else
					TalkAppendString(varMap,"\t请前往其他姐妹那里继续猜灯谜。\n\t#G(4个灯谜侍女分别在大都天坛上的东、西、南、北四个方向。)" )
				end
			StopTalkTask(varMap)
			
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
			x310163_GiveJewMap(varMap,varPlayer)
			
			
			local nCurDay = GetDayOfYear()
			
			if nCurDay>=36 and nCurDay<=39 then
			StartItemTask(varMap)
	    	 local count =0
			 local count1 =0
			 
			 for i =1 , 2 do
			  local ran=random(1,100)
			 
			  if(ran<50) then
				  	ItemAppendBind( varMap, 12041237, 1 )	--元宵皮
				  	count=count+1
				else
					ItemAppendBind( varMap, 12041238, 1 )	--元宵馅
					count1=count1+1
				end
				end  
				   
				local ret = StopItemTask(varMap,varPlayer)
			  if ret > 0 then 	 
				 DeliverItemListSendToPlayer(varMap,varPlayer)		 
				 
				end
			  
			      
			      if count>0 then
					 	Msg2Player( varMap,varPlayer,"\t您获得元宵皮"..count.."个",8,3)
				    end
					  if count1>0 then
					  Msg2Player( varMap,varPlayer,"\t您获得元宵馅"..count1.."个",8,3)
			      end
			end
			GamePlayScriptLog( varMap, varPlayer, x310163_var_GameID_Right)
			 
			 
			local varName = GetName(varMap,varPlayer)
			if varName == nil then
				varName = "Error"
			end
		else
			
			
			local varName = GetName(varMap,varPlayer)
			LuaScenceM2Player( varMap,varPlayer,"\t很遗憾，你猜错了",varName,3,1)
			LuaScenceM2Player( varMap,varPlayer,"\t很遗憾，你猜错了",varName,2,1)
			LuaScenceM2Player( varMap,varPlayer,"\t你获得了1点灯谜积分",varName,3,1)
			LuaScenceM2Player( varMap,varPlayer,"\t你获得了1点灯谜积分",varName,2,1)
			x310163_SetDengmiScoreInc(varMap,varPlayer,1)
			
			StartItemTask(varMap)
			
			local nCurDay = GetDayOfYear()
			
			if nCurDay>=36 and nCurDay<=39 then
				local ran1=random(1,100)
			
			    if(ran1<50) then
			  
			  	ItemAppendBind( varMap, 12041237, 1 )	--元宵皮
				else
					ItemAppendBind( varMap, 12041238, 1 )	--元宵馅
				end
				local ret = StopItemTask(varMap,varPlayer)
			    if ret > 0 then 	 
				DeliverItemListSendToPlayer(varMap,varPlayer)		 
				 	if(ran1<50) then	 
					 	Msg2Player( varMap,varPlayer,"\t您获得元宵皮一个",8,3)
				 	else	 
					  Msg2Player( varMap,varPlayer,"\t您获得元宵馅一个",8,3)
					end
				end
			end
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t很遗憾你猜错了灯谜，获得了#R1点#W灯谜积分。")	
				if x310163_IsDengmiFinish( varMap ,varPlayer) == 1 then
					
					
					
				else
					TalkAppendString(varMap,"\t请前往其他姐妹那里继续猜灯谜。\n\t#G(4个灯谜侍女分别在大都天坛上的东、西、南、北四个方向。)" )
				end			
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)		
			GamePlayScriptLog( varMap, varPlayer, x310163_var_GameID_Error)
			
			
			local varName = GetName(varMap,varPlayer)
			if varName == nil then
				varName = "Error"
			end
			
			if x310163_IsDengmiFinish( varMap ,varPlayer) == 1 then
				
			end
		
		end	
		
		LuaCallNoclosure( 310164, "ProcQuestStep", varMap, varPlayer, x310163_var_DengmiInfo[nFind].GUID)	
		
		
	end
		

end


function x310163_GetAcceptDate( varMap,varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310163_var_QuestId)
	return GetQuestParam( varMap, varPlayer, varQuestIdx, 6)
end

function x310163_ProcDengmiFinish(varMap ,varPlayer)
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "Error"
	end
			
	

	
	
	local score = x310163_GetDengmiScore(varMap ,varPlayer)
	local varExp = x310163_GetBonusExp(varMap ,varPlayer)
	local strMsg = format("您今天获得的灯谜积分是：%d分，奖励给您%d经验，欢迎您明天再来！",score, varExp)
	
	
	
	
	return score,varExp
	
end

function x310163_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 0
end




function x310163_ProcAccept( varMap, varPlayer )
end




function x310163_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310163_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310163_CheckSubmit( varMap, varPlayer )
end




function x310163_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310163_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310163_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310163_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end





function x310163_GetValidTime()

	local n1 = GetCurrentTime()
	local n2 = GetCurrentTime()
	
	local nResult = n2 - n1 
	while nResult > 5 or nResult < 0 do
		n1 = GetCurrentTime()
		n2 = GetCurrentTime()
		
		nResult = n2 - n1 
		
		
		local strMsg = format("DML:<Error>x310163_GetValidTime n1=%d,n2=%d",n1,n2)
		WriteLog( 1, strMsg )	
		
	end
	
	return n2
end




function x310163_GetValidTimeHourMin()

	local h,m,s = GetHourMinSec()	
	return h,m

end
