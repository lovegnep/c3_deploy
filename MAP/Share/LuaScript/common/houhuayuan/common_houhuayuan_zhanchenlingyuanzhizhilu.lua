--DECLARE_QUEST_INFO_START--
x320039_var_FileId 						= 320039
x320039_var_QuestName					= "【战车】争夺机甲"
x320039_var_QuestInfo					= "\t据说后花园粮仓中有一些失落的战车机甲零件。这些零件虽然不能直接强化你的战车，但争夺零件的过程却是一种很好的磨练，假以时日，必对你驾驶战车的技术大有提升。"
x320039_var_QuestCompleted				= "\t看你志得意满的样子一定是大有收获。呵呵，不过要记住，每天的磨练是必不可少的！"
x320039_var_QuestRuse					= "\t#W争夺后花园#R粮仓中的战车机甲零件#W"
x320039_var_QuestHelp					= "\t你每天都可以争夺战车机甲零件。如果你是在#R战车令发布期间#W完成争夺，会获得#R三倍奖励#W"
x320039_var_QuestId						= {6657, 6658, 6659, 6660}
x320039_var_SubmitNPCGUID				= {401241, 401242, 401243, 401244}
x320039_var_ItemIndex 					= 12266835 
x320039_var_LevelLess	= 	70
x320039_var_GrowObj 					= {}
x320039_var_CollectItem					=
{
{monsterId = 278, itemId = 12266835, PosId = 401250, varCount = 1, name = "战车机甲零件", Target = " 争夺@npc_401250(%d/%d)"},

}
x320039_var_GrowObj						= {}
x320039_var_GetPlayerHonour			= 360
x320039_var_GetPlayerExp				=  
{
{level = 60, value = 1500, honour = 300},
{level = 70, value = 3000, honour = 300},
{level = 80, value = 3000, honour = 300},
{level = 90, value = 3000, honour = 300},
{level = 100, value = 3000, honour = 300},
{level = 110, value = 3000, honour = 300},
}
--DECLARE_QUEST_INFO_STOP--

function x320039_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	local nlevel = GetLevel( varMap, varPlayer)
	
	if nlevel < 70 then
      	return 
  	end
  		
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
 --     	return 
  --	end



	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local AcceptNPCGUID = x320039_GetNPCGUID(varMap, varPlayer)	
	if varTalkNpcGUID == AcceptNPCGUID and IsHaveQuestNM( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer) ) <= 0 then
		if x320039_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU) ~= GetDayOfYear() then
			local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x320039_VarQuest(varMap, varPlayer), x320039_var_QuestName, state)
		end
	end
end


function x320039_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)


	if IsHaveQuestNM( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x320039_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x320039_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x320039_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local AcceptNPCGUID = x320039_GetNPCGUID(varMap, varPlayer)		
		if AcceptNPCGUID == varTalkNpcGUID  then
			x320039_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end	
end


function x320039_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


    local PlayerValue = x320039_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU)
 
 	local nlevel = GetLevel( varMap, varPlayer)
	
	if nlevel < 70 then
		Msg2Player(varMap,varPlayer,"等级不足",8,3)
      	return 
  	end
  	   
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
 --     	return 
  --	end

	if PlayerValue == GetDayOfYear() then
		Msg2P3layer(varMap, varPlayer, format("已经完成过#R%s#0任务",x320039_var_QuestName), 8, 3)

		return	
	else
		x320039_SetMD( varMap, varPlayer, MD_ZHANCHELING_YUANZHENGZHILU_COUNT, 0)	
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

	if AddQuest( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer),x320039_var_FileId,0,0,1,1) == 1 then
	GamePlayScriptLog(varMap, varPlayer, 2624)
		--接任务写日志
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务:%s",x320039_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务:%s",x320039_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320039_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
	end

end


