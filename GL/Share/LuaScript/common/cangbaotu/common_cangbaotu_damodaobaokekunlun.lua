--DECLARE_QUEST_INFO_START--

x300334_var_FileId 					= 	300334                  
x300334_var_QuestId 				= 	8097                    

x300334_var_QuestKind 				= 	1                       
x300334_var_LevelLess					= 	0                      

x300334_var_QuestName				= 	"【个人】盗宝客"
x300334_var_QuestTarget				= 	"  击败@npc_%d(%d/1)"          
x300334_var_QuestInfo				= 	""            
x300334_var_ContinueInfo				= 	"\t怎么？你对付不了那些可恶的盗宝客么？看来我们要另外物色人选了。"  
x300334_var_QuestCompleted			= 	"\t真没想到啊！你这么快就解决了那里的麻烦。拿好，这就是我们事先约定好的报酬。\n\t等你收集齐了#Y四张藏宝图碎片#W之后就可以在我这里将这些神秘的碎片重新拼合成为一张完整的藏宝图。"  
x300334_var_QuestHelp				=	"#G据说这些盗宝客身上也带有类似的藏宝图，在清缴他们的过程中，你也很有可能会获得藏宝图的一部分。#W"          


x300334_var_ExtTarget					=	{ {type=20,n=10 ,target=""} }



x300334_var_ExpBonus					= 	0                    	
x300334_var_BonusItem					=	{}	

x300334_var_BonusMoney1               = 	0   
x300334_var_BonusMoney2               =   0   
x300334_var_BonusMoney3               =   0   
x300334_var_BonusMoney4               =   0   
x300334_var_BonusMoney5               =   0   
x300334_var_BonusMoney6               =   0   

x300334_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300334_MP_TARGET1					= 1         
x300334_MP_TARGET4					= 4         
x300334_MP_FINISH                   = 7         
x300334_MP_ISCOMPLETE				= 0	        


x300334_var_strAcceptQuest          = "您接受了任务：【个人】盗宝客"

x300334_var_strAbandonQuest         = "您放弃了任务：【个人】盗宝客"

x300334_var_strFinishQuest          = "您完成了任务：【个人】盗宝客"




x300334_var_PlayerMinLevel            = 40

x300334_var_PlayerMaxLevel            = 80

x300334_SubmitNPCGUID				= 130041	


x300334_ItemID_Table                ={
                                        {varIndex = 1, varItem = 12030109},
                                        {varIndex = 2, varItem = 12030110},
										{varIndex = 3, varItem = 12030111},
										{varIndex = 4, varItem = 12030112},
                                     }                                     



x300334_var_QuestTips               = "#G据说这些盗宝客身上也带有类似的藏宝图，在清缴他们的过程中，你也很有可能会获得藏宝图的一部分。#W"

x300334_var_QuestDescription        = "\t传说当年金国灭亡时，金国六王爷完颜洪烈将带不走的金银财宝都埋藏了起来。可具体地点因为长期的战乱和金国的灭亡而无人知晓了。\n\t 但最近传闻金王宝藏埋在太行山和泰山，一些盗宝客蜂拥而至，疯狂的挖掘，企图找到金王宝藏。金国乃是我大元所灭，宝藏理所当然应归我大元所有，所以我现在委派你前去消灭这些盗宝客！\n\t 当然，我相信那些盗宝客身上会有其他宝藏的藏宝图碎片，要是你消灭了这些盗宝客，那么那些藏宝图碎片就算是给你的酬劳吧！\n#G注：\n40级至49级玩家每天能接取2次本任务\n50级至59级玩家每天能接取5次本任务\n60级以上玩家每天能接取10次本任务。#W"

x300334_var_QuestBook               = "\t找到并消灭那些盗宝客，完成任务后，你将得到相应的回报。"

