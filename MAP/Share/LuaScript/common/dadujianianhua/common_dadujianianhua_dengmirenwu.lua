

--DECLARE_QUEST_INFO_START--
x310164_var_FileId = 310164

x310164_var_QuestId = 9315

x310164_var_QuestIdNext = -1
x310164_var_Name	={}
x310164_var_ExtTarget={{type=20,n=1,target="找到@npc_141540，回答她的问题。"},{type=20,n=1,target="找到@npc_141541，回答她的问题。"},{type=20,n=1,target="找到@npc_141542，回答她的问题。"},{type=20,n=1,target="找到@npc_141543，回答她的问题。"}}
x310164_var_QuestName="【智】大都灯谜会"
x310164_var_QuestInfo="\t当下正值大都灯谜会重开之时，各位若有兴趣，都可参加。\n\t前往大都城南的天坛找到“梅、兰、竹、菊”4位灯谜仕女，并回答出她们的问题，可以在我这里领取奖励。\n#Y特别提示：#W只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。"  
x310164_var_QuestTarget={{type=20,n=1,target="去到灯谜侍女#G梅#W，回答她的问题。"},{type=20,n=1,target="去找灯谜侍女#G兰#W，回答她的问题。"},{type=20,n=1,target="去找灯谜侍女#G竹#W，回答她的问题。"},{type=20,n=1,target="去找灯谜侍女#G菊#W，回答她的问题。"}}		
x310164_var_QuestCompleted="\t恭喜你猜完了所有的灯谜。\n\t灯谜会每天都可以参加，并且，每天都有着不同的谜题等待着你来解开。"					
x310164_var_ContinueInfo="\t答出#G梅#W、#G兰#W、#G竹#W、#G菊#W4位灯谜侍女的问题了吗？"
x310164_var_QuestHelp =	"每当你猜对一道灯谜，你会获得5点积分，若猜错，也会获得1点积分。当你答完四位仕女的灯谜之后，我会根据你获得的积分给予你丰厚的奖励。"

x310164_var_BonusItemId	=	11990117    
x310164_var_LevelLess = 40
x310164_var_NpcGUID ={{ guid = 139133, varName = "蔡德楚"} }
--DECLARE_QUEST_INFO_STOP--
x310164_var_TianfuItems				= {11010100,11010101,11010102}


x310164_var_QuestNpcTab =	{ 
								{ varQuestionIdx = 1, guid = 141506, varName = "梅" },    	
								{ varQuestionIdx = 2, guid = 141507, varName = "兰" },  	
								{ varQuestionIdx = 3, guid = 141508, varName = "竹" },   	
								{ varQuestionIdx = 4, guid = 141509, varName = "菊" }   	
							}
x310164_var_MinLevel	= 10
x310164_var_MaxLevel  = 160

function x310164_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varLevel = GetLevel(varMap, varPlayer)
	
	if IsQuestHaveDone(varMap, varPlayer, x310164_var_QuestId) > 0 then
		return 
	end

	if varLevel <40 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x310164_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310164_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310164_var_QuestId, varState, -1 )
	end
end

function x310164_DeliverTalkInfo( varMap, varPlayer, varTalknpc )
	

    local varExp = x310164_GetGiveExp(varMap, varPlayer)
    
   	AddQuestExpBonus( varMap, varExp)
   
   	local money,type = x310164_GetGiveMoney( varMap, varPlayer)

   	if type == 0 then
        AddQuestMoneyBonus2( varMap, money)
   	else
		AddQuestMoneyBonus1( varMap, money)
    end
    local score = x310164_GetScore( varMap, varPlayer)
    AddQuestItemBonus(varMap, x310164_var_BonusItemId, score)
    	
    
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310164_var_FileId, x310164_var_QuestId)
end

function x310164_IsAlreadySubmit( varMap, varPlayer )  
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1], MD_DENGMI_DATE[2], MD_DENGMI_DATE[3] )
	local nCurDay = GetDayOfYear()
	if nCurDay == nDate then
		return 1
	end
	return 0
