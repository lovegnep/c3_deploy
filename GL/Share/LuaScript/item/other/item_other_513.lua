





x418513_var_FileId 		= 418513 

x418513_var_LevelMin		=	1

x418513_g_ItemID =12030871




function x418513_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418513_g_ItemID then
		return
	end
	
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local nMoney = 100000
		local ranmoney =random(1,1000000)
		local moneygailv = {
		{money =2000   , posibable = 777609 },
		{money =3000   , posibable = 977609 },
		{money =5000   , posibable = 985609 },
		{money =10000  , posibable = 989609 },
		{money =20000  , posibable = 991609 },
		{money =30000  , posibable = 992942 },
		{money =40000  , posibable = 993942 },
		{money =50000  , posibable = 994742 },
		{money =60000  , posibable = 995409 },
		{money =70000  , posibable = 995980 },
		{money =80000  , posibable = 996480 },
		{money =90000  , posibable = 996924 },
		{money =100000 , posibable = 997324 },
		{money =110000 , posibable = 997688 },
		{money =120000 , posibable = 998021 },
		{money =130000 , posibable = 998329 },
		{money =140000 , posibable = 998615 },
		{money =150000 , posibable = 998882 },
		{money =160000 , posibable = 999132 },
		{money =170000, posibable = 999367 },
		{money =180000 , posibable = 999589 },
		{money =190000 , posibable = 999800 },
		{money =200000 , posibable = 1000000},
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
		
		GamePlayScriptLog( varMap, varPlayer, 3070+tempmark)
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)			
			local varMsg = format( "恭喜%s的%s打开福缘藏金袋获得了#{_MONEY%d}金卡", CountryName, Name,nMoney )
		if nMoney >= 10000 then
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






function x418513_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418513_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418513_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418513_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418513_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418513_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
