












x300324_var_FileId = 300324 






x300324_var_QuestList = {	
							{quest=8067, varId = 13011800,posX=129, posZ=100}, 
							{quest=8068, varId = 13011801,posX=362, posZ=163 },
							{quest=8069, varId = 13011802,posX=232, posZ=117 },
							{quest=8070, varId = 13011803,posX=358, posZ=391 },
							{quest=8071, varId = 13011804,posX=248, posZ=415 },
							{quest=8072, varId = 13011805,posX=74 , posZ=177 },
							{quest=8073, varId = 13011806,posX=436, posZ=316 }	}
                                                 

function x300324_ProcEventEntry( varMap, varPlayer, varIndex, sign )

	if sign==1 then

		SetViewBeastie( varMap, varPlayer, 0 )

		for varI, item in x300324_var_QuestList do
			if IsHaveQuestNM( varMap, varPlayer, item.quest ) > 0 then
				local ItemCnt = GetItemCount( varMap, varPlayer, item.varId )
				if ItemCnt == 0 then
					local message = format("没有抓到？到（%d，%d）附近看看吧！", item.posX, item.posZ)
					StartTalkTask(varMap)
					TalkAppendString(varMap, message)
					DeliverTalkTips(varMap, varPlayer)
					StopTalkTask(varMap)
					Msg2Player(varMap,varPlayer,message, 8, 2)
					return
				end
			end
		end
		
	end
					

end






function x300324_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300324_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300324_ProcConditionCheck( varMap, varPlayer )
	
	
		
	
	return 1; 
end







function x300324_ProcDeplete( varMap, varPlayer )
	
		
	
	return 1;
end








function x300324_ProcActivateOnce( varMap, varPlayer )
	
		
	
	return 1;
end







function x300324_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
