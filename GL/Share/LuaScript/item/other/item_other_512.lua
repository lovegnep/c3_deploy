





x418512_var_FileId 		= 418512 

x418512_var_LevelMin		=	1

x418512_g_ItemID = 12030873




function x418512_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418512_g_ItemID then
		return
	end
	
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local nMoney = 100000
		local ranmoney =random(1,1000000)
		local moneygailv = {
		{money =20000   , posibable = 722688 },
		{money =30000   , posibable = 922688 },
		{money =40000   , posibable = 937688 },
		{money =50000   , posibable = 949688 },
		{money =60000   , posibable = 959688 },
		{money =70000   , posibable = 968259 },
		{money =80000   , posibable = 975759 },
		{money =90000   , posibable = 982426 },
		{money =100000  , posibable = 988426 },
		{money =200000  , posibable = 991426 },
		{money =300000  , posibable = 993426 },
		{money =400000  , posibable = 994926 },
		{money =500000  , posibable = 996126 },
		{money =600000  , posibable = 997126 },
		{money =700000  , posibable = 997983 },
		{money =800000  , posibable = 998733 },
		{money =900000  , posibable = 999400 },
		{money =1000000 , posibable = 1000000},
		}
		local tempmark = getn(moneygailv)
		for k,v in moneygailv do
			if ranmoney < v.posibable then
				tempmark = k
				break
			end
		end
		nMoney = moneygailv[tempmark].money
		
		AddMoney(varMap, varPlayer, 3, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 3120+tempmark)
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)			
			local varMsg =format( "恭喜%s的%s打开福缘黄金箱获得了#{_MONEY%d}金卡", CountryName, Name,nMoney )
		if nMoney >= 100000 then
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
		end
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end






function x418512_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418512_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418512_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418512_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418512_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418512_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
