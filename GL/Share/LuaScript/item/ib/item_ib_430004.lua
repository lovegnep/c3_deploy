





function x430004_ProcChatDeplete( varMap, varPlayer, bChatType, varBagIdx )

	if GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx) ~= 12030200 then
		return 0
	end



	local iMultTimes = IsBagItemMultTimes( varMap, varPlayer, varBagIdx )
	if iMultTimes <= 0 then
		return 0;
	end

	local itimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx );
	itimes = itimes - 1;
	if itimes <= 0 then
		
		if EraseItem( varMap, varPlayer, varBagIdx ) ~= 1 then return 0 end
	else
		
		SetBagItemMultTimes( varMap, varPlayer, varBagIdx, itimes );
	end
	return 1;
end
