--欢乐集气

x310830_var_ScriptId 		= 310830
x310830_var_MissionKind 	= 	1                       --任务类型
x310830_var_MissionName		= "【个人】欢乐集气一"
x310830_var_MissionName1	= "【个人】欢乐集气二"
x310830_var_MissionName2	= "【个人】欢乐集气三"


-- 玩法开关id
x310830_var_IsEnableId    = 1089
x310830_var_LimitLevel	= 40			--最低级别

x310830_var_MaxCount		= 150

x310830_var_SelectButton ={}

x310830_var_SubmitItem	= 12500307		--仲夏娱乐币
x310830_var_Jiumao = {27301,27302,27303}

x310830_var_BonusZifu	= {12500311,12500312,12500313,12500314,12500305,12500306,12500315,12500316}   --字符
x310830_var_GrowpointId = 145 
x310830_var_BonusItem 	= {{itemid = -1,rnd = 5}}   --时装藏宝图
x310830_var_varMap = {
{varid = 36, varX =98, varY =180, varname = "大都南"},
{varid = 37, varX =94, varY =48, varname = "大都东" },
{varid = 38, varX =111, varY =77, varname = "大都西"},
{varid = 15, varX =168, varY =82, varname = "威海港"},
}
x310830_var_ExpParam  = {
{Expmulti =2   ,probability =1  },
{Expmulti =1.5 ,probability =1  },
{Expmulti =1.1 ,probability =1  },
{Expmulti =0.9 ,probability =1  },
{Expmulti =0.7 ,probability =1  },
{Expmulti =0.3 ,probability =1  },
{Expmulti =0.25,probability =94 },
}

