
x300660_var_FileId = 300660


x300660_var_QuestName="【国家】领取王者坐骑"


x300660_var_King_QiCheng = 12050300

--DECLARE_QUEST_INFO_STOP--



function x300660_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if CountryGetOfficial(varMap,varPlayer)~=8 and CountryGetOfficial(varMap,varPlayer)~=7 then
		return
	end
	TalkAppendButton(varMap,x300660_var_FileId,x300660_var_QuestName,3)
end

function x300660_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local Readme_1 = "#Y【国家】领取王者坐骑#W#r #r"	
	local Readme_2 = "\t渥洼龙种雪霜同，毛骨天生胆气雄。#r #r"
	local Readme_3 = "\t梦魂犹在龙门镇，百战沙场战群雄。#r #r"
	local Readme_4 = "\t巡过玉楼金辔响，一声嘶断落花风。#r #r"
	local Readme_5 = "\t昔令吾将连年寻，现持宝骑献名王。#r #r"
	local Readme_6 = "#W我尊敬的#R"..GetName(varMap, varPlayer).."#w，功夫不负有心人，我们终于给您找到了诗句中的宝骑，点击确定您就可以一睹其风采。#r"	
	local varReadme = Readme_1 .. Readme_2..Readme_3..Readme_4..Readme_5..Readme_6
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300660_var_FileId, -1 )
	
end










function x300660_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x300660_ProcAccept( varMap, varPlayer )
	
	
	local official = CountryGetOfficial(varMap,varPlayer)
	if official~=8 and official~=7 then
		Msg2Player( varMap,varPlayer, "很抱歉，您还不是国王或王后，无法领取王者坐骑。", 8, 2 )
		return
	end
	
	
	if CountryCanDrawBonus(varMap,varPlayer,2) == 0 then
		Msg2Player( varMap,varPlayer, "很抱歉，您已经领取过王者坐骑。", 8, 2 )
		return
	end
	
	
	if HaveItem(varMap, varPlayer,x300660_var_King_QiCheng)>0 or IsHaveHorse(varMap, varPlayer,3004)>0 then
		Msg2Player( varMap,varPlayer, "很抱歉，您已经领取过王者坐骑。", 8, 2 )
		return
	end	
	
	
	StartItemTask(varMap)
	ItemAppend(varMap,x300660_var_King_QiCheng,1)
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet==1 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		CountryDrawBonus(varMap,varPlayer,2)	
		Msg2Player( varMap,varPlayer, "恭喜您，您已经获得了王者坐骑。", 8, 2 )
	else
		Msg2Player( varMap,varPlayer, "很抱歉，您的包裹已满，无法领取王者坐骑。", 8, 2 )
	end
	
end




function x300660_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300660_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300660_CheckSubmit( varMap, varPlayer )

end




function x300660_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300660_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300660_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300660_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
