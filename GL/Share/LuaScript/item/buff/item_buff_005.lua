





function x417005_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	local zhiye = GetZhiye(varMap, varPlayer);
	local varQuest = 1441 + zhiye;
	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	end
end