x310830_var_ExpParam1  = {
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

----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310830_ProcEnumEvent( varMap, varPlayer, varTalknpc, MissionId )
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2012 or varday < 207 or varday > 242 then   --2012年7月26日到8月30日(体服从2011-7-9开放)
				return
	end
	local level = GetLevel(varMap, varPlayer)
	if GetGameOpenById( x310830_var_IsEnableId) <= 0 then
        return
  end
  
  if level < x310830_var_LimitLevel then
  		return
  end
		TalkAppendButton(varMap,x310830_var_ScriptId, x310830_var_MissionName,  3, 990)
		TalkAppendButton(varMap,x310830_var_ScriptId, x310830_var_MissionName1, 3, 991)
		TalkAppendButton(varMap,x310830_var_ScriptId, x310830_var_MissionName2, 3, 992)
		TalkAppendButton(varMap, x310830_var_ScriptId, "节日积分商店", 10, 6)
		TalkAppendButton(varMap,x310830_var_ScriptId, "个人节日积分查询", 3, 2)
		TalkAppendButton(varMap, x310830_var_ScriptId, "全服活动积分查询", 3, 4)
		TalkAppendButton(varMap, x310830_var_ScriptId, "仲夏狂欢活动说明", 13, 7)
end

----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310830_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	local daycount,wheelcount = x310830_GetDayCount(varMap, varPlayer, itemcount)
	local times = x310830_var_MaxCount - (wheelcount*50)  - daycount
	local str = format("\n#G小提示：你今天还可以捐献#R%d#G个仲夏娱乐币,本轮还可以捐献#R%d#G个仲夏娱乐币。",times,(50-daycount))
	if GetGameOpenById( x310830_var_IsEnableId) <= 0 then
     return
  end
    if idExt == 990 then
    	if wheelcount == 1 then
    		Msg2Player(varMap, varPlayer, "你今天已经捐献50个仲夏娱乐币，你可以选择【个人】欢乐集气二继续捐献！", 8, 3)
    		return
    	elseif wheelcount == 2 then
    		Msg2Player(varMap, varPlayer, "你今天已经捐献100个仲夏娱乐币，你可以选择【个人】欢乐集气三继续捐献！", 8, 3)
    		return	
    	elseif wheelcount == 3 then
    		Msg2Player(varMap, varPlayer, "你今天已经捐献150个仲夏娱乐币，请明天再来", 8, 3)
    		return		
    	end
    elseif idExt == 991 then
    	if wheelcount == 0 then
    		Msg2Player(varMap, varPlayer, "你需要选择【个人】欢乐集气一捐献50个仲夏娱乐币后才能使用此功能！", 8, 3)
    		return
    	elseif wheelcount == 2 then
    		Msg2Player(varMap, varPlayer, "你今天已经捐献100个仲夏娱乐币，你可以选择【个人】欢乐集气三继续捐献！", 8, 3)
    		return
    	elseif wheelcount == 3 then
    		Msg2Player(varMap, varPlayer, "你今天已经捐献150个仲夏娱乐币，请明天再来", 8, 3)
    		return	
    	end
   elseif idExt == 992 then
   		if wheelcount == 0 then
    		Msg2Player(varMap, varPlayer, "你需要选择【个人】欢乐集气一和二捐献100个仲夏娱乐币后才能使用此功能！", 8, 3)
    		return
    	elseif wheelcount == 1 then
    		Msg2Player(varMap, varPlayer, "你需要选择【个人】欢乐集气二捐献100个仲夏娱乐币后才能使用此功能！", 8, 3)
    		return
    	elseif wheelcount == 3 then
    		Msg2Player(varMap, varPlayer, "你今天已经捐献150个仲夏娱乐币，请明天再来", 8, 3)
    		return
    	end
    end
    if idExt >= 990 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y".."【个人】欢乐集气")
    	TalkAppendString(varMap,"\t喜兽年年来,祝福天天伴.在这仲夏狂欢的欢乐日子里,#B@myname#W你的全服活动愿望是什么呢?")
    	TalkAppendString(varMap,str)
    	TalkAppendButton(varMap, x310830_var_ScriptId, "捐献1个仲夏娱乐币", 3, 1)
    	TalkAppendButton(varMap, x310830_var_ScriptId, "捐献5个仲夏娱乐币", 3, 5)
    	TalkAppendButton(varMap, x310830_var_ScriptId, "捐献10个仲夏娱乐币", 3, 10)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    	
    	x310830_var_SelectButton[GetGUID(varMap, varPlayer)] = idExt  --记录玩家点击的选项
    	
    elseif 	idExt == 2 then 
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
			TalkAppendString(varMap, "\t当前活动积分是:#G"..score.."\n \n\t#W当积分到达300及300的整数倍时，大都会刷出大量宝箱。\n\t当积分到达3000及3000的整数倍时，将在大都附近刷出掉落极品坐骑的九旄战神。\n \n#G注：每次只会触发一个事件。") 
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    elseif 	idExt == 6 then 
    	DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    elseif 	idExt == 7 then 
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."仲夏狂欢节说明".."#W\n")
			TalkAppendString(varMap, "\t激情仲夏，欢乐无限。成吉思汗与广大忠实玩家携手走过了两年的岁月，为答谢大家的厚爱和一直不懈的支持，特举办仲夏狂欢节，与大家一起在这激情的时光里狂欢，让我们一起携手续写辉煌，相伴到永远。") 
			TalkAppendButton(varMap, x310830_var_ScriptId, "仲夏庆典活动说明", 13, 110)
			TalkAppendButton(varMap, x310830_var_ScriptId, "仲夏嘉年华活动说明", 13, 111)
    	TalkAppendButton(varMap, x310830_var_ScriptId, "捐献娱乐币活动说明", 13, 112)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    elseif  idExt == 110 then
   		StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y仲夏庆典活动说明" )
           TalkAppendString( varMap, "1、活动开放时间：\n\t#G7月26日-8月30号#W期间，全天任意时间都可以提交仲夏庆典纪念章兑换仲夏庆典礼包。" )
           TalkAppendString( varMap, "2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。" )
           TalkAppendString( varMap, "3、活动内容：\n\t活动时间内提交不同的纪念章可以获得#G仲夏庆典大礼包#W和#G火狐盛典礼包#W。\n\t提交2个不同的纪念章可以获得1个仲夏庆典大礼包\n\t提交4个不同的纪念章可以获得2个仲夏庆典大礼包\n\t提交6个不同的纪念章可以获得6个仲夏庆典大礼包\n\t提交8个不同的纪念章可以获得10个仲夏庆典大礼包和1个火狐盛典礼包。\n\t#G活动提示：打开火狐盛典礼包将获得一个#R火尾天狐降世符#W。" )
      StopTalkTask()
      DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
    elseif  idExt == 111 then
    	StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y仲夏嘉年华活动说明" )
           TalkAppendString( varMap, "1、活动开放时间：\n\t#G7月26日-8月30号#W期间，每天的15：00到15：30和21：00到21：30开放。" )
           TalkAppendString( varMap, "2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。" )
           TalkAppendString( varMap, "3、活动内容：\n\t活动时间内天上人间·麒麟和天上人间·梦聊的人们将组成仲夏狂欢团携带大量礼物前来与大家一起狂欢，他们的队伍将从大都南到大都中心城的入口一直游行到皇城入口，沿途将随机给大家洒狂欢节礼品。惊喜多多，不容错过。" )
      StopTalkTask()
      DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
    elseif  idExt == 112 then
    	StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y捐献娱乐币活动说明" )
			 		 TalkAppendString(varMap, "1、活动开放时间：\n\t#G7月26日-8月30号#W期间，我这里将限量售卖仲夏娱乐币。全天任意时间均可以参与仲夏狂欢活动。") 
			 		 TalkAppendString(varMap,"2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。")
			 		 TalkAppendString(varMap,"3、活动内容：\n\t活动开放时间，玩家每天可以提交150个仲夏娱乐币。")
			 		 TalkAppendString(varMap,"\t选择#G【个人】欢乐集气一#W可以提交50个娱乐币，获得大笔的经验奖励、个人积分和全服积分。捐满50个后，可以选择#G【个人】欢乐集气二#W继续捐献。")
			 		 TalkAppendString(varMap,"\t选择#G【个人】欢乐集气二#W可以提交50个娱乐币，有几率获得#R海量经验#W奖励，同时获得天赋值、个人积分和全服积分的奖励。捐满50个后，可以选择#G【个人】欢乐集气三#W继续捐献。")
    	 		 TalkAppendString(varMap,"\t选择#G【个人】欢乐集气三#W可以提交50个娱乐币，有几率获得#R极品经验#W，同时获得天赋值、个人积分和全服积分的奖励。\n\t每捐献一个娱乐币都有几率获得#R成吉思汗仲夏庆典#W字样的限量纪念章,可以在#G成吉思汗仲夏庆典#W活动中兑换#R仲夏庆典大礼包#W和#R火狐盛典礼包#W。")
    	 		 TalkAppendString(varMap,"\t当全服积分达到300及300的整数倍时，在大都场景内刷出大量宝箱，玩家采集将有几率获得天赋、荣誉、帮贡、经验或银卡的奖励。\n\n\t当全服积分到达3000及3000的整数倍时，将随机在大都东、大都南、大都西和威海港中一个场景刷出一只掉落极品坐骑的九旄战神。")
      StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    else
    	SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
    	
		StartTalkTask(varMap)          
		TalkAppendString(varMap, "#Y".."【个人】欢乐集气".."#W")
		
		local str 
		if x310830_var_SelectButton[GetGUID(varMap, varPlayer)]  == 990 then
		str =format("\t每捐献1个仲夏娱乐币都可以获得大笔的经验和个人节日积分，并且有几率获得#G仲夏庆典纪念章#W。\n\t你确定要捐献%d个仲夏娱乐币?",idExt)
		elseif x310830_var_SelectButton[GetGUID(varMap, varPlayer)]  == 991 then
		str =format("\t每捐献1个仲夏娱乐币都可以获得海量的经验和个人节日积分，并且有几率获得#G仲夏庆典纪念章#W。\n\t#R80级以上玩家将额外获得大量天赋值奖励。#W\n\t你确定要捐献%d个仲夏娱乐币?",idExt)
		elseif x310830_var_SelectButton[GetGUID(varMap, varPlayer)]  == 992 then
		str =format("\t每捐献1个仲夏娱乐币都可以获得极品的经验和个人节日积分，并且有几率获得#G仲夏庆典纪念章#W。\n\t#R80级以上玩家将额外获得海量天赋值奖励。\n\t你确定要捐献%d个仲夏娱乐币?",idExt)
		end
		
		TalkAppendString(varMap, str)
		StopTalkTask()
		DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310830_var_ScriptId, -1)
    end