end




function x310164_IsStartTimeValid()
	local h,m,s = GetHourMinSec()	
	
	local cur  = h*60  + m
	local from = 19*60 + 30
	local to   = 24*60 + 00
	if cur < from or cur > to then
		return 0
	end
	return 1

end





function x310164_ResetDengmiMD( varMap ,varPlayer)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC1[1],MD_DENGMI_NPC1[2],MD_DENGMI_NPC1[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC2[1],MD_DENGMI_NPC2[2],MD_DENGMI_NPC2[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC3[1],MD_DENGMI_NPC3[2],MD_DENGMI_NPC3[3],0)
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NPC4[1],MD_DENGMI_NPC4[2],MD_DENGMI_NPC4[3],0)
	
end

function x310164_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x310164_var_QuestId) > 0 then
		return
	end
	
	
	
	if IsHaveQuest(varMap,varPlayer, x310164_var_QuestId) > 0 then
        if x310164_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
            TalkAppendString(varMap,x310164_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310164_var_FileId, x310164_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
            TalkAppendString(varMap,x310164_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x310164_DeliverTalkInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310164_var_FileId, x310164_var_QuestId);
        end
        return
    end   
    
    if x310164_IsAlreadySubmit(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
        TalkAppendString(varMap,"每天只能猜谜一次，请明天再来")
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310164_var_FileId, x310164_var_QuestId);
        return
	end
	
	if x310164_IsStartTimeValid() == 0 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
        TalkAppendString(varMap,"只能在19：30 ~  24：00 接任务。")
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310164_var_FileId, x310164_var_QuestId);
        return
	end
	
   if x310164_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
   			local varLevel  = GetLevel(varMap, varPlayer)
   			local 	 xp  = varLevel * 350
   			local nmoney = varLevel * 0.3
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
        TalkAppendString(varMap,x310164_var_QuestInfo.."\n\t#G每当你猜对灯谜侍女的灯谜，你会获得5点积分，猜错了获得1点积分。当你答完四位仕女的灯谜，我会根据你的积分给予你丰厚的奖励。#W" )
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x310164_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        
        
        
        
        
      
      	
				TalkAppendString(varMap,format("\n#Y任务奖励#W：\n经验值：积分*%d点\n银币：%d两",xp,nmoney))
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310164_var_FileId, x310164_var_QuestId);
        
         SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NO1[1],MD_DENGMI_NO1[2],MD_DENGMI_NO1[3],0)
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NO2[1],MD_DENGMI_NO2[2],MD_DENGMI_NO2[3],0)
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NO3[1],MD_DENGMI_NO3[2],MD_DENGMI_NO3[3],0)
		SetPlayerGameData(varMap,varPlayer,MD_DENGMI_NO4[1],MD_DENGMI_NO4[2],MD_DENGMI_NO4[3],0)
    end
end

function x310164_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310164_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310164_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x310164_GetNPCIndex( varMap, varTalknpc) 
	 for varI, item in x310164_var_QuestNpcTab do
        if item.guid == varTalknpc then
            return varI
        end
    end
    return nil
end

function x310164_ProcQuestCompleted( varMap, varPlayer, varTalknpc) 
	local score = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3])
	
end


function x310164_ProcQuestStep( varMap, varPlayer, varTalknpc)   

	if varTalknpc==nil then
		
		return
	end
	if IsHaveQuestNM( varMap, varPlayer, x310164_var_QuestId ) == 0 then
		return
	end
	local varIndex = x310164_GetNPCIndex(varMap, varTalknpc)
	if varIndex == nil then
		return
	end
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310164_var_QuestId)  
	
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,varIndex ,1)

	local n1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[1].varQuestionIdx )	
	local n2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[2].varQuestionIdx )
	local n3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[3].varQuestionIdx )                                                
	local n4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[4].varQuestionIdx ) 
	
	x310164_ProcQuestLogRefresh( varMap, varPlayer, x310164_var_QuestId)
	
	if n1==1 and n2==1 and n3==1 and n4==1 then
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		x310164_ProcQuestCompleted( varMap, varPlayer, varTalknpc) 
	end
	
	
	 
