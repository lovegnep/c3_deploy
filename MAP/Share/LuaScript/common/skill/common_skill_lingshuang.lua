

--DECLARE_QUEST_INFO_START--
x561002_var_FileId = 561002
x561002_var_QuestIdPre =-1

x561002_var_QuestKind = 8
x561002_var_LevelLess	= 	-1 
x561002_var_QuestIdNext = -1
x561002_var_Name	="" 
x561002_var_noDemandItem ={}
x561002_var_ExtTarget={}
x561002_var_QuestHelp =	""
x561002_var_QuestName1="【领取双倍时间说明】"
x561002_var_QuestName2="领取1小时双倍时间"
x561002_var_QuestName3="领取30分钟双倍时间"
x561002_var_QuestName4="本周剩余双倍时间"
x561002_var_QuestName5="领取2小时双倍时间"
x561002_var_QuestName6="领取4小时双倍时间"
x561002_var_QuestName7="冻结双倍时间"
x561002_var_QuestName8="解冻双倍时间"



x561002_var_QuestInfo="\t当你到达#R20级#W，你每周共有#G5个小时#W的双倍时间可以#G免费领取并使用#W。\n\t在双倍时间里，从怪物身上所获得的战斗经验将翻倍，从天上人间获得的游园经验也会翻倍！\n\t您也可以冻结已领取的双倍时间以供下次使用。"  
x561002_var_QuestTarget=""		                                                                                               
x561002_var_QuestCompleted1="你顺利领取"
x561002_var_QuestCompleted2="你顺利领取"
x561002_var_QuestCompleted3="你顺利领取"
x561002_var_ContinueInfo1="\t你是否要领取#G1小时#W双倍经验？双倍经验的持续时间#R可以#W叠加。"
x561002_var_ContinueInfo2="\t你是否要领取#G2小时#W双倍经验？双倍经验的持续时间#R可以#W叠加。"
x561002_var_ContinueInfo3="\t您现在正在双倍经验时间里。"
x561002_var_ContinueInfo4="\t你是否要领取#G4小时#W双倍经验？双倍经验的持续时间#R可以#W叠加。"

x561002_var_ContinueInfo5="\t你要冻结双倍经验时间吗？冻结双倍经验时间可以使你的双倍经验不再随时间流逝。\n\t如果你希望重新获得这些冻结的双倍时间，可以使用#G解冻模块#W。\n\t注意，双倍时间最多可以冻结#R5小时#W！多余的双倍将会#R消失#W！"
x561002_var_ContinueInfo6="\t#Y您没有冻结双倍时间，无需解冻"
x561002_var_ContinueInfo7="\t#Y您的双倍时间已经解冻"

x561002_var_ErrorInfo1="你本周的双倍时间已经不足1小时，无法领取！"
x561002_var_ErrorInfo2="你本周的双倍时间已经不足2小时，无法领取！"
x561002_var_ErrorInfo3="你本周的双倍时间已经不足4小时，无法领取！"
x561002_var_BonusMoney1 =0
x561002_var_BonusMoney2 =0
x561002_var_BonusMoney3 =0
x561002_var_BonusItem	=	{}
x561002_var_BonusChoiceItem ={}
x561002_var_ExpBonus = 250
x561002_var_SkillHalfHour = 7510
x561002_var_SkillOneHour = 7511

x561002_var_maxtimes = 5 
x561002_var_defualtdialog = "\t圣人曰：不舍昼夜。要想高人一等的话，必须勤奋加上正确的方法。"
x561002_var_otherdialog = "\n\t#Y本周您还可以领取#W#G%s小时#W#Y双倍经验#W"
x561002_var_errordialog = "\n\t#R本周剩余双倍时间为0小时，请通过购买双倍经验道具获得双倍经验#W"
x561002_var_fulldialog = "\n\t#Y本周您还可以领取#W#G%s小时#W#Y双倍经验#W"
x561002_var_jiedong = "\t你是否要解冻双倍经验时间？你现在冻结的双倍经验时间为：#G%d小时%d分钟#W。"
--DECLARE_QUEST_INFO_STOP--

function x561002_CheckDongShuang(varMap, varPlayer, buffTimer)
	if buffTimer > 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"处于双倍冻结状态，无法领取") 
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		return 0
	end
	return 1
end