end

function x310830_ProcAcceptCheck( varMap, varPlayer, NPCId )
    return 1
end

----------------------------------------------------------------------------------------------
--接受
----------------------------------------------------------------------------------------------
function x310830_ProcAccept( varMap, varPlayer )
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2012 or varday < 207 or varday > 242 then   --2011年7月26日到8月30日(体服从2011-7-9开放)
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 3)
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 2)
		return
	end
	local level = GetLevel(varMap, varPlayer)
	if level < x310830_var_LimitLevel then
  		return
  end

	local itemcount = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local daycount = x310830_GetDayCount(varMap, varPlayer, itemcount)
	local score = 0
	
	if daycount >= x310830_var_MaxCount then
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个仲夏娱乐币，请明天再来", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个仲夏娱乐币，请明天再来。", 8, 2)
		return
	end
	
	if itemcount > 50-daycount then
		Msg2Player(varMap, varPlayer, "本轮次可捐献次数不足，捐献失败", 8, 3)
		Msg2Player(varMap, varPlayer, "本轮次可捐献次数不足，捐献失败", 8, 2)
		return
	end
	
	if itemcount > x310830_var_MaxCount-daycount then
		Msg2Player(varMap, varPlayer, "你今天剩余可捐献次数不足，捐献失败", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天剩余可捐献次数不足，捐献失败", 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，欢乐集气需要至少2个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，欢乐集气需要至少2个背包空位", 0, 3)
		return
	end
	
	if GetItemCountInBag(varMap, varPlayer, x310830_var_SubmitItem) < itemcount then
		 Msg2Player( varMap, varPlayer, "您没有足够的仲夏娱乐币,捐献失败", 8, 3)
	    Msg2Player( varMap, varPlayer, "您没有足够的仲夏娱乐币,捐献失败。", 8, 2)
	    return
	end
	
	local level = GetLevel(varMap, varPlayer)
	  
	StartItemTask( varMap )
	local c = 0
	local index = 0  
	local varRandom  = nil
	for i = 1, itemcount do
	
		local rnd = random(1, 100)
		
		for j, item in x310830_var_BonusItem do
			if item.itemid ~= -1 then
				if rnd <= item.rnd then
						local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x310830_var_SubmitItem)
						if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
							ItemAppendBind( varMap, item.itemid, 1)
						else
							ItemAppend( varMap, item.itemid, 1)
						end
					c = c + 1
					break
				end
			end
		end
		GamePlayScriptLog(varMap, varPlayer, 2530)
		 
		index = 0
		varRandom =random(1,150)
		if varRandom <= 1 then
			index = random(1,7)                          --10%产出除了前7个字符，此活动不在产出典字
		elseif varRandom <= 10 then
			index = random(1,7)
		end
		if index >= 1 and index <= 8 then
			local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x310830_var_SubmitItem)    --根据娱乐币是否绑定给与不同的字符
			if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
				ItemAppendBind( varMap, x310830_var_BonusZifu[index], 1)
			else
				ItemAppend( varMap, x310830_var_BonusZifu[index], 1)
			end
			c = c + 1
		end
		
	end
	
	local ret = StopItemTask( varMap, varPlayer )
	
	if ret > 0 then
	
		if DelItem( varMap, varPlayer, x310830_var_SubmitItem, itemcount) ~= 1 then 
			return 0
  	end
		
		if c >0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		end
		x310830_SetDayCount(varMap, varPlayer, itemcount)
		
		
		
	else
		local str = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, str, 8, 3)
		Msg2Player(varMap, varPlayer, str, 8, 2)
		return
	end
	
	local allexp = 0
	local Allbonusinherence = 0 
	local bonusinherence = 0	      	
	for i = 1, itemcount do	
			local Expmulti = 1
			local varmin   = 1 
			local varmax   = 1 
			bonusinherence = 0 
			local level = GetLevel(varMap, varPlayer)
		  local varprobability =  random (1, 100)
			if x310830_var_SelectButton[GetGUID(varMap, varPlayer)]  == 990 then
			
				Expmulti = 1
				bonusinherence = 0
			
			elseif x310830_var_SelectButton[GetGUID(varMap, varPlayer)]  == 991 then
			
				for i, iter in x310830_var_ExpParam1 do
					varmax = varmax + iter.probability
					if varprobability >= varmin and varprobability < varmax then
					    Expmulti = iter.Expmulti
					    break
					end
				end
				if level >= 80 then
					bonusinherence = 40
				end
			
			elseif x310830_var_SelectButton[GetGUID(varMap, varPlayer)]  == 992 then
			
				for i, iter in x310830_var_ExpParam do
					varmax = varmax + iter.probability
					if varprobability >= varmin and varprobability < varmax then
					    Expmulti = iter.Expmulti
					    break
					end
				end
				
				if level >= 80 then
					bonusinherence = 60
				end
			
			end
				
			local exp = random(7, 11)
			if level <=70 then
				exp = exp*360*level
			elseif level <=80 then
				exp = exp*648*level
			elseif level <=90 then
				exp = exp*1296*level
			else
				exp = exp*1680*level 
			end
			allexp = allexp+exp*Expmulti
			score = score + 2 
			Allbonusinherence = Allbonusinherence + bonusinherence
			
			if GetCountryParam(varMap, 3, CD_HUODONG_XINNIAN) ~= 310830 then     --3号国家变量为标志位
				SetCountryParam(varMap, 3, CD_HUODONG_XINNIAN,310830)
				SetCountryParam(varMap, 0, CD_HUODONG_XINNIAN,0)                   --清理0号国家变量（存全服积分使用）
				SetCountryParam(varMap, 1, CD_HUODONG_XINNIAN,300) 							--清理1号国家变量，1号变量作为活动触发时间的比对变量使用，所以设为300
