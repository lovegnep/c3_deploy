
x270300_var_FileId 		            = 270300
x270300_var_QuestId                 = 4400

x270300_var_QuestName				= "【个人】每日新鲜事儿"
x270300_var_QuestTarget				= "  完成#G%s#W(%d/1)\n  完成#G%s#W#W(%d/1)\n  完成#G%s#W(%d/1)"          
x270300_var_QuestDescription        = "任务描述，完成三个今天的个人任务——#B%s#W，#B%s#W和#B%s#W。"
x270300_var_QuestTips               = "任务提示"
x270300_var_QuestBook               = "任务攻略"


x270300_var_RewardXP                  = 10000


x270300_var_GameTable     = {
                            { gameId = 1012, varQuest = 9331, varScript = 300575, varName = "\n\t\t\t谍影重重\n任务简介\n\t威海港附近出现了东瀛间谍！捕头陈季初正为此事头疼。\n \n任务发布人\n\t陈季初 威海港（89，143）" },         
                            { gameId = 1014, varQuest = 9333, varScript = 300577, varName = "\n\t\t\t东海海图\n任务简介\n\t威海港的大元水师即将东征，可是水师偏将那海却还没拿到重要的东海海图！\n \n任务发布人\n\t那海 威海港（103，97）" },         
                            { gameId = 1015, varQuest = 9334, varScript = 300578, varName = "\n\t\t\t黄道吉日\n任务简介\n\t威海港扬武号即将出海，身为船主的木图特尔却不知道出海日期！\n \n任务发布人\n\t木图特尔 威海港（90，101）" },         
                            { gameId = 1013, varQuest = 9332, varScript = 300576, varName = "\n\t\t\t倾城火雷\n任务简介\n\t威海港竟然埋有火雷！巡城官夏之章可有的忙了。\n \n任务发布人\n\t夏之章 威海港（97，91）" },         
                            { gameId = 1005, varQuest = 9310, varScript = 300566, varName = "\n\t\t\t生死财神\n任务简介\n\t一向节俭的大都盐帮堂主沈芊芊忽然阔绰的高价收购物品，好像与活财神沈万三有一些关系。\n \n任务发布人\n\t沈芊芊 大都（421，237）" },         
                            { gameId = 1024, varQuest = 9501, varScript = 300581, varName = "\n\t\t\t赵王府选美\n任务简介\n\t回纥美女来到了大都赵王府！没看赵王府采办铁算更加趾高气扬了。\n \n任务发布人\n\t铁算 大都（428，118）" },       
                            { gameId = 1004, varQuest = 9302, varScript = 300565, varName = "\n\t\t\t相国寺比武\n任务简介\n\t众武林豪侠齐聚大都相国寺！应邀参加相国寺比武。\n \n任务发布人\n\t明空 大都（116，135）" },       
                            { gameId = 1025, varQuest = 9500, varScript = 300580, varName = "\n\t\t\t心诚则灵\n任务简介\n\t一向风平浪静的威海，今日来乌云遮日，狂风怒号！这可愁坏了抚远大将军范文虎。\n \n任务发布人\n\t范文虎 威海港（125，156）" },         
                            { gameId = 1002, varQuest = 9301, varScript = 300563, varName = "\n\t\t\t赵王府斗戏\n任务简介\n\t大都赵王府要开大戏了，连赵王府采办铁算都忙的不可开交。\n \n任务发布人\n\t铁算 大都（428，118）" },       
                            { gameId = 1011, varQuest = 9330, varScript = 300573, varName = "\n\t\t\t紫青宝剑\n任务简介\n\t名动天下的紫青侠女竟然来到大都为其紫青宝剑寻主。\n \n任务发布人\n\t紫云 大都（271，232）" },         
                            { gameId = 1001, varQuest = 9300, varScript = 300564, varName = "\n\t\t\t四大法王\n任务简介\n\t中原武林举足轻重的明教内部竟然有叛徒！大都明教香主周颠提供的资讯不会有错。\n \n任务发布人\n\t周颠 大都（85，149）" },         
                            { gameId = 1010, varQuest = 9325, varScript = 300572, varName = "\n\t\t\t大内密探\n任务简介\n\t大都卫帅府将军达鲁花手下能人无数，竟然识破了敌人企图潜入大都的阴谋。\n \n任务发布人\n\t达鲁花 大都（310，269）" },         
}

x270300_var_OpenedTable   = {}


function x270300_ProcMapInit( varMap)
    local qid = {}
    qid[1] = GetCountryParam( varMap, 0, CD_RICHANG_QUESTID)
    qid[2] = GetCountryParam( varMap, 1, CD_RICHANG_QUESTID)
    qid[3] = GetCountryParam( varMap, 2, CD_RICHANG_QUESTID)
    if qid[1] <= 0 or qid[2] <= 0 or qid[3] <= 0 then
        x270300_ProcDayChanged( varMap)
    else
        for varI = 1, 3 do
            for j, item in x270300_var_GameTable do
                if qid[varI] == item.gameId then
                    x270300_var_OpenedTable[ varI] = item
                    SetGameOpenById( x270300_var_OpenedTable[ varI].gameId, 1)
                    break
                end
            end
        end
    end
