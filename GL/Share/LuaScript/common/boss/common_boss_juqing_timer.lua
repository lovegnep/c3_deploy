
x305000_var_FileId = 305000
x305000_var_FilterScene = {
							54,56,57,58,59,60,61,62,
							154,156,157,158,159,160,161,162,
							254,256,257,258,259,260,261,262,
							354,356,357,358,359,360,361,362,
						}

function x305000_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )

	local bFind = 0
	for varI,item in x305000_var_FilterScene do
		if item == varMap then
			bFind = 1
			break
		end
	end
	
	if bFind == 0 then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID( x305000_var_FileId )
	local nDataCount = GetFubenDataCountByScriptID( x305000_var_FileId )
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x305000_var_FileId,nIndexFrom,varI)
		if idScript == x305000_var_FileId and monsterFlag == 0 and varMap == varFlag then
			for j=0,varCount -1 do
				CreateMonster( varMap, type, varX, z, ai, aiscript, -1, -1, 21, 30*60*1000)
			end
		end
	end
end
