
x418548_var_FileId = 418548
x418548_var_QuestId = 0
x418548_var_ItemId = 12030093
x418548_var_FeastId = 12

function x418548_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

end

function x418548_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

end



function x418548_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418548_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418548_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418548_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418548_ProcActivateOnce( varMap, varPlayer, varImpact )

	local year, month, day = GetYearMonthDay(); 
	local day1 = GetDayOfYear()
	local feastid = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
	local varTimes = GetPlayerGameData( varMap, varPlayer, MD_LESSHORSE_COUNT[ 1], MD_LESSHORSE_COUNT[ 2], MD_LESSHORSE_COUNT[ 3] )
	local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)		
		if feastid < x418548_var_FeastId then
		LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x418548_var_FeastId)
			SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,x418548_var_FeastId)
		end
		if year == 2012 then
			if day1 > 81 and day1 < 90 then		--23号后
				if varTimes < 7 then --次数少于7次
					Msg2Player( varMap, varPlayer ,format( "完成7轮内政任务后才可使用，当前差%s轮。",(7 - varTimes)), 8, 3)
				else	
					if (1 == CreateHorseToPlayer( varMap, varPlayer, 5381, bagIndex, -1 )) then			
						Msg2Player( varMap, varPlayer ,"恭喜您获得绝版坐骑！", 8, 3)
					else
						Msg2Player( varMap, varPlayer ,"坐骑背包已满，请整理后再领取", 8, 3)
					end
				end
			elseif day1 > 89 then
					Msg2Player( varMap, varPlayer ,"活动已结束！不能兑换！", 8, 3)
		  else               --23号前
		    Msg2Player( varMap, varPlayer, "请完成7轮内政任务，3月23号后使用该道具领取坐骑", 8, 3)
		    Msg2Player( varMap, varPlayer ,format( "当前完成内政%s轮。", varTimes), 8, 3)
		  end	
		end
end







function x418548_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
