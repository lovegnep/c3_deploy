
x310185_var_FileId = 310185

x310185_var_CreateTime = {From = 12*60+20,To = 13*60 + 30 }
x310185_var_DeleteTime = {From = 19*60+30,To = 20*60 + 30 }


x310185_var_WulongNPC  =   { 
							{ varMap=50,typeid =1182,guid= 141511,varX = 255, z=52, facedir =0, varName="乌龙主持人", title="乌龙辞典王国海选赛" }, 
						  { varMap=50,typeid =1182,guid= 141511,varX = 190, z=105, facedir =90,varName="乌龙主持人", title="乌龙辞典王国海选赛" }, 
							{ varMap=50,typeid =1182,guid= 141511,varX = 320, z=105, facedir =270,varName="乌龙主持人", title="乌龙辞典王国海选赛" }, 
							
							{ varMap=150,typeid =1182,guid= 141511,varX = 255, z=52, facedir =0, varName="乌龙主持人", title="乌龙辞典王国海选赛" }, 
						  { varMap=150,typeid =1182,guid= 141511,varX = 190, z=105, facedir =90, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 
							{ varMap=150,typeid =1182,guid= 141511,varX = 320, z=105, facedir =270, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 

							
							{ varMap=250,typeid =1182,guid= 141511,varX = 255, z=52, facedir =0, varName="乌龙主持人", title="乌龙辞典王国海选赛" }, 
							{ varMap=250,typeid =1182,guid= 141511,varX = 190, z=105, facedir =90, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 
							{ varMap=250,typeid =1182,guid= 141511,varX = 320, z=105, facedir =270, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 

							
							{ varMap=350,typeid =1182,guid= 141511,varX = 255, z=52, facedir =0, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 
							{ varMap=350,typeid =1182,guid= 141511,varX = 190, z=105, facedir =90, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 
							{ varMap=350,typeid =1182,guid= 141511,varX = 320, z=105, facedir =270, varName="乌龙主持人",title="乌龙辞典王国海选赛" }, 

							
							
							
							
							
							
							
							
							
              
							
							
							
							
							
              
							
							
							
							
							
              
							
							
							
							
							
							
						}

x310185_var_WulongNPC_obj = {}





function x310185_WulongNPC_Cleanup( varMap,why )

	
	
	
	if GetWeek() ~= 0 then
		return
	end

	if varMap ~= 50 and varMap ~= 150 and varMap ~=250 and varMap ~= 350 and varMap ~= 0 then
		return 
	end
	
	
	
	
	local strMsg = format("WLL:<Info>x310185_WulongNPC_Cleanup varMap = %d,why=%d ",varMap ,why)
    WriteLog( 1, strMsg )
	
	
	
	
	for varI,itm in x310185_var_WulongNPC_obj do
		if IsObjValid(varMap,itm[2]) == 1 and GetHp(varMap,itm[2]) > 0  then
			
			DeleteMonster(varMap,itm[2])
			
			
			strMsg = format("WLL:<Info>x310185_WulongNPC_Cleanup varMap = %d,obj=%d ",varMap ,itm[2])
			WriteLog( 1, strMsg )
			
		end
	end
	
	
	
	
	x310185_var_WulongNPC_obj = {}
end




function x310185_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	
	
	
	
	if GetWeek() ~= 0 then
		return
	end

	if varMap ~= 50 and varMap ~= 150 and varMap ~=250 and varMap ~= 350 and varMap ~= 0 then
		return 
	end
	
	
	
	
	
	local strMsg = format("WLL:<Info>x310185_ProcTimerDoingStart varMap = %d ",varMap )
    WriteLog( 1, strMsg )
	
	local nMin = GetMinOfDay()
	
	
	
	
	
	if nMin >= x310185_var_DeleteTime.From and nMin <= x310185_var_DeleteTime.To then
	
		
		
		local nCurrentNpcCount = getn(x310185_var_WulongNPC_obj)
		if nCurrentNpcCount > 0 then
			x310185_WulongNPC_Cleanup(varMap,0)	
			return
		end
	end
	
	
	
	
	if nMin < x310185_var_CreateTime.From and nMin > x310185_var_CreateTime.To then
		return
	end
	
	WULONGCIDIAN_STEPIN_NAME				={}
	WULONGCIDIAN_STEPIN_TIME				={}
	WULONGCIDIAN_STEPIN_COUNT			=0

	WULONGCIDIAN_AWARD_NAME				={}
	WULONGCIDIAN_AWARD_TIME				={}
	WULONGCIDIAN_AWARD_COUNT			=0
	WULONGCIDIAN_AWARD_Draw				={}
	
	
	local monsterchecklist = {}
	local monstercreateinfolist = {}
	local varMonsterCount = 0

	for varI, item in x310185_var_WulongNPC do
	
		if item.varMap == varMap then
			
			
			local varObj,objGUID = CreateMonster(varMap, item.typeid, item.varX, item.z, 3, 0, -1, item.guid, -1,	-1,item.facedir, item.varName, item.title)
			
			
			if varObj < 0 then
				local strMsg2 = format("WLL:<Info>Invalid obj  varMap = %d varObj =%d guid=%d",varMap, varObj,objGUID )
    			WriteLog( 1, strMsg2 )
			end
			
			
			varMonsterCount = varMonsterCount + 1
			monsterchecklist[varMonsterCount] = varObj
			monstercreateinfolist[varMonsterCount] = varI
			
			
			x310185_var_WulongNPC_obj[varMonsterCount] = {varI,varObj}
			
			
			local varMsg = format("WLL:<Info>CreateMonster OK,varMap=%d,varObj=%d,guid=%d,create_index=%d",varMap,varObj, objGUID,varI)
			WriteLog( 1, varMsg )
			
		end
	end
	
	
	
	
	
	if varMonsterCount <= 0 then
	
		
		local varMsg = format("WLL:<Info>CreateMonster Failed 0,varMap=%d,",varMap)
		WriteLog( 1, varMsg )
		
	else
	
		
		for varI = 1,varMonsterCount do
			
			
			if IsObjValid(varMap,monsterchecklist[varI]) ~= 1 then
			
				local item = x310185_var_WulongNPC[monstercreateinfolist[varI]]				
				local varObj,guid = CreateMonster(varMap, item.typeid, item.varX, item.z, 3, 0, -1, item.guid, -1,	5*60*60*1000,item.facedir, item.varName, item.title)
				
				local varMsg = format("WLL:<Info>CreateMonster Failed 1,varMap=%d,varObj=%d,objGUID=%d",varMap,varObj,guid)
				WriteLog( 1, varMsg )
			end
		end
	end
	
	
	
	
	
	SetSystemTimerTick( varMap, x310185_var_FileId, "ProcCheckTimer", varAct, 300*1000 )
end






function x310185_ProcCheckTimer( varMap, varAct, varTime )

	local varMsg = format("WLL:<Info>x310185_ProcCheckTimer ,varMap=%d",varMap)
	WriteLog( 1, varMsg )

	
	for varI,item in x310185_var_WulongNPC_obj do
		
		local varIndex = item[1]
		local varObj = item[2]
		
		local bValid = IsObjValid(varMap,varObj)
		local nHp = 0
		if bValid == 1 then
			nHp = GetHp(varMap,varObj)
		end
		
		
		local sx = x310185_var_WulongNPC[varIndex].varX
		local sz = x310185_var_WulongNPC[varIndex].z
		
		if bValid ==1 and nHp > 0 then
			
			
			local varX,z = GetWorldPos(varMap,varObj)
			
			
			
			
			if varX ~= sx or z ~= sz then
				SetPos(varMap,varMap,varObj,sx,sz)
				
				varMsg = format("WLL:<Error>Monster Position Error varMap=%d,varIndex = %d varX=%d,z=%d,sx = %d,sz = %d ",varMap,varIndex,varX,z,sx,sz)
				WriteLog( 1, varMsg )
			end
		else
			
			
			if bValid ~= 1 then
				
				varMsg = format("WLL:<Error>Monster Position not varValid varMap=%d, varIndex = %d,sx = %d,sz = %d ",varMap,varIndex,sx,sz)
				WriteLog( 1, varMsg )

			end
			
			
			if nHp <= 0 then
				
				varMsg = format("WLL:<Error>Monster Position (hp<=0) varMap=%d, varIndex = %d ,sx = %d,sz = %d ",varMap,varIndex,sx,sz)
				WriteLog( 1, varMsg )
			end
		end
	end
	
	
	local nMin = GetMinOfDay()
	if nMin >= x310185_var_DeleteTime.From and nMin <= x310185_var_DeleteTime.To then
		return
	end
	
	
	
	SetSystemTimerTick( varMap, x310185_var_FileId, "ProcCheckTimer", varAct, 300*1000 )
	
end
