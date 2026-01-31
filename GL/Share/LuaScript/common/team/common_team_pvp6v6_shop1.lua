
x303012_var_FileId          		= 303012
x303012_var_Leader_Index      		= 5
x303012_var_QuestName       		="攻击商店"


x303012_var_BuffList					= {

										{varTalkNpcGUID=170003,varName = "长生天的力量1级（攻击）", varMsg = "\n提高玩家攻击200点", type=0, levelmin = 10,levelmax = 79,bufId = 7910,price=500, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的力量2级（攻击）", varMsg = "\n提高玩家攻击800点", type=0, levelmin = 10,levelmax = 79,bufId = 7911,price=1000,tab={1}},
										{varTalkNpcGUID=170003,varName = "长生天的力量3级（攻击）", varMsg = "\n提高玩家攻击1200点", type=0, levelmin = 10,levelmax = 79,bufId = 7912,price=1500,tab={1,2}},
										{varTalkNpcGUID=170003,varName = "长生天的力量4级（攻击）", varMsg = "\n提高玩家攻击1600点",type=0, levelmin = 10,levelmax = 79,bufId = 7913,price=2000,tab={1,2,3}},

										{varTalkNpcGUID=170003,varName = "长生天的力量1级（攻击）", varMsg = "\n提高玩家攻击350点", type=0, levelmin = 80,levelmax = 99,bufId = 7914,price=500, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的力量2级（攻击）", varMsg = "\n提高玩家攻击1400点", type=0, levelmin = 80,levelmax = 99,bufId = 7915,price=1000,tab={5}},
										{varTalkNpcGUID=170003,varName = "长生天的力量3级（攻击）", varMsg = "\n提高玩家攻击2100点", type=0, levelmin = 80,levelmax = 99,bufId = 7916,price=1500,tab={5,6}},
										{varTalkNpcGUID=170003,varName = "长生天的力量4级（攻击）", varMsg = "\n提高玩家攻击2800点",type=0, levelmin = 80,levelmax = 99,bufId = 7917,price=2000,tab={5,6,7}},

										{varTalkNpcGUID=170003,varName = "长生天的力量1级（攻击）", varMsg = "\n提高玩家攻击475点", type=0, levelmin = 100,levelmax = 161,bufId = 7918,price=500, tab={}},
										{varTalkNpcGUID=170003,varName = "长生天的力量2级（攻击）", varMsg = "\n提高玩家攻击1900点", type=0, levelmin = 100,levelmax = 161,bufId = 7919,price=1000,tab={9}},
										{varTalkNpcGUID=170003,varName = "长生天的力量3级（攻击）", varMsg = "\n提高玩家攻击2850点", type=0, levelmin = 100,levelmax = 161,bufId = 7920,price=1500,tab={9,10}},
										{varTalkNpcGUID=170003,varName = "长生天的力量4级（攻击）", varMsg = "\n提高玩家攻击3800点",type=0, levelmin = 100,levelmax = 161,bufId = 7921,price=2000,tab={9,10,11}},

									  }
									  
x303012_var_ShowListFormatEnough		= "%s\n#W需要#G%d#W战场货币"
x303012_var_FirstMessage				= "您要点什么吗?"
x303012_var_BoughtMessage				= "恭喜，您购买完成!"
x303012_var_BoughtMessageFailed		= "\n#R购买失败，您的战场货币不足！"
x303012_var_BoughtMessageBagError		= "\n#R购买失败，您的背包空间不足！"





function x303012_RefreshBufList( varMap,varPlayer,varTalknpc)
	
	local priceproc = function(varMap,varPlayer,varIndex) return (x303012_var_BuffList[varIndex].price - x303012_FixPrice( varMap,varPlayer,varIndex )) end

	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
    local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
    for varI,itm in x303012_var_BuffList do
    	if nNpcGUID == itm.varTalkNpcGUID and LuaCallNoclosure(303006,"CheckLevelRange",varMap,itm.levelmin,itm.levelmax) == 1 then
	    	if nHaveBattleMoney < priceproc(varMap,varPlayer,varI) then
    			TalkAppendButton(varMap,x303012_var_FileId,"#R"..itm.varName,3,varI);
    		else
	    		TalkAppendButton(varMap,x303012_var_FileId,"#S"..itm.varName,3,varI);
	    	end
    	end
    end
    
end




function x303012_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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
	
	
	TalkAppendButton(varMap,x303012_var_FileId,x303012_var_QuestName,3,x303012_var_FileId);
	
end




function x303012_FixPrice( varMap,varPlayer,varIndex )

	local varCount = getn(x303012_var_BuffList)
	if varIndex <= 0 or varIndex > varCount then
		return 0
	end
	
	local item = x303012_var_BuffList[varIndex]
	for varI,itm in item.tab do
		if IsHaveSpecificImpact(varMap,varPlayer,x303012_var_BuffList[itm].bufId ) == 1 then
			return x303012_var_BuffList[itm].price*0.8
		end
	end
	
	return 0
		
end




function x303012_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
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
	
	
	
	if idExt == x303012_var_FileId then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x303012_var_FirstMessage);
			x303012_RefreshBufList( varMap,varPlayer,varTalknpc)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	if idExt > 100 then
		
		idExt = idExt - 100
		
		
		local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if nNpcGUID ~= x303012_var_BuffList[idExt].varTalkNpcGUID then
			return
		end
		
		
		if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303012_var_BuffList[idExt].levelmin,x303012_var_BuffList[idExt].levelmax) ~= 1 then
			return
		end
		
		
		StartTalkTask(varMap)
			local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
			local nFixedPrice = x303012_var_BuffList[idExt].price - x303012_FixPrice( varMap,varPlayer,idExt )
			if nHaveBattleMoney >= nFixedPrice then
			
				if x303012_var_BuffList[idExt].type == 0 then
				
					
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x303012_var_BuffList[idExt].bufId,0)
					LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
					
					
					TalkAppendString(varMap,x303012_var_BoughtMessage);
				elseif x303012_var_BuffList[idExt].type == 1 then
					
					StartItemTask(varMap)
					ItemAppendBind(varMap,x303012_var_BuffList[idExt].bufId,1)			
					local varRet =  StopItemTask(varMap,varPlayer)
					if varRet > 0 then
						LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
		  				DeliverItemListSendToPlayer(varMap,varPlayer)
		  				
		  				
						TalkAppendString(varMap,x303012_var_BoughtMessage);
		  			else
		  				TalkAppendString(varMap, x303012_var_BoughtMessageBagError);
		  			end
				end
				
			else
				
				TalkAppendString(varMap,format(x303012_var_ShowListFormatEnough,x303012_var_BuffList[idExt].varName,x303012_var_BuffList[idExt].price))
				TalkAppendString(varMap, x303012_var_BoughtMessageFailed);		
			end
			
			
			
	    StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return
	end
	
	
	local varCount = getn(x303012_var_BuffList)
	if idExt < 1 or idExt > varCount then
		return 
	end
	
	
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if nNpcGUID ~= x303012_var_BuffList[idExt].varTalkNpcGUID then
		return
	end
	
	
	if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303012_var_BuffList[idExt].levelmin,x303012_var_BuffList[idExt].levelmax) ~= 1 then
		return
	end
	
	
	StartTalkTask(varMap)
		local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
		local nFixedPrice = x303012_var_BuffList[idExt].price - x303012_FixPrice( varMap,varPlayer,idExt )
		if nHaveBattleMoney >= nFixedPrice then
		
			if x303012_var_BuffList[idExt].type == 0 then
		
				TalkAppendString(varMap,format(x303012_var_ShowListFormatEnough,x303012_var_BuffList[idExt].varName,nFixedPrice))
				TalkAppendString(varMap,x303012_var_BuffList[idExt].varMsg);
			else
				TalkAppendString(varMap,format(x303012_var_ShowListFormatEnough,x303012_var_BuffList[idExt].varName,nFixedPrice))
				TalkAppendString(varMap,x303012_var_BuffList[idExt].varMsg);
			end
			TalkAppendButton(varMap,x303012_var_FileId,"确定..",3,idExt + 100 );

		else
			TalkAppendString(varMap,format(x303012_var_ShowListFormatEnough,x303012_var_BuffList[idExt].varName,nFixedPrice))
			TalkAppendString(varMap, x303012_var_BoughtMessageFailed);
		end
		
		
		
    StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x303012_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303012_ProcAccept( varMap, varPlayer )
end




function x303012_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303012_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303012_CheckSubmit( varMap, varPlayer )
end




function x303012_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303012_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303012_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303012_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
