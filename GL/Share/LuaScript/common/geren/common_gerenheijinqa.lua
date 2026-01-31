
x300824_var_FileId	= 300824

x300824_var_DatiGameIdList = {1016,1018,1020}
x300824_var_DatiMDList = {
							{ MD_FUBEN_ENTERTICK,MD_FUBEN_DATISTEP},
							{ MD_HEIJIN_ENTERTICK,MD_HEIJIN_DATISTEP},
							{ MD_LOGIN_ANSWER_ENTERTICK,MD_LOGIN_ANSWER_DATISTEP}
						}

function x300824_GetDatiMDByGameId(nGameId)

	local varIndex =0;
	
	for varI,item in x300824_var_DatiGameIdList do
		varIndex = varIndex +1
		if nGameId==item then
			return x300824_var_DatiMDList[varIndex][1],x300824_var_DatiMDList[varIndex][2]
		end
	end

	return -1,-1,-1
end





function x300824_ProcIntervalOverEvent( varMap, varPlayer )
	
		
	
	local nActiveGameId = GetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3])

	if nActiveGameId==0 then
		return
	end

	if GetGameOpenById(nActiveGameId)<=0 then
		return
	end
	
	
	local bJishi = GetPlayerGameData(varMap, varPlayer, MD_DATI_JISHI_KAIGUAN[1], MD_DATI_JISHI_KAIGUAN[2], MD_DATI_JISHI_KAIGUAN[3])
	
	if bJishi<=0 then
		return
	end


	local md_entertick,md_step = x300824_GetDatiMDByGameId(nActiveGameId)

	


		
	local nHumanEnterTick = GetPlayerGameData(varMap, varPlayer, md_entertick[1], md_entertick[2], md_entertick[3])+1
	
	

	SetPlayerGameData(varMap, varPlayer, md_entertick[1], md_entertick[2], md_entertick[3], nHumanEnterTick)

	if nHumanEnterTick>=40 then  
		OnFubenDatiNoAnswer(varMap, varPlayer,nActiveGameId)
	end
	
	
		
	
end


function x300824_ProcActiveEvent( varMap, varPlayer )

end


function x300824_ProcFadeOutEvent( varMap, varPlayer )

	
end

function x300824_ProcEventEntry()
end













function x300824_StartDati(varMap, varPlayer, nGameId)
	if GetGameOpenById(nGameId)<=0 then
		return 0
	end

	
    if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
        return 0
    end

    
    if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )> 0 then
    		StartTalkTask(varMap);
					TalkAppendString(varMap,"ËÀÍö×´Ì¬²»ÄÜ´ðÌâ");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
        return 0
    end

	local bCanJump =  x300824_IsJumpWaiguaDati(varMap, varPlayer, nGameId)

	if bCanJump>0 then
		return 1
	end

	
	local md_entertick,md_step = x300824_GetDatiMDByGameId(nGameId)

	
	
	local nCurrentTick = GetPlayerGameData(varMap, varPlayer, md_entertick[1], md_entertick[2], md_entertick[3])

			
	StartFubenDati(varMap, varPlayer, (200-nCurrentTick*5), nGameId,1,0)  

	SetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3], nGameId)
			
	SetPlayerGameData(varMap, varPlayer, MD_DATI_JISHI_KAIGUAN[1], MD_DATI_JISHI_KAIGUAN[2], MD_DATI_JISHI_KAIGUAN[3], 0)
	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, 8713,0 )  

	return 2	
	
end

function x300824_CloseDatiOnServer(varMap, varPlayer, nGameId)
	
	SetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_DATI_JISHI_KAIGUAN[1], MD_DATI_JISHI_KAIGUAN[2], MD_DATI_JISHI_KAIGUAN[3],0)
	CancelSpecificImpact(varMap, varPlayer, 8713);

    
    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_BLACKGOLD, 0)

	local md_entertick,md_step = x300824_GetDatiMDByGameId(nGameId)

	SetPlayerGameData(varMap, varPlayer, md_entertick[1], md_entertick[2], md_entertick[3], 0)
	SetPlayerGameData(varMap, varPlayer, md_step[1], md_step[2], md_step[3], 0)

	CancelSpecificImpact(varMap, varPlayer, 9825);

end



