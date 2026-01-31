
x270205_var_FileId              = 270205

x270205_var_NPCList               = {}

x270205_var_MinLevel      				= 80

x270205_var_LessThanMinLevel  = format( "本活动只对#G%d#cffcc00级以上玩家开放", x270205_var_MinLevel)

x270205_var_PosList               = {
                                    { varX = 85,  z = 129, varIndex = 1  }, 
                                    { varX = 84,  z = 116, varIndex = 2  }, 
                                    { varX = 85,  z = 123, varIndex = 3  }, 
                                    { varX = 95,  z = 116, varIndex = 4  }, 
                                    { varX = 95,  z = 129, varIndex = 5  }, 
                                    { varX = 114, z = 124, varIndex = 6  }, 
                                    { varX = 108, z = 121, varIndex = 7  }, 
                                    { varX = 108, z = 125, varIndex = 8  }, 
                                    { varX = 118, z = 116, varIndex = 9  }, 
                                    { varX = 128, z = 123, varIndex = 10 }, 
                                    { varX = 118, z = 130, varIndex = 11  }, 
}

x270205_var_Created               = {}

x270205_var_Available             = {}

x270205_var_IsEnableId            = 1044

x270205_var_Startsign             = 0

function x270205_ProcMapCreate( varMap)
    if varMap ~= 40 then
        return
    end

    
end

function x270205_Start( varMap,varPlayer)
	if x270205_var_Startsign == 0 then
		x270205_var_Startsign =1
		SetSystemTimerTick( varMap, x270205_var_FileId, "DaguanyunTimer", 325, 10000)

    local strLog = format( "Timer %d active varScript %d. ", 325, x270205_var_FileId)
    WriteLog( 1, strLog)
  end  
end

function x270205_DaguanyunTimer( varMap, varAct, varTime)
    if GetGameOpenById( x270205_var_IsEnableId) <= 0 then
        return
    end

		x270205_KickPlayer( varMap)


    if getn( x270205_var_NPCList) == 0 then
            x270205_var_Available = x270205_var_PosList
            local empty = {}
            local varIndex = 1
--            for varI = 1, 5 do
                varIndex = x270205_var_Available[ random( 1, getn( x270205_var_Available) ) ].varIndex
                x270205_var_NPCList[ getn( x270205_var_NPCList) + 1] = { p = varIndex, varObj = -1, guid = -1, varCount = 0 }
                for j, item in x270205_var_Available do
                    if varIndex ~= item.varIndex then
                        empty[ getn( empty) + 1] = item
                    end
                end
                x270205_var_Created[ getn( x270205_var_Created) + 1] = varIndex
                x270205_var_Available = empty
                empty = {}
--            end
            
            for varI, item in x270205_var_NPCList do
                local pos = x270205_var_PosList[ item.p]
                x270205_var_NPCList[ varI].varObj, x270205_var_NPCList[ varI].guid = CreateMonster( varMap, 4115, pos.varX, pos.z, 3, -1, -1, 143176, 5)
            end
            local strLog = format( "Script %d create 5 NPC. ", x270205_var_FileId)
            WriteLog( 1, strLog)
     else
            for varI, item in x270205_var_NPCList do
                if item.varObj == -1 then
                    if item.varCount == 1 then
                        
                        local varIndex = x270205_var_Available[ random( 1, getn( x270205_var_Available) ) ].varIndex
                        item.varObj, item.guid = CreateMonster( varMap, 4115, x270205_var_PosList[ varIndex].varX, x270205_var_PosList[ varIndex].z, 3, -1, -1, 143176, 5)
                        item.p = varIndex
                        item.varCount = 0
                        x270205_var_Created[ getn( x270205_var_Created) + 1] = varIndex
                        local strLog = format( "Script %d create a NPC. ", x270205_var_FileId)
                        WriteLog( 1, strLog)
                        
                        local tblTemp = {}
                        for j, iter in x270205_var_Available do
                            if varIndex ~= iter.varIndex then
                                tblTemp[ getn( tblTemp) + 1] = iter
                            end
                        end
                        x270205_var_Available = tblTemp
                    else
                        item.varCount = item.varCount + 1
                    end
                end
            end
      end

            SetSystemTimerTick( varMap, x270205_var_FileId, "DaguanyunTimer", varAct, 10000)


end

