--捐献仲夏娱乐币

x310902_var_ScriptId 		= 310902
x310902_var_MissionName		= "【个人】中秋月饼寄福"
x310902_var_MissionName1	= "【个人】捐献普通月饼寄福"
x310902_var_MissionName2	= "【个人】捐献优质月饼寄福"

x310902_var_MooncakeName		= {"豆沙月饼","莲蓉月饼","枣泥月饼","蛋黄月饼"}
x310902_var_YMooncakeName		= {"优质豆沙月饼","优质莲蓉月饼","优质枣泥月饼","优质蛋黄月饼"}
x310902_var_JieriScore =
{
	{1,2,3},
	{2,3,8}	
}

-- 玩法开关id
x310902_var_IsEnableId    = 1089
x310902_var_LimitLevel	= 40			--最低级别

x310902_var_MaxCount		= 100

x310902_var_SelectButton ={}

x310902_var_SubmitItem	= {12035244,12035245,12035246,12035247,12035248,12035249,12035250,12035251}--月饼
x310902_var_Jiumao = {27301,27302,27303}

--x310902_var_BonusZifu	= {12035213,12035214,12035215,12035216,12035217,12035218,12035219,12035208}   --字符
x310902_var_GrowpointId = 145 
x310902_var_BonusItem 	= 12035255   --时装藏宝图
x310902_var_varMap = {
{varid = 36, varX =98, varY =180, varname = "大都南"},
{varid = 37, varX =94, varY =48, varname = "大都东" },
{varid = 38, varX =111, varY =77, varname = "大都西"},
{varid = 15, varX =168, varY =82, varname = "威海港"},
}


x310902_var_ExpParam  = {
{Expmulti =2   ,probability =1  },
{Expmulti =1.5 ,probability =1  },
{Expmulti =1.1 ,probability =1  },
{Expmulti =0.9 ,probability =1  },
{Expmulti =0.7 ,probability =1  },
{Expmulti =0.3 ,probability =1  },
{Expmulti =0.25,probability =94 },
}

x310902_var_ExpParam1  = {
{Expmulti =1.5, probability =1  },
{Expmulti =1.4, probability =1  },
{Expmulti =1.3, probability =1  },
{Expmulti =1.2, probability =1  },
{Expmulti =1.1, probability =1  },
{Expmulti =1  , probability =1  },
{Expmulti =0.9, probability =1  },
{Expmulti =0.8, probability =1  },
{Expmulti =0.7, probability =1  },
{Expmulti =0.6, probability =1  },
{Expmulti =0.5, probability =30 },
{Expmulti =0.4, probability =60 },
}

--x310902_var_BonusItem =
--{
--{itemid = ,probability1 = 5,probability2 =},--百两金卡红包        	100
--{itemid = ,probability1 = ,probability2 =},--毛驴降世符 					389        
--{itemid = ,probability1 = ,probability2 =},--熊猫降世符          	389
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =},--
--{itemid = ,probability1 = ,probability2 =} --
--}





----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310902_ProcEnumEvent( varMap, varPlayer, varTalknpc, MissionId )
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
				return
	end
	local level = GetLevel(varMap, varPlayer)
	if GetGameOpenById( x310902_var_IsEnableId) <= 0 then
        return
  end
  
  if level < x310902_var_LimitLevel then
  		return
  end
		TalkAppendButton(varMap,x310902_var_ScriptId, x310902_var_MissionName,  3, 990)
		TalkAppendButton(varMap, x310902_var_ScriptId, "节日积分商店", 10, 6)
		TalkAppendButton(varMap, x310902_var_ScriptId, "月饼面粉商店", 10, 8)
		TalkAppendButton(varMap, x310902_var_ScriptId, "月饼馅料商店", 10, 9)
		TalkAppendButton(varMap,x310902_var_ScriptId, "个人节日积分查询", 3, 2)
		--TalkAppendButton(varMap, x310902_var_ScriptId, "全服活动积分查询", 3, 4)
		TalkAppendButton(varMap, x310902_var_ScriptId, "中秋寄福说明", 13, 7)

