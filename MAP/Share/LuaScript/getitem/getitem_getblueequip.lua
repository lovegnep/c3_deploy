x950002_var_FileId = 950002




x950002_var_QuestName="ÁìÈ¡À¶×°"


x950002_var_Items	=	{
										{
											{varId=10231002, varNum=1},
											{varId=10251002, varNum=1},
											{varId=10271002, varNum=1}
										},
										
										{
										 {varId=10231003, varNum=1},
										 {varId=10251003, varNum=1},
										 {varId=10271003, varNum=1}
										
										},
										{
											{varId=10237001, varNum=1},
											{varId=10257001, varNum=1},
											{varId=10277001, varNum=1}
										},
										
										{
											{varId=10230201, varNum=1},
											{varId=10250201, varNum=1},
											{varId=10270201, varNum=1}
										},
										
										{
											{varId=10230202, varNum=1},
											{varId=10250202, varNum=1},
											{varId=10270202, varNum=1}
										
										},
										{
											{varId=10230203, varNum=1},
											{varId=10250203, varNum=1},
											{varId=10270203, varNum=1}
										},
										
										{
											{varId=10230204, varNum=1},
											{varId=10250204, varNum=1},
											{varId=10270204, varNum=1}
									    },
									 
										{
											{varId=10230205, varNum=1},
											{varId=10250205, varNum=1},
											{varId=10270205, varNum=1}
										},
										
								    {
									    {varId=10236002, varNum=1},
									    {varId=10256002, varNum=1},
									    {varId=10276002, varNum=1}
										},
										
										{
											{varId=10233001, varNum=1},
											{varId=10253001, varNum=1},
											{varId=10273001, varNum=1}
										},
									
									{
											{varId=10233002, varNum=1},
											{varId=10253002, varNum=1},
											{varId=10273002, varNum=1},
											{varId=10233003, varNum=1},
											{varId=10253003, varNum=1},
											{varId=10273003, varNum=1}
									},
										
									}

--DECLARE_QUEST_INFO_STOP--



function x950002_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local varItemCount = 0;
	
	for varI, items in x950002_var_Items do
		
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




function x950002_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950002_var_FileId,x950002_var_QuestName);
end
