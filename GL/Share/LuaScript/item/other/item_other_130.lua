





x418130_var_FileId = 418130
x418130_var_LevelMin = 30	

x418130_var_ItemTable             = {
                                    { varItem = 12054300, probability = 120, special = 0, broad = 0, itemname = "还童书" }, 
                                    { varItem = 11000501, probability = 120, special = 0, broad = 0, itemname = "紫檀木碳" }, 
                                    { varItem = 11000902, probability = 120, special = 0, broad = 0, itemname = "高级洗石剂" }, 
                                    { varItem = 12010020, probability = 120, special = 0, broad = 0, itemname = "小生命清露" }, 
                                    { varItem = 11000800, probability = 120, special = 0, broad = 0, itemname = "离石剂" }, 
                                    { varItem = 12030202, probability = 70,  special = 0, broad = 0, itemname = "江湖请柬" }, 
                                    { varItem = 12110207, probability = 70,  special = 0, broad = 0, itemname = "爱无止境" }, 
                                    { varItem = 12030200, probability = 70,  special = 0, broad = 0, itemname = "小喇叭" }, 
                                    { varItem = 11990110, probability = 70,  special = 0, broad = 0, itemname = "募集券" }, 
                                    { varItem = 12054301, probability = 50,  special = 0, broad = 0, itemname = "还龙书" }, 
                                    { varItem = 11990114, probability = 16,  special = 0, broad = 0, itemname = "次生钻石" }, 
                                    { varItem = 11000502, probability = 25,  special = 0, broad = 0, itemname = "黄紫水火水银" }, 
                                    { varItem = 11000504, probability = 7,   special = 0, broad = 0, itemname = "黄紫炫彩水银" }, 
                                    { varItem = 11000500, probability = 6,   special = 0, broad = 0, itemname = "黄紫海蓝水银" }, 
                                    { varItem = 11000503, probability = 5,   special = 0, broad = 0, itemname = "黄紫晕光水银" }, 
                                    { varItem = 12050249, probability = 10,  special = 0, broad = 1, itemname = "年兽降世符" }, 
                                    { varItem = 10287075, probability = 1,   special = 1, broad = 1, itemname = "世传节庆戒指" }, 
}                                                                               
x418130_var_ItemSpecial           = {
                                    { varItem = 10287075, itemname = "世传节庆戒指", leveldown = 30, levelup = 40 }, 
                                    { varItem = 10287076, itemname = "国传节庆戒指", leveldown = 40, levelup = 60 }, 
                                    { varItem = 10287073, itemname = "神传节庆戒指", leveldown = 60, levelup = 80 }, 
                                    { varItem = 10287074, itemname = "天传节庆戒指", leveldown = 80, levelup = 999 }, 
                                    { varItem = 10297075, itemname = "世传节庆手镯", leveldown = 30, levelup = 40 }, 
                                    { varItem = 10297076, itemname = "国传节庆手镯", leveldown = 40, levelup = 60 }, 
                                    { varItem = 10297073, itemname = "神传节庆手镯", leveldown = 60, levelup = 80 }, 
                                    { varItem = 10297074, itemname = "天传节庆手镯", leveldown = 80, levelup = 999 }, 
}




function x418130_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418130_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418130_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418130_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418130_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418130_ProcActivateOnce( varMap, varPlayer, varImpact )

	local lv = GetLevel(varMap, varPlayer)
	if lv < x418130_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

    if GetBagSpace(varMap, varPlayer) < 1 then
        Msg2Player( varMap, varPlayer, "背包空间不足一格，无法打开节庆大礼包", 8, 3)
        return
    end

	local varRand = random( 1, 1000)
    local varIndex = 1
    local varNum1 = 1
    local varNum2 = 1
    local giveitem = 12054300
    for varI, item in x418130_var_ItemTable do
        varNum1 = varNum1 + item.probability
        if varRand >= varNum2 and varRand < varNum1 then
            varIndex = varI
            break
        end
        varNum2 = varNum2 + item.probability
    end
    local arr = {}
    local varCount = 0
    if x418130_var_ItemTable[ varIndex].special == 1 then
        for varI, item in x418130_var_ItemSpecial do
            if lv >= item.leveldown and lv < item.levelup then
                varCount = varCount + 1
                arr[ varCount] = item
            end
        end
        giveitem = arr[ random( 1, getn( arr) ) ].varItem
    else
        giveitem = x418130_var_ItemTable[ varIndex].varItem
    end

	StartItemTask(varMap)
		ItemAppendBind( varMap, giveitem, 1)

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开节庆大礼包，获得了礼品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

            
            if x418130_var_ItemTable[ varIndex].broad == 1 then
                LuaAllScenceM2Wrold( varMap, format( "恭喜玩家%s打开节庆大礼包获得了#{_ITEM%d}", GetName( varMap, varPlayer), giveitem), 5, 1)
            end

            local xp = random( 60000, 980000)
            AddExp( varMap, varPlayer, xp)
            Msg2Player( varMap, varPlayer, format( "你获得了#R%d#cffcc00点经验。", xp), 8, 2)
            Msg2Player( varMap, varPlayer, format( "你获得了#R%d#cffcc00点经验", xp), 8, 3)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开节庆大礼包异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	else
		StartTalkTask( varMap)
		TalkAppendString( varMap, "背包已满，无法得到物品！" )
		StopTalkTask( varMap)
		DeliverTalkTips( varMap, varPlayer)
	end

end







function x418130_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
