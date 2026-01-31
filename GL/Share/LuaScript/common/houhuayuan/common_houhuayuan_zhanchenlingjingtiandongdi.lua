--DECLARE_QUEST_INFO_START--
x320040_var_FileId 						= 320040
x320040_var_QuestName					= "【战车】千里杀敌"
x320040_var_QuestInfo					= "\t后花园中最近突然出现了各国的神秘战车，此害不除，早晚会生祸端，你能驾驶战车，想必可以将其击杀。"
x320040_var_QuestCompleted				= "\t看你志得意满的样子一定是大有收获。呵呵，不过要记住，每天的磨练是必不可少的！"
x320040_var_QuestRuse					= "\t击杀后花园中的战车"
x320040_var_QuestHelp					= "\t只能在驾驶战车状态才能完成任务。如果你是在#R战车令发布期间#W完成任务，会获得#R三倍奖励#W"
x320040_var_strQuestFinishTip			= "\t任务已经完成，快点回去汇报吧！"
x320040_var_QuestId						= {6661, 6662, 6663, 6664}
x320040_var_QuestIdAll					= {6661, 6662, 6663, 6664, 6669, 6670, 6671,6672,6673,6674,6675, 6676}
x320040_var_PreQuestId					= {6669, 6670, 6671, 6672}
x320040_var_PreQuestId1					= {6673, 6674, 6675, 6676}
x320040_var_LeagueQuest					= {6677, 6678, 6679, 6680, 6681, 6682, 6683, 6684, 6685, 6686, 6687, 6688, 6689, 6690, 6691, 6692}
x320040_var_PreQuestId2					= {
{6677, 6678, 6679, 6680},
{6681, 6682, 6683, 6684},
{6685, 6686, 6687, 6688},
{6689, 6690, 6691, 6692},
}
x320040_var_SubmitNPCGUID				= {401241, 401242, 401243, 401244}
x320040_var_LevelLess	= 	70
x320040_var_GetPlayerHonour 		= 160
x320040_var_GetPlayerExp				=  
{
{level = 60, value = 1750, honour = 300},
{level = 70, value = 1750, honour = 300},
{level = 80, value = 1750, honour = 300},
{level = 90, value = 1750, honour = 300},
{level = 100, value = 1750, honour = 300},
{level = 110, value = 1750, honour = 300},
}
x320040_var_KillMonsterTable          	= {
                                        	{ level = 60, varX = 103,z = 103, monsterId = 56619, posId = 401246, varCount = 1, varName = "楼兰战车", 
                                          	target = "  击杀#R@npc_401246#W(%d/%d)"},
                                        	{ level = 60, varX = 103,z = 103, monsterId = 56620, posId = 401247, varCount = 1, varName = "天山战车", 
                                          	target = "  击杀#R@npc_401247#W(%d/%d)"},
                                        	{ level = 60, varX = 103,z = 103, monsterId = 56621, posId = 401248, varCount = 1, varName = "昆仑战车", 
                                          	target = "  击杀#R@npc_401248#W(%d/%d)"} ,    
                                        	{ level = 60, varX = 103,z = 103, monsterId = 56622, posId = 401249, varCount = 1, varName = "敦煌战车", 
                                          	target = "  击杀#R@npc_401249#W(%d/%d)"}                                          	                                     	
}
--DECLARE_QUEST_INFO_STOP--

function x320040_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varCountry = GetCurCountry(varMap, varPlayer)
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
  --    	return 
 -- 	end



	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local AcceptNPCGUID = x320040_GetNPCGUID(varMap, varPlayer)	

	local nCountryIdx = x320040_GetKillTarget(varMap, varPlayer) - 1
	local weakcountryid = x320040_GetWeakCountry(varMap, varPlayer)		

	if varTalkNpcGUID == AcceptNPCGUID and IsHaveQuestNM( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer) ) <= 0  then
		if x320040_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU) == GetDayOfYear() and x320040_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI) ~= GetDayOfYear() then
			local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
			if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, nCountryIdx) ~= 1 then
				TalkAppendButton(varMap, x320040_VarQuest(varMap, varPlayer), x320040_var_QuestName..countryname, state)
			end
		end
	end
