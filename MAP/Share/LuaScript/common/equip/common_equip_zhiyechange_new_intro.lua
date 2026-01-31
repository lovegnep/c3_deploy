

--DECLARE_QUEST_INFO_START--
x570094_var_FileId = 570094












x570094_var_QuestName1="【高阶职业转换说明】"
x570094_var_QuestName2="【高阶装备转换说明】"
x570094_var_QuestInfo1="\n\t1、玩家等级达到80级便可以进行高阶职业转换。\n\t2、转职时需要提交转职道具和一定数量的金钱。\n\t3、职业转换所需的金钱按照高阶职业转换的次数逐步递增，但最高不超过50两。\n\t4、职业转换时会将职业技能转换为目标职业的技能，人物基础成长属性也会重新计算。\n\t5、职业转换时#R装备不会发生改变#W，你需要使用装备转换来获取新职业的装备。"  
x570094_var_QuestInfo2="\n\t1、装备转换分为#G删源装备转换#W和#G不删源装备转换#W。\n\t2、删源装备转换则会在转换后不保留源装备，不删源装备转换转换在生成新装备后仍然保留源装备。\n\t3、装备转换后的装备会继承源装备的所有装备养成属性，包括打星，洗紫，洗蓝，灵魂铭刻，战功铭刻，麻将铭刻，星座铭刻，扑克铭刻，十星启动等。\n\t4、装备的白属性都会转换为目标职业对应的白属性，赐字和传字装备的蓝属性将转化为对应职业蓝属性，打造装则会直接复制源装备的蓝属性。\n\t5、所有使用装备转换获得的新装备均#R不能进行装备回收#W等操作。"  















--DECLARE_QUEST_INFO_STOP--







function x570094_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	local QuestName = nil
	local QuestInfo = nil
	
	if extid == 1 then
		QuestName = x570094_var_QuestName1
		QuestInfo = x570094_var_QuestInfo1
	elseif extid == 2 then
		QuestName = x570094_var_QuestName2
		QuestInfo = x570094_var_QuestInfo2
	end
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..QuestName)
			TalkAppendString(varMap,QuestInfo)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570094_var_FileId, QuestName)

end









function x570094_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x570094_var_FileId, x570094_var_QuestName1,13,1)
		TalkAppendButton(varMap, x570094_var_FileId, x570094_var_QuestName2,13,2)



	
end









function x570094_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x570094_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570094_ProcAccept( varMap, varPlayer )
	
end









function x570094_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570094_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570094_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570094_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570094_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570094_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570094_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570094_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570094_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570094_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570094_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570094_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570094_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570094_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570094_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
