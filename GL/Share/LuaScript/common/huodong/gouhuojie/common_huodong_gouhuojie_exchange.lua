

x310854_var_FileId 		= 310854
x310854_var_QuestName	= "【活动】兑换篝火节物品"


x310854_var_IsEnableId    = 1071
x310854_var_LimitLevel	= 10
			
x310854_var_ItemTable ={
												{ext="烈焱时装"    ,id=10306082,num=200,des="拥有强力属性的烈焱时装，篝火节限量产出。"},
												{ext="烈焱战马"    ,id=12050293,num=230,des="传说战马烈焱来自极炎之地，能够被烈焱认可的勇士将才能拥有它成为坐骑。"},
												{ext="烈焱手镯碎片",id=11000306,num=120,des="集齐足够数量的烈焱碎片就可以兑换拥有上古之神能力的强大手镯。"},
												{ext="1点节日积分" ,num=1  ,des="节日积分可以在节日商店处购买各种道具。"},
												}


x310854_var_BonusItem 	= 13810522 --火焰印记

function x310854_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
		if GetGameOpenById( x310854_var_IsEnableId) <= 0 then
        return
    end
	TalkAppendButton(varMap,x310854_var_FileId, x310854_var_QuestName, 3, -1)
end




function x310854_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	if GetGameOpenById( x310854_var_IsEnableId) <= 0 then
        return
    end
    
    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x310854_var_QuestName)
    	TalkAppendString(varMap,"\t珍贵的火焰印记是用来奖励给为王国篝火节作出杰出贡献的勇士，如果你拥有足够的印记可以在我这里兑换各种限量版的篝火节礼物。")
    	for i, item in x310854_var_ItemTable do
    		TalkAppendButton(varMap, x310854_var_FileId, "兑换"..item.ext, 3, i)
    	end
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif 	idExt == 999 then 
   	 x310854_ExchangeItem( varMap, varPlayer )
   	 	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
   	 	local havecount = GetItemCount(varMap, varPlayer, x310854_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x310854_var_ItemTable[selected].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x310854_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x310854_var_ItemTable[selected].des)
				TalkAppendString(varMap, "你选择了使用火焰印记兑换：#G"..x310854_var_ItemTable[selected].ext)
				TalkAppendString(varMap, "你当前拥有的火焰印记数量："..str..GetItemCount(varMap, varPlayer, x310854_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗火焰印记数量："..str..x310854_var_ItemTable[selected].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x310854_var_ItemTable[selected].id ~= nil then
					AddQuestItemBonus(varMap, x310854_var_ItemTable[selected].id, 1)
				end
			TalkAppendButton(varMap, x310854_var_FileId, "确认兑换", 3, 999)
			TalkAppendButton(varMap, x310854_var_FileId, "返回上层", 1, -1)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
--    elseif 	idExt == 7 then 
--    DispatchShopItem( varMap, varPlayer, varTalknpc, 341)   
		elseif  idExt == 4 then 
			SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
			local havecount = GetItemCount(varMap, varPlayer, x310854_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x310854_var_ItemTable[idExt].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x310854_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x310854_var_ItemTable[idExt].des)
				TalkAppendString(varMap, "你选择了使用火焰印记兑换：#G"..x310854_var_ItemTable[idExt].ext)
				TalkAppendString(varMap, "你当前拥有的火焰印记数量："..str..GetItemCount(varMap, varPlayer, x310854_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗火焰印记数量："..str..x310854_var_ItemTable[idExt].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x310854_var_ItemTable[idExt].id ~= nil then
					AddQuestItemBonus(varMap, x310854_var_ItemTable[idExt].id, 1)
				end
			TalkAppendButton(varMap, x310854_var_FileId, "确认兑换", 3, 999)
			TalkAppendButton(varMap, x310854_var_FileId, "返回上层", 1, -1)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    else
	    SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
	    local havecount = GetItemCount(varMap, varPlayer, x310854_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x310854_var_ItemTable[idExt].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x310854_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x310854_var_ItemTable[idExt].des)
				TalkAppendString(varMap, "你选择了使用火焰印记兑换：#G"..x310854_var_ItemTable[idExt].ext)
				TalkAppendString(varMap, "你当前拥有的火焰印记数量："..str..GetItemCount(varMap, varPlayer, x310854_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗火焰印记数量："..str..x310854_var_ItemTable[idExt].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x310854_var_ItemTable[idExt].id ~= nil then
					AddQuestItemBonus(varMap, x310854_var_ItemTable[idExt].id, 1)
				end
		--		TalkAppendButton(varMap, x310854_var_FileId, "确认兑换", 3, 999)
		--		TalkAppendButton(varMap, x310854_var_FileId, "返回上层", 1, -1)
				StopTalkTask()
				--DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310854_var_FileId, -1)
    end
end

function x310854_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310854_ExchangeItem( varMap, varPlayer )

	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local havecount = GetItemCount(varMap, varPlayer, x310854_var_BonusItem) --获取印记个数
	if havecount < x310854_var_ItemTable[selected].num then
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310854_var_ItemTable[selected].num,x310854_var_BonusItem, x310854_var_ItemTable[selected].ext), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310854_var_ItemTable[selected].num,x310854_var_BonusItem, x310854_var_ItemTable[selected].ext), 8, 2)
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
		ItemAppendBind( varMap, x310854_var_ItemTable[selected].id, 1)
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x310854_var_BonusItem, x310854_var_ItemTable[selected].num) ~= 1 then 
				return 0 
			end
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2509)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310854_var_ItemTable[selected].id).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310854_var_ItemTable[selected].id), 8, 3)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
	else
			if DelItem( varMap, varPlayer, x310854_var_BonusItem, x310854_var_ItemTable[selected].num) ~= 1 then
				 return 0 
			end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + 1)
			SetFeastScore( varMap, varPlayer, allscore + 1)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", 1, 1 + allscore ), 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 3154)
	end
end


function x310854_ProcAccept( varMap, varPlayer )
	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local havecount = GetItemCount(varMap, varPlayer, x310854_var_BonusItem) --获取印记个数
	
	if havecount < x310854_var_ItemTable[selected].num then
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310854_var_ItemTable[selected].num,x310854_var_BonusItem, x310854_var_ItemTable[selected].ext), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x310854_var_ItemTable[selected].num,x310854_var_BonusItem, x310854_var_ItemTable[selected].ext), 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return
	end
	
	if selected ~= 4 then
		StartItemTask( varMap )
		ItemAppendBind( varMap, x310854_var_ItemTable[selected].id, 1)
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x310854_var_BonusItem, x310854_var_ItemTable[selected].num) ~= 1 then 
				return 0 
			end
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 3150+selected)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310854_var_ItemTable[selected].id).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x310854_var_ItemTable[selected].id), 8, 3)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
	else
			if DelItem( varMap, varPlayer, x310854_var_BonusItem, x310854_var_ItemTable[selected].num) ~= 1 then
				 return 0 
			end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + 1)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", 1, 1 + allscore ), 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 2509)
	end
end

function x310854_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310854_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310854_CheckSubmit( varMap, varPlayer )

end




function x310854_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310854_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310854_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310854_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


