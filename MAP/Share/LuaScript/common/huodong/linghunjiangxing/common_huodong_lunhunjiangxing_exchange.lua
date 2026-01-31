

x302513_var_FileId 		= 302513
x302513_var_QuestName	= "【兑换】仲夏狂欢奖励"


x302513_var_IsEnableId    = 1104
x302513_var_LimitLevel	= 10
			
x302513_var_ItemTable ={
		{ext="寒霜魔龙降世符"    ,id=12050316,num=80,des="\n"},
		{ext="残破的神兵之魂"    ,id=11000304,num=50,des="\n"},		
		{ext="魔君附身石（5分钟）"    ,id=12035252,num=40,des="\n"},		
		{ext="龙门战甲（30天）"    ,id=10306085,num=20,des="\n"},		
		{ext="原生钻石矿"    ,id=11990115,num=25,des="\n"},
		{ext="黄金乱士符"    ,id=11970023,num=10,des="\n"},
		{ext="生命琼浆"    ,id=12041097,num=1,des="\n"},		
		}


x302513_var_BonusItem 	= 11000307 --星魂碎片



function x302513_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local day = GetDayOfYear()
	if day >= 145 then
		TalkAppendButton(varMap,x302513_var_FileId, x302513_var_QuestName, 3, -1)
	end
end