end


function x320040_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local AcceptNPCGUID = x320040_GetNPCGUID(varMap, varPlayer)		
	if AcceptNPCGUID ~= varTalkNpcGUID  then
		return
	end
	if IsHaveQuestNM( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x320040_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x320040_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x320040_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
			x320040_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
end



function x320040_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)

	local num = 1
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 

	if KilledNum < x320040_var_KillMonsterTable[num].varCount then
		return 0
	else
		return 1
	end
end




function x320040_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local nCountryIdx = x320040_GetKillTarget(varMap, varPlayer) - 1
	local varCountry = GetCurCountry(varMap, varPlayer)
	local weakcountryid = x320040_GetWeakCountry(varMap, varPlayer)	
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local VarQuest1, VarQuest2 = x320040_PreVarQuest(varMap, varPlayer)
	local VarQuest3 = x320040_PreVarQuest1(varMap, varPlayer)
    local PlayerValue = x320040_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI)
    
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
 --     	return 
  --	end

	if PlayerValue == GetDayOfYear() then
		local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
		Msg2Player(varMap, varPlayer, format("已经完成过#R%s#0任务",x320040_var_QuestName)..countryname, 8, 3)

		return		
	else
		x320040_SetMD( varMap, varPlayer, MD_ZHANCHELING_JINGTIANDONGDI1_COUNT, 0)
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, nCountryIdx) == 1 then
		return 
	end

	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能领取任务！", 8, 3)
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, VarQuest1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, VarQuest2) > 0  then
		Msg2Player(varMap, varPlayer, "你已经领取#R任务【千里杀敌】#cffcf00，放弃后才可领取其他国家任务", 8, 3)
		return	
	end

	if x320040_HaveLeagueQuest(varMap, varPlayer) == 1 then
			Msg2Player(varMap, varPlayer, "你已经领取#R任务【与子同袍】#cffcf00，放弃后才可领取其他国家任务", 8, 3)
			return
	end
			
	if VarQuest3 ~= -1 then
		if IsHaveQuestNM( varMap, varPlayer, VarQuest3) > 0 then
			Msg2Player(varMap, varPlayer, "你已经领取#R任务【与子同袍】#cffcf00，放弃后才可领取其他国家任务", 8, 3)
			return	
		end
	end
	
	
	if AddQuest( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer),x320040_var_FileId,0,0,0,1) == 1 then
	GamePlayScriptLog(varMap, varPlayer, 2626)	
	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
		--接任务写日志
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x320040_var_QuestName)..countryname)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x320040_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme..countryname,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320040_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
	end

end


function x320040_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local num = 1
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 
	local nlevel = GetLevel( varMap, varPlayer)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	
	if nlevel < 70 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
		return
	end

	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能提交任务！", 8, 3)
		return
	end



	if KilledNum < x320040_var_KillMonsterTable[num].varCount then
		Msg2Player(varMap,varPlayer,"杀怪数量不够，无法提交任务！",8,3)	
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
		x320040_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )						
	else
		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end



function x320040_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
	GamePlayScriptLog(varMap, varPlayer, 2627)	
   	local AddThirdExp = floor(x320040_YunBiaoExp(varMap, varPlayer) * 2)
 	local AddThirdHonour = floor(x320040_PlayerHonour(varMap, varPlayer) * 2)
    AddExp(varMap, varPlayer, x320040_YunBiaoExp(varMap, varPlayer))
	local varHonour = x320040_PlayerHonour(varMap, varPlayer)
	AddPlayerChariotHonour(varMap, varPlayer, varHonour)     
    local PlayerValue = x320040_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI)
    if PlayerValue <= 511 then
    	x320040_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI, GetDayOfYear())
    end
    		x320040_SetMD( varMap, varPlayer, MD_ZHANCHELING_JINGTIANDONGDI1_COUNT, 1)
 local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))   
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x320040_var_QuestName)..countryname);
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x320040_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R战车荣誉"..x320040_PlayerHonour(varMap, varPlayer) .."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)    
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x320040_var_QuestName)..countryname,8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x320040_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x320040_PlayerHonour(varMap, varPlayer) ),8,2)
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
   		Msg2Player(varMap,varPlayer,format("战车令额外获得战车荣誉奖励#R%s#cffcf00点",AddThirdHonour),8,2)   		
	end     
