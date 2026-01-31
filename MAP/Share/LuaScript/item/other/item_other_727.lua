





x418727_var_FileId = 418727
x418727_var_QuestId = 10286
x418727_var_ItemId = 12031049
x418727_var_NoTimes = "您的剩余次数不足！"
x418727_var_total = 10000
x418727_var_log = 3760

x418727_var_MainMenuTab	=	{
	[1]={	
		itemname = 	"永久护身符"	,	
		describe = "\t有几率获得#R永久护身符#W，精致的四彩护身符，可以使用4种不同的符文为其上色，若无取得则可获得5两金卡。",																								
		varItem = {10340012, 10340013, 10340014},	
		varNum = {1,1,1}, 
		probability ={10,20,30},
		bind = 1,
		worldcall = 1,
	},  
	[2]={	
		itemname = 	"明亮的彩钻"	,	
		describe = "\t#R明亮的彩钻#W，可以为10星装备镶边的材料。", 	
		varItem = {11990122},	
		varNum = {1,2,5}, 
		probability ={3000,8000,10000},
		bind = 1, 	
	},
	[3]={	
		itemname = 	"黄金乱士符",	
		describe = "\t#R黄金乱士符#W，可以在装备铭刻大师处升级装备麻将铭刻的属性。",
		varItem = {11970023},	
		varNum = {10,5,1},
		probability ={400,1600,8000},
		bind = 1,
	},  
	[4]={	
		itemname = 	"永久时装",	
		describe = "\t有几率获得#R有效期永久#W的云霞时装，若无取得则可获得5两金卡。", 																					
		varItem = {10306086},	
		varNum = {1}, 
		probability ={25	},
		bind = 1,
		worldcall = 1,
	},  
	[5]={	
		itemname = 	"永久大三元",	
		describe = "\t有几率获得#R永久大三元#W，永不磨损的大三元，若无取得则可获得5两金卡。", 																					
		varItem = {10310003},	
		varNum = {1}, 
		probability ={20},	
		bind = 1,
		worldcall = 1,
	},
	[101]={
		itemname = 	"战车荣誉",	
		describe = "\t#R战车荣誉#W，能兑换给力属性的玉佩，可获得#R200点到600点#W的战车荣誉。", 																					
		varItem = 	18,
		varNum = {600,300,200},
		probability ={100,1000,10000},
		bind = 1,
	}  
}                                     


function x418727_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )

end
function x418727_GetLeaveTimes( varMap, varPlayer, MdIndex )
	return 1
end
function x418727_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418727_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418727_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418727_ProcDeplete( varMap, varPlayer)
    return 1
end


function x418727_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418727, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end


function x418727_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x418727_CheckDate( varMap, varPlayer)
--	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
--			local nFrom = MD_CHONGCU_BEGIN[1]
--			local nTo   = MD_CHONGCU_END[1]
--			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
--			nFrom = nFrom + 1
--			for varI = nFrom,nTo do
--				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
--			end
--	end	
--	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418727_var_StartWeek)
end



function x418727_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

		StartTalkTask( varMap)
		TalkAppendString(varMap,"#Y我要"..x418727_var_MainMenuTab[extid].itemname.."\n")
		TalkAppendString( varMap, x418727_var_MainMenuTab[extid].describe )
		if extid >100 then
			--TalkAppendString( varMap, "" )	
		else
			for k=1,getn(x418727_var_MainMenuTab[extid].varItem) do
				AddQuestRadioItemBonus( varMap,x418727_var_MainMenuTab[extid].varItem[k] , 1)
			end
		end
		
		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418727_var_FileId,x418727_var_QuestId)

end

function x418727_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

	
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3》中的极品稀有道具应有尽有！开启可获得5两金卡，更有几率额外获得#R残破的神兵之魂#W！" )
	for k,v in x418727_var_MainMenuTab do		
		TalkAppendButton(varMap, x418727_var_QuestId, "我要"..v.itemname.."！",3,k)	
	end
	StopTalkTask( varMap)
  	DeliverTalkMenu( varMap, varPlayer, varPlayer)
  	
