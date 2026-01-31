

x302532_var_FileId = 302532   
x302532_var_QuestName = ""
x302532_var_QuestInfo = ""
x302532_var_QuestError = ""

--DECLARE_QUEST_INFO_STOP--



function x302532_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
			if seleteId == 11 then 
				StartTalkTask(varMap)
				TalkAppendString(varMap, "【兑换物品】")
				TalkAppendString(varMap, "\t\t您可以兑换如下物品:\n\t兑换【高级洗石剂】需要2个欢乐周年兑换券、兑换【还童书】需要2个欢乐周年兑换券、兑换【紫檀木炭】需要2个欢乐周年兑换券、兑换【芝华士】需要1个欢乐周年兑换券、兑换【次生钻石矿】需要15个欢乐周年兑换券、兑换【完美星辰】需要8个欢乐周年兑换券")
				TalkAppendButton(varMap,x302532_var_FileId,"【兑换】高级洗石剂",3,1)
				TalkAppendButton(varMap,x302532_var_FileId,"【兑换】还童书",3,2)
				TalkAppendButton(varMap,x302532_var_FileId,"【兑换】紫檀木炭",3,3)
				TalkAppendButton(varMap,x302532_var_FileId,"【兑换】芝华士",3,4)
				TalkAppendButton(varMap,x302532_var_FileId,"【兑换】次生钻石矿",3,5)
				TalkAppendButton(varMap,x302532_var_FileId,"【兑换】完美星辰",3,6)		
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				return
			end

			if seleteId < 7 then 
				x302532_Accept( varMap, varPlayer, varTalknpc ,seleteId )
			end

end


function x302532_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
			TalkAppendButton(varMap,x302532_var_FileId,"【欢度周年】兑换",3,11)

end


function x302532_SetDataNum(varMap, varPlayer,value)
	return SetPlayerGameData( varMap, varPlayer, MD_KILLMON_NUM[ 1], MD_KILLMON_NUM[ 2], MD_KILLMON_NUM[ 3], value)
end

--主运行函数
function x302532_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	if seleteId == 1 then
		x302532_AddGift(varMap, varPlayer, 11000902, 2)
		GamePlayScriptLog( varMap, varPlayer, 3842)
	elseif seleteId == 2 then 
		x302532_AddGift(varMap, varPlayer, 12054300, 2)
		GamePlayScriptLog( varMap, varPlayer, 3843)
	elseif seleteId == 3 then 
		x302532_AddGift(varMap, varPlayer, 11000501, 2)
		GamePlayScriptLog( varMap, varPlayer, 3844)
	elseif seleteId == 4 then 
		x302532_AddGift(varMap, varPlayer, 12030013, 1)
		GamePlayScriptLog( varMap, varPlayer, 3845)
	elseif seleteId == 5 then 
		x302532_AddGift(varMap, varPlayer, 11990114, 15)
		GamePlayScriptLog( varMap, varPlayer, 3846)
	elseif seleteId == 6 then 
		x302532_AddGift(varMap, varPlayer, 11000552, 8)
		GamePlayScriptLog( varMap, varPlayer, 3847)
	
	end 


end

function x302532_AddItem(varMap, varPlayer,itemId)
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法获得物品", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法获得物品", 0, 3)
		return
	end	
	StartItemTask(varMap)
	ItemAppendBind( varMap, itemId, 1)	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		  varMsg ="恭喜您获得奖励"
			Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
			Msg2Player( varMap,varPlayer,varMsg,8,3) ;
   		--GamePlayScriptLog( varMap, varPlayer, 3740)
   		DeliverItemListSendToPlayer( varMap, varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
end 
function x302532_AddGift(varMap, varPlayer, itemId,num)
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法获得物品", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法获得物品", 0, 3)
		return
	end	
	StartItemTask(varMap)
	ItemAppendBind( varMap, itemId, 1)	--世传水晶

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DelItemByIDInBag(varMap, varPlayer,12110220,num)) == 1 then
		  varMsg ="恭喜您获得奖励"
			Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
			Msg2Player( varMap,varPlayer,varMsg,8,3) ;
   		--GamePlayScriptLog( varMap, varPlayer, 3740)
   		DeliverItemListSendToPlayer( varMap, varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"兑换失败")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
end		
function x302532_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x302532_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302532_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302532_CheckSubmit( varMap, varPlayer )

end




function x302532_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302532_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302532_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302532_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