--				SetCountryParam(varMap, 2, CD_HUODONG_XINNIAN,0) 								--不再清理2号国家变量，目前用于存储四级冥铁的当天兑换次数
			end                                    
			
			SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 1, 2)
			local index = random (1,4)
			SetCountryParam(varMap, 0, CD_INDEX_LAODONGJIE_JIFEN,index)
			local myGuid = GetPlayerGUID( varMap,varPlayer )
			GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310830_var_ScriptId, -1, "OnScoreChanged", 3)
			GamePlayScriptLog( varMap, varPlayer, 2509)
	end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + score)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", score, score + allscore ), 8, 3)
			AddExp( varMap, varPlayer, allexp)
			Msg2Player( varMap, varPlayer, format( "全服活动积分增加%d点#cffcf00", itemcount).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "全服活动积分增加%d点#cffcf00", itemcount), 8, 3)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp), 8, 3)
			
			if bonusinherence > 0 then
				local refixInh = AddInherenceExp(varMap, varPlayer, Allbonusinherence)
				Msg2Player( varMap, varPlayer, format( "获得#R天赋%d点#cffcf00的奖励", refixInh).."。", 8, 2)
				Msg2Player( varMap, varPlayer, format( "获得#R天赋%d点#cffcf00的奖励", refixInh), 8, 3)
			end
				