x300334_var_MonsterTable              = {
                                        { monsterId = 3250, posId = 173500, varName = "红云盗宝客", minLevel = 40, maxLevel = 45 }, 
                                        { monsterId = 3251, posId = 173501, varName = "大漠盗宝客", minLevel = 45, maxLevel = 50 }, 
                                        { monsterId = 3252, posId = 173502, varName = "独行盗宝客", minLevel = 50, maxLevel = 55 }, 
                                        { monsterId = 3253, posId = 173503, varName = "黑风盗宝客", minLevel = 55, maxLevel = 60 }, 
                                        { monsterId = 3254, posId = 173504, varName = "波斯盗宝客", minLevel = 60, maxLevel = 65 }, 
                                        { monsterId = 3255, posId = 173505, varName = "搬山盗宝客", minLevel = 65, maxLevel = 70 }, 
                                        { monsterId = 3256, posId = 173506, varName = "红头盗宝客", minLevel = 70, maxLevel = 75 }, 
                                        { monsterId = 3257, posId = 173507, varName = "铁履盗宝客", minLevel = 75, maxLevel = 80 }, 
                                        { monsterId = 3258, posId = 173508, varName = "金刚盗宝客", minLevel = 80, maxLevel = 161}, 
}


x300334_var_KillTargetCount           = 1
x300334_var_MaxTimes                  = 10
x300334_var_MaxTimes40                = 2  
x300334_var_MaxTimes50                = 5
x300334_var_strOverMaxTimes           = format( "每天只能接#R%d#cffcf00次这个任务", x300334_var_MaxTimes)
x300334_var_strOverMaxTimes40         = format( "每天只能接#R%d#cffcf00次这个任务", x300334_var_MaxTimes40)
x300334_var_strOverMaxTimes50         = format( "每天只能接#R%d#cffcf00次这个任务", x300334_var_MaxTimes50)




function x300334_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local varLevel = GetLevel( varMap, varPlayer)
	if( varLevel < x300334_var_PlayerMinLevel) then
		 return 1
	end

    local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300334_var_QuestId)
    if( varHaveQuest <= 0 and varLevel >= x300334_var_PlayerMinLevel) then
        local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300334_var_QuestId)
        TalkAppendButton( varMap, x300334_var_QuestId, x300334_var_QuestName, varState)
    end
end




function x300334_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varExtIdx)	
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300334_var_QuestId)
	if( varHaveQuest > 0) then
		local varDone = x300334_CheckSubmit(varMap, varPlayer, varTalknpc)
		if( varDone > 0) then
			if varExtIdx ~= -1 then
				x300334_DispatchCompletedInfo( varMap, varPlayer, varTalknpc ) 
			end
		else
			if varExtIdx ~= -1 then
				x300334_DispatchContinueInfo( varMap, varPlayer, varTalknpc ) 
			end
		end
	else
		x300334_DeliverTalkInfo( varMap, varPlayer, varTalknpc )	
	end
end




function x300334_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300334_var_QuestId);
	if(varHaveQuest > 0) then
		return 0;
	else
		return 1;
	end
end



    
        
            
        
            
        
    
        
            
        
            
        
    





function x300334_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuestNM(varMap, varPlayer, x300334_var_QuestId) > 0 then
    else
        
        
            
            
        
        local varToday = GetDayOfYear()
        
        if x300334_GetDate( varMap, varPlayer) == varToday then
        		local level = GetLevel(varMap, varPlayer)
        		if level >= 40 and level <= 49 then
						  if x300334_GetTimes( varMap, varPlayer) >= x300334_var_MaxTimes40 then
              	Msg2Player( varMap, varPlayer, x300334_var_strOverMaxTimes40, 8, 3)
              	Msg2Player( varMap, varPlayer, x300334_var_strOverMaxTimes40, 8, 2)
              	return
          		end        		
        		elseif level >= 50 and level <= 59 then
						  if x300334_GetTimes( varMap, varPlayer) >= x300334_var_MaxTimes50 then
              	Msg2Player( varMap, varPlayer, x300334_var_strOverMaxTimes50, 8, 3)
              	Msg2Player( varMap, varPlayer, x300334_var_strOverMaxTimes50, 8, 2)
              	return
          		end         		
        		else
						  if x300334_GetTimes( varMap, varPlayer) >= x300334_var_MaxTimes then
              	Msg2Player( varMap, varPlayer, x300334_var_strOverMaxTimes, 8, 3)
              	Msg2Player( varMap, varPlayer, x300334_var_strOverMaxTimes, 8, 2)
              	return
          		end         		
        		end

        else
            
            x300334_SetTimes( varMap, varPlayer, 0)
            x300334_SetDate( varMap, varPlayer, varToday)
        end

    	local varRet	= AddQuest( varMap, varPlayer, x300334_var_QuestId, x300334_var_FileId, 1, 0, 0, 1)
    	if( varRet == 0) then
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, "任务已满，任务接受失败！" )
    		StopTalkTask( varMap)
    		DeliverTalkTips( varMap, varPlayer)
    		return 0;
    	end

        
    	local varLevel = GetLevel( varMap, varPlayer)
        local monsterId = 0
        local varName = "盗宝客"
        for varI, item in x300334_var_MonsterTable do
            if varLevel >= item.minLevel and varLevel < item.maxLevel then
                monsterId = item.monsterId
                varName = item.varName
                break
            end
        end

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300334_var_QuestId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET1, monsterId)
    	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4, 0)
        
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300334_MP_ISCOMPLETE, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300334_MP_FINISH, 0)

        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300334_var_QuestName)
            TalkAppendString( varMap, "#r" )
            TalkAppendString( varMap, "#Y任务目标:" )
    		TalkAppendString( varMap, format( "消灭3名%s。", varName) )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)

        
        StartTalkTask( varMap)
        TalkAppendString( varMap, x300334_var_strAcceptQuest)
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        
        Msg2Player( varMap, varPlayer, x300334_var_strAcceptQuest, 8, 2)

    	x300334_QuestLogRefresh( varMap, varPlayer, x300334_var_QuestId )

        
        x300334_ShowQuestInfo( varMap, varPlayer, varTalknpc)

        
        GamePlayScriptLog( varMap, varPlayer, 731)
	end
