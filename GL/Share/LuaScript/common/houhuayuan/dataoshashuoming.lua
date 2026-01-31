

--DECLARE_QUEST_INFO_START--
x300992_var_FileId = 300992












x300992_var_QuestName1="▽湮枅伀俙楊佽隴▼"
x300992_var_QuestInfo1="#Y統迵寞寀ㄩ#W\n\t1.#G笚鞠#W腔狟敁#G14ㄩ30-15ㄩ00#Wㄛ垀衄#G40撰#W眕奻#G(漪40撰)#W腔俙模飲褫眕統迵綴豪埶笢珨砐準都棧慾腔魂雄--大逃殺。\n\t2.大逃殺玩法每兩周開放一次。\n#Y詳細玩法：#W\n\t1.活動期間，所有進入後花園參與活動的玩家會變成混亂模式。可以與#G本隊成員#W以外的任意玩家相互攻擊，無論其國家、幫會。\n\t2.活動期間，每個玩家初始時會獲得十重#G長生天之力#W，每擊殺其他玩家一次，自身的#G長生天之力#W會減少一重，每被其他玩家擊殺一次，本身的#G長生天之力#W會增加一重，#G長生天之力#W最高可累積20層。\n\t3.活動期間，還會有大量的boss和寶箱源源不斷的出現在後花園中，擊殺boss、打開寶箱，都會獲得極其豐厚的獎勵與驚喜！"  
















--DECLARE_QUEST_INFO_STOP--







function x300992_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300992_var_QuestName1)
			TalkAppendString(varMap,x300992_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x300992_var_FileId, x300992_var_QuestName1)

end









function x300992_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x300992_var_FileId, x300992_var_QuestName1,13,1)



	
end









function x300992_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x300992_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x300992_ProcAccept( varMap, varPlayer )
	
end









function x300992_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300992_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x300992_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x300992_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300992_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300992_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300992_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300992_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x300992_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x300992_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x300992_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300992_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300992_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300992_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300992_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
