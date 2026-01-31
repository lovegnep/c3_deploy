

x550404_var_FileId = 550404

x550404_var_QuestName = "【屠城战】传送"

x550404_var_Bianjing2Midao_Entry_X    = 68
x550404_var_Bianjing2Midao_Entry_Z    = 106
x550404_var_Midao2Wangcheng1_Entry_X  = 128
x550404_var_Midao2Wangcheng1_Entry_Z  = 98
x550404_var_Wangcheng2Midao1_Entry_X  = 20
x550404_var_Wangcheng2Midao1_Entry_Z  = 106
x550404_var_Wangcheng2Midao2_Entry_X  = 70
x550404_var_Wangcheng2Midao2_Entry_Z  = 21
x550404_var_Wangcheng2Midao3_Entry_X  = 100
x550404_var_Wangcheng2Midao3_Entry_Z  = 20

x550404_var_npcId ={
				{varTalknpc = 129711},
				{varTalknpc = 129712},
				{varTalknpc = 129713},
				{varTalknpc = 129747},
				{varTalknpc = 129748},
				{varTalknpc = 129749},
				{varTalknpc = 129721},
				{varTalknpc = 129722},
				{varTalknpc = 129723},
				{varTalknpc = 129725},
				{varTalknpc = 129726},
				{varTalknpc = 129727},
                 }
				 

x550404_var_EnterEnmyWangchengNPC1 = { {191,219},{66,228},{194,214},{74,218}}
x550404_var_EnterEnmyWangchengNPC2 =  { {213,412},{213,412},{213,412},{213,412}} --进入敌国王城<矿洞>
x550404_var_EnterEnmyWangchengNPC3 = { {368,341},{368,341},{368,341},{368,341}}     --进入敌国王城<牧场>              
x550404_var_ReturnSelfBianjin  = { {41,218},{210,200},{39,44},{210,38}}
x550404_var_ReturnSelfWangcheng  = { {127,136},{127,136},{127,116},{127,116}}

x550404_var_Gdao2DigongNpc1   = { {164,122},{194,165},{194,107},{191,96}}
x550404_var_Gdao2DigongNpc2   = { {75,182},{70,159},{116,54},{104,57}}	--进入敌国王城<矿洞>的迷宫NPC坐标
x550404_var_Gdao2DigongNpc3   = { {65,66},{200,103},{65,155},{68,202}} --进入敌国王城<牧场>的迷宫NPC坐标
x550404_var_Time				= { min = 1600,max = 1659 }	


x550404_const_CBL_Camp_Attack = 0
x550404_const_CBL_Camp_Defend = 1
x550404_const_CBL_Camp_Defend_Ass = 2

function x550404_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    local varTalknpc = GetMonsterGUID( varMap, varTalknpc)
    local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
	for varI,itm in x550404_var_npcId do
		if varTalknpc == itm.varTalknpc and x550404_const_CBL_Camp_Attack == camp then
			if GetLevel( varMap, varPlayer) >= 40 then
				TalkAppendButton( varMap, x550404_var_FileId, "返回本国迷宫", 3, 1)
				return
			end
		end
	end
	
	local hour,minute,sec =GetHourMinSec(); 
	local now = hour *100 + minute
	if now < x550404_var_Time.min or now > x550404_var_Time.max then
		return
	end	
	
		--129715在迷宫一层的已经被干掉，by FXB
		if varTalknpc == 129715 and camp ==  x550404_const_CBL_Camp_Attack and GetLevel( varMap, varPlayer) >= 40 then
		--	TalkAppendButton( varMap, x550404_var_FileId, "进入敌国古道", 3, 3)
		elseif varTalknpc == 129716 and camp ==  x550404_const_CBL_Camp_Attack and GetLevel( varMap, varPlayer) >= 40 then
			TalkAppendButton( varMap, x550404_var_FileId, "进入敌国王城<矿洞>", 3, 4)
		elseif varTalknpc == 129718 and camp ==  x550404_const_CBL_Camp_Attack  and GetLevel( varMap, varPlayer) >= 40 then
			TalkAppendButton( varMap, x550404_var_FileId, "进入敌国王城<牧场>", 3, 8)
		elseif varTalknpc == 129712 and camp >= 0 and GetLevel( varMap, varPlayer) >= 40 then
			local varCountryID = GetCurCountry( varMap, varPlayer)
			--local nCou1,nCou2,nCou3,nCnt = LuaCallNoclosure(310150,"GetMatchCountry", varMap,varPlayer)
						
			
				
			
			
			if camp == x550404_const_CBL_Camp_Attack and varMap == varCountryID * 100 + 50 then
				TalkAppendButton( varMap, x550404_var_FileId, "返回本国迷宫", 3, 10)
			end
			
		elseif varTalknpc == 129713 and camp >= 0 and GetLevel( varMap, varPlayer) >= 40 then
			
			
			local varCountryID = GetCurCountry( varMap, varPlayer)
			--local nMatchCountryId = LuaCallNoclosure(310150,"GetMatchCountry", varMap,varPlayer)
						
			
				
			
		elseif varTalknpc == 129717 and camp >= 0 and GetLevel( varMap, varPlayer) >= 40 then
			
			
			local varCountryID = GetCurCountry( varMap, varPlayer)
			--local nMatchCountryId = LuaCallNoclosure(310150,"GetMatchCountry", varMap,varPlayer)
						
			
				
			
		end
	
        
    
        
    
        
    
    	
    
