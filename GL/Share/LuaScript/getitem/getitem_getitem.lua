x950010_var_FileId = 950010




x950010_var_QuestName="领取道具"


x950010_var_Items	=	{
										{
										},
										{
										},
										{
										}
									}

--DECLARE_QUEST_INFO_STOP--



function x950010_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local varItemCount = 0;
	
	for varI, items in x950010_var_Items do
		
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




function x950010_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950010_var_FileId,x950010_var_QuestName);
end
