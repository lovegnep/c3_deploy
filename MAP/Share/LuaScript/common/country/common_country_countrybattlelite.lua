x310150_var_FileId                      = 310150

x310150_var_CountryBattleLite_Begin       = 1     
x310150_var_CountryBattleLite_End         = 2     

x310150_var_QuestScriptId 				= 310155
x310150_var_QuestId 					= 7559
x310150_var_BanZhuanQuestId = 10304


x310150_var_TickBuf						= 8727
x310150_var_BufID							= {8719,8720,8721,8722,8723,8724,8725,8726,8727}	

x310150_var_Monster_x51                   ={}
x310150_var_Monster_x50                   ={}
x310150_var_Monster_x58					={}
x310150_var_Monster_x86					={}
x310150_var_Monster_x104 					={}
x310150_var_Monster_x105		 			={}
x310150_var_Monster_x106 					={}
x310150_var_Monster_x107 					={}
x310150_var_Monster_x108 					={}
x310150_var_Monster_x109 					={}
x310150_var_Monster_x110 					={}
x310150_var_Monster_x111 					={}

x310150_var_Match0                        ={} 
x310150_var_Match1                        ={} 

x310150_var_MatchScore0                   ={}
x310150_var_MatchScore1                   ={}

x310150_var_BonusFlag0					={}
x310150_var_BonusFlag1					={}


--1v3模式新增常量
x310150_var_Mode_1v1 = 2
x310150_var_Mode_1v3 = 1
x310150_var_Camp_Attack = 0
x310150_var_Camp_Defend = 1
x310150_var_Camp_Defend_Ass = 2

--1v3模式新增变量
x310150_var_Cur_Mode = {}      --通过此变量来判断是老的1v1模式还是新增的1v3模式，分别处理，以尽量不改写原有代码
x310150_var_Match1v3DefendCountry = {} --1v3时的防守国
x310150_var_Match1v3_Country = {}       
x310150_var_Match1v3_Score = {}
x310150_var_Match1v3_BounsFlag = {}

function x310150_ProcMapCreate(varMap)

	x310150_var_Monster_x51[varMap]   ={}
	x310150_var_Monster_x50[varMap]   ={}
	x310150_var_Monster_x58[varMap]	 ={}
	x310150_var_Monster_x86[varMap]	 ={}
	x310150_var_Monster_x104[varMap]	 ={}
	x310150_var_Monster_x105[varMap]	 ={}
	x310150_var_Monster_x106[varMap]	 ={}
	x310150_var_Monster_x107[varMap]	 ={}
	x310150_var_Monster_x108[varMap]	 ={}
	x310150_var_Monster_x109[varMap]	 ={}
	x310150_var_Monster_x110[varMap]	 ={}
	x310150_var_Monster_x111[varMap]	 ={}
	
	x310150_var_Match0[varMap]       = { -1,-1 } 
	x310150_var_Match1[varMap]       = { -1,-1 } 
	
	x310150_var_MatchScore0[varMap]  = { 0,0 }
	x310150_var_MatchScore1[varMap]  = { 0,0 }
	
	x310150_var_BonusFlag0[varMap]	= {-1,-1}
	x310150_var_BonusFlag1[varMap]	= {-1,-1}
	
	x310150_var_Cur_Mode[varMap] = x310150_var_Mode_1v1
	x310150_var_Match1v3_Country[varMap] = { -1, -1, -1, -1 }
	x310150_var_Match1v3_Score[varMap] = { 0, 0, 0, 0 }
	x310150_var_Match1v3_BounsFlag[varMap] = { -1, -1, -1, -1 }
	x310150_var_Match1v3DefendCountry[varMap] = -1
    
end

function x310150_Is1v1Mode( varMap )

    if x310150_var_Cur_Mode[varMap]  == x310150_var_Mode_1v1 then
        return 1
    end
    
    return 0
end

--得到国家在x310150_var_Match1v3_Country数组里的索引，1,2,3,4or-1
function x310150_GetCountryInArrayIdxFor1v3( varMap,varCountry )
    
    if varCountry < 0 or varCountry >= 4 then
        return -1
    end  
      
    if x310150_Is1v1Mode( varMap ) == 1 then
        return -1
    end

    for i = 1, 4 do
        
        if x310150_var_Match1v3_Country[varMap][i] == varCountry then
            return i
        end
    
    end

    return -1

end


--判断是否是进攻方
function x310150_IsCountryAttack(varMap, varCountry )
	
	
	if x310150_Is1v1Mode( varMap ) == 1 then
	
    	if varCountry == x310150_var_Match0[varMap][1] then
            return 1
        end
        
        if varCountry == x310150_var_Match1[varMap][1] then
            return 1
        end
        
        if varCountry == x310150_var_Match0[varMap][2] then
            return 0
        end
        
        if varCountry == x310150_var_Match1[varMap][2] then
            return 0
        end
        
        return -1
    
    else -- 1v3
   
        if varCountry == x310150_var_Match1v3_Country[varMap][1] then
        
             if varCountry == x310150_var_Match1v3DefendCountry[varMap] then
                   return 0
             else
                   return 1
             end
                   
        elseif varCountry == x310150_var_Match1v3_Country[varMap][2] or
                varCountry == x310150_var_Match1v3_Country[varMap][3] or
                varCountry == x310150_var_Match1v3_Country[varMap][4] then
        
             if x310150_var_Match1v3_Country[varMap][2] == x310150_var_Match1v3DefendCountry[varMap] or 
                 x310150_var_Match1v3_Country[varMap][3] == x310150_var_Match1v3DefendCountry[varMap] or
                 x310150_var_Match1v3_Country[varMap][4] == x310150_var_Match1v3DefendCountry[varMap] then
                   return 0
             else
                   return 1
             end
        
        else
            return -1
        end
       
    	
   end

	
end


--此函数主要用于1v3时， 当3方为防守方时，其中只有一个国家为实际防守方，其他两国为辅助防守方, 辅助防守方此函数也返回0
function x310150_IsCountryDefend( varMap, varCountry )
    
    if x310150_Is1v1Mode( varMap ) == 1 then
        
        if x310150_IsCountryAttack( varMap, varCountry ) == 0 then
            return 1
        else
            return 0
        end
    
    else -- 1v3
    
        if varCountry == x310150_var_Match1v3DefendCountry[varMap] then
            return 1
        else
            return 0
        end
    
    end
end




function x310150_IsBattleFinished( varMap,varPlayer )

    if x310150_Is1v1Mode( varMap ) == 1 then

        	local nCountryId = GetCurCountry(varMap,varPlayer)
        	if x310150_IsCountryAttack( varMap, nCountryId ) == 1 then
        	
        		
        		if x310150_var_Match0[varMap][1] == -1 then
        			return 1
        		end
        		
        		
        		
        		if x310150_var_Match0[varMap][1] == nCountryId then
        			
        			if x310150_var_MatchScore0[varMap][1] == 10 then
        				return 1
        			end			
        		end
        		
        		if x310150_var_Match1[varMap][1] == nCountryId then
        			
        			if x310150_var_MatchScore1[varMap][1] == 10 then
        				return 1
        			end			
        		end
        		
        		
        		return 0
        	else
        		
        		
        		if x310150_var_Match0[varMap][2] == -1 then
        			return 1
        		end
        		
        		
        		if x310150_var_Match0[varMap][2] == nCountryId then
        			
        			if x310150_var_MatchScore0[varMap][2] == 0 then
        				return 1
        			end			
        		end
        		
        		if x310150_var_Match1[varMap][2] == nCountryId then
        			
        			if x310150_var_MatchScore1[varMap][2] == 0 then
        				return 1
        			end			
        		end
        		
        		
        		return 0
        		
        	end
        	
    else-- 1v3
    
         local nCountryId = GetCurCountry( varMap,varPlayer )
         local idx = x310150_GetCountryInArrayIdxFor1v3( varMap, nCountryId )
         if  idx < 0 then
              
               return 1
         end
         
         if x310150_IsCountryAttack( varMap, nCountryId ) == 1 then
             
             if x310150_var_Match1v3_Score[varMap][idx] == 10 then
                    
                   return 1
             end
             
         else   
         
             if x310150_var_Match1v3_Score[varMap][idx] == 0 then
            
                     
                    return 1
             end
         
         end
         
         return 0
    
    end

end




function x310150_ProcEventEntry( varMap ,varPlayer, varTalknpc )
end




function x310150_GetCountryIdBySceneId( varMap )
    
    if varMap == 50 or varMap == 51 then
        return 0
    elseif varMap == 150 or varMap == 151  then
        return 1
    elseif varMap == 250 or varMap == 251  then
        return 2
    elseif varMap == 350 or varMap == 351  then
        return 3
    else
        return -1   
    end 
end



--此函数返回4个值，前三个为配对国家，最后一个为数量
function x310150_GetMatchCountry( varMap )
    
    local varCountry = x310150_GetCountryIdBySceneId( varMap )
    if varCountry < 0 then
        return -1, -1, -1, 0
    end
   
    return x310150_GetMatchCountryByCountryID( varMap, varCountry )
    
end




--此函数返回4个值，前三个为配对国家，最后一个为数量
function x310150_GetMatchCountryByCountryID( varMap, varCountry )
    
   if x310150_Is1v1Mode( varMap ) == 1 then
    
            if varCountry == x310150_var_Match0[varMap][1] then
                return x310150_var_Match0[varMap][2], -1, -1, 1
            end
            
            
            if varCountry == x310150_var_Match0[varMap][2] then
                return x310150_var_Match0[varMap][1], -1, -1, 1
            end
            
            if varCountry == x310150_var_Match1[varMap][1] then
                return x310150_var_Match1[varMap][2], -1, -1, 1
            end
            
            if varCountry == x310150_var_Match1[varMap][2] then
                return x310150_var_Match1[varMap][1], -1, -1, 1
            end
            
            return -1, -1, -1, 0   
            
   else --1v3
   
         
         
         if varCountry == x310150_var_Match1v3_Country[varMap][1] then
            
            return x310150_var_Match1v3_Country[varMap][2],x310150_var_Match1v3_Country[varMap][3],x310150_var_Match1v3_Country[varMap][4],3
         
         elseif varCountry == x310150_var_Match1v3_Country[varMap][2] or 
                varCountry == x310150_var_Match1v3_Country[varMap][3] or
                varCountry == x310150_var_Match1v3_Country[varMap][4] then
                
                return x310150_var_Match1v3_Country[varMap][1], -1, -1, 1
         else
            
            return -1,-1,-1,0
         
         end
   
   
   
   end          
end




