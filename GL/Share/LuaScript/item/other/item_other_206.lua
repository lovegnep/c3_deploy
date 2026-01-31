





x418206_var_FileId = 418206
x418206_var_QuestId = 10261
x418206_var_ItemId = 12030531
x418206_var_NoTimes = "您的剩余次数不足！"

x418206_var_NormalItemNum		=   16	



x418206_var_MainMenuTab	=	{
								{	itemname = 	"掌门牌"				,	describe = "1个30天#R碰碰胡礼包#W或1个#R30天清一色礼包#W", 		                itemId1 = 12030506, itemId2 = 12030507, 								    varNum = 1 ,  probability =25 , times = 30		},  
								{	itemname = 	"无双无畏80龙"	,	describe = "1张#R极品钢爪翼龙降世符#W", 														          varItem = 12050285, 																				  varNum = 1 ,  probability =1  , times = 30		},  
								{	itemname = 	"大包裹"				,	describe = "1个#R镂刻兽革包（24格）#W或1个#R刺绣丝绸包（30格）#W", 						itemId1 = 19010009, itemId2 = 19010010, 									  varNum = 1 ,  probability =30 , times = 30		},  
								{	itemname = 	"朝廷请柬"			,	describe = "2个#R朝廷请柬#W", 																			 				  varItem = 12030203, 																				  varNum = 2 ,  probability =40 , times = 30		},  
								{	itemname = 	"钻石原石"			,	describe = "2个#R钻石原石#W", 																			 				  varItem = 11990113, 																				  varNum = 2 ,  probability =20 , times = 30		},  
								{	itemname = 	"节日时装"			,	describe = "1个#R14天节日时装礼包#W", 															 				  varItem = 12030505, 																				  varNum = 1 ,  probability =25 , times = 30		},  
								{	itemname = 	"星尘"					,	describe = "20个#R微瑕星辰#W或20个#R无瑕星辰#W或20个#R完美星辰#W", 						itemId1 = 11000550, itemId2 = 11000551, itemId3 = 11000552, varNum = 20 , probability =50 , times = 30		},  
								{	itemname = 	"平衡之书"			,	describe = "20本#R一级平衡之书#W或20本#R二级平衡之书#W或20本#R三级平衡之书#W",itemId1 = 11010111, itemId2 = 11010112, itemId3 = 11010113, varNum = 20 , probability =40 , times = 30		}, 	
							}                                     
                                                           
x418206_var_BangGongTabNum	=	4                              
x418206_var_BangGongTab		=	{200, 300, 400, 500}             
x418206_var_RongYuTabNum		=	6                              
x418206_var_RongYuTab			=	{700, 800, 900, 1050, 1150, 1250}
x418206_var_ShenWangTabNum	=	9
x418206_var_ShenWangTab		=	{7500, 8500, 9500, 10500, 11500, 12000, 13000, 14000, 15000}
x418206_var_ZhanChanTabNum	=	5
x418206_var_ZhanChanTab		=	{150, 175, 200, 225, 250}
x418206_var_XianYinTabNum		=	5
x418206_var_XianYinTab		=	{150000, 175000, 200000, 225000, 250000}




function x418206_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
	if MdIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT1[1], MD_ITEMCHOUJIANG_COUNT1[2],MD_ITEMCHOUJIANG_COUNT1[3], MdData ) 
	elseif MdIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT2[1], MD_ITEMCHOUJIANG_COUNT2[2],MD_ITEMCHOUJIANG_COUNT2[3], MdData ) 
	elseif MdIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT3[1], MD_ITEMCHOUJIANG_COUNT3[2],MD_ITEMCHOUJIANG_COUNT3[3], MdData ) 
	elseif MdIndex == 4 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT4[1], MD_ITEMCHOUJIANG_COUNT4[2],MD_ITEMCHOUJIANG_COUNT4[3], MdData ) 
	elseif MdIndex == 5 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT5[1], MD_ITEMCHOUJIANG_COUNT5[2],MD_ITEMCHOUJIANG_COUNT5[3], MdData ) 
	elseif MdIndex == 6 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT6[1], MD_ITEMCHOUJIANG_COUNT6[2],MD_ITEMCHOUJIANG_COUNT6[3], MdData ) 
	elseif MdIndex == 7 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT7[1], MD_ITEMCHOUJIANG_COUNT7[2],MD_ITEMCHOUJIANG_COUNT7[3], MdData ) 
	elseif MdIndex == 8 then
		SetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT8[1], MD_ITEMCHOUJIANG_COUNT8[2],MD_ITEMCHOUJIANG_COUNT8[3], MdData ) 
	end
