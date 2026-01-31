

--DECLARE_QUEST_INFO_START--
x310322_var_FileId = 310322

x310322_var_QuestId = 9050 

x310322_var_QuestName="【个人】疯狂的宝箱"
x310322_var_QuestTarget				= "打开5个天上人间·麒麟内的#G宝箱#W"      
x310322_var_QuestInfo				= "\t欢迎你，我亲爱的朋友。\n\t在这天上人间·麒麟中，常常会出现镶满宝石的黄金宝箱。据说每个宝箱里都藏着#G大量经验和稀有的宝贝#W，也有一些宝箱中封印着#G可怕的魔君#W。\n\t每天你可以在我这里接取5次任务，其中第一次免费领取，后4次每次接取需#Y花费3两现金或金卡#W。\n\t宝箱出现的时间是每周六、日的：\n#G12：35—12：50#W，#G13：35—13：50#W，\n#G14：35—14：50#W，#G15：35—15：50#W，\n#G16：35—16：50#W，#G17：35—17：50#W，\n#G18：35—18：50#W，#G19：35—19：50#W，\n#G20：35—20：50#W，#G21：35—21：50#W，\n#G22：35—22：50#W"            
x310322_var_ContinueInfo				= "\t打开宝箱之前，谁也不知道里面藏着的是什么。"
x310322_var_QuestCompleted			= "\t恭喜你完成了【个人】疯狂的宝箱任务，在开启黄金宝箱那一刻，你是不是充满了期待？"  
x310322_var_QuestHelp				= ""          

x300320_var_strQuestAbandon         = "您放弃了任务：【个人】疯狂的宝箱"


--DECLARE_QUEST_INFO_STOP--


x310322_var_MinLevel	= 65
x310322_var_MaxLevel	= 84
x310322_var_strGongLue = "#G宝箱#W会在特定时间出现在天上人间·麒麟内#G暴龙任务区#W、#G海盗船区#W、#G旋转木马区#W、#G摩天轮区#W等地方。"




x310322_var_CostGold	= 3000 





function x310322_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsHaveQuest(varMap,varPlayer, x310322_var_QuestId) <= 0 then
		if GetLevel( varMap, varPlayer) < x310322_var_MinLevel then 
	 		return 0
		end
	end	
	
	local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310322_var_QuestId)
	TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310322_var_QuestId, varState, 0 )

 	TalkAppendButton(varMap,x310322_var_QuestId,"【疯狂的宝箱说明】" ,13,1)
	
	

end
function x310322_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
	
end

function x310322_GetCount(varMap ,varPlayer, varTalknpc)
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*60+minute
	
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_XIANGZI_DATE[1], MD_XIANGZI_DATE[2], MD_XIANGZI_DATE[3])
	if varToday ~= varLastday then
		return 0
	end
	
	local varCount = GetPlayerGameData(varMap, varPlayer, MD_XIANGZI_COUNT[1], MD_XIANGZI_COUNT[2], MD_XIANGZI_COUNT[3])
	
	return varCount
end

function x310322_CheckTime(varMap ,varPlayer, varTalknpc)
	local hour,minute,sec =GetHourMinSec();
	if hour >= 12 and hour <= 23 then
		return 1
	end
	return 0
end
function x310322_IncCountMD(varMap ,varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_XIANGZI_DATE[1], MD_XIANGZI_DATE[2], MD_XIANGZI_DATE[3])
	if varToday == varLastday then
		local varCount = GetPlayerGameData(varMap, varPlayer, MD_XIANGZI_COUNT[1], MD_XIANGZI_COUNT[2], MD_XIANGZI_COUNT[3])
		varCount = varCount + 1
		SetPlayerGameData(varMap,varPlayer,MD_XIANGZI_COUNT[1],MD_XIANGZI_COUNT[2],MD_XIANGZI_COUNT[3], varCount)
		return varCount
	else
		SetPlayerGameData(varMap,varPlayer,MD_XIANGZI_DATE[1],MD_XIANGZI_DATE[2],MD_XIANGZI_DATE[3], varToday)
       	SetPlayerGameData(varMap,varPlayer,MD_XIANGZI_COUNT[1],MD_XIANGZI_COUNT[2],MD_XIANGZI_COUNT[3], 1)    
       	return 1
    end  
