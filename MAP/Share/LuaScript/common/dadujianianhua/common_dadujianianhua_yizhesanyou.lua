--DECLARE_QUEST_INFO_START--

x300569_var_FileId 					= 300569                  
x300569_var_QuestId 				= 9320                    

x300569_var_QuestKind 				= 2                       
x300569_var_LevelLess					= 40                      

x300569_var_QuestName				= "【德】益者三友"                                        
x300569_var_QuestTarget				= "\t帮助全美丽找回高丽属国的贡品"      
x300569_var_QuestInfo				= "\t#Y@myname#W，小女子全美丽这厢有礼了。\n\t方才我的夫君一时不察，将我高丽国准备敬献给忽必烈陛下的贡品，遗失在大都，这些贡品皆是我高丽国多年珍藏之宝物，若是就此丢失，恐怕我夫君难逃杀身之祸。\n\t久闻大元子民皆是高义仁德之人，不知你可否帮忙将那贡品找回？\n\n#Y特别提示：#W只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。"            
x300569_var_ContinueInfo				= "\t贡品......，这可如何是好。"  
x300569_var_QuestCompleted			= "\t这......正是丢失的贡品！\n\t大元子民果然高尚仁义，难怪孔圣人云：君子爱财，取之有道。我今日方才真正见识。\n\t#y@myname#w，还请受我一拜。"  
x300569_var_QuestHelp				= ""          

x300569_var_strQuestAbandon         = "您放弃了任务：【德】益者三友"


x300569_var_ExtTarget					= { {type=20,n=1,target=""} }
x300569_var_TianfuItems				= {11010100,11010101,11010102}


x300569_var_ExpBonus					= 0     
x300569_var_BonusItem					= {}	

x300569_var_BonusMoney1               = 0  
x300569_var_BonusMoney2               = 0  
x300569_var_BonusMoney3               = 0  
x300569_var_BonusMoney4               = 0  
x300569_var_BonusMoney5               = 0  
x300569_var_BonusMoney6               = 0  

x300569_var_BonusChoiceItem           = {}

--DECLARE_QUEST_INFO_STOP--

x300569_var_MaxCount					= 1



x300569_var_strQuestFull            = "任务已满，任务接受失败"
x300569_var_strQuestAccept          = "您接受了任务：【德】益者三友"
x300569_var_strQuestBook            ="据全美丽说当天他们在#G大都南门及南郊#W游玩。"
x300569_var_strSubQuestInfo         = "\t找回丢失的贡品。"
x300569_var_strQuestFinished        = "你完成了任务：【德】益者三友"
x300569_var_strQuestRefrain         = "你今天已经做过这个任务了"
x300569_var_strQuestTarget1         = "\t找到遗失的贡品#G#{_ITEM13810084} #{_ITEM13810089} #{_ITEM13810092} #{_ITEM13810101} #{_ITEM13810104}#W并将其交给@npc_139130"
x300569_var_strQuestTarget2         = "%s  在@npc_72050找到#{_ITEM13810084}(%d/1)\n%s  在@npc_72051找到#{_ITEM13810089}(%d/1)\n%s  在@npc_72052找到#{_ITEM13810092}(%d/1)\n%s  在@npc_72053找到#{_ITEM13810101}(%d/1)\n%s  在@npc_72054找到#{_ITEM13810104}(%d/1)"
x300569_var_strQuestTitle           = "【德】益者三友"

x300569_var_AcceptQuestLogID        = 951

x300569_var_FinishQuestLogID        = 952

x300569_var_TargetNPC                 = 139130

x300569_var_QuestNPC                = 139129

x300569_var_QuestReply              = "@npc_139130"

x300569_var_QuestItemTable          = {
                                        { varItem = 13810084, PosId = 72050, gpId = 323, strName = "东海珠" }, 										
										{ varItem = 13810089, PosId = 72051, gpId = 325, strName = "裘皮袄" }, 
                                        { varItem = 13810092, PosId = 72052, gpId = 326, strName = "高丽参" }, 
                                        { varItem = 13810101, PosId = 72053, gpId = 329, strName = "琉璃碗" }, 
                                        { varItem = 13810104, PosId = 72054, gpId = 330, strName = "丹阳木" }, 
}