end

function x270300_GenGameID( arrGames)
    -- 把所有可能开放的玩法放入allGame数组
    local allGame = {}
    local newGames = {}
    local varCount = 0
    for varI, item in x270300_var_GameTable do
        if getn( arrGames) > 0 then
            if item.gameId ~= arrGames[ 1].gameId and item.gameId ~= arrGames[ 2].gameId and item.gameId ~= arrGames[ 3].gameId then
                varCount = varCount + 1
                allGame[ varCount] = item
            end
        else
            varCount = varCount + 1
            allGame[ varCount] = item
        end
    end

    
    for varI = 1, 3 do
        -- 从可用玩法数组中随机选择一个
        local varIndex = random( 1, getn( allGame) )
        newGames[ varI] = allGame[ varIndex]
        -- 把剩下的玩法收集到temp
        local temp = {}
        local varCount = 0
        for j, item in allGame do
            if j ~= varIndex then
                varCount = varCount + 1
                temp[ varCount] = item
            end
        end
        allGame = temp
    end

    return newGames
end

function x270300_ProcDayChanged( varMap)
    -- 首先关闭现有开放的玩法
    if getn( x270300_var_OpenedTable) > 0 then
        SetGameOpenById( x270300_var_OpenedTable[ 1].gameId, 0)
        SetGameOpenById( x270300_var_OpenedTable[ 2].gameId, 0)
        SetGameOpenById( x270300_var_OpenedTable[ 3].gameId, 0)
    end

    local newGames = x270300_GenGameID( x270300_var_OpenedTable)

    -- 容错处理
    local bOK = 0
    for i = 1, 10 do
        if getn( newGames) ~= 3 then
            newGames = x270300_GenGameID( x270300_var_OpenedTable)
        else
            if newGames[ 1].gameId == newGames[ 2].gameId or
               newGames[ 1].gameId == newGames[ 3].gameId or
               newGames[ 3].gameId == newGames[ 2].gameId then
                newGames = x270300_GenGameID( x270300_var_OpenedTable)
            else
                bOK = 1
                break
            end
        end
    end

    if bOK == 0 then
        local strLog = format( "DayCommon: Error with same game id! Gen games: %d, closed games: %d. ", getn( newGames), getn( x270300_var_OpenedTable) )
        if getn( newGames) == 3 and getn( x270300_var_OpenedTable) == 3 then
            strLog = strLog.."id1 = "..newGames[ 1].gameId..", id2 = "..newGames[ 2].gameId..", id3 = "..newGames[ 3].gameId..", id1 = "..x270300_var_OpenedTable[ 1].gameId..", id2 = "..x270300_var_OpenedTable[ 2].gameId..", id3 = "..x270300_var_OpenedTable[ 3].gameId
        end
        WriteLog( 1, strLog)
        return
    end

    x270300_var_OpenedTable = newGames

    SetGameOpenById( x270300_var_OpenedTable[ 1].gameId, 1)
    SetGameOpenById( x270300_var_OpenedTable[ 2].gameId, 1)
    SetGameOpenById( x270300_var_OpenedTable[ 3].gameId, 1)

    SetCountryParam( varMap, 0, CD_RICHANG_QUESTID, x270300_var_OpenedTable[ 1].gameId)
    SetCountryParam( varMap, 1, CD_RICHANG_QUESTID, x270300_var_OpenedTable[ 2].gameId)
    SetCountryParam( varMap, 2, CD_RICHANG_QUESTID, x270300_var_OpenedTable[ 3].gameId)
    -- print( "今天开放的玩法是：", x270300_var_OpenedTable[ 1].gameId, x270300_var_OpenedTable[ 2].gameId, x270300_var_OpenedTable[ 3].gameId)
end




function x270300_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    
    if getn( x270300_var_OpenedTable) == 0 then
        return
    end

    local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x270300_var_QuestId)
    TalkAppendButton( varMap, x270300_var_QuestId, x270300_var_QuestName, 3)
end




function x270300_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt)
    
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x270300_var_QuestName)
        if getn( x270300_var_OpenedTable) > 0 then
            TalkAppendString( varMap, format( "\t#Y@myname#W，你找我打听事情，可是找对人了，别说这大都附近的风吹草动躲不过我的眼睛，就算远在威海的大事小情我也了若指掌。\n\t来来来，附耳过来，老夫告诉你，今天各地都发生了什么值得关注的事儿:\n\t#B%s\n\t%s\n\t%s", 
            x270300_var_OpenedTable[ 1].varName, x270300_var_OpenedTable[ 2].varName, x270300_var_OpenedTable[ 3].varName) )
        else
            TalkAppendString( varMap, "今天没有开放任何任务。" )
        end
	StopTalkTask()
	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	
	
	if GetItemCount(varMap,varPlayer,12035020) <= 0 then   
		StartItemTask( varMap )
		ItemAppend( varMap, 12035020, 1 )
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			
			Msg2Player( varMap, varPlayer, format("#Y获得#G1个#Y#{_ITEM%d}！", 12035020), 8, 3)
		else
			Msg2Player( varMap, varPlayer, format("#Y背包空间不足，无法得到#Y#{_ITEM%d}！", 12035020), 8, 3)
		end                                          
	end