end




function x300334_ProcQuestAbandon( varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300334_var_QuestId);
	if varHaveQuest > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300334_var_QuestId); 
		DelQuest(varMap, varPlayer, x300334_var_QuestId);

        StartTalkTask( varMap)
        TalkAppendString( varMap, x300334_var_strAbandonQuest)
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, x300334_var_strAbandonQuest, 8, 2)

        
        
        
        
        x300334_SetTimes( varMap, varPlayer, x300334_GetTimes( varMap, varPlayer) + 1)
	end
end




function x300334_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300334_var_QuestId);
	return GetQuestParam(varMap, varPlayer, varQuestIdx, x300334_MP_ISCOMPLETE);
end




function x300334_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick )
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300334_var_QuestId)
	
	
	
    
		
  		
        
        
        
        
	

	
	if x300334_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300334_var_BonusMoney1 )
	    Msg2Player(varMap,varPlayer,format("获得#R银卡#{_MONEY%d}#W的奖励。", x300334_var_BonusMoney1),4,2)
	end

	
	if x300334_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300334_var_BonusMoney2 )
	    Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x300334_var_BonusMoney2),4,2)
	end

	
	if x300334_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300334_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x300334_var_BonusMoney3),4,2)
	end

	
	if x300334_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x300334_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x300334_var_BonusMoney4),4,2)
	end

	
	if x300334_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x300334_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x300334_var_BonusMoney5),4,2)
	end

	
	if x300334_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x300334_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x300334_var_BonusMoney6),4,2)
	end

 	
		for varI, item in x300334_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300334_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			
			return
		end
    end
end