end




function x418727_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

  	--选中物品序号
 	local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)

	local varMsg =""
	local isaward = 0
	
	if varIndex > 100 then
	   	 if GetBagSpace(varMap, varPlayer) < 1 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		end
		local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
		if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418727_var_ItemId then
			return
		end
	
	
		if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
			return
		end
		local ran = random(x418727_var_total)
		--print(ran)
		local zhancherongyu = -1	
		for k,v in x418727_var_MainMenuTab[varIndex].probability do
			if ran < v then
			zhancherongyu = x418727_var_MainMenuTab[varIndex].varNum[k]
			isaward = 1
			break
			end
		end
		AddPlayerChariotHonour(varMap, varPlayer, zhancherongyu) 		
		Msg2Player( varMap,varPlayer,format("打开礼包，获得%d点战车荣誉", zhancherongyu),8,3) ;
		GamePlayScriptLog( varMap, varPlayer, x418727_var_log+varIndex)
	else

		
		if GetBagSpace(varMap, varPlayer) < 2 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
			return
		else
		
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418727_var_ItemId then
				return
			end
		
		
			if DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1) ~= 1 then
				return
			end

			local ran = random(x418727_var_total)
			
			local itemcount = -1
			local itemid = -1
			
			for k,v in x418727_var_MainMenuTab[varIndex].probability do
				if ran <= v then
					itemcount = x418727_var_MainMenuTab[varIndex].varNum[k]
					if getn(x418727_var_MainMenuTab[varIndex].varItem)==1 then
						itemid = x418727_var_MainMenuTab[varIndex].varItem[1]
					else
						itemid = x418727_var_MainMenuTab[varIndex].varItem[k]
					end
					isaward = 1
					break
				end
				
			end
			GamePlayScriptLog( varMap, varPlayer, x418727_var_log+varIndex)
			--print("11111111111========"..itemid)
			--print("22222222222========"..itemcount)
			--print("33333333333========"..isaward)
			if isaward == 1 then
				StartItemTask( varMap)
			
				if x418727_var_MainMenuTab[varIndex].bind == 1 then
					ItemAppendBind( varMap, itemid, itemcount)
				else	
					ItemAppend( varMap, itemid, itemcount)
				end
				if StopItemTask( varMap, varPlayer) <= 0 then
					return
				end
				DeliverItemListSendToPlayer( varMap, varPlayer)
	
				

				if itemcount ~= 0 then
					varMsg = format( "恭喜你使用黄金联盟百宝囊获得了%d个#{_ITEM%d}!", itemcount, itemid)
					local CounID = GetCurCountry(varMap, varPlayer)
					local CountryName = GetCountryName(CounID)
					local Name =  GetName(varMap, varPlayer)
					if x418727_var_MainMenuTab[varIndex].worldcall == 1 then
					varMsg = format( "恭喜%s的%s打开黄金联盟百宝囊获得了%d个#{_ITEM%d}!", CountryName, Name, itemcount, itemid )
					LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
					end
				end
				Msg2Player( varMap, varPlayer, varMsg, 8, 2)
				Msg2Player( varMap, varPlayer, varMsg, 8, 3)
				
			end
		end	
    	
    end
    
    if isaward == 0 then
		local nMoney = 5000
		AddMoney(varMap, varPlayer, 3, nMoney)
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
    end
    
    --获得神兵
    local shenbingran = random(10)
    --print(shenbingran)
    if shenbingran == 1 then

    	StartItemTask( varMap)
    	ItemAppend( varMap, 11000304, 1)
  		if StopItemTask( varMap, varPlayer) > 0 then
			Msg2Player( varMap, varPlayer, format( "恭喜你使用黄金联盟百宝囊额外获得了%d个#{_ITEM%d}!", 1, 11000304), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你使用黄金联盟百宝囊额外获得了%d个#{_ITEM%d}!", 1, 11000304), 8, 3)
			GamePlayScriptLog( varMap, varPlayer, x418727_var_log)
		end
		DeliverItemListSendToPlayer( varMap, varPlayer)

		
    end
    
end