function x561002_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
	local status1 = (IsHaveSpecificImpact(varMap, varPlayer,x561002_var_SkillHalfHour))
	local status2 = (IsHaveSpecificImpact(varMap, varPlayer,x561002_var_SkillOneHour))
	local varLevel = GetLevel(varMap,varPlayer)
	local buffTimer = x561002_GetRecordData( varMap, varPlayer ) 

	if extid == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x561002_var_QuestName1)
			TalkAppendString(varMap,x561002_var_QuestInfo)
		StopTalkTask()
		x561002_SetSelected(varMap, varPlayer, 1)
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x561002_var_FileId, x561002_var_QuestName1)

	elseif extid == 2 then 
		if x561002_CheckDongShuang(varMap, varPlayer, buffTimer) <= 0 then
			x561002_SetSelected(varMap, varPlayer, 0)
			return
		end
		if varLevel < 20 then
				StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x561002_var_QuestName2)
					TalkAppendString(varMap,"\t等级不足,无法领取双倍经验！")
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x561002_var_FileId, x561002_var_QuestName2)
		elseif varLevel >= 20 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName2)
				TalkAppendString(varMap,x561002_var_ContinueInfo1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561002_var_FileId, -1)
			x561002_SetSelected(varMap, varPlayer, 2)
		end

	elseif extid == 3 then 
		if x561002_CheckDongShuang(varMap, varPlayer, buffTimer) <= 0 then
			x561002_SetSelected(varMap, varPlayer, 0)
			return
		end
		if varLevel < 20 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName5)
				TalkAppendString(varMap,"\t等级不足,无法领取双倍经验！")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x561002_var_FileId, x561002_var_QuestName5)
		elseif  varLevel >= 20 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName5)
				TalkAppendString(varMap,x561002_var_ContinueInfo2)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561002_var_FileId, -1)
			x561002_SetSelected(varMap, varPlayer, 3)
		end
	
	elseif extid == 4 then 
		if x561002_CheckDongShuang(varMap, varPlayer, buffTimer) <= 0 then
			x561002_SetSelected(varMap, varPlayer, 0)
			return
		end
		if varLevel < 20 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName6)
				TalkAppendString(varMap,"\t等级不足,无法领取双倍经验！")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x561002_var_FileId, x561002_var_QuestName6)
		elseif  varLevel >= 20 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName6)
				TalkAppendString(varMap,x561002_var_ContinueInfo4)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561002_var_FileId, -1)
			x561002_SetSelected(varMap, varPlayer, 4)
		end
	
	elseif extid == 5 then
		if( IsHaveSpecificImpact( varMap, varPlayer, x561002_var_SkillOneHour ) <= 0 ) then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "不处于双倍状态，无法冻双") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			x561002_SetSelected(varMap, varPlayer, 0)
			return
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName7)
				TalkAppendString(varMap,x561002_var_ContinueInfo5)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561002_var_FileId, -1)
			x561002_SetSelected(varMap, varPlayer, 5)
		end
	elseif extid == 6 then
		local buffTimer = x561002_GetRecordData( varMap, varPlayer ) 
		if buffTimer <= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "不处于冻双状态，无法解冻") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			x561002_SetSelected(varMap, varPlayer, 0)
			return
		else
			local h = floor( buffTimer /60 )
			local m = mod(buffTimer,60)
			local strFmt = format( x561002_var_jiedong, h,m)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x561002_var_QuestName8)
				TalkAppendString(varMap,strFmt)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561002_var_FileId, -1)
			x561002_SetSelected(varMap, varPlayer, 6)
		end
	end

end









function x561002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 20 then
		TalkAppendString(varMap,x561002_var_defualtdialog)
		TalkAppendButton(varMap, x561002_var_FileId, x561002_var_QuestName1,0,1)
		return
	end
		
	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		local weekcount = x561002_GetWeekCount(varMap, varPlayer)
		if weekcount >= x561002_var_maxtimes then
			TalkAppendString(varMap,x561002_var_defualtdialog)
			TalkAppendString(varMap,x561002_var_errordialog)
		else
			local varStr = format( x561002_var_otherdialog, (x561002_var_maxtimes-weekcount) )
			TalkAppendString(varMap,x561002_var_defualtdialog)
			TalkAppendString(varMap, varStr)
		end
		
		local strFmt
		local buffTimer = x561002_GetRecordData( varMap, varPlayer ) 
		
		if buffTimer > 0 then
			local strDongShuang = "解冻双倍时间#G(%d小时%d分)"
			local h = floor( buffTimer /60 )
			local m = mod(buffTimer,60)
			strFmt = format( strDongShuang, h,m)
		else
			strFmt = "解冻双倍时间"
		end
		TalkAppendButton(varMap, x561002_var_FileId, x561002_var_QuestName2,3,2)
		TalkAppendButton(varMap, x561002_var_FileId, x561002_var_QuestName5,3,3)
		TalkAppendButton(varMap, x561002_var_FileId, x561002_var_QuestName6,3,4)
		TalkAppendButton(varMap, x561002_var_FileId, x561002_var_QuestName7,3,5)
		TalkAppendButton(varMap, x561002_var_FileId, strFmt,3,6)
		TalkAppendButton(varMap, x561002_var_FileId, x561002_var_QuestName1,0,1)
		
	else 
			return
	end
	