function x300824_IsJumpWaiguaDati(varMap, varPlayer, nGameId)
	if GetGameOpenById(nGameId)<=0 then
		return -1
	end

	local varMapType = GetSceneType(varMap) ;
	if nGameId==1016 then
		if varMapType~=1 then
			return -1
		end
	end

	
	local bufflist = {9011,9012,9013}

	for varI,item in bufflist do
		local bHaveImpact = IsHaveSpecificImpact( varMap, varPlayer, item )

		if bHaveImpact>0 then
			return 1;
		end
	end

	
	return 0
end



function x300824_CancelWaiguaDati(varMap, varPlayer)
	
	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local nActiveGameId = GetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3])

	if nActiveGameId==0 then
		return
	end

	if GetGameOpenById(nActiveGameId)<=0 then
		return
	end

	local varMapType = GetSceneType(varMap) ;
	if nActiveGameId==1016 then
		if varMapType~=1 then
			return
		end
	end

	
	CancelSpecificImpact(varMap, varPlayer, 8713);
	
	x300824_CloseDatiOnServer(varMap, varPlayer, nActiveGameId)

	

	
			
	
	
end



function x300824_ProcAnswerFubenDati(varMap, varPlayer, nGameId)
	
	

	

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local nActiveGameId = GetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3])

	if nActiveGameId==0 then
		return
	end

	if GetGameOpenById(nActiveGameId)<=0 then
		return
	end

	if nGameId~=nActiveGameId then
		return
	end

	local varMapType = GetSceneType(varMap) ;
	if nGameId==1016 then
		if varMapType~=1 then
			return
		end
	end

	
	
	local countryId = GetCurCountry( varMap, varPlayer)
	if nActiveGameId == 1016 then 
		
		
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_DATI[1], MD_FUBEN_DATI[2], MD_FUBEN_DATI[3],0)
		AddExp(varMap, varPlayer,500)  

		
		
	elseif nActiveGameId == 1018 then

		
		if countryId == 0 then
			LuaCallNoclosure(300757, "ProcHeiJinDatiSuccess", varMap, varPlayer);
		end
		
		if countryId == 1 then
			LuaCallNoclosure(300863, "ProcHeiJinDatiSuccess", varMap, varPlayer);
		end
		
		if countryId == 2 then
			LuaCallNoclosure(300862, "ProcHeiJinDatiSuccess", varMap, varPlayer);
		end
		
		if countryId == 3 then
			LuaCallNoclosure(300861, "ProcHeiJinDatiSuccess", varMap, varPlayer);
		end

		
	elseif nActiveGameId == 1020 then
		LuaCallNoclosure(800100, "ProcDatiSuccess", varMap, varPlayer);
	end
	
	x300824_CloseDatiOnServer(varMap, varPlayer, nGameId)
			
	

end


function x300824_FubenEnterPrison(varMap, varPlayer, nGameId, varMode)
	
	
	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local nActiveGameId = GetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3])

	if nActiveGameId==0 then
		return
	end

	if GetGameOpenById(nActiveGameId)<=0 then
		return
	end

	if nGameId~=nActiveGameId then
		return
	end

	local varMapType = GetSceneType(varMap) ;
	if nGameId==1016 then
		if varMapType~=1 then
			return
		end
	end

	if varMode ==1 then  


		local md_entertick,md_step = x300824_GetDatiMDByGameId(nGameId)
		

		
		local varStep = GetPlayerGameData(varMap, varPlayer, md_step[1], md_step[2], md_step[3])+1
		SetPlayerGameData(varMap, varPlayer, md_step[1], md_step[2], md_step[3],varStep)
		if varStep<5 then
			local nCurrentTick = GetPlayerGameData(varMap, varPlayer, md_entertick[1], md_entertick[2], md_entertick[3])
			StartFubenDati(varMap, varPlayer, 200-nCurrentTick*5, nActiveGameId,0,varStep)
			
			return
		end
		
	end

	
	

	x300824_CloseDatiOnServer(varMap, varPlayer, nGameId)
	
	local countryId = GetCurCountry( varMap, varPlayer)
	if nGameId == 1016 then
		LuaCallNoclosure(700012, "ProcDatiFail", varMap, varPlayer)
	elseif nActiveGameId == 1018 then
		if countryId == 0 then
			LuaCallNoclosure(300757, "ProcDatiFail", varMap, varPlayer);
		end
		if countryId == 1 then
			LuaCallNoclosure(300863, "ProcDatiFail", varMap, varPlayer);
		end
		if countryId == 2 then
			LuaCallNoclosure(300862, "ProcDatiFail", varMap, varPlayer);
		end
		if countryId == 3 then
			LuaCallNoclosure(300861, "ProcDatiFail", varMap, varPlayer);
		end
	elseif 	nActiveGameId == 1020 then
		LuaCallNoclosure(800100, "ProcDatiFail", varMap, varPlayer);
	end
	
	

	
	
	local varMsg = "Dati failed:"..GetName(varMap, varPlayer)..","..GetPlayerGUID( varMap,varPlayer )..","..nGameId
	WriteLog(1,varMsg)
	
