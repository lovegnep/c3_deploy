x305103_var_FileId = 305103
x305103_var_ScriptName = "棉布包（20格）合成"
x305103_var_UICommandID = 100
x305103_var_Mixture_RESULT_LESS = -2  
x305103_var_Mixture_RESULT_FAILD = -1	
x305103_var_Mixture_RESULT_OK = 1	
x305103_var_Mixture_AddItem_UseType = 0	


x305103_MixConfTable       = 	{itemid1 = 19010021, itemid1count = 2, itemid2 = 11000812, itemid2count = 1, itemid3 = -1, itemid3count = 0, itemid4 = -1, itemid4count = 0, isNeedAdded = 0, mixitem = 19010022 , mixitemcount = 1, SuccRate = 100,  type = 305103 }


x305103_MixConfTable_Ext      = {
									{varItem = 19010021, alwaysKeep = 0,isCanLay = 0},
									{varItem = 11000812, alwaysKeep = 0,isCanLay = 1},
								}

function x305103_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x305103_var_FileId, x305103_var_ScriptName,3)
end

function x305103_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
    StartGCDTask(varMap);
    GCDAppendInt(varMap, x305103_var_FileId);
    GCDAppendInt(varMap, varTalknpc);
    DeliverGCDInfo(varMap,varPlayer, x305103_var_UICommandID);
    StopGCDTask(varMap);
end

function x305103_ProcMixture( varMap, varPlayer, item1, item2, item3, item4 ,AddedItemPos)

	local varItemCount = 0;
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

	
	if x305103_CheckItemCanMixture(varItem[1], varItem[2], varItem[3], varItem[4]) <=0 then
		StartTalkTask(varMap);
		TalkAppendString( varMap,"放入的道具不正确，无法合成");
		StopTalkTask( varMap);
		DeliverTalkTips( varMap, varPlayer);
		return x305103_var_Mixture_RESULT_LESS;		
	end

	
	if x305103_CheckItemCount(varMap, varPlayer,varItem[1], varItem[2], varItem[3], varItem[4]) <=0 then
		StartTalkTask(varMap);
		TalkAppendString( varMap,"放入的道具不足，无法合成");
		StopTalkTask( varMap);
		DeliverTalkTips( varMap, varPlayer);
		return x305103_var_Mixture_RESULT_LESS;				
	end

    
    local isBind = 0
    for varI, item in itemPos do
    	if item ~= -1 then
			if IsItemBind( varMap, varPlayer, item) == 1 then
				isBind = 1
				break
			end
		end
    end

	local nAddItemId = 	-1
	if x305103_isNeedAddedItem() > 0 then
		nAddItemId = x305103_GetAndCheckAddedItemId(varMap, varPlayer,AddedItemPos)
		if nAddItemId == -2 then
			StartTalkTask(varMap);
			TalkAppendString( varMap,"放入的消耗材料不正确，无法合成");
			StopTalkTask( varMap);
			DeliverTalkTips( varMap, varPlayer);
			return x305103_var_Mixture_RESULT_LESS;				
		end
	end

    
	if x305103_IsMixtureRandOK() == 1 then

		StartItemTask( varMap);
		if isBind == 0 then
			ItemAppend( varMap, x305103_MixConfTable.mixitem, x305103_MixConfTable.mixitemcount)
		else
			ItemAppendBind( varMap, x305103_MixConfTable.mixitem, x305103_MixConfTable.mixitemcount)
		end

		local varRet = StopItemTask( varMap, varPlayer)
		if ( varRet > 0 ) then

			
			if x305103_isNeedAddedItem() > 0 and nAddItemId > 0 then
				if EraseItem( varMap, varPlayer, AddedItemPos, 1)			 ~= 1 then return 0 end
			end

			for varI = 1, 4 do
				if( itemPos[ varI] ~= -1) then
					local varDelCount = x305103_GetItemNeedCountByItemPos(varMap, varPlayer, itemPos[ varI])
					local nCurPosCount = GetItemCountInBagPos(varMap, varPlayer,itemPos[ varI])

					local nCurPosDelCount = varDelCount
					local nOtherPosDelCount = varDelCount - nCurPosCount;									 


					if varDelCount > nCurPosCount then
						nCurPosDelCount = nCurPosCount
					end


					if nCurPosDelCount > 0 then
						if  x305103_isCanLay(varItem[varI])  == 1 then
							if EraseItem( varMap, varPlayer, itemPos[varI],nCurPosDelCount) ~= 1 then return 0 end
						else
							if EraseItem( varMap, varPlayer, itemPos[varI]) ~= 1 then return 0 end
						end
					end

					if nOtherPosDelCount > 0 then
						 if DelItemByIDInBag(varMap,varPlayer,varItem[varI],nOtherPosDelCount) ~= 1 then return 0 end
					end
				end
			end

			DeliverItemListSendToPlayer(varMap,varPlayer);
			StartTalkTask(varMap);
			TalkAppendString(varMap, "合成完成！" );
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer)
			QuestMixtureResult( varMap, varPlayer, x305103_var_Mixture_RESULT_OK, itemPos[1], itemPos[2], itemPos[3], itemPos[4] )
			return x305103_var_Mixture_RESULT_OK
		else
			StartTalkTask( varMap)
			TalkAppendString( varMap, "物品栏已满，无法合成物品！" )
			StopTalkTask( varMap)
			DeliverTalkTips( varMap,varPlayer)
			return x305103_var_Mixture_RESULT_LESS
		end
	else

		
		if x305103_isNeedAddedItem() > 0 and nAddItemId > 0 then
			if EraseItem( varMap, varPlayer, AddedItemPos, 1)			 ~= 1 then return 0 end
		end

		
			for varI = 1, 4 do
				if( itemPos[ varI] ~= -1) then
				
				if x305103_isNeedAddedItem() <= 0  or  nAddItemId <= 0 or x305103_isAlwaysKeep(varItem[varI]) <= 0 then
					local varDelCount = x305103_GetItemNeedCountByItemPos(varMap, varPlayer, itemPos[ varI])
						local nCurPosCount = GetItemCountInBagPos(varMap, varPlayer,itemPos[ varI])
	

						local nCurPosDelCount = varDelCount
						local nOtherPosDelCount = varDelCount - nCurPosCount;									 

						if varDelCount > nCurPosCount then
							nCurPosDelCount = nCurPosCount
						end
		
						if nCurPosDelCount > 0 then
							if  x305103_isCanLay(varItem[varI])  == 1 then
								if EraseItem( varMap, varPlayer, itemPos[varI],nCurPosDelCount) ~= 1 then return 0 end
							else
								if EraseItem( varMap, varPlayer, itemPos[varI]) ~= 1 then return 0 end
							end
						end
	
						if nOtherPosDelCount > 0 then
							 if DelItemByIDInBag(varMap,varPlayer,varItem[varI],nOtherPosDelCount) ~= 1 then return 0 end
						end
				end
			end
		end

		StartTalkTask(varMap);
		TalkAppendString(varMap, "合成失败！" );
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer)
		QuestMixtureResult( varMap, varPlayer, x305103_var_Mixture_RESULT_OK, itemPos[1], itemPos[2], itemPos[3], itemPos[4] )
		return x305103_var_Mixture_RESULT_OK
	end
