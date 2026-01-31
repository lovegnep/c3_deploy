
--新年快乐大礼包





x310928_var_FileId = 310928 
x310928_var_ItemList = {
                                    {       
                                      { varId = 12030803, varName="梦魇龙王降世符"          	, probability =1   },      
                                      { varId = 12030512, varName="掌门牌:清一色（7天）礼包"  , probability =8  },      
                                      { varId = 12030511, varName="掌门牌碰碰胡（7天）礼包"   , probability =8  },      
                                      { varId = 12030203, varName="朝廷请柬"                  , probability =3  },
                                 
                                      { varId = 12030031, varName="神行符"             				, probability =8 },      
                                      { varId = 12030503, varName="掌门牌：平胡（7天）礼包" 	, probability =3 },      
                                      { varId = 12030202, varName="江湖请柬"            			, probability =9 },      
                                      { varId = 12010021, varName="中生命清露"          			, probability =9 },      
                                      { varId = 12030258, varName="全福月饼"            			, probability =9 },      
                                      { varId = 11000552, varName="完美星辰"            			, probability =3 },      
                                      { varId = 12240002, varName="优质符文布"          			, probability =3 }, 
                                      { varId = 11000304, varName="残破的神兵之魂"            , probability =1    },   
                                      { varId = 11970023, varName="黄金乱士符"                , probability =15    },
                                      { varId = 11000949, varName="优质地中海尖凿"            , probability =20    }
                                    },                                            
                                    {                                             
                                      
                                      { varId = 11990110, varName="募集券"              			, probability =5  },     
                                      { varId = 11000902, varName="高级洗石剂"          			, probability =5  },     
                                      { varId = 12030200, varName="小喇叭"              			, probability =10 },     
                                      { varId = 12110207, varName="爱无止境"            			, probability =10  },     
                                      { varId = 12260001, varName="美容秘方"            			, probability =5  },     
                                      { varId = 11010001, varName="一级皇家秘银"        			, probability =5  },     
                                      { varId = 12010020, varName="小生命清露"          			, probability =20 },     
                                      { varId = 12041102, varName="天赋丹"              			, probability =5  },     
                                      { varId = 11990100, varName="混沌之星"            			, probability =5  },     
                                      { varId = 12030022, varName="龙首残骸"            			, probability =5  },     
                                      { varId = 12030023, varName="龙身残骸"            			, probability =5  },     
                                      { varId = 12030024, varName="龙爪残骸"            			, probability =5  },     
                                      { varId = 12030025, varName="龙尾残骸"            			, probability =5  },     
                                      { varId = 11000544, varName="蓝光火石"            			, probability =5  },     
                                    
                                      { varId = 11000501, varName="紫檀木炭"            			, probability =10 },     
                                      { varId = 12041101, varName="修行草"              			, probability =10 },     
                                      { varId = 12041108, varName="荣誉之星"            			, probability =10 },     
                                      { varId = 12054300, varName="还童书"              			, probability =10 },     
                                      { varId = 12035002, varName="魔君部将召唤符"      			, probability =10 },     
                                      { varId = 12030218, varName="强效练功人偶"        			, probability =10 },     
                                      { varId = 11000800, varName="离石剂"              			, probability =10 },     
                                      
                                      { varId = 11000550, varName="微瑕星辰"            			, probability =15 },     
                                      { varId = 12030201, varName="修理石"              			, probability =20 },     
                                      { varId = 12030213, varName="强效极乐草"          			, probability =20 },     
                                      { varId = 12030211, varName="师恩难谢"            			, probability =20 },     
                                      { varId = 12030018, varName="蒙面巾"              			, probability =20 },     
                                      { varId = 12030012, varName="路易十三"            			, probability =20 },     
                                      { varId = 11990015, varName="藏宝令"              			, probability =30 },     
                                      { varId = 12041103, varName="活力丹"              			, probability =30 },     
                                      { varId = 11990400, varName="融合剂"              			, probability =30 },     
                                      { varId = 12030011, varName="杰克丹尼"            			, probability =30 },     
                                   
                                      { varId = 11990050, varName="回魂丹"              			, probability =100 },     
                                      { varId = 12030217, varName="练功人偶"            			, probability =100 },     
                                      { varId = 12030043, varName="千里镜"              			, probability =100 },     
                                      { varId = 12110206, varName="钟情一生"            			, probability =100 },     
                                       
                                      { varId = 11990117, varName="嘉年华娱乐币"        			, probability =100 },     
                                     
                                    },                                  
}                                                                    

                                                                     
                                                                     



function x310928_ProcEventEntry( varMap, varPlayer, varBagIdx )         

end                                                                  
                                                                     





function x310928_ProcIsSpellLikeScript( varMap, varPlayer)                 
	return 1; 
end






function x310928_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310928_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x310928_ProcDeplete( varMap, varPlayer )
	return 1;
end




function x310928_ProcAddItemByRandom(varMap, varPlayer)

	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil         
   	local i0 = random(1,1000)     
	  if 100 >= i0 then     
		local allitem = x310928_var_ItemList[ 1 ]
		local probability = random(1,100)
	  for varI, iter in allitem do
        Max = Max + iter.probability
        if probability >= Min and probability < Max then
            item = iter.varId
						 varName = iter.varName
           
            break


        end
        
    end
  else 
    local allitem1 = x310928_var_ItemList[ 2 ]
		local probability = random(1,900)
	  for varI, iter in allitem1 do
        Max = Max + iter.probability
        if probability >= Min and probability < Max then
            item = iter.varId
            varName = iter.varName
            break
        end
    end
		end
		
    x310928_ProcAddItem(varMap, varPlayer, item ,varName) 
	end
	


function x310928_ProcAddItem(varMap, varPlayer, varItem ,iname)                               
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
			local varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", 12041233,varItem)
			if varItem == 12030803 or varItem == 12030203 or varItem == 11000552 or varItem == 11000304 or varItem == 11970023 or varItem == 11000949 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."使用新年快乐大礼包获得1个"..iname)
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








function x310928_ProcActivateOnce( varMap, varPlayer, varImpact )   
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end		
		x310928_ProcAddItemByRandom(varMap, varPlayer)
	
end







function x310928_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