end

----------------------------------------------------------------------------------------------
--放弃
----------------------------------------------------------------------------------------------
function x310830_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

----------------------------------------------------------------------------------------------
--继续
----------------------------------------------------------------------------------------------
function x310830_OnContinue( varMap, varPlayer, varTalknpc )

end

----------------------------------------------------------------------------------------------
--检测是否可以捐献
----------------------------------------------------------------------------------------------
function x310830_CheckSubmit( varMap, varPlayer )

end

----------------------------------------------------------------------------------------------
--捐献
----------------------------------------------------------------------------------------------
function x310830_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, MissionId )

end

----------------------------------------------------------------------------------------------
--杀死怪物或玩家
----------------------------------------------------------------------------------------------
function x310830_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )
end

----------------------------------------------------------------------------------------------
--进入区域事件
----------------------------------------------------------------------------------------------
function x310830_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

----------------------------------------------------------------------------------------------
--道具改变
----------------------------------------------------------------------------------------------
function x310830_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
function x310830_GetDayCount(varMap, varPlayer)
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if lastday ~= today then
		return 0 , 0
	end

	local daycount =  GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
	local wheelcount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_DUIHUANWHEEL[1], MD_HUODONG_DUIHUANWHEEL[2], MD_HUODONG_DUIHUANWHEEL[3])
		
		if daycount >= 50 then
			SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], 0)
			if wheelcount < 3 then
				SetPlayerGameData(varMap, varPlayer, MD_HUODONG_DUIHUANWHEEL[1], MD_HUODONG_DUIHUANWHEEL[2], MD_HUODONG_DUIHUANWHEEL[3], wheelcount+1)
			end 
		end
		
	local daycount =  GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
	local wheelcount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_DUIHUANWHEEL[1], MD_HUODONG_DUIHUANWHEEL[2], MD_HUODONG_DUIHUANWHEEL[3])


	return daycount,wheelcount
