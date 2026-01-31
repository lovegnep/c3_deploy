x429999_var_FileId = 429999 

function x429999_ProcEventEntry( varMap, varPlayer, varBagIdx )
	ChatLaBa( varMap, varPlayer, varBagIdx, 1)
	return 0;
end

function x429999_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end

function x429999_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x429999_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x429999_ProcDeplete( varMap, varPlayer )
end

function x429999_ProcActivateOnce( varMap, varPlayer )
end

function x429999_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

-- 谣言小喇叭消耗处理函数
function x429999_ProcChatDeplete( varMap, varPlayer, bChatType, varBagIdx)
	if GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx) ~= 12030199 then
		return 0
	end


	local iMultTimes = IsBagItemMultTimes( varMap, varPlayer, varBagIdx)
	if iMultTimes <= 0 then
		return 0;
	end

	local itimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx);
	itimes = itimes - 1;
	if itimes <= 0 then
		--删除道具
		if EraseItem( varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
	else
		--减次
		SetBagItemMultTimes( varMap, varPlayer, varBagIdx, itimes);
	end
	return 1;
end

