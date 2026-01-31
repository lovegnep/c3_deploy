
x930126_var_FileId	= 930126

--特殊道具
x930126_var_daojuname = "贪婪地精勋章"
x930126_var_daojuid = 12274053
x930126_var_daoju_maxnum = 100
x930126_var_daoju_per = 1


function x930126_ProcDie( varMap, varObj, varKiller )

							   
	
	if IsObjValid( varMap,varKiller ) ~=1 then
		return
	end
	
	local killerType = GetObjType(varMap, varKiller)

	
	if killerType == 3 then
		varKiller = GetOwnerID(varMap, varKiller)
	end	
	
	if IsPlayerStateNormal( varMap, varKiller) ~= 1 then
        return
    end


	
	local NeedKilledNum = x300640_var_NeedKillMonsterNum;
	local varStr = "";
	
	local varNum = 1;
	local bHasTeam = HasTeam(varMap, varKiller);
	if bHasTeam > 0 then
		varNum = GetNearTeamCount(varMap, varKiller)
	end
  
	local memberId = varKiller;
	local varCountry = GetCurCountry( varMap, varKiller )

	local week = GetWeek()

	for varI=0, varNum-1 do
		if bHasTeam > 0 then
			memberId = GetNearTeamMember(varMap, varKiller, varI);
		end

        local curHxNum = GetItemCount( varMap, memberId, x930126_var_daojuid)
        if curHxNum > x930126_var_daoju_maxnum then
            curHxNum = x930126_var_daoju_maxnum
        end
        local gadd = curHxNum * x930126_var_daoju_per

        local varLevel = GetLevel( varMap, memberId)
        local gold = 10  + varNum

        gold  = gold + gadd
		if week == 6 or week == 0 then
			--周6周日现金翻倍
			gold = gold * 2
		end

        if gadd > 0 then
            Msg2Player(varMap, memberId,format("%s使您额外获得%d文现金",x930126_var_daojuname, gadd),8,3)
            Msg2Player(varMap, memberId,format("%s使您额外获得%d文现金",x930126_var_daojuname, gadd),8,2)
        end

		AddGold(varMap, memberId, gold)
		StartTalkTask(varMap)
		TalkAppendString( varMap, "获得"..gold.."文现金" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, memberId )
	end
end
