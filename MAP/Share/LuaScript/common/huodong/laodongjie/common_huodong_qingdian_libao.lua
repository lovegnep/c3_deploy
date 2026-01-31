






x205005_var_FileId = 205005
x205005_var_lingjiangBUFF = 30577
x205005_var_ItemBonus = {
{varId = 12030258, varName = "全福月饼" , 	        bind = 1 , varNum = 1  ,   probability = 130	},
{varId = 11990050, varName = "回魂丹", 	            bind = 1 , varNum = 1  ,	 probability = 100  },
{varId = 12030044, varName = "金砂" , 	            bind = 1 , varNum = 1  ,	 probability = 100 	},
{varId = 12030045, varName = "金条", 	              bind = 1 , varNum = 1  ,	 probability = 100 	},
{varId = 12030046, varName = "金元宝",		          bind = 1 , varNum = 1  ,   probability = 60 	},
{varId = 12030047, varName = "金砖",               	bind = 1 , varNum = 1  ,   probability = 60	},
{varId = 12041101, varName = "修行草",             	bind = 1 , varNum = 1  ,   probability = 60 	},
{varId = 12030011, varName = "杰克丹尼 ", 	        bind = 1 , varNum = 1  ,   probability = 60 	},
{varId = 12030012, varName = "路易十三", 	          bind = 1 , varNum = 1  ,   probability = 60 	},
{varId = 12041097, varName = "生命琼浆", 	          bind = 1 , varNum = 1  ,   probability = 100 	},
{varId = 12041044, varName = "混沌不灭丸",         	bind = 1 , varNum = 1  ,   probability = 100  	},
{varId = 12050358, varName = "烈焰狮鹫降世符", 	bind = 1 , varNum = 1  ,   probability = 10 	},
{varId = 11000704, varName = "天冥琉璃", 	          bind = 1 , varNum = 1  ,   probability = 30   },
{varId = 11000703, varName = "冥级琉璃", 	          bind = 1 , varNum = 1  ,   probability = 30  	}
}
x205005_var_notifytable = {
12050358,
11000704,
11000703
}

x205005_var_countryexp = 2   	 --国家积分
x205005_var_guidexp    = 1   	 --帮会经验
x205005_var_expmulti   = 30000 --个人经验



function x205005_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x205005_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1;
end






function x205005_ProcCancelImpacts( varMap, varPlayer )
	return 0;
end






function x205005_ProcConditionCheck( varMap, varPlayer )



	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1;
end







