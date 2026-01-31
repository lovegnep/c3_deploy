--DECLARE_QUEST_INFO_START--

x270108_var_FileId = 270108   
x270108_var_FeastId = 12

function x270108_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
	local year, month, day = GetYearMonthDay(); 
	local day1 = GetDayOfYear()
	local serverId = GetWorldIdEx()
	local feastid = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
	if seleteId == 1 then
		if serverId == 114 then
		--	if year == 2012 then
		--		if day1 == 76 then							
						if feastid < x270108_var_FeastId then
							LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x270108_var_FeastId)
							SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,x270108_var_FeastId)				
						end
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y".."【活动】测试体验有奖")	
						TalkAppendString(varMap,"\t欢迎您来到成吉思汗3 恶狼传说的世界，为了让您在成吉思汗3 恶狼传说的世界中有更加畅快的游戏体验，特此举行测试体验有奖活动。\n\t您可在#G新手领奖大使#W处领取#R5锭金卡#W和#R5锭银卡#W的奖励一份，祝您在游戏旅途中愉快！")	
						TalkAppendButton( varMap, x270108_var_FileId, "领取奖励", 3, seleteId + 1 )	
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc ,x270108_var_FileId, -1)					
	--			end
		end
--	end
	else
		x270108_Accept( varMap, varPlayer, varTalknpc, 2 )		
	end
end


function x270108_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
--	local year, month, day = GetYearMonthDay(); 
--	local day1 = GetDayOfYear()
	local serverId = GetWorldIdEx()
	if serverId == 114 then
		--if year ==2012 then
		--	if day1 == 76 then
					TalkAppendButton(varMap,x270108_var_FileId,"【活动】测试体验有奖",3,1);
		--	end
	--	end
	end
end

function x270108_ProcAccept( varMap, varPlayer )
end

function x270108_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	--local year, month, day = GetYearMonthDay(); 
	--local varToday = GetDayOfYear()
	--if year ==2012 then
	--	if varToday == 77 then
			if GetPlayerGameData( varMap, varPlayer, MD_NEWPLAY_COUNT[ 1], MD_NEWPLAY_COUNT[ 2], MD_NEWPLAY_COUNT[ 3] ) ~= 1 then
		  	SetPlayerGameData( varMap, varPlayer, MD_NEWPLAY_COUNT[ 1], MD_NEWPLAY_COUNT[ 2], MD_NEWPLAY_COUNT[ 3], 1)
				AddMoney(varMap, varPlayer, 1, 5000000)
				AddMoney(varMap, varPlayer, 3, 5000000)
				Msg2Player( varMap, varPlayer, "领取完成", 8, 3)
				Msg2Player( varMap, varPlayer, "感谢您参与成吉思汗3 恶狼传说的体验活动，祝您游戏愉快！", 8, 3)
		  else
		  	 Msg2Player( varMap, varPlayer, "您已领取过该奖励，不能再次领取。", 8, 3)
		    return
		  end
		--end
	--end
end
		
function x270108_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x270108_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x270108_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x270108_CheckSubmit( varMap, varPlayer )

end




function x270108_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x270108_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x270108_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x270108_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
