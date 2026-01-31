

x302537_var_FileId = 302537   
x302537_var_QuestName = ""
x302537_var_QuestInfo = ""
x302537_var_QuestError = ""

--DECLARE_QUEST_INFO_STOP--



function x302537_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
			if seleteId == 11 then 
				StartTalkTask(varMap)
				TalkAppendString(varMap, "#Y【领取奖励】")
				TalkAppendString(varMap, "\t\t您可以新功能体验大礼包一份")
				TalkAppendButton(varMap,x302537_var_FileId,"【领取】",3,1)
		
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				return
			end

			if seleteId < 7 then 
				x302537_Accept( varMap, varPlayer, varTalknpc ,seleteId )
			end

end


function x302537_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetWorldIdEx() ~= 114 then
		return
	end
			TalkAppendButton(varMap,x302537_var_FileId,"【体验大礼包】",3,11)

end


function x302537_SetDataNum(varMap, varPlayer,value)
	return SetPlayerGameData( varMap, varPlayer, MD_GONGCE_LI[ 1], MD_GONGCE_LI[ 2], MD_GONGCE_LI[ 3], value)
end
function x302537_GetDataNum(varMap, varPlayer)
	return GetPlayerGameData( varMap, varPlayer, MD_GONGCE_LI[ 1], MD_GONGCE_LI[ 2], MD_GONGCE_LI[ 3])
end
--主运行函数
function x302537_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	if GetWorldIdEx() ~= 114 then
		return
	end
	if GetLevel(varMap ,varPlayer) < 70 then
			Msg2Player(varMap,varPlayer,"您的等级不足70级，不能领取该奖励",8,3)
			return
	end
	if seleteId == 1 then		
		local num =	x302537_GetDataNum(varMap, varPlayer)
		if num == 1 then 
			Msg2Player(varMap,varPlayer,"您已领取过该奖励",8,3)
			return
		else
			x302537_GiftGive( varMap, varPlayer )
			x302537_SetDataNum(varMap, varPlayer,1)
		end
	end 


end
function x302537_GiftGive( varMap, varPlayer )
			if GetBagSpace(varMap, varPlayer) <3 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少3个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少3个背包空位", 0, 3)
		return 0
	end
		
		StartItemTask(varMap)
	
		ItemAppendBind( varMap, 12035339 , 1 )
		ItemAppendBind( varMap,12032020 , 1 )
		ItemAppendBind( varMap,12032021 , 1 )
		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then

			GamePlayScriptLog( varMap, varPlayer, 3869)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得全新功能体验礼包")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
	
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end
function x302537_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x302537_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302537_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302537_CheckSubmit( varMap, varPlayer )

end




function x302537_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302537_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302537_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302537_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