x300569_var_CoffExp                   = 7000

x300569_var_CoffMoney                 = 0

x300569_var_Credit                    = 150

x300569_var_strRefuse                 = "\t多谢你了，夫君丢失的高丽贡品已经都找回了。我们这就准备前去晋见忽必烈陛下。"

x300569_var_IsEnableId                = 1006

x300569_var_OpenTime                  = 1170

x300569_var_EndTime                   = 1440

x300569_var_strNotQuestTime         = "只有在每日的#G19：30--2400#cffcf00ず烩ヴ叭"


x300569_var_AdditionItem              = 12030107




function x300569_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end

    if GetLevel( varMap, varPlayer) < x300569_var_LevelLess then
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 then
        return 0
    end

    TalkAppendButton( varMap, x300569_var_QuestId, x300569_var_QuestName, GetQuestStateNM( varMap, varPlayer, varTalknpc, x300569_var_QuestId), 1)
end




function x300569_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExtIdx)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end

	if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 then  
        local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
        if varTalkNpcGUID == x300569_var_TargetNPC then
            local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
                x300569_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
            else
                x300569_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            end
        end
	else
		x300569_DeliverTalkInfo( varMap, varPlayer, varTalknpc)	
	end
end




function x300569_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId)
	if( varHaveQuest > 0) then
		return 0;
	else
		return 1;
	end
end

function x300569_AddTianfuItem( varMap, varPlayer)
	local varLevel = GetLevel( varMap, varPlayer)
	if varLevel >= 80 then
		if random( 1, 100) <= 22 then
			local varIndex = random(1,3)
			StartItemTask( varMap)
	        ItemAppend( varMap, x300569_var_TianfuItems[varIndex], 1)
	        if StopItemTask( varMap, varPlayer) <= 0 then
	            Msg2Player( varMap, varPlayer, "由于你的背包已满，无法获得天赋道具奖励。", 8, 2)
	        else
	            DeliverItemListSendToPlayer( varMap, varPlayer)
	        end
		end
	end
end



