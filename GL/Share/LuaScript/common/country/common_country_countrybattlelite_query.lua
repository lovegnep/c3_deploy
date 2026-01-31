x310152_var_FileId                      = 310152





function x310152_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )


    
    if GetMergeDBToggle() == 1 then
        return
    end
    
    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_COUNTRYBATTLELITE ) == 0 then
        return
    end
    
    if LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer) < 0 then
        return
    end
    
    TalkAppendButton(varMap,x310152_var_FileId,"【屠城战】查询",3);
        
end




function x310152_GetCountryName( countryId )
    
    if countryId == 0 then
        return "楼兰王国"
    elseif countryId == 1 then
        return "天山王国"
    elseif countryId == 2 then
        return "昆仑王国"
    elseif countryId == 3 then
        return "敦煌王国"
    end
    
end




function x310152_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

    
    if GetMergeDBToggle() == 1 then
        return
    end
    
  	
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_COUNTRYBATTLELITE ) == 0 then
        return
    end
    
    local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
    if camp < 0 then
        return
    end
    
    local match1,match2,match3,cnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT,"GetCountryBattleLite_MatchCountry",varMap ,varPlayer)
    
     
    if cnt <= 0 then
        return
    end
    
    local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )
    
    local strMsg = ""
    
    if bIs1v1Mode == 1 then
        
        local strCountryName = x310152_GetCountryName( match1 )
        if camp == 1 then
        
            strMsg = format("#Y【屠城战1v1】查询#r\t#G今天您处于防守方，您将要驱逐的侵略者是：#R%s",strCountryName )
            
            
        else
            
            strMsg = format("#Y【屠城战1v1】查询#r\t#G今天您处于进攻方，您的敌人是：#R%s",strCountryName )
            
            
        end
    
    
    else -- 1v3
        
         local strCountryName = ""
         if match1 >= 0 and match1 < 4 then
            strCountryName = strCountryName.. x310152_GetCountryName( match1 )
         end
         if match2 >= 0 and match2 < 4 then
            if strCountryName ~= "" then
                strCountryName = strCountryName..","
            end
            strCountryName = strCountryName.. x310152_GetCountryName( match2 )
         end
         if match3 >= 0 and match3 < 4 then
            if strCountryName ~= "" then
                strCountryName = strCountryName..","
            end
            strCountryName = strCountryName.. x310152_GetCountryName( match3 )
         end
             
         local nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
         local strDefendCountry = x310152_GetCountryName( nDefendCountry )
            
        if camp == 1 then
            
            strMsg = format("#Y【屠城战1v3】查询#r\t#G今天您处于防守方，您将要驱逐的侵略者是：#R%s",strCountryName )
        
        elseif camp == 2 then
            
            strMsg = format("#Y【屠城战1v3】查询#r\t#G今天您处于防守方，您将要帮助#R%s#G驱逐来自#R%s#G的侵略者",strDefendCountry,strCountryName )
                 
        else
            
           
            strMsg = format("#Y【屠城战1v3】查询#r\t#G今天您处于进攻方，您的敌人是：#R%s#G, 您要进攻的国家是：#R%s",strCountryName, strDefendCountry )
               
        end
    end
    
    StartTalkTask(varMap) 
    TalkAppendString(varMap, strMsg )
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    
end


function x310152_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310152_ProcAccept( varMap, varPlayer )
end




function x310152_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310152_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310152_CheckSubmit( varMap, varPlayer )
end




function x310152_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310152_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310152_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310152_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