end

----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310902_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )

--	local daycount,wheelcount = x310902_GetDayCount(varMap, varPlayer, itemcount)
--	local times = x310902_var_MaxCount - (wheelcount*50)  - daycount
--	local str = format("\n#G小提示：你今天还可以捐献#R%d#G个中秋月饼。",times,(50-daycount))
	if GetGameOpenById( x310902_var_IsEnableId) <= 0 then
     return
  end

    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y".."【个人】中秋月饼寄福")
    	TalkAppendString(varMap,"\t值此中秋佳节之际，《成吉思汗3 恶狼传说》与您一起相伴欢度中秋。在此浓情满满日子里,#B@myname#W你愿意捐献一个月饼送出对亲人、朋友的祝福吗?")
    	--TalkAppendString(varMap,str)

    	x310902_var_SelectButton[GetGUID(varMap, varPlayer)] = idExt  --记录玩家点击的选项

    if idExt == 990 then
      TalkAppendButton(varMap,x310902_var_ScriptId, x310902_var_MissionName1, 3, 991)
			TalkAppendButton(varMap,x310902_var_ScriptId, x310902_var_MissionName2, 3, 992)
			StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			return
    elseif idExt == 991 then
			for i , item in x310902_var_MooncakeName do
				TalkAppendButton(varMap,x310902_var_ScriptId, "捐献"..x310902_var_MooncakeName[i], 3, 1000+i*10)
			end
			StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    	return
   elseif idExt == 992 then
			for i , item in x310902_var_MooncakeName do
				TalkAppendButton(varMap,x310902_var_ScriptId, "捐献"..x310902_var_YMooncakeName[i], 3, 1100+i*10)
			end
			StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    	return
   elseif idExt >2100 then
   		local t =mod(idExt,100)
   		local MCindex =floor(t/10)
   		local n=mod(t,10)
   		idExt = idExt -n
   		if n == 9 then n = 10 end
   		
   		TalkAppendButton(varMap, x310902_var_ScriptId, "捐献1个"..x310902_var_YMooncakeName[MCindex], 3, idExt+1)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献5个"..x310902_var_YMooncakeName[MCindex], 3, idExt+5)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献10个"..x310902_var_YMooncakeName[MCindex], 3, idExt+9)   		
   		StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)   		
   		x310902_var_GiveBonus(varMap, varPlayer, varTalknpc, idScript, idExt , x310902_var_SubmitItem[MCindex+4],n)
    	return
   elseif idExt >2000 then
   		local t =mod(idExt,100)
   		local MCindex =floor(t/10)
   		local n=mod(t,10)
   		idExt = idExt -n
   		if n == 9 then n = 10 end
   		TalkAppendButton(varMap, x310902_var_ScriptId, "捐献1个"..x310902_var_MooncakeName[MCindex], 3, idExt+1)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献5个"..x310902_var_MooncakeName[MCindex], 3, idExt+5)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献10个"..x310902_var_MooncakeName[MCindex], 3, idExt+9)
   		x310902_var_GiveBonus(varMap, varPlayer,varTalknpc, idScript, idExt ,x310902_var_SubmitItem[MCindex],n)
   		StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    	return    	
   elseif idExt > 1100 then
			local MCindex =mod(idExt,1100)/10
   		TalkAppendButton(varMap, x310902_var_ScriptId, "捐献1个"..x310902_var_YMooncakeName[MCindex], 3, idExt+1000+1)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献5个"..x310902_var_YMooncakeName[MCindex], 3, idExt+1000+5)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献10个"..x310902_var_YMooncakeName[MCindex], 3, idExt+1000+9)
			StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
   		return
   elseif idExt > 1000 then
			local MCindex =mod(idExt,1000)/10
   		TalkAppendButton(varMap, x310902_var_ScriptId, "捐献1个"..x310902_var_MooncakeName[MCindex], 3, idExt+1000+1)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献5个"..x310902_var_MooncakeName[MCindex], 3, idExt+1000+5)
			TalkAppendButton(varMap, x310902_var_ScriptId, "捐献10个"..x310902_var_MooncakeName[MCindex], 3, idExt+1000+9)
			StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
   		return 	
   end
    	
    	
    if 	idExt == 2 then 
    	StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y【个人】节日积分查询" )
           TalkAppendString( varMap, format( "\n\t您目前的节日积分为#G%d#W。", GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) ) )
      StopTalkTask()
      DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
     elseif idExt == 4 then
    	local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)        
    	if score < 0 then
    		score = 0
    		SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, score)
    	end
    	
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."全服活动积分查询".."#W")
			TalkAppendString(varMap, "\t当前活动积分是:#G"..score.."\n \n\t#W当积分到达500及500的整数倍时，大都会刷出大量宝箱。\n\t当积分到达10000及10000的整数倍时，将在大都附近刷出掉落极品坐骑的九旄战神。\n \n#G注：每次只会触发一个事件。") 
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    elseif 	idExt == 6 then 
    	DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    elseif 	idExt == 7 then 
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."中秋寄福说明".."#W\n")
			TalkAppendString(varMap, "\t月满中秋，祝福无限，在此充满温情的节日时分，大家可以通过月饼寄托对朋友亲人的祝福与关心。") 
			TalkAppendButton(varMap, x310902_var_ScriptId, "制作中秋月饼说明", 13, 110)
			--TalkAppendButton(varMap, x310902_var_ScriptId, "仲夏嘉年华活动说明", 13, 111)
    	TalkAppendButton(varMap, x310902_var_ScriptId, "中秋月饼祝福说明", 13, 112)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    elseif 	idExt == 8 then 
    	DispatchShopItem( varMap, varPlayer, varTalknpc, 937)  	
    elseif 	idExt == 9 then 
    	DispatchShopItem( varMap, varPlayer, varTalknpc, 1270)   	
    elseif  idExt == 110 then
   		StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y制作中秋月饼说明" )
           TalkAppendString( varMap, "1、活动开放时间：\n\t#G9月9日-9月19号#W期间，全天任意时间都可以用月饼面粉和月饼馅料制作中秋月饼。" )
           TalkAppendString( varMap, "2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。" )
           TalkAppendString( varMap, "3、活动内容：\n\t活动时间内，玩家可以提供#G月饼面粉#W与对应的#G月饼馅料#W制作出中秋月饼。中秋月饼分为四种：#G增加经验的豆沙月饼#W、#G增加天赋的莲蓉月饼#W、#G增加声望的枣泥月饼#W和#G增加荣誉的蛋黄月饼#W。每种中秋月饼有普通月饼和更加超值的#G优质月饼#W。" )
      StopTalkTask()
      DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
    elseif  idExt == 111 then
    	StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y仲夏嘉年华活动说明" )
           TalkAppendString( varMap, "1、活动开放时间：\n\t#G7月12日-8月15号#W期间，每天的12：00到12：30和19：00到19：30开放。" )
           TalkAppendString( varMap, "2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。" )
           TalkAppendString( varMap, "3、活动内容：\n\t活动时间内天上人间·麒麟和天上人间·梦聊的人们将组成仲夏狂欢团携带大量礼物前来与大家一起狂欢，他们的队伍将从大都南到大都中心城的入口一直游行到皇城入口，沿途将随机给大家?洒狂欢节礼品。惊喜多多，不容错过。" )
      StopTalkTask()
      DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
    elseif  idExt == 112 then
    	StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y中秋寄福活动说明" )
			 		 TalkAppendString(varMap, "1、活动开放时间：\n\t#G9月9日-9月19号#W期间，可以在我这将制作出的中秋月饼为载体，送出你的祝福与关心。") 
			 		 TalkAppendString(varMap,"2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。")
			 		 TalkAppendString(varMap,"3、活动内容：\n\t每次参与中秋寄福活动会获得金卡奖励同时还有几率获得各种稀有道具。\n\t#G9月20日-9月26日#W期间将不再售卖月饼面粉及月饼馅料，全天任意时间仍然开放制作月饼及中秋寄福。")
    	 		-- TalkAppendString(varMap,"\t当全服积分达到500及500的整数倍时，在大都场景内刷出大量宝箱，玩家采集将有几率获得天赋、荣誉、帮贡、经验或银卡的奖励。\n\n\t当全服积分到达10000及10000的整数倍时，将随机在大都东、大都南、大都西和威海港中一个场景刷出一只掉落极品坐骑的九旄战神。")
      StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    else
    	--SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
    	
		StartTalkTask(varMap)          
		TalkAppendString(varMap, "#Y"..x310902_var_MissionName.."#W")
		
		local str 
		if x310902_var_SelectButton[GetGUID(varMap, varPlayer)]  == 990 then
		str =format("\t每捐献1个仲夏娱乐币都可以获得大笔的经验和个人节日积分，并且有几率获得#G周年庆典纪念章#W。\n\t你确定要捐献%d个仲夏娱乐币?",idExt)
		elseif x310902_var_SelectButton[GetGUID(varMap, varPlayer)]  == 991 then
		str =format("\t每捐献1个仲夏娱乐币都可以获得海量的经验和个人节日积分，并且有几率获得#G周年庆典纪念章#W。\n\t#R80级以上玩家将额外获得大量天赋值奖励。#W\n\t你确定要捐献%d个仲夏娱乐币?",idExt)
		elseif x310902_var_SelectButton[GetGUID(varMap, varPlayer)]  == 992 then
		str =format("\t每捐献1个仲夏娱乐币都可以获得极品的经验和个人节日积分，并且有几率获得#G周年庆典纪念章#W。\n\t#R80级以上玩家将额外获得海量天赋值奖励。\n\t你确定要捐献%d个仲夏娱乐币?",idExt)
		end
		
		TalkAppendString(varMap, str)
		StopTalkTask()
		DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310902_var_ScriptId, -1)
    end

