

x310922_var_FileId 		= 310922
x310922_var_QuestKind 	= 	1                       
x310922_var_QuestName	= "【个人】捐献黄金纪念币"


x310922_var_IsEnableId    = 1071
x310922_var_LimitLevel	= 40			

x310922_var_MaxCount		= 50

x310922_var_SubmitItem	= 11990020		
x310922_var_BonusItem 	= {
	{varItem = 12035201, rnd = 7}, 
	{varItem = 12035202, rnd = 14}, 
	{varItem = 12035203, rnd = 21}, 
	{varItem = 12035204, rnd = 25}, 
	{varItem = 12035207, rnd = 26}, 
	{varItem = 12035206, rnd = 33}, 
	{varItem = 12035205, rnd = 40}, 
}




function x310922_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById( x310922_var_IsEnableId) <= 0 then
        return
    end
    
	--TalkAppendButton(varMap,x310922_var_FileId, x310922_var_QuestName, 3, -1)
	TalkAppendButton( varMap, x310922_var_FileId, "节日积分商店", 10, 6)
end




function x310922_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	local varDaycount = x310922_GetDayCount(varMap, varPlayer, varItemCount)
	local times = x310922_var_MaxCount - varDaycount
	local varStr = format("\n#G小提示：你今天还可以捐献#R%d#G个黄金纪念币。",times)
	if GetGameOpenById( x310922_var_IsEnableId) <= 0 then
        return
    end
    
    --if idExt < 0 then
    --	StartTalkTask(varMap)
    --	TalkAppendString(varMap,"#Y"..x310922_var_QuestName)
    --	TalkAppendString(varMap,"\t喜兽年年来,祝福天天伴.在这辞旧迎新的欢乐日子里,#B@myname#W你的新年愿望是什么呢?")
    --	TalkAppendString(varMap,varStr)
    --	TalkAppendButton(varMap, x310922_var_FileId, "捐献1个黄金纪念币", 3, 1)
    --	TalkAppendButton(varMap, x310922_var_FileId, "捐献5个黄金纪念币", 3, 5)
    --	TalkAppendButton(varMap, x310922_var_FileId, "捐献10个黄金纪念币", 3, 10)
    --	StopTalkTask()
    --	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    --elseif 	idExt == 6 then 
    	DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    --else
    --	SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
    --	
		--StartTalkTask(varMap)          
		--TalkAppendString(varMap, "#Y"..x310922_var_QuestName.."#W")
		--local varStr =format("\t每捐献1个黄金纪念币都可以获得大笔的经验和个人节日积分，并且有几率获得#G黄金灯笼#W.\n\t你确定要捐献%d个黄金纪念币?",idExt)
		--TalkAppendString(varMap, varStr)
		--StopTalkTask()
		--DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310922_var_FileId, -1)
    --end
end

function x310922_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310922_ProcAccept( varMap, varPlayer )

	local varItemCount = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local varDaycount = x310922_GetDayCount(varMap, varPlayer, varItemCount)
	local score = 0
	
	if varDaycount >= x310922_var_MaxCount then
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个黄金纪念币，请明天再来", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个黄金纪念币，请明天再来。", 8, 2)
		return
	end
	
	if varItemCount > x310922_var_MaxCount-varDaycount then
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个黄金纪念币", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个黄金纪念币，请明天再来。", 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，捐献黄金纪念币需要至少2个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，捐献黄金纪念币需要至少2个背包空位", 0, 3)
		return
	end
	
	if GetItemCountInBag(varMap, varPlayer, x310922_var_SubmitItem) < varItemCount then
		 Msg2Player( varMap, varPlayer, "您没有足够的黄金纪念币,捐献失败", 8, 3)
	    Msg2Player( varMap, varPlayer, "您没有足够的黄金纪念币,捐献失败。", 8, 2)
	    return
	end
	
	local varLevel = GetLevel(varMap, varPlayer)
	
	StartItemTask( varMap )
	local c = 0
	for varI = 1, varItemCount do
	
		local rnd = random(1, 100)
		
		for j, item in x310922_var_BonusItem do
			if rnd <= item.rnd then
					local varBagIdx = FindFirstBagIndexOfItem(varMap, varPlayer, x310922_var_SubmitItem)
					if varBagIdx >= 0 and IsItemBind(varMap, varPlayer, varBagIdx) > 0 then
						ItemAppendBind( varMap, item.varItem, 1)
					else
						ItemAppend( varMap, item.varItem, 1)
					end
				c = c + 1
				break
			end
		end
	end
	
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		if DelItem( varMap, varPlayer, x310922_var_SubmitItem, varItemCount) ~= 1 then return 0 end
		
		if c >0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		end
		x310922_SetDayCount(varMap, varPlayer, varItemCount)
		
		
		
	else
		local varStr = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
		return
	end
	
	local allexp = 0
	for varI = 1, varItemCount do
			local varExp = random(7, 11)
			if varLevel <=70 then
				varExp = varExp*360*varLevel
			elseif varLevel <=80 then
				varExp = varExp*648*varLevel
			elseif varLevel <=90 then
				varExp = varExp*1296*varLevel
			else
				varExp = varExp*1680*varLevel
			end
			allexp = allexp+varExp
			score = score + 2
			SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 1, 2)
			local myGuid = GetPlayerGUID( varMap,varPlayer )
			GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, 310923, -1, "ProcScoreChanged", 3)
			GamePlayScriptLog( varMap, varPlayer, 2509)
	end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + score)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", score, score + allscore ), 8, 3)
			AddExp( varMap, varPlayer, allexp)
			Msg2Player( varMap, varPlayer, format( "新年积分增加%d点#cffcf00", varItemCount).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "新年积分增加%d点#cffcf00", varItemCount), 8, 3)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp), 8, 3)
end




function x310922_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310922_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310922_CheckSubmit( varMap, varPlayer )

end




function x310922_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310922_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310922_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310922_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x310922_GetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
	return varDaycount
end




function x310922_SetDayCount(varMap, varPlayer, varItemCount)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], varItemCount)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], varDaycount+varItemCount)
	end
end
