
x414012_var_FileId = 414012 
x414012_var_keyID = 12101001 
x414012_var_keyname = "符文钥匙" 







function x414012_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local HaveKey = HaveItemInBag(varMap,varPlayer,x414012_var_keyID)
	
	if HaveKey > 0 then
		OpenRndomBox ( varMap, varPlayer, 13, 13, 5, 13, 5, 13, 5, 13, 3, 13, 2) 
		if DelItem(varMap,varPlayer,x414012_var_keyID,1) ~= 1 then return 0 end
		if EraseItem(varMap,varPlayer,varBagIdx) ~= 1 then return 0 end
		StartTalkTask(varMap)
			local varText = "#Y你使用一把"..x414012_var_keyname.."，开启了一个宝箱"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		StartTalkTask(varMap)
			local varText = "#Y开启宝箱，需要"..x414012_var_keyname.."一把"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x414012_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end