end





function x310902_ProcAcceptCheck( varMap, varPlayer, NPCId )
    return 1
end

----------------------------------------------------------------------------------------------
--接受
----------------------------------------------------------------------------------------------
function x310902_ProcAccept( varMap, varPlayer )


	--local itemcount = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local score = 0		
	score = score + 2 
			
          
			
			--SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 1, 2)
			local index = random (1,4)
			--SetCountryParam(varMap, 0, CD_INDEX_LAODONGJIE_JIFEN,index)
			local myGuid = GetPlayerGUID( varMap,varPlayer )
			--GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310902_var_ScriptId, -1, "OnScoreChanged", 3)
			GamePlayScriptLog( varMap, varPlayer, 2509)

			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + score)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", score, score + allscore ), 8, 3)
			AddExp( varMap, varPlayer, allexp)
			Msg2Player( varMap, varPlayer, format( "全服活动积分增加%d点#cffcf00", itemcount).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "全服活动积分增加%d点#cffcf00", itemcount), 8, 3)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp), 8, 3)
			
				
end



function x310902_var_GiveBonus(varMap, varPlayer, varTalknpc, idScript, idExt,varMoonCake,varCount)
--判断日期
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 251 or varday > 268 then   
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 3)
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 2)
		return
	end
--判断等级	
	local level = GetLevel(varMap, varPlayer)
	if level < x310902_var_LimitLevel then
  		return
  end