end


function x310164_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if IsQuestHaveDone(varMap, varPlayer, x310164_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x310164_var_QuestId  )
    if varFrontQuest1 ~= -1 then
        if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
            return 0
        end
    end
    if varFrontQuest2 ~= -1 then
        if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
            return 0
        end
    end
    if varFrontQuest3 ~= -1 then
        if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
            return 0
        end
    end
    
    
    if x310164_IsAlreadySubmit( varMap, varPlayer ) == 1 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"今天已经接过任务了!")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    if x310164_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x310164_var_QuestId, x310164_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
        	x310164_ResetDengmiMD( varMap ,varPlayer)
        	x310164_SetAcceptDate( varMap,varPlayer )  
			SetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3], 0)        	
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310164_var_QuestId)                                                  
            x310164_Msg2toplayer( varMap, varPlayer,0)
            
            for varI, item in x310164_var_QuestNpcTab do
        		 SetQuestByIndex(varMap,varPlayer,varQuestIdx,item.varQuestionIdx,0)
    		end
            x310164_ProcQuestLogRefresh( varMap, varPlayer, x310164_var_QuestId)
        end
    end                                                                    
end

function x310164_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x310164_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x310164_var_QuestId)
    x310164_SetDateMD( varMap,varPlayer )	
    x310164_Msg2toplayer( varMap, varPlayer, 1)
end

function x310164_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
		ItemAppend( varMap, x310164_var_BonusItemId, x310164_GetScore( varMap, varPlayer) )
    local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        if result == 1 then
            result = 0
        end
    end
	return result
end




function x310164_SetAcceptDate( varMap,varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310164_var_QuestId)
	local nCurDay = GetDayOfYear()
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nCurDay)
end




function x310164_SetDateMD( varMap,varPlayer )
	local nCurDay = GetDayOfYear()
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1],MD_DENGMI_DATE[2],MD_DENGMI_DATE[3],nCurDay)


end


function x310164_AddTianfuItem( varMap, varPlayer)
	local varLevel = GetLevel( varMap, varPlayer)
	if varLevel >= 80 then
		if random( 1, 100) <= 22 then
			local varIndex = random(1,3)
			StartItemTask( varMap)
	        ItemAppend( varMap, x310164_var_TianfuItems[varIndex], 1)
	        if StopItemTask( varMap, varPlayer) <= 0 then
	            Msg2Player( varMap, varPlayer, "由于你的背包已满，无法获得天赋道具奖励。", 8, 2)
	        else
	            DeliverItemListSendToPlayer( varMap, varPlayer)
	        end
		end
	end
