





x418132_var_FileId = 418132
x418132_var_QuestId = 10260
x418132_var_ItemId = 12030434
x418132_var_TimeOutMsg = "幸运大礼包只能在虎年正月使用，正月已过，礼包过期，已经销毁！"
x418132_var_NoTimes = "您的剩余次数不足！"

x418132_var_NormalItemNum		=   16	
x418132_var_NormalItemTab		=	{
									{	varItem = 12041101   , itemname = "修行草"		}, 
									{	varItem = 11000501  	, itemname = "紫檀木炭"		}, 
									{	varItem = 12030014  	, itemname = "轩尼诗理查"	}, 
									{	varItem = 12030013   , itemname = "芝华士"		}, 
									{	varItem = 12054300   , itemname = "还童书"		}, 
									{	varItem = 12041103   , itemname = "活力丹"		}, 
									{	varItem = 12030031   , itemname = "神行符"		}, 
									{	varItem = 12030016  	, itemname = "队伍召集令"	}, 	
									{	varItem = 12031019   , itemname = "烟花斩"		}, 
									{	varItem = 12031000  	, itemname = "爱情誓言"		}, 
									{	varItem = 12031001  	, itemname = "单凤求凰"		},
									{	varItem = 12031002  	, itemname = "五彩缤纷"		}, 
									{	varItem = 12031003  	, itemname = "芬芳四溢"		}, 
									{	varItem = 12031004  	, itemname = "火树银花"		}, 
									{	varItem = 12031005  	, itemname = "心心相印"		}, 
									{	varItem = 12031006  	, itemname = "一见钟情"		}
								}

x418132_var_YueBingItemTab	=	{
									{	varItem = 12030257	, varLevel = 90, itemname = "九珍月饼"		},
									{	varItem = 12030256	, varLevel = 80, itemname = "八宝月饼"		},
									{	varItem = 12030255	, varLevel = 70, itemname = "七星月饼"		}, 
									{	varItem = 12030254	, varLevel = 60, itemname = "六味月饼"		}, 
									{	varItem = 12030253	, varLevel = 50, itemname = "五仁月饼"		}, 
									{	varItem = 12030252 	, varLevel = 40, itemname = "四喜月饼"		}, 
									{	varItem = 12030251  	, varLevel = 30, itemname = "三财月饼"		}, 
									{	varItem = 12030250   , varLevel = 20, itemname = "双祥月饼"		}
								}


x418132_var_MainMenuTab	=	{
								{	itemname = 	"钻石原石"		,	varItem = 11990113,						times = 25		},  
								{	itemname = 	"洗石剂"	,	varItem = 11000904,						times = 25		},  
								{	itemname = 	"掌门牌"	,	itemId1 = 10310025,	itemId2 = 10310026,	times = 25		},  
								{	itemname = 	"经验装"	,	varItem = 10300141,						times = 25		},  
								{	itemname = 	"月饼"		,											times = 25		},  
								{	itemname = 	"帮贡"		,											times = 25		},  
								{	itemname = 	"荣誉"		,											times = 25		},  
								{	itemname = 	"声望"		,											times = 25		}, 	
								{	itemname = 	"战场积分"	,											times = 25		},  
								{	itemname = 	"现银"		,											times = 25		}
							}

x418132_var_BangGongTabNum	=	4
x418132_var_BangGongTab		=	{200, 300, 400, 500}
x418132_var_RongYuTabNum		=	6
x418132_var_RongYuTab			=	{700, 800, 900, 1050, 1150, 1250}
x418132_var_ShenWangTabNum	=	9
x418132_var_ShenWangTab		=	{7500, 8500, 9500, 10500, 11500, 12000, 13000, 14000, 15000}
x418132_var_ZhanChanTabNum	=	5
x418132_var_ZhanChanTab		=	{150, 175, 200, 225, 250}
x418132_var_XianYinTabNum		=	5
x418132_var_XianYinTab		=	{150000, 175000, 200000, 225000, 250000}




