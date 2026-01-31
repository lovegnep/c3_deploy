
x310276_var_FileId = 310276



x310276_var_QuestName="【皇帝】领取皇帝时装"

--连任次数和时装配置表
x310276_var_EDressTable = {
                             [0] = { dressId = 10300157, desc = "一级皇帝时装" },
                             [1] = { dressId = 10300165, desc = "二级皇帝时装" },
                             [2] = { dressId = 10300166, desc = "三级皇帝时装" },
                             [3] = { dressId = 10300167, desc = "四级皇帝时装" },
                             [4] = { dressId = 10300168, desc = "五级皇帝时装" },                               
                          }
 x310276_var_EDressTableMaxCount = 5                         




function x310276_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	local curEmpirePos = GetEmpirePosition( varMap, varPlayer)
	
	TalkAppendButton( varMap, x310276_var_FileId, x310276_var_QuestName, 3)
	
end

function x310276_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	
	local Readme_1 = "#Y【国家】领取皇帝时装#r#W"	
	--local Readme_2 = "#W尊敬的#R"..GetName(varMap, varPlayer).."#W您好：#r"	
	local Readme_3 = "\t尊敬的皇帝（皇后）陛下，举世无双的皇帝时装，正在等待您的领取。#r"	
	local Readme_4 = "\t您确定要领取皇帝时装么？#r"
	local Readme_5 = "\t皇帝时装，会根据当前国家的皇帝连任次数，自动领取对应的时装。连任次数越多，领取的时装能力越强。\n\t当然，一旦连任皇帝失败，下一次连任次数将从头计数。#r"
	local Readme_6 = ""
	local curEmpirePos = GetEmpirePosition( varMap, varPlayer )
	if curEmpirePos == EMPIRE_POSITION_EMPEROR or curEmpirePos == EMPIRE_POSITION_EMPRESS then
	   local nLianRenNum, nTableIndex = x310276_GetLianRenInfo( varMap, varPlayer )
	   Readme_6 = format("\t您当前的连任次数为#G%d#W次，可以领取#G%s#W。#r", nLianRenNum, x310276_var_EDressTable[nTableIndex].desc )
	end	 
	local varReadme = Readme_1..Readme_3..Readme_5..Readme_6..Readme_4	
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310276_var_FileId, -1 )
	
end










function x310276_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x310276_ProcAccept( varMap, varPlayer )

	local curEmpirePos = GetEmpirePosition( varMap, varPlayer)
	if curEmpirePos ~= EMPIRE_POSITION_EMPEROR and curEmpirePos ~= EMPIRE_POSITION_EMPRESS  then
		Msg2Player( varMap,varPlayer, "很抱歉，您还不是皇帝/皇后，无法领取皇帝时装。", 8, 2 )
		Msg2Player( varMap,varPlayer, "很抱歉，您还不是皇帝/皇后，无法领取皇帝时装。", 0, 3 )
		return
	end
	
	local nLianRenNum, nTableIndex = x310276_GetLianRenInfo( varMap, varPlayer )
	local curDressInfo = x310276_var_EDressTable[nTableIndex]
	
	if HaveItem( varMap, varPlayer, curDressInfo.dressId ) >0 then
		Msg2Player( varMap,varPlayer, "很抱歉，您已经领取过皇帝时装。", 8, 2 )
		Msg2Player( varMap,varPlayer, "很抱歉，您已经领取过皇帝时装。", 0, 3 )
		return
	end
	
	--先删除所有皇帝时装
	for i, item in x310276_var_EDressTable do
	    if HaveItem( varMap, varPlayer, item.dressId ) > 0 then
	        if DelItem( varMap, varPlayer,item.dressId, 1 )==0 then
				if DelItemInBody(varMap, varPlayer, item.dressId ) ~= 1 then return 0 end
			end
		end
	end
	
	
	
	StartItemTask(varMap)
	ItemAppend(varMap,curDressInfo.dressId,1)
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet==1 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		Msg2Player( varMap,varPlayer, "恭喜您，您已经顺利获得了皇帝时装。", 8, 2 )
	else
		Msg2Player( varMap,varPlayer, "很抱歉，您的包裹已满，无法领取皇帝时装。", 8, 2 )
	end
	
end

function x310276_GetLianRenInfo( varMap, varPlayer )
    local country = GetCurCountry( varMap, varPlayer )
    local nLianRenNum = GetCountryParamByBit( country,  CD_KAISER_BATTLE_INFO, 10, 7 )
    local nTableIndex = x310276_var_EDressTableMaxCount - 1
    if nTableIndex > nLianRenNum then
        nTableIndex = nLianRenNum
    end

    return nLianRenNum,nTableIndex
    
end




function x310276_ProcQuestAbandon( varMap, varPlayer, varQuest )	
end




function x310276_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310276_CheckSubmit( varMap, varPlayer )

end




function x310276_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310276_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310276_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310276_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