function x300334_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	local a = 0
	for k,v in x300334_ItemID_Table do
		if v.varItem==varRadioSelected then 
			a = 1
			break
		end
	end
	if a ==0 then return end
	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x300334_var_QuestId);
	if varHaveQuest > 0 then
		local varToday = GetDayOfYear()
        
        if x300334_GetDate( varMap, varPlayer) == varToday then
						local level = GetLevel(varMap, varPlayer)
        		if level >= 40 and level <= 49 then
	            if x300334_GetTimes( varMap, varPlayer) >= x300334_var_MaxTimes40 then
	                return
	            end       		
        		elseif level >= 50 and level <= 59 then
	            if x300334_GetTimes( varMap, varPlayer) >= x300334_var_MaxTimes50 then
	                return
	            end       		
        		else
	            if x300334_GetTimes( varMap, varPlayer) >= x300334_var_MaxTimes then
	                return
	            end       		
        		end
        end

        
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300334_var_QuestId)
		local completed = GetQuestParam(varMap, varPlayer, varQuestIdx, x300334_MP_ISCOMPLETE)

		if completed == 1 then
            StartItemTask( varMap)
            if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                ItemAppend( varMap, varRadioSelected, 5)
            else
                ItemAppendBind( varMap, varRadioSelected, 5)
            end
            local varRet = StopItemTask( varMap, varPlayer)
            if varRet > 0 then
                DelQuest( varMap, varPlayer, x300334_var_QuestId)

                local varToday = GetDayOfYear()
                if x300334_GetDate( varMap, varPlayer) == varToday then
                    
                    x300334_SetTimes( varMap, varPlayer, x300334_GetTimes( varMap, varPlayer) + 1)
                else
                    
                    x300334_SetDate( varMap, varPlayer, varToday)
                    
                    x300334_SetTimes( varMap, varPlayer, 1)
                end
                
                

                StartTalkTask( varMap)
                TalkAppendString( varMap, x300334_var_strFinishQuest)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
                Msg2Player( varMap, varPlayer, x300334_var_strFinishQuest, 8, 2)

		    	x300334_GetBonus( varMap, varPlayer, varTalknpc, varRadioSelected)
				
			

                DeliverItemListSendToPlayer( varMap, varPlayer)
                local varStr = format( "你获得了@item_%d", varRadioSelected)
                StartTalkTask( varMap)
                TalkAppendString( varMap, varStr)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
            else
                StartTalkTask( varMap)
                TalkAppendString( varMap, "背包已满，无法得到物品！" )
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
            end
            
            GamePlayScriptLog( varMap, varPlayer, 732)
		else
			StartTalkTask( varMap )
				TalkAppendString( varMap,"任务没有完成！")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer);
		end
	else
		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);
		return
	end
end




function x300334_CheckPlayerBagFull( varMap ,varPlayer)
	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x300334_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

    
	for j, item in x300334_var_BonusChoiceItem do
		ItemAppend( varMap, item.item, item.n )
    end
		
	local varRet = StopItemTask(varMap,varPlayer)
	if(varRet > 0) then
		result = 1;
	else
		result = 0;
	end

	return result
end


function x300334_ShowQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
        
		TalkAppendString( varMap, "#Y"..x300334_var_QuestName)
		TalkAppendString( varMap, x300334_var_QuestBook)
		TalkAppendString( varMap, " " )

		
		TalkAppendString( varMap, "#Y任务目标：")
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300334_var_QuestId)
        local Pos1 = 0
        local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET1)
        local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4)

        for varI, item in x300334_var_MonsterTable do
            if item.monsterId == mon1 then
                Pos1 = item.posId
                break
            end
        end
        TalkAppendString( varMap, format( x300334_var_QuestTarget, Pos1, m1Kill) )
		TalkAppendString( varMap, " " )

		
		if x300334_var_QuestTips ~= "" then
			TalkAppendString( varMap, "#Y任务提示：" )
			TalkAppendString( varMap, x300334_var_QuestTips)
			TalkAppendString( varMap, " ")
		end
	StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end




function x300334_DeliverTalkInfo( varMap, varPlayer, varTalknpc)
	local varLevel = GetLevel( varMap, varPlayer)
	
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300334_var_QuestName)
		TalkAppendString( varMap, x300334_var_QuestDescription)

               
		

		
		
		
		
		
			
		
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 1].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 2].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 3].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 4].varItem, 5)

		
		if x300334_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1( varMap, x300334_var_BonusMoney1 )
		end

		
		if x300334_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2( varMap, x300334_var_BonusMoney2 )
		end
		
		if x300334_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3( varMap, x300334_var_BonusMoney3 )
		end

		
		if x300334_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4( varMap, x300334_var_BonusMoney4 )
		end

		
		if x300334_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5( varMap, x300334_var_BonusMoney5 )
		end

		
		if x300334_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6( varMap, x300334_var_BonusMoney6 )
		end

		
		for varI, item in x300334_var_BonusItem do
		   	AddQuestItemBonus( varMap, item.item, item.n)
	    end

		
		for varI, item in x300334_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus( varMap, item.item, item.n)
	    end
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300334_var_FileId, x300334_var_QuestId)
end