function x418132_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
	if MdIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_ZUANSHI[1], MD_XINGYUN_ZUANSHI[2],MD_XINGYUN_ZUANSHI[3], MdData ) 
	elseif MdIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_XISHIJI[1], MD_XINGYUN_XISHIJI[2],MD_XINGYUN_XISHIJI[3], MdData ) 
	elseif MdIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_ZHANGMENPAI[1], MD_XINGYUN_ZHANGMENPAI[2],MD_XINGYUN_ZHANGMENPAI[3], MdData ) 
	elseif MdIndex == 4 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_JINYANZHUANG[1], MD_XINGYUN_JINYANZHUANG[2],MD_XINGYUN_JINYANZHUANG[3], MdData ) 
	elseif MdIndex == 5 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_YUEBING[1], MD_XINGYUN_YUEBING[2],MD_XINGYUN_YUEBING[3], MdData ) 
	elseif MdIndex == 6 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_BANGGONG[1], MD_XINGYUN_BANGGONG[2],MD_XINGYUN_BANGGONG[3], MdData ) 
	elseif MdIndex == 7 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_RONGYU[1], MD_XINGYUN_RONGYU[2],MD_XINGYUN_RONGYU[3], MdData ) 
	elseif MdIndex == 8 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_SHENGWANG[1], MD_XINGYUN_SHENGWANG[2],MD_XINGYUN_SHENGWANG[3], MdData ) 
	elseif MdIndex == 9 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_ZHANCHANG[1], MD_XINGYUN_ZHANCHANG[2],MD_XINGYUN_ZHANCHANG[3], MdData ) 
	elseif MdIndex == 10 then
		SetPlayerGameData(varMap, varPlayer, MD_XINGYUN_XIANYIN[1], MD_XINGYUN_XIANYIN[2],MD_XINGYUN_XIANYIN[3], MdData ) 
	end
end
function x418132_GetLeaveTimes( varMap, varPlayer, MdIndex )
	if MdIndex == 1 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_ZUANSHI[1], MD_XINGYUN_ZUANSHI[2],MD_XINGYUN_ZUANSHI[3]) 
	elseif MdIndex == 2 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_XISHIJI[1], MD_XINGYUN_XISHIJI[2],MD_XINGYUN_XISHIJI[3]) 
	elseif MdIndex == 3 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_ZHANGMENPAI[1], MD_XINGYUN_ZHANGMENPAI[2],MD_XINGYUN_ZHANGMENPAI[3]) 
	elseif MdIndex == 4 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_JINYANZHUANG[1], MD_XINGYUN_JINYANZHUANG[2],MD_XINGYUN_JINYANZHUANG[3]) 
	elseif MdIndex == 5 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_YUEBING[1], MD_XINGYUN_YUEBING[2],MD_XINGYUN_YUEBING[3]) 
	elseif MdIndex == 6 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_BANGGONG[1], MD_XINGYUN_BANGGONG[2],MD_XINGYUN_BANGGONG[3]) 
	elseif MdIndex == 7 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_RONGYU[1], MD_XINGYUN_RONGYU[2],MD_XINGYUN_RONGYU[3]) 
	elseif MdIndex == 8 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_SHENGWANG[1], MD_XINGYUN_SHENGWANG[2],MD_XINGYUN_SHENGWANG[3]) 
	elseif MdIndex == 9 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_ZHANCHANG[1], MD_XINGYUN_ZHANCHANG[2],MD_XINGYUN_ZHANCHANG[3]) 
	elseif MdIndex == 10 then
		return GetPlayerGameData(varMap, varPlayer, MD_XINGYUN_XIANYIN[1], MD_XINGYUN_XIANYIN[2],MD_XINGYUN_XIANYIN[3]) 
	end
	return 0