function x270205_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x270205_var_IsEnableId) <= 0 then
        return
    end
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y扬武号的安全隐患" )
        TalkAppendString( varMap, "\t肥硕的海船黑老鼠用无辜可怜的眼神看着你。抓住它防止扬武号的船板被啃坏。预防海难，人人有责。" )
        TalkAppendButton( varMap, x270205_var_FileId, "抓住老鼠", 3, 1)
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end

function x270205_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    if GetGameOpenById( x270205_var_IsEnableId) <= 0 then
        return
    end
    
    if GetLevel( varMap, varPlayer) < x270205_var_MinLevel then
        Msg2Player( varMap, varPlayer, x270205_var_LessThanMinLevel, 8, 3)
        return 
    end
    local  WorldID = GetWorldID(varMap,varPlayer)
		local  guid,Level20 = GetToplistInfo(varMap,0,49)
	--	if Level20 <80 then
	--		 Msg2Player(varMap, varPlayer, format("很抱歉，等级排行榜上第50名玩家不足80级，请下次再来"), 0, 3)
	--		return
	--	end
   


    for varI, item in x270205_var_NPCList do
        if item.varObj == varTalknpc then
            DeleteMonster( varMap, varTalknpc)
            item.varObj = -1
            item.guid = -1
            
            local tblTemp = {}
            for j, iter in x270205_var_Created do
                if iter ~= item.p then
                    tblTemp[ getn( tblTemp) + 1] = iter
                else
                    x270205_var_Available[ getn( x270205_var_Available) + 1] = x270205_var_PosList[ iter]
                end
            end
            x270205_var_Created = tblTemp
            GamePlayScriptLog(varMap, varPlayer, 1661)  
            local xp = GetLevel( varMap, varPlayer) * 120

            AddExp( varMap, varPlayer, xp)
            Msg2Player(varMap, varPlayer, format("抓住老鼠，为扬武号排除安全隐患，获得%d点经验奖励，祝航行愉快。",xp), 0, 2)
            Msg2Player(varMap, varPlayer, format("抓住老鼠，为扬武号排除安全隐患，获得%d点经验奖励，祝航行愉快。",xp), 0, 3)

            local varHumanCount = GetScenePlayerCount( varMap)
            for varI = 0, varHumanCount - 1 do
                local varObj = GetScenePlayerObjId( varMap, varI)
                if varObj ~= varPlayer then
                    local xp1 = GetLevel( varMap, varObj) * 95
                    AddExp( varMap, varObj, xp1)
                    Msg2Player(varMap, varObj, format("抓住老鼠，为扬武号排除安全隐患，获得%d点经验奖励，祝航行愉快。",xp1), 0, 2)
                    Msg2Player(varMap, varObj, format("抓住老鼠，为扬武号排除安全隐患，获得%d点经验奖励，祝航行愉快。",xp1), 0, 3)
                end	
            end
        end
    end
end


function x270205_KickPlayer( varMap)
			local h,m,s = GetHourMinSec()	
			local t =mod(m,15)
			if t == 14 then
		   local varHumanCount = GetScenePlayerCount( varMap)
		   if varHumanCount == 0 or s>40 then return end
		    for varI = 0, varHumanCount - 1 do
		        local varObj = GetScenePlayerObjId( varMap, varI)
		        Msg2Player(varMap, varObj, "威海港已经到了，感谢您本次的乘坐，祝您一路顺风！", 0, 2)
         		Msg2Player(varMap, varObj, "威海港已经到了，感谢您本次的乘坐，祝您一路顺风！", 0, 3)
				NewWorld( varMap, varObj,  15, 157 + random( 0, 5), 130 + random( 0, 5), 270205)
		    end
			elseif t == 6 or t == 7 then
		   local varHumanCount = GetScenePlayerCount( varMap)
		   if varHumanCount == 0 then return end
		    for varI = 0, varHumanCount - 1 do
		        local varObj = GetScenePlayerObjId( varMap, varI)
		        Msg2Player(varMap, varObj, "卡迪兹港已经到了，感谢您本次的乘坐，祝您一路顺风！", 0, 2)
            Msg2Player(varMap, varObj, "卡迪兹港已经到了，感谢您本次的乘坐，祝您一路顺风！", 0, 3)
						NewWorld( varMap, varObj, 569, 205 + random( 0, 5), 358 + random( 0, 5), 270205)
		    end
		  end  
end

























