

x310214_var_FileId 					= 	310214                  
x310214_var_Quest_Max_Count = 1 
x310214_var_GameId = 1057
x310214_var_Title = "【国家】申请弱国结盟"

function x310214_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsToggleCountryColleague() == 0 then 
		return -1
	end

	local countryofficial = CountryGetOfficial(varMap,varPlayer)
	if countryofficial ~= 8 then
		return -1
	end

	TalkAppendButton(varMap,x310214_var_FileId,x310214_var_Title, 3, -1)	
end



function x310214_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	
	if varExtIdx == -1 then
			
			local msg1, msg2;
		    local mode,cou1,cou2,cou3,cou4 = x310214_GetWeakLeagueCountryInfo( varMap, varPlayer )
    	    local myCountry = GetCurCountry( varMap, varPlayer )
    	    local weakCountry = { -1, -1 }

    	    
    	    if mode == 3 then
    	        msg1 = "\t国王大人，在这个乱世，有几个可靠的盟友是很重要的，现在，在国家强弱榜中实力最弱的三个国家之间可以自由结盟。" 	
       	    elseif mode == 2 then
    	        msg1 = "\t国王大人，在这个乱世，有几个可靠的盟友是很重要的，现在，在国家强弱榜中实力较弱小的两个国家之间可以自由结盟。" 	  
    	    else
    	        msg1 = "\t国王大人，在这个乱世，有几个可靠的盟友是很重要的，现在，在国家强弱榜中实力较弱小的几个国家之间可以自由结盟。" 	   
    	    end
    	    
    	    if myCountry == cou1 then
    	        msg2 = "您的国家现在很强大，不需要结盟。"   	
       	    else
    	           	       
    	        if mode == 3 then
                        local index = 1
                        if myCountry ~= cou2 then
                            
                            weakCountry[ index ] = cou2
                            index = index + 1
                            
                        end	        
                        
                        if myCountry ~= cou3 then
                            
                            weakCountry[ index ] = cou3
                            index = index + 1
                            
                        end
                        
                         if myCountry ~= cou4 then
                            
                            weakCountry[ index ] = cou4
                            index = index + 1
                            
                        end
                        
                        
    	        elseif mode == 2 then
    	                
    	               if cou2 == myCountry or cou3 == myCountry then
    	                    weakCountry[ 1 ] = cou4
    	                    weakCountry[ 2 ] = -1
    	               else
    	                    weakCountry[ 1 ] = cou2
    	                    weakCountry[ 2 ] = cou3
    	               end
    	       	        
    	        else
    	                weakCountry[ 1 ] = -1
    	                weakCountry[ 2 ] = -1
    	        end
    	        
    	        if weakCountry[ 1 ] == -1 and weakCountry[ 1 ] == -1 then
    	            msg2 = "纵观当今四国局势，比较均衡，还没有达到需要开启弱国联盟的地步。"
    	        else
    	            msg2 = "请在下面可结盟的国家中选择您要申请结盟的国家，我会向对方国王传递您的申请。"
    	        end
   	        
    	    end
    	    
    	      	    
    		
    		
    		StartTalkTask(varMap)
    		TalkAppendString(varMap,"#Y"..x310214_var_Title)
    		TalkAppendString(varMap, msg1.."\n\t"..msg2 )
    		
    		if weakCountry[ 1 ] ~= -1 then
    		    TalkAppendButton( varMap, x310214_var_FileId, x310214_GetCountryName( weakCountry[ 1 ] ), 3, weakCountry[ 1 ] )
    		end
    		
    		if weakCountry[ 2 ] ~= -1 then
    		    TalkAppendButton( varMap, x310214_var_FileId, x310214_GetCountryName( weakCountry[ 2 ] ), 3, weakCountry[ 2 ] )
    		end
    		
    		StopTalkTask()
    		--DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310214_var_FileId, -1,  0)	
    		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    		return
    		
	else
	
	    if varExtIdx < 0 or varExtIdx > 3 then
	        return
	    end
	    
	    
	    local selCountry = varExtIdx
	
	    x310214_DoApplyWeakLeague( varMap, varPlayer, selCountry )
	    
	end
	
end