function x302513_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	if GetGameOpenById( x302513_var_IsEnableId) <= 0 then
        return
    end
    
    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x302513_var_QuestName)
    	TalkAppendString(varMap,"\t你可以用身上的星魂碎片兑换时装、残破神兵之魂、坐骑等稀有物品")
    	for i, item in x302513_var_ItemTable do
    		TalkAppendButton(varMap, x302513_var_FileId, "兑换"..item.ext, 3, i)
    	end
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif 	idExt == 999 then 
   	 x302513_ExchangeItem( varMap, varPlayer )
   	 	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
   	 	local havecount = GetItemCount(varMap, varPlayer, x302513_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x302513_var_ItemTable[selected].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x302513_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x302513_var_ItemTable[selected].des)
				TalkAppendString(varMap, "你选择了使用星魂碎片兑换：#G"..x302513_var_ItemTable[selected].ext)
				TalkAppendString(varMap, "你当前拥有的星魂碎片数量："..str..GetItemCount(varMap, varPlayer, x302513_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗星魂碎片数量："..str..x302513_var_ItemTable[selected].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x302513_var_ItemTable[selected].id ~= nil then
					AddQuestItemBonus(varMap, x302513_var_ItemTable[selected].id, 1)
				end
			--TalkAppendButton(varMap, x302513_var_FileId, "确认兑换", 3, 999)
			--TalkAppendButton(varMap, x302513_var_FileId, "返回上层", 1, -1)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
--    elseif 	idExt == 7 then 
--    DispatchShopItem( varMap, varPlayer, varTalknpc, 341)   
--		elseif  idExt == 4 then 
--			SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
--			local havecount = GetItemCount(varMap, varPlayer, x302513_var_BonusItem) --获取印记个数
--	    local str ="#G"
--	    if havecount < x302513_var_ItemTable[idExt].num then
--	    	str ="#R"
--	    end
--				StartTalkTask(varMap)          
--				TalkAppendString(varMap, "#Y"..x302513_var_QuestName.."#W")
--				TalkAppendString(varMap, "\t"..x302513_var_ItemTable[idExt].des)
--				TalkAppendString(varMap, "你选择了使用星魂碎片兑换：#G"..x302513_var_ItemTable[idExt].ext)
--				TalkAppendString(varMap, "你当前拥有的星魂碎片数量："..str..GetItemCount(varMap, varPlayer, x302513_var_BonusItem).."#W个")
--				TalkAppendString(varMap, "将消耗星魂碎片数量："..str..x302513_var_ItemTable[idExt].num.."#W个")
--				TalkAppendString(varMap, "你确定要兑换么？")
--				if x302513_var_ItemTable[idExt].id ~= nil then
--					AddQuestItemBonus(varMap, x302513_var_ItemTable[idExt].id, 1)
--				end
--			--TalkAppendButton(varMap, x302513_var_FileId, "确认兑换", 3, 999)
--			--TalkAppendButton(varMap, x302513_var_FileId, "返回上层", 1, -1)
--			StopTalkTask()
--			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    else
	    SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
	    local havecount = GetItemCount(varMap, varPlayer, x302513_var_BonusItem) --获取印记个数
	    local str ="#G"
	    if havecount < x302513_var_ItemTable[idExt].num then
	    	str ="#R"
	    end
				StartTalkTask(varMap)          
				TalkAppendString(varMap, "#Y"..x302513_var_QuestName.."#W")
				TalkAppendString(varMap, "\t"..x302513_var_ItemTable[idExt].des)
				TalkAppendString(varMap, "你选择了使用星魂碎片兑换：#G"..x302513_var_ItemTable[idExt].ext)
				TalkAppendString(varMap, "你当前拥有的星魂碎片数量："..str..GetItemCount(varMap, varPlayer, x302513_var_BonusItem).."#W个")
				TalkAppendString(varMap, "将消耗星魂碎片数量："..str..x302513_var_ItemTable[idExt].num.."#W个")
				TalkAppendString(varMap, "你确定要兑换么？")
				if x302513_var_ItemTable[idExt].id ~= nil then
					AddQuestItemBonus(varMap, x302513_var_ItemTable[idExt].id, 1)
				end
		--		TalkAppendButton(varMap, x302513_var_FileId, "确认兑换", 3, 999)
		--		TalkAppendButton(varMap, x302513_var_FileId, "返回上层", 1, -1)
				StopTalkTask()
				--DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x302513_var_FileId, -1)
    end
end

function x302513_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x302513_ExchangeItem( varMap, varPlayer )

	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local havecount = GetItemCount(varMap, varPlayer, x302513_var_BonusItem) --获取印记个数
	if havecount < x302513_var_ItemTable[selected].num then
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x302513_var_ItemTable[selected].num,x302513_var_BonusItem, x302513_var_ItemTable[selected].ext), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x302513_var_ItemTable[selected].num,x302513_var_BonusItem, x302513_var_ItemTable[selected].ext), 8, 2)
		return
	end
		if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
			Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
			return
		end
	
		StartItemTask( varMap )
		ItemAppendBind( varMap, x302513_var_ItemTable[selected].id, 1)
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x302513_var_BonusItem, x302513_var_ItemTable[selected].num) ~= 1 then 
				return 0 
			end
			DeliverItemListSendToPlayer(varMap,varPlayer)
			--GamePlayScriptLog( varMap, varPlayer, 2509)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x302513_var_ItemTable[selected].id).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x302513_var_ItemTable[selected].id), 8, 3)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
	
end


function x302513_ProcAccept( varMap, varPlayer )
	local selected = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local havecount = GetItemCount(varMap, varPlayer, x302513_var_BonusItem) --获取印记个数
	
	if havecount < x302513_var_ItemTable[selected].num then
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x302513_var_ItemTable[selected].num,x302513_var_BonusItem, x302513_var_ItemTable[selected].ext), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，需要#R%d个#cffcf00@item_%d#cffcf00才能兑换%s",x302513_var_ItemTable[selected].num,x302513_var_BonusItem, x302513_var_ItemTable[selected].ext), 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return
	end
	
		StartItemTask( varMap )
		ItemAppendBind( varMap, x302513_var_ItemTable[selected].id, 1)
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			if DelItem( varMap, varPlayer, x302513_var_BonusItem, x302513_var_ItemTable[selected].num) ~= 1 then 
				return 0 
			end
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 3750+selected)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x302513_var_ItemTable[selected].id).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", 1, x302513_var_ItemTable[selected].id), 8, 3)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
	
end

function x302513_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302513_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302513_CheckSubmit( varMap, varPlayer )

end




function x302513_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302513_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x302513_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302513_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