end



function x320040_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )
	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..x320040_var_QuestName..countryname)
		TalkAppendString(varMap,format("%s".."\n", x320040_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：#W".."\n"..x320040_var_QuestRuse.."\n")

		--提示信息
		if x320040_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x320040_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320040_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320040_PlayerHonour(varMap, varPlayer)	
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..varHonour.."点")
		end		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320040_var_FileId, varQuest)
end



function x320040_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x320040_var_QuestName..countryname)
		TalkAppendString(varMap,x320040_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x320040_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320040_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	        TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320040_var_FileId, x320040_VarQuest(varMap, varPlayer))

end


function x320040_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x320040_var_QuestName..countryname)
		TalkAppendString(varMap, x320040_var_QuestInfo)
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320040_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320040_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	       TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320040_var_FileId, varQuest,0);



end



function x320040_ProcQuestAbandon( varMap, varPlayer,varQuest )


	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
	DelQuestNM( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer))
	local Readme = format("你放弃了任务：%s",x320040_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme..countryname);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme..countryname,8,2)
    local PlayerValue = x320040_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI)
    if PlayerValue <= 511 then
    	x320040_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI, GetDayOfYear())
    end
    		x320040_SetMD( varMap, varPlayer, MD_ZHANCHELING_JINGTIANDONGDI1_COUNT, 1)
end


function x320040_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer))
	local targetid = x320040_GetKillTarget(varMap, varPlayer)
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
	local varExp = 	x320040_YunBiaoExp(varMap, varPlayer)
	local varHonour = x320040_PlayerHonour(varMap, varPlayer)
 	local questtarget = format(x320040_var_KillMonsterTable[targetid].target, KilledNum, x320040_var_KillMonsterTable[targetid].varCount)
 	local questtarget1 = format(questtarget.."#Y\n奖励内容：\n#W经验值："..varExp.."点".."\n#W战车荣誉："..varHonour.."点")
 	local SubmitNPCGUID = x320040_GetNPCGUID(varMap, varPlayer)	
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,x320040_VarQuest(varMap, varPlayer) )
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)
	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320040_var_QuestName..countryname,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x320040_var_QuestInfo,			--任务描述
								x320040_var_QuestHelp								--任务小提示
								)
 
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x320040_VarQuest(varMap, varPlayer));
	end

end




