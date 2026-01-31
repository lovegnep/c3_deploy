--DECLARE_QUEST_INFO_START--
x320048_var_FileId 						= 320048
x320048_var_QuestInfo					= "\t后花园中各国都在调遣战车部将，据我猜测，战火必会重燃。你速去联络我们盟国的战车宣抚使，一旦形势有变，我们共同进退。"
x320048_var_QuestCompleted				= "\t看你志得意满的样子一定是大有收获。呵呵，不过要记住，每天的磨练是必不可少的！"
x320048_var_QuestRuse					= "\t联络盟国的战车宣抚使"
x320048_var_QuestHelp					= "\t只能在驾驶战车状态才能完成任务。如果你是在#R战车令发布期间#W完成任务，会获得#R三倍奖励#W \n\t此任务为#R联盟任务#W。 "
x320048_var_strQuestFinishTip			= "\t任务已经完成，快点回去汇报吧！"
x320048_var_QuestId						= {6685, 6686, 6687, 6688}
x320048_var_PreQuestId					= {6661, 6662, 6663, 6664}
x320048_var_PreQuestId1					= {6673, 6674, 6675, 6676}
x320048_var_PreQuestId2					= {6669, 6670, 6671, 6672}
x320048_var_QuestNPC					= {401251, 401252, 401253, 401254}
x320048_var_SubmitNPCGUID				= {401241, 401242, 401243, 401244}
x320048_var_LevelLess	= 	70
x320048_var_QuestName					= {"【战车】与子同袍(楼兰)[联盟]", "【战车】与子同袍(天山)[联盟]", "【战车】与子同袍(昆仑)[联盟]", "【战车】与子同袍(敦煌)[联盟]"}
x320048_var_GetPlayerHonour 			= 160
x320048_var_GetPlayerExp				=  
{
{level = 60, value = 1750, honour = 300},
{level = 70, value = 1750, honour = 300},
{level = 80, value = 1750, honour = 300},
{level = 90, value = 1750, honour = 300},
{level = 100, value = 1750, honour = 300},
{level = 110, value = 1750, honour = 300},
}
--DECLARE_QUEST_INFO_STOP--

x320048_var_DateMD = { MD_HOUHUAYUAN_JINGTIANDONGDI2, MD_HOUHUAYUAN_JINGTIANDONGDI3, -1, MD_HOUHUAYUAN_JINGTIANDONGDI } 
function x320048_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local varCountry = GetCurCountry(varMap, varPlayer)
	local questid, questname, questNPC;-- = x320048_VarQuest(varMap, varPlayer)
	local countryid1, countryid2, countryid3 = x320048_GetFinishQuestCountry(varMap, varPlayer)	
		if x320048_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUANZHENGZHILU) == GetDayOfYear() then --and x320048_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO) ~= GetDayOfYear() then	
			for m = 0, 3 do
				if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, m) == 1 then
					 	questid = x320048_var_QuestId[m + 1]
						questname = x320048_var_QuestName[m + 1]
						questNPC = x320048_var_QuestNPC[m + 1]
				if IsHaveQuestNM( varMap, varPlayer, questid ) <= 0  then		
					if m + 1 ~= countryid1 and m + 1 ~= countryid2 and m + 1 ~= countryid3 then					
						local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, questid)
						TalkAppendButton(varMap, questid, questname, state)
					end
				end
			end
		end
	end
end

function x320048_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
		
	    
    
	local questId = varQuest
	
	if IsHaveQuestNM( varMap, varPlayer, questId ) > 0 then
		local bDone = x320048_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x320048_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x320048_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local AcceptNPCGUID = x320048_GetNPCGUID(varMap, varPlayer)		
		if AcceptNPCGUID == varTalkNpcGUID  then
			x320048_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end	
end