function x320039_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))
	x320039_ItemNumber(varMap, varPlayer)
	local varExp = 	x320039_YunBiaoExp(varMap, varPlayer)
	local varHonour = x320039_PlayerHonour(varMap, varPlayer)
	local num = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
	local questtarget = format(x320039_var_CollectItem[1].Target, num, x320039_var_CollectItem[1].varCount)
	local questtarget1 = format(questtarget.."#Y\n奖励内容:\n#W经验值:"..varExp.."点".."\n#W战车荣誉:"..varHonour.."点")
 	local SubmitNPCGUID = x320039_GetNPCGUID(varMap, varPlayer)	
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,x320039_VarQuest(varMap, varPlayer) )
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)

	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320039_var_QuestName,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x320039_var_QuestInfo,			--任务描述
								x320039_var_QuestHelp								--任务小提示
								)

		StopTalkTask()
		DeliverTalkRefreshQuest(varMap, varPlayer, x320039_VarQuest(varMap, varPlayer));
	end

end


function x320039_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..x320039_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x320039_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标:".."\n"..x320039_var_QuestRuse.."\n")

		--提示信息
		if x320039_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示:")
			TalkAppendString(varMap,format("%s".."\n", x320039_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320039_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320039_PlayerHonour(varMap, varPlayer)		
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..varHonour.."点")
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320039_var_FileId, varQuest)
end


function x320039_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x320039_var_QuestName)
		TalkAppendString(varMap,format("%s", x320039_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况:")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320039_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320039_PlayerHonour(varMap, varPlayer)		
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	if varHonour > 0 then
				TalkAppendString(varMap,"#W战车荣誉:"..varHonour)
    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320039_var_FileId, varQuest,0);



end


function x320039_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x320039_var_QuestName)
		TalkAppendString(varMap,x320039_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容:  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x320039_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320039_PlayerHonour(varMap, varPlayer)		
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	if varHonour > 0 then
       TalkAppendString(varMap,"#W战车荣誉:"..varHonour.."点")
    end 
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320039_var_FileId, x320039_VarQuest(varMap, varPlayer))

end




function x320039_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local num = 1 
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x320039_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x320039_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x320039_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x320039_var_SubmitNPCGUID[4]
	end	

			
	if SubmitNPCGUID == varTalkNpcGUID  then
				if GetItemCount(varMap, varPlayer, x320039_var_CollectItem[1].itemId) == 0 then
						return 0
				else
						return 1
				end
		end
end



function x320039_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))

	local nlevel = GetLevel( varMap, varPlayer)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);


--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap ,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
  --    	return 
  --	end
	

	if GetItemCount(varMap, varPlayer, x320039_var_CollectItem[1].itemId) <= 0 then
		Msg2Player(varMap ,varPlayer,"收集不全！",8,3)
		return
	end


	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能提交任务！", 8, 3)
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
				
		x320039_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end



function x320039_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
	GamePlayScriptLog(varMap, varPlayer, 2625)	
 	local AddThirdExp = floor(x320039_YunBiaoExp(varMap, varPlayer) * 2)
 	local AddThirdHonour = floor(x320039_PlayerHonour(varMap, varPlayer) * 2)
    AddExp(varMap, varPlayer, x320039_YunBiaoExp(varMap, varPlayer))
	local varHonour = x320039_PlayerHonour(varMap, varPlayer)
	AddPlayerChariotHonour(varMap, varPlayer, varHonour)    
	local PlayerValue = x320039_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU)
    if PlayerValue <= 511 then
    	x320039_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU, GetDayOfYear())
    end
	x320039_SetMD( varMap, varPlayer, MD_ZHANCHELING_YUANZHENGZHILU_COUNT, 1)
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务:%s",x320039_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x320039_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)    
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R战车荣誉"..x320039_PlayerHonour(varMap, varPlayer) .."点#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)
    Msg2Player(varMap,varPlayer,format("你完成了任务:%s",x320039_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x320039_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x320039_PlayerHonour(varMap, varPlayer) ),8,2)    
    	local nCountryIdx = GetCurCountry(varMap, varPlayer)
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

	DelItem(varMap, varPlayer, x320039_var_CollectItem[1].itemId, 1)

end



function x320039_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return 0
end


function x320039_ProcGpCreate(varMap, growPointType, varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, x320039_var_ItemIndex)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)
	
	if x320039_var_GrowObj[varMap] == nil then
		x320039_var_GrowObj[varMap] = {}
	end
	
	x320039_var_GrowObj[varMap][varBoxId] = growPointType	
	
