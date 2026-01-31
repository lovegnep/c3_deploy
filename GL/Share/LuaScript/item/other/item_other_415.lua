





x418415_var_FileId = 418415
x418415_var_QuestId = 10271
x418415_var_ItemId = 12030768
x418415_var_NoTimes = "您的剩余次数不足！"
x418415_var_StartWeek =81

x418415_var_NormalItemNum		=   16	



x418415_var_MainMenuTab	=	{
								{	itemname = 	"冥装图谱"				,	describe = "10个#R生命图谱#W或10个#R祝福图谱#W", 																					  varItem1 = 11000838, varItem2 = 11000839,  varItem3 = 11000840, varItem4 = 11000841, varItem5 = 11000842, varItem6 = 11000843, varItem7 = 11000844, varItem8 = 11000845, varItem9 = 11000984, varItem10 = 11000985, varItem11 = 11000986, varItem12 = 11000987, varItem13 = 11000988, varItem14 = 11000989, varItem15 = 11000990, varItem16 = 11000991,		varNum = 10	,  probability =20 , times = 30		},  
								{	itemname = 	"绝世骑乘降世符"	,	describe = "1张#R天龙降世符#W或1张#R青螭降世符#W", 														          		varItem1 = 12050353, varItem2 = 12050352,																				  			varNum = 1 	,  probability =1  , times = 30		},  
								{	itemname = 	"大包裹"					,	describe = "1个#R刺绣丝绸包（30格）#W或1个#R雕翎锦线包（36格）#W", 													varItem1 = 19010010, varItem2 = 19010011, 									 														varNum = 1 	,  probability =30 , times = 30		},  
								{	itemname = 	"五纹蓝石"				,	describe = "40个#R五纹水蓝石#W或40个#R五纹天蓝石#W或40个#R五纹靛蓝石#W", 		  							varItem1 = 11000886, varItem2 = 11000887,  varItem3 = 11000888, 												varNum = 40 ,  probability =30 , times = 30		},  
								{	itemname = 	"钻石原石"				,	describe = "2个#R钻石原石#W", 																			 				  							varItem = 11990113, 																				  													varNum = 2 	,  probability =20 , times = 30		},  
								{	itemname = 	"节日时装"				,	describe = "1个#R14天黑色节日时装（7%经验）礼包#W或1个#R14天黑色节日时装（8%经验）", 				varItem1 = 12030770, varItem2 = 12030771, 																				  		varNum = 1 	,  probability =25 , times = 30		},  
								{	itemname = 	"传说级洗石剂"		,	describe = "25个#R雪山之星#W", 																															varItem = 11000936,																						 													varNum = 25	,  probability =10 , times = 30		},  
								{	itemname = 	"平衡之书"				,	describe = "20本#R一级平衡之书#W或20本#R二级平衡之书#W或20本#R三级平衡之书#W",							varItem1 = 11010111, varItem2 = 11010112, varItem3 = 11010113, 													varNum = 20	,  probability =40 , times = 30		}, 	
							}                                     
                                                           




function x418415_SetLeaveTimes( varMap, varPlayer, MdIndex, MdData )
	if MdIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT1[1], MD_CHONGCU_COUNT1[2],MD_CHONGCU_COUNT1[3], MdData ) 
	elseif MdIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT2[1], MD_CHONGCU_COUNT2[2],MD_CHONGCU_COUNT2[3], 1 ) 
	elseif MdIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT3[1], MD_CHONGCU_COUNT3[2],MD_CHONGCU_COUNT3[3], MdData ) 
	elseif MdIndex == 4 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT4[1], MD_CHONGCU_COUNT4[2],MD_CHONGCU_COUNT4[3], MdData ) 
	elseif MdIndex == 5 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT5[1], MD_CHONGCU_COUNT5[2],MD_CHONGCU_COUNT5[3], MdData ) 
	elseif MdIndex == 6 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT6[1], MD_CHONGCU_COUNT6[2],MD_CHONGCU_COUNT6[3], MdData ) 
	elseif MdIndex == 7 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT7[1], MD_CHONGCU_COUNT7[2],MD_CHONGCU_COUNT7[3], MdData ) 
	elseif MdIndex == 8 then
		SetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT8[1], MD_CHONGCU_COUNT8[2],MD_CHONGCU_COUNT8[3], MdData ) 
	end
