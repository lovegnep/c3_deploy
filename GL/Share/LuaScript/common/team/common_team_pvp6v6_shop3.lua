
x303014_var_FileId          		= 303014
x303014_var_Leader_Index      		= 5
x303014_var_QuestName       		="减伤商店"


x303014_var_BuffList					= {

										{varTalkNpcGUID=170003,varName = "长生天的庇护1级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害100点", type=0,levelmin = 10,levelmax = 79, bufId = 7934,price=750, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的庇护2级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害400点", type=0,levelmin = 10,levelmax = 79, bufId = 7935,price=1500,tab={1}},    
										{varTalkNpcGUID=170003,varName = "长生天的庇护3级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害600点",type=0,levelmin = 10,levelmax = 79, bufId = 7936,price=2250,tab={1,2}},  
										{varTalkNpcGUID=170003,varName = "长生天的庇护4级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害800点",type=0,levelmin = 10,levelmax = 79, bufId = 7937,price=3000,tab={1,2,3}},

										{varTalkNpcGUID=170003,varName = "长生天的庇护1级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害200点", type=0,levelmin = 80,levelmax = 99, bufId = 7938,price=750, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的庇护2级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害800点", type=0,levelmin = 80,levelmax = 99, bufId = 7939,price=1500,tab={5}},    
										{varTalkNpcGUID=170003,varName = "长生天的庇护3级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害1200点",type=0,levelmin = 80,levelmax = 99, bufId = 7940,price=2250,tab={5,6}},  
										{varTalkNpcGUID=170003,varName = "长生天的庇护4级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害1600点",type=0,levelmin = 80,levelmax = 99, bufId = 7941,price=3000,tab={5,6,7}},

										{varTalkNpcGUID=170003,varName = "长生天的庇护1级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害250点", type=0,levelmin = 100,levelmax = 161, bufId = 7942,price=750, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的庇护2级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害1000点", type=0,levelmin = 100,levelmax = 161, bufId = 7943,price=1500,tab={9}},    
										{varTalkNpcGUID=170003,varName = "长生天的庇护3级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害1500点",type=0,levelmin = 100,levelmax = 161, bufId = 7944,price=2250,tab={9,10}},  
										{varTalkNpcGUID=170003,varName = "长生天的庇护4级（减伤）", varMsg = "\n减少战场对方箭塔及士兵对玩家造成的特殊伤害2000点",type=0,levelmin = 100,levelmax = 161, bufId = 7945,price=3000,tab={9,10,11}},

									  }
									  
x303014_var_ShowListFormatEnough		= "%s\n#W需要#G%d#W战场货币"
x303014_var_FirstMessage				= "您要点什么吗?"
x303014_var_BoughtMessage				= "恭喜，您购买完成!"
x303014_var_BoughtMessageFailed		= "\n#R购买失败，您的战场货币不足！"
x303014_var_BoughtMessageBagError		= "\n#R购买失败，您的背包空间不足！"




function x303014_RefreshBufList( varMap,varPlayer,varTalknpc)

	local priceproc = function(varMap,varPlayer,varIndex) return (x303014_var_BuffList[varIndex].price - x303014_FixPrice( varMap,varPlayer,varIndex )) end
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
    local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
    for varI,itm in x303014_var_BuffList do
    	if nNpcGUID == itm.varTalkNpcGUID and LuaCallNoclosure(303006,"CheckLevelRange",varMap,itm.levelmin,itm.levelmax) == 1 then
    		if nHaveBattleMoney < priceproc(varMap,varPlayer,varI) then
    			TalkAppendButton(varMap,x303014_var_FileId,"#R"..itm.varName,3,varI);
    		else
	    		TalkAppendButton(varMap,x303014_var_FileId,"#S"..itm.varName,3,varI);
	    	end
    	end
    end
    
end




function x303014_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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
	
	
	TalkAppendButton(varMap,x303014_var_FileId,x303014_var_QuestName,3,x303014_var_FileId);
	
end




function x303014_FixPrice( varMap,varPlayer,varIndex )

	local varCount = getn(x303014_var_BuffList)
	if varIndex <= 0 or varIndex > varCount then
		return 0
	end
	
	local item = x303014_var_BuffList[varIndex]
	for varI,itm in item.tab do
		if IsHaveSpecificImpact(varMap,varPlayer,x303014_var_BuffList[itm].bufId ) == 1 then
			return x303014_var_BuffList[itm].price*0.8
		end
	end
	
	return 0
		
end




function x303014_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
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
	
	
	
	if idExt == x303014_var_FileId then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x303014_var_FirstMessage);
			x303014_RefreshBufList( varMap,varPlayer,varTalknpc)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	if idExt > 100 then
		
		idExt = idExt - 100
		
		
		local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if nNpcGUID ~= x303014_var_BuffList[idExt].varTalkNpcGUID then
			return
		end
		
		if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303014_var_BuffList[idExt].levelmin,x303014_var_BuffList[idExt].levelmax) ~= 1 then
			return
		end

		
		
		StartTalkTask(varMap)
			local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
			local nFixedPrice = x303014_var_BuffList[idExt].price - x303014_FixPrice( varMap,varPlayer,idExt )
			if nHaveBattleMoney >= nFixedPrice then
			
				if x303014_var_BuffList[idExt].type == 0 then
				
					
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x303014_var_BuffList[idExt].bufId,0)
					LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
					
					
					TalkAppendString(varMap,x303014_var_BoughtMessage);
				elseif x303014_var_BuffList[idExt].type == 1 then
					
					StartItemTask(varMap)
					ItemAppendBind(varMap,x303014_var_BuffList[idExt].bufId,1)			
					local varRet =  StopItemTask(varMap,varPlayer)
					if varRet > 0 then
						LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
		  				DeliverItemListSendToPlayer(varMap,varPlayer)
		  				
		  				
						TalkAppendString(varMap,x303014_var_BoughtMessage);
		  			else
		  				TalkAppendString(varMap, x303014_var_BoughtMessageBagError);
		  			end
				end
				
			else
				
				TalkAppendString(varMap,format(x303014_var_ShowListFormatEnough,x303014_var_BuffList[idExt].varName,x303014_var_BuffList[idExt].price))
				TalkAppendString(varMap, x303014_var_BoughtMessageFailed);		
			end
			
			
			
	    StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return
	end
	
	
	local varCount = getn(x303014_var_BuffList)
	if idExt < 1 or idExt > varCount then
		return 
	end
	
	
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if nNpcGUID ~= x303014_var_BuffList[idExt].varTalkNpcGUID then
			return
	end
	
	
	if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303014_var_BuffList[idExt].levelmin,x303014_var_BuffList[idExt].levelmax) ~= 1 then

		return
	end
	
	
	StartTalkTask(varMap)
		local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
		local nFixedPrice = x303014_var_BuffList[idExt].price - x303014_FixPrice( varMap,varPlayer,idExt )
		if nHaveBattleMoney >= nFixedPrice then
		
			if x303014_var_BuffList[idExt].type == 0 then
		
				TalkAppendString(varMap,format(x303014_var_ShowListFormatEnough,x303014_var_BuffList[idExt].varName,nFixedPrice))
				TalkAppendString(varMap,x303014_var_BuffList[idExt].varMsg);
			else
				TalkAppendString(varMap,format(x303014_var_ShowListFormatEnough,x303014_var_BuffList[idExt].varName,nFixedPrice))
				TalkAppendString(varMap,x303014_var_BuffList[idExt].varMsg);
			end
			TalkAppendButton(varMap,x303014_var_FileId,"确定..",3,idExt + 100 );

		else
			TalkAppendString(varMap,format(x303014_var_ShowListFormatEnough,x303014_var_BuffList[idExt].varName,nFixedPrice))
			TalkAppendString(varMap, x303014_var_BoughtMessageFailed);
		end
		
		
		
    StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x303014_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303014_ProcAccept( varMap, varPlayer )
end




function x303014_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303014_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303014_CheckSubmit( varMap, varPlayer )
end




function x303014_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303014_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303014_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303014_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
