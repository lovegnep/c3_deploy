 
x701010_var_FileId	= 701010

x701010_var_TempTable = {}

 
function x701010_ProcEventEntry( varMap, varPlayer,varTalknpc,varScript,extid ) 
 
	
		StartTalkTask(varMap)                                             
		TalkAppendString(varMap,"\t是谁胆敢吵醒我？我会给他点颜色看看。\n\t你确定要与我一战么？") 
		StopTalkTask(varMap)                                              
		DeliverTalkInfo( varMap, varPlayer,  varTalknpc, x701010_var_FileId, -1  )  
       
end                                                                    

function x701010_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local guid = GetGUID(varMap, varPlayer)
	if (guid <= 0) then
		return 0
	end
	
	x701010_var_TempTable[guid] = varTalknpc
	return 1
end

function x701010_ProcAccept(varMap, varPlayer)

	local guid = GetGUID(varMap, varPlayer)
	if (x701010_var_TempTable[guid] == nil) then
		return
	end
	
	local npcId = x701010_var_TempTable[guid]
	SetMonsterCamp(varMap, npcId, 21)
	x701010_var_TempTable[guid] = nil
end

function x701010_ProcDie(varMap, varPlayer, varKiller)
		local type = GetMonsterDataID(varMap, varPlayer)
		if type > 57035 or type < 57000 then
			 return
		end

		local strPlayerName = GetName( varMap, varKiller)
		local varCountry = GetCurCountry( varMap, varKiller )
		local strCountryName = "";
		if varCountry==0 then
			strCountryName = "楼兰"
		elseif varCountry==1 then
			strCountryName = "天山"
		elseif varCountry==2 then
			strCountryName = "昆仑"
		elseif varCountry==3 then
			strCountryName = "敦煌"
		end
		local strMapName = "三番副本中"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
end
