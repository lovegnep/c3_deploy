
x300657_var_FileId = 300657



x300657_var_QuestName="【国家】领取王者套装"


x300657_var_King_Suit = 10300100




function x300657_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if CountryGetOfficial(varMap,varPlayer)~=8 and CountryGetOfficial(varMap,varPlayer)~=7 then
		return
	end
	TalkAppendButton(varMap,x300657_var_FileId,x300657_var_QuestName,3)
end
function x300657_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	
	local Readme_1 = "#Y【国家】领取王者套装#r"	
	local Readme_2 = "#W尊敬的#R"..GetName(varMap, varPlayer).."#W您好：#r"	
	local Readme_3 = "\t大祭司为您精心打造了一件举世无双的王者套装，现在已经完工，并存放在我这里。#r"	
	local Readme_4 = "\t点击确定您就可以将其拿走。#r"
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4			
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300657_var_FileId, -1 )
	
end










function x300657_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x300657_ProcAccept( varMap, varPlayer )

	
	local official = CountryGetOfficial(varMap,varPlayer)
	if official~=8 and official~=7 then
		Msg2Player( varMap,varPlayer, "很抱歉，您还不是国王或王后，无法领取王者套装。", 8, 2 )
		return
	end
	
	
	
		
		
	
	
	
	if HaveItem(varMap, varPlayer,x300657_var_King_Suit)>0 then
		Msg2Player( varMap,varPlayer, "很抱歉，您已经领取过王者套装。", 8, 2 )
		return
	end
	
	
	StartItemTask(varMap)
	ItemAppend(varMap,x300657_var_King_Suit,1)
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet==1 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		CountryDrawBonus(varMap,varPlayer,1)	
		Msg2Player( varMap,varPlayer, "恭喜您，您已经获得了王者套装。", 8, 2 )
	else
		Msg2Player( varMap,varPlayer, "很抱歉，您的包裹已满，无法领取王者套装。", 8, 2 )
	end
	
end




function x300657_ProcQuestAbandon( varMap, varPlayer, varQuest )	
end




function x300657_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300657_CheckSubmit( varMap, varPlayer )

end




function x300657_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300657_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300657_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300657_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