function x320040_ProcDie(varMap, varPlayer, varKiller)
	
	if IsObjValid(varMap, varKiller) == 0 then
		return
	end

	local nKillerType = GetObjType(varMap, varKiller)

	if  nKillerType ~= 11 then
		return
	end
	
	varKiller = GetPlayerObjIdByChariot(varMap, varKiller)

	local countryId = GetCurCountry( varMap, varKiller)
	local varX,z = GetWorldPos(varMap,varKiller)			
	local countryNum =  GetNearCountryCount(varMap, varKiller,varX,z, 30)
	
		
		
	for varI = 0, countryNum-1 do
		local countrymember = GetNearCountryMember(varMap, varKiller,varI)
		local varQuestIdx = 0
		local KilledNum = 0
		local num = x320040_GetKillTarget(varMap, countrymember)
		local TargetName = ""
		if IsInChariot(varMap, countrymember) == 1 then
			if IsHaveQuestNM( varMap, countrymember, x320040_VarQuestAll(varMap, countrymember) ) > 0 then
				if x320040_VarTargetID(varMap, varPlayer, x320040_VarQuestAll(varMap, countrymember)) == GetMonsterDataID(varMap, varPlayer) then
			   		varQuestIdx = GetQuestIndexByID( varMap, countrymember, x320040_VarQuestAll(varMap, countrymember))
					TargetName = x320040_VarTargetName(varMap, varPlayer, x320040_VarQuestAll(varMap, countrymember))
					if GetQuestParam( varMap, countrymember, varQuestIdx, 1) < 1 then				
						Msg2Player( varMap, countrymember, x320040_var_strQuestFinishTip, 8, 3)
						Msg2Player( varMap, countrymember, format( "已消灭#G%s#cffcf00(%d/%d)", TargetName, 1, x320040_var_KillMonsterTable[num].varCount), 8, 3)
					end					
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 1, 1)					
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 0, 1)
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 7, 1)				

				end 
				
			elseif IsHaveQuestNM( varMap, countrymember, LuaCallNoclosure(320042, "VarQuestAll", varMap, countrymember)) > 0 then
				if x320040_VarTargetID(varMap, varPlayer, LuaCallNoclosure(320042, "VarQuestAll", varMap, countrymember)) == GetMonsterDataID(varMap, varPlayer) then
			   		varQuestIdx = GetQuestIndexByID( varMap, countrymember, LuaCallNoclosure(320042, "VarQuestAll", varMap, countrymember))	
					TargetName = x320040_VarTargetName(varMap, varPlayer, LuaCallNoclosure(320042, "VarQuestAll", varMap, countrymember))
					if GetQuestParam( varMap, countrymember, varQuestIdx, 1)  < 1 then
				    	Msg2Player( varMap, countrymember, x320040_var_strQuestFinishTip, 8, 3)	      
				    	Msg2Player( varMap, countrymember, format( "已消灭#G%s#cffcf00(%d/%d)", TargetName, 1, x320040_var_KillMonsterTable[num].varCount), 8, 3)
					end
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 1, 1)										
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 0, 1)
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 7, 1)				

				end 				
				
		   	elseif IsHaveQuestNM( varMap, countrymember, LuaCallNoclosure(320043, "VarQuestAll", varMap, countrymember)) > 0 then 	
				if x320040_VarTargetID(varMap, varPlayer, LuaCallNoclosure(320043, "VarQuestAll", varMap, countrymember)) == GetMonsterDataID(varMap, varPlayer) then
			   		varQuestIdx = GetQuestIndexByID( varMap, countrymember, LuaCallNoclosure(320043, "VarQuestAll", varMap, countrymember))
					TargetName = x320040_VarTargetName(varMap, varPlayer, LuaCallNoclosure(320043, "VarQuestAll", varMap, countrymember))
					if GetQuestParam( varMap, countrymember, varQuestIdx, 1) < 1 then
			        	Msg2Player( varMap, countrymember, x320040_var_strQuestFinishTip, 8, 3)
			        	Msg2Player( varMap, countrymember, format( "已消灭#G%s#cffcf00(%d/%d)", TargetName, 1, x320040_var_KillMonsterTable[num].varCount), 8, 3)				
					end	
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 1, 1)									
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 0, 1)
					SetQuestByIndex( varMap, countrymember, varQuestIdx, 7, 1)				

				end 				
		   	end



			--x320040_ProcQuestLogRefresh( varMap, countrymember, x320040_VarQuestAll(varMap, countrymember))
		end
	end
	

end

function x320040_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	
end

function x320040_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x320040_VarQuest(varMap, varPlayer) )
	local num = 1
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x320040_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 
	local countryname = format("(%s)",x320040_GetCountryName(varMap, varPlayer))
	if varHaveQuest > 0 then
		if varTalkNpcGUID == x320040_GetNPCGUID(varMap, varPlayer)  then
			if KilledNum < x320040_var_KillMonsterTable[num].varCount or IsInChariot(varMap, varPlayer) ~= 1 then
				TalkAppendButton(varMap, x320040_VarQuest(varMap, varPlayer), x320040_var_QuestName..countryname,6, 1)
			else
				TalkAppendButton(varMap, x320040_VarQuest(varMap, varPlayer), x320040_var_QuestName..countryname,7, 1)			
			end
		end
	end
