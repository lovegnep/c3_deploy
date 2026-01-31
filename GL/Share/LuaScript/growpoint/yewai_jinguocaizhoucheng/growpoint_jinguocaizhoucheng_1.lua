

x301212_var_GatherPointTypeId = 162 
x301212_var_ItemId = 13030049 
x301212_var_MonsterType              =  708                    
x301212_var_MonsterGroup3              =   
                                       {
                                            {   type=x301212_var_MonsterType, varX=74,  z=219,   ai=5,  aiscript=-1 },
                                             {   type=x301212_var_MonsterType, varX=76,  z=219,   ai=5,  aiscript=-1 },
                                              {   type=x301212_var_MonsterType, varX=77,  z=221,   ai=5,  aiscript=-1 },
                                               {   type=x301212_var_MonsterType, varX=77,  z=219,   ai=5,  aiscript=-1 },
                                                {   type=x301212_var_MonsterType, varX=74,  z=221,   ai=5,  aiscript=-1 },
                                                 {   type=x301212_var_MonsterType, varX=76,  z=221,   ai=5,  aiscript=-1 },
                                                     {   type=x301212_var_MonsterType, varX=73,  z=219,   ai=5,  aiscript=-1 },
                                                      {   type=x301212_var_MonsterType, varX=73,  z=221,   ai=5,  aiscript=-1 },
                                                         {   type=x301212_var_MonsterType, varX=74,  z=220,   ai=5,  aiscript=-1 },
                                                              {   type=x301212_var_MonsterType, varX=75,  z=220,   ai=5,  aiscript=-1 },
                                                                  {   type=x301212_var_MonsterType, varX=76,  z=220,   ai=5,  aiscript=-1 },
                                          
                                        }

function x301212_CreateMonster3(varMap)
	local nFindObjid = 0
	local nMonsterCount = GetMonsterCount(varMap)
	for varI=1,nMonsterCount do
    	local varObj = GetMonsterObjID(varMap,varI-1)
    	if GetMonsterDataID(varMap,varObj) == x301212_var_MonsterType then
    		nFindObjid = nFindObjid+1
    	end
	end
	if nFindObjid <= 3 then
		for varI, item in x301212_var_MonsterGroup3 do
			CreateMonster(varMap, item.type, item.varX , item.z, item.ai, item.aiscript, -1,-1,21,30000);
		end
	end
end	



function 	x301212_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301212_var_GatherPointTypeId, varMap, 0, x301212_var_ItemId)
end




function	 x301212_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301212_var_GatherPointTypeId, x301212_var_ItemId )
end




function	 x301212_ProcGpRecycle(varMap,varPlayer,varTalknpc)
    
 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301212_var_GatherPointTypeId, x301212_var_ItemId )
 return 0
end






function	x301212_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