function x310214_DoApplyWeakLeague( varMap, varPlayer, varOtherCountry )
    
    local varCountryID = GetCurCountry(varMap, varPlayer)
	local nTrigger   = CheckCountryColleagueTrigger(varMap, varPlayer,varCountryID)
	if nTrigger == -1 then
		Msg2Player(varMap, varPlayer,"不满足弱国联盟开启条件", 8, 2)
		Msg2Player(varMap, varPlayer,"不满足弱国联盟开启条件", 8, 3)
		return -1
	end
	
	if x310214_CheckCountryIfColleague(varMap, varPlayer, varOtherCountry) > 0 then
	    
	    local strOtherCountryName = x310214_GetCountryName( varOtherCountry )
		Msg2Player(varMap, varPlayer,format("%s已经是盟国！", strOtherCountryName), 8, 2)
		Msg2Player(varMap, varPlayer,format("%s已经是盟国！", strOtherCountryName), 8, 3)
		return -1
	end
	
	if x310214_CheckIsWeakLeagueMemberFull( nTrigger ) > 0 then
	    
	    local strOtherCountryName = x310214_GetCountryName( varOtherCountry )
		Msg2Player(varMap, varPlayer,"弱国联盟已经满员，无法继续接受申请！", 8, 2)
		Msg2Player(varMap, varPlayer,"弱国联盟已经满员，无法继续接受申请！", 8, 3)
		return -1
		
	end
	
	if x310214_CheckCountryLevel(varMap, varPlayer) < 0 then
		Msg2Player(varMap, varPlayer,"只有强弱排行榜中第二三四名才可申请结盟", 8, 2)
		Msg2Player(varMap, varPlayer,"只有强弱排行榜中第二三四名才可申请结盟", 8, 3)
		return -1
	end	
	
	
	if x310214_GetDayCount(varMap, varPlayer) > 0 then
		Msg2Player(varMap, varPlayer,"解盟后当日不允许再次结盟", 8, 2)
		Msg2Player(varMap, varPlayer,"解盟后当日不允许再次结盟", 8, 3)
		return -1
	end
	
	--要结盟的国家当天解过盟了
	if GetDayOfYear() == GetCountryParam(varMap, varOtherCountry, CD_DISMISS_COLLEAGUE_DATE) 
	   and GetCountryParam(varMap, varOtherCountry,CD_DISMISS_COLLEAGUE_COUNT ) >= 1 then
	    Msg2Player(varMap, varPlayer,"该国当日解过盟，不允许再次结盟", 8, 2)
		Msg2Player(varMap, varPlayer,"该国当日解过盟，不允许再次结盟", 8, 3)
		return -1
	
	end
	
	RequestCountryColleague(varMap, varPlayer, varCountryID, varOtherCountry )	
	Msg2Player(varMap, varPlayer,"结盟申请已经发送,等待对方国王确认", 8, 2)
	Msg2Player(varMap, varPlayer,"结盟申请已经发送,等待对方国王确认", 8, 3)
	local logFmtMsg         = "x310214_DoApplyWeakLeague : RequestCountryColleague : varMap = %d,varPlayer = %d, varCountryID=%d,varOtherCountry=%d" 	
	local logMsg = format(logFmtMsg,varMap,varPlayer,varCountryID,varOtherCountry)
	WriteLog(1,logMsg)


end




function x310214_ProcAccept( varMap, varPlayer )
	    
	return 1
end



function x310214_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x310214_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end


function x310214_CheckIfHaveDismissColleague( varMap, varPlayer )
	local varCountryID = GetCurCountry(varMap, varPlayer)
	
	local nCurDay = GetDayOfYear()
	
	
	if nCurDay ~= nCurSysDay then
			SetCountryParam(varMap,nCountryIdx,CD_LASTWEEK_PINGFEN_DATE,curWeek)
			SetCountryParam(varMap,nCountryIdx,CD_LASTWEEK_PINGFEN_MONEY,curMoney)
	else
			local nOldMoney = GetCountryParam(varMap,nCountryIdx,CD_CURWEEK_PINGFEN_MONEY)
			local nNewMoney = nOldMoney + nMoney
			SetCountryParam(varMap,nCountryIdx,CD_CURWEEK_PINGFEN_MONEY,nNewMoney)
	end
