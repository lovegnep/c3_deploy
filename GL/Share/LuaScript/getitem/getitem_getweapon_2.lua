x950007_var_FileId = 950007




x950007_var_QuestName="¸±ÊÖÎäÆ÷"


x950007_var_Items	=	{
										{
											{
												{varId=10070000, varNum=1},
												{varId=10070201, varNum=1},
												{varId=10070204, varNum=1},
												{varId=10070207, varNum=1},
												{varId=10070209, varNum=1}
											}
										},
										{
											{
												{varId=10080000, varNum=1},
												{varId=10080201, varNum=1},
												{varId=10080204, varNum=1},
												{varId=10080207, varNum=1},
												{varId=10080209, varNum=1}
											}
										},
										{
											{
												{varId=10092201, varNum=1}
										
												
											}
										},
										{
											{
												{varId=10102201, varNum=1}
											}
										},
										{
											{
												{varId=10110000, varNum=1},
												{varId=10110201, varNum=1},
												{varId=10110204, varNum=1},
												{varId=10110207, varNum=1},
												{varId=10110209, varNum=1}
											}
										},
										{
											{
												{varId=10120000, varNum=1},
												{varId=10120201, varNum=1},
												{varId=10120204, varNum=1},
												{varId=10120207, varNum=1},
												{varId=10120209, varNum=1}
												
											}
										}
									}

--DECLARE_QUEST_INFO_STOP--



function x950007_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local varRet;
	local zhiye = GetZhiye(varMap, varPlayer);
	local varItemCount = 0;
		
	StartItemTask(varMap);
	for varI, items in x950007_var_Items[zhiye+1] do
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




function x950007_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x950007_var_FileId,x950007_var_QuestName);
end
