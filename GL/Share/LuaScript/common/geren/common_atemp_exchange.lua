

x310356_var_FileId 		= 310356
x310356_var_QuestName	= "兑换神兵"


x310356_var_IsEnableId    = 1104
x310356_var_LimitLevel	= 40
			
x310356_var_ItemTable ={
		{ext="【传奇】神兵·天"    ,id={10019860,10029860,10039860,10049860,10059860,10069860,10359860,10369860,10379860,10389860,10399860,10409860,},num=20,des="拥有强力属性的烈焱时装，篝火节限量产出。"},
		{ext="【传奇】神兵·冥"    ,id={10019861,10029861,10039861,10049861,10059861,10069861,10359861,10369861,10379861,10389861,10399861,10409861,},num=40,des="传说战马烈焱来自极炎之地，能够被烈焱认可的勇士将才能拥有它成为坐骑。"},
		{ext="【传奇】神兵·玄"	   ,id={10019862,10029862,10039862,10049862,10059862,10069862,10359862,10369862,10379862,10389862,10399862,10409862,},num=60,des="集齐足够数量的烈焱碎片就可以兑换拥有上古之神能力的强大手镯。"},
		}


x310356_var_BonusItem 	= 11000304 --神兵碎片

x310356_var_Guid = {3332000256,1300000056,2102000089,3332001722,2072010390,1380031745,2152003677}

x310356_var_zhiye ={
	146000,
	146001,
	146002,
	146003,
	146004,
	146005,
	146006,
	146007,
	146008,
	146009,
	146010,
	146011,
} 

function x310356_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById( x310356_var_IsEnableId) <= 0 then
        return
    end
    local a = 1
--    for k,v in x310356_var_Guid do
--    	if GetPlayerGUID(varMap, varPlayer) == v then
--    		a = 1
--    		break
--    	end 
--    end
    local tempobj =GetMonsterGUID(varMap,varTalknpc)
    if a == 1 and tempobj == x310356_var_zhiye[GetZhiye(varMap,varPlayer)+1] then
		TalkAppendButton(varMap,x310356_var_FileId, x310356_var_QuestName, 3, -1)
	end
end


