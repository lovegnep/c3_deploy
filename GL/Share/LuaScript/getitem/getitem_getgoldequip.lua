x950004_var_FileId = 950004




x950004_var_QuestName="领取金装"


x950004_var_Items	=	{
										{
										 {varId=10231101, varNum=1},
										 {varId=10251101, varNum=1},
										 {varId=10271101, varNum=1}
											
										},
										{
											{varId=10231102, varNum=1},
											{varId=10251102, varNum=1},
											{varId=10271102, varNum=1},
											
											{varId=10231103, varNum=1},
											{varId=10251103, varNum=1},
											{varId=10271103, varNum=1}
										
										},
										 {
											{varId=10231104, varNum=1},
											{varId=10251104, varNum=1},
											{varId=10271104, varNum=1}
										
										},
										{
											{varId=10231106, varNum=1},
										  {varId=10251106, varNum=1},
											{varId=10271106, varNum=1}
										
										},
									
										{
											{varId=10231107, varNum=1},
											{varId=10251107, varNum=1},
											{varId=10271107, varNum=1}
										
										},
										{											
										{varId=10233003, varNum=1},
											{varId=10253003, varNum=1},
											{varId=10273003, varNum=1}
										
										},
									        {
											{varId=10232405, varNum=1},
											{varId=10252405, varNum=1},
											{varId=10272405, varNum=1}
										
										
									        },
									        {
											{varId=10232406, varNum=1},
											{varId=10252406, varNum=1},
											{varId=10272406, varNum=1}
										},
										
										{
											{varId=10232407, varNum=1},
											{varId=10252407, varNum=1},
											{varId=10272407, varNum=1}
										}
										
									}
									
									
									

--DECLARE_QUEST_INFO_STOP--



function x950004_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local varItemCount = 0;
	
	for varI, items in x950004_var_Items do
		
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




function x950004_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950004_var_FileId,x950004_var_QuestName);
end
