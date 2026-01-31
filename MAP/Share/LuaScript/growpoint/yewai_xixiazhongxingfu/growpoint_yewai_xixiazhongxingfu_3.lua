

x301218_var_GatherPointTypeId = 170 
x301218_var_ItemId = 13030067 
x301218_var_BossType					= 	815                    
x301218_var_BossCreate				=	{{	hash=1, type=x301218_var_BossType, varX=44, z=210, ai=9, aiscript=-1	}}
x301218_var_Bossid =-1



function x301218_CreateBoss(varMap)
	for varI, item in x301218_var_BossCreate do
		x301218_var_Bossid = CreateMonster(varMap, x301218_var_BossType, 44, 210, 5, 1001, -1,-1,21);
		
	end

end										



function 	x301218_ProcGpCreate(varMap,varGpType,varX,varY)

	local varBoxId = ItemBoxEnterScene(varX, varY, x301218_var_GatherPointTypeId, varMap, 0, x301218_var_ItemId)
end




function	 x301218_ProcGpOpen(varMap,varPlayer,varTalknpc)
		local nFindObjid = 1
		local nMonsterCount = GetMonsterCount(varMap)
		for varI=1,nMonsterCount do
    		local varObj = GetMonsterObjID(varMap,varI-1)
    		if varObj == x301218_var_Bossid then
    			nFindObjid = 0
    			break
    		end
		end
		if nFindObjid == 1 then
    	local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,468);
    	if isHaveQuest == 1 then
    		if GetItemCount(varMap,varPlayer,13030067) == 0 then
    	    return 0;
    	  else
    	  	StartTalkTask(varMap)
					TalkAppendString(varMap,"你已经得到了冰晶戒指")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 1
				end
    	else
    	    return 1;
    	end
   	else
   		StartTalkTask(varMap)
			TalkAppendString(varMap,"似乎“半只耳”不在洞里")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
   		return 1
   	end

end




function	 x301218_ProcGpRecycle(varMap,varPlayer,varTalknpc)
   x301218_CreateBoss(varMap)
   return 1
  
end





function	x301218_ProcGpProcOver(varMap,varPlayer,varTalknpc)
  	

end


