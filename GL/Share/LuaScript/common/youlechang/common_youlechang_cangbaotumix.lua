x310333_var_FileId = 310333
x310333_var_ScriptName = "【麒麟寻宝图合成】"
x310333_var_UICommandID = 100
x310333_var_Mixture_RESULT_LESS = -2  
x310333_var_Mixture_RESULT_FAILD = -1	
x310333_var_Mixture_RESULT_OK = 1	



x310333_FragmentTable       = 
                             {
                                12035010, 12035011, 12035012, 12035013 
                             }


x310333_TargetTreasure      = 12035015

function x310333_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x310333_var_FileId, x310333_var_ScriptName,3)
end

function x310333_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
    StartGCDTask(varMap);
    GCDAppendInt(varMap, x310333_var_FileId);
    GCDAppendInt(varMap, varTalknpc);
    DeliverGCDInfo(varMap,varPlayer, x310333_var_UICommandID);
    StopGCDTask(varMap);
end

function x310333_ProcMixture( varMap, varPlayer, item1, item2, item3, item4 )
    
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
    	if item == -1 then
    		return x310333_var_Mixture_RESULT_LESS;
    	end
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
		return x310333_var_Mixture_RESULT_LESS;
	end

	local varTableIndex = x310333_CheckItemFull( varItem[1], varItem[2], varItem[3], varItem[4] );
	if(varTableIndex <= 0) then
		StartTalkTask(varMap);
		TalkAppendString(varMap,"放入的道具不正确，无法合成")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return x310333_var_Mixture_RESULT_LESS
	end

    
	StartItemTask( varMap);
    if isBind == 0 then
        ItemAppend( varMap, x310333_TargetTreasure, 1)
    else
        ItemAppendBind( varMap, x310333_TargetTreasure, 1)
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
		QuestMixtureResult( varMap, varPlayer, x310333_var_Mixture_RESULT_OK, itemPos[1], itemPos[2], itemPos[3], itemPos[4] )
		return x310333_var_Mixture_RESULT_OK
	else
		StartTalkTask( varMap)
		TalkAppendString( varMap, "物品栏已满，无法合成物品！" )
		StopTalkTask( varMap)
		DeliverTalkTips( varMap,varPlayer)
		return x310333_var_Mixture_RESULT_LESS
	end

end


function x310333_CheckItemCanMixture( item1, item2, item3, item4, varIndex )
	local varCount = 1;
	
	
	
	
		
	
	
	
		
			
		
			
			
		
	
	
	return varCount;
end


function x310333_CheckItemFull( itemid1, itemid2, itemid3, itemid4)
    
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
    for varI, item in x310333_FragmentTable do
        if itemid1 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    bFind = 0
    for varI, item in x310333_FragmentTable do
        if itemid2 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    bFind = 0
    for varI, item in x310333_FragmentTable do
        if itemid3 == item then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return -1
    end

    bFind = 0
    for varI, item in x310333_FragmentTable do
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