end
function x418206_GetLeaveTimes( varMap, varPlayer, MdIndex )
	if MdIndex == 1 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT1[1], MD_ITEMCHOUJIANG_COUNT1[2],MD_ITEMCHOUJIANG_COUNT1[3]) 
	elseif MdIndex == 2 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT2[1], MD_ITEMCHOUJIANG_COUNT2[2],MD_ITEMCHOUJIANG_COUNT2[3]) 
	elseif MdIndex == 3 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT3[1], MD_ITEMCHOUJIANG_COUNT3[2],MD_ITEMCHOUJIANG_COUNT3[3]) 
	elseif MdIndex == 4 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT4[1], MD_ITEMCHOUJIANG_COUNT4[2],MD_ITEMCHOUJIANG_COUNT4[3]) 
	elseif MdIndex == 5 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT5[1], MD_ITEMCHOUJIANG_COUNT5[2],MD_ITEMCHOUJIANG_COUNT5[3]) 
	elseif MdIndex == 6 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT6[1], MD_ITEMCHOUJIANG_COUNT6[2],MD_ITEMCHOUJIANG_COUNT6[3]) 
	elseif MdIndex == 7 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT7[1], MD_ITEMCHOUJIANG_COUNT7[2],MD_ITEMCHOUJIANG_COUNT7[3]) 
	elseif MdIndex == 8 then
		return GetPlayerGameData(varMap, varPlayer, MD_ITEMCHOUJIANG_COUNT8[1], MD_ITEMCHOUJIANG_COUNT8[2],MD_ITEMCHOUJIANG_COUNT8[3]) 
	end
	return 0
end
function x418206_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418206_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418206_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418206_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418206_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418206, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418206_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x418206_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

		local Times = x418206_GetLeaveTimes(varMap, varPlayer, extid)
		Times = 30 - Times
		if Times <= 0 then
			Msg2Player( varMap, varPlayer, x418206_var_NoTimes, 8, 2)
			return
		end
		StartTalkTask( varMap)
		TalkAppendString( varMap, format( "\t您将进行#G%s#W的幸运抽奖，您有可能获得%s。如果您没有得到想要的道具，则会获得#R金卡奖励#W，祝您中奖！\n\t您确定要开始幸运抽奖了吗？\n注：\n\t1.金卡以道具形式给予，分为#R10两#W、#R20两#W、#R50两#W、#R100两#W、#R500两#W！\n\t2.所得道具均为#R绑定道具#W。", x418206_var_MainMenuTab[ extid].itemname,x418206_var_MainMenuTab[ extid].describe ,12030059 ) )
		if extid == 1 or extid == 3 then		 
			AddQuestRadioItemBonus( varMap, x418206_var_MainMenuTab[ extid].itemId1, x418206_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap, x418206_var_MainMenuTab[ extid].itemId2, x418206_var_MainMenuTab[ extid].varNum)
		elseif extid == 7 or extid == 8 then		 
			AddQuestRadioItemBonus( varMap, x418206_var_MainMenuTab[ extid].itemId1, x418206_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap, x418206_var_MainMenuTab[ extid].itemId2, x418206_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap, x418206_var_MainMenuTab[ extid].itemId3, x418206_var_MainMenuTab[ extid].varNum)
		else
		AddQuestRadioItemBonus( varMap, x418206_var_MainMenuTab[ extid].varItem, x418206_var_MainMenuTab[ extid].varNum)	
		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418206_var_FileId,x418206_var_QuestId)

end