end
function x418415_GetLeaveTimes( varMap, varPlayer, MdIndex )
	if MdIndex == 1 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT1[1], MD_CHONGCU_COUNT1[2],MD_CHONGCU_COUNT1[3]) 
	elseif MdIndex == 2 then
		return 1
	elseif MdIndex == 3 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT3[1], MD_CHONGCU_COUNT3[2],MD_CHONGCU_COUNT3[3]) 
	elseif MdIndex == 4 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT4[1], MD_CHONGCU_COUNT4[2],MD_CHONGCU_COUNT4[3]) 
	elseif MdIndex == 5 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT5[1], MD_CHONGCU_COUNT5[2],MD_CHONGCU_COUNT5[3]) 
	elseif MdIndex == 6 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT6[1], MD_CHONGCU_COUNT6[2],MD_CHONGCU_COUNT6[3]) 
	elseif MdIndex == 7 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT7[1], MD_CHONGCU_COUNT7[2],MD_CHONGCU_COUNT7[3]) 
	elseif MdIndex == 8 then
		return GetPlayerGameData(varMap, varPlayer, MD_CHONGCU_COUNT8[1], MD_CHONGCU_COUNT8[2],MD_CHONGCU_COUNT8[3]) 
	end
	return 0
end
function x418415_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
function x418415_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end
function x418415_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418415_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end
function x418415_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418415, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418415_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418415_CheckDate( varMap, varPlayer)
	if 	GetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3]) ~= MD_CHONGCU_LASTWEEK then
			local nFrom = MD_CHONGCU_BEGIN[1]
			local nTo   = MD_CHONGCU_END[1]
			SetPlayerGameData(varMap,varPlayer,nFrom,12,20,0)
			nFrom = nFrom + 1
			for varI = nFrom,nTo do
				SetPlayerGameData(varMap,varPlayer, varI, 0, 32, 0)
			end
	end	
	SetPlayerGameData(varMap,varPlayer,MD_CHONGCU_INDEX[1],MD_CHONGCU_INDEX[2],MD_CHONGCU_INDEX[3],x418415_var_StartWeek)
end



function x418415_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

		local Times = x418415_GetLeaveTimes(varMap, varPlayer, extid)
		Times = 30 - Times
		if Times <= 0 then
			Msg2Player( varMap, varPlayer, x418415_var_NoTimes, 8, 2)
			return
		end
		StartTalkTask( varMap)
		TalkAppendString( varMap, format( "\t您将进行#G%s#W的幸运抽奖，您有可能获得%s。如果您没有得到想要的道具，则会获得#R金卡奖励#W，祝您中奖！\n\t您确定要开始幸运抽奖了吗？\n注：\n\t1.金卡以道具形式给予，分为#R10两#W、#R20两#W、#R50两#W、#R100两#W、#R500两#W！\n\t2.所得道具均为#R绑定道具#W。", x418415_var_MainMenuTab[ extid].itemname,x418415_var_MainMenuTab[ extid].describe ,12030059 ) )
		if extid == 1 then		 
			AddQuestRadioItemBonus( varMap,12500208 , x418415_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap,12500209	, x418415_var_MainMenuTab[ extid].varNum)
		elseif extid == 2 or extid == 3 or extid == 6 then
			AddQuestRadioItemBonus( varMap, x418415_var_MainMenuTab[ extid].varItem1, x418415_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap, x418415_var_MainMenuTab[ extid].varItem2, x418415_var_MainMenuTab[ extid].varNum)			
		elseif extid == 4 or extid == 8 then		 
			AddQuestRadioItemBonus( varMap, x418415_var_MainMenuTab[ extid].varItem1, x418415_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap, x418415_var_MainMenuTab[ extid].varItem2, x418415_var_MainMenuTab[ extid].varNum)
			AddQuestRadioItemBonus( varMap, x418415_var_MainMenuTab[ extid].varItem3, x418415_var_MainMenuTab[ extid].varNum)
		else
		AddQuestRadioItemBonus( varMap, x418415_var_MainMenuTab[ extid].varItem, x418415_var_MainMenuTab[ extid].varNum)	
		end		

		SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,x418415_var_FileId,x418415_var_QuestId)

end