--判断次数
--	local daycount = x310902_GetDayCount(varMap, varPlayer, varCount)
--	if daycount >= x310902_var_MaxCount then
--		Msg2Player(varMap, varPlayer, "你今天已经捐献100个仲夏娱乐币，请明天再来", 8, 3)
--		Msg2Player(varMap, varPlayer, "你今天已经捐献100个仲夏娱乐币，请明天再来。", 8, 2)
--		return
----	end
--	if varCount > x310902_var_MaxCount-daycount then
--		Msg2Player(varMap, varPlayer, "你今天剩余可捐献次数不足，捐献失败", 8, 3)
--		Msg2Player(varMap, varPlayer, "你今天剩余可捐献次数不足，捐献失败", 8, 2)
--		return
--	end

--判断原材料
	if GetItemCountInBag(varMap, varPlayer, varMoonCake) < varCount then
		 Msg2Player( varMap, varPlayer, "您没有足够的中秋月饼,捐献失败", 8, 3)
	   Msg2Player( varMap, varPlayer, "您没有足够的中秋月饼,捐献失败。", 8, 2)
	    return
	end
	
--判断背包空间	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，捐献中秋月饼需要至少2个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，捐献中秋月饼需要至少2个背包空位", 0, 3)
		return
	end	
--积分清零
		if GetCountryParam(varMap, 3, CD_HUODONG_XINNIAN) ~= 310902 then  --3号国家变量为标志位
			SetCountryParam(varMap, 3, CD_HUODONG_XINNIAN,310902)
			SetCountryParam(varMap, 0, CD_HUODONG_XINNIAN,0)                --清理0号国家变量（存全服积分使用）
			SetCountryParam(varMap, 1, CD_HUODONG_XINNIAN,500) 							--清理1号国家变量，1号变量作为活动触发时间的比对变量使用，所以设为500