end

---------------------------------------------------------------------------------------------------
--更新当天接任务次数
---------------------------------------------------------------------------------------------------
function x310830_SetDayCount(varMap, varPlayer, itemcount)
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], itemcount)
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_DUIHUANWHEEL[1], MD_HUODONG_DUIHUANWHEEL[2], MD_HUODONG_DUIHUANWHEEL[3], 0)
	else
		local daycount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
		local wheelcount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_DUIHUANWHEEL[1], MD_HUODONG_DUIHUANWHEEL[2], MD_HUODONG_DUIHUANWHEEL[3])
		if daycount < 49 then
			SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], daycount+itemcount)
		else
			SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], 0)
			if wheelcount < 3 then
				SetPlayerGameData(varMap, varPlayer, MD_HUODONG_DUIHUANWHEEL[1], MD_HUODONG_DUIHUANWHEEL[2], MD_HUODONG_DUIHUANWHEEL[3], wheelcount+1)
			end
		end
	end
end
----------------------------------------------------------------------------------------------
function x310830_OnScoreChanged(varMap, guid, missionData)
local mapindex = GetCountryParam(varMap, 0, CD_INDEX_LAODONGJIE_JIFEN)
if mod(missionData, 3000) == 0 then
		if varMap == x310830_var_varMap[mapindex].varid then
			local msg1 = format("全服活动活动积分到%d分，九旄战神出现在%s！",missionData,x310830_var_varMap[mapindex].varname)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1)
  		SetSystemTimerTick( varMap, 310830, "ProcTimerDoingStart", 22, 5*1000 )
  	end
  	
		
	elseif mod(missionData, 300) == 0 then
		if varMap ==0 then
			SetGrowPointIntervalContainer( varMap, x310830_var_GrowpointId, 1000)
			local msg1 = format("全服活动活动积分到%d分，大量宝箱出现在大都！",missionData)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1)
		end
	end
end
function x310830_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
			local Monstertype  = x310830_var_Jiumao[random(1,3)]
			local index = x310830_GetMapIndex(varMap)
			local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
			if index >= 1 and index <= 4 then
				CreateMonster( varMap, Monstertype, x310830_var_varMap[index].varX, x310830_var_varMap[index].varY, 1, 952, -1, -1, 21, 60*60*1000, 0, "")
				WriteLog(1,format("x310830_ProcTimerDoingStart,score--%d,varMap---%d",score,varMap)) 
			end
end

function x310830_GetMapIndex(varMap)
		for i, item in x310830_var_varMap do 
			if item.varid == varMap then
				return i
			end
		end
	return -1
end