end



function x310214_GetDayCount(varMap, varPlayer)
	local varCountryID = GetCurCountry(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetCountryParam(varMap, varCountryID, CD_DISMISS_COLLEAGUE_DATE)
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount =  GetCountryParam(varMap, varCountryID,CD_DISMISS_COLLEAGUE_COUNT )
	return varDaycount

end




function x310214_CheckCountryLevel(varMap, varPlayer, varCountryCount )
	
	local varCountryID = GetCurCountry(varMap, varPlayer )
	local nLevel     =  GetCountryParam(varMap, varCountryID, CD_STRONG_WEAK_LEVEL)
	if nLevel ~= 1 and nLevel ~= 2 and nLevel ~= 3 then
		return -1
	end
	
	return 1
	
end

--检测与目标国家是否已经结盟
function x310214_CheckCountryIfColleague(varMap, varPlayer, varOtherCountry )

    if varOtherCountry < 0 or varOtherCountry >= 4 then
        return 0
    end
    
    local varCountryID = GetCurCountry(varMap, varPlayer )
    if IsLeague( varCountryID, varOtherCountry ) == 1 then
	   
	    return 1
	   
	end
	
	return 0
	
end


--检测弱国联盟国家是否满员
function  x310214_CheckIsWeakLeagueMemberFull( varCountryMode )

    if varCountryMode <= 0 then
            return 1
    end
    
    local curCountryCount = 0 
    for countryID = 0, 3 do
            
         local thisCountryCount = x310214_GetLeagueMemberCount( countryID )
        
	     if thisCountryCount > 0 then 
    	     
    	     thisCountryCount = thisCountryCount + 1
    	     if curCountryCount < thisCountryCount then
    	        
    	           curCountryCount = thisCountryCount
    	        
    	     end
    	     
    	 end
	   
    end
    
    
    if curCountryCount < varCountryMode then --联盟还有名额
       
        return 0
       
    end
    
    return 1

end

--得到联盟国家数目
function x310214_GetLeagueMemberCount( varCountry )

    local nCount = 0
    for i = 0, 3 do
        if i ~= varCountry then
            
            if IsLeague( i, varCountry ) == 1 then
                nCount = nCount + 1
            end
    
        end
    end

    return nCount
    
end



--得到当前弱国联盟信息， 
--返回值1：三国返回3， 两国返回2， 否则返回 0 
--返回值2,3,4,5, 弱国排名的国家id
function x310214_GetWeakLeagueCountryInfo( varMap, varPlayer )

    local nCountryScores = {}
    local nCountryIds = {}
    for countryID = 0, 3 do
        
         local nLevel = GetCountryParam(varMap, countryID, CD_STRONG_WEAK_LEVEL)
         nCountryScores[ nLevel ] = GetCountryParam( varMap, countryID, CD_LASTWEEK_STRONG_WEAK_JIFEN )
         nCountryIds[ nLevel ] =  countryID
        
    end  
    
    local nTotalScore = nCountryScores[0] + nCountryScores[ 1 ] +  nCountryScores[ 2 ] + nCountryScores[ 3 ]
    local nLastThreeScore = nCountryScores[ 1 ] +  nCountryScores[ 2 ] + nCountryScores[ 3 ]
    
    if nLastThreeScore <= nTotalScore * 0.55 then
        
        return 3,nCountryIds[0],nCountryIds[1],nCountryIds[2],nCountryIds[3]
        
    elseif nCountryScores[ 3 ] <= nTotalScore * 0.2 then
        
        return 2,nCountryIds[0],nCountryIds[1],nCountryIds[2],nCountryIds[3]
        
    else
        
        return 0,nCountryIds[0],nCountryIds[1],nCountryIds[2],nCountryIds[3]
    
    end


end

function x310214_GetCountryName( varCountryID )
    
    if varCountryID == 0 then
        return "楼兰王国"
    elseif varCountryID == 1 then
        return "天山王国"
    elseif varCountryID == 2 then
        return "昆仑王国"
    elseif varCountryID == 3 then
        return "敦煌王国"
    else
        return "天朝"
    end
    
end

