
x414013_var_FileId = 414013 
x414013_var_keyID = 12101002 
x414013_var_keyname = "符文钥匙" 







function x414013_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local HaveKey = HaveItemInBag(varMap,varPlayer,x414013_var_keyID)
	
	if HaveKey > 0 then
		OpenRndomBox ( varMap, varPlayer, 12, 12, 5, 12, 5, 12, 5, 12, 3, 12, 2) 
		if DelItem(varMap,varPlayer,x414013_var_keyID,1) ~= 1 then return 0 end
		if EraseItem(varMap,varPlayer,varBagIdx) ~= 1 then return 0 end
		StartTalkTask(varMap)
			local varText = "#Y你使用一把"..x414013_var_keyname.."，开启了一个宝箱"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		StartTalkTask(varMap)
			local varText = "#Y开启宝箱，需要"..x414013_var_keyname.."一把"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x414013_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end