function x310150_ProcDie( varMap,varPlayer,varKiller )

    
    local dataid = GetMonsterDataID( varMap,varPlayer)
    if dataid ~= 9700 and dataid ~= 9701 and dataid ~= 9702 and dataid ~= 9703 and dataid ~= 9704 and dataid ~= 9714 and dataid ~= 9715 and  dataid ~= 9776 and dataid ~= 9777 then
        return
    end
    
    local nMatchCountryId1, nMatchCountryId2, nMatchCountryId3, cnt = x310150_GetMatchCountry(varMap)
    x310150_ProcMonsterKillObject( varMap,varPlayer,varKiller,nMatchCountryId1,nMatchCountryId2,nMatchCountryId3 )
    
    
    local nCountryId = x310150_GetCountryIdBySceneId( varMap )
    CountryBattleLiteSyncKillCount( varMap,nCountryId )
    
    
    
    local nQuestData = 0
    if dataid == 9700 or dataid == 9714 or dataid == 9701 or dataid == 9702 or dataid == 9776 then
    	nQuestData = 10000
    elseif dataid == 9715 or dataid == 9703 or dataid == 9777 then
    	nQuestData = 1000
    elseif dataid == 9704 then
    	nQuestData = 100
    end
    
    
    if( x310150_Is1v1Mode( varMap ) == 1 ) then --1v1
        
        if nMatchCountryId1 >= 0 then
            SetCountryQuestData(varMap,nMatchCountryId1,CD_INDEX_COUNTRYBATTLELITE_KILLCOUNT,nQuestData,1) --设置进攻方
        end
        
        SetCountryQuestData(varMap,nCountryId,CD_INDEX_COUNTRYBATTLELITE_KILLCOUNT,nQuestData,1) --设置防守方
        
    else --1v3
       
         for i = 0, 3 do
         
             SetCountryQuestData(varMap, i,CD_INDEX_COUNTRYBATTLELITE_KILLCOUNT,nQuestData,1)
         
         end
         
    end
    
   
    
    
    if IsPlayerStateNormal( varMap, varKiller ) == 1 then
        local killername = GetName( varMap, varKiller )
        if killername == nil then
            killername = "ErrorName"
        end
        
        local nKillerCountryId = GetCurCountry( varMap, varKiller )
        local strMsg = format("CBL:<Info>x310150_ProcDie [killerInfo] varMap = %d, killer = %s, killercountryId=%d, nCountryId=%d", varMap, killername, nKillerCountryId, nCountryId  )
        WriteLog( 1, strMsg )
    end
    
    
    local strMsg = format("CBL:<Info>x310150_ProcDie varMap = %d countryId=%d,nMatchCountryId=%d,%d,%d", varMap, nCountryId, nMatchCountryId1,nMatchCountryId2,nMatchCountryId3  )
    WriteLog( 1, strMsg )    
    
end




function x310150_ProcSetCountryBattleLiteMatchInfo( varMap,countryId0,countryId1,countryId2,countryId3, varMode, var1v3DefendCountry )
    
    if varMode ~= x310150_var_Mode_1v1 and varMode ~= x310150_var_Mode_1v3 then
           local strMsg = format("CBL:<Info>SetCountryBattleLiteMatchInfo Error:find invalid Mode ! varMap = %d, varMode=%d", varMap, varMode  )
           WriteLog( 1, strMsg ) 
           return   
    end
 
    x310150_var_Cur_Mode[varMap] = varMode
    
    
    if x310150_Is1v1Mode( varMap ) == 1 then
    
        x310150_var_Match0[varMap][1] = countryId0
        x310150_var_Match0[varMap][2] = countryId1
        
        x310150_var_Match1[varMap][1] = countryId2
        x310150_var_Match1[varMap][2] = countryId3
        
        x310150_var_MatchScore0[varMap][1] = 0
        x310150_var_MatchScore0[varMap][2] = 10
        
        x310150_var_MatchScore1[varMap][1] = 0
        x310150_var_MatchScore1[varMap][2] = 10
        
        x310150_var_Match1v3DefendCountry[varMap] = -1
        
    else -- 1v3
    
        x310150_var_Match1v3DefendCountry[varMap] = var1v3DefendCountry   
        x310150_var_Match1v3_Country[varMap][1] = countryId0
        x310150_var_Match1v3_Country[varMap][2] = countryId1
        x310150_var_Match1v3_Country[varMap][3] = countryId2
        x310150_var_Match1v3_Country[varMap][4] = countryId3
        
        if x310150_var_Match1v3DefendCountry[varMap] ==  x310150_var_Match1v3_Country[varMap][1] then 
        
             x310150_var_Match1v3_Score[varMap][1]= 10
             x310150_var_Match1v3_Score[varMap][2]= 0
             x310150_var_Match1v3_Score[varMap][3]= 0
             x310150_var_Match1v3_Score[varMap][4]= 0
            
        else
             x310150_var_Match1v3_Score[varMap][1]= 0
             x310150_var_Match1v3_Score[varMap][2]= 10
             x310150_var_Match1v3_Score[varMap][3]= 10
             x310150_var_Match1v3_Score[varMap][4]= 10
             
        end
       
     end
    
    local strMsg = format("CBL:<Info>SetCountryBattleLiteMatchInfo varMap = %d, mode=%d, countryId0=%d, countryId1=%d, countryId2=%d, countryId3=%d,var1v3DefendCountry=%d", varMap, varMode, countryId0, countryId1, countryId2, countryId3,var1v3DefendCountry  )
    WriteLog( 1, strMsg )
end




function x310150_ProcCountryBattleLiteSyncKillCout( varMap,countryId,killcount,targetSceneId )

	while killcount >=10000 do
		killcount = killcount - 10000
	end
	
	while killcount >= 1000 do
		killcount = killcount - 1000
	end
	
	while killcount >= 100 do
		killcount = killcount - 100
	end

    if x310150_Is1v1Mode( varMap ) == 1 then

                if countryId == x310150_var_Match0[varMap][1] then
                    x310150_var_MatchScore0[varMap][1] = killcount
                    
                    if killcount == 10 then
                    	if x310150_IsCountryAttack( varMap,countryId) == 1 then
                    		x310150_var_BonusFlag0[varMap][1] = GetMinOfYear()
                    	end
                    end
                elseif countryId == x310150_var_Match0[varMap][2] then
                    x310150_var_MatchScore0[varMap][2] = killcount
                    
                    if killcount == 0 then
                    	if x310150_IsCountryAttack( varMap,countryId) == 0 then
                    		x310150_var_BonusFlag0[varMap][2] = GetMinOfYear()
                    	end
                    end 
                elseif countryId == x310150_var_Match1[varMap][1] then
                    x310150_var_MatchScore1[varMap][1] = killcount
                    
                    if killcount == 10 then
                    	if x310150_IsCountryAttack( varMap,countryId) == 1 then
                    		x310150_var_BonusFlag1[varMap][1] = GetMinOfYear()
                    	end
                    end 
                elseif countryId == x310150_var_Match1[varMap][2] then
                    x310150_var_MatchScore1[varMap][2] = killcount
                    
                    if killcount == 0 then
                    	if x310150_IsCountryAttack( varMap,countryId) == 0 then
                    		x310150_var_BonusFlag1[varMap][2] = GetMinOfYear()
                    	end
                    end
                end
                
    else -- 1v3
    

               if countryId == x310150_var_Match1v3_Country[varMap][1] then
                    x310150_var_Match1v3_Score[varMap][1] = killcount
                    
                    if x310150_IsCountryAttack( varMap,countryId) == 1 then
                           if killcount == 10 then
                    		    x310150_var_Match1v3_BounsFlag[varMap][1] = GetMinOfYear()
                    	   elseif killcount == 0 then
                    	         x310150_var_Match1v3_BounsFlag[varMap][1] = GetMinOfYear()
                          end
                    end
                    
                elseif countryId == x310150_var_Match1v3_Country[varMap][2] then
                    x310150_var_Match1v3_Score[varMap][2] = killcount
                    
                     if x310150_IsCountryAttack( varMap,countryId) == 1 then
                           if killcount == 10 then
                    		    x310150_var_Match1v3_BounsFlag[varMap][2] = GetMinOfYear()
                    	   elseif killcount == 0 then
                    	         x310150_var_Match1v3_BounsFlag[varMap][2] = GetMinOfYear()
                          end
                    end
                    
                elseif countryId == x310150_var_Match1v3_Country[varMap][3] then
                    x310150_var_Match1v3_Score[varMap][3] = killcount
                    
                     if x310150_IsCountryAttack( varMap,countryId) == 1 then
                           if killcount == 10 then
                    		    x310150_var_Match1v3_BounsFlag[varMap][3] = GetMinOfYear()
                    	   elseif killcount == 0 then
                    	         x310150_var_Match1v3_BounsFlag[varMap][3] = GetMinOfYear()
                          end
                    end
               elseif countryId == x310150_var_Match1v3_Country[varMap][4] then
                    x310150_var_Match1v3_Score[varMap][4] = killcount
                    
                     if x310150_IsCountryAttack( varMap,countryId) == 1 then
                           if killcount == 10 then
                    		    x310150_var_Match1v3_BounsFlag[varMap][4] = GetMinOfYear()
                    	   elseif killcount == 0 then
                    	        x310150_var_Match1v3_BounsFlag[varMap][4] = GetMinOfYear()
                          end
                    end
               end
    
    end
    
    
	x310150_ProcCountryKillCountChanged( varMap,countryId,killcount )

    
    if targetSceneId == varMap then
        local varMsg = format("国家军力：%d/10",killcount)
        LuaAllScenceM2Country( varMap,varMsg,countryId, 5,1)
        LuaAllScenceM2Country( varMap,varMsg,countryId, 5,1) 
		LuaAllScenceM2Country( varMap,varMsg,countryId, 2,0)
        LuaAllScenceM2Country( varMap,varMsg,countryId, 2,0) 
    end
    
    local strMsg = format("CBL:<Info>CountryBattleLiteSyncKillCout varMap = %d countryId=%d,killcount=%d,targetSceneId=%d", varMap,countryId, killcount,targetSceneId  )
    WriteLog( 1, strMsg )
        
end




function x310150_ProcCountryBattleLiteState( varMap, varState )

    
    local strMsg = format("CBL:<Info>OnCountryBattleLiteState varMap = %d, varState = %d", varMap, varState)
    WriteLog( 1, strMsg )

    
    if varState == x310150_var_CountryBattleLite_Begin then
        
        
        if varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 then
            x310150_ProcStartCountryBattleLite_x51( varMap  )
        elseif varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then
            x310150_ProcStartCountryBattleLite_x50( varMap  )
		elseif varMap == 58 or varMap == 158 or varMap == 258 or varMap == 358 then
            x310150_ProcStartCountryBattleLite_x58( varMap  )
		elseif varMap == 104 or varMap == 204 or varMap == 304 or varMap == 404 then
        	x310150_ProcStopCountryBattleLite_x104( varMap )
		elseif varMap == 105 or varMap == 205 or varMap == 305 or varMap == 405 then
        	x310150_ProcStopCountryBattleLite_x105( varMap )
		elseif varMap == 106 or varMap == 206 or varMap == 306 or varMap == 406 then
        	x310150_ProcStopCountryBattleLite_x106( varMap )
		elseif varMap == 107 or varMap == 207 or varMap == 307 or varMap == 407 then
        	x310150_ProcStopCountryBattleLite_x107( varMap )
		elseif varMap == 108 or varMap == 208 or varMap == 308 or varMap == 408 then
        	x310150_ProcStopCountryBattleLite_x108( varMap )
		elseif varMap == 109 or varMap == 209 or varMap == 309 or varMap == 409 then
        	x310150_ProcStopCountryBattleLite_x109( varMap )
		elseif varMap == 110 or varMap == 210 or varMap == 310 or varMap == 410 then
        	x310150_ProcStopCountryBattleLite_x110( varMap )
		elseif varMap == 111 or varMap == 211 or varMap == 311 or varMap == 411 then
        	x310150_ProcStopCountryBattleLite_x111 ( varMap )
        elseif varMap == 86 or varMap == 186 or varMap == 286 or varMap == 386  or varMap == 3 then
        	x310150_ProcStartCountryBattleLite_x86( varMap )
        end


        x310150_var_BonusFlag0[varMap] = {-1,-1}
        x310150_var_BonusFlag1[varMap] = {-1,-1}
        x310150_var_Match1v3_BounsFlag[varMap] = { -1, -1, -1, -1 }
        
        
    elseif varState == x310150_var_CountryBattleLite_End then
        
        
        if varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 then
            x310150_ProcStopCountryBattleLite_x51( varMap )
        elseif varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then
            x310150_ProcStopCountryBattleLite_x50( varMap )
		elseif varMap == 58 or varMap == 158 or varMap == 258 or varMap == 358 then
            x310150_ProcStopCountryBattleLite_x58( varMap )
        elseif varMap == 86 or varMap == 186 or varMap == 286 or varMap == 386 then
        	x310150_ProcStopCountryBattleLite_x86( varMap )
		elseif varMap == 104 or varMap == 204 or varMap == 304 or varMap == 404 then
        	x310150_ProcStopCountryBattleLite_x104( varMap )
		elseif varMap == 105 or varMap == 205 or varMap == 305 or varMap == 405 then
        	x310150_ProcStopCountryBattleLite_x105( varMap )
		elseif varMap == 106 or varMap == 206 or varMap == 306 or varMap == 406 then
        	x310150_ProcStopCountryBattleLite_x106( varMap )
		elseif varMap == 107 or varMap == 207 or varMap == 307 or varMap == 407 then
        	x310150_ProcStopCountryBattleLite_x107( varMap )
		elseif varMap == 108 or varMap == 208 or varMap == 308 or varMap == 408 then
        	x310150_ProcStopCountryBattleLite_x108( varMap )
		elseif varMap == 109 or varMap == 209 or varMap == 309 or varMap == 409 then
        	x310150_ProcStopCountryBattleLite_x109( varMap )
		elseif varMap == 110 or varMap == 210 or varMap == 310 or varMap == 410 then
        	x310150_ProcStopCountryBattleLite_x110( varMap )
		elseif varMap == 111 or varMap == 211 or varMap == 311 or varMap == 411 then
        	x310150_ProcStopCountryBattleLite_x111 ( varMap )
        elseif varMap == 68 or varMap == 168 or varMap == 268 or varMap == 368  or varMap == 3 then
        	x310150_ProcStopCountryBattleLite_x68( varMap )
        end
        
        
        x310150_var_BonusFlag0[varMap] = {-1,-1}
        x310150_var_BonusFlag1[varMap] = {-1,-1}
        x310150_var_Match1v3_BounsFlag[varMap] = { -1, -1, -1, -1 }
        
    end