function x320048_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local questid = varQuest
	local questname = ""
	local targetCountry = -1
	for i = 1, 4 do
			if x320048_var_QuestId[i] == questid then
					questname = x320048_var_QuestName[i]
					targetCountry = i-1
			end
	end
	if x320048_VarQuest(varMap, varPlayer) ~= -1 then
		Msg2Player(varMap,varPlayer,"你已经领取联盟任务，完成后才可领取其他任务",8,3)
		return
	end
	
	local VarQuest1, VarQuest2, VarQuest3 = x320048_PreVarQuest(varMap, varPlayer)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
    local PlayerValue = x320048_GetMD( varMap, varPlayer, x320048_var_DateMD[targetCountry+1] )
    
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--		Msg2Player(varMap,varPlayer,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
  --    	return 
  --	end

	if PlayerValue == GetDayOfYear() then

		Msg2Player(varMap, varPlayer, format("已经完成过#R%s#0任务",questname), 8, 3)

		return		
	else
		x320048_SetMD( varMap, varPlayer, x320048_var_DateMD[targetCountry+1], 0)
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
	
	if IsHaveQuestNM( varMap, varPlayer, VarQuest1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, VarQuest2) > 0 or IsHaveQuestNM( varMap, varPlayer, VarQuest3) > 0 then
		Msg2Player(varMap, varPlayer, "你已经领取#R任务【千里杀敌】#cffcf00，放弃后才可领取其他国家任务", 8, 3)
		return	
	end
	

	if AddQuest( varMap, varPlayer, questid,x320048_var_FileId,0,0,0,1) == 1 then
	GamePlayScriptLog(varMap, varPlayer, 2630)

		--接任务写日志
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",questname))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",questname)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, questid);
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
	end

end



function x320048_ProcQuestAbandon( varMap, varPlayer,varQuest )

	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)

	DelQuestNM( varMap, varPlayer, questid)
	local Readme = format("你放弃了任务：%s",questname)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end

function x320048_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, questid)
	
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
		return 1
	else
		return 0
	end

end


function x320048_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)
	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, questid)
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
		x320048_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )						
	else
		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


--得到玩家已接任务
function x320048_VarQuest(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local questid = -1
	local questname = ""
	local questNPC = -1

--	for m = 0, 3 do
--		if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, m) == 1 then
--			questid = x320048_var_QuestId[m + 1]
--			questname = x320048_var_QuestName[m + 1]
--			questNPC = x320048_var_QuestNPC[m + 1]
--			x320048_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO_LEAGUEID, m + 1)
--			return questid, questname, questNPC
--		end
--	end
	
--	local num = x320048_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO_LEAGUEID)
--	if num == 0 then
--		return  questid, questname, questNPC
--	end
	local index = -1
	  for i = 1, 4 do
	  	if IsHaveQuestNM( varMap, varPlayer, x320048_var_QuestId[i] ) > 0 then
	  			index = i
	  		  break;
	  	end
	  end
	  
	  if index ~= -1 then
	  		questid = x320048_var_QuestId[index]
				questname = x320048_var_QuestName[index]
				questNPC = x320048_var_QuestNPC[index]	
	  end
	
	
	return questid, questname, questNPC		
end


function x320048_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..questname)
		TalkAppendString(varMap,x320048_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x320048_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320048_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	        TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320048_var_FileId, questid)

end


function x320048_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..questname)
		TalkAppendString(varMap, x320048_var_QuestInfo)
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320048_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		local varHonour = x320048_PlayerHonour(varMap, varPlayer)		
		if varHonour > 0 then	
	       TalkAppendString(varMap,"#W战车荣誉:"..varHonour)		        	                	        	        
	    end 
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320048_var_FileId, varQuest,0);



end


function x320048_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )
	local questid, questname, questNPC ;--= x320048_VarQuest(varMap, varPlayer)
	questid = varQuest
 	local questname = ""
 	local targetCountry = -1
	for i = 1, 4 do
			if x320048_var_QuestId[i] == questid then
					questname = x320048_var_QuestName[i]
					targetCountry = i - 1
					break
			end
	end
	StartTalkTask(varMap)


		--任务信息
		TalkAppendString(varMap,"#Y"..questname)
		TalkAppendString(varMap,format("%s".."\n", x320048_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：#W".."\n"..x320048_var_QuestRuse.."\n")

		--提示信息
		if x320048_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x320048_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320048_YunBiaoExp(varMap, varPlayer)
		local varHonour = x320048_PlayerHonour(varMap, varPlayer)	
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..varHonour.."点")
		end		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320048_var_FileId, varQuest)
end