function x418415_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	local year,month,day = GetYearMonthDay()		
	if year > 2011 then
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1413)
		return 0
	end
	
	x418415_CheckDate( varMap, varPlayer)

	local Times = 0
	StartTalkTask(varMap)
	TalkAppendString( varMap, "\t《成吉思汗3 恶狼传说》中的珍品稀有道具应有尽有！" )

	for varI, s in x418415_var_MainMenuTab do
		Times = x418415_GetLeaveTimes(varMap, varPlayer, varI)
		Times = 30 - Times
		if varI ~= 2 then
			if(Times > 0) then
				TalkAppendButton(varMap, x418415_var_QuestId, "我要"..x418415_var_MainMenuTab[varI].itemname.."！(剩余"..Times.."次)",3,varI)
			else
				TalkAppendButton(varMap, x418415_var_QuestId, "#cb4b4b4我要"..x418415_var_MainMenuTab[varI].itemname.."(剩余0次)",3,varI)
			end
		else
			TalkAppendButton(varMap, x418415_var_QuestId, "我要"..x418415_var_MainMenuTab[varI].itemname.."！（不限次）",3,varI)	
		end	
	end

	StopTalkTask( varMap)

                                           
  DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x418415_GetGift( varMap, varPlayer, varIndex)
	local year,month,day = GetYearMonthDay()		
	if year > 2011 then
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1413)
		return 0
	end

	local varRand = random (1 , 100)
	if varIndex == 1 then
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 10)
			if varRand <= 5 then
				return random(11000984,11000991) ,0
			else
				return random(11000838,11000845) ,0				
			end	
		else
			return 12030059,0
		end			
	elseif varIndex == 2 then
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 2)
			if varRand == 1 then
				return x418415_var_MainMenuTab[varIndex].varItem2 ,1
			else
				return x418415_var_MainMenuTab[varIndex].varItem1 ,1	
			end	
		else
			return 12030059,0
		end				
	elseif varIndex == 3 then
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 30)
			if varRand == 1 then
				return x418415_var_MainMenuTab[varIndex].varItem2 ,1
			else
				return x418415_var_MainMenuTab[varIndex].varItem1 ,0	
			end	
		else
			return 12030059,0
		end			
	elseif varIndex == 4 then
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 10)
			if varRand <= 5 then
				return x418415_var_MainMenuTab[varIndex].varItem1 ,0
			elseif varRand <= 8 then
				return x418415_var_MainMenuTab[varIndex].varItem2 ,0	
			else
				return x418415_var_MainMenuTab[varIndex].varItem3 ,1						
			end	
		else
			return 12030059,0
		end				
	elseif varIndex == 6 then
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 25)
			if varRand <= 18 then
				return x418415_var_MainMenuTab[varIndex].varItem1 ,0
			else
				return x418415_var_MainMenuTab[varIndex].varItem2 ,0	
			end	
		else
			return 12030059,0
		end				
	elseif varIndex == 8 then
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			varRand = random (1 , 20)
			if varRand == 1 then
				return x418415_var_MainMenuTab[varIndex].varItem3 ,1
			elseif varRand <= 5 then
				return x418415_var_MainMenuTab[varIndex].varItem2 ,1	
			else
				return x418415_var_MainMenuTab[varIndex].varItem1 ,0		
			end	
		else
			return 12030059,0
		end		
	else	
		if varRand <= x418415_var_MainMenuTab[varIndex].probability then
			return x418415_var_MainMenuTab[varIndex].varItem ,1
		else
			return 12030059,0
		end	
	end		
end



function x418415_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

	
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
	local value,broadcast = x418415_GetGift( varMap, varPlayer, varIndex)
	local Times = x418415_GetLeaveTimes(varMap, varPlayer, varIndex)

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

	
			local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)
			if GetItemIDByIndexInBag( varMap, varPlayer, bagIndex) ~= x418415_var_ItemId then
				return
			end

			if DepletingUsedItem( varMap, varPlayer) ~= 1 then
				return
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
			

			if value == 11000604 then
				varNum = 30
			elseif value ==11990113 then
				varNum =2
			elseif value >=11000984 and value <=11000991 then
				varNum =10
			elseif value >=11000838 and value <=11000845 then
				varNum =10							
			elseif value == 11000550 or value == 11000551 or value == 11000552 or value == 11010111 or value == 11010112 or value == 11010113  or value == 11000908 then
				varNum = 20			
			elseif value == 11000936 then
				varNum = 25						
			elseif value == 11000886 or value == 11000887 or value == 11000888 then
				varNum = 40
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
			
			varMsg = format( "恭喜%s的%s打开福星献宝黄金礼盒获得了%d个#{_ITEM%d}!", CountryName, Name, varNum, value )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player( varMap, varPlayer, format( "恭喜你在福星献宝黄金礼盒抽奖中获得了%d个#{_ITEM%d}!", varNum, value), 8, 2)
			Msg2Player( varMap, varPlayer, format( "恭喜你在福星献宝黄金礼盒抽奖中获得了%d个#{_ITEM%d}!", varNum, value), 8, 3)
		else
		if varNum ~= 0 then
				varMsg = format( "恭喜你在福星献宝黄金礼盒抽奖中获得了%d个#{_ITEM%d}!", varNum, value)
			else
				varMsg = format( "恭喜你在福星献宝黄金礼盒抽奖中获得了#{_ITEM%d}!", value)
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
	x418415_SetLeaveTimes(varMap, varPlayer, varIndex, Times)

	GamePlayScriptLog( varMap, varPlayer, 1412)

	
    
end