end


function x310150_IsCanJoinCountryBattleLite( varMap, varPlayer)

	
	local MutexStateList = { 
                            PLAYER_STATE_STALL,                     
                            PLAYER_STATE_FUBEN,                 
                            PLAYER_STATE_GUILDBATTLEFIELDSCENE,     
                            PLAYER_STATE_PRISONSCENE,               
                            PLAYER_STATE_BUS,                       
                            PLAYER_STATE_CRASHBOX,                  
                            PLAYER_STATE_MENTALGAME,                
                            PLAYER_STATE_PRISON,                    
                            PLAYER_STATE_TIESAN,                    
                            PLAYER_STATE_READYFUBEN,            
                            PLAYER_STATE_WEDDING,				    
                            PLAYER_STATE_ENJAIL,
                            PLAYER_STATE_TONGQUBUFF,				    
						   }

    for varI, mutex in MutexStateList do
        if IsPlayerMutexState( varMap, varPlayer, MutexStateList[ varI ] ) > 0 then
            return 0
        end
    end

    return 1
end



--处理玩家点击加入屠城战，向GL请求处理
function x310150_AskEnterCountryBattleLite( varMap, varPlayer )
    
    if IsPlayerStateNormal( varMap, varPlayer) == 0 or x310150_IsCanJoinCountryBattleLite( varMap, varPlayer) == 0 then
        Msg2Player( varMap, varPlayer, "你现在不能参加【屠城战】", 8, 3)
        return
    end

	if x310150_CheckEnable( varMap, varPlayer) <= 0  then
		return
	end

    
    AskEnterCountryBattleLite( varMap,varPlayer )
    
    local varName = GetName(varMap,varPlayer)
    if varName == nil then
        varName = "<ErrorName>"
    end

    local strMsg = format("CBL:<Info>AskEnterCountryBattleLite varMap = %d, varName = %s", varMap, varName )
    WriteLog( 1, strMsg )
    
end



--通知玩家客户端屠城战开始了，要不要来参加
function x310150_ProcCountryBattleLiteAskPlayerEnterScene(varMap,varPlayer,campFlag, varMode, matchCountry1, matchCountry2, matchCountry3, nDefendCountry )
    
    local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 40 then
		return
	end
	
	if x310150_CheckEnable( varMap, varPlayer) <= 0  then
		return
	end
    
    SpeerPlayerToEnterCountryBattleLite( varMap, varPlayer, campFlag ,varMode, matchCountry1,matchCountry2,matchCountry3, nDefendCountry )
    
    local varName = GetName(varMap,varPlayer)
    if varName == nil then
        varName = "<ErrorName>"
    end

    local strMsg = format("CBL:<Info>CountryBattleLiteAskPlayerEnterScene varMap = %d,varName = %s,campFlag=%d ,varMode=%d,matchCountry=%d,%d,%d", varMap, varName, campFlag,varMode,matchCountry1,matchCountry2,matchCountry3 )
    WriteLog( 1, strMsg )
    
end




function x310150_CountryBattleLite_RefreshQuest( varMap,varPlayer )

	
	if varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and
	   varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 and
	   varMap ~= 58 and varMap ~= 158 and varMap ~= 258 and varMap ~= 358 and
	   varMap ~= 104 and varMap ~=204 and varMap ~= 304 and varMap ~= 404 and
	   varMap ~= 76 and varMap ~= 176 and varMap ~= 276 and varMap ~= 376 and
	   varMap ~= 86 and varMap ~= 186 and varMap ~= 286 and varMap ~= 386 and
	   varMap ~= 105 and varMap ~=205 and varMap ~= 305 and varMap ~= 405 and
	   varMap ~= 106 and varMap ~=206 and varMap ~= 306 and varMap ~= 406 and
	   varMap ~= 107 and varMap ~=207 and varMap ~= 307 and varMap ~= 407 and
	   varMap ~= 108 and varMap ~=208 and varMap ~= 308 and varMap ~= 408 and
	   varMap ~= 109 and varMap ~=209 and varMap ~= 309 and varMap ~= 409 and
	   varMap ~= 110 and varMap ~=210 and varMap ~= 310 and varMap ~= 410 and
	   varMap ~= 111 and varMap ~=211 and varMap ~= 311 and varMap ~= 411 and
	   varMap ~= 91 and varMap ~= 191 and varMap ~= 291 and varMap ~= 391 and varMap ~= 3 then
	   return
	end
	
	
	if getn(x310150_var_Monster_x51[varMap]) == 0 then
		
	end
	
	
	if GetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG) == 1 then
		SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,0)
		local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
		local nMatchCountry1,nMatchCountry2,nMatchCountry3,cnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
		x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nMatchCountry1,nMatchCountry2,nMatchCountry3,0 )
	end
	
end

function x310150_SetPlayerQuestParamMatchCountry( varMap, varPlayer, varQuestId, varMatchCou1,varMatchCou2,varMatchCou3 )

    if varMatchCou1 < 0 then 
        varMatchCou1 = -1
    end
    if varMatchCou2 < 0 then
        varMatchCou2 = -1
    end
    if varMatchCou3 < 0 then
        varMatchCou3 = -1
    end   
    
    varMatchCou1 = varMatchCou1 + 1
    varMatchCou2 = varMatchCou2 + 1
    varMatchCou3 = varMatchCou3 + 1
    
    local value = varMatchCou1 * 100 + varMatchCou2 * 10  + varMatchCou3
    
    SetQuestParam( varMap,varPlayer,varQuestId,6, value )

end

function x310150_GetPlayerQuestParamMatchCountry( varMap, varPlayer, varQuestId )

    local value = GetQuestParam( varMap, varPlayer, varQuestId, 6 )
    
    local varMatchCou1 = floor(value / 100)
    local varMatchCou2 = floor(value / 10 ) - (varMatchCou1 * 10)
    local varMatchCou3 = value - (varMatchCou1 * 100) - ( varMatchCou2 * 10 )
    
    varMatchCou1 = varMatchCou1 - 1
    varMatchCou2 = varMatchCou2 - 1
    varMatchCou3 = varMatchCou3 - 1
    
    if varMatchCou1 < 0 or varMatchCou1 >= 4 then
        varMatchCou1 = -1
    end
    
    if varMatchCou2 < 0 or varMatchCou2 >= 4 then
        varMatchCou2 = -1
    end
    
    if varMatchCou3 < 0 or varMatchCou3 >= 4 then
        varMatchCou3 = -1
    end
    
    return varMatchCou1, varMatchCou2, varMatchCou3
    
end




--处理玩家加入屠城战
function x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nMatchCountry1,nMatchCountry2,nMatchCountry3,varFlag )

    
    if x310150_IsQuestCanAccept( varMap,varPlayer) == 333 then --0 then
		if varFlag == nil or varFlag == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"今天您已经参加过【国家】屠城战了！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		return
	end
	
	
    local nFrom = 16*60 + 0
    local nTo   = 16*60 + 20
    local minTime = GetMinOfDay()

    if minTime < nFrom or minTime > nTo then
    	StartTalkTask(varMap)
		TalkAppendString(varMap,"参加【国家】屠城战时间已过！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
        return
    end
    
    
    if IsHideName(varMap,varPlayer) ~= 0 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap,"蒙面状态不能参加【国家】屠城战！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
    	return
    end
	
	if IsHaveQuest(varMap,varPlayer, x310150_var_QuestId) == 0 then
		
		
		if IsQuestFullNM(varMap,varPlayer)==1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您的任务已经满了，无法参加屠城战！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 
		end
		if varMap == 89 or varMap == 189 or varMap == 289 or varMap == 389 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"此场景不能接【国家】屠城战任务！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
		
		if AddQuest(varMap,varPlayer,x310150_var_QuestId,x310150_var_QuestScriptId,0,0,0,1) ~= 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"参加屠城战失败，无法添加相关任务！请去国家管理员处尝试报名参加！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
	end	
	
	
	GamePlayScriptLog( varMap, varPlayer, 1511)

	local nCurDayTime = GetDayOfYear()+100
	
	
	local varQuestIdx = GetQuestIndexByID( varMap,varPlayer,x310150_var_QuestId)
	SetQuestParam( varMap,varPlayer,x310150_var_QuestId,3,0)					
	SetQuestParam( varMap,varPlayer,x310150_var_QuestId,4,nCurDayTime)
	SetQuestParam( varMap,varPlayer,x310150_var_QuestId,5,campFlag)
	--SetQuestParam( varMap,varPlayer,x310150_var_QuestId,6,nMatchCountry) --由下面接口代替
	x310150_SetPlayerQuestParamMatchCountry( varMap, varPlayer, x310150_var_QuestId, nMatchCountry1,nMatchCountry2,nMatchCountry3 )
	
	
	x310150_SetQuestAcceptDate(varMap,varPlayer)
	
	
	local varCountry = GetCurCountry(varMap,varPlayer)
	local nBufID = x310150_var_BufID[varCountry*2+1]
	if nBufID ~= -1 then
		if GetSex(varMap,varPlayer) == 0 then
			nBufID = nBufID + 1
		end
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,nBufID,0)
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x310150_var_TickBuf,0)
	end
	
	
	if varFlag == nil then
		LuaCallNoclosure(310155,"ProcQuestLogRefresh",varMap, varPlayer, x310150_var_QuestId)
	end
    
    StartTalkTask(varMap)
	TalkAppendString(varMap,"您参加了屠城战！")
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	
	local varCountry = GetCurCountry( varMap,varPlayer)
	local varName = GetName(varMap,varPlayer)
    if varName == nil then
        varName = "<ErrorName>"
    end

    local strMsg = format("CBL:<Info>CountryBattleLiteChangeScene varMap = %d,varName = %s varCountry = %d,nMatchCountry = %d,%d,%d campFlag = %d",varMap, varName,varCountry,nMatchCountry1,nMatchCountry2,nMatchCountry3,campFlag )
    WriteLog( 1, strMsg ) 
end