------------------------------------------------------------------------不再清理2号国家变量，目前用于存储四级冥铁的当天兑换次数
		end                        
			
	local money =500*varCount
	local tmoney =0
	if varMoonCake >= 12035248 then
		money = money*2
	end
	
	for i=1, varCount do
		local ran =random(100)
		
		if ran <1 then ran =1 end
		if ran >100 then ran =100 end 
		if varMoonCake >= 12035248 then
			ran = ran/2
		end
		if ran <=1 then --5%1两
			local rand =	random(1000)
				if rand <1 then rand =1 end
				if rand >1000 then rand =1000 end 			
				if rand <= 10 then
					tmoney =tmoney + 100000
				elseif rand <= 30 then
						tmoney =tmoney + 50000
				elseif rand <= 63 then
						tmoney =tmoney + 30000
				elseif rand <= 163 then
						tmoney =tmoney + 10000
				elseif rand <=363 then
						tmoney =tmoney + 5000										
				elseif rand <=863 then
						tmoney =tmoney + 2000								
				else
						tmoney = tmoney +1000
				end
		end		
	end
	
	money =money +tmoney
	
	
		
	
	
--	StartItemTask( varMap )
--	
--	ItemAppendBind( varMap, x310902_var_BonusItem, varCount)
--					
--
--		local ret = StopItemTask( varMap, varPlayer )
--		if ret > 0 then
			if DelItem( varMap, varPlayer, varMoonCake, varCount) ~= 1 then 
				return 0
	  	end
	  	
	  	
			WriteLog(1, format("x310902_var_GiveBonus --- PlayerGUID = %u,WorldId = %d,Name = %s,Level = %d,MoonCake = %d,Count =%d,money = %d", GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMoonCake,varCount,money))
--			DeliverItemListSendToPlayer(varMap,varPlayer)
			local str = format("捐献了%d个中秋月饼，获得了#{_MONEY%d}#cffcf00金卡",varCount,money)

			AddMoney( varMap, varPlayer, 3, money ,902) 
			Msg2Player(varMap, varPlayer, str, 8, 3)
			Msg2Player(varMap, varPlayer, str, 8, 2)
			
			if money >50000 then
				local varName = GetName(varMap,varPlayer)
				local str = format("#Y恭喜"..varName.."在月饼寄福活动中获得%d金卡",money/1000)
				LuaAllScenceM2Wrold (varMap, str, 1, 1)
			end