end
--元宵节奖励
function x310164_Addyuanxiaoitem(varMap, varPlayer,score)
	
	local nCurDay = GetDayOfYear()
	local rancount={
		[1]={{0,4},{1,3},{2,2},{3,1},	{4,0},},
		[2]={{0,2},{1,1},{2,0},},
		[3]={{0,1},{1,0},},
	}			
	if nCurDay>=36 and nCurDay<=39 then
		StartItemTask(varMap)
		if score >= 20 then
			local ran = random(1,getn(rancount[1]))
			if rancount[1][ran][1]>0 then
			ItemAppendBind( varMap, 12041237, rancount[1][ran][1] )	--元宵皮
			Msg2Player( varMap, varPlayer, "您获得元宵皮"..rancount[1][ran][1].."个", 8, 3)
			end
			if rancount[1][ran][2]>0 then
			ItemAppendBind( varMap, 12041238, rancount[1][ran][2] )	--元宵馅
			Msg2Player( varMap, varPlayer, "您获得元宵馅"..rancount[1][ran][2].."个", 8, 3)
			end
		elseif score >= 15 then
			local ran = random(1,getn(rancount[2]))
			if rancount[2][ran][1]>0 then
			ItemAppendBind( varMap, 12041237, rancount[2][ran][1] )	--元宵皮
			Msg2Player( varMap, varPlayer, "您获得元宵皮"..rancount[2][ran][1].."个", 8, 3)
			end
			if rancount[2][ran][2]>0 then
			ItemAppendBind( varMap, 12041238, rancount[2][ran][2] )	--元宵馅
			Msg2Player( varMap, varPlayer, "您获得元宵馅"..rancount[2][ran][2].."个", 8, 3)
			end
		elseif score >= 10 then
			local ran = random(1,getn(rancount[3]))
			if rancount[3][ran][1]>0 then
			ItemAppendBind( varMap, 12041237, rancount[3][ran][1] )	--元宵皮
			Msg2Player( varMap, varPlayer, "您获得元宵皮"..rancount[3][ran][1].."个", 8, 3)
			end
			if rancount[3][ran][2]>0 then
			ItemAppendBind( varMap, 12041238, rancount[3][ran][2] )	--元宵馅
			Msg2Player( varMap, varPlayer, "您获得元宵馅"..rancount[3][ran][2].."个", 8, 3)
			end
		end
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
        end
	end
end

function x310164_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	if x310164_IsAlreadySubmit(varMap,varPlayer) == 1 then
        return
	end

	if IsHaveQuest(varMap,varPlayer, x310164_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x310164_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x310164_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x310164_var_QuestId) > 0 then
	LuaCallNoclosure( 256224, "Finishdengmi", varMap, varPlayer)	
		x310164_SetDateMD( varMap,varPlayer )	
		
		
       
        QuestCom(varMap, varPlayer, x310164_var_QuestId)
        x310164_GiveExp( varMap, varPlayer)
        x310164_Msg2toplayer( varMap, varPlayer,2)
        x310164_GiveMoney( varMap, varPlayer)
        local score = x310164_GetScore( varMap, varPlayer)
        StartItemTask(varMap)
          ItemAppend( varMap, x310164_var_BonusItemId, score)
          
        local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			Msg2Player(varMap, varPlayer, "您获得了"..score.."个#{_ITEM11990117}！", 0, 2)
        end
        
       x310164_AddTianfuItem( varMap, varPlayer)
	   x310164_Addyuanxiaoitem(varMap, varPlayer,score)
        		--完成10%奖励百宝囊
      local level = GetLevel( varMap, varPlayer)
			if level >=60 then 
				local randbai = random( 1, 10)
				if randbai == 1 then
					local bai = 12030143
					local bai80 = 12030144
					StartItemTask( varMap)
					if level >=80 then
						bai = bai80
					end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer,format( "你完成了【智】天坛灯谜会，幸运的获得了1个@item_%d", bai), 8, 3)
				else
					Msg2Player( varMap, varPlayer, format( "你的背包已满，无法获得@item_%d奖励", bai), 8, 3)
				end
			end
    end 	

       
   end
   
end

function x310164_GetScore( varMap, varPlayer)
	return GetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3])
end

function x310164_GetGiveExp( varMap, varPlayer)
	local score = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3])
	local varLevel = GetLevel(varMap, varPlayer)
	local varExp = varLevel*350*score
	return varExp
end

function x310164_GiveExp( varMap, varPlayer)
	local varExp = x310164_GetGiveExp( varMap, varPlayer)
	AddExp(varMap, varPlayer, varExp)
	        local multi = x310164_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(varExp*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 3)
        	end 
end

function  x310164_GetGiveMoney( varMap, varPlayer)
 	
	local varLevel = GetLevel(varMap, varPlayer)
	local score = x310164_GetScore(varMap, varPlayer)
	local bonusMoney = varLevel*15*score
	local buff 	=	9011
	local buff1 =	9013
	local buff2 =	9012
	if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1  or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
		return bonusMoney,0
	end
	return bonusMoney,1
	