function x300569_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end

    local varName = GetName( varMap, varPlayer)
    if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 then
       
        local rewardExt = 0
        local itemExt = 0
        if IsHaveQuestNM( varMap, varPlayer, 1482) > 0 then
            if random( 1, 100) <= 70 then
                rewardExt = 1
                StartItemTask( varMap)
                itemExt = 13015012
                ItemAppend( varMap, itemExt, 1)
                if StopItemTask( varMap, varPlayer) <= 0 then
                    Msg2Player( varMap, varPlayer, "无法得到任务额外奖励物品，请整理背包", 8, 3)
                    return
                end
            end
        end
        
        for varI, item in x300569_var_QuestItemTable do
			if DelItem( varMap, varPlayer, item.varItem, 1) == 0 then
				Msg2Player( varMap, varPlayer, "提交物品失败。", 8, 2)
				Msg2Player( varMap, varPlayer, "提交物品失败", 8, 3)
				return 0
			end 
		end

        
        local varToday = GetDayOfYear()
        if varToday ~= x300569_GetQuestDate( varMap, varPlayer) then
            x300569_SetQuestDate( varMap, varPlayer, varToday)
            x300569_SetDayCount( varMap, varPlayer, 1)
        end


        DelQuest( varMap, varPlayer, x300569_var_QuestId)
        
        
        LuaScenceM2Player( varMap, varPlayer, x300569_var_strQuestFinished, varName, 3, 1)
        LuaScenceM2Player( varMap, varPlayer, x300569_var_strQuestFinished.."。", varName, 2, 1)
        LuaCallNoclosure( 256224, "Finishyizhe", varMap, varPlayer)	
        x300569_SetQuestDate( varMap, varPlayer, GetDayOfYear() )
        local playerLevel = GetLevel( varMap, varPlayer)
        local xp = playerLevel * x300569_var_CoffExp
        if xp > 0 then
				AddExp( varMap, varPlayer, xp)
				Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp).."。", 8, 2)
				Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp), 8, 3)
	        local multi = x300569_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(xp*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(xp*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(xp*multi)), 8, 3)
        	end 				
        end
        
        local money = playerLevel * x300569_var_CoffMoney
        if money > 0 then
            AddMoney( varMap, varPlayer, money, 0)
            Msg2Player( varMap, varPlayer, format( "获得#R现银#{_MONEY%d}#cffcf00的奖励", money).."。", 8, 2)
            Msg2Player( varMap, varPlayer, format( "获得#R现银#{_MONEY%d}#cffcf00的奖励", money), 8, 3)
        end
        SetShengWang( varMap, varPlayer, GetShengWang( varMap, varPlayer) + x300569_var_Credit)
        Msg2Player( varMap, varPlayer, format( "获得#R%d点声望#cffcf00的奖励", x300569_var_Credit).."。", 8, 2)
        Msg2Player( varMap, varPlayer, format( "获得#R%d点声望#cffcf00的奖励", x300569_var_Credit), 8, 3)
        
        x300569_SetDayCount( varMap, varPlayer, x300569_GetDayCount( varMap, varPlayer) + 1)
        if rewardExt == 1 then
            DeliverItemListSendToPlayer( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, format( "获得@item_%d#cffcf00的额外奖励", itemExt).."。", 8, 2)
            Msg2Player( varMap, varPlayer, format( "获得@item_%d#cffcf00的额外奖励", itemExt), 8, 3)
        end
        
        x300569_AddTianfuItem( varMap, varPlayer)
        
        		--完成10%奖励百宝囊
			if playerLevel >=60 then 
				local randbai = random( 1, 10)
				if randbai == 1 then
					local bai = 12030143
					local bai80 = 12030144
					StartItemTask( varMap)
					if playerLevel >=80 then
						bai = bai80
					end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer,format( "你完成了【德】益者三友，幸运的获得了1个@item_%d", bai), 8, 3)
				else
					Msg2Player( varMap, varPlayer, format( "你的背包已满，无法获得@item_%d奖励", bai), 8, 3)
				end
			end
    end 

        
        local value = random( 1, 100)
        local buff 	=	9011
				local buff1 =	9013
				local buff2 =	9012
        if value > 20 and value <= 40 then
            StartItemTask( varMap)
            if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
            	ItemAppend( varMap, x300569_var_AdditionItem, 1)
            else
           		ItemAppendBind( varMap, x300569_var_AdditionItem, 1)
           	end
            if StopItemTask( varMap, varPlayer) <= 0 then
                Msg2Player( varMap, varPlayer, "你完成了【德】益者三友。由于你的背包已满，无法获得藏宝图奖励。", 8, 2)
            else
            	DeliverItemListSendToPlayer( varMap, varPlayer)
                
            end
        end
        
        
        StartItemTask( varMap)
        ItemAppend( varMap, 11990117, 5)
        if StopItemTask( varMap, varPlayer) <= 0 then
            Msg2Player( varMap, varPlayer, "你完成了【德】益者三友。由于你的背包已满，无法获得#{_ITEM11990117}奖励。", 8, 2)
        else
            DeliverItemListSendToPlayer( varMap, varPlayer)
        end
        GamePlayScriptLog( varMap, varPlayer, x300569_var_FinishQuestLogID)
    else
        
        local nowTime = GetMinOfDay()
        if nowTime < x300569_var_OpenTime or nowTime >= x300569_var_EndTime then
            Msg2Player( varMap, varPlayer, x300569_var_strNotQuestTime.."。", 8, 2)
            Msg2Player( varMap, varPlayer, x300569_var_strNotQuestTime, 8, 3)
            return
        end

        local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
        if varTalkNpcGUID == x300569_var_TargetNPC then
            return
        end

        local varToday = GetDayOfYear()
        if x300569_GetQuestDate( varMap, varPlayer) == varToday then
            if x300569_GetDayCount( varMap, varPlayer) > x300569_var_MaxCount then
                
                StartTalkTask( varMap)
                    TalkAppendString( varMap, "#Y"..x300569_var_QuestName)
                    TalkAppendString( varMap, x300569_var_strRefuse)
                StopTalkTask()
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                Msg2Player( varMap, varPlayer, format("今天你已经做过这个任务，不能再接了"), 8, 3)
                return 0
            else
            	x300569_SetDayCount( varMap, varPlayer, 1)
            end
        else
            x300569_SetQuestDate( varMap, varPlayer, varToday)
            x300569_SetDayCount( varMap, varPlayer, 1)
        end

        
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x300569_var_QuestId)
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

        if AddQuest( varMap, varPlayer, x300569_var_QuestId, x300569_var_FileId, 0, 0, 1, 1) == 0 then
            LuaScenceM2Player( varMap, varPlayer, x300569_var_strQuestFull, varName, 3, 1)
            return 0
        else
            
            LuaScenceM2Player( varMap, varPlayer, x300569_var_strQuestAccept, varName, 3, 1)
            LuaScenceM2Player( varMap, varPlayer, x300569_var_strQuestAccept, varName, 2, 1)
        end

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
		
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300569_var_QuestName)
            TalkAppendString( varMap, x300569_var_strQuestTarget1 )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)

        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
        
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, (HaveItemInBag( varMap, varPlayer, x300569_var_QuestItemTable[1].varItem ) > 0 and 1 or 0))
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, (HaveItemInBag( varMap, varPlayer, x300569_var_QuestItemTable[2].varItem ) > 0 and 1 or 0))
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, (HaveItemInBag( varMap, varPlayer, x300569_var_QuestItemTable[3].varItem ) > 0 and 1 or 0))
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, (HaveItemInBag( varMap, varPlayer, x300569_var_QuestItemTable[4].varItem ) > 0 and 1 or 0))
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, (HaveItemInBag( varMap, varPlayer, x300569_var_QuestItemTable[5].varItem ) > 0 and 1 or 0))

        
        x300569_ProcQuestLogRefresh( varMap, varPlayer, x300569_var_QuestId)

        
        GamePlayScriptLog( varMap, varPlayer, x300569_var_AcceptQuestLogID)
    end
