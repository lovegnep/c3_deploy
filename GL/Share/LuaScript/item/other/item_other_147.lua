





x418147_var_FileId = 418147
x418147_var_LevelMin = 30	

x418147_var_ItemTable             = {
                                    { varItem = 11020502, probability = 7200, special = 0, broad = 0, itemname = "水木精华" }, 
                                    { varItem = 11030405, probability = 7200, special = 0, broad = 0, itemname = "七步蛇" }, 
                                    { varItem = 11000201, probability = 7200, special = 0, broad = 0, itemname = "国传水晶" }, 
                                    { varItem = 11050002, probability = 7200, special = 0, broad = 0, itemname = "中级龙眼石" }, 
                                    { varItem = 11000202, probability = 6000, special = 0, broad = 0, itemname = "神传水晶" }, 
                                    { varItem = 11030502, probability = 6000,  special = 0, broad = 0, itemname = "黑曜石" }, 
                                    { varItem = 11050003, probability = 6000,  special = 0, broad = 0, itemname = "高级龙眼石" }, 
                                    { varItem = 12031019, probability = 5500,  special = 0, broad = 0, itemname = "斩" }, 
                                    { varItem = 12030201, probability = 5500,  special = 0, broad = 0, itemname = "修理石" }, 
                                    { varItem = 12031005, probability = 4000,  special = 0, broad = 0, itemname = "心心相印" }, 
                                    { varItem = 12031006, probability = 4000,  special = 0, broad = 0, itemname = "一见钟情" }, 
                                    { varItem = 11990011, probability = 4000,  special = 0, broad = 0, itemname = "三番令" }, 
                                    { varItem = 12030210, probability = 4000,   special = 0, broad = 0, itemname = "威望之星" }, 
                                    { varItem = 12050009, probability = 4000,   special = 0, broad = 0, itemname = "极乐草" }, 
                                    { varItem = 11990012, probability = 3500,   special = 0, broad = 0, itemname = "五番令" }, 
                                    { varItem = 12010020, probability = 3000,  special = 0, broad = 0, itemname = "小生命清露" },
                                    { varItem = 11000800, probability = 3000,  special = 0, broad = 0, itemname = "离石剂" }, 
                                    { varItem = 12054300, probability = 3000,  special = 0, broad = 0, itemname = "还童书" }, 
                                    { varItem = 11000501, probability = 3000,  special = 0, broad = 0, itemname = "紫檀木炭" }, 
                                    { varItem = 11000902, probability = 3000,  special = 0, broad = 0, itemname = "高级洗石剂" }, 
                                    { varItem = 11000800, probability = 3000,  special = 0, broad = 0, itemname = "离石剂" }, 
                                    { varItem = 12030202, probability = 100,  special = 0, broad = 0, itemname = "江湖请柬" }, 
                                    { varItem = 12110207, probability = 100,  special = 0, broad = 0, itemname = "爱无止境" }, 
                                    { varItem = 12030200, probability = 100,  special = 0, broad = 0, itemname = "小喇叭" }, 
                                    { varItem = 11990110, probability = 100,  special = 0, broad = 0, itemname = "募集券" }, 
                                    { varItem = 12054301, probability = 90,  special = 0, broad = 0, itemname = "还龙书" }, 
                                    { varItem = 11000502, probability = 64,  special = 0, broad = 0, itemname = "黄紫水火水银" }, 
                                    { varItem = 11000504, probability = 55,  special = 0, broad = 0, itemname = "黄紫炫彩水银" },
                                    { varItem = 11000500, probability = 54,  special = 0, broad = 0, itemname = "黄紫海蓝水银" },
                                    { varItem = 11000503, probability = 33,  special = 0, broad = 0, itemname = "黄紫晕光水银" },
                                    { varItem = 10310028, probability = 2,  special = 0, broad = 1, itemname = "掌门牌：碰碰胡(30天)" }, 
                                    { varItem = 10310029, probability = 2,  special = 0, broad = 1, itemname = "掌门牌：清一色(30天)" },
}                                                                               














