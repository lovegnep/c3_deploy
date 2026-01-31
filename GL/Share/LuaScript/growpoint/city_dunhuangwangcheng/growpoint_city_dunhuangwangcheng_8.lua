

x301009_var_GatherPointTypeId = 10 
x301009_var_ItemId = 13011003 
x301009_var_QuestId = 2730
x301009_var_Bossid =-1


function 	x301009_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301009_var_GatherPointTypeId, varMap, 0, x301009_var_ItemId)
end




function	 x301009_ProcGpOpen(varMap,varPlayer,varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x301009_var_QuestId)
		if IsHaveQuest(varMap,varPlayer, x301009_var_QuestId) > 0 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 1   then
					return 0
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"ÄúÒÑ¾­°Î³ýÁËÏÄÉ£¾Õ")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 1
			end
		end
		return 1
end




function	 x301009_ProcGpRecycle(varMap,varPlayer,varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x301009_var_QuestId)
		if IsHaveQuest(varMap,varPlayer, x301009_var_QuestId) > 0 then
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
					StartTalkTask(varMap)
					TalkAppendString(varMap,format("°Î³ýÏÄÉ£¾Õ    %d/1",GetQuestParam(varMap,varPlayer,varQuestIdx,0) ))
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >= 1   then
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
					local shuwang =random(1,10)
					if shuwang == 10 then
							local nFindObjid = 1
							local nMonsterCount = GetMonsterCount(varMap)
							for varI=1,nMonsterCount do
    							local varObj = GetMonsterObjID(varMap,varI-1)
    							if varObj == x301009_var_Bossid then
    									nFindObjid = 0
    									break
    							end
							end
							if nFindObjid ==1 then
									local nPlayerX, nPlayerZ = GetWorldPos(varMap, varPlayer)
									
									x301009_var_Bossid=CreateMonster(varMap, 1519,nPlayerX,nPlayerZ,5,1,-1,-1,21,300000,0)
							end
					end
					return 1
		end
		return 0

end





function	x301009_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