end

function x320040_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320040_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x320040_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x320040_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x320040_var_QuestId[4]
	end		

end

function x320040_VarTargetID(varMap, varPlayer, varquest)
	
	local TargetID = 0
	if varquest == 6664 or varquest == 6671 or varquest == 6674 then
		TargetID = 56619
		return TargetID
	elseif varquest == 6661 or varquest == 6672 or varquest == 6675 then
		TargetID = 56620
		return TargetID
	elseif varquest == 6662 or varquest == 6669 or varquest == 6676 then
		TargetID = 56621
		return TargetID
	elseif varquest == 6663 or varquest == 6670 or varquest == 6673 then
		TargetID = 56622
		return TargetID
	end 

end


function x320040_VarTargetName(varMap, varPlayer, varquest)
	
	local TargetName = ""
	if varquest == 6664 or varquest == 6671 or varquest == 6674 then
		TargetName = "楼兰战车"
		return TargetName
	elseif varquest == 6661 or varquest == 6672 or varquest == 6675 then
		TargetName = "天山战车"
		return TargetName
	elseif varquest == 6662 or varquest == 6669 or varquest == 6676 then
		TargetName = "昆仑战车"
		return TargetName
	elseif varquest == 6663 or varquest == 6670 or varquest == 6673 then
		TargetName = "敦煌战车"
		return TargetName
	end 

end


function x320040_VarQuestAll(varMap, varPlayer)
	for i, item in x320040_var_QuestIdAll do
		if x320040_VarQuest(varMap, varPlayer) == item then
			return item
		end
	end
end


function x320040_GetKillTarget(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return 2
	elseif nCountryIdx == 1 then
		return 3
	elseif nCountryIdx == 2 then	
		return 4
	elseif nCountryIdx == 3 then
		return 1
	end	

end



function x320040_PreVarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320040_var_PreQuestId[1], x320040_var_PreQuestId1[1]
	elseif nCountryIdx == 1 then
		return x320040_var_PreQuestId[2], x320040_var_PreQuestId1[2]
	elseif nCountryIdx == 2 then	
		return x320040_var_PreQuestId[3], x320040_var_PreQuestId1[3]
	elseif nCountryIdx == 3 then
		return x320040_var_PreQuestId[4], x320040_var_PreQuestId1[4]
	end		

end

--判断是否有联盟任务，有则返回1，没有返回-1
function x320040_HaveLeagueQuest(varMap, varPlayer)
 	for i , item in x320040_var_LeagueQuest do
 		if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
 			return 1
 		end
 	end
 	return -1
end

function x320040_PreVarQuest1(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local questid = -1
	for m = 0, 3 do
		if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, m) == 1 then
			questid = x320040_var_PreQuestId2[varCountry + 1][m + 1]
			break
		end
	end
	return questid	
end

function x320040_PlayerHonour(varMap, varPlayer)
	return x320040_var_GetPlayerHonour

end

function x320040_GetCountryName(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		return "天山"
	elseif nCountryIdx == 1 then
		return "昆仑"
	elseif nCountryIdx == 2 then	
		return "敦煌"
	elseif nCountryIdx == 3 then
		return "楼兰"
	end

end

function x320040_GetNPCGUID(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320040_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		return x320040_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then	
		return x320040_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		return x320040_var_SubmitNPCGUID[4]
	end	

end

function x320040_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 70 then
		return
	end
	for i, j in x320040_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x320040_GetWeakCountry(varMap, varPlayer)
	local league = -1
	local varCountry = GetCurCountry(varMap, varPlayer)
	for m = 0, 3 do
		if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, m) == 1 then
			league = m
			return league
		end
	end
	return league
end

function x320040_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320040_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