function x418147_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418147_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418147_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418147_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418147_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418147_ProcActivateOnce( varMap, varPlayer, varImpact )
    local day = GetDayOfYear()
    local last = GetPlayerGameData( varMap, varPlayer, MD_GUOZHI_DAY[ 1], MD_GUOZHI_DAY[ 2], MD_GUOZHI_DAY[ 3] )
    if day == last then
        if GetPlayerGameData( varMap, varPlayer, MD_GUOZHI_DAYCOUNT[ 1], MD_GUOZHI_DAYCOUNT[ 2], MD_GUOZHI_DAYCOUNT[ 3] ) >= 3 then
            Msg2Player(varMap, varPlayer, "您今天的使用次数已超过上限！",8,3)
            return
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_GUOZHI_DAYCOUNT[ 1], MD_GUOZHI_DAYCOUNT[ 2], MD_GUOZHI_DAYCOUNT[ 3], 0)
    end

    SetPlayerGameData( varMap, varPlayer, MD_GUOZHI_DAYCOUNT[ 1], MD_GUOZHI_DAYCOUNT[ 2], MD_GUOZHI_DAYCOUNT[ 3], GetPlayerGameData( varMap, varPlayer, MD_GUOZHI_DAYCOUNT[ 1], MD_GUOZHI_DAYCOUNT[ 2], MD_GUOZHI_DAYCOUNT[ 3] ) + 1)
    SetPlayerGameData( varMap, varPlayer, MD_GUOZHI_DAY[ 1], MD_GUOZHI_DAY[ 2], MD_GUOZHI_DAY[ 3], day)
    
	local lv = GetLevel(varMap, varPlayer)
		local money = 0
  if lv < 50 and lv >= 30 then
  	money = 5000
  elseif lv < 80 and lv >= 50 then
  	money = 10000
  elseif lv < 150 and lv >= 80 then
  	money = 18000
  else
  	return
  end 
	
	if lv < x418147_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足，无法打开礼包！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

  if GetBagSpace(varMap, varPlayer) < 1 then
      Msg2Player( varMap, varPlayer, "背包空间不足一格，无法打开果汁果乐幸运探索包", 8, 3)
      return
  end

	local varRand = random( 1, 100000)
    local varIndex = 1
    local varNum1 = 1
    local varNum2 = 1
    local giveitem = 11020502
    for varI, item in x418147_var_ItemTable do
        varNum1 = varNum1 + item.probability
        if varRand >= varNum2 and varRand < varNum1 then
            varIndex = varI
            break
        end
        varNum2 = varNum2 + item.probability
    end
    
			giveitem = x418147_var_ItemTable[ varIndex].varItem

	StartItemTask(varMap)
		ItemAppendBind( varMap, giveitem, 1)
		AddMoney( varMap, varPlayer, 1, money )
  	Msg2Player( varMap, varPlayer, format( "你获得了#R#{_MONEY%d}银卡。", money), 8, 2)
  	Msg2Player( varMap, varPlayer, format( "你获得了#R#{_MONEY%d}银卡。", money), 8, 3)

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
			if(DepletingUsedItem(varMap, varPlayer)) == 1 then
					StartTalkTask(varMap)
						TalkAppendString(varMap,"打开果汁果乐幸运探索包，获得了礼品")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					DeliverItemListSendToPlayer(varMap,varPlayer)
	
	    
		    if x418147_var_ItemTable[ varIndex].broad == 1 then
		        LuaAllScenceM2Wrold( varMap, format( "恭喜玩家%s打开汇源活动礼包获得了#{_ITEM%d}", GetName( varMap, varPlayer), giveitem), 5, 1)
		    end
	
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"打开果汁果乐幸运探索包异常！")
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







function x418147_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