end

function x310322_DecCountMD(varMap ,varPlayer)
	local varCount = GetPlayerGameData(varMap, varPlayer, MD_XIANGZI_COUNT[1], MD_XIANGZI_COUNT[2], MD_XIANGZI_COUNT[3])
	varCount = varCount - 1
	if varCount <= 0 then
		varCount = 0
	end
	SetPlayerGameData(varMap,varPlayer,MD_XIANGZI_COUNT[1],MD_XIANGZI_COUNT[2],MD_XIANGZI_COUNT[3], varCount)
	return varCount
end





function x310322_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310322_var_QuestId)

    if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        return 1
    else
        return 0
    end
end


function x310322_ProcEventEntry(varMap ,varPlayer, varTalknpc,idScript,idExt )	
	
	if idExt == 0 then
		if IsQuestHaveDone(varMap, varPlayer, x310322_var_QuestId) > 0 then
			StartTalkTask(varMap)
        	TalkAppendString(varMap,"你已完成此任务")
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		
		if IsHaveQuest(varMap,varPlayer, x310322_var_QuestId) > 0 then
			local varDone = x310322_CheckSubmit( varMap, varPlayer, varTalknpc)
            if varDone > 0 then
                x310322_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            else
                x310322_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
            end
            
            




			return
		end
		
		
		
		
		StartTalkTask(varMap)
		local varLevel =GetLevel( varMap, varPlayer)
		local varExp =  varLevel *64800
		TalkAppendString(varMap,"#Y"..x310322_var_QuestName)
        TalkAppendString(varMap,x310322_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标:")
        TalkAppendString( varMap,x310322_var_QuestTarget)        
        AddQuestExpBonus(varMap, varExp )
        StopTalkTask(varMap)
        
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310322_var_FileId, x310322_var_QuestId)
        

	elseif idExt == 1 then
		StartTalkTask(varMap)
				local Readme_1 = "#Y【疯狂的宝箱说明】#r#W"
				TalkAppendString(varMap,"#Y接取任务：\n\t#W65级以上的玩家，每周六、日12：30-22：50可以接取任务。\n\t每个玩家每天最多可以接取五次任务。第一次接取任务免费，其后的四次均要花费#R3两现金/金卡#W。")
        TalkAppendString(varMap,"#Y玩法过程：\n\t#W接取任务后，你需要在#G特定时间#W内,找到散落在天上人间·麒麟各处的#G宝箱#W。\n\t采集宝箱后有可能会获得以下几种奖励：\n\t1.完成任务获得超大量经验。\n\t2.获得道具天上人间·麒麟藏宝图碎片（凑齐后可找彩湘子合成天上人间·麒麟藏宝图）。\n\t3.获得道具魔君部将召唤符。\n\t4.原地释放出一个十八魔君。\n \n#Y宝箱出现的时间:#W\n#G12：35—12：50#W，#G13：35—13：50#W，\n#G14：35—14：50#W，#G15：35—15：50#W，\n#G16：35—16：50#W，#G17：35—17：50#W，\n#G18：35—18：50#W，#G19：35—19：50#W，\n#G20：35—20：50#W，#G21：35—21：50#W，\n#G22：35—22：50#W。")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    elseif idExt == 2 then
    	
	end
	

end





function x310322_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310322_var_QuestName)
    TalkAppendString( varMap, x310322_var_ContinueInfo)
    TalkAppendString( varMap, " ")
 
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	
end




function x310322_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310322_var_QuestName)
    TalkAppendString( varMap, x310322_var_QuestCompleted)
    TalkAppendString( varMap, " ")
    local varLevel = GetLevel( varMap, varPlayer)
    
	StopTalkTask( varMap)
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310322_var_FileId, x310322_var_QuestId)
end

