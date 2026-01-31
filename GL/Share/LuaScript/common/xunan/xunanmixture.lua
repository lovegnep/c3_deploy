x300751_var_FileId = 300751
x300751_var_ScriptName = "【藏宝图合成】"
x300751_var_UICommandID = 100
x300751_var_Mixture_RESULT_LESS = -2  
x300751_var_Mixture_RESULT_FAILD = -1	
x300751_var_Mixture_RESULT_OK = 1	
							 

x300751_FragmentTable       = 
                             {
                                12030109, 12030110, 12030111, 12030112 
                             }


x300751_TargetTreasure      = 12030107

function x300751_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x300751_var_FileId, x300751_var_ScriptName,3)
end

function x300751_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
    StartGCDTask(varMap);
    GCDAppendInt(varMap, x300751_var_FileId);
    GCDAppendInt(varMap, varTalknpc);
    DeliverGCDInfo(varMap,varPlayer, x300751_var_UICommandID);
    StopGCDTask(varMap);
end

function x300751_ProcMixture( varMap, varPlayer, item1, item2, item3, item4 )
    
	local varItemCount = 0;
	local varIndex = 1;
	local firstitemid = 0;

	local varItem = {-1,-1,-1,-1};
	local itemPos = { item1, item2, item3, item4 };

	for varI=1, 4 do
		if itemPos[varI] ~= -1 then
			varItem[varI] = GetItemTableIndexByIndex( varMap, varPlayer, itemPos[varI] );
			if( varItem[varI] > 0 ) then
				varItemCount = varItemCount + 1;
			end
		end
	end

    
    local isBind = 0
    for varI, item in itemPos do
        if IsItemBind( varMap, varPlayer, item) == 1 then
            isBind = 1
            break
        end
    end

    
	if(varItemCount < 4) then
		StartTalkTask(varMap);
		TalkAppendString( varMap,"放入的道具不正确，无法合成");
		StopTalkTask( varMap);
		DeliverTalkTips( varMap, varPlayer);
		return x300751_var_Mixture_RESULT_LESS;
	end

	local varTableIndex = x300751_CheckItemFull( varItem[1], varItem[2], varItem[3], varItem[4] );
	if(varTableIndex <= 0) then
		StartTalkTask(varMap);
		TalkAppendString(varMap,"放入的道具不正确，无法合成")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return x300751_var_Mixture_RESULT_LESS
	end

    
	StartItemTask( varMap);
    if isBind == 0 then
        ItemAppend( varMap, x300751_TargetTreasure, 1)
    else
        ItemAppendBind( varMap, x300751_TargetTreasure, 1)
    end
	local varRet = StopItemTask( varMap, varPlayer)
	if ( varRet > 0 ) then
		for varI = 1, 4 do
			if( itemPos[ varI] ~= -1) then
                if EraseItem( varMap, varPlayer, itemPos[varI], 1) ~= 1 then return 0 end
			end
		end
		DeliverItemListSendToPlayer(varMap,varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "合成完成！" );
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer)
		QuestMixtureResult( varMap, varPlayer, x300751_var_Mixture_RESULT_OK, itemPos[1], itemPos[2], itemPos[3], itemPos[4] )
		return x300751_var_Mixture_RESULT_OK
	else
		StartTalkTask( varMap)
		TalkAppendString( varMap, "物品栏已满，无法合成物品！" )
		StopTalkTask( varMap)
		DeliverTalkTips( varMap,varPlayer)
		return x300751_var_Mixture_RESULT_LESS
	end

end


function x300751_CheckItemCanMixture( item1, item2, item3, item4, varIndex )
	local varCount = 1;
	
	
	
	
		
	
	
	
		
			
		
			
			
		
	
	
	return varCount;
end


function x300751_CheckItemFull( itemid1, itemid2, itemid3, itemid4)
    
    if itemid1 == itemid2 or itemid1 == itemid3 or itemid1 == itemid4 then
        return -1
    end

    if itemid2 == itemid3 or itemid2 == itemid4 then
        return -1
    end

    if itemid3 == itemid4 then
        return -1
    end

    local bFind = 0
    for varI, item in x300751_FragmentTable do
        if itemid1 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    bFind = 0
    for varI, item in x300751_FragmentTable do
        if itemid2 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    bFind = 0
    for varI, item in x300751_FragmentTable do
        if itemid3 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    bFind = 0
    for varI, item in x300751_FragmentTable do
        if itemid4 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    return 1
end