--			--x310902_SetDayCount(varMap, varPlayer, varCount)
			
			--添加节日积分奖励
			local Sindex =-1
			local ran =-1
			local Rindex =-1
			if varMoonCake <=	12035247 then
				Sindex = 1
			else
				Sindex = 2
			end
					
			ran = random(100)
			if Rindex < 1 then 	Rindex =1 end	
			if Rindex > 100 then 	Rindex =100 end			
			
			if ran <= 70 then
				Rindex =1
			elseif ran >80 then 
				Rindex =3
			else
				Rindex =1
			end					
			score = x310902_var_JieriScore[Sindex][Rindex]	* varCount
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + score)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", score, score + allscore ), 8, 3)	

			
--		else
--			local str = "#Y背包空间不足，请整理背包后再试！"
--			Msg2Player(varMap, varPlayer, str, 8, 3)
--			Msg2Player(varMap, varPlayer, str, 8, 2)
--			return
--		end
end
----------------------------------------------------------------------------------------------
--放弃
----------------------------------------------------------------------------------------------
function x310902_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

----------------------------------------------------------------------------------------------
--继续
----------------------------------------------------------------------------------------------
function x310902_OnContinue( varMap, varPlayer, varTalknpc )

end

----------------------------------------------------------------------------------------------
--检测是否可以捐献
----------------------------------------------------------------------------------------------
function x310902_CheckSubmit( varMap, varPlayer )

end

----------------------------------------------------------------------------------------------
--捐献
----------------------------------------------------------------------------------------------
function x310902_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, MissionId )

end

----------------------------------------------------------------------------------------------
--杀死怪物或玩家
----------------------------------------------------------------------------------------------
function x310902_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )
end

----------------------------------------------------------------------------------------------
--进入区域事件
----------------------------------------------------------------------------------------------
function x310902_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

----------------------------------------------------------------------------------------------
--道具改变
----------------------------------------------------------------------------------------------
function x310902_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
function x310902_GetDayCount(varMap, varPlayer)
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if lastday ~= today then
		return 0 
	end

	local daycount =  GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
	return daycount
end

---------------------------------------------------------------------------------------------------
--更新当天接任务次数
---------------------------------------------------------------------------------------------------
function x310902_SetDayCount(varMap, varPlayer, itemcount)
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], itemcount)
	else
		local daycount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], daycount+itemcount)
	end
end
----------------------------------------------------------------------------------------------
function x310902_OnScoreChanged(varMap, guid, missionData)
local mapindex = GetCountryParam(varMap, 0, CD_INDEX_LAODONGJIE_JIFEN)
if mod(missionData, 10000) == 0 then
		if varMap == x310902_var_varMap[mapindex].varid then
			local msg1 = format("全服活动活动积分到%d分，九旄战神出现在%s！",missionData,x310902_var_varMap[mapindex].varname)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1)
  		SetSystemTimerTick( varMap, 310902, "ProcTimerDoingStart", 22, 5*1000 )
  	end
  	
		
	elseif mod(missionData, 500) == 0 then
		if varMap ==0 then
			SetGrowPointIntervalContainer( varMap, x310902_var_GrowpointId, 1000)
			local msg1 = format("全服活动活动积分到%d分，大量宝箱出现在大都！",missionData)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1)
		end
	end
end
function x310902_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
			local Monstertype  = x310902_var_Jiumao[random(1,3)]
			local index = x310902_GetMapIndex(varMap)
			local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
			if index >= 1 and index <= 4 then
				CreateMonster( varMap, Monstertype, x310902_var_varMap[index].varX, x310902_var_varMap[index].varY, 1, 952, -1, -1, 21, 60*60*1000, 0, "")
				WriteLog(1,format("x310902_ProcTimerDoingStart,score--%d,varMap---%d",score,varMap)) 
			end
end

function x310902_GetMapIndex(varMap)
		for i, item in x310902_var_varMap do 
			if item.varid == varMap then
				return i
			end
		end
	return -1
end
