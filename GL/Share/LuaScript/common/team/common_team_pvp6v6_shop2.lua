
x303013_var_FileId          		= 303013
x303013_var_Leader_Index      		= 5
x303013_var_QuestName       		="防御商店"


x303013_var_BuffList					= {

										{varTalkNpcGUID=170003,varName = "长生天的守护1级（防御）", varMsg = "\n提高玩家防御100点", type=0,levelmin = 10,levelmax = 79, bufId = 7922,price=750, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的守护2级（防御）", varMsg = "\n提高玩家防御400点", type=0,levelmin = 10,levelmax = 79, bufId = 7923,price=1500,tab={1}},     
										{varTalkNpcGUID=170003,varName = "长生天的守护3级（防御）", varMsg = "\n提高玩家防御600点", type=0,levelmin = 10,levelmax = 79, bufId = 7924,price=2250,tab={1,2}},   
										{varTalkNpcGUID=170003,varName = "长生天的守护4级（防御）", varMsg = "\n提高玩家防御800点", type=0,levelmin = 10,levelmax = 79, bufId = 7925,price=3000,tab={1,2,3}}, 

										{varTalkNpcGUID=170003,varName = "长生天的守护1级（防御）", varMsg = "\n提高玩家防御200点", type=0,levelmin = 80,levelmax = 99, bufId = 7926,price=750, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的守护2级（防御）", varMsg = "\n提高玩家防御800点", type=0,levelmin = 80,levelmax = 99, bufId = 7927,price=1500,tab={5}},     
										{varTalkNpcGUID=170003,varName = "长生天的守护3级（防御）", varMsg = "\n提高玩家防御1200点", type=0,levelmin = 80,levelmax = 99, bufId = 7928,price=2250,tab={5,6}},   
										{varTalkNpcGUID=170003,varName = "长生天的守护4级（防御）", varMsg = "\n提高玩家防御1600点", type=0,levelmin = 80,levelmax = 99, bufId = 7929,price=3000,tab={5,6,7}}, 

										{varTalkNpcGUID=170003,varName = "长生天的守护1级（防御）", varMsg = "\n提高玩家防御275点", type=0,levelmin = 100,levelmax = 161, bufId = 7930,price=750, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的守护2级（防御）", varMsg = "\n提高玩家防御1100点", type=0,levelmin = 100,levelmax = 161, bufId = 7931,price=1500,tab={9}},     
										{varTalkNpcGUID=170003,varName = "长生天的守护3级（防御）", varMsg = "\n提高玩家防御1650点", type=0,levelmin = 100,levelmax = 161, bufId = 7932,price=2250,tab={9,10}},   
										{varTalkNpcGUID=170003,varName = "长生天的守护4级（防御）", varMsg = "\n提高玩家防御2200点", type=0,levelmin = 100,levelmax = 161, bufId = 7933,price=3000,tab={9,10,11}}, 

									  }
									  
x303013_var_ShowListFormatEnough		= "%s\n#W需要#G%d#W战场货币"
x303013_var_FirstMessage				= "您要点什么吗?"
x303013_var_BoughtMessage				= "恭喜，您购买完成!"
x303013_var_BoughtMessageFailed		= "\n#R购买失败，您的战场货币不足！"
x303013_var_BoughtMessageBagError		= "\n#R购买失败，您的背包空间不足！"




function x303013_RefreshBufList( varMap,varPlayer,varTalknpc)

	local priceproc = function(varMap,varPlayer,varIndex) return (x303013_var_BuffList[varIndex].price - x303013_FixPrice( varMap,varPlayer,varIndex )) end
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
    local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
    for varI,itm in x303013_var_BuffList do
    	if nNpcGUID == itm.varTalkNpcGUID and LuaCallNoclosure(303006,"CheckLevelRange",varMap,itm.levelmin,itm.levelmax) == 1 then
	    	if nHaveBattleMoney < priceproc(varMap,varPlayer,varI) then
    			TalkAppendButton(varMap,x303013_var_FileId,"#R"..itm.varName,3,varI);
    		else
	    		TalkAppendButton(varMap,x303013_var_FileId,"#S"..itm.varName,3,varI);
	    	end
    	end
    end
    
end




function x303013_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleSceneType",varMap) < 0 then
		return
	end
	
	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"IsBattleSceneValid",varMap) ~= 1 then
		return
	end
	
	
	TalkAppendButton(varMap,x303013_var_FileId,x303013_var_QuestName,3,x303013_var_FileId);
	
end




function x303013_FixPrice( varMap,varPlayer,varIndex )

	local varCount = getn(x303013_var_BuffList)
	if varIndex <= 0 or varIndex > varCount then
		return 0
	end
	
	local item = x303013_var_BuffList[varIndex]
	for varI,itm in item.tab do
		if IsHaveSpecificImpact(varMap,varPlayer,x303013_var_BuffList[itm].bufId ) == 1 then
			return x303013_var_BuffList[itm].price*0.8
		end
	end
	
	return 0
		
end




function x303013_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
    if GetMergeDBToggle() == 1 then
        return
    end
  
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end

	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleSceneType",varMap) < 0 then
		return
	end
	
	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"IsBattleSceneValid",varMap) ~= 1 then
		return
	end
	
	
	
	if idExt == x303013_var_FileId then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x303013_var_FirstMessage);
			x303013_RefreshBufList( varMap,varPlayer,varTalknpc)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	if idExt > 100 then
		
		idExt = idExt - 100
		
		
		local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if nNpcGUID ~= x303013_var_BuffList[idExt].varTalkNpcGUID then
			return
		end
		
		if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303013_var_BuffList[idExt].levelmin,x303013_var_BuffList[idExt].levelmax) ~= 1 then
			return
		end
		

		
		
		StartTalkTask(varMap)
			local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
			local nFixedPrice = x303013_var_BuffList[idExt].price - x303013_FixPrice( varMap,varPlayer,idExt )
			if nHaveBattleMoney >= nFixedPrice then
			
				if x303013_var_BuffList[idExt].type == 0 then
				
					
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x303013_var_BuffList[idExt].bufId,0)
					LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
					
					
					TalkAppendString(varMap,x303013_var_BoughtMessage);
				elseif x303013_var_BuffList[idExt].type == 1 then
					
					StartItemTask(varMap)
					ItemAppendBind(varMap,x303013_var_BuffList[idExt].bufId,1)			
					local varRet =  StopItemTask(varMap,varPlayer)
					if varRet > 0 then
						LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
		  				DeliverItemListSendToPlayer(varMap,varPlayer)
		  				
		  				
						TalkAppendString(varMap,x303013_var_BoughtMessage);
		  			else
		  				TalkAppendString(varMap, x303013_var_BoughtMessageBagError);
		  			end
				end
				
			else
				
				TalkAppendString(varMap,format(x303013_var_ShowListFormatEnough,x303013_var_BuffList[idExt].varName,x303013_var_BuffList[idExt].price))
				TalkAppendString(varMap, x303013_var_BoughtMessageFailed);		
			end
			
			
			
	    StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return
	end
	
	
	local varCount = getn(x303013_var_BuffList)
	if idExt < 1 or idExt > varCount then
		return 
	end
	
	
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if nNpcGUID ~= x303013_var_BuffList[idExt].varTalkNpcGUID then
			return
	end
	
	
	if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303013_var_BuffList[idExt].levelmin,x303013_var_BuffList[idExt].levelmax) ~= 1 then

		return
	end
	
	
	StartTalkTask(varMap)
		local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
		local nFixedPrice = x303013_var_BuffList[idExt].price - x303013_FixPrice( varMap,varPlayer,idExt )
		if nHaveBattleMoney >= nFixedPrice then
		
			if x303013_var_BuffList[idExt].type == 0 then
		
				TalkAppendString(varMap,format(x303013_var_ShowListFormatEnough,x303013_var_BuffList[idExt].varName,nFixedPrice))
				TalkAppendString(varMap,x303013_var_BuffList[idExt].varMsg);
			else
				TalkAppendString(varMap,format(x303013_var_ShowListFormatEnough,x303013_var_BuffList[idExt].varName,nFixedPrice))
				TalkAppendString(varMap,x303013_var_BuffList[idExt].varMsg);
			end
			TalkAppendButton(varMap,x303013_var_FileId,"确定..",3,idExt + 100 );

		else
			TalkAppendString(varMap,format(x303013_var_ShowListFormatEnough,x303013_var_BuffList[idExt].varName,nFixedPrice))
			TalkAppendString(varMap, x303013_var_BoughtMessageFailed);
		end
		
		
		
    StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x303013_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303013_ProcAccept( varMap, varPlayer )
end




function x303013_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303013_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303013_CheckSubmit( varMap, varPlayer )
end




function x303013_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303013_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303013_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303013_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