end

function x270300_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x270300_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
    
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x270300_var_QuestName)
		TalkAppendString( varMap, "任务完成。" )

        AddQuestExpBonus( varMap, x270300_var_RewardXP)
	StopTalkTask()
	DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x270300_var_FileId, x270300_var_QuestId)
end

function x270300_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, x270300_var_QuestId) then
        DelQuest( varMap, varPlayer, x270300_var_QuestId)
        AddExp( varMap, varPlayer, x270300_var_RewardXP)
    end
end

function x270300_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
    
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x270300_var_QuestName)
		TalkAppendString( varMap, "任务完成了么？" )

        AddQuestExpBonus( varMap, x270300_var_RewardXP)
	StopTalkTask()
	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end

function x270300_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    if IsHaveQuestNM(varMap, varPlayer, x270300_var_QuestId) > 0 then
        DelQuest( varMap, varPlayer, x270300_var_QuestId)
        AddExp( varMap, varPlayer, x270300_var_RewardXP)
    else
        local result = AddQuest( varMap, varPlayer, x270300_var_QuestId, x270300_var_FileId, 0, 0, 0, 0)
        if result == 0 then
            Msg2Player( varMap, varPlayer, "任务已满，任务接受失败", 8, 3)
            return
        end

        x270300_ProcQuestLogRefresh( varMap, varPlayer, x270300_var_QuestId)
    end
end

function x270300_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x270300_var_QuestId)
    local mp1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    local varCount = mp1 + mp2 + mp3

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x270300_var_QuestName.."（"..varCount.."/3）",             
                                format( x270300_var_QuestTarget, 
                                    x270300_var_OpenedTable[ 1].varName, mp1, 
                                    x270300_var_OpenedTable[ 2].varName, mp2, 
                                    x270300_var_OpenedTable[ 3].varName, mp3), 
                                "",                             
                                x270300_var_QuestBook, 
                                format( x270300_var_QuestDescription, 
                                x270300_var_OpenedTable[ 1].varName, x270300_var_OpenedTable[ 2].varName, x270300_var_OpenedTable[ 3].varName), 
                                x270300_var_QuestTips)
    AddQuestExpBonus( varMap, 10000)
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, x270300_var_QuestId)
end


function x270300_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	local varLevel = GetLevel( varMap, varPlayer)

	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x270300_var_QuestName)
		TalkAppendString( varMap, format( x270300_var_QuestDescription, 
            x270300_var_OpenedTable[ 1].varName, x270300_var_OpenedTable[ 2].varName, x270300_var_OpenedTable[ 3].varName) )

        AddQuestExpBonus( varMap, 10000)
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x270300_var_FileId, x270300_var_QuestId)
end


function x270300_ProcSubquestFinished( varMap, varPlayer, varQuest)
    local day = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) == day then
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varCount < 3 then
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1 + varCount)
        else
            return 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3], day)
        SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1)
    end

    return 1
end




function x270300_ProcAccept( varMap, varPlayer)
end




function x270300_ProcQuestAbandon( varMap, varPlayer, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, x270300_var_QuestId) == 1 then
        DelQuest( varMap, varPlayer, x270300_var_QuestId)
    end
end




function x270300_ProcContinue( varMap, varPlayer, varTalknpc)
end




function x270300_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end




function x270300_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
end




function x270300_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end


function x270300_ItemProcEventEntry( varMap, varPlayer, varBagIdx )

	local gameId1 = GetCountryParam( varMap, 0, CD_RICHANG_QUESTID)
	local gameId2 = GetCountryParam( varMap, 1, CD_RICHANG_QUESTID)
	local gameId3 = GetCountryParam( varMap, 2, CD_RICHANG_QUESTID)
	local name1, name2, name3
	
	for varI, item in x270300_var_GameTable do
		if gameId1 == item.gameId then
			name1 = item.varName
		end
		if gameId2 == item.gameId then
			name2 = item.varName
		end
		if gameId3 == item.gameId then
			name3 = item.varName
		end
	end
	
	
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x270300_var_QuestName)
		
		if name1 ~= nil and name2 ~= nil and name3 ~= nil then
			TalkAppendString( varMap, format( "\t官人商人武林人，人人留意。\n\t家事国事天下事，事事关心。\n\t据我包打听所知，今天会有如下几件大事发生：\n#B%s\n \n \n%s\n \n \n%s", 
            name1, name2, name3 ) )
		else
			TalkAppendString( varMap, "今天没有开放任何任务。" )
		end 
	StopTalkTask()
    DeliverTalkInfo(varMap, varPlayer, varPlayer, x270300_var_FileId, -1)
end