function x300334_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300334_var_QuestId)
    local Pos1 = 0
    local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET1)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4)

    for varI, item in x300334_var_MonsterTable do
        if item.monsterId == mon1 then
            Pos1 = item.posId
            break
        end
    end

	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300334_var_QuestName)
		TalkAppendString( varMap, format( x300334_var_ContinueInfo, Pos1) )
		TalkAppendString( varMap, " ")

		
		TalkAppendString( varMap,"#Y完成情况：")

        TalkAppendString( varMap, format( x300334_var_QuestTarget, Pos1, m1Kill) )

  		

		
		
		
		
			
		

		
		if x300334_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x300334_var_BonusMoney1 )
		end

		
		if x300334_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x300334_var_BonusMoney2 )
		end
		
		if x300334_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x300334_var_BonusMoney3 )
		end

		
		if x300334_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x300334_var_BonusMoney4 )
		end

		
		if x300334_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x300334_var_BonusMoney5 )
		end

		
		if x300334_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300334_var_BonusMoney6 )
		end


		
		for varI, item in x300334_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300334_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end

	    
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300334_var_FileId, x300334_var_QuestId)
end




function x300334_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x300334_var_QuestName)
		TalkAppendString(varMap,x300334_var_QuestCompleted)
		TalkAppendString(varMap," ")

  		

		
		
			
		
		
		
		
			
		

		
		if x300334_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x300334_var_BonusMoney1 )
		end

		
		if x300334_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x300334_var_BonusMoney2 )
		end
		
		if x300334_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x300334_var_BonusMoney3 )
		end

		
		if x300334_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x300334_var_BonusMoney4 )
		end

		
		if x300334_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x300334_var_BonusMoney5 )
		end

		
		if x300334_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300334_var_BonusMoney6 )
		end


		
		for varI, item in x300334_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300334_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 1].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 2].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 3].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 4].varItem, 5)
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300334_var_FileId, x300334_var_QuestId);
end




function x300334_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
    if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
    end

    local varQuestIdx = 0
    local varTeamSize = GetNearTeamCount( varMap, varPlayer)
    

    if varTeamSize <= 1 then 
        if IsHaveQuest( varMap, varPlayer, x300334_var_QuestId) <= 0 then
            return
        end
        varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300334_var_QuestId)
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
            
            return
        end
        local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET1)
        local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4)

        if varObjData == mon1 and m1Kill < x300334_var_KillTargetCount then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4, m1Kill + 1)
        else
            
            return
        end

        x300334_QuestLogRefresh( varMap, varPlayer, x300334_var_QuestId)

        
        local randnum = random( 1, 100)
        local varItem = 0
        if randnum >= 1 and randnum < 26 then
            varItem = x300334_ItemID_Table[ 1].varItem
        elseif randnum >= 26 and randnum < 51 then
            varItem = x300334_ItemID_Table[ 2].varItem
        elseif randnum >= 51 and randnum < 76 then
            varItem = x300334_ItemID_Table[ 3].varItem
        elseif randnum >= 76 and randnum < 101 then
            varItem = x300334_ItemID_Table[ 4].varItem
        else
            varItem = 0
        end

        if( varItem > 0) then
            StartItemTask(varMap)
            if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                ItemAppend( varMap, varItem, 1)
            else
                ItemAppendBind( varMap, varItem, 1)
            end
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet > 0 then
                DeliverItemListSendToPlayer(varMap,varPlayer)
                local varStr = format( "你获得了@item_%d", varItem)
                StartTalkTask( varMap)
                TalkAppendString( varMap, varStr)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
            else
                StartTalkTask(varMap)
                TalkAppendString(varMap,"物品栏已满，无法得到物品！")
                StopTalkTask(varMap)
                DeliverTalkTips(varMap,varPlayer)
            end
        end

    	
        m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4)
    	if m1Kill >= x300334_var_KillTargetCount then
    		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
    		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    	end
    else
        for varI = 0, varTeamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varPlayer, varI)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x300334_var_QuestId) > 0 then 
                    varQuestIdx = GetQuestIndexByID( varMap, memberId, x300334_var_QuestId)
                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then 
                        local mon1   = GetQuestParam( varMap, memberId, varQuestIdx, x300334_MP_TARGET1)
                        local m1Kill = GetQuestParam( varMap, memberId, varQuestIdx, x300334_MP_TARGET4)

                        local questMonster = 1
                        if varObjData == mon1 and m1Kill < x300334_var_KillTargetCount then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, x300334_MP_TARGET4, m1Kill + 1)
                        else
                            questMonster = 0
                        end

                        if questMonster == 1 then
                            x300334_QuestLogRefresh( varMap, memberId, x300334_var_QuestId)

                            
                            local randnum = random( 1, 100)
                            local varItem = 0
                            if randnum >= 1 and randnum < 26 then
                                varItem = x300334_ItemID_Table[ 1].varItem
                            elseif randnum >= 26 and randnum < 51 then
                                varItem = x300334_ItemID_Table[ 2].varItem
                            elseif randnum >= 51 and randnum < 76 then
                                varItem = x300334_ItemID_Table[ 3].varItem
                            elseif randnum >= 76 and randnum < 101 then
                                varItem = x300334_ItemID_Table[ 4].varItem
                            else
                                varItem = 0
                            end

                            if( varItem > 0) then
                                StartItemTask( varMap)
                                if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                                    ItemAppend( varMap, varItem, 1)
                                else
                                    ItemAppendBind( varMap, varItem, 1)
                                end
                                local varRet = StopItemTask( varMap, memberId)
                                if varRet > 0 then
                                    DeliverItemListSendToPlayer( varMap, memberId)
                                    local varStr = format( "你获得了@item_%d", varItem)
                                    StartTalkTask( varMap)
                                    TalkAppendString( varMap, varStr)
                                    StopTalkTask( varMap)
                                    DeliverTalkTips( varMap, memberId)
                                else
                                    StartTalkTask( varMap)
                                    TalkAppendString( varMap, "物品栏已满，无法得到物品！" )
                                    StopTalkTask( varMap)
                                    DeliverTalkTips( varMap, memberId)
                                end
                            end

                            
                            m1Kill = GetQuestParam( varMap, memberId, varQuestIdx, x300334_MP_TARGET4)
                            if m1Kill >= x300334_var_KillTargetCount then
                                SetQuestByIndex( varMap, memberId, varQuestIdx, 0, 1)
                                SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
                            end
                        end
                    end
                end
            end
        end
    end