function x310322DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x310322_var_QuestName)
    TalkAppendString( varMap, x310322_var_QuestInfo)
    TalkAppendString( varMap, " ")
           
    
    TalkAppendString( varMap, "#Y任务目标：")
    TalkAppendString( varMap, x310322_var_QuestTarget)
    TalkAppendString( varMap, " ")

    
    if x310322_var_QuestHelp ~= "" then
        TalkAppendString( varMap, "#Y任务提示：")
        TalkAppendString( varMap, x310322_var_QuestHelp)
        TalkAppendString( varMap, " ")
    end                 

	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310322_var_FileId, x310322_var_QuestId)
end

function x310322_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	StartTalkTask( varMap)
	local varLevel =GetLevel( varMap, varPlayer)
	local varExp =  varLevel *64800
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310322_var_QuestId)
	local varNum = GetQuestParam( varMap,varPlayer,varQuestIdx,1)
	local strTarget = " 开启天上人间·麒麟内的#G宝箱#W："..varNum.."/".."#W"..5
	AddQuestLogCustomText( varMap,
                                   x310322_var_QuestName,               
                                   x310322_var_QuestName,               
                                   strTarget,                   				 
                                   "",              
                                   x310322_var_strGongLue,               
                                   x310322_var_QuestInfo,    
                                   x310322_var_QuestHelp) 
                                                
                                                
    AddQuestExpBonus( varMap, varExp)                                            
    StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, x310322_var_QuestId)
end


function x310322_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end



function x310322_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	
	local varCount = GetPlayerGameData(varMap,varPlayer,MD_XIANGZI_COUNT[1],MD_XIANGZI_COUNT[2],MD_XIANGZI_COUNT[3])    
		

	if IsQuestHaveDone(varMap, varPlayer, x310322_var_QuestId) > 0 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"你已经有此任务")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        return 
    end
    
    local varLevel = GetLevel(varMap, varPlayer)
  if IsNewServer()== 1 then
 	 if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) > 85 then
 	 	if GetLevel( varMap, varPlayer) > x310322_var_MaxLevel then
 	 		Msg2Player(varMap, varPlayer, "等级过高，无法接取本任务", 0, 2)
   		Msg2Player(varMap, varPlayer, "等级过高，无法接取本任务", 0, 3)   
			return
		end
 	 end
	elseif  IsNewServer()~=1 then
	 if GetLevel( varMap, varPlayer) > x310322_var_MaxLevel then
    	Msg2Player(varMap, varPlayer, "只有低于85级的玩家才能接受本任务", 0, 2)
   		Msg2Player(varMap, varPlayer, "只有低于85级的玩家才能接受本任务", 0, 3)   
   		return 
   end
	end
		
		
    if IsQuestFullNM(varMap,varPlayer)==1 then
 		Msg2Player(varMap, varPlayer, "任务已满，添加任务失败", 0, 2)
   		Msg2Player(varMap, varPlayer, "任务已满，添加任务失败", 0, 3)          
        return 
    end
	local varLevel = GetLevel(varMap, varPlayer)
		if GetLevel( varMap, varPlayer) < x310322_var_MinLevel  then
			StartTalkTask(varMap)
        	TalkAppendString(varMap,"只有不低于65级的玩家才能接受任务")
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		
		local weekDay = GetWeek()
		if weekDay ~= 0 and weekDay ~= 6 then
		StartTalkTask(varMap)
        	TalkAppendString(varMap,"\t很抱歉，本活动尚未开放，请于周六、日12：30以后再来领取")
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)       	       	
        Msg2Player(varMap, varPlayer, "很抱歉，本活动尚未开放，请于周六、日12：30以后再来领取", 0, 2)
   			Msg2Player(varMap, varPlayer, "很抱歉，本活动尚未开放，请于周六、日12：30以后再来领取", 0, 3)   
			return 
		end
		if x310322_CheckTime(varMap ,varPlayer, varTalknpc) < 1 then       	
       Msg2Player(varMap, varPlayer, "很抱歉，本活动开放时间为12：30-22：50", 0, 2)
   		 Msg2Player(varMap, varPlayer, "很抱歉，本活动开放时间为12：30-22：50", 0, 3) 
			return 
		end
		
		local varCount = x310322_GetCount(varMap ,varPlayer, varTalknpc)
		if varCount >= 5 then
       Msg2Player(varMap, varPlayer, "你今天已完成5次【个人】疯狂的宝箱，请改天再来", 0, 2)
   		 Msg2Player(varMap, varPlayer, "你今天已完成5次【个人】疯狂的宝箱，请改天再来", 0, 3)         	      	
			return
		end
		
		
		
   if varCount >= 1 then  
      		if GetGoldMode( varMap, varPlayer) == 1 then
	   		if CostMoney(varMap,varPlayer,2,x310322_var_CostGold,324) ~= -1 then
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 3)
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 2)
					Msg2Player(varMap, varPlayer, "扣除3两金币！", 0, 2)
				else
					if CostMoney(varMap,varPlayer,3,x310322_var_CostGold) ~= -1 then
						Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 3)
						Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 2)
						Msg2Player(varMap, varPlayer, "扣除3两金币！", 0, 2)
					else
						StartTalkTask(varMap)
			    	Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 3)
						Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 2)
			    		return
					end
				end
			else

					if CostMoney(varMap,varPlayer,3,x310322_var_CostGold) ~= -1 then
						Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 3)
						Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 2)

					else
							if CostMoney(varMap,varPlayer,2,x310322_var_CostGold,318) ~= -1 then
				Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 3)
				Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 2)
			else
	    	Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 3)
				Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 2)

					    		return
							end
					end
			end
	end
   local retmiss = AddQuest( varMap, varPlayer, x310322_var_QuestId, x310322_var_FileId, 0, 0, 0, 1)
   if retmiss ==0 then
       Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
       return 0
   end
   	x310322_IncCountMD(varMap ,varPlayer)     	
   	x310322_ProcQuestLogRefresh( varMap, varPlayer, x310322_var_QuestId)	
    
   	
   	
   	
   	GamePlayScriptLog(varMap, varPlayer, 1641)
	
