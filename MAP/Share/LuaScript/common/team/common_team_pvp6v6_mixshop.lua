
x303010_var_FileId          		= 303010
x303010_var_Leader_Index      		= 5
x303010_var_QuestName       		="合成商店"


x303010_var_BuffList					= {
										
										{varTalkNpcGUID=170005,varName = "天神下凡1级（合成）", varMsg = "\n需要长生天的力量1级、长生天的守护1级、长生天的庇护1级。合成后的天神下凡1级兼备以上三个1级属性的效果！", levelmin = 10,levelmax = 79,buffrom={7910,7922,7934},bufto = 7958,price=1000},
										{varTalkNpcGUID=170005,varName = "天神下凡2级（合成）", varMsg = "\n需要长生天的力量2级、长生天的守护2级、长生天的庇护2级。合成后的天神下凡2级兼备以上三个2级属性的效果！", levelmin = 10,levelmax = 79,buffrom={7911,7923,7935},bufto = 7959,price=2000},
										{varTalkNpcGUID=170005,varName = "天神下凡3级（合成）", varMsg = "\n需要长生天的力量3级、长生天的守护3级、长生天的庇护3级。合成后的天神下凡3级兼备以上三个3级属性的效果！", levelmin = 10,levelmax = 79,buffrom={7912,7924,7936},bufto = 7960,price=3000},
										{varTalkNpcGUID=170005,varName = "天神下凡4级（合成）", varMsg = "\n需要长生天的力量4级、长生天的守护4级、长生天的庇护4级。合成后的天神下凡4级兼备以上三个4级属性的效果！", levelmin = 10,levelmax = 79,buffrom={7913,7925,7937},bufto = 7961,price=4000},

										{varTalkNpcGUID=170005,varName = "天神下凡1级（合成）", varMsg = "\n需要长生天的力量1级、长生天的守护1级、长生天的庇护1级。合成后的天神下凡1级兼备以上三个1级属性的效果！", levelmin = 80,levelmax = 99,buffrom={7914,7926,7938},bufto = 7962,price=1000},
										{varTalkNpcGUID=170005,varName = "天神下凡2级（合成）", varMsg = "\n需要长生天的力量2级、长生天的守护2级、长生天的庇护2级。合成后的天神下凡2级兼备以上三个2级属性的效果！", levelmin = 80,levelmax = 99,buffrom={7915,7927,7939},bufto = 7963,price=2000},
										{varTalkNpcGUID=170005,varName = "天神下凡3级（合成）", varMsg = "\n需要长生天的力量3级、长生天的守护3级、长生天的庇护3级。合成后的天神下凡3级兼备以上三个3级属性的效果！", levelmin = 80,levelmax = 99,buffrom={7916,7928,7940},bufto = 7964,price=3000},
										{varTalkNpcGUID=170005,varName = "天神下凡4级（合成）", varMsg = "\n需要长生天的力量4级、长生天的守护4级、长生天的庇护4级。合成后的天神下凡4级兼备以上三个4级属性的效果！", levelmin = 80,levelmax = 99,buffrom={7917,7929,7941},bufto = 7965,price=4000},

										{varTalkNpcGUID=170005,varName = "天神下凡1级（合成）", varMsg = "\n需要长生天的力量1级、长生天的守护1级、长生天的庇护1级。合成后的天神下凡1级兼备以上三个1级属性的效果！", levelmin = 100,levelmax = 161,buffrom={7918,7930,7942},bufto = 7966,price=1000},
										{varTalkNpcGUID=170005,varName = "天神下凡2级（合成）", varMsg = "\n需要长生天的力量2级、长生天的守护2级、长生天的庇护2级。合成后的天神下凡2级兼备以上三个2级属性的效果！", levelmin = 100,levelmax = 161,buffrom={7919,7931,7943},bufto = 7967,price=2000},
										{varTalkNpcGUID=170005,varName = "天神下凡3级（合成）", varMsg = "\n需要长生天的力量3级、长生天的守护3级、长生天的庇护3级。合成后的天神下凡3级兼备以上三个3级属性的效果！", levelmin = 100,levelmax = 161,buffrom={7920,7932,7944},bufto = 7968,price=3000},
										{varTalkNpcGUID=170005,varName = "天神下凡4级（合成）", varMsg = "\n需要长生天的力量4级、长生天的守护4级、长生天的庇护4级。合成后的天神下凡4级兼备以上三个4级属性的效果！", levelmin = 100,levelmax = 161,buffrom={7921,7933,7945},bufto = 7969,price=4000},

									  }
									  