function x310150_IsMonsterValid_x58( varMap,varIndex )
	
	local varCount = getn(x310150_var_Monster_x58[varMap])
	if varIndex < 1 or varIndex > varCount then
		return 0
	end
	
	if IsObjValid(varMap,x310150_var_Monster_x58[varMap][varIndex]) ~= 1 or GetHp(varMap,x310150_var_Monster_x58[varMap][varIndex]) <= 0 then
		return 0
	end
	
	
	return 1
	
end




function x310150_IsMonsterValid_x51( varMap,varIndex )
	
	local varCount = getn(x310150_var_Monster_x51[varMap])
	if varIndex < 1 or varIndex > varCount then
		return 0
	end
	
	if IsObjValid(varMap,x310150_var_Monster_x51[varMap][varIndex]) ~= 1 or GetHp(varMap,x310150_var_Monster_x51[varMap][varIndex]) <= 0 then
		return 0
	end
	
	
	return 1
	
end

function x310150_IsMonsterValid_x50( varMap,varIndex )
	
	local varCount = getn(x310150_var_Monster_x50[varMap])
	if varIndex < 1 or varIndex > varCount then
		return 0
	end
	
	if IsObjValid(varMap,x310150_var_Monster_x50[varMap][varIndex]) ~= 1 or GetHp(varMap,x310150_var_Monster_x50[varMap][varIndex]) <= 0 then
		return 0
	end
	
	
	return 1
	
end




function x310150_IsMonsterValid_x86( varMap,varIndex )
	
	local varCount = getn(x310150_var_Monster_x86[varMap])
	if varIndex < 1 or varIndex > varCount then
		return 0
	end
	
	if IsObjValid(varMap,x310150_var_Monster_x86[varMap][varIndex]) ~= 1 or GetHp(varMap,x310150_var_Monster_x86[varMap][varIndex]) <= 0 then
		return 0
	end
	
	
	return 1
	
end