end




function x300334_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x300334_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	if varTalkNpcGUID == x300334_SubmitNPCGUID then
		local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300334_var_QuestId);
		if(varHaveQuest > 0) then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300334_var_QuestId)
			TalkAppendButton(varMap, x300334_var_QuestId, x300334_var_QuestName,varState,32);
		end
	end
end




function x300334_QuestLogRefresh( varMap, varPlayer, varQuest)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local times = x300334_GetTimes( varMap, varPlayer)+1
    local Pos1 = 0
    local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET1)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x300334_MP_TARGET4)
    
    for varI, item in x300334_var_MonsterTable do
        if item.monsterId == mon1 then
            Pos1 = item.posId
            break
        end
    end


	local maxTimes = x300334_var_MaxTimes
	local level = GetLevel(varMap, varPlayer)
	if level >= 40 and level <= 49 then
		maxTimes = x300334_var_MaxTimes40
	elseif level >= 50 and level <= 59 then
		maxTimes = x300334_var_MaxTimes50				
	end
	
	
	StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                "【个人】盗宝客（"..times.."/"..maxTimes.."）",             
                                format( x300334_var_QuestTarget, Pos1, m1Kill),
                                "",                             
                                x300334_var_QuestBook,
                                x300334_var_QuestDescription,
                                x300334_var_QuestTips
                                )

        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 1].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 2].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 3].varItem, 5)
        AddQuestRadioItemBonus( varMap, x300334_ItemID_Table[ 4].varItem, 5)
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x300334_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    x300334_QuestLogRefresh( varMap, varPlayer, varQuest)
end




function x300334_ProcForceAddQuest( varMap, varPlayer, varTalknpc, varQuest)
end


function x300334_GetTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DAOBAOKE_TIMES[ 1], MD_DAOBAOKE_TIMES[ 2], MD_DAOBAOKE_TIMES[ 3] )
end


function x300334_SetTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DAOBAOKE_TIMES[ 1], MD_DAOBAOKE_TIMES[ 2], MD_DAOBAOKE_TIMES[ 3], value)
end


function x300334_GetDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DAOBAOKE_DATE[ 1], MD_DAOBAOKE_DATE[ 2], MD_DAOBAOKE_DATE[ 3] )
end


function x300334_SetDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DAOBAOKE_DATE[ 1], MD_DAOBAOKE_DATE[ 2], MD_DAOBAOKE_DATE[ 3], value)
end
