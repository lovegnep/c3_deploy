--战神令任务

x310274_var_FileId	= 310274
x310274_var_QuestName ="【帝国】领取战神加护"

x310274_var_BuffId = 30575


function x310274_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuestId )
	
	TalkAppendButton( varMap, x310274_var_FileId, x310274_var_QuestName, 3, -1);
	
end



function x310274_ProcEventEntry( varMap, varPlayer, varTalknpc, varFileId, varExt )

	local msg = x310274_var_QuestName.."\n\t战神令开启后本日内，所有皇帝国国民可以在我这里领取战神加护的效果！\n\t战神加护的效果不仅能够增加所有伤害免疫3%，更会带来特殊的幸运效果。"
	
	if x310274_IsOrderOpen( varMap ) == 1 then
			msg = msg.."\n \n\t#R您现在确定要领取吗#W？"
	else
			msg = msg.."\n \n\t#R战神令当前未开启#W。"
	end

	StartTalkTask(varMap)
	TalkAppendString(varMap, msg)
  StopTalkTask(varMap)	
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310274_var_FileId, x310274_var_FileId )

end



function x310274_ProcAcceptCheck( varMap, varPlayer, NPCId )
   return 1
end


function x310274_ProcAccept( varMap, varPlayer )
	
		if x310274_IsOrderOpen( varMap ) == 0 then
				
					StartTalkTask(varMap)
					TalkAppendString(varMap,"战神令未发布，无法领取！")
	    		StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return
		end
		
	
		if GetEmpireCountry() ~= GetCurCountry( varMap, varPlayer ) then
					
					StartTalkTask(varMap)
					TalkAppendString(varMap,"只有皇帝国的国民才能领取！")
	    		StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return
		end
		
		
		if IsHaveSpecificImpact( varMap, varPlayer, x310274_var_BuffId ) == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310274_var_BuffId, 0);
		else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您已经领取过了！")
    		StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
		end
		
end


function x310274_IsOrderOpen( varMap )
		
		local openTime = GetCountryParam( varMap, 0, CD_EMPIRE_ORDER_TIME )
		local oYear, oMon, oDay, oHour, oMin, oSec = Localtime( openTime )
		local curYear, curMon, curDay = GetYearMonthDay()
		
		if oYear == curYear and oMon == curMon and oDay == curDay then
			  return 1
		end

		return 0
		
end

function x310274_ProcQuestAbandon( varMap, varPlayer, varQuestId )
end

function x310274_OnContinue( varMap, varPlayer, varTalknpc )
end

function x310274_CheckSubmit( varMap, varPlayer )
end

function x310274_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, varQuestId )
end

function x310274_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, varQuestId )
end

function x310274_ProcAreaEntered( varMap, varPlayer, zoneId, varQuestId )
end

function x310274_ProcQuestItemChanged( varMap, varPlayer, itemdataId, varQuestId )
end
