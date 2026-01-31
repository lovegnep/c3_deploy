--DECLARE_QUEST_INFO_START--
x320041_var_FileId 						= 320041
x320041_var_QuestName					= "【战车】军旗军魂"
x320041_var_QuestInfo					= "\t玉门处于后花园的中央，那里有一面象征胜利的军旗，但据说只有驾驶战车的时候才能得到此旗。对你来说，这可是一个很好的考验啊！"
x320041_var_QuestCompleted				= "\t看你志得意满的样子一定是大有收获。呵呵，不过要记住，每天的磨练是必不可少的！"
x320041_var_QuestRuse					= "\t夺得位于后花园玉门中央的军旗"
x320041_var_QuestHelp					= "\t必须驾驶战车才能完成任务，如果中途离开战车，将会导致任务失败，只能重新领取军旗。如果你是在#R战车令发布期间#W完成任务，会获得#R三倍奖励#W"
x320041_var_QuestId						= {6665, 6666, 6667, 6668}
x320041_var_PreQuestId					= {6673, 6674, 6675, 6676}
x320041_var_SubmitNPCGUID				= {401241, 401242, 401243, 401244}
x320041_var_CiTanBuff					= 7067
x320041_var_LevelLess	= 	70

x320041_var_BuffTable          	= {
                                        	level = 60, varX = 103,z = 103, monsterId = 56614, posId = 82014, varCount = 1, varName = "  夺取玉门战车军旗", 
                                          	target = "  夺取@npc_82014(%d/%d)"
}
x320041_var_GetPlayerHonour			= 360
x320041_var_GetPlayerExp				=  
{
{level = 60, value = 2000, honour = 600},
{level = 70, value = 3000, honour = 600},
{level = 80, value = 3000, honour = 600},
{level = 90, value = 3000, honour = 600},
{level = 100, value = 3000, honour = 600},
{level = 110, value = 3000, honour = 600},
}

--DECLARE_QUEST_INFO_STOP--
function x320041_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
  --    	return 
  --	end


	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local AcceptNPCGUID, SubmitNPCGUID = x320041_GetNPCGUID(varMap, varPlayer)	
	if varTalkNpcGUID == AcceptNPCGUID then
		if x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JUNQIJUNHUN) ~= GetDayOfYear() then
			if x320041_QuestFinish(varMap, varPlayer) == 1 then
				local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
				if IsHaveQuestNM( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer) ) <= 0 then
					TalkAppendButton(varMap, x320041_VarQuest(varMap, varPlayer), x320041_var_QuestName, state)
				end
			end
		end
	end
end



function x320041_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
		
	if IsHaveQuestNM( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x320041_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x320041_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x320041_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local AcceptNPCGUID = x320041_GetNPCGUID(varMap, varPlayer)		
		if AcceptNPCGUID == varTalkNpcGUID  then
			x320041_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end	
end



function x320041_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
    local PlayerValue = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JUNQIJUNHUN)
   
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
 --     	return 
  --	end

	if PlayerValue == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("已经完成过#R%s#0任务",x320041_var_QuestName), 8, 3)

		return
	else
		x320041_SetMD( varMap, varPlayer, MD_ZHANCHELING_JUNQIJUNHUN_COUNT, 0)				
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end


	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能领取任务！", 8, 3)
		return
	end

	if AddQuest( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer),x320041_var_FileId,0,0,0,1) == 1 then

		--接任务写日志
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x320041_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x320041_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320041_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
	end

end


function x320041_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )		
	local num = 1 
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x320041_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x320041_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x320041_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x320041_var_SubmitNPCGUID[4]
	end	

			
	if SubmitNPCGUID == varTalkNpcGUID  then
		if IsHaveSpecificImpact(varMap, ChariotObjID, x320041_var_CiTanBuff) == 0 then
			return 0
		else
			return 1
		end
	end
end



function x320041_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x320041_var_QuestName)
		TalkAppendString(varMap,format("%s", x320041_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320041_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320041_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	        TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320041_var_FileId, varQuest,0);



end


function x320041_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x320041_var_QuestName)
		TalkAppendString(varMap,x320041_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x320041_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320041_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	        TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320041_var_FileId, x320041_VarQuest(varMap, varPlayer))

end




