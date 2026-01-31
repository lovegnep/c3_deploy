x950001_var_FileId = 950001




x950001_var_QuestName="ÁìÈ¡ÂÌ×°"


x950001_var_Items	=	{
										{
											{varId=10234001, varNum=1},
											{varId=10254001, varNum=1},
											{varId=10274001, varNum=1}
										},
										
										{
										 {varId=10234002, varNum=1},
										 {varId=10254002, varNum=1},
										 {varId=10274002, varNum=1}
										
										},
										{
											{varId=10234003, varNum=1},
											{varId=10254003, varNum=1},
											{varId=10274003, varNum=1}
										},
										
										{
											{varId=10230000, varNum=1},
											{varId=10250000, varNum=1},
											{varId=10270000, varNum=1}
										},
										
										{
											{varId=10234101, varNum=1},
											{varId=10254101, varNum=1},
											{varId=10274101, varNum=1}
										
										},
										{
											{varId=10234102, varNum=1},
											{varId=10254102, varNum=1},
											{varId=10274102, varNum=1}
										},
										
										{
											{varId=10234103, varNum=1},
											{varId=10254103, varNum=1},
											{varId=10274103, varNum=1}
									 },
									 
										{
											{varId=10230001, varNum=1},
											{varId=10250001, varNum=1},
											{varId=10270001, varNum=1}
										},
										
								                {
									                 {varId=10234201, varNum=1},
									                 {varId=10254201, varNum=1},
									                 {varId=10274201, varNum=1}
										},
										
										{
											{varId=10234002, varNum=1},
											{varId=10254002, varNum=1},
											{varId=10274002, varNum=1}
										},
									
									{
											{varId=10234203, varNum=1},
											{varId=10254203, varNum=1},
											{varId=10274203, varNum=1},
											{varId=10230002, varNum=1},
											{varId=10250002, varNum=1},
											{varId=10270002, varNum=1}
											
									},
									
							
										
									}

--DECLARE_QUEST_INFO_STOP--



function x950001_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local varItemCount = 0;
	
	for varI, items in x950001_var_Items do
		
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




function x950001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950001_var_FileId,x950001_var_QuestName);
end