end

function x550404_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    local varName = GetName( varMap, varPlayer)
    if idExt == 1 then
        if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_CRASHBOX) > 0 then
            LuaScenceM2Player( varMap, varPlayer, "运镖状态不能返回本国迷宫", varName, 3, 1)
            return
        end
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then
			local varCountry = GetCurCountry( varMap, varPlayer )
			local varTalknpc = GetMonsterGUID( varMap, varTalknpc)
--			if varTalknpc == 129747 then		--已经被干掉，by fxb
--				local varX = x550404_var_Gdao2DigongNpc2[varCountry+1][1] + random(2,4)
--				local z = x550404_var_Gdao2DigongNpc2[varCountry+1][2] + random(2,4)
--				NewWorld( varMap, varPlayer, varCountry * 100 + 104, varX, z, 550404 )
--			end
			if varTalknpc == 129748 then	--敌国王城<矿洞>
				local varX = x550404_var_Gdao2DigongNpc2[varCountry+1][1] + random(2,4)
				local z = x550404_var_Gdao2DigongNpc2[varCountry+1][2] + random(2,4)
				NewWorld( varMap, varPlayer, varCountry * 100 + 104, varX, z, 550404 )
			end
			if varTalknpc == 129749 then	--敌国王城<牧场>   
				local varX = x550404_var_Gdao2DigongNpc3[varCountry+1][1] + random(2,4)
				local z = x550404_var_Gdao2DigongNpc3[varCountry+1][2] + random(2,4)
				NewWorld( varMap, varPlayer, varCountry * 100 + 104, varX, z, 550404 )
			end
			
        end
    elseif idExt == 2 then
    	local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
    	
			local varCountry = GetCurCountry( varMap, varPlayer)
			local varX = x550404_var_ReturnSelfBianjin[varCountry+1][1] + random(2,4)
			local z = x550404_var_ReturnSelfBianjin[varCountry+1][2] + random(2,4)
        	NewWorld( varMap, varPlayer, varCountry * 100 + 51, varX , z, 550404 )
        
    elseif idExt == 3 then --进入敌国古道
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Defend or camp == x550404_const_CBL_Camp_Defend_Ass then           
            NewWorld( varMap, varPlayer, GetCurCountry( varMap, varPlayer) * 100 + 50, x550404_var_Midao2Wangcheng1_Entry_X + random( 2, 4), x550404_var_Midao2Wangcheng1_Entry_Z + random( 2, 4), 550404 )
        
        elseif camp == x550404_const_CBL_Camp_Attack then       
			
			local nMatchCou1,nMatchCou2,nMatchCou3,nCnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_MatchCountry", varMap, varPlayer)
			if nCnt <= 0 then
				return
			end
			
			local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )        
            local nDefendCountry  = -1
            if bIs1v1Mode == 1 then
                nDefendCountry = nMatchCou1
            else -- 1v3
                nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
            end
            
            if nDefendCountry < 0 or nDefendCountry > 3 then
                return
            end
			
			local varX = x550404_var_EnterEnmyWangchengNPC1[nDefendCountry+1][1] + random(2,4)
			local z = x550404_var_EnterEnmyWangchengNPC1[nDefendCountry+1][2] + random(2,4)
			
			
			if  nDefendCountry == 0 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 86, varX, z , 550404 )
			elseif  nDefendCountry == 1 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 86, varX, z, 550404 )
			elseif  nDefendCountry == 2 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 86, varX ,z, 550404 )
			elseif  nDefendCountry == 3 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 86, varX, z, 550404 )
			end
        end
    elseif idExt == 4 then --进入敌国王城<矿洞>
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then  
           
            local nMatchCou1,nMatchCou2,nMatchCou3,nCnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_MatchCountry", varMap, varPlayer)
			if nCnt <= 0 then
				return
			end
			
			local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )        
            local nDefendCountry  = -1
            if bIs1v1Mode == 1 then
                nDefendCountry = nMatchCou1
            else -- 1v3
                nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
            end
            
            if nDefendCountry < 0 or nDefendCountry > 3 then
                return
            end
			
			local varX = x550404_var_EnterEnmyWangchengNPC2[nDefendCountry+1][1] + random(2,4)
			local z = x550404_var_EnterEnmyWangchengNPC2[nDefendCountry+1][2] + random(2,4)
			
			if  nDefendCountry == 0 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX, z , 550404 )
			elseif  nDefendCountry == 1 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX, z, 550404 )
			elseif  nDefendCountry == 2 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX ,z, 550404 )
			elseif  nDefendCountry == 3 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX, z, 550404 )
			end
        end
     elseif idExt == 8 then --进入敌国王城<牧场>
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then     
          
            local nMatchCou1,nMatchCou2,nMatchCou3,nCnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_MatchCountry", varMap, varPlayer)
			if nCnt <= 0 then
				return
			end
			
			local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )        
            local nDefendCountry  = -1
            if bIs1v1Mode == 1 then
                nDefendCountry = nMatchCou1
            else -- 1v3
                nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
            end
            
            if nDefendCountry < 0 or nDefendCountry > 3 then
                return
            end
            
			
			local varX = x550404_var_EnterEnmyWangchengNPC3[nDefendCountry+1][1] + random(2,4)
			local z = x550404_var_EnterEnmyWangchengNPC3[nDefendCountry+1][2] + random(2,4)
			
			if  nDefendCountry == 0 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX, z , 550404 )
			elseif  nDefendCountry == 1 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX, z, 550404 )
			elseif  nDefendCountry == 2 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX ,z, 550404 )
			elseif  nDefendCountry == 3 then 
				NewWorld( varMap, varPlayer, nDefendCountry * 100 + 50, varX, z, 550404 )
			end
        end
    elseif idExt == 5 then        
        if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_CRASHBOX) > 0 then
            LuaScenceM2Player( varMap, varPlayer, "运镖状态不能返回本国迷宫", varName, 3, 1)
            return
        end
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then       
           local varCountry = GetCurCountry( varMap, varPlayer )
			local varX = x550404_var_Gdao2DigongNpc2[varCountry+1][1] + random(2,4)
			local z = x550404_var_Gdao2DigongNpc2[varCountry+1][2] + random(2,4)
        	NewWorld( varMap, varPlayer, varCountry * 100 + 104, varX, z, 550404 )
        end
    elseif idExt == 6 then        
        if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_CRASHBOX) > 0 then
            LuaScenceM2Player( varMap, varPlayer, "运镖状态不能返回本国迷宫", varName, 3, 1)
            return
        end
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then       
            local varCountry = GetCurCountry( varMap, varPlayer )
			local ChuansongID = x550404_var_Gdao2DigongNpc1
				local varX = ChuansongID[varCountry+1][1] + random(2,4)
				local z = ChuansongID[varCountry+1][2] + random(2,4)
				NewWorld( varMap, varPlayer, varCountry * 100 + 104, varX, z, 550404 )
        end
    elseif idExt == 9 then        
        if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_CRASHBOX) > 0 then
            LuaScenceM2Player( varMap, varPlayer, "运镖状态不能返回本国迷宫", varName, 3, 1)
            return
        end
        local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then    
            
            local nMatchCou1,nMatchCou2,nMatchCou3,nCnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_MatchCountry", varMap, varPlayer)
			if nCnt <= 0 then
				return
			end
			
			local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )        
            local nDefendCountry  = -1
            if bIs1v1Mode == 1 then
                nDefendCountry = nMatchCou1
            else -- 1v3
                nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
            end
            
            if nDefendCountry < 0 or nDefendCountry > 3 then
                return
            end
            
               
            NewWorld( varMap, varPlayer, nDefendCountry * 100 + 104, x550404_var_Wangcheng2Midao3_Entry_X + random( 2, 4), x550404_var_Wangcheng2Midao3_Entry_Z + random( 2, 4), 550404 )
        end
    elseif idExt == 7 then
        
        local nCountryId = GetCurCountry( varMap,varPlayer)
        local nTargetSceneId = nCountryId * 100 + 50
        





        
		local varX = x550404_var_ReturnSelfWangcheng[nCountryId+1][1] + random(2,4)
		local z = x550404_var_ReturnSelfWangcheng[nCountryId+1][2] + random(2,4)
		NewWorld( varMap, varPlayer, nCountryId * 100 + 50, varX , z, 550404 )
        
    elseif idExt == 10 then
    	
    	
    	local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
        if camp == x550404_const_CBL_Camp_Attack then
	        	
	    	 local nMatchCou1,nMatchCou2,nMatchCou3,nCnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_MatchCountry", varMap, varPlayer)
			if nCnt <= 0 then
				return
			end
			
			local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )        
            local nDefendCountry  = -1
            if bIs1v1Mode == 1 then
                nDefendCountry = nMatchCou1
            else -- 1v3
                nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
            end
            
            if nDefendCountry < 0 or nDefendCountry > 3 then
                return
            end
            
	    	local nTargetSceneId = nDefendCountry*100 + 104
	    	local varX = x550404_var_Wangcheng2Midao1_Entry_X + random( 2, 4)
	    	local z = x550404_var_Wangcheng2Midao1_Entry_Z + random( 2, 4)
	    	
	    	NewWorld( varMap, varPlayer, nTargetSceneId, varX, z, 550404 )    	
    	end
    end

    return 1
end




function x550404_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x550404_ProcAccept( varMap, varPlayer )
end




function x550404_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x550404_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x550404_CheckSubmit( varMap, varPlayer )
end




function x550404_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