end




function x300569_ProcQuestAbandon( varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId)
	if varHaveQuest > 0 then
       
        
        for varI, item in x300569_var_QuestItemTable do
            if GetItemCountInBag( varMap, varPlayer, item.varItem) > 0 and DelItem( varMap, varPlayer, item.varItem, 1) == 0 then
                Msg2Player( varMap, varPlayer, "删除任务物品失败，无法放弃任务。", 8, 2)
                Msg2Player( varMap, varPlayer, "删除任务物品失败，无法放弃任务", 8, 3)
                return 0
            end
        end

		DelQuest( varMap, varPlayer, x300569_var_QuestId)

        local varToday = GetDayOfYear()
        if varToday == x300569_GetQuestDate( varMap, varPlayer) then
            x300569_SetDayCount( varMap, varPlayer, x300569_GetDayCount( varMap, varPlayer) + 1)
        else
            x300569_SetQuestDate( varMap, varPlayer, varToday)
            
            x300569_SetDayCount( varMap, varPlayer, 2)
        end

		Msg2Player( varMap, varPlayer, x300569_var_strQuestAbandon, 8, 3)
		Msg2Player( varMap, varPlayer, x300569_var_strQuestAbandon, 8, 2)
	end
end




function x300569_CheckSubmit( varMap, varPlayer, varTalknpc)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)

    if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        return 1
    else
        return 0
    end
end




function x300569_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick)
	
	if x300569_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300569_var_BonusMoney1 )
	    Msg2Player(varMap,varPlayer,format("获得银卡#{_MONEY%d}的奖励。", x300569_var_BonusMoney1),4,2)
	end

	
	if x300569_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300569_var_BonusMoney2 )
	    Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x300569_var_BonusMoney2),4,2)
	end

	
	if x300569_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300569_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x300569_var_BonusMoney3),4,2)
	end

	
	if x300569_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x300569_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得声望%d的奖励。", x300569_var_BonusMoney4),4,2)
	end

	
	if x300569_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x300569_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得声望%d的奖励。", x300569_var_BonusMoney5),4,2)
	end

	
	if x300569_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x300569_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x300569_var_BonusMoney6),4,2)
	end

 	
	for varI, item in x300569_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		if StopItemTask( varMap, varPlayer) > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300569_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
			else
				StartTalkTask( varMap)
				TalkAppendString( varMap, "物品栏已满，无法得到任务物品！" )
				StopTalkTask()
				DeliverTalkTips( varMap, varPlayer)
			end

			
			return
		end
    end
