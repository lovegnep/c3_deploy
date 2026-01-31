x950000_var_FileId = 950000




x950000_var_QuestName="Çå¿Õ°ü¹ü"


--DECLARE_QUEST_INFO_STOP--



function x950000_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	for varI = 0, 180 do
		local itemnum = GetItemCountInBagPos(varMap, varPlayer, varI);
		if itemnum ~= nil then
			if itemnum > 0 then
				if EraseItem(varMap, varPlayer, varI) ~= 1 then return 0 end
			end
		end
	end
	
end




function x950000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950000_var_FileId,x950000_var_QuestName);
end