end



function x300824_SaveEncryptArith(varMap, varPlayer, varIndex,nValue)
	if varIndex== nil then
		return
	end

	if varIndex==0 then
		SetPlayerGameData(varMap, varPlayer, MD_ENCRYPT_ARITH1[1], MD_ENCRYPT_ARITH1[2], MD_ENCRYPT_ARITH1[3],nValue) 
	elseif varIndex==1 then
		SetPlayerGameData(varMap, varPlayer, MD_ENCRYPT_ARITH2[1], MD_ENCRYPT_ARITH2[2], MD_ENCRYPT_ARITH2[3],nValue) 
	elseif varIndex==2 then
		SetPlayerGameData(varMap, varPlayer, MD_ENCRYPT_ARITH3[1], MD_ENCRYPT_ARITH3[2], MD_ENCRYPT_ARITH3[3],nValue) 
	end
end

function x300824_SaveDatiResult(varMap, varPlayer, nResult)

	if nResult==nil then
		return
	end

	if nResult<0 or nResult>5 then
		return
	end

	SetPlayerGameData(varMap, varPlayer, MD_DATI_RESULT[1], MD_DATI_RESULT[2], MD_DATI_RESULT[3],nResult) 
end


function x300824_GetEncryptArith(varMap, varPlayer, varIndex)
	if varIndex== nil then
		return -1;
	end

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return -1;
	end
	
	if varIndex==0 then
		return GetPlayerGameData(varMap, varPlayer, MD_ENCRYPT_ARITH1[1], MD_ENCRYPT_ARITH1[2], MD_ENCRYPT_ARITH1[3]) 
	elseif varIndex==1 then
		return GetPlayerGameData(varMap, varPlayer, MD_ENCRYPT_ARITH2[1], MD_ENCRYPT_ARITH2[2], MD_ENCRYPT_ARITH2[3]) 
	elseif varIndex==2 then
		return GetPlayerGameData(varMap, varPlayer, MD_ENCRYPT_ARITH3[1], MD_ENCRYPT_ARITH3[2], MD_ENCRYPT_ARITH3[3]) 
	else
		return -1;
	end

end

function x300824_GetDatiResult(varMap, varPlayer)

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return -1;
	end

	return GetPlayerGameData(varMap, varPlayer, MD_DATI_RESULT[1], MD_DATI_RESULT[2], MD_DATI_RESULT[3]) 
end

function x300824_ProcClientGetDati(varMap, varPlayer, nGameId)

	local nActiveGameId = GetPlayerGameData(varMap, varPlayer, MD_DATI_ACTIVE_ID[1], MD_DATI_ACTIVE_ID[2], MD_DATI_ACTIVE_ID[3])

	if nActiveGameId==0 then
		return
	end

	

	if GetGameOpenById(nActiveGameId)<=0 then
		return
	end

	if nActiveGameId~=nGameId then
		return
	end

	local bJishi = GetPlayerGameData(varMap, varPlayer, MD_DATI_JISHI_KAIGUAN[1], MD_DATI_JISHI_KAIGUAN[2], MD_DATI_JISHI_KAIGUAN[3])
	
	if bJishi>0 then
		return
	end


	SetPlayerGameData(varMap, varPlayer, MD_DATI_JISHI_KAIGUAN[1], MD_DATI_JISHI_KAIGUAN[2], MD_DATI_JISHI_KAIGUAN[3], 1)  

    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_BLACKGOLD, 1)

	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, 9825,0 ) 

end