end




function x300569_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end




function x300569_DeliverTalkInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x300569_var_QuestName)
    TalkAppendString( varMap, x300569_var_QuestInfo)
    TalkAppendString( varMap, " ")
           
    
    TalkAppendString( varMap, "#Y任务目标：")
    TalkAppendString( varMap, x300569_var_QuestTarget)
    TalkAppendString( varMap, " ")

                    

    local varLevel = GetLevel( varMap, varPlayer)
    

    
    local playerLevel = GetLevel( varMap, varPlayer)
    local varExp = varLevel * x300569_var_CoffExp
    if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end

    
    if x300569_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1( varMap, x300569_var_BonusMoney1)
    end

    
    if x300569_var_CoffMoney > 0 then
        AddQuestMoneyBonus2( varMap, x300569_var_CoffMoney * varLevel)
    end
    
    if x300569_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3( varMap, x300569_var_BonusMoney3)
    end

    
    if x300569_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4( varMap, x300569_var_BonusMoney4)
    end

    
    if x300569_var_Credit > 0 then
        AddQuestMoneyBonus5( varMap, x300569_var_Credit)
    end

    
    if x300569_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6( varMap, x300569_var_BonusMoney6)
    end

    
    for varI, item in x300569_var_BonusItem do
        AddQuestItemBonus( varMap, item.item, item.n)
    end

    
    for varI, item in x300569_var_BonusChoiceItem do
        AddQuestRadioItemBonus( varMap, item.item, item.n)
    end

	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300569_var_FileId, x300569_var_QuestId)
end




function x300569_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300569_var_QuestName)
    TalkAppendString( varMap, x300569_var_ContinueInfo)
    TalkAppendString( varMap, " ")
	StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end




function x300569_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300569_var_QuestName)
    TalkAppendString( varMap, x300569_var_QuestCompleted)
    TalkAppendString( varMap, " ")
    
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
    local varLevel = GetLevel( varMap, varPlayer)
	local varExp = varLevel * x300569_var_CoffExp
    if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end
    
    
    local money = varLevel * x300569_var_CoffMoney
    if money > 0 then
        AddQuestMoneyBonus2( varMap, money)
    end
    if x300569_var_Credit > 0 then
        AddQuestMoneyBonus5( varMap, x300569_var_Credit)
    end
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300569_var_FileId, x300569_var_QuestId)
end




function x300569_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end




function x300569_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
	
	if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 and IsQuestHaveDoneNM( varMap, varPlayer, x300569_var_QuestId ) <= 0 then
		local needitem = 0
		for varI, item in x300569_var_QuestItemTable do
			if  varItemData == item.varItem then
				needitem = 1
				
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, varI, 1)
			end
		end
		if needitem ~= 1 then
			return
		end
        
		x300569_ProcQuestLogRefresh( varMap, varPlayer, x300569_var_QuestId)
		
		for varI, item in x300569_var_QuestItemTable do
			if item.varItem ~= varItemData and HaveItemInBag( varMap, varPlayer, item.varItem ) < 0 then
				return
			end
		end
		
		Msg2Player( varMap, varPlayer, "#Y你找到了所有贡品，快去交给高丽国使吧。", 8, 3)
		
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
	end
end




function x300569_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 then
    
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
        if varTalkNpcGUID == x300569_var_TargetNPC then
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
                TalkAppendButton( varMap, x300569_var_QuestId, x300569_var_QuestName, 6)
            else
                TalkAppendButton( varMap, x300569_var_QuestId, x300569_var_QuestName, 7)
            end
        end
    end
end

function x300569_GetQuestDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_DATE[ 1], MD_YIZHESANYOU_DATE[ 2], MD_YIZHESANYOU_DATE[ 3] )
end

function x300569_SetQuestDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_DATE[ 1], MD_YIZHESANYOU_DATE[ 2], MD_YIZHESANYOU_DATE[ 3], value)
end

