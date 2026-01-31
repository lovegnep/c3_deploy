--DECLARE_QUEST_INFO_START--
x320038_var_FileId 						= 320038
x320038_var_QuestName					= "【战车】战车扬威"
x320038_var_QuestInfo					= "\t想必你也拥有一辆战车了吧，但我猜你对战车的威力还是没有彻底了解。你应该去找后花园里的战载那里去谈谈，他会告诉更多关于战车的事情。"
x320038_var_QuestCompleted				= "\t你要准备好你的战车，因为下面的事情非常危险。"
x320038_var_QuestRuse					= "\t找到在后花园的#R战车任务发布人#W"
x320038_var_QuestHelp					= "\t完成任务将会获得#R战车荣誉#W"
x320038_var_QuestId						= {1654, 1655, 1656, 1657}
x320038_Var_QuestPre						= {1659,1660,1661,1662}
x320038_var_AcceptNPCGUID				= {123803, 126098, 129099, 132098}
x320038_var_SubmitNPCGUID				= {401241, 401242, 401243, 401244}
x320038_var_GetPlayerHonour				= 200
x320038_var_GetPlayerExp	 			=  400000
x320038_var_LevelLess	= 	70
--DECLARE_QUEST_INFO_STOP--
function x320038_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)

--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
 --     	return 
  --	end
  	
	if nlevel < 70 then
		return
	end  	
  	
	if IsQuestHaveDone(varMap, varPlayer, x320038_VarQuest(varMap, varPlayer)) > 0 then
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x320038_Var_QuestPre[nCountryIdx+1]) <= 0 then
		return 
	end






	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local AcceptNPCGUID, SubmitNPCGUID = x320038_GetNPCGUID(varMap, varPlayer)	
	if varTalkNpcGUID == AcceptNPCGUID and IsHaveQuestNM( varMap, varPlayer, x320038_VarQuest(varMap, varPlayer) ) <= 0 then
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x320038_VarQuest(varMap, varPlayer), x320038_var_QuestName, state)
	end
end


function x320038_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)

	if IsQuestHaveDone(varMap, varPlayer, x320038_VarQuest(varMap, varPlayer)) > 0 then
		return 
	end

	if IsHaveQuestNM( varMap, varPlayer, x320038_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x320038_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x320038_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x320038_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local AcceptNPCGUID, SubmitNPCGUID = x320038_GetNPCGUID(varMap, varPlayer)		
		if AcceptNPCGUID == varTalkNpcGUID  then
			x320038_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end	
end

function x320038_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local nlevel = GetLevel( varMap, varPlayer)

--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
 --     	return 
  --	end
  	
	if nlevel < 70 then
		Msg2Player(varMap,varPlayer,"等级过低，无法接取此任务！",8,3)
		return
	end 
	  	
	if IsQuestHaveDone(varMap, varPlayer, x320038_VarQuest(varMap, varPlayer)) > 0 then
		return 
	end  	

	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end


	if AddQuest( varMap, varPlayer, x320038_VarQuest(varMap, varPlayer),x320038_var_FileId,0,0,0,1) == 1 then
GamePlayScriptLog(varMap, varPlayer, 2632)
		--接任务写日志
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x320038_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x320038_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320038_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
	end

end


function x320038_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

 	local AcceptNPCGUID, SubmitNPCGUID = x320038_GetNPCGUID(varMap, varPlayer)	
	if SubmitNPCGUID == varTalkNpcGUID  then
		return 1
	else
		return 0
	end


end


function x320038_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )


	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x320038_var_QuestName)
		TalkAppendString(varMap, x320038_var_QuestInfo)
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320038_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
       	TalkAppendString(varMap,"#W战车荣誉:"..x320038_var_GetPlayerHonour.."点")              	        	        

	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320038_var_FileId, varQuest,0);



end


function x320038_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varExp = 	x320038_YunBiaoExp(varMap, varPlayer)
	local varHonour = x320038_var_GetPlayerHonour
 	local questtarget = "跟后花园中的战载谈谈"
 	local questtarget1 = "跟后花园中的战载谈谈".."#Y\n奖励内容:\n#W经验值:"..varExp.."点".."\n#W战车荣誉:"..varHonour.."点"
 	local AcceptNPCGUID, SubmitNPCGUID = x320038_GetNPCGUID(varMap, varPlayer)	
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,x320038_VarQuest(varMap, varPlayer) )
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320038_var_QuestName,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x320038_var_QuestInfo,			--任务描述
								x320038_var_QuestHelp								--任务小提示
								)

		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x320038_VarQuest(varMap, varPlayer));
	end

end


function x320038_ProcQuestAbandon( varMap, varPlayer,varQuest )



	DelQuestNM( varMap, varPlayer, x320038_VarQuest(varMap, varPlayer))
	local Readme = format("你放弃了任务：%s",x320038_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end


function x320038_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..x320038_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x320038_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：#W".."\n"..x320038_var_QuestRuse.."\n")

		--提示信息
		if x320038_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x320038_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320038_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320038_var_GetPlayerHonour
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus.."点")
				TalkAppendString(varMap,"#W战车荣誉:"..varHonour.."点")
		end
     	                	        	        
	
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320038_var_FileId, varQuest)
end

function x320038_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x320038_var_QuestName)
		TalkAppendString(varMap,x320038_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x320038_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		TalkAppendString(varMap,"#W战车荣誉:"..x320038_var_GetPlayerHonour.."点")
  	                	        	        

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320038_var_FileId, x320038_VarQuest(varMap, varPlayer))

end


function x320038_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320038_VarQuest(varMap, varPlayer))

	local nlevel = GetLevel( varMap, varPlayer)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);

	if nlevel < 70 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
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

		x320038_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )

	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end
end


function x320038_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
GamePlayScriptLog(varMap, varPlayer, 2633)


    AddExp(varMap, varPlayer, x320038_YunBiaoExp(varMap, varPlayer))
	AddPlayerChariotHonour(varMap, varPlayer, x320038_var_GetPlayerHonour)    
	QuestCom(varMap, varPlayer, x320038_VarQuest(varMap, varPlayer))


    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x320038_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x320038_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)  
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R战车荣誉"..x320038_var_GetPlayerHonour.."点#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)    
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x320038_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x320038_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x320038_var_GetPlayerHonour),8,2)
end



function x320038_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local AcceptNPCGUID, SubmitNPCGUID = x320038_GetNPCGUID(varMap, varPlayer)		
	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	-- 如果没有这个任务
		return
	end

	if varTalkNpcGUID == SubmitNPCGUID then
		local state = GetQuestStateNM(varMap,varPlayer,varTalknpc,x320038_VarQuest(varMap, varPlayer))
		TalkAppendButton(varMap, x320038_VarQuest(varMap, varPlayer), x320038_var_QuestName,state)
	end


end



function x320038_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320038_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x320038_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x320038_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x320038_var_QuestId[4]
	end		

end

function x320038_GetNPCGUID(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320038_var_AcceptNPCGUID[1], x320038_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		return x320038_var_AcceptNPCGUID[2], x320038_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then	
		return x320038_var_AcceptNPCGUID[3], x320038_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		return x320038_var_AcceptNPCGUID[4], x320038_var_SubmitNPCGUID[4]
	end	

end

function x320038_YunBiaoExp(varMap, varPlayer)

	return x320038_var_GetPlayerExp
end

