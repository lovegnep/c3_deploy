

x301209_var_GatherPointTypeId = 159 
x301209_var_ItemId = 13030026 
x301209_var_MonsterType1              =   653                    
x301209_var_MonsterType2              =   654                    
x301209_var_MonsterGroup3              =   
                                       {
                                            {   type=x301209_var_MonsterType1, varX=228,  z=46,   ai=5,  aiscript=-1 },
                                             {   type=x301209_var_MonsterType1, varX=230,  z=46,   ai=5,  aiscript=-1 },
                                              {   type=x301209_var_MonsterType1, varX=229,  z=45,   ai=5,  aiscript=-1 },
                                               {   type=x301209_var_MonsterType1, varX=229,  z=47,   ai=5,  aiscript=-1 },
                                                {   type=x301209_var_MonsterType2, varX=229,  z=46,   ai=5,  aiscript=-1 },
                                          
                                        }




function x301209_CreateMonster3(varMap)
	local nFindObjid = 0
	local nMonsterCount = GetMonsterCount(varMap)
	for varI=1,nMonsterCount do
    	local varObj = GetMonsterObjID(varMap,varI-1)
    	if GetMonsterDataID(varMap,varObj) == x301209_var_MonsterType1 then
    		nFindObjid = nFindObjid+1
    	elseif GetMonsterDataID(varMap,varObj) == x301209_var_MonsterType2 then
    		nFindObjid = nFindObjid+1
    	end
	end
	if nFindObjid == 0 then
		for varI, item in x301209_var_MonsterGroup3 do
			CreateMonster(varMap, item.type, item.varX , item.z, item.ai, item.aiscript, -1,-1,21,30000);
		end
	end
end	


function 	x301209_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301209_var_GatherPointTypeId, varMap, 0, x301209_var_ItemId)
end




function	 x301209_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301209_var_GatherPointTypeId, x301209_var_ItemId )
end




function	 x301209_ProcGpRecycle(varMap,varPlayer,varTalknpc)
    x301209_CreateMonster3(varMap)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301209_var_GatherPointTypeId, x301209_var_ItemId )
	return 0
end





function	x301209_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