function x205005_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x205005_ProcAddItemByRandom(varMap, varPlayer)

 local level = GetLevel(varMap, varPlayer)
 local varmin = 1
 local varmax = 1
 local buff 	=	9011
 local buff1 =	9013
 local buff2 =	9012
 local item = nil
 local varprobability =  random (1, 1000)
	for i, iter in x205005_var_ItemBonus do
		varmax = varmax + iter.probability
		if varprobability >= varmin and varprobability < varmax then
		    item = iter
		    break
		end
	end
	if item ~= nil then
		StartItemTask( varMap)
		if item.bind == 1 then
			ItemAppendBind( varMap, item.varId, item.varNum)
		else
		  ItemAppend( varMap, item.varId, item.varNum)
		end
		local result = StopItemTask( varMap, varPlayer)
		if result == 0 then
			StartTalkTask( varMap)
			TalkAppendString( varMap, "背包已满，无法放入挖到的物品！" )
			StopTalkTask( varMap)
			DeliverTalkTips( varMap, varPlayer)
			return 1
		end
		StartTalkTask( varMap)
		local strTemp = format( "打开活动礼包，您得到了#R%d个#{_ITEM%d}#cffcf00，恭喜恭喜。", item.varNum,item.varId)
		TalkAppendString( varMap, strTemp )
		DeliverItemListSendToPlayer( varMap, varPlayer)
		StopTalkTask( varMap)
		DeliverTalkTips( varMap, varPlayer)
		Msg2Player( varMap, varPlayer, strTemp, 8, 2)
			for i,j in x205005_var_notifytable do
				if item.varId == j then
					local varName = GetName( varMap, varPlayer)
					local msg1 = format("#cffcf00恭喜恭喜！玩家"..varName.."打开活动礼包时获得了#R%d个#{_ITEM%d}#cffcf00#cffcf00！",item.varNum,item.varId)
					LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
					LuaAllScenceM2Wrold(varMap, msg1, 5, 1)
				end
			end
	 elseif varprobability >= 6249 and varprobability <= 7120 then
	 		local money =20*1000
			AddMoney( varMap, varPlayer,1, money )
			local varStr = format( "打开活动礼包，您获得#R银卡#{_MONEY%d}#o，恭喜恭喜", money)
			Msg2Player( varMap, varPlayer, varStr, 8, 3)
	    Msg2Player( varMap, varPlayer, varStr, 8, 2)
	  elseif varprobability >= 7121 and varprobability <= 7600 then
	 		local money =50*1000
			AddMoney( varMap, varPlayer,1, money )
			local varStr = format( "打开活动礼包，您获得#R银卡#{_MONEY%d}#o，恭喜恭喜", money)
			Msg2Player( varMap, varPlayer, varStr, 8, 3)
	    Msg2Player( varMap, varPlayer, varStr, 8, 2)
		elseif varprobability >= 7601 and varprobability <= 7920 then
	 		local money =100*1000
			AddMoney( varMap, varPlayer,1, money )
			local varStr = format( "打开活动礼包，您获得#R银卡#{_MONEY%d}#o，恭喜恭喜", money)
			Msg2Player( varMap, varPlayer, varStr, 8, 3)
	    Msg2Player( varMap, varPlayer, varStr, 8, 2)
	  elseif varprobability >= 7921 and varprobability <= 8000 then
	 		local money =300*1000
			AddMoney( varMap, varPlayer,1, money )
			local varStr = format( "打开活动礼包，您获得#R银卡#{_MONEY%d}#o，恭喜恭喜", money)
			Msg2Player( varMap, varPlayer, varStr, 8, 3)
	    Msg2Player( varMap, varPlayer, varStr, 8, 2)
	  end
end


function x205005_ProcActivateOnce( varMap, varPlayer, varImpact )
	local level = GetLevel(varMap, varPlayer)
	if IsHaveSpecificImpact(varMap, varPlayer, x205005_var_lingjiangBUFF) == 1 then
		Msg2Player(varMap, varPlayer, "不要着急，领奖状态消失后才可以开启礼包！", 8, 3)
		Msg2Player(varMap, varPlayer, "不要着急，领奖状态消失后才可以开启礼包！", 8, 2)
		return 1
	end

	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end
		if DepletingUsedItem(varMap, varPlayer) ~= 1 then return end
		GamePlayScriptLog(varMap, varPlayer, 2552)
		local exp = level * x205005_var_expmulti
		AddExp( varMap, varPlayer, exp)
		Msg2Player(varMap,varPlayer,format( "打开活动礼包,获得#R经验%d点#cffcf00的奖励", exp),8,2)
		Msg2Player(varMap,varPlayer,format( "打开活动礼包,获得#R经验%d点#cffcf00的奖励", exp),8,3)

		AddCountryStrength(varMap, varPlayer, 2)
		Msg2Player(varMap,varPlayer,"您为国家实力榜贡献了#R2个#cffcf00积分。",8,2)
		Msg2Player(varMap,varPlayer,"您为国家实力榜贡献了#R2个#cffcf00积分。",8,3)

		local guildId = GetGuildID(varMap,varPlayer)
			if guildId >= 0 then
				AddGuildExp(varMap, varPlayer,1)
				Msg2Player(varMap,varPlayer,"您为帮会贡献了#R1点#cffcf00经验。",8,2)
				Msg2Player(varMap,varPlayer,"您为帮会贡献了#R1点#cffcf00经验。",8,3)
			end

		x205005_ProcAddItemByRandom(varMap, varPlayer)

end







function x205005_ProcActivateEachTick( varMap, varPlayer)
	return 1;
end