end
function x418132_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418132_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418132_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418132_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418132_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418132, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418132_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x418132_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
	local year,month,day = GetYearMonthDay()
	if year >= 2011 then
		return
	end	

		
		local Times = x418132_GetLeaveTimes(varMap, varPlayer, extid)
		Times = 25 - Times
		
		if Times <= 0 then
			Msg2Player( varMap, varPlayer, x418132_var_NoTimes, 8, 2)
			
			
			
			
			
			return
		end
		
		StartTalkTask( varMap)
		TalkAppendString( varMap, format( "\t您将进行#Y%s#W的幸运抽奖，您有可能获得目标道具，但也有可能获得其他道具，祝您中奖！\n\t您确定要开始幸运抽奖了吗？", x418132_var_MainMenuTab[ extid].itemname) )
		
		if(extid == 3) then
			
			AddQuestRadioItemBonus( varMap, x418132_var_MainMenuTab[ extid].itemId2, 1)
			AddQuestRadioItemBonus( varMap, x418132_var_MainMenuTab[ extid].itemId1, 1)
		elseif(extid <= 4) then
			
			AddQuestRadioItemBonus( varMap, x418132_var_MainMenuTab[ extid].varItem, 1)
		end
		
		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418132_var_FileId,x418132_var_QuestId)


	
	
	
end

function x418132_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	local year,month,day = GetYearMonthDay()
	if year >= 2011 then
		return
	end	
	local dayTime = GetDayTime()
	
	if(dayTime > 10073) then  
		if DepletingUsedItem( varMap, varPlayer) == 1 then
			TalkAppendString(varMap,x418132_var_TimeOutMsg)
			Msg2Player(varMap,varPlayer,x418132_var_TimeOutMsg,8,2)
			local varI = 1
			while varI <= 10 do 
				x418132_SetLeaveTimes( varMap, varPlayer, varI, 0)
				varI = varI + 1 
			end
		end
		return
    end	

	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t可以给你带来幸运的礼包。" )
	

	for varI, s in x418132_var_MainMenuTab do
		
		
		
		Times = x418132_GetLeaveTimes(varMap, varPlayer, varI)
		
		Times = 25 - Times
		
		if(Times > 0) then
			TalkAppendButton(varMap, x418132_var_QuestId, "#W我要"..x418132_var_MainMenuTab[varI].itemname.."(剩余"..Times.."次)",3,varI)
			
		else
			TalkAppendButton(varMap, x418132_var_QuestId, "#cb4b4b4我要"..x418132_var_MainMenuTab[varI].itemname.."(剩余0次)",3,varI)
			
		end
	end

	StopTalkTask( varMap)

                                           
    DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418132_GetGift( varMap, varPlayer, varIndex)

	
	if varIndex == 1 then
		local varRand = random( 1, 5)
		if(varRand == 1) then
			return x418132_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418132_var_NormalItemNum)
			
			return x418132_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 2 then
		local varRand = random( 1, 5)
		if(varRand == 1) then
			return x418132_var_MainMenuTab[varIndex].varItem,1
		else
			
			varRand = random( 1, x418132_var_NormalItemNum)
			
			return x418132_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 3 then
		local varRand = random( 1, 20)
		if varRand == 1 then
			return x418132_var_MainMenuTab[varIndex].itemId2,1
		elseif varRand <= 5 then
			return x418132_var_MainMenuTab[varIndex].itemId1,1
		else
			varRand = random( 1, x418132_var_NormalItemNum)
			
			return x418132_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 4 then
		local varRand = random( 1, 4)
		if(varRand == 1) then
			return x418132_var_MainMenuTab[varIndex].varItem,1
		else
			varRand = random( 1, x418132_var_NormalItemNum)
			return x418132_var_NormalItemTab[varRand].varItem,0
		end
	elseif varIndex == 5 then							
		local varLevel = GetLevel(varMap, varPlayer)
		for varI, s in x418132_var_YueBingItemTab do
			if varLevel >= s.varLevel then
				return s.varItem,0
				
			end
		end
		return nil,0
	elseif varIndex == 6 then							
		local varRand = random( 1, x418132_var_BangGongTabNum)
		return x418132_var_BangGongTab[varRand],0
	elseif varIndex == 7 then
		local varRand = random( 1, x418132_var_RongYuTabNum)
		return x418132_var_RongYuTab[varRand],0
	elseif varIndex == 8 then
		local varRand = random( 1, x418132_var_ShenWangTabNum)
		return x418132_var_ShenWangTab[varRand],0
	elseif varIndex == 9 then
		local varRand = random( 1, x418132_var_ZhanChanTabNum)
		return x418132_var_ZhanChanTab[varRand],0
	elseif varIndex == 10 then
		local varRand = random( 1, x418132_var_XianYinTabNum)
		return x418132_var_XianYinTab[varRand],0
	end

