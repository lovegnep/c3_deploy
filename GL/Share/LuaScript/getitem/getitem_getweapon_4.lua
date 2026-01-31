x950009_var_FileId = 950009




x950009_var_QuestName="其他副手武器"


x950009_var_Items	=	{
										{
											{
												{varId=10072203, varNum=1},
												{varId=10072206, varNum=1},
												{varId=10072209, varNum=1},
												{varId=10072302, varNum=1},
												{varId=10072305, varNum=1}
											
											}
										},
										{
											{
												{varId=10082201, varNum=1},
												{varId=10082204, varNum=1},
												{varId=10082207, varNum=1},
												{varId=10082210, varNum=1},
												{varId=10084002, varNum=1}
											}
										},
										{
											{
												{varId=10090202, varNum=1}
										
											}
										},
										{
											{
												{varId=10101110, varNum=1}
											}
										},
										{
											{
												{varId=10112201, varNum=1},
												{varId=10112204, varNum=1},
												{varId=10112207, varNum=1},
												{varId=10113001, varNum=1},
												{varId=10114002, varNum=1}
												
											}
										},
										{
											{
												{varId=10122201, varNum=1},
												{varId=10122204, varNum=1},
												{varId=10122207, varNum=1},
												{varId=10123001, varNum=1},
												{varId=10123003, varNum=1}
												
											}
										}
									}


--DECLARE_QUEST_INFO_STOP--



function x950009_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local zhiye = GetZhiye(varMap, varPlayer);
	local varItemCount = 0;
		
	StartItemTask(varMap);
	for varI, items in x950009_var_Items[zhiye+1] do
		for j, item in items do
			ItemAppend( varMap, item.varId, item.varNum );
			varItemCount = varItemCount + 1;
		end
	end
	varRet = StopItemTask(varMap,varPlayer);
	if varRet > 0 and varItemCount > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer);
	end
	
end




function x950009_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950009_var_FileId,x950009_var_QuestName);
end
