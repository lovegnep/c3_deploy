

x301207_var_GatherPointTypeId = 157 
x301207_var_ItemId = 13030022 
x301207_var_BossType					= 	647                    
x301207_var_BossCreate				=	{{	hash=1, type=x301207_var_BossType, varX=182, z=121, ai=9, aiscript=1001	}}
x301207_var_Bossid =-1



function x301207_CreateBoss(varMap)
	for varI, item in x301207_var_BossCreate do
		x301207_var_Bossid = CreateMonster(varMap, x301207_var_BossType, 182, 121, 5, 1001, -1,-1,21);
		
	end

end										



function 	x301207_ProcGpCreate(varMap,varGpType,varX,varY)

	local varBoxId = ItemBoxEnterScene(varX, varY, x301207_var_GatherPointTypeId, varMap, 0, x301207_var_ItemId)
end




function	 x301207_ProcGpOpen(varMap,varPlayer,varTalknpc)
		local nFindObjid = 1
		local nMonsterCount = GetMonsterCount(varMap)
		for varI=1,nMonsterCount do
    		local varObj = GetMonsterObjID(varMap,varI-1)
    		if varObj == x301207_var_Bossid then
    			nFindObjid = 0
    			break
    		end
		end
		if nFindObjid == 1 then
    	local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,359);
    	if isHaveQuest == 1 then
    		if GetItemCount(varMap,varPlayer,13030022) == 0 then
    	    return 0;
    	  else
    	  	StartTalkTask(varMap)
					TalkAppendString(varMap,"你已经得到了狼人酒")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 1
				end
    	else
    	    return 1;
    	end
   	else
   		StartTalkTask(varMap)
			TalkAppendString(varMap,"怪物已经被召唤出")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
   		return 1
   	end

end




function	 x301207_ProcGpRecycle(varMap,varPlayer,varTalknpc)
   x301207_CreateBoss(varMap)
   return 0
  
end





function	x301207_ProcGpProcOver(varMap,varPlayer,varTalknpc)
  	

end



