





x418514_var_FileId 		= 418514 

x418514_var_LevelMin		=	1

x418514_g_ItemID = 12030872




function x418514_ProcEventEntry( varMap, varPlayer, varBagIdx )

		if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418514_g_ItemID then
			return
		end
		
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local nMoney = 100000
		local ranmoney =random(1,1000000)
		local moneygailv = {
		{money =10000  , posibable = 744631 },
		{money =15000  , posibable = 944631 },
		{money =20000  , posibable = 957131 },
		{money =30000  , posibable = 965464 },
		{money =40000  , posibable = 971714 },
		{money =50000  , posibable = 976714 },
		{money =60000  , posibable = 980881 },
		{money =70000  , posibable = 984452 },
		{money =80000  , posibable = 987577 },
		{money =90000  , posibable = 990355 },
		{money =100000 , posibable = 992855 },
		{money =150000 , posibable = 994522 },
		{money =200000 , posibable = 995772 },
		{money =250000 , posibable = 996772 },
		{money =300000 , posibable = 997605 },
		{money =350000 , posibable = 998319 },
		{money =400000 , posibable = 998944 },
		{money =450000 , posibable = 999500 },
		{money =500000 , posibable =1000000 },
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
		
		GamePlayScriptLog( varMap, varPlayer, 3100+tempmark)
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)			
			local varMsg =format( "恭喜%s的%s打开福缘百宝囊获得了#{_MONEY%d}金卡", CountryName, Name,nMoney )
		if nMoney >= 50000 then
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






function x418514_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418514_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418514_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418514_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418514_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	




end







function x418514_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