function x320041_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x320041_var_QuestName)
		TalkAppendString(varMap,format("%s", x320041_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320041_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320041_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	        TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320041_var_FileId, varQuest,0);



end


function x320041_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..x320041_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x320041_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：".."\n"..x320041_var_QuestRuse.."\n")

		--提示信息
		if x320041_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x320041_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320041_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320041_PlayerHonour(varMap, varPlayer)
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..varHonour.."点")
		end
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320041_var_FileId, varQuest)
end



function x320041_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer))
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )	
	local nlevel = GetLevel( varMap, varPlayer)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);


--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap ,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
 --     	return 
  --	end


	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能提交任务！", 8, 3)
		return
	end
	
		

	if IsHaveSpecificImpact(varMap, ChariotObjID, x320041_var_CiTanBuff) == 0 then
		Msg2Player(varMap ,varPlayer,"你没有BUFF，不能提交！",8,3)
		return
	end

	if(varHaveQuest <= 0) then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "你没有这个任务，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你没有这个任务，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0		
	end



	if varHaveQuest > 0 then
		
		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end						
		x320041_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x320041_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varExp = 	x320041_YunBiaoExp(varMap, varPlayer)
	local varHonour = x320041_PlayerHonour(varMap, varPlayer)	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
  local questtarget = format(x320041_var_BuffTable.target, KilledNum, x320041_var_BuffTable.varCount)
  local questtarget1 = format(x320041_var_BuffTable.target.."#Y\n奖励内容:\n#W经验值:"..varExp.."点".."\n#W战车荣誉:"..varHonour.."点", KilledNum, x320041_var_BuffTable.varCount)
 	local SubmitNPCGUID = x320041_GetNPCGUID(varMap, varPlayer)	
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,x320041_VarQuest(varMap, varPlayer) )
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320041_var_QuestName,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x320041_var_QuestInfo,			--任务描述
								x320041_var_QuestHelp								--任务小提示
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x320041_VarQuest(varMap, varPlayer));
	end

end


function x320041_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x320041_VarQuest(varMap, varPlayer) )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer))
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
	if varHaveQuest > 0 then
		if varTalkNpcGUID == x320041_GetNPCGUID(varMap, varPlayer)  then
			if IsHaveSpecificImpact(varMap, ChariotObjID, x320041_var_CiTanBuff) == 0 or IsInChariot(varMap, varPlayer) ~= 1 then
				TalkAppendButton(varMap, x320041_VarQuest(varMap, varPlayer), x320041_var_QuestName,6, 1)
			else
				TalkAppendButton(varMap, x320041_VarQuest(varMap, varPlayer), x320041_var_QuestName,7, 1)			
			end
		end
	end

end


function x320041_ProcQuestAbandon( varMap, varPlayer,varQuest )


	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
	DelQuestNM( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer))
	local Readme = format("你放弃了任务：%s",x320041_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)
	CancelSpecificImpact(varMap, ChariotObjID, x320041_var_CiTanBuff, 1)
	local PlayerValue = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JUNQIJUNHUN)
    if PlayerValue <= 511 then
    	x320041_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_JUNQIJUNHUN, GetDayOfYear())
    end
    x320041_SetMD( varMap, varPlayer, MD_ZHANCHELING_JUNQIJUNHUN_COUNT, 1)	
end


function x320041_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
 	local AddThirdExp = floor(x320041_YunBiaoExp(varMap, varPlayer) * 2)
 	local AddThirdHonour = floor(x320041_PlayerHonour(varMap, varPlayer) * 2)
    AddExp(varMap, varPlayer, x320041_YunBiaoExp(varMap, varPlayer))
	local varHonour = x320041_PlayerHonour(varMap, varPlayer)
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )		 
	local varHonour = x320041_PlayerHonour(varMap, varPlayer)
	AddPlayerChariotHonour(varMap, varPlayer, varHonour)    
	local PlayerValue = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JUNQIJUNHUN)
    if PlayerValue <= 511 then
    	x320041_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_JUNQIJUNHUN, GetDayOfYear())
    end
    x320041_SetMD( varMap, varPlayer, MD_ZHANCHELING_JUNQIJUNHUN_COUNT, 1)
    CancelSpecificImpact(varMap, ChariotObjID, x320041_var_CiTanBuff, 1)
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x320041_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x320041_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R战车荣誉"..x320041_PlayerHonour(varMap, varPlayer) .."点#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)     
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x320041_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x320041_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x320041_PlayerHonour(varMap, varPlayer) ),8,2)
	local varRet = CountryIsFortuneTime(varMap,varPlayer,5)
	if varRet == 1 then
		AddExp(varMap, varPlayer, AddThirdExp)
		AddPlayerChariotHonour(varMap, varPlayer, AddThirdHonour) 		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o战车令额外获得#R经验"..AddThirdExp.."点#o的奖励")
		StopTalkTask();		
		DeliverTalkTips(varMap, varPlayer);		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o战车令额外获得#R战车荣誉"..AddThirdHonour.."点#o的奖励")		
		StopTalkTask();		
		DeliverTalkTips(varMap, varPlayer);				
    	Msg2Player(varMap,varPlayer,format("战车令额外获得经验奖励#R%s#cffcf00点",AddThirdExp),8,2)
   		Msg2Player(varMap,varPlayer,format("战车令额外获得战车荣誉奖励#R%s#cffcf00点",AddThirdHonour ),8,2)   		
	end    
    
