x950006_var_FileId = 950006




x950006_var_QuestName="Ö÷ÊÖÎäÆ÷"


x950006_var_Items	=	{
										{
											{
												{varId=10010000, varNum=1},
												{varId=10010201, varNum=1},
												{varId=10010204, varNum=1},
												{varId=10010207, varNum=1},
												{varId=10010209, varNum=1}
											
											}
										},
										{
											{
												{varId=10020000, varNum=1},
												{varId=10020201, varNum=1},
												{varId=10020204, varNum=1},
												{varId=10020207, varNum=1},
												{varId=10020209, varNum=1}
											}
										},
										{
											{
												{varId=10030000, varNum=1},
												{varId=10030201, varNum=1},
												{varId=10030204, varNum=1},
												{varId=10030207, varNum=1},
												{varId=10031106, varNum=1}
											}
										},
										{
											{
												{varId=10040000, varNum=1},
												{varId=10040201, varNum=1},
												{varId=10040204, varNum=1},
												{varId=10040207, varNum=1},
												{varId=10040209, varNum=1}
											}
										},
										{
											{
												{varId=10050000, varNum=1},
												{varId=10050201, varNum=1},
												{varId=10050204, varNum=1},
												{varId=10050207, varNum=1},
												{varId=10050209, varNum=1}
												
											}
										},
										{
											{
												{varId=10060000, varNum=1},
												{varId=10060201, varNum=1},
												{varId=10060204, varNum=1},
												{varId=10060207, varNum=1},
												{varId=10060209, varNum=1}
												
											}
										}
									}

--DECLARE_QUEST_INFO_STOP--



function x950006_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local zhiye = GetZhiye(varMap, varPlayer);
	local varItemCount = 0;
		
	StartItemTask(varMap);
	for varI, items in x950006_var_Items[zhiye+1] do
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




function x950006_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950006_var_FileId,x950006_var_QuestName);
end
