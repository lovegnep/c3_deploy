x950008_var_FileId = 950008




x950008_var_QuestName="其他主手武器"


x950008_var_Items	=	{
										{
											{
												{varId=10012201, varNum=1},
												{varId=10012204, varNum=1},
												{varId=10012208, varNum=1},
												{varId=10013001, varNum=1},
												{varId=10014001, varNum=1}
											
											}
										},
										{
											{
												{varId=10022201, varNum=1},
												{varId=10022204, varNum=1},
												{varId=10022207, varNum=1},
												{varId=10022210, varNum=1},
												{varId=10023003, varNum=1}
											}
										},
										{
											{
												{varId=10032201, varNum=1},
												{varId=10032204, varNum=1},
												{varId=10032207, varNum=1},
												{varId=10032210, varNum=1},
												{varId=10033003, varNum=1}
											}
										},
										{
											{
												{varId=10042201, varNum=1},
												{varId=10042204, varNum=1},
												{varId=10042207, varNum=1},
												{varId=10042210, varNum=1},
												{varId=10043003, varNum=1}
											}
										},
										{
											{
												{varId=10052201, varNum=1},
												{varId=10052204, varNum=1},
												{varId=10052207, varNum=1},
												{varId=10052210, varNum=1},
												{varId=10053003, varNum=1}
												
											}
										},
										{
											{
												{varId=10062201, varNum=1},
												{varId=10062204, varNum=1},
												{varId=10062207, varNum=1},
												{varId=10062210, varNum=1},
												{varId=10063003, varNum=1}
												
											}
										}
									}


--DECLARE_QUEST_INFO_STOP--



function x950008_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local zhiye = GetZhiye(varMap, varPlayer);
	local varItemCount = 0;
		
	StartItemTask(varMap);
	for varI, items in x950008_var_Items[zhiye+1] do
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




function x950008_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950008_var_FileId,x950008_var_QuestName);
end