function x310356_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	if GetGameOpenById( x310356_var_IsEnableId) <= 0 then
        return
    end
    
    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x310356_var_QuestName)
    	TalkAppendString(varMap,"\t你可以用身上的残破的神兵之魂兑换神兵")
    	for i, item in x310356_var_ItemTable do
    		TalkAppendButton(varMap, x310356_var_FileId, "兑换"..item.ext, 3, i)
    	end
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif 	idExt == 999 then 
   	 x310356_ExchangeItem( varMap, varPlayer )
   	 	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
   	 	local havecount = GetItemCount(varMap, varPlayer, x310356_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x310356_var_ItemTable[selected].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x310356_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x310356_var_ItemTable[selected].des)
				TalkAppendString(varMap, "你选择了使用残破的神兵之魂兑换：#G"..x310356_var_ItemTable[selected].ext)
				TalkAppendString(varMap, "你当前拥有的残破的神兵之魂数量："..str..GetItemCount(varMap, varPlayer, x310356_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗残破的神兵之魂数量："..str..x310356_var_ItemTable[selected].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1] ~= nil then
					AddQuestItemBonus(varMap, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1], 1)
				end
			TalkAppendButton(varMap, x310356_var_FileId, "确认兑换", 3, 999)
			TalkAppendButton(varMap, x310356_var_FileId, "返回上层", 1, -1)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
--    elseif 	idExt == 7 then 
--    DispatchShopItem( varMap, varPlayer, varTalknpc, 341)   
		elseif  idExt == 4 then 
			SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
			local havecount = GetItemCount(varMap, varPlayer, x310356_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x310356_var_ItemTable[idExt].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x310356_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x310356_var_ItemTable[idExt].des)
				TalkAppendString(varMap, "你选择了使用残破的神兵之魂兑换：#G"..x310356_var_ItemTable[idExt].ext)
				TalkAppendString(varMap, "你当前拥有的残破的神兵之魂数量："..str..GetItemCount(varMap, varPlayer, x310356_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗残破的神兵之魂数量："..str..x310356_var_ItemTable[idExt].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x310356_var_ItemTable[idExt].id[GetZhiye(varMap,varPlayer)+1] ~= nil then
					AddQuestItemBonus(varMap, x310356_var_ItemTable[idExt].id[GetZhiye(varMap,varPlayer)+1], 1)
				end
			TalkAppendButton(varMap, x310356_var_FileId, "确认兑换", 3, 999)
			TalkAppendButton(varMap, x310356_var_FileId, "返回上层", 1, -1)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    else
	    SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
	    local havecount = GetItemCount(varMap, varPlayer, x310356_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x310356_var_ItemTable[idExt].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x310356_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x310356_var_ItemTable[idExt].des)
				TalkAppendString(varMap, "你选择了使用残破的神兵之魂兑换：#G"..x310356_var_ItemTable[idExt].ext)
				TalkAppendString(varMap, "你当前拥有的残破的神兵之魂数量："..str..GetItemCount(varMap, varPlayer, x310356_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗残破的神兵之魂数量："..str..x310356_var_ItemTable[idExt].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x310356_var_ItemTable[idExt].id[GetZhiye(varMap,varPlayer)+1] ~= nil then
					AddQuestItemBonus(varMap, x310356_var_ItemTable[idExt].id[GetZhiye(varMap,varPlayer)+1], 1)
				end
		--		TalkAppendButton(varMap, x310356_var_FileId, "确认兑换", 3, 999)
		--		TalkAppendButton(varMap, x310356_var_FileId, "返回上层", 1, -1)
				StopTalkTask()
				--DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310356_var_FileId, -1)
    end
end

function x310356_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310356_ExchangeItem( varMap, varPlayer )

	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local havecount = GetItemCount(varMap, varPlayer, x310356_var_BonusItem) --获取印记个数
	if havecount < x310356_var_ItemTable[selected].num then
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310356_var_ItemTable[selected].num,x310356_var_BonusItem, x310356_var_ItemTable[selected].ext), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310356_var_ItemTable[selected].num,x310356_var_BonusItem, x310356_var_ItemTable[selected].ext), 8, 2)
		return
	end
	if selected ~= 4 then
		if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
			Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
			return
		end
	end
	
	if selected ~= 4 then
		StartItemTask( varMap )
		ItemAppendBind( varMap, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1], 1)
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x310356_var_BonusItem, x310356_var_ItemTable[selected].num) ~= 1 then 
				return 0 
			end
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2509)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1]).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1]), 8, 3)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
	else
			if DelItem( varMap, varPlayer, x310356_var_BonusItem, x310356_var_ItemTable[selected].num) ~= 1 then
				 return 0 
			end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + 1)
			SetFeastScore( varMap, varPlayer, allscore + 1)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", 1, 1 + allscore ), 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 3154)
	end
end


function x310356_ProcAccept( varMap, varPlayer )
	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local havecount = GetItemCount(varMap, varPlayer, x310356_var_BonusItem) --获取印记个数
	
	if havecount < x310356_var_ItemTable[selected].num then
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310356_var_ItemTable[selected].num,x310356_var_BonusItem, x310356_var_ItemTable[selected].ext), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310356_var_ItemTable[selected].num,x310356_var_BonusItem, x310356_var_ItemTable[selected].ext), 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return
	end
	
	if selected ~= 4 then
		StartItemTask( varMap )
		ItemAppendBind( varMap, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1], 1)
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x310356_var_BonusItem, x310356_var_ItemTable[selected].num) ~= 1 then 
				return 0 
			end
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 3150+selected)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1]).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310356_var_ItemTable[selected].id[GetZhiye(varMap,varPlayer)+1]), 8, 3)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
	else
			if DelItem( varMap, varPlayer, x310356_var_BonusItem, x310356_var_ItemTable[selected].num) ~= 1 then
				 return 0 
			end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + 1)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", 1, 1 + allscore ), 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 2509)
	end
end

function x310356_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310356_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310356_CheckSubmit( varMap, varPlayer )

end




function x310356_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310356_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310356_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310356_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


