

--DECLARE_QUEST_INFO_START--
x800118_var_FileId = 800118












x800118_var_QuestName1="【星座铭刻说明】"
x800118_var_QuestInfo1="\t1.为10星以上有铭刻的黄装或紫装进行星座铭刻。\n\t2.星座铭刻会随机给装备分配一个或两个星座。每个星座会有一个基础属性，并还有一个星座附属性可被启动。\n\t3.每个星座的启动属性需要的特定星座：金牛或双鱼启动白羊，双子或白羊启动金牛，巨蟹或金牛启动双子，狮子或双子启动巨蟹，处女或巨蟹启动狮子，天枰或狮子启动处女，天蝎或处女启动天枰，射手或天枰启动天蝎，魔羯或天蝎启动射手，水瓶或射手启动魔羯，双鱼或魔羯启动水瓶，白羊或水瓶启动双鱼。\n\t3.星座链的装备启动顺序为：头盔启动主手，衣服启动头盔，手镯（上）启动衣服，手镯（下）启动手镯（上），腰带启动手镯（下），披风启动腰带，徽章启动披风，鞋子启动徽章，戒指（下）启动鞋子，戒指（上）启动戒指（下），护手启动戒指（上），项链启动护手，副手启动项链，主手启动副手。\n#Y操作说明#W：\n\t1.与大都#G铭刻大师#W对话。\n\t2.选择#G星座铭刻#W选项，打开#G星座铭刻#W介面。\n\t3.将需要铭刻的装备放入装备栏中并显示装备星座属性。\n\t4.放入星座铭刻道具。\n\t5.点击#G铭刻#W按钮。\n#Y注意事项#W：\n\t1.10星以上有铭刻的黄装或紫装方可进行星座铭刻。\n\t2.星座附属性需要启动后方可生效。"  
















--DECLARE_QUEST_INFO_STOP--







function x800118_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800118_var_QuestName1)
			TalkAppendString(varMap,x800118_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800118_var_FileId, x800118_var_QuestName1)

end









function x800118_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800118_var_FileId, x800118_var_QuestName1,13,1)



	
end









function x800118_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		return 1
end








function x800118_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800118_ProcAccept( varMap, varPlayer )
	
end









function x800118_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800118_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800118_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800118_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800118_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800118_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800118_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800118_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800118_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800118_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800118_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800118_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800118_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800118_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800118_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