function x418206_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的珍品稀有道具应有尽有！" )

	for varI, s in x418206_var_MainMenuTab do
		Times = x418206_GetLeaveTimes(varMap, varPlayer, varI)
		Times = 30 - Times
		if(Times > 0) then
			TalkAppendButton(varMap, x418206_var_QuestId, "我要"..x418206_var_MainMenuTab[varI].itemname.."！(剩余"..Times.."次)",3,varI)
		else
			TalkAppendButton(varMap, x418206_var_QuestId, "#cb4b4b4我要"..x418206_var_MainMenuTab[varI].itemname.."(剩余0次)",3,varI)
		end
	end

	StopTalkTask( varMap)

                                           
  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418206_GetGift( varMap, varPlayer, varIndex)
	local varRand = random (1 , 100)
	if varIndex == 1 then
		if varRand <= x418206_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 5)
			if varRand <= 3 then
				return x418206_var_MainMenuTab[varIndex].itemId1 ,1
			else
				return x418206_var_MainMenuTab[varIndex].itemId2 ,1	
			end	
		else
			return 12030059,0
		end			
	elseif varIndex == 3 then
		if varRand <= x418206_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 30)
			if varRand == 1 then
				return x418206_var_MainMenuTab[varIndex].itemId2 ,1
			else
				return x418206_var_MainMenuTab[varIndex].itemId1 ,0	
			end	
		else
			return 12030059,0
		end			
	elseif varIndex == 7 then
		if varRand <= x418206_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 10)
			if varRand == 1 then
				return x418206_var_MainMenuTab[varIndex].itemId3 ,1
			elseif varRand <= 4 then
				return x418206_var_MainMenuTab[varIndex].itemId2 ,0	
			else
				return x418206_var_MainMenuTab[varIndex].itemId1 ,0		
			end	
		else
			return 12030059,0
		end		
	elseif varIndex == 8 then
		if varRand <= x418206_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 20)
			if varRand == 1 then
				return x418206_var_MainMenuTab[varIndex].itemId3 ,1
			elseif varRand <= 5 then
				return x418206_var_MainMenuTab[varIndex].itemId2 ,1	
			else
				return x418206_var_MainMenuTab[varIndex].itemId1 ,0		
			end	
		else
			return 12030059,0
		end		
	else	
		if varRand <= x418206_var_MainMenuTab[varIndex].probability then
			return x418206_var_MainMenuTab[varIndex].varItem ,1
		else
			return 12030059,0
		end	
	end		
end



function x418206_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    
	
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	local value,broadcast = x418206_GetGift( varMap, varPlayer, varIndex)

	local Times = x418206_GetLeaveTimes(varMap, varPlayer, varIndex)

	Times = 30 - Times

	if Times <= 0 then
		return
	end
	local varMsg


		local varNum =1
		
		if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 2)
			return
		else

			if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
			end
			
			
			if value ==12030203 or value ==11990113 then
				varNum =2
			end	
			
			if value ==12030059 then
				local ran =random(1,1000)
				if ran == 1 then
					value = 12030048
					varNum = 5
					broadcast = 1
				elseif 	ran <=10 then
					value = 12030048
					broadcast = 1
				elseif 	ran <=50 then
					varNum = 5
					broadcast = 1
				elseif ran <=850 then
					varNum = 2
				end
			end		
				
				
			if value == 11000550 or value == 11000551 or value == 11000552 or value == 11010111 or value == 11010112 or value == 11010113 then
				varNum = 20
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
			
			varMsg = format( "恭喜%s的%s打开奇珍异宝盒获得了%d个#{_ITEM%d}!", CountryName, Name, varNum, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你在奇珍异宝盒抽奖中获得了%d个#{_ITEM%d}!", varNum, value), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你在奇珍异宝盒抽奖中获得了%d个#{_ITEM%d}!", varNum, value), 8, 3)
		else
		if varNum ~= 0 then
				varMsg = format( "恭喜你在奇珍异宝盒抽奖中获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你在奇珍异宝盒抽奖中获得了#{_ITEM%d}!", value)
			end
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		end
	
	
	if broadcast ~= 1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

	Times = Times -	1
	Times = 30 - Times
	x418206_SetLeaveTimes(varMap, varPlayer, varIndex, Times)


	GamePlayScriptLog( varMap, varPlayer, 1412)

	
    
end