x303010_var_ShowListFormatEnough		= "%s\n#W需要#G%d#W战场货币"
x303010_var_ShowListFormatNotEnough	= "#cFF0000%s"
x303010_var_FirstMessage				= "您要合成吗？"
x303010_var_BoughtMessage				= "恭喜您，合成完成！"
x303010_var_BoughtMessageFailed		= "#cFF0000\n\n合成失败,合成条件不满足！"




function x303010_IsHaveAllBufInList(varMap,varPlayer,buflist)
	
	if buflist == nil then
		return 0
	end
	
	for varI,itm in buflist do
		if IsHaveSpecificImpact(varMap,varPlayer,itm) == 0 then
			return 0
		end
	end
	
	return 1
	
end




function x303010_ClearBufList(varMap,varPlayer,buflist )
	
	if buflist == nil then
		return 
	end
	
	for varI,itm in buflist do
		if IsHaveSpecificImpact(varMap,varPlayer,itm) == 1 then
			CancelSpecificImpact(varMap,varPlayer,itm)			
		end
	end
end




function x303010_GivePlayerBuf(varMap,varPlayer,buf)
	SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,buf,0)
end




function x303010_RefreshBufList( varMap,varPlayer,varTalknpc)
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
    local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
    for varI,itm in x303010_var_BuffList do
    	if nNpcGUID == itm.varTalkNpcGUID and LuaCallNoclosure(303006,"CheckLevelRange",varMap,itm.levelmin,itm.levelmax) == 1 then
    		if nHaveBattleMoney >= itm.price and x303010_IsHaveAllBufInList(varMap,varPlayer,itm.buffrom) == 1 then
	    		TalkAppendButton(varMap,x303010_var_FileId,"#S"..itm.varName,3,varI);
    		else
	    		TalkAppendButton(varMap,x303010_var_FileId,"#R"..itm.varName,3,varI);
	    	end
    	end
    end
    
end




function x303010_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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
	
	
	TalkAppendButton(varMap,x303010_var_FileId,x303010_var_QuestName,3,x303010_var_FileId);
	
end




function x303010_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
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
	
	
	
	if idExt == x303010_var_FileId then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x303010_var_FirstMessage);
			x303010_RefreshBufList( varMap,varPlayer,varTalknpc)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	if idExt > 100 then
		
		idExt = idExt - 100
		
		
		local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if nNpcGUID ~= x303010_var_BuffList[idExt].varTalkNpcGUID then
			return
		end
		
		if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303010_var_BuffList[idExt].levelmin,x303010_var_BuffList[idExt].levelmax) ~= 1 then
			return
		end
		

		
		
		StartTalkTask(varMap)
			local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
			local nFixedPrice = x303010_var_BuffList[idExt].price
			if nHaveBattleMoney >= nFixedPrice then
			
				
				
				x303010_ClearBufList(varMap,varPlayer,x303010_var_BuffList[idExt].buffrom )
				SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x303010_var_BuffList[idExt].bufto,0)
				LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"SubBattleMoney",varMap,varPlayer,nFixedPrice)
				
				
				TalkAppendString(varMap,x303010_var_BoughtMessage);
			else
				
				TalkAppendString(varMap,format(x303010_var_ShowListFormatEnough,x303010_var_BuffList[idExt].varName,x303010_var_BuffList[idExt].price))
				TalkAppendString(varMap, x303010_var_BoughtMessageFailed);		
			end
			
			
			
	    StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return
	end
	
	
	local varCount = getn(x303010_var_BuffList)
	if idExt < 1 or idExt > varCount then
		return 
	end
	
	
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if nNpcGUID ~= x303010_var_BuffList[idExt].varTalkNpcGUID then
			return
	end
	
	
	if LuaCallNoclosure(303006,"CheckLevelRange",varMap,x303010_var_BuffList[idExt].levelmin,x303010_var_BuffList[idExt].levelmax) ~= 1 then

		return
	end
	
	
	StartTalkTask(varMap)
		local nHaveBattleMoney = LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleMoney",varMap,varPlayer)
		TalkAppendString(varMap,format(x303010_var_ShowListFormatEnough,x303010_var_BuffList[idExt].varName,x303010_var_BuffList[idExt].price))
		TalkAppendString(varMap,x303010_var_BuffList[idExt].varMsg);

		if nHaveBattleMoney >= x303010_var_BuffList[idExt].price and x303010_IsHaveAllBufInList(varMap,varPlayer,x303010_var_BuffList[idExt].buffrom) == 1 then
			
			TalkAppendButton(varMap,x303010_var_FileId,"确定..",3,idExt + 100 );
		else
			TalkAppendString(varMap,"\n#R合成失败，不满足合成条件！");	
		end
		
		
		
    StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x303010_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303010_ProcAccept( varMap, varPlayer )
end




function x303010_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303010_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303010_CheckSubmit( varMap, varPlayer )
end




function x303010_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303010_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303010_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303010_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