end

function  x310164_GiveMoney( varMap, varPlayer)
 	
	local varLevel = GetLevel(varMap, varPlayer)
	local score = x310164_GetScore(varMap, varPlayer)
	local bonusMoney = varLevel*15*score
	local buff 	=	9011
	local buff1 =	9013
	local buff2 =	9012
	--【个人】大都灯谜会的冠军完成记次
	if score == 20 then
	    if IsHaveQuestNM( varMap, varPlayer, 1402 ) > 0 then
	        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, 1402)                                                  
			local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)       
	        SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, QuestNum + 1)
	        if GetQuestParam( varMap, varPlayer, varQuestIdx, 3) >= 1 then
	        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 7, 1)  
	        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 0, 1)	        	      
	        end 
	        LuaCallNoclosure( 330051, "ProcQuestLogRefresh", varMap, varPlayer)  	
	    end	
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1  or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
		AddMoney(varMap,varPlayer,0,bonusMoney)
	else
		AddMoney(varMap,varPlayer,1,bonusMoney)
	end
	
end
 
function x310164_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x310164_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x310164_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x310164_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x310164_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x310164_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x310164_var_QuestName.."！", 0, 3)
        if x310164_GetGiveExp( varMap, varPlayer) > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x310164_GetGiveExp( varMap, varPlayer).."点#Y的奖励", 0, 2)
        end
        local money,type = x310164_GetGiveMoney( varMap, varPlayer)
        if money > 0 then
        	if type == 1 then
             	Msg2Player(varMap, varPlayer, format("#Y获得#R银卡#{_MONEY%d}#Y的奖励",money), 0, 2)
            else
            	Msg2Player(varMap, varPlayer, format("#Y获得#R现银#{_MONEY%d}#Y的奖励",money), 0, 2)
            end
        end
    end
    
end

function x310164_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x310164_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x310164_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x310164_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x310164_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x310164_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x310164_var_QuestId) < 1 then
        return
    end


end

function x310164_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x310164_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x310164_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310164_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310164_var_QuestId, varState, -1 )
    end
end

function x310164_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310164_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310164_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310164_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310164_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310164_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x310164_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    
    local ns1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[1].varQuestionIdx)
    local ns2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[2].varQuestionIdx)
    local ns3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[3].varQuestionIdx)
    local ns4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x310164_var_QuestNpcTab[4].varQuestionIdx)
    
	local strTarget = format( "\n  回报@npc_%d", 139133)
    if ns1== 1 and ns2 == 1 and ns3 == 1 and ns4 == 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if ns1== 0 then
            strTarget = "\n#W  猜出@npc_141540的灯谜(0/1)\n"
        else
            strTarget = "\n#G  猜出@npc_141540的灯谜(1/1)\n"
        end
        if ns2 == 0 then
            strTarget = strTarget.."#W  猜出@npc_141541的灯谜(0/1)\n"
        else
            strTarget = strTarget.."#G  猜出@npc_141541的灯谜(1/1)\n"
        end
        if ns3 == 0 then
            strTarget = strTarget.."#W  猜出@npc_141542的灯谜(0/1)\n"
        else
            strTarget = strTarget.."#G  猜出@npc_141542的灯谜(1/1)\n"
        end
        
        if ns4 == 0 then
            strTarget = strTarget.."#W  猜出@npc_141543的灯谜(0/1)"
        else
            strTarget = strTarget.."#G  猜出@npc_141543的灯谜(1/1)"
        end
    end
    
    local score = x310164_GetScore(varMap, varPlayer)
    
    strTarget = "  当前积分：#G"..score.."#W"..strTarget
	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x310164_var_QuestName,          
                                strTarget,
                                "",                             
                                "在大都城南的#G天坛上找到#W“梅、兰、竹、菊”4位灯谜侍女，回答她们的问题。",
                                x310164_var_QuestInfo,
                                ""
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end
function x310164_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end