function x310150_ProcStartCountryBattleLite_x51( varMap )
    local strMsg = format("CBL:<Info>begin,StartCountryBattleLite_Bianjin varMap = %d ",varMap )
    WriteLog( 1, strMsg )
    
    
    
    local n = getn(x310150_var_Monster_x51[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x51[varMap][varI] )
        end
        
        local strMsg = format("CBL:<Error>StartCountryBattleLite_Bianjin varMap = %d, n = %d",varMap, n)
        WriteLog( 1, strMsg )
        
        x310150_var_Monster_x51[varMap] = {}
    end
    
    
    local campId = x310150_SelectNpcCamp( varMap )
	local varCountry = x310150_GetCountryIdBySceneId( varMap )
	if x310150_IsCountryDefend( varMap, varCountry ) == 1 then --只有是防守方，才刷怪
		if varCountry == 0 then
			x310150_var_Monster_x51[varMap][1] = CreateMonster(varMap, 9700, 384, 276, 27, -1, x310150_var_FileId, 129740, campId, -1, 0, "", "" )
			x310150_var_Monster_x51[varMap][2] = CreateMonster(varMap, 9714, 313, 205, 27, -1, x310150_var_FileId, 129741, campId, -1, 0, "", "" )
		elseif  varCountry == 1 then
			x310150_var_Monster_x51[varMap][1] = CreateMonster(varMap, 9700, 384, 276, 27, -1, x310150_var_FileId, 129740, campId, -1, 0, "", "" )
			x310150_var_Monster_x51[varMap][2] = CreateMonster(varMap, 9714, 313, 205, 27, -1, x310150_var_FileId, 129741, campId, -1, 0, "", "" )
		elseif  varCountry == 2 then
			x310150_var_Monster_x51[varMap][1] = CreateMonster(varMap, 9700, 384, 276, 27, -1, x310150_var_FileId, 129740, campId, -1, 0, "", "" )
			x310150_var_Monster_x51[varMap][2] = CreateMonster(varMap, 9714, 313, 205, 27, -1, x310150_var_FileId, 129741, campId, -1, 0, "", "" )
		elseif  varCountry == 3 then
			x310150_var_Monster_x51[varMap][1] = CreateMonster(varMap, 9700, 384, 276, 27, -1, x310150_var_FileId, 129740, campId, -1, 0, "", "" )
			x310150_var_Monster_x51[varMap][2] = CreateMonster(varMap, 9714, 313, 205, 27, -1, x310150_var_FileId, 129741, campId, -1, 0, "", "" )
		end                                                            
		
		for varI,item in x310150_var_Monster_x51[varMap] do
			SendSpecificImpactToUnit(varMap,item,item,item,8354,0)
		end
		
	    
		local strMsg = format("CBL:<Info>end,StartCountryBattleLite_Bianjin varMap = %d ,m1:%d,m2:%d ",varMap,x310150_var_Monster_x51[varMap][1],x310150_var_Monster_x51[varMap][2] )
		WriteLog( 1, strMsg )
	end

end




function x310150_ProcStopCountryBattleLite_x51( varMap )
    
    local n = getn(x310150_var_Monster_x51[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x51[varMap][varI] )
        end
        
        x310150_var_Monster_x51[varMap] = {}
    end
    
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_Bianjin varMap = %d",varMap )
    WriteLog( 1, strMsg )
end






function x310150_ProcStartCountryBattleLite_x50( varMap )
	local strMsg = format("CBL:<Info>begin,StartCountryBattleLite_50 varMap = %d ",varMap )
    WriteLog( 1, strMsg )
   
    
    
    local n = getn(x310150_var_Monster_x50[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x50[varMap][varI] )
        end
        
        local strMsg = format("CBL:<Error>StartCountryBattleLite_50 varMap = %d, n = %d",varMap, n)
        WriteLog( 1, strMsg )
        
        x310150_var_Monster_x50[varMap] = {}
    end
	local campId = x310150_SelectNpcCamp( varMap )
	local varCountry = x310150_GetCountryIdBySceneId( varMap )

	if x310150_IsCountryDefend( varMap, varCountry ) == 1 then --只有防守方才刷怪
		if varCountry == 0 then
			x310150_var_Monster_x50[varMap][1] = CreateMonster( varMap, 9701, 185, 315, 24,   2, x310150_var_FileId, 129742, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][2] = CreateMonster( varMap, 9702, 322, 396, 24,  -1, x310150_var_FileId, 129743, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][3] = CreateMonster( varMap, 9702, 372, 230, 24,  -1, x310150_var_FileId, 129744, campId, -1, 0, "", "" )

			x310150_var_Monster_x50[varMap][4] = CreateMonster( varMap, 9776, 255, 267, 27,  -1, x310150_var_FileId, 129745, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][5] = CreateMonster( varMap, 9715, 255, 229, 27,  -1, x310150_var_FileId, 129746, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][6] = CreateMonster( varMap, 9703, 213, 189, 27, 209, x310150_var_FileId, 129747, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][7] = CreateMonster( varMap, 9777, 291, 189, 27,  -1, x310150_var_FileId, 129748, campId, -1, 270, "", "" )
			x310150_var_Monster_x50[varMap][8] = CreateMonster( varMap, 9704, 255, 170, 27,  -1, x310150_var_FileId, 129749, campId, -1, 0, "", "" )

			
			x310150_var_Monster_x50[varMap][9]  = CreateMonster( varMap, 9713, 250, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][10] = CreateMonster( varMap, 9713, 260, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][11] = CreateMonster( varMap, 9713, 255, 259, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][12] = CreateMonster( varMap, 9713, 251, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][13] = CreateMonster( varMap, 9713, 258, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][14] = CreateMonster( varMap, 9713, 221, 200, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][15] = CreateMonster( varMap, 9713, 255, 210, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][16] = CreateMonster( varMap, 9713, 255, 196, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][17] = CreateMonster( varMap, 9713, 264, 191, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][18] = CreateMonster( varMap, 9713, 281, 192, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][19] = CreateMonster( varMap, 9713, 250, 177, 21, -1, -1, -1, campId, -1, 0, "", "" )
		elseif  varCountry == 1 then
			x310150_var_Monster_x50[varMap][1] = CreateMonster( varMap, 9701, 185, 315, 24,   2, x310150_var_FileId, 129742, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][2] = CreateMonster( varMap, 9702, 322, 396, 24,  -1, x310150_var_FileId, 129743, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][3] = CreateMonster( varMap, 9702, 372, 230, 24,  -1, x310150_var_FileId, 129744, campId, -1, 0, "", "" )

			x310150_var_Monster_x50[varMap][4] = CreateMonster( varMap, 9776, 255, 267, 27,  -1, x310150_var_FileId, 129745, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][5] = CreateMonster( varMap, 9715, 255, 229, 27,  -1, x310150_var_FileId, 129746, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][6] = CreateMonster( varMap, 9703, 213, 189, 27, 209, x310150_var_FileId, 129747, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][7] = CreateMonster( varMap, 9777, 291, 189, 27,  -1, x310150_var_FileId, 129748, campId, -1, 270, "", "" )
			x310150_var_Monster_x50[varMap][8] = CreateMonster( varMap, 9704, 255, 170, 27,  -1, x310150_var_FileId, 129749, campId, -1, 0, "", "" )

			
			x310150_var_Monster_x50[varMap][9]  = CreateMonster( varMap, 9713, 250, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][10] = CreateMonster( varMap, 9713, 260, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][11] = CreateMonster( varMap, 9713, 255, 259, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][12] = CreateMonster( varMap, 9713, 251, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][13] = CreateMonster( varMap, 9713, 258, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][14] = CreateMonster( varMap, 9713, 221, 200, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][15] = CreateMonster( varMap, 9713, 255, 210, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][16] = CreateMonster( varMap, 9713, 255, 196, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][17] = CreateMonster( varMap, 9713, 264, 191, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][18] = CreateMonster( varMap, 9713, 281, 192, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][19] = CreateMonster( varMap, 9713, 250, 177, 21, -1, -1, -1, campId, -1, 0, "", "" )
		elseif  varCountry == 2 then
			x310150_var_Monster_x50[varMap][1] = CreateMonster( varMap, 9701, 185, 315, 24,   2, x310150_var_FileId, 129742, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][2] = CreateMonster( varMap, 9702, 322, 396, 24,  -1, x310150_var_FileId, 129743, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][3] = CreateMonster( varMap, 9702, 372, 230, 24,  -1, x310150_var_FileId, 129744, campId, -1, 0, "", "" )

			x310150_var_Monster_x50[varMap][4] = CreateMonster( varMap, 9776, 255, 267, 27,  -1, x310150_var_FileId, 129745, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][5] = CreateMonster( varMap, 9715, 255, 229, 27,  -1, x310150_var_FileId, 129746, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][6] = CreateMonster( varMap, 9703, 213, 189, 27, 209, x310150_var_FileId, 129747, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][7] = CreateMonster( varMap, 9777, 291, 189, 27,  -1, x310150_var_FileId, 129748, campId, -1, 270, "", "" )
			x310150_var_Monster_x50[varMap][8] = CreateMonster( varMap, 9704, 255, 170, 27,  -1, x310150_var_FileId, 129749, campId, -1, 0, "", "" )

			
			x310150_var_Monster_x50[varMap][9]  = CreateMonster( varMap, 9713, 250, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][10] = CreateMonster( varMap, 9713, 260, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][11] = CreateMonster( varMap, 9713, 255, 259, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][12] = CreateMonster( varMap, 9713, 251, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][13] = CreateMonster( varMap, 9713, 258, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][14] = CreateMonster( varMap, 9713, 221, 200, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][15] = CreateMonster( varMap, 9713, 255, 210, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][16] = CreateMonster( varMap, 9713, 255, 196, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][17] = CreateMonster( varMap, 9713, 264, 191, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][18] = CreateMonster( varMap, 9713, 281, 192, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][19] = CreateMonster( varMap, 9713, 250, 177, 21, -1, -1, -1, campId, -1, 0, "", "" )
		elseif  varCountry == 3 then
			x310150_var_Monster_x50[varMap][1] = CreateMonster( varMap, 9701, 185, 315, 24,   2, x310150_var_FileId, 129742, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][2] = CreateMonster( varMap, 9702, 322, 396, 24,  -1, x310150_var_FileId, 129743, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][3] = CreateMonster( varMap, 9702, 372, 230, 24,  -1, x310150_var_FileId, 129744, campId, -1, 0, "", "" )

			x310150_var_Monster_x50[varMap][4] = CreateMonster( varMap, 9776, 255, 267, 27,  -1, x310150_var_FileId, 129745, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][5] = CreateMonster( varMap, 9715, 255, 229, 27,  -1, x310150_var_FileId, 129746, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][6] = CreateMonster( varMap, 9703, 213, 189, 27, 209, x310150_var_FileId, 129747, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][7] = CreateMonster( varMap, 9777, 291, 189, 27,  -1, x310150_var_FileId, 129748, campId, -1, 270, "", "" )
			x310150_var_Monster_x50[varMap][8] = CreateMonster( varMap, 9704, 255, 170, 27,  -1, x310150_var_FileId, 129749, campId, -1, 0, "", "" )

			
			x310150_var_Monster_x50[varMap][9]  = CreateMonster( varMap, 9713, 250, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][10] = CreateMonster( varMap, 9713, 260, 261, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][11] = CreateMonster( varMap, 9713, 255, 259, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][12] = CreateMonster( varMap, 9713, 251, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][13] = CreateMonster( varMap, 9713, 258, 225, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][14] = CreateMonster( varMap, 9713, 221, 200, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][15] = CreateMonster( varMap, 9713, 255, 210, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][16] = CreateMonster( varMap, 9713, 255, 196, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][17] = CreateMonster( varMap, 9713, 264, 191, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][18] = CreateMonster( varMap, 9713, 281, 192, 21, -1, -1, -1, campId, -1, 0, "", "" )
			x310150_var_Monster_x50[varMap][19] = CreateMonster( varMap, 9713, 250, 177, 21, -1, -1, -1, campId, -1, 0, "", "" )
		end                   
		
		for varI,item in x310150_var_Monster_x50[varMap] do
			SendSpecificImpactToUnit(varMap,item,item,item,8354,0)
		end
		
	    
		local strMsg = format("CBL:<Info>end,StartCountryBattleLite_50 varMap = %d ,m1:%d,m2:%d ",varMap,x310150_var_Monster_x50[varMap][1],x310150_var_Monster_x50[varMap][2] )
		WriteLog( 1, strMsg )
	end    
end
function x310150_ProcStartCountryBattleLite_x58( varMap )
    
    local strMsg = format("CBL:<Info>begin,StartCountryBattleLite_58 varMap = %d ",varMap )
    WriteLog( 1, strMsg )
   
    
    
    local n = getn(x310150_var_Monster_x58[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x58[varMap][varI] )
        end
        
        local strMsg = format("CBL:<Error>StartCountryBattleLite_58 varMap = %d, n = %d",varMap, n)
        WriteLog( 1, strMsg )
        
        x310150_var_Monster_x58[varMap] = {}
    end
end




function x310150_ProcStartCountryBattleLite_x86( varMap )
    local strMsg = format("CBL:<Info>begin,StartCountryBattleLite_86 varMap = %d ",varMap )
    WriteLog( 1, strMsg )
   
    
    
    local n = getn(x310150_var_Monster_x86[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x86[varMap][varI] )
        end
        
        local strMsg = format("CBL:<Error>StartCountryBattleLite_86 varMap = %d, n = %d",varMap, n)
        WriteLog( 1, strMsg )
        
        x310150_var_Monster_x86[varMap] = {}
    end 
end




function x310150_ProcStopCountryBattleLite_x58( varMap )
    
    local n = getn(x310150_var_Monster_x58[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x58[varMap][varI] )
        end
        
        x310150_var_Monster_x58[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_58 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end



function x310150_ProcStopCountryBattleLite_x86( varMap )
    
    local n = getn(x310150_var_Monster_x86[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x86[varMap][varI] )
        end
        
        x310150_var_Monster_x86[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_86 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x104( varMap )  
    
    local n = getn(x310150_var_Monster_x104[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x104[varMap][varI] )
        end
        
        x310150_var_Monster_x104[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_104 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x105( varMap )
    
    local n = getn(x310150_var_Monster_x105[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x105[varMap][varI] )
        end
        
        x310150_var_Monster_x105[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_105 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x106( varMap )
    
    local n = getn(x310150_var_Monster_x106[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x106[varMap][varI] )
        end
        
        x310150_var_Monster_x106[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_106 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x107( varMap )
    
    local n = getn(x310150_var_Monster_x107[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x107[varMap][varI] )
        end
        
        x310150_var_Monster_x107[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_107 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x108( varMap )
    
    local n = getn(x310150_var_Monster_x108[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x108[varMap][varI] )
        end
        
        x310150_var_Monster_x108[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_108 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x109( varMap )
    
    local n = getn(x310150_var_Monster_x109[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x109[varMap][varI] )
        end
        
        x310150_var_Monster_x109[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_109 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end
function x310150_ProcStopCountryBattleLite_x110( varMap )
    
    local n = getn(x310150_var_Monster_x110[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x110[varMap][varI] )
        end
        
        x310150_var_Monster_x110[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_110 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end

function x310150_ProcStopCountryBattleLite_x111( varMap )
    
    local n = getn(x310150_var_Monster_x111[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x111[varMap][varI] )
        end
        
        x310150_var_Monster_x111[varMap] = {}
    end
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_111 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end







function x310150_ProcStopCountryBattleLite_x50( varMap )
    
    local n = getn(x310150_var_Monster_x50[varMap])
    if n > 0 then
        for varI = 1, n do
            DeleteMonster( varMap,x310150_var_Monster_x50[varMap][varI] )
        end
        
        x310150_var_Monster_x50[varMap] = {}
    end
    
    
    x310150_ProcCountryBattleLiteFinish( varMap )
    
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_Wangchen varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end





function x310150_ProcStopCountryBattleLite_x68( varMap )
   
    
    x310150_var_Match0[varMap]                        = { -1,-1 }
    x310150_var_Match1[varMap]                        = { -1,-1 }
    
    x310150_var_MatchScore0[varMap]                   = { 0,0 }
    x310150_var_MatchScore1[varMap]                   = { 0,0 }
    
    x310150_var_Match1v3_Country[varMap]  = { -1, -1, -1, -1 }
    x310150_var_Match1v3_Score[varMap] = { -1, -1, -1, -1 }
    
    local strMsg = format("CBL:<Info>StopCountryBattleLite_x68 varMap = %d ", varMap )
    WriteLog( 1, strMsg )
    
end




function x310150_SelectNpcCamp( varMap )
    if varMap == 50 or varMap == 51  then
        return 16
    elseif varMap == 150 or varMap == 151  then
        return 17
    elseif varMap == 250 or varMap == 251  then
        return 18
    elseif varMap == 350 or varMap == 351  then
        return 19
    end
    
    
    return 21    
end




function x310150_SetDay( varMap ,varPlayer )
    
    local varToday = GetDayOfYear()
	local varLastday = x310150_GetDay( varMap, varPlayer)

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_COUNTRYBATTLELITE_DATE[1], MD_COUNTRYBATTLELITE_DATE[2], MD_COUNTRYBATTLELITE_DATE[3], varToday + 100)
	end
end




function x310150_GetDay( varMap ,varPlayer )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x310150_var_QuestId );
	if varHaveQuest <= 0 then
		return
	end
		
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310150_var_QuestId )
	local nDay = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 ) - 100
	
	
	local nCurDayTime = GetDayOfYear()
	if nCurDayTime == nDay then
		return nDay		
	end
    
    return -1
    
end




function x310150_SetCampFlag( varMap, varPlayer, camp ) 
    
    if camp == x310150_var_Camp_Defend_Ass then --下面这个只有一个bit空间，只能记录0和1
        camp = x310150_var_Camp_Defend
    end
    
    SetPlayerGameData(varMap, varPlayer, MD_COUNTRYBATTLELITE_CAMP[1], MD_COUNTRYBATTLELITE_CAMP[2], MD_COUNTRYBATTLELITE_CAMP[3], camp)
end




function x310150_GetCampFlag( varMap, varPlayer )
    return GetPlayerGameData(varMap, varPlayer, MD_COUNTRYBATTLELITE_CAMP[1], MD_COUNTRYBATTLELITE_CAMP[2], MD_COUNTRYBATTLELITE_CAMP[3])
end




function x310150_SetKillCount( varMap, varPlayer, nKillCount )
    SetPlayerGameData(varMap, varPlayer, MD_COUNTRYBATTLELITE_KILLCOUNT[1], MD_COUNTRYBATTLELITE_KILLCOUNT[2], MD_COUNTRYBATTLELITE_KILLCOUNT[3], nKillCount)
end




function x310150_GetKillCount( varMap, varPlayer )
    return GetPlayerGameData(varMap, varPlayer, MD_COUNTRYBATTLELITE_KILLCOUNT[1], MD_COUNTRYBATTLELITE_KILLCOUNT[2], MD_COUNTRYBATTLELITE_KILLCOUNT[3])
end




function x310150_CheckPlayerValid( varMap,varPlayer ,varCountry)

    
    if IsPlayerStateNormal( varMap,varPlayer ) <= 0 then
        return -1
    end
    
    
    local varToday = GetDayOfYear()
    local selfToday = x310150_GetDay( varMap,varPlayer )    
    if varToday ~= selfToday then
        return -2
    end
    
    
    local selfCountry = GetCurCountry( varMap,varPlayer )
    if selfCountry ~= varCountry then
        return -3
    end
    
    return 1    
end




function x310150_IncKillCount( varMap,varPlayer )
    
    local varCount =  x310150_GetKillCount( varMap,varPlayer) + 1
    x310150_SetKillCount( varMap,varPlayer,varCount)      
                 
end




function x310150_ProcMonsterKillObject( varMap,varPlayer,varKiller ,varAttackCountry1, varAttackCountry2, varAttackCountry3 )

    if x310150_CheckPlayerValid( varMap,varKiller,varAttackCountry1 ) <= 0 and
       x310150_CheckPlayerValid( varMap,varKiller,varAttackCountry2 ) <= 0 and
       x310150_CheckPlayerValid( varMap,varKiller,varAttackCountry3 ) <= 0 then
        return
    end
    
    local dataid = GetMonsterDataID( varMap,varPlayer)
    
    local varX,z = GetWorldPos( varMap,varKiller)
    local varCount = GetNearPlayerCount( varMap, varKiller, varX, z, 25 ) 
    
    for varI =0,varCount -1 do
        
        local varObj = GetNearPlayerMember(varMap,varKiller,varI)
        
        if x310150_CheckPlayerValid( varMap,varObj ,varAttackCountry1) == 1 or
           x310150_CheckPlayerValid( varMap,varObj ,varAttackCountry2) == 1 or
           x310150_CheckPlayerValid( varMap,varObj ,varAttackCountry3) == 1 then
            
            
            x310150_IncKillCount( varMap,varObj )
            
            
            if dataid == 9700 or dataid == 9714 or dataid == 9701 or dataid == 9702 or dataid == 9776 then
                AddExp(varMap,varObj,9999)
            elseif dataid == 9715 or dataid == 9703 or dataid == 9777 then
                AddExp(varMap,varObj,19999)
            elseif dataid == 9704 then
                AddExp(varMap,varObj,29999)
            end 
        end                    
    end
end




function x310150_GetCountryBattleLite_CountryCamp( varMap ,varPlayer )

    local varCountry = GetCurCountry( varMap,varPlayer )
    
    if x310150_Is1v1Mode( varMap ) == 1 then
    
        if x310150_var_Match0[varMap][1] == varCountry then
            return x310150_var_Camp_Attack
        elseif x310150_var_Match0[varMap][2] == varCountry then
            return x310150_var_Camp_Defend
        elseif x310150_var_Match1[varMap][1] == varCountry then
            return x310150_var_Camp_Attack
        elseif x310150_var_Match1[varMap][2] == varCountry then
            return x310150_var_Camp_Defend
        end
    
           
        return -1  
        
   else --1v3
   
       if x310150_var_Match1v3_Country[varMap][1] == -1 then
            
            return -1
            
       end
   
   
       if x310150_IsCountryAttack( varMap, varCountry ) == 1 then
            return x310150_var_Camp_Attack
            
       elseif varCountry ==  x310150_var_Match1v3DefendCountry[varMap] then
            return x310150_var_Camp_Defend
       else
            return x310150_var_Camp_Defend_Ass
       end
      
   end  
    
end





--此函数返回4个值，前三个为配对国家，最后一个为数量
function x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )

    local varCountry = GetCurCountry( varMap,varPlayer )
    
    return x310150_GetMatchCountryByCountryID( varMap,varCountry )
    
end

function x310150_GetDefendCountryForMatch1v3( varMap )

    if x310150_Is1v1Mode( varMap ) == 1 then
        return -1
    end
    
    return x310150_var_Match1v3DefendCountry[varMap]

end

--玩家响应国王召集
function x310150_AskCountryBattleLite_KingIssue( varMap, varPlayer )
	if x310150_CheckEnable( varMap, varPlayer) <= 0  then
		return
	end
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_DATE, x310150_var_FileId,-1,"ProcKingIssueReturn1")
end





--玩家响应国王召集 - 检查屠城战日期
function x310150_ProcKingIssueReturn1( varMap, varPlayer,QuestData,varQuest )
	local varCurDayTime = GetDayTime()
	if QuestData ~= varCurDayTime then
 		StartTalkTask(varMap)
		TalkAppendString( varMap, "【屠城战】已经结束，无法传送" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_FINISHED, x310150_var_FileId,-1,"ProcKingIssueReturn2")

end



--玩家响应国王召集 - 检查屠城战是否结束
function x310150_ProcKingIssueReturn2( varMap, varPlayer,QuestData,varQuest )
	
	if QuestData <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "【屠城战】已经结束，无法传送" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_CAMP, x310150_var_FileId,-1,"ProcKingIssueReturn3")
	
	
end



--玩家响应国王召集 - 通过阵营请求NPC,NPC值在国王点击传送时写入
function x310150_ProcKingIssueReturn3( varMap, varPlayer,QuestData,varQuest )
	
	if QuestData == x310150_var_Camp_Attack then
		
		GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_KINGISUE_NPC, x310150_var_FileId,-1,"ProcKingIssueReturn5")
	else
		
		GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_KINGISUE_NPC, x310150_var_FileId,-1,"ProcKingIssueReturn4")
	end	
	
end



--处理防守方传送， QuestData为传送NPC
function x310150_ProcKingIssueReturn4( varMap, varPlayer,QuestData,varQuest )
	
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 40 then
		StartTalkTask(varMap)
		TalkAppendString( varMap, "等级不足40级，无法传送！" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	
	local varState,varMsg = x310150_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return
    end
	local varCountry = GetCurCountry( varMap,varPlayer)
	if varCountry >= 0 then		
		if QuestData == 125509 or QuestData == 128511 or QuestData == 131511 or QuestData == 134511 then --拓道
			local varCountry = GetCurCountry( varMap,varPlayer)
			if varCountry >= 0 then
					local pos = { {403,295},{395,286},{396,297}}
					local rnd = random(1,3)
					
					local varX = pos[rnd][1] + random(-2,2)
					local z = pos[rnd][2] + random(-2,2)
					
					local nTargetSceneId = varCountry*100 + 51
					if varMap == nTargetSceneId then
						SetPos( varMap, varPlayer,varX,z)
						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
					else
						
						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
					end
--				if varCountry == 1 then
--					local pos = { {83,32},{ 68,34},{107,33}}
--					local rnd = random(1,3)
--					
--					local varX = pos[rnd][1] + random(-2,2)
--					local z = pos[rnd][2] + random(-2,2)
--					
--					local nTargetSceneId = varCountry*100 + 58
--					if varMap == nTargetSceneId then
--						SetPos( varMap, varPlayer,varX,z)
--						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
--						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
--						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
--					else
--						
--						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
--						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
--					end
--				end
--				
--				if varCountry == 2 then
--					local pos = { {161,224},{ 145,224},{184,226}}
--					local rnd = random(1,3)
--					
--					local varX = pos[rnd][1] + random(-2,2)
--					local z = pos[rnd][2] + random(-2,2)
--					
--					local nTargetSceneId = varCountry*100 + 58
--					if varMap == nTargetSceneId then
--						SetPos( varMap, varPlayer,varX,z)
--						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
--						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
--						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
--					else
--						
--						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
--						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
--					end
--				end
--				
--				if varCountry == 3 then
--					local pos = { {161,224},{ 145,224},{184,226}}
--					local rnd = random(1,3)
--					
--					local varX = pos[rnd][1] + random(-2,2)
--					local z = pos[rnd][2] + random(-2,2)
--					
--					local nTargetSceneId = varCountry*100 + 58
--					if varMap == nTargetSceneId then
--						SetPos( varMap, varPlayer,varX,z)
--						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
--						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
--						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
--					else
--						
--						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
--						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
--					end
--				end
			end
			
		elseif QuestData == 101103 or QuestData == 128500 or QuestData == 131500 or QuestData == 134500 then --玉门关
			
			local varCountry = GetCurCountry( varMap,varPlayer)
			if varCountry >= 0 then
					local pos = { {303,197},{ 295,189},{297,197}}
					local rnd = random(1,3)
					
					local varX = pos[rnd][1] + random(-2,2)
					local z = pos[rnd][2] + random(-2,2)
					
					local nTargetSceneId = varCountry*100 + 51
					if varMap == nTargetSceneId then
						SetPos( varMap, varPlayer,varX,z)
						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
					else
						
						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
					end
--				
--				if varCountry == 1 then
--					local pos = { {201,131},{ 178,118},{197,150}}
--					local rnd = random(1,3)
--					
--					local varX = pos[rnd][1] + random(-2,2)
--					local z = pos[rnd][2] + random(-2,2)
--					
--					local nTargetSceneId = varCountry*100 + 86
--					if varMap == nTargetSceneId then
--						SetPos( varMap, varPlayer,varX,z)
--						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
--						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
--						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
--					else
--						
--						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
--						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
--					end
--				end
--				
--				if varCountry == 2 then
--					local pos = { {74,137},{ 87,138},{82,122}}
--					local rnd = random(1,3)
--					
--					local varX = pos[rnd][1] + random(-2,2)
--					local z = pos[rnd][2] + random(-2,2)
--					
--					local nTargetSceneId = varCountry*100 + 86
--					if varMap == nTargetSceneId then
--						SetPos( varMap, varPlayer,varX,z)
--						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
--						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
--						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
--					else
--						
--						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
--						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
--					end
--				end
--				
--				if varCountry == 3 then
--					local pos = { {201,131},{ 178,118},{197,150}}
--					local rnd = random(1,3)
--					
--					local varX = pos[rnd][1] + random(-2,2)
--					local z = pos[rnd][2] + random(-2,2)
--					
--					local nTargetSceneId = varCountry*100 + 86
--					if varMap == nTargetSceneId then
--						SetPos( varMap, varPlayer,varX,z)
--						local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
--						local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
--						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
--					else
--						
--						SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
--						NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
--					end
--				end
			end
			
		elseif QuestData == 101101 or QuestData == 126000 or QuestData == 129169 or QuestData == 132000 then --中心广场
			
			local varCountry = GetCurCountry( varMap,varPlayer)
			if varCountry >= 0 then
			
				
				local pos = { {252,115},{257,115},{254,112}}
				local rnd = random(1,3)
				
				local varX = pos[rnd][1] + random(-2,2)
				local z = pos[rnd][2] + random(-2,2)
				
				local nTargetSceneId = varCountry*100 + 50
				if varMap == nTargetSceneId then
					SetPos( varMap, varPlayer,varX,z)
					local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
					local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
						x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
				else
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
					NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
				end
			end
		elseif QuestData == 101137 then  --瀚月关
			
			local varCountry = GetCurCountry( varMap,varPlayer)
			if varCountry >= 0 then
				
				
				local pos = { {347,412},{ 344,415},{340,412}}
				local rnd = random(1,3)
				
				local varX = pos[rnd][1] + random(-2,2)
				local z = pos[rnd][2] + random(-2,2)
				
				local nTargetSceneId = varCountry*100 + 50
				if varMap == nTargetSceneId then
					SetPos( varMap, varPlayer,varX,z)
					local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
					local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
					x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
				else
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
					NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
				end
			end
		elseif QuestData == 101138 then  --南城关隘
			
			local varCountry = GetCurCountry( varMap,varPlayer)
			if varCountry >= 0 then
				
				
				local pos = { {210,269},{ 205,274},{210,279}}
				local rnd = random(1,3)
				
				local varX = pos[rnd][1] + random(-2,2)
				local z = pos[rnd][2] + random(-2,2)
				
				local nTargetSceneId = varCountry*100 + 50
				if varMap == nTargetSceneId then
					SetPos( varMap, varPlayer,varX,z)
					local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
					local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
					x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
				else
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
					NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
				end
			end		
		elseif QuestData == 101139 then  --圣山之巅
			
			local varCountry = GetCurCountry( varMap,varPlayer)
			if varCountry >= 0 then
				
				
				local pos = { {450,316},{ 454,313},{459,315}}
				local rnd = random(1,3)
				
				local varX = pos[rnd][1] + random(-2,2)
				local z = pos[rnd][2] + random(-2,2)
				
				local nTargetSceneId = varCountry*100 + 50
				if varMap == nTargetSceneId then
					SetPos( varMap, varPlayer,varX,z)
					local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
					local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
					x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
				else
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
					NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
				end
			end					
		end
	end	
end




--进攻方继续请求配对国家,QuestData为传送NPC
function x310150_ProcKingIssueReturn5( varMap, varPlayer,QuestData,varQuest )
	if QuestData == -1 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "传送目标无效，无法传送" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return		
						
	end
	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_KINGISSUE_NPC,QuestData)
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_MATCH_COUNTRY, x310150_var_FileId,-1,"ProcKingIssueReturn6")	
	
	
end



--进攻方得到配对国家后，最后处理玩家传送到国王处, QuestData为配对国家，现在我们不用它
function x310150_ProcKingIssueReturn6( varMap, varPlayer,QuestData,varQuest )

	--if QuestData < 0 or QuestData > 3  then
		
	--	StartTalkTask(varMap)
	--	TalkAppendString( varMap, "【屠城战】已经结束，无法传送" )
	--	StopTalkTask( varMap )
	--	DeliverTalkTips( varMap, varPlayer )
	--	return
	--end

	
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 40 then
		StartTalkTask(varMap)
		TalkAppendString( varMap, "等级不足40级，无法传送！" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	
	local varState,varMsg = x310150_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return
    end
	
	
	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_KINGISSUE_NPC)
	if varTalknpc == 129715 then
	
		local varCountry = GetCurCountry( varMap,varPlayer)
		if varCountry == 0 then
		
			local pos = { {73,66},{92,61},{82,86}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end		
		end
		
		if  varCountry == 1 then
		
			local pos = { {185,165},{158,188},{176,150}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end
			
		if  varCountry == 2 then
		
			local pos = { {73,149},{55,148},{64,129}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end
			
		if  varCountry == 3 then
		
			local pos = { {67,149},{84,199},{64,178}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end
		
	elseif varTalknpc == 129716 then
	
		local varCountry = GetCurCountry( varMap,varPlayer)
		if varCountry == 0 then
			
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
			
			local pos = { {77,175},{ 90,186},{85,155}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
			
		end
		
		if varCountry == 1 then
			
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
			
			local pos = { {77,151},{ 81,132},{96,146}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
			
		end
		
		if varCountry == 2 then
			
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
			
			local pos = { {130,59},{ 103,62},{125,81}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
			
		end
		
		if varCountry == 3 then
			
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
			
			local pos = { {106,65},{ 122,77},{115,102}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
			
		end
		
	elseif varTalknpc == 129718 then
	
		local varCountry = GetCurCountry( varMap,varPlayer)
		if varCountry == 0 then
					
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
		
			local pos = { {168,127},{137,128},{194,131}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end		
		
		if varCountry == 1 then
					
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
		
			local pos = { {186,169},{166,147},{190,190}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end		
		
		if varCountry == 2 then
					
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
		
			local pos = { {185,103},{176,125},{183,148}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end		
		
		if varCountry == 3 then
					
			SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
		
			local pos = { {183,89},{159,83},{156,53}}
			local rnd = random(1,3)
			
			local varX = pos[rnd][1] + random(-2,2)
			local z = pos[rnd][2] + random(-2,2)
			local nSelfCountry = GetCurCountry(varMap,varPlayer)
			local nTargetSceneId = nSelfCountry*100 + 104
			if varMap == nTargetSceneId then
				SetPos( varMap, varPlayer,varX,z)
				local campFlag = x310150_GetCountryBattleLite_CountryCamp(varMap,varPlayer)
				local nCou1,nCou2,nCou3,nCnt = x310150_GetCountryBattleLite_MatchCountry( varMap ,varPlayer )
				x310150_ProcCountryBattleLiteChangeScene( varMap,varPlayer,campFlag,nCou1,nCou2,nCou3,0 )
			else
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_ADDQUESTFLAG,1)
				NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, x310150_var_FileId )
			end
		end		
	end	
end






function x310150_CheckPlayerState( varMap,varPlayer )
    

    local varState
    local ErrorMsg

    varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        ErrorMsg = "状态异常"
        return 1,ErrorMsg
    end
    
    
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		ErrorMsg = "监狱里还不老实,想走,没门。"
        return 1,ErrorMsg
	end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        ErrorMsg = "处于答题状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        ErrorMsg = "处于设摊状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        ErrorMsg = "处于死亡状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        ErrorMsg = "处于护送状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        ErrorMsg = "处于挂机状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        ErrorMsg = "处于代练状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        ErrorMsg = "处于bus状态，不能传送"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_PKMODE )
    if varState == 1 then
        ErrorMsg = "pk值过高或处于狂暴模式，不能传送"
        return 1,ErrorMsg
    end

    local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,7702 )
    if IsHaveFlag ~= 0 then
        ErrorMsg = "在夺旗状态下，不能传送"
        return 1,ErrorMsg
    end
    
  if IsHaveQuestNM(varMap, varPlayer, x310150_var_BanZhuanQuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x310150_var_BanZhuanQuestId)
		local buffIndex = GetQuestParam(varMap, varPlayer, varQuestIdx, 2)
		if buffIndex >=0 and buffIndex <=3 then
			  ErrorMsg = "携带龙魂状态，不能传送"
        return 1,ErrorMsg
     end
	end
	
	IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
    	ErrorMsg = "在暴龙大作战期间，不能传送"
        return 1,ErrorMsg
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
    if IsHaveFlag ~= 0 then
    	ErrorMsg = "在暴龙大作战期间，不能传送"
        return 1,ErrorMsg
    end

    return 0

end




function x310150_IsQuestCanAccept( varMap, varPlayer )
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_COUNTRYBATTLELITE_DATE[1], MD_COUNTRYBATTLELITE_DATE[2], MD_COUNTRYBATTLELITE_DATE[3] )
	local nCurDay = GetDayOfYear()
	if nCurDay == nDate then
		return 0
	end

	return 1
end




function x310150_SetQuestAcceptDate( varMap, varPlayer )
	local nCurDay = GetDayOfYear()
	SetPlayerGameData(varMap,varPlayer, MD_COUNTRYBATTLELITE_DATE[1], MD_COUNTRYBATTLELITE_DATE[2], MD_COUNTRYBATTLELITE_DATE[3], nCurDay )
	SetPlayerGameData(varMap,varPlayer, MD_COUNTRYBATTLELITE_RONGYU[1], MD_COUNTRYBATTLELITE_RONGYU[2], MD_COUNTRYBATTLELITE_RONGYU[3], 0 )
end




function x310150_AddBattleCountryLiteRongyu( varMap, varDeader, varPlayer,rongyu )
	
	local maxlimit = 2000
	
	
	if x310150_IsQuestCanAccept(varMap,varPlayer ) ~= 0 then
		return -1
	end
	
	if IsHaveQuest(varMap,varPlayer, x310150_var_QuestId) <= 0 then
		return -2
	end
	
	
	local nAdd = GetPlayerGameData(varMap,varPlayer, MD_COUNTRYBATTLELITE_RONGYU[1], MD_COUNTRYBATTLELITE_RONGYU[2], MD_COUNTRYBATTLELITE_RONGYU[3] )
	if nAdd >= maxlimit then
		return -3
	end
	
	
	
	local total = nAdd + rongyu
	if total > maxlimit then
		total = maxlimit
		nAdd = maxlimit - nAdd
	else
		nAdd = rongyu
	end
	
	
	local totalNum = 10
	local timeLimit = 3600*2 
	local timesLimit = 10 
	local IsDiedInRecord = -1;
	local diedIndex = -1;
	local diedFirstBeKillTime = -1;
	local diedTimes = 1;	
	local curTime = GetCurrentTime();
	local varIndex
	local diedGuid = GetGUID(varMap, varDeader)
	for varIndex=0, tonumber(totalNum - 1) do
		local guid, killTime, times = GetHonorRecord(varMap, varPlayer, varIndex)
		if tonumber(guid) == tonumber(diedGuid) then
			IsDiedInRecord = 1
			diedIndex = varIndex
			diedFirstBeKillTime = killTime
			diedTimes = times
		end
	end
	
	
	if 1 == IsDiedInRecord and (curTime - diedFirstBeKillTime < timeLimit and diedTimes > timesLimit) then
		
		return -4
	end
	
	
	SetPlayerGameData(varMap,varPlayer, MD_COUNTRYBATTLELITE_RONGYU[1], MD_COUNTRYBATTLELITE_RONGYU[2], MD_COUNTRYBATTLELITE_RONGYU[3], total )
	
	return nAdd
	
end





function x310150_CancelBufId( varMap,varPlayer )

	for varI,item in x310150_var_BufID do
		if IsHaveSpecificImpact(varMap,varPlayer,item) == 1 then
			CancelSpecificImpact(varMap,varPlayer,item)
		end
	end

end




function x310150_PlayerEnterFinished( varMap,varPlayer)  --Todo 传到非任务场景，删除任务
	
	if IsHaveQuest(varMap,varPlayer, x310150_var_QuestId) <= 0 then
		return 
	end
	
	if varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and
	   varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 and
	   varMap ~= 58 and varMap ~= 158 and varMap ~= 258 and varMap ~= 358 and
	   varMap ~= 104 and varMap ~=204 and varMap ~= 304 and varMap ~= 404 and
	   varMap ~= 76 and varMap ~= 176 and varMap ~= 276 and varMap ~= 376 and 
	   varMap ~= 86 and varMap ~= 186 and varMap ~= 286 and varMap ~= 386 and 
	   varMap ~= 105 and varMap ~=205 and varMap ~= 305 and varMap ~= 405 and
	   varMap ~= 106 and varMap ~=206 and varMap ~= 306 and varMap ~= 406 and
	   varMap ~= 107 and varMap ~=207 and varMap ~= 307 and varMap ~= 407 and
	   varMap ~= 108 and varMap ~=208 and varMap ~= 308 and varMap ~= 408 and
	   varMap ~= 109 and varMap ~=209 and varMap ~= 309 and varMap ~= 409 and
	   varMap ~= 110 and varMap ~=210 and varMap ~= 310 and varMap ~= 410 and
	   varMap ~= 111 and varMap ~=211 and varMap ~= 311 and varMap ~= 411 and
	   varMap ~= 91 and varMap ~= 191 and varMap ~= 291 and varMap ~= 391 and varMap ~= 3 then 	
	   DelQuest(varMap, varPlayer, x310150_var_QuestId)
	   x310150_CancelBufId(varMap,varPlayer)
		
		GamePlayScriptLog( varMap, varPlayer, 1513)
		
		
	  	Msg2Player(varMap, varPlayer, "您退出了【国家】屠城战！", 0, 2)
		Msg2Player(varMap, varPlayer, "您退出了【国家】屠城战！", 0, 3)
	end
	
end




function x310150_ProcCountryBattleLitePlayerKilled( varMap,varPlayer,varKiller,rongyu )

	if varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and
	   varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 then
	   	return
	end
	
	
	local selfCountry = GetCurCountry( varMap,varPlayer )
	local killerCountry = GetCurCountry( varMap,varKiller )
	
	
	local nSelfCountryCamp   = x310150_GetCountryBattleLite_CountryCamp( varMap,varPlayer)
	local nKillerCountryCamp = x310150_GetCountryBattleLite_CountryCamp( varMap,varKiller)
	
	
	if nSelfCountryCamp == nKillerCountryCamp then
		return
	end
	
	
	local nSelfMatchCountry1,  nSelfMatchCountry2, nSelfMatchCountry3, cnt = x310150_GetCountryBattleLite_MatchCountry(varMap,varPlayer)
	if nSelfMatchCountry1 ~= killerCountry and nSelfMatchCountry12 ~= killerCountry and nSelfMatchCountry3 ~= killerCountry then
		return
	end
	
	
	local nSceneCountry = x310150_GetCountryIdBySceneId(varMap)
	
	if nSelfCountryCamp == x310150_var_Camp_Defend then   --防守方
	
	    if x310150_Is1v1Mode( varMap ) == 1 then
        		if nSceneCountry == selfCountry then --当前场景国家是杀人者国家
        			
        			rongyu = x310150_AddBattleCountryLiteRongyu(varMap,varPlayer,varKiller,rongyu )
        			if rongyu > 0 then
        				
        				AddHonor(varMap, varKiller, rongyu)
        				Msg2Player(varMap, varKiller, format("获得屠城战荣誉：%d点",rongyu), 0, 2)
        				Msg2Player(varMap, varKiller, format("获得屠城战荣誉：%d点",rongyu), 0, 3)
        			elseif rongyu == -3 then
        				
        				Msg2Player(varMap, varKiller, "本日屠城战荣誉已达上限！", 0, 2)
        				Msg2Player(varMap, varKiller, "本日屠城战荣誉已达上限！", 0, 2)
        			end
        			
        			return
        		end
       else -- 1v3 
       
            if nSceneCountry == x310150_var_Match1v3DefendCountry[varMap] then --当前场景国家是防守方国家
                    
                    rongyu = x310150_AddBattleCountryLiteRongyu(varMap,varPlayer,varKiller,rongyu )
        			if rongyu > 0 then
        				
        				AddHonor(varMap, varKiller, rongyu)
        				Msg2Player(varMap, varKiller, format("获得屠城战荣誉：%d点",rongyu), 0, 2)
        				Msg2Player(varMap, varKiller, format("获得屠城战荣誉：%d点",rongyu), 0, 3)
        			elseif rongyu == -3 then
        				
        				Msg2Player(varMap, varKiller, "本日屠城战荣誉已达上限！", 0, 2)
        				Msg2Player(varMap, varKiller, "本日屠城战荣誉已达上限！", 0, 2)
        			end
        			
        			return
            
            end
       
       end
	end
	
	
	if nSelfCountryCamp == x310150_var_Camp_Attack then --进攻方
		if nSceneCountry == killerCountry then --当前场景是被杀死者的国家
			
			rongyu = x310150_AddBattleCountryLiteRongyu(varMap,varPlayer,varKiller,rongyu )
			if rongyu > 0 then
				
				AddHonor(varMap, varKiller, rongyu)
				Msg2Player(varMap, varKiller, format("获得屠城战荣誉：%d点",rongyu), 0, 2)
				Msg2Player(varMap, varKiller, format("获得屠城战荣誉：%d点",rongyu), 0, 3)
			elseif rongyu == -3 then
				
				Msg2Player(varMap, varKiller, "本日屠城战荣誉已达上限！", 0, 2)
				Msg2Player(varMap, varKiller, "本日屠城战荣誉已达上限！", 0, 2)
			end
			return
		end
	end
end





function x310150_CheckCountryBattleLiteSceneTrans( varMap,varPlayer,targetSceneId ) --TOdo
	
	
	if varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and
	   varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 and
	   varMap ~= 104 and varMap ~=204 and varMap ~= 304 and varMap ~= 404 and
	   varMap ~= 76 and varMap ~= 176 and varMap ~= 276 and varMap ~= 376 and 
	   varMap ~= 105 and varMap ~=205 and varMap ~= 305 and varMap ~= 405 and
	   varMap ~= 106 and varMap ~=206 and varMap ~= 306 and varMap ~= 406 and
	   varMap ~= 107 and varMap ~=207 and varMap ~= 307 and varMap ~= 407 and
	   varMap ~= 108 and varMap ~=208 and varMap ~= 308 and varMap ~= 408 and
	   varMap ~= 109 and varMap ~=209 and varMap ~= 309 and varMap ~= 409 and
	   varMap ~= 110 and varMap ~=210 and varMap ~= 310 and varMap ~= 410 and
	   varMap ~= 111 and varMap ~=211 and varMap ~= 311 and varMap ~= 411 and
	   varMap ~= 91 and varMap ~= 191 and varMap ~= 291 and varMap ~= 391 and varMap ~= 3 then 
	   
	   return 1;
	end
	
	
	if targetSceneId ~= 50 and targetSceneId ~= 150 and targetSceneId ~= 250 and targetSceneId ~= 350 and
	   targetSceneId ~= 51 and targetSceneId ~= 151 and targetSceneId ~= 251 and targetSceneId ~= 351 and
	   targetSceneId ~= 104 and targetSceneId ~= 204 and targetSceneId ~= 304 and targetSceneId ~= 404 and
	   targetSceneId ~= 76 and targetSceneId ~= 176 and targetSceneId ~= 276 and targetSceneId ~= 376 and 
	   targetSceneId ~= 105 and targetSceneId ~= 205 and targetSceneId ~= 305 and targetSceneId ~= 405 and
	   targetSceneId ~= 106 and targetSceneId ~= 206 and targetSceneId ~= 306 and targetSceneId ~= 406 and
	   targetSceneId ~= 107 and targetSceneId ~= 207 and targetSceneId ~= 307 and targetSceneId ~= 407 and
	   targetSceneId ~= 108 and targetSceneId ~= 208 and targetSceneId ~= 308 and targetSceneId ~= 408 and
	   targetSceneId ~= 109 and targetSceneId ~= 209 and targetSceneId ~= 309 and targetSceneId ~= 409 and
       targetSceneId ~= 110 and targetSceneId ~= 210 and targetSceneId ~= 310 and targetSceneId ~= 410 and
	   targetSceneId ~= 111 and targetSceneId ~= 211 and targetSceneId ~= 311 and targetSceneId ~= 411 and
	   targetSceneId ~= 91 and targetSceneId ~= 191 and targetSceneId ~= 291 and targetSceneId ~= 391 and targetSceneId ~= 3 then 
	   
	   
	   	
	   	if x310150_IsQuestCanAccept( varMap,varPlayer) == 0 and IsHaveQuest(varMap,varPlayer, x310150_var_QuestId) == 1 then
	   	
	   		
	   		if x310150_var_Match0[varMap][1] == -1 then
	   			return 1
	   		end
	   		
	   		
	   		Msg2Player(varMap, varPlayer, "您正在进行了【国家】屠城战,此期间不能传送！", 0, 2)
			Msg2Player(varMap, varPlayer, "您正在进行了【国家】屠城战,此期间不能传送！", 0, 3)	
	   		
	   		return 0
	   	else
	   		
	   		return 1
	   	end
	   
	end
	
	
	return 1
		
end




function x310150_CheckCountryBattleLiteFubenTrans( varMap,varPlayer )
	
	   
   	
   	if x310150_IsQuestCanAccept( varMap,varPlayer) == 0 and IsHaveQuest(varMap,varPlayer, x310150_var_QuestId) == 1 then
   	
   		
   		if x310150_var_Match0[varMap][1] == -1 then
   			return 1
   		end
   		
   		
   		
			
   		
   		return 0
   	else
   		
   		return 1
   	end
	   

		
end




function x310150_IsNewFlow( varMap,varPlayer)
	

	
	local varCountry = GetCurCountry( varMap,varPlayer )
	
	local nBonusFlag = 0
	
	if x310150_Is1v1Mode( varMap ) == 1 then
	
    	if x310150_var_Match0[varMap][1] == varCountry then
            nBonusFlag = x310150_var_BonusFlag0[varMap][1]
        elseif x310150_var_Match0[varMap][2] == varCountry then
            nBonusFlag = x310150_var_BonusFlag0[varMap][2]
        elseif x310150_var_Match1[varMap][1] == varCountry then
            nBonusFlag = x310150_var_BonusFlag1[varMap][1]
        elseif x310150_var_Match1[varMap][2] == varCountry then
            nBonusFlag = x310150_var_BonusFlag1[varMap][2]
        end
    
    else --1v3
    
        if x310150_var_Match1v3_Country[varMap][1] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][1]
        elseif x310150_var_Match1v3_Country[varMap][2] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][2]
        elseif x310150_var_Match1v3_Country[varMap][3] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][3]
        elseif x310150_var_Match1v3_Country[varMap][4] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][4]
        end
        
    end
    
    
    if nBonusFlag <= 0 then
    	return 0
    end
    
    
    return 1
	
end




function x310150_IsCanReciveBonus( varMap,varPlayer )
	
	
	local varCountry = GetCurCountry( varMap,varPlayer )
	
	local nBonusFlag = 0
	
	if x310150_Is1v1Mode( varMap ) == 1 then
	
    	if x310150_var_Match0[varMap][1] == varCountry then
          nBonusFlag = x310150_var_BonusFlag0[varMap][1]
      elseif x310150_var_Match0[varMap][2] == varCountry then
          nBonusFlag = x310150_var_BonusFlag0[varMap][2]
      elseif x310150_var_Match1[varMap][1] == varCountry then
          nBonusFlag = x310150_var_BonusFlag1[varMap][1]
      elseif x310150_var_Match1[varMap][2] == varCountry then
          nBonusFlag = x310150_var_BonusFlag1[varMap][2]
      end
    
    else --1v3
    
        if x310150_var_Match1v3_Country[varMap][1] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][1]
        elseif x310150_var_Match1v3_Country[varMap][2] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][2]
        elseif x310150_var_Match1v3_Country[varMap][3] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][3]
        elseif x310150_var_Match1v3_Country[varMap][4] == varCountry then
            nBonusFlag = x310150_var_Match1v3_BounsFlag[varMap][4]
        end
        
    end
    
    
    if nBonusFlag <= 0 then
    	return 0
    end
    
    
    local nMin = GetMinOfYear() - nBonusFlag
    if nMin > 10 or nMin < 0 then
    	return 0
    end
    
    
    return 1
end





function x310150_ProcCountryKillCountChanged( varMap,countryId,killcount )


	
	if x310150_IsCountryAttack( varMap, countryId ) ~= 1 then
		return
	end

	
	
	if killcount ~= 10 then
		return
	end
	
	
	local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 and IsPlayerStateNormal(varMap,varObj) == 1 and GetHp(varMap,varObj ) > 0 and GetCurCountry(varMap,varObj ) == countryId then
        	
			SendSpecificImpactToUnit(varMap, varObj, varObj, varObj,8321, 0);
			x310150_ProcTopListYanghua(varMap,varObj)
        end
    end
	
end

function x310150_ProcTopListYanghua(varMap,varPlayer)

	
	
	local lastweek = GetPlayerGameData( varMap, varPlayer, MD_YANHUA_WEEK[1], MD_YANHUA_WEEK[2], MD_YANHUA_WEEK[3] )
	local curcount = GetPlayerGameData( varMap, varPlayer, MD_YANHUA_COUNT[1], MD_YANHUA_COUNT[2], MD_YANHUA_COUNT[3] )
	
	
	local curweek = LuaCallNoclosure( 888888, "GetWorldWeek", varMap)
	if lastweek ~= curweek then
		curcount = 0
	end

	
	
	curcount = curcount + 1
	
	if curcount > MAX_WANFATOPLIST_COUNT then
		curcount = MAX_WANFATOPLIST_COUNT
	end
	
	SetPlayerGameData( varMap, varPlayer, MD_YANHUA_COUNT[1], MD_YANHUA_COUNT[2], MD_YANHUA_COUNT[3], curcount )
	SetPlayerGameData( varMap, varPlayer, MD_YANHUA_WEEK[1], MD_YANHUA_WEEK[2], MD_YANHUA_WEEK[3], curweek )

	
	SendToplistKeyValue2GL(varMap, varPlayer, YANHUA_TOPLIST, curcount)
	GamePlayScriptLog(varMap, varPlayer, 5000)
	
end


function x310150_ProcCountryBattleLiteFinish( varMap )
	
	
	if varMap ~= 50 then
		return
	end

	if x310150_Is1v1Mode( varMap ) == 1 then
    	if x310150_var_Match0[varMap][1] == -1 then
    		return
    	end
    else
        if x310150_var_Match1v3_Country[varMap][1] == -1 then
            return
        end
    end

	if x310150_Is1v1Mode( varMap ) == 1 then
    	local Country1 = LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match0[varMap][2])
    	local Country2 = LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match0[varMap][1])
    	local Country3 = LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1[varMap][2])
    	local Country4 = LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1[varMap][1])
    	
    	local varMsg = format("%s击杀%d个%s国家军力,%s击杀%d个%s国家军力",Country2,x310150_var_MatchScore0[varMap][1],Country1,Country4,x310150_var_MatchScore1[varMap][1],Country3 )
    	LuaAllScenceM2Wrold(varMap,varMsg,1,4)
    
    else -- 1v3
    
        local score = 0
        local strAttackCountry = ""
        local strDefendCountry = LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1v3DefendCountry[varMap])
        
        if x310150_var_Match1v3_Country[varMap][1] == x310150_var_Match1v3DefendCountry[varMap] then
             
             strAttackCountry = strAttackCountry.. LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1v3_Country[varMap][2])
             strAttackCountry = strAttackCountry.. LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1v3_Country[varMap][3])
             strAttackCountry = strAttackCountry.. LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1v3_Country[varMap][4])
             --strAttackCountry = "联盟"
             score =  10 - x310150_var_Match1v3_Score[varMap][1]          
        else
        
             --strDefendCountry = "联盟"
             strAttackCountry = LuaCallNoclosure(UTILITY_SCRIPT,"GetCountryName",varMap,x310150_var_Match1v3_Country[varMap][1])
             
             score =  x310150_var_Match1v3_Score[varMap][1]    
             
        end
        
        local varMsg = format("%s共击杀了%d个%s国家军力",strAttackCountry, score, strDefendCountry )
    	LuaAllScenceM2Wrold(varMap,varMsg,1,4)
    
    end
end


-- 被召集者状态检查
function x310150_CheckEnable( varMap, varPlayer)
    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

    return 1
end