function x320048_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
GamePlayScriptLog(varMap, varPlayer, 2631)
   	local AddThirdExp = floor(x320048_YunBiaoExp(varMap, varPlayer) * 2)
 	local AddThirdHonour = floor(x320048_PlayerHonour(varMap, varPlayer) * 2)
 	local questid, questname, questNPC;--= x320048_VarQuest(varMap, varPlayer)
 	questid = varQuest
 	local questname = ""
 	local targetCountry = -1
	for i = 1, 4 do
			if x320048_var_QuestId[i] == questid then
					questname = x320048_var_QuestName[i]
					targetCountry = i - 1
					break
			end
	end
 	
    AddExp(varMap, varPlayer, x320048_YunBiaoExp(varMap, varPlayer))
	local varHonour = x320048_PlayerHonour(varMap, varPlayer)
	AddPlayerChariotHonour(varMap, varPlayer, varHonour)     
    local PlayerValue = x320048_GetMD( varMap, varPlayer, x320048_var_DateMD[targetCountry+1] )
    if PlayerValue <= 511 then
    	x320048_SetMD( varMap, varPlayer, x320048_var_DateMD[targetCountry+1], GetDayOfYear())
    end
    		x320048_SetMD( varMap, varPlayer, MD_HOUHUAYUAN_YUZITONGPAO_DAYCOUNT2, 1) 
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",questname));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x320048_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R战车荣誉"..x320048_PlayerHonour(varMap, varPlayer) .."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)    
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",questname),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x320048_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x320048_PlayerHonour(varMap, varPlayer) ),8,2)
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


function x320048_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, questid)
	local varExp = 	x320048_YunBiaoExp(varMap, varPlayer)
	local varHonour = x320048_PlayerHonour(varMap, varPlayer)
 	local questtarget = format("   找到@npc_%s", questNPC)
 	local questtarget1 = format(questtarget.."#Y\n奖励内容：\n#W经验值："..varExp.."点".."\n#W战车荣誉："..varHonour.."点")
 	local SubmitNPCGUID = x320048_GetNPCGUID(varMap, varPlayer)	
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,questid )
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								questname,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x320048_var_QuestInfo,			--任务描述
								x320048_var_QuestHelp								--任务小提示
								)
 
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, questid);
	end

end


function x320048_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local questid, questname, questNPC = x320048_VarQuest(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, questid)	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if x320048_GetNPCGUID(varMap, varPlayer) ~= varTalkNpcGUID then
		return
	end
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
		TalkAppendButton(varMap, questid, questname, 7, 1)
	else
		TalkAppendButton(varMap, questid, questname, 6, 1)
	end
end


function x320048_QuestNPC(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320048_var_QuestNPC[1]
	elseif nCountryIdx == 1 then
		return x320048_var_QuestNPC[2]
	elseif nCountryIdx == 2 then	
		return x320048_var_QuestNPC[3]
	elseif nCountryIdx == 3 then
		return x320048_var_QuestNPC[4]
	end

end


function x320048_GetNPCGUID(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320048_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		return x320048_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 2 then	
		return x320048_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 3 then
		return x320048_var_SubmitNPCGUID[4]
	end	

end

function x320048_PreVarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320048_var_PreQuestId[1], x320048_var_PreQuestId1[1], x320048_var_PreQuestId2[1]  
	elseif nCountryIdx == 1 then
		return x320048_var_PreQuestId[2], x320048_var_PreQuestId1[2] , x320048_var_PreQuestId2[2] 
	elseif nCountryIdx == 2 then	
		return x320048_var_PreQuestId[3], x320048_var_PreQuestId1[3] , x320048_var_PreQuestId2[3] 
	elseif nCountryIdx == 3 then
		return x320048_var_PreQuestId[4], x320048_var_PreQuestId1[4] , x320048_var_PreQuestId2[4] 
	end				

end


function x320048_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 70 then
		return
	end
	for i, j in x320048_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x320048_PlayerHonour(varMap, varPlayer)
	return x320048_var_GetPlayerHonour

end


function x320048_GetFinishQuestCountry(varMap, varPlayer)
	local countrymd1 = x320048_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI)
	local countrymd2 = x320048_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI2)
	local countrymd3 = x320048_GetMD( varMap, varPlayer, MD_HOUHUAYUAN_JINGTIANDONGDI3)
	local countryid1 = 0
	local countryid2 = 0
	local countryid3 = 0
	if  countrymd1 == GetDayOfYear() then
		countryid1 = LuaCallNoclosure(320040, "GetKillTarget", varMap, varPlayer)
	end
	if countrymd2 == GetDayOfYear() then
		countryid2 = LuaCallNoclosure(320042, "GetKillTarget", varMap, varPlayer)	
	end
	if countrymd3  == GetDayOfYear() then
		countryid3 = LuaCallNoclosure(320043, "GetKillTarget", varMap, varPlayer)
	end	
	return countryid1, countryid2, countryid3
end


function x320048_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320048_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
