
x300633_var_FileId = 300633


x300633_var_QuestName="【帮会】帮贡建设"

--DECLARE_QUEST_INFO_STOP--



function x300633_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	if GetGuildOfficial(varMap, varPlayer) ~= -1 then
	
		local localexp = floor( (GetLevel( varMap, varPlayer ))  * 200 )

		local Readme_1 = "#Y【帮会】帮贡建设#r#W"
		
		local Readme_2 = "\t您可以通过#G25点帮贡#W来提升#G1点帮会经验#W，同时您也将获得#G"..localexp.."点个人经验#W。"
		
		local Readme_3 = "#W#r#Y您是否要建设帮会？"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300633_var_FileId, -1 );

	end
	
end




function x300633_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end





function x300633_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300633_ProcAccept( varMap, varPlayer )

	if GetGuildOfficial(varMap, varPlayer) == -1 then
		StartTalkTask(varMap);TalkAppendString(varMap, "建设帮会失败。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您不是帮会成员，无法进行帮会建设。",8,2)
		return
	end
	
	if GetGuildUserPoint(varMap, varPlayer) < 25 then
		StartTalkTask(varMap);TalkAppendString(varMap, "建设帮会失败。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您所拥有的帮贡不够帮贡建设需求，建设帮会失败！",8,2)
		return
	end
	
	
	GuildCanExpBuild(varMap, varPlayer, x300633_var_FileId, "ProcGuildScript_Callback" )
	
end


function x300633_ProcGuildScript_Callback( varMap, varPlayer, varParam1, varParam2, varParam3, varParam4 )

	if varParam1==1 then	
				
		local localexp = floor ((GetLevel( varMap, varPlayer ))  * 200)
					
		SubGuildUserPoint(varMap, varPlayer, 25)				
		Msg2Player(varMap,varPlayer,"【帮会】帮贡建设:扣除帮贡25点",8,2)
		
		AddExp(varMap, varPlayer, localexp)					
		Msg2Player(varMap,varPlayer,"【帮会】帮贡建设:获得#R经验"..localexp.."点#o的奖励",8,2)
		Msg2Player(varMap,varPlayer,"获得#R经验"..localexp.."点#o的奖励",8,3)		
		AddGuildExp(varMap, varPlayer, 1)				
		
		
		
		Msg2Player( varMap, varPlayer, (GetName(varMap, varPlayer)).."慷慨捐助了25点帮贡，使帮会经验提高了1点。", 6 )		
		
	else	
		StartTalkTask(varMap);TalkAppendString(varMap, "建设帮会失败。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您所在的帮会每天只能进行" .. varParam2 .. "次帮贡建设，请明日再来！",8,2)	
	end
end




function x300633_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300633_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300633_CheckSubmit( varMap, varPlayer )

end




function x300633_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300633_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300633_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300633_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
