
x414008_var_FileId = 414008 
x414008_var_keyID = 12100008 
x414008_var_keyname = "钥匙（8级）" 







function x414008_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local HaveKey = HaveItemInBag(varMap,varPlayer,x414008_var_keyID)
	
	if HaveKey > 0 then
		OpenRndomBox ( varMap, varPlayer, 1, 2, 5, 3, 5, 4, 5, 5, 3, 6, 2) 
		if DelItem(varMap,varPlayer,x414008_var_keyID,1) ~= 1 then return 0 end
		if EraseItem(varMap,varPlayer,varBagIdx) ~= 1 then return 0 end
		StartTalkTask(varMap)
			local varText = "#Y你使用一把"..x414008_var_keyname.."，开启了一个宝箱"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		StartTalkTask(varMap)
			local varText = "#Y开启宝箱，需要"..x414008_var_keyname.."一把"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x414008_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end