end





function x320041_ProcChariotEvents(varMap, varPlayer)
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer) ) > 0 and IsHaveSpecificImpact(varMap, ChariotObjID, x320041_var_CiTanBuff) == 1 then
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320041_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )		
		Msg2Player(varMap,varPlayer,"#cffcf00你离开战车导致失去军旗，请重新领取军旗",8,3)
		Msg2Player(varMap,varPlayer,"#cffcf00你离开战车导致失去军旗，请重新领取军旗",8,2)
		x320041_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	end
			
end

function x320041_ProcChariotEvents1(varMap, varPlayer)
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer) ) > 0  then
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320041_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )		
		Msg2Player(varMap,varPlayer,"#cffcf00你离开战车导致失去军旗，请重新领取军旗",8,3)
		Msg2Player(varMap,varPlayer,"#cffcf00你离开战车导致失去军旗，请重新领取军旗",8,2)
		x320041_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	end
			
end

function x320041_PreVarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320041_var_PreQuestId[1]
	elseif nCountryIdx == 1 then
		return x320041_var_PreQuestId[2]
	elseif nCountryIdx == 2 then	
		return x320041_var_PreQuestId[3]
	elseif nCountryIdx == 3 then
		return x320041_var_PreQuestId[4]
	end		

end



function x320041_PlayerHonour(varMap, varPlayer)
	return x320041_var_GetPlayerHonour

end



function x320041_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320041_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x320041_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x320041_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x320041_var_QuestId[4]
	end		

end

function x320041_GetNPCGUID(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320041_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		return x320041_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then	
		return x320041_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		return x320041_var_SubmitNPCGUID[4]
	end	

end


function x320041_ProcPlayerEnter(varMap, varPlayer)
	if IsHaveQuestNM( varMap, varPlayer, x320041_VarQuest(varMap, varPlayer) ) > 0 then
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320041_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )
		x320041_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	end
	

end


function x320041_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 70 then
		return
	end
	for i, j in x320041_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x320041_QuestFinish(varMap, varPlayer)
	local questMD3 = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI3)
	local questMD  = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI)
	local questMD2 = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI2)
	local varCountry = GetCurCountry(varMap, varPlayer)	
--	local league1 = LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, 0)
--	local league2 = LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, 1)
--	local league3 = LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, 2)
--	local league4 = LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, 3)		

			if questMD == GetDayOfYear() and questMD2 == GetDayOfYear() and x320041_QuestFinish1(varMap, varPlayer) == 1 then
				return 1
			elseif questMD3 == GetDayOfYear() and questMD2 == GetDayOfYear() and x320041_QuestFinish1(varMap, varPlayer) == 1 then
				return 1
			elseif questMD == GetDayOfYear() and questMD3 == GetDayOfYear()	and x320041_QuestFinish1(varMap, varPlayer) == 1 then
				return 1
			elseif questMD == GetDayOfYear() and questMD2 == GetDayOfYear() and questMD3 == GetDayOfYear() then
				return 1
			else
				return 0
			end			


end

function x320041_QuestFinish1(varMap, varPlayer)
	local questMD4 = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO)	
	local questMD5 = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO1)
	local questMD6 = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO2)
	local questMD7 = x320041_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO3)
	if questMD4 == GetDayOfYear() or questMD5 == GetDayOfYear() or questMD6 == GetDayOfYear() or questMD7 == GetDayOfYear() then
		return 1
	else
		return 0
	end

end


function x320041_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320041_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