end




function x305103_CheckItemCanMixture( itemid1, itemid2, itemid3, itemid4 )
	
	
	if x305103_GetMixItemIdInputCount(itemid1, itemid2, itemid3, itemid4) < x305103_GetMixItemIdNeedCount() then
		return -1
	end

	
	if x305103_CheckItemFull(itemid1, itemid2, itemid3, itemid4) <=0 then
		return -1
	end

	return 1
end




function x305103_CheckItemFull( itemid1, itemid2, itemid3, itemid4)


    
    if itemid1 ~= -1 and (itemid1 == itemid2 or itemid1 == itemid3 or itemid1 == itemid4) then
        return -1
    end

    if itemid2 ~= -1 and (itemid2 == itemid3 or itemid2 == itemid4) then
        return -1
    end

    if itemid3 ~= -1 and (itemid3 == itemid4) then
        return -1
    end

	
    if x305103_IsNeedItem(itemid1) ~= 1 then
		return -1
	end

    if x305103_IsNeedItem(itemid2) ~= 1 then
		return -1
	end

    if x305103_IsNeedItem(itemid3) ~= 1 then
		return -1
	end

    if x305103_IsNeedItem(itemid4) ~= 1 then
		return -1
	end

	return 1
end




function x305103_CheckItemCount(varMap, varPlayer,itemId1, itemId2, itemId3, itemId4)

	local nNeedCount =0

    nNeedCount = x305103_GetItemNeedCountByItemId(varMap, varPlayer, itemId1)
	if  nNeedCount > 0 then
		if GetItemCountInBag(varMap, varPlayer,itemId1)  <  nNeedCount then
			return -1
		end
	end

    nNeedCount = x305103_GetItemNeedCountByItemId(varMap, varPlayer, itemId2)
	if  nNeedCount > 0 then
		if GetItemCountInBag(varMap, varPlayer,itemId2)  <  nNeedCount then
			return -1
		end
	end

    nNeedCount = x305103_GetItemNeedCountByItemId(varMap, varPlayer, itemId3)
	if  nNeedCount > 0 then
		if GetItemCountInBag(varMap, varPlayer,itemId3)  <  nNeedCount then
			return -1
		end
	end

    nNeedCount = x305103_GetItemNeedCountByItemId(varMap, varPlayer, itemId4)
	if  nNeedCount > 0 then
		if GetItemCountInBag(varMap, varPlayer,itemId4)  <  nNeedCount then
			return -1
		end
	end

	return 1