end









function x561002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1
end








function x561002_CheckPushList(varMap, varPlayer, varTalknpc)
	
end


function x561002_SendLingshangImpact(varMap, varPlayer, currentContinuance)

	local lastContinuance = -1
	if( IsHaveSpecificImpact( varMap, varPlayer, x561002_var_SkillOneHour ) > 0 ) then
		local ImpactContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x561002_var_SkillOneHour) + currentContinuance
		lastContinuance = ImpactContinuance - GetImpactContinuanceElapsed(varMap, varPlayer, x561002_var_SkillOneHour)

		if 2147483647   < lastContinuance then
			lastContinuance = 2147483647 
		end
	else
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x561002_var_SkillOneHour, 0);
		lastContinuance = currentContinuance
	end
	
	if lastContinuance >= 0 then
		SetImpactContinuanceByDataIndex( varMap, varPlayer, x561002_var_SkillOneHour, lastContinuance )
		ResetImpactContinuanceElapsed(varMap, varPlayer, x561002_var_SkillOneHour)
		RefreshImpactByDataIndex(varMap, varPlayer, x561002_var_SkillOneHour)
	end
end








function x561002_ProcAccept( varMap, varPlayer )

	local Flag = x561002_GetSelected(varMap, varPlayer)
	local weekcount = x561002_GetWeekCount(varMap, varPlayer)
	local HourToMilSec = 60*60*1000
	if Flag == 1 then
		x561002_SetSelected(varMap, varPlayer, 0)
		if weekcount <= x561002_var_maxtimes then
		 	StartTalkTask(varMap)
				TalkAppendString(varMap,x561002_var_QuestInfo) 
			StopTalkTask()
		end
		
	elseif Flag == 2 then	
		x561002_SetSelected(varMap, varPlayer, 0)

		local remantimes = x561002_var_maxtimes - weekcount
		if remantimes >= 1 then
		 	StartTalkTask(varMap)
				x561002_SendLingshangImpact( varMap, varPlayer, HourToMilSec )
				TalkAppendString(varMap, x561002_var_QuestCompleted1) 
				x561002_SetWeekCount(varMap, varPlayer, weekcount + 1)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
		else 
			StartTalkTask(varMap)
				TalkAppendString(varMap,x561002_var_ErrorInfo1) 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
		end	
		
	elseif Flag == 3 then 
		x561002_SetSelected(varMap, varPlayer, 0)
		local remantimes = x561002_var_maxtimes - weekcount
		if remantimes >= 2 then
		 	StartTalkTask(varMap)
				x561002_SendLingshangImpact( varMap, varPlayer, HourToMilSec * 2 )
				TalkAppendString(varMap, x561002_var_QuestCompleted2) 
				x561002_SetWeekCount(varMap, varPlayer, weekcount + 2)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
		else 
			StartTalkTask(varMap)
				TalkAppendString(varMap,x561002_var_ErrorInfo2) 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
		end
	elseif Flag == 4 then 
		x561002_SetSelected(varMap, varPlayer, 0)
		local remantimes = x561002_var_maxtimes - weekcount
		if remantimes >= 4 then
		 	StartTalkTask(varMap)
				x561002_SendLingshangImpact( varMap, varPlayer, HourToMilSec * 4 )
				TalkAppendString(varMap, x561002_var_QuestCompleted3) 
				x561002_SetWeekCount(varMap, varPlayer, weekcount + 4)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
		else 
			StartTalkTask(varMap)
				TalkAppendString(varMap,x561002_var_ErrorInfo3) 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
		end

	elseif Flag == 5 then 
		x561002_SetSelected(varMap, varPlayer, 0)
		local buffTimer = x561002_GetRecordData( varMap, varPlayer ) 

		local ImpactContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x561002_var_SkillOneHour)
		local lastContinuance = ImpactContinuance - GetImpactContinuanceElapsed(varMap, varPlayer, x561002_var_SkillOneHour)
		lastContinuance = lastContinuance * 0.001 / 60 
		lastContinuance = lastContinuance + buffTimer
		if lastContinuance > 300 then 
			lastContinuance = 300
		end
		x561002_RecordData(varMap, varPlayer, lastContinuance)
		CancelSpecificImpact( varMap, varPlayer, x561002_var_SkillOneHour )

	elseif Flag == 6 then 
		x561002_SetSelected(varMap, varPlayer, 0)
		local ImpactContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x561002_var_SkillOneHour)
		local lastContinuance = ImpactContinuance - GetImpactContinuanceElapsed(varMap, varPlayer, x561002_var_SkillOneHour)
		local buffTimer = x561002_GetRecordData( varMap, varPlayer )
		buffTimer = buffTimer * 60 * 1000
		buffTimer = buffTimer + lastContinuance
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x561002_var_SkillOneHour, 0);
		
		SetImpactContinuanceByDataIndex( varMap, varPlayer, x561002_var_SkillOneHour, buffTimer )
		ResetImpactContinuanceElapsed(varMap, varPlayer, x561002_var_SkillOneHour)
		RefreshImpactByDataIndex(varMap, varPlayer, x561002_var_SkillOneHour)

		x561002_RecordData(varMap, varPlayer, 0)

	end