end


function x320039_ProcGpOpen( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)



	if IsHaveQuestNM( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer) ) <= 0 then
		Msg2Player(varMap, varPlayer, "你身上没有“争夺机甲”任务，无法采集！", 8, 3)
		return 1
	end
	
	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，无法采集！", 8, 3)
		return 1
	end

	

		if GetItemCount(varMap, varPlayer, x320039_var_CollectItem[1].itemId) > 0 then
			Msg2Player(varMap, varPlayer, "你已经采集过该物品！", 8, 3)
			return 1		
		end

		
end


function x320039_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


function x320039_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
				
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))
	local itemid = x320039_var_CollectItem[1].itemId
	local name = x320039_var_CollectItem[1].name

	
    StartItemTask( varMap)
    ItemAppend( varMap, itemid, 1)
    local result = StopItemTask( varMap, varPlayer)
    if result == 0 then
        Msg2Player( varMap, varPlayer, "背包已满，无法获得物品", 8, 3)
        Msg2Player( varMap, varPlayer, "背包已满，无法获得物品", 8, 2)
        return 1
    end
    DeliverItemListSendToPlayer( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, format("你得到了任务道具:#R%s", name), 8, 2)
    Msg2Player( varMap, varPlayer, format("你得到了任务道具:#R%s", name), 8, 3)	
	x320039_ItemNumber(varMap, varPlayer)
	
	x320039_ProcQuestLogRefresh( varMap, varPlayer, varQuest)		
end



function x320039_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x320039_VarQuest(varMap, varPlayer) )
	local num = 1
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 
	if varHaveQuest > 0 then
		if varTalkNpcGUID == x320039_GetNPCGUID(varMap, varPlayer)  then
			if GetItemCount(varMap, varPlayer, x320039_var_CollectItem[1].itemId) <= 0 then
				TalkAppendButton(varMap, x320039_VarQuest(varMap, varPlayer), x320039_var_QuestName,6, 1)
				
			else
				TalkAppendButton(varMap, x320039_VarQuest(varMap, varPlayer), x320039_var_QuestName,7, 1)	
			end
		end
	end
end



function x320039_ProcQuestAbandon( varMap, varPlayer,varQuest )



	DelQuestNM( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))
	local Readme = format("你放弃了任务:%s",x320039_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

	DelItem(varMap, varPlayer, x320039_var_CollectItem[1].itemId, 1)
	local PlayerValue = x320039_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU)
    if PlayerValue <= 511 then
    	x320039_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU, GetDayOfYear())
    end
	x320039_SetMD( varMap, varPlayer, MD_ZHANCHELING_YUANZHENGZHILU_COUNT, 1)	

end


function x320039_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))
	
	if GetItemCount(varMap, varPlayer, x320039_var_CollectItem[1].itemId) >= 1 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7,  1)
		 
	else
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7,  0)
		x320039_ProcQuestLogRefresh( varMap, varPlayer, varQuest)		
	end		

end



function x320039_QuestLogSave(varMap, varPlayer)	
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return 2, 3, 4
	elseif nCountryIdx == 1 then
		return 1, 3, 4
	elseif nCountryIdx == 2 then	
		return 1, 2, 4
	elseif nCountryIdx == 3 then
		return 1, 2, 3
	end	
end

function x320039_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320039_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x320039_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x320039_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x320039_var_QuestId[4]
	end		

end

function x320039_GetNPCGUID(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320039_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		return x320039_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then	
		return x320039_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		return x320039_var_SubmitNPCGUID[4]
	end	

end


function x320039_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 70 then
		return
	end
	for i, j in x320039_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x320039_PlayerHonour(varMap, varPlayer)
	return x320039_var_GetPlayerHonour	

end



function x320039_ItemNumber(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320039_VarQuest(varMap, varPlayer))	

		if GetItemCount(varMap, varPlayer, x320039_var_CollectItem[1].itemId) > 0 then					
			
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 1)
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
		else
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0) 
			--x320039_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
		end

			
end




function x320039_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320039_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