end



function x418132_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
	local year,month,day = GetYearMonthDay()
	if year >= 2011 then
		return
	end	
    
    
	
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	local value,broadcast = x418132_GetGift( varMap, varPlayer, varIndex)

	local Times = x418132_GetLeaveTimes(varMap, varPlayer, varIndex)
	
	
	Times = 25 - Times
	
	if Times <= 0 then
		return
	end
	local varMsg
	
	
	if varIndex <= 5 then
		if(value == nil) then
			Msg2Player( varMap, varPlayer, "您级别不够，无法得到物品!", 8, 2)
			return
		end

	    
		local varNum = 1
		if varIndex == 5 then
			varNum = random(8, 12)
		end
			
		
		if GetBagSpace(varMap, varPlayer) <= 0 then
			
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			
			return
		else
			
			
			
			
			
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)	
		
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418132_var_ItemId then
				return
			end

			if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
			end

			StartItemTask( varMap)		
			ItemAppendBind( varMap, value, varNum)
			if StopItemTask( varMap, varPlayer) <= 0 then
				return
			end
			DeliverItemListSendToPlayer( varMap, varPlayer)
		end
		

		
		if broadcast == 1 then
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			
			varMsg = format( "恭喜%s的%s在幸运大礼包抽奖中获得了#{_ITEM%d}!", CountryName, Name, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你在幸运大礼包抽奖中获得了#{_ITEM%d}!", value), 8, 2)
		else
			if varIndex == 5 then
				varMsg = format( "恭喜你在幸运大礼包抽奖中获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你在幸运大礼包抽奖中获得了#{_ITEM%d}!", value)
			end
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		end
	elseif varIndex == 6 then
		local guildId = GetGuildID(varMap,varPlayer)
		if guildId < 0 then
			varMsg = format( "您没有帮会，无法获得帮贡!")
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			return
		end
		
		
		
		
		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
		end
		AddGuildUserPoint(varMap, varPlayer, value)
		varMsg = format( "恭喜你在幸运大礼包抽奖中获得了%d点帮贡!", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)

	elseif varIndex == 7 then
		
		
		
		
		
		
		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
			return
		end
		
		
		
		
		AddHonor(varMap, varPlayer, value)
		varMsg = format( "恭喜你在幸运大礼包抽奖中获得了%d点荣誉!", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)

	elseif varIndex == 8 then
		
		
		
		
		
		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
		end
		local shenwang = GetShengWang(varMap, varPlayer)
		
		SetShengWang(varMap, varPlayer, shenwang+value)
		
		varMsg = format( "恭喜你在幸运大礼包抽奖中获得了%d点声望!", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		
	elseif varIndex == 9 then
		
		
		
		
		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
		end
		AddPVP2V2Mark(varMap, varPlayer, value)
		varMsg = format( "恭喜你在幸运大礼包抽奖中获得了%d点战场积分!", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
	elseif varIndex == 10 then
		
		
		
		
		if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
		end
		AddMoney(varMap, varPlayer, 0, value)
		varMsg = format( "恭喜你在幸运大礼包抽奖中获得了%d文现银!", value)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
	end
	
	if broadcast ~= 1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

	Times = Times -	1
	Times = 25 - Times
	x418132_SetLeaveTimes(varMap, varPlayer, varIndex, Times)


	GamePlayScriptLog( varMap, varPlayer, 1412)

	
    
end

