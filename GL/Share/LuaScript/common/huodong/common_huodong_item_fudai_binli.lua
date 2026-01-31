






x310930_var_FileId = 310930 
x310930_var_ItemList = {
                                      { varId = 12030056, varName="金砂"               , probability =8000  },      
                                      { varId = 12030057, varName="金条"               , probability =2000  },      
                                      { varId = 12030058, varName="金元宝"             , probability =1000  },      
                                      { varId = 12030059, varName="金砖"               , probability =200   },      
                                      { varId = 11990015, varName="藏宝令"             , probability =5000  },      
                                      { varId = 12041103, varName="活力丹"             , probability =5000  },      
                                      { varId = 11000550, varName="微瑕星辰"           , probability =6000  },      
                                      { varId = 11000552, varName="完美星辰"           , probability =400   },      
                                      { varId = 12030511, varName="掌门牌碰碰胡（7天）礼包", probability =140   },      
                                      { varId = 11990110, varName="募集券"             , probability =1000  },      
                                      { varId = 11000501, varName="紫檀木炭"           , probability =4000  },      
                                      { varId = 11000902, varName="高级洗石剂"         , probability =4000  },      
                                      { varId = 12041101, varName="修行草"             , probability =4000  },      
                                      { varId = 12030202, varName="江湖请柬"           , probability =600   },      
                                      { varId = 12030203, varName="朝廷请柬"           , probability =100   },                                        
                                      { varId = 12030201, varName="修理石"             , probability =5000  },     
                                      { varId = 12030213, varName="强效极乐草"         , probability =5000  },     
                                      { varId = 11990400, varName="融合剂"             , probability =4000  },     
                                      { varId = 11990050, varName="回魂丹"             , probability =6000  },     
                                      { varId = 12030217, varName="练功人偶"           , probability =4000  },     
                                      { varId = 12030043, varName="千里镜"             , probability =4000  },     
                                      { varId = 12041108, varName="荣誉之星"           , probability =6000  },     
                                      { varId = 12030031, varName="神行符"             , probability =2000  },     
                                      { varId = 12030018, varName="蒙面巾"             , probability =6000  },     
                                      { varId = 12110207, varName="爱无止境"           , probability =2000  },     
                                      { varId = 12054300, varName="还童书"             , probability =6000  },     
                                      { varId = 12030218, varName="强效练功人偶"       , probability =2000  },     
                                      { varId = 12030503, varName="掌门牌：平胡（7天）礼包", probability =200   },     
                                      { varId = 11010001, varName="一级皇家秘银"       , probability =4000  },     
                                      { varId = 11000800, varName="离石剂"             , probability =4000  },     
                                      { varId = 12041102, varName="天赋丹"             , probability =4000  },     
                                      { varId = 12030504, varName="熊猫降世符礼包"         , probability =1     },     
                                      { varId = 11990117, varName="嘉年华娱乐币"       , probability =4000  },     
                                      { varId = 12030016, varName="队伍召集令"         , probability =4000  },     
                                      { varId = 12030022, varName="龙首残骸"           , probability =1000  },     
                                      { varId = 12030023, varName="龙身残骸"           , probability =1000  },     
                                      { varId = 12030024, varName="龙爪残骸"           , probability =1000  },     
                                      { varId = 12030025, varName="龙尾残骸"           , probability =1000  },     
                                      { varId = 12030258, varName="全福月饼"           , probability =2219  },     
                                      { varId = 12030512, varName="掌门牌:清一色(7天) 礼包", probability =100   },     
                                      { varId = 12041109, varName="混元丹"             , probability =4000  },     
                                      { varId = 12041097, varName="生命琼浆"           , probability =4000  },     
                                      { varId = 12041110, varName="一级碎甲丸"         , probability =6000  },     
                                      { varId = 12041111, varName="一级穿甲丸"         , probability =6000  },     
                                      { varId = 12041112, varName="一级熔甲丸"         , probability =6000  },     
                                      { varId = 11000544, varName="蓝光火石"           , probability =4000  },     
                                      { varId = 12041090, varName="免伤神水"           , probability =10000 },     
                                      { varId = 12041091, varName="极速神水"           , probability =10000 },     
                                      { varId = 12041092, varName="暴击神水"           , probability =10000 },     
                                      { varId = 12041093, varName="命中神水"           , probability =10000 },     
                                      { varId = 12041094, varName="无敌神水"           , probability =10000 },     
                                      { varId = 11000300, varName="灵魂印"             , probability =40    },                                     
}
                                                                     
                                                                     



function x310930_ProcEventEntry( varMap, varPlayer, varBagIdx )         

end                                                                  
                                                                     





function x310930_ProcIsSpellLikeScript( varMap, varPlayer)                 
	return 1; 
end






function x310930_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310930_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x310930_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x310930_ProcAddItemByRandom(varMap, varPlayer)
	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil         
         
		local allitem = x310930_var_ItemList
		local probability = random(1,200000)
	  for varI, iter in allitem do
        Max = Max + iter.probability
        if probability >= Min and probability < Max then
            item = iter.varId
						 varName = iter.varName
            break
        end
    end
	x310930_ProcAddItem(varMap, varPlayer, item ,varName) 
end

function x310930_ProcAddItem(varMap, varPlayer, varItem ,iname)                               
  local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)

	StartItemTask(varMap)   
	if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,varItem, 1 )	
	else
		ItemAppendBind( varMap,varItem, 1 )
	end	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", 12035212,varItem)
			if varItem == 12030059 or varItem == 12030511 or varItem == 12030203 or varItem == 12030503 or varItem == 12030504 or varItem == 12030512 or varItem == 11000300 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."打开宾利大礼包获得了"..iname)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(varMap,varStr)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
      
      GamePlayScriptLog( varMap, varPlayer, 2503)			
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end








function x310930_ProcActivateOnce( varMap, varPlayer, varImpact )   
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end		
		x310930_ProcAddItemByRandom(varMap, varPlayer)
	
end







function x310930_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
