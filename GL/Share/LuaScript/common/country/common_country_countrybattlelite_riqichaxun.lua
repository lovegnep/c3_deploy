
x310158_var_FileId 					= 	310158   

x310158_var_GameOpenId                = 1026
								  							   
function x310158_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    if GetGameOpenById(x310158_var_GameOpenId) <= 0 then
		return
	end
	TalkAppendButton(varMap,310158,"【国家】查询屠城战日期",3)	
end




function x310158_ProcEventEntry( varMap, varPlayer, varTalknpc)		
		
		StartTalkTask(varMap)
			local Readme_1 = "#Y【国家】查询屠城战日期#r#W #r"			
			
			local Readme_2 = "\t屠城战每#G两周#W开启一次，开启日期为#G当周的周六下午（16：00-17：00）#W，您可以在我这里查询#G本周#W屠城战是否开启。 #r#r"
			
			local Readme_3 = "#r #r屠城战开启时间为:#R#r"
			
			
			local varReadme = Readme_1..Readme_2..Readme_3	
			
			
			local varY,m,d = CountryBattleLite_GetNextStartDate()
			local varStr   ="(16:00-17:00)"
			local varMsg = format("%s%d-%02d-%02d%s",varReadme,varY,m,d,varStr)
			
		TalkAppendString( varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		
end




function x310158_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x310158_ProcAccept( varMap, varPlayer )
end



function x310158_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x310158_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x310158_CheckSubmit( varMap, varPlayer )
end



function x310158_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x310158_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x310158_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x310158_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