end

function x561002_RecordData(varMap, varPlayer,timer)
	SetPlayerGameData(varMap,varPlayer,MD_SKILL_LING_SHUANG[1],MD_SKILL_LING_SHUANG[2],MD_SKILL_LING_SHUANG[3],timer)
end

function x561002_GetRecordData(varMap, varPlayer)
	local result = GetPlayerGameData(varMap, varPlayer, MD_SKILL_LING_SHUANG[1], MD_SKILL_LING_SHUANG[2],MD_SKILL_LING_SHUANG[3] )
	return result
end







function x561002_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561002_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x561002_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x561002_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561002_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x561002_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x561002_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x561002_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x561002_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x561002_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x561002_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x561002_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x561002_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x561002_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x561002_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end




function x561002_GetWeekCount(varMap, varPlayer)
	local nowtime = GetCurrentTime() + 8 * 3600
	local thisweek = floor(nowtime / 86400) - 14249 
	thisweek = floor(thisweek / 7)

	local lastweek = GetPlayerGameData(varMap, varPlayer, MD_DOUBLE_DATE[1], MD_DOUBLE_DATE[2],MD_DOUBLE_DATE[3] )

	if lastweek ~= thisweek then
		return 0
	end

	local weekcount = GetPlayerGameData(varMap, varPlayer, MD_DOUBLE_TIMES[1], MD_DOUBLE_TIMES[2],MD_DOUBLE_TIMES[3] )
	return weekcount
end




function x561002_SetWeekCount(varMap, varPlayer, varCount)
	local nowtime = GetCurrentTime() + 8 * 3600
	local thisweek = floor(nowtime / 86400) - 14249 
	thisweek = floor(thisweek / 7)

	local lastweek = GetPlayerGameData(varMap, varPlayer, MD_DOUBLE_DATE[1], MD_DOUBLE_DATE[2],MD_DOUBLE_DATE[3] )

	if lastweek ~= thisweek then
		SetPlayerGameData(varMap, varPlayer, MD_DOUBLE_DATE[1], MD_DOUBLE_DATE[2], MD_DOUBLE_DATE[3], thisweek)
		SetPlayerGameData(varMap, varPlayer, MD_DOUBLE_TIMES[1], MD_DOUBLE_TIMES[2], MD_DOUBLE_TIMES[3], varCount)
	else
		SetPlayerGameData(varMap, varPlayer, MD_DOUBLE_TIMES[1], MD_DOUBLE_TIMES[2], MD_DOUBLE_TIMES[3], varCount)
	end

end




function x561002_GetSelected(varMap, varPlayer)
	local varFlag = GetPlayerGameData(varMap, varPlayer, MD_DOUBLE_TIMES_FLAG[1], MD_DOUBLE_TIMES_FLAG[2],MD_DOUBLE_TIMES_FLAG[3] )
	return varFlag
end




function x561002_SetSelected(varMap, varPlayer, varFlag)
	SetPlayerGameData(varMap, varPlayer, MD_DOUBLE_TIMES_FLAG[1], MD_DOUBLE_TIMES_FLAG[2], MD_DOUBLE_TIMES_FLAG[3], varFlag)
end
