 
x103050_var_FileId	= 103050



print(00000)
function x103050_ProcEventEntry( varMap, varPlayer,varTalknpc )

end

function x103050_ProcDie(varMap, varPlayer, varKiller)



	
	 if IsPlayerStateNormal( varMap, varKiller) ~= 1 then
        return
    end
    
    --没有任务
    if IsHaveQuest( varMap, varKiller, x103050_GetvarQuest( varMap, varKiller )) <= 0 then
        return
    end
    
    --任务已完成
    local misIndex = GetQuestIndexByID( varMap, varKiller, x103050_GetvarQuest( varMap, varKiller )) 
    if GetQuestParam( varMap, varKiller, misIndex, 7) == 1 then
        return
    end
    
	print(22222222222)
    
    local teamSize = GetNearTeamCount( varMap, varKiller)
    if teamSize <= 1 then -- 非组队，单独做任务  
        local misguid = GetQuestParam( varMap, varKiller, misIndex, 2)
	    if misguid ~= 10001 then
	        return
	    end   
      	--检测任务是否完成
      	StartItemTask(varMap)
		ItemAppend( varMap, 13810451, 1 )	
		local ret = StopItemTask(varMap,varKiller)
		if ret > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,format("获得@item_%d！",13810451))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varKiller)
			DeliverItemListSendToPlayer( varMap, varKiller)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varKiller)
		end
		
    else
        for i = 0, teamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varKiller, i)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x103050_GetvarQuest(varMap, memberId)) > 0 then -- 如果该成员接受了国家内政
                     
			        local misguid = GetQuestParam( varMap, memberId, misIndex, 2)
				    if misguid ~= 40000 then
				        return
				    end
                      --检测任务是否完成
			      	StartItemTask(varMap)
					ItemAppendBind( varMap, 13810451, 1 )	
					local ret = StopItemTask(varMap,memberId)
					if ret > 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,format("获得@item_%d！",13810451))
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,memberId)
					else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,memberId)
					end
                end
            end
        end
    end
    
    
end

--获得国家名字
function x103050_GetvarQuest( varMap, varPlayer )
	local varQuest = {10280,10281,10282,10283}
    local country = GetCurCountry( varMap, varPlayer )
    return varQuest[country+1]
end
