x950005_var_FileId = 950005




x950005_var_QuestName="领取其余装备"


x950005_var_Items	=	{
										{
										},
										{
										},
										{
										}
									}

--DECLARE_QUEST_INFO_STOP--



function x950005_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local varItemCount = 0;
	
	for varI, items in x950005_var_Items do
		
		StartItemTask(varMap);
		for j, item in items do
			ItemAppend( varMap, item.varId, item.varNum );
			varItemCount = varItemCount + 1;
		end
		varRet = StopItemTask(varMap,varPlayer);
		if varRet > 0 and varItemCount > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer);
		end
	end
	
end




function x950005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950005_var_FileId,x950005_var_QuestName);
end
