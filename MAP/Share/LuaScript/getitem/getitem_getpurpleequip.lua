x950003_var_FileId = 950003




x950003_var_QuestName="ÁìÈ¡×Ï×°"


x950003_var_Items	=	{
										{
											{varId=10202301, varNum=1},
											{varId=10202302, varNum=1},
											{varId=10202303, varNum=1},
											{varId=10222301, varNum=1},
											{varId=10222302, varNum=1},
											{varId=10222303, varNum=1}
										},
										{
											{varId=10232301, varNum=1},
											{varId=10232302, varNum=1},
											{varId=10232303, varNum=1},
											{varId=10252301, varNum=1},
											{varId=10252302, varNum=1},
											{varId=10252303, varNum=1}
										},
										{
											{varId=10272301, varNum=1},
											{varId=10272302, varNum=1},
											{varId=10272303, varNum=1}
										}
									}

--DECLARE_QUEST_INFO_STOP--



function x950003_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local varItemCount = 0;
	
	for varI, items in x950003_var_Items do
		
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




function x950003_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950003_var_FileId,x950003_var_QuestName);
end
