x418220_var_FileId 					= 418220
---------------道具与奖励相关
x418220_var_Item 						=	12030550
x418220_var_Gift						= { --{道具Id, 道具的数量}
																{12030553, 1}, {12030554, 1}, {12030555, 1}, {12030556, 1}, {12030557, 1}
															}			
---------------提示相关
x418220_hint_DeleteItemFail = "礼包扣除失败，请稍后再试!" --删除失败的提示
x418220_hint_GiveItemFail		=	"背包空间不足，请整理后再使用"  --奖励道具失败
x418220_hint_GetGift				= "打开@item_%d#cffcf00,获得了5个如意金袋" --获取奖励的提示

-- 空接口
function x418220_ProcIsSpellLikeScript(varMap, varPlayer)
	return 1
end

-- 空接口
function x418220_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end

-- 空接口
function x418220_ProcConditionCheck( varMap, varPlayer)
	return 1; 
end

function x418220_ProcDeplete( varMap, varPlayer)
    return 1
end

function x418220_ProcActivateOnce( varMap, varPlayer)
	WriteLog(1, format("x418220_ProcActivateOnce --- varMap=%d, varPlayer=%d", varMap, varPlayer))
	
	if GetBagSpace(varMap, varPlayer) < (getn(x418220_var_Gift) - 1) then
		Msg2Player(varMap, varPlayer, "背包空间不足，请整理后再试", 0, 2)
		Msg2Player(varMap, varPlayer, "背包空间不足，请整理后再试", 0, 3)
		return
	end	
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then --扣除成功
		x418220_GetGift(varMap, varPlayer)
	else
		Msg2Player(varMap, varPlayer, x418220_hint_DeleteItemFail, 8, 2)
		Msg2Player(varMap, varPlayer, x418220_hint_DeleteItemFail, 8, 3)
	end
end

function x418220_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

-- 不需要这个接口，但要保留空函数
function x418220_ProcEventEntry(varMap, varPlayer, bagIndex)
end

--给奖励
function x418220_GetGift(varMap, varPlayer)
	
	local itemNum = getn(x418220_var_Gift)
	
	WriteLog(1, format("x418220_GetGift ----- varMap=%d, varPlayer=%d, itemNum=%d", varMap, varPlayer, itemNum))

	for i=1,itemNum do
		StartItemTask(varMap)
		ItemAppend(varMap, x418220_var_Gift[i][1], x418220_var_Gift[i][2])
		if StopItemTask(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, x418220_hint_GiveItemFail, 8, 2)
			Msg2Player(varMap, varPlayer, x418220_hint_GiveItemFail, 8, 3)
		else
			DeliverItemListSendToPlayer(varMap, varPlayer)
		end
	end

	Msg2Player(varMap, varPlayer, format(x418220_hint_GetGift, x418220_var_Item), 8, 2)
	Msg2Player(varMap, varPlayer, format(x418220_hint_GetGift, x418220_var_Item), 8, 3)
end