function x300569_GetDayCount( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_COUNTER[ 1], MD_YIZHESANYOU_COUNTER[ 2], MD_YIZHESANYOU_COUNTER[ 3] )
end

function x300569_SetDayCount( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_COUNTER[ 1], MD_YIZHESANYOU_COUNTER[ 2], MD_YIZHESANYOU_COUNTER[ 3], value)
end

function x300569_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 then
 
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
        
        local varIndex = -1
        for varI, item in x300569_var_QuestItemTable do
			if item.gpId == varGpType then
				varIndex = varI
				break
			end
        end
        
        if varIndex ~= -1 then
			if HaveItemInBag( varMap, varPlayer, x300569_var_QuestItemTable[varIndex].varItem ) < 0 then
                return 0
            else
            	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
                Msg2Player( varMap, varPlayer, "你已经找齐了所有高丽贡品，快去找高丽国使提交任务吧。", 8, 3)
               else
               	Msg2Player( varMap, varPlayer, "你已经得到了此高丽贡品，快去找到别的高丽贡品吧。", 8, 3)
               end
                return 1
            end
        else
			Msg2Player( varMap, varPlayer, "这似乎不是你要找的高丽贡品。", 8, 3)
            return 1
        end
    else
        Msg2Player( varMap, varPlayer, "你没有接受【德】益者三友，不能采集", 8, 3)
        return 1
    end
end

function x300569_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if GetGameOpenById( x300569_var_IsEnableId) <= 0 then
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, x300569_var_QuestId) > 0 then
   
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
        
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 then
			for varI, item in x300569_var_QuestItemTable do
			
				if item.varItem == varNeedItem and item.gpId == varGpType and HaveItemInBag( varMap, varPlayer, varNeedItem ) < 0 then
					
					StartItemTask( varMap)
					
					ItemAppend( varMap, varNeedItem, 1)
	                
					
					if random(1, 100) <= 60 then
						local rnd = random(1, 3)
						if rnd == 1 then
							ItemAppend( varMap, 12030080, 1)
						elseif rnd == 2 then
							ItemAppend( varMap, 12030081, 1)
						else
							ItemAppend( varMap, 12030082, 1)
						end
						
					end
	                
					if StopItemTask( varMap, varPlayer) > 0 then
						DeliverItemListSendToPlayer( varMap, varPlayer)
						return 1
					else
						Msg2Player( varMap, varPlayer, "无法得到采集物品，请整理道具栏", 8, 3)
					end
				end
			end
        end
    else
        Msg2Player( varMap, varPlayer, "你没有接受【德】益者三友，不能采集", 8, 3)
    end

    return 0
end




function x300569_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300569_var_QuestId)
	
	local fmt = {}
	for varI = 1, 5 do
		fmt[varI] = {}
		if GetQuestParam(varMap, varPlayer, varQuestIdx, varI) == 1 then
			fmt[varI][1] = "#G"
			fmt[varI][2] = 1
		else
			fmt[varI][1] = "#W"
			fmt[varI][2] = 0
		end
	end
		
    local target = format(x300569_var_strQuestTarget2,
		fmt[1][1], fmt[1][2],
		fmt[2][1], fmt[2][2],
		fmt[3][1], fmt[3][2],
		fmt[4][1], fmt[4][2],
		fmt[5][1], fmt[5][2])
		
	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                               x300569_var_QuestName,               
                               x300569_var_strQuestTitle,               
                               target,			
                               x300569_var_QuestReply,              
                               x300569_var_strQuestBook,            
                               x300569_var_QuestInfo,
                               x300569_var_QuestHelp)               
    local varLevel = GetLevel( varMap, varPlayer)
    local varExp = varLevel * x300569_var_CoffExp
    if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end
    	
    
    local money = varLevel * x300569_var_CoffMoney
    if money > 0 then
        AddQuestMoneyBonus2( varMap, money)
    end
    if x300569_var_Credit > 0 then
        AddQuestMoneyBonus5( varMap, x300569_var_Credit)
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end
function x300569_IsMulti( varMap, varPlayer)
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