end



function x305103_GetItemNeedCountByItemPos(varMap, varPlayer, itemPos)

	if itemPos == -1 then
		return 0
	end

	local varItem = GetItemTableIndexByIndex( varMap, varPlayer, itemPos);

	if varItem < 0 then
		return 0	
	end

	return x305103_GetItemNeedCountByItemId(varMap, varPlayer,varItem);

end



function x305103_GetItemNeedCountByItemId(varMap, varPlayer, varItem)

	if varItem < 0 then
		return 0	
	end

	if x305103_MixConfTable.itemid1 == varItem then
		return x305103_MixConfTable.itemid1count
	end

	if x305103_MixConfTable.itemid2 == varItem then
		return x305103_MixConfTable.itemid2count
	end
	
	if x305103_MixConfTable.itemid3 == varItem then
		return x305103_MixConfTable.itemid3count
	end

	if x305103_MixConfTable.itemid4 == varItem then
		return x305103_MixConfTable.itemid4count
	end

	return 0

end



function x305103_GetMixItemIdInputCount( itemid1, itemid2, itemid3, itemid4)
	local nInPutCount = 0
	
	if itemid1 ~= -1 then
		nInPutCount = nInPutCount + 1 
	end

	if itemid2 ~= -1 then
		nInPutCount = nInPutCount + 1 
	end

	if itemid3 ~= -1 then
		nInPutCount = nInPutCount + 1 
	end

	if itemid4 ~= -1 then
		nInPutCount = nInPutCount + 1 
	end
	
	return nInPutCount
end



function x305103_GetMixItemIdNeedCount()
	local varCount =0;
	if x305103_MixConfTable.itemid1 ~= -1 then
		varCount = varCount + 1;
	end

	if x305103_MixConfTable.itemid2 ~= -1 then
		varCount = varCount + 1;
	end

	if x305103_MixConfTable.itemid3 ~= -1 then
		varCount = varCount + 1;
	end

	if x305103_MixConfTable.itemid4 ~= -1 then
		varCount = varCount + 1;
	end

	return varCount;
end



function x305103_IsNeedItem(varItem)
	if x305103_MixConfTable.itemid1 == varItem then
		return 1;
	end

	if x305103_MixConfTable.itemid2 == varItem then
		return 1;
	end

	if x305103_MixConfTable.itemid3 == varItem then
		return 1;
	end

	if x305103_MixConfTable.itemid4 == varItem then
		return 1;
	end
	
	return 0;
end



function  x305103_IsMixtureRandOK()

	local rate = random(1,100)

	if rate <= x305103_MixConfTable.SuccRate then
		return 	1	
	else
		return 0
	end
end





function  x305103_isNeedAddedItem()

	if x305103_MixConfTable.isNeedAdded > 0 then
		return 1
	else
		return 0
	end
end




function  x305103_GetAndCheckAddedItemId(varMap, varPlayer, nItemPos)

	if nItemPos == nil or nItemPos < 0 then	 
		return -1;
	end

	
	if x305103_MixConfTable.isNeedAdded < 0 then
		return -1;
	end

	local nAddedItemId = GetItemTableIndexByIndex( varMap, varPlayer, nItemPos);

	if nAddedItemId <= 0 then
		return -2;	 
	end

	local bRightItem = CheckSpecialItem(nAddedItemId,x305103_var_Mixture_AddItem_UseType);

	if bRightItem > 0 then
		return nAddedItemId;
	else
		return -2; 
	end

end




function  x305103_isAlwaysKeep(nItemId)

	if nItemId == nil or nItemId <=0 then
		return 0;
	end

	 for varI,item in x305103_MixConfTable_Ext do
		if x305103_MixConfTable_Ext[varI].varItem  == nItemId then
			return x305103_MixConfTable_Ext[varI].alwaysKeep;
		end
	 end

	 return 0;
end




function  x305103_isCanLay(nItemId)

	if nItemId == nil or nItemId <=0 then
		return 0;
	end

	 for varI,item in x305103_MixConfTable_Ext do
		if x305103_MixConfTable_Ext[varI].varItem  == nItemId then
			return x305103_MixConfTable_Ext[varI].isCanLay;
		end
	 end

	 return 0;
end