end

function x310322_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x310322_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x310322_var_QuestId)
    Msg2Player(varMap, varPlayer, format("您放弃了任务:%s",x310322_var_QuestName), 0, 2)
    Msg2Player(varMap, varPlayer, format("您放弃了任务:%s",x310322_var_QuestName), 0, 3) 
   	
    
end


function x310322_GiveBonus(varMap, varPlayer, varTalknpc)
end

function x310322_GiveExp( varMap, varPlayer)
	local rate = random(1,100)
	if rate == 100 then
		local varLevel = GetLevel(varMap,varPlayer)
		local bonusExp = 64800 * varLevel * 3
		AddExp(varMap,varPlayer,bonusExp)
		local varName = GetName(varMap,varPlayer)
		if varName == nil then
			varName = "ErrorName"
		end

		Msg2Player( varMap, varPlayer, "您非常幸运的获得3倍经验奖励"..bonusExp.."点。", 8, 2)
		return 1
	elseif rate >= 75 then
		local varLevel = GetLevel(varMap,varPlayer)
		local bonusExp = 64800 * varLevel * 1.5
		AddExp(varMap,varPlayer,bonusExp)
		Msg2Player( varMap, varPlayer, "您幸运的获得1.5倍经验奖励"..bonusExp.."点。", 8, 2)
		return 1
	else
		local varLevel = GetLevel(varMap,varPlayer)
		local bonusExp = 64800 * varLevel
		AddExp(varMap,varPlayer,bonusExp)
		Msg2Player( varMap, varPlayer, "您获得经验奖励"..bonusExp.."点。", 8, 2)
		return 1
	end
	return 0
end
function x310322_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x310322_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x310322_var_QuestId) > 0 then
		x310322_GiveExp( varMap, varPlayer)
    Msg2Player(varMap, varPlayer, format("您完成了任务:%s",x310322_var_QuestName), 0, 2)
    Msg2Player(varMap, varPlayer, format("您完成了任务:%s",x310322_var_QuestName), 0, 3) 
    	
    GamePlayScriptLog( varMap, varPlayer, 1642)   
	
       
   end
   
end

 
