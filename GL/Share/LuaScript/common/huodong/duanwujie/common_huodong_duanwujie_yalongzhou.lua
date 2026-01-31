--DECLARE_QUEST_INFO_START--
x302523_var_FileId = 302523

x302523_var_huodong = "龙舟飞渡大赛"
x302523_var_QuestName1={"我支持烈火队！","我支持宝蓝队！","我支持翠杉队！","我支持岩锋队！"}
x302523_var_QuestName2={
	"\t烈火队光从名字就能感受到队伍的激情，烈火队的火拼干劲儿是无人能比的，破釜沉舟，拼搏到底是烈火队夺冠法宝！",
	"\t宝蓝队向来是以坚持不懈着称，在比赛中，绝不会因为外界因素而产生任何动摇，认准终点，勇往直前是宝蓝夺取冠军的秘诀！",
	"\t翠杉队以巧着称，虽然从外表来看都不如其他队伍那么有拼劲儿，使用最有效率的方法做到最好的也使得翠杉队有勇夺冠军的实力！",
	"\t岩峰队如岩石一般稳重，脚踏实地，一步一个脚印是岩峰队的作风，无论出现什么状况，岩峰队都能稳住阵脚，军心不乱，是很有希望夺冠的队伍！",
}
x302523_var_Questshuoming = "\n\t为了感谢你的热情，每献一杯酒我们会返给你#R500文金卡#W更有几率额外获得#R修行草囊、募集箱、生命神露#W！如果我们队伍能在当天比赛勇夺冠军，那还能额外再获得每杯酒#R500文#W金卡的奖励！每人每天最多一共献上#R1000杯#W雄黄酒。"
x302523_var_duizhangobj = {400777,400778,400779,400780}
x302523_var_shuliang = {"献上一杯雄黄酒","敬上五杯雄黄酒","干掉全部雄黄酒"}
--DECLARE_QUEST_INFO_STOP--
x302523_var_Maxcount = 1000
x302523_var_wineitemid = 12110215
x302523_var_MD = {MD_DUANWUJIE_COUNT1,MD_DUANWUJIE_COUNT2,MD_DUANWUJIE_COUNT3,MD_DUANWUJIE_COUNT4}
x302523_var_xianjiuItem={12035283,12035284,12035286}
x302523_var_FeastId = 13

function x302523_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if x302523_var_FeastId ~= MD_CURRENT_FEAST_ID then return end
	
	local mintime = GetMinOfDay()
	if mintime < 18*60 or mintime >= (19*60+50) then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x302523_var_huodong)
		TalkAppendString(varMap,"\n\t龙舟飞渡大赛加油助威活动在#R18:00#W~#R19:50#W期间举行，请您在此时间段内参与活动！")
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
		return 
	end
	
	for k,v in x302523_var_duizhangobj do
		if FindMonsterByGUID(varMap,v) == varTalknpc then
			TalkAppendButton(varMap, x302523_var_FileId, x302523_var_QuestName1[k],16,1)
			break
		end
	end

end


function x302523_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	local feastid = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
	if feastid < x302523_var_FeastId then
		LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x302523_var_FeastId)
		SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,x302523_var_FeastId)				
	end

	local mintime = GetMinOfDay()
	if mintime < 18*60 or mintime >= (19*60+50) then 
		Msg2Player(varMap, varPlayer, "比赛已开始，无法再对参赛队伍献酒。", 0, 3)
		return 
	end
	
	for k,v in x302523_var_duizhangobj do
		if FindMonsterByGUID(varMap,v) == varTalknpc then
			local day = GetDayOfYear()
			if x302523_GetMD(varMap, varPlayer,MD_DUANWUJIE_DATE) ~= day then
				x302523_SetMD(varMap, varPlayer,MD_DUANWUJIE_DATE,day)
				x302523_SetMD(varMap, varPlayer,x302523_var_MD[1],0)
				x302523_SetMD(varMap, varPlayer,x302523_var_MD[2],0)
				x302523_SetMD(varMap, varPlayer,x302523_var_MD[3],0)
				x302523_SetMD(varMap, varPlayer,x302523_var_MD[4],0)
			end
		end
	end
	
	if extid == 1 then
		
		for k,v in x302523_var_duizhangobj do
			if FindMonsterByGUID(varMap,v) == varTalknpc then
				local count = x302523_GetMD(varMap, varPlayer,x302523_var_MD[k])
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x302523_var_huodong)
				TalkAppendString(varMap,x302523_var_QuestName2[k]..x302523_var_Questshuoming.."\n\t你已经为该队献酒#R"..count.."#W杯。")
				for k,v in x302523_var_shuliang do
					TalkAppendButton(varMap, x302523_var_FileId, x302523_var_shuliang[k],1,10+k)
				end
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer,varTalknpc)
				break
			end
		end
		
	
		
	elseif extid >= 10 then
		
		if GetBagSpace(varMap,varPlayer) <= 1 then
			Msg2Player(varMap, varPlayer, "背包空间不足！", 0, 3)
			return 
		end
		
		--判断当前为哪个国家的NPC
		local country = -1
		for k,v in x302523_var_duizhangobj do
				if FindMonsterByGUID(varMap,v) == varTalknpc then
					country = k
					break
				end
		end
		--获取道具数量
		local itemcount = GetItemCountInBag(varMap, varPlayer,x302523_var_wineitemid)
		if itemcount < 1 then 
			Msg2Player(varMap, varPlayer, "你身上没有雄黄酒，无法为该队加油打劲儿！", 0, 3)
			return
		end
		--判断道具是否已达上线
		local count = x302523_GetMD(varMap, varPlayer,x302523_var_MD[1])+x302523_GetMD(varMap, varPlayer,x302523_var_MD[2])+x302523_GetMD(varMap, varPlayer,x302523_var_MD[3])+x302523_GetMD(varMap, varPlayer,x302523_var_MD[4])
		if count >= 1000 then 
			Msg2Player(varMap, varPlayer, "你为参赛队伍打气已经喝了不少雄黄酒了，再多喝可能会中毒了！", 0, 3)
			return
		end
		local countrycount = x302523_GetMD(varMap, varPlayer,x302523_var_MD[country])
		local delitemcount = 0
		if extid == 13 then
			if itemcount <=1000-count then
				delitemcount = itemcount
			else
				delitemcount = 1000-count
			end
		elseif extid == 11 then
			delitemcount = 1
		elseif extid == 12 then
			if count >= 995 then 
				Msg2Player(varMap, varPlayer, "你为参赛队伍打气已经喝了不少雄黄酒了，再多喝可能会中毒了！", 0, 3)
				return
			end
			if itemcount >=5 then
				delitemcount = 5
			else
				Msg2Player(varMap, varPlayer, "你身上雄黄酒不足5个，无法为该队加油打劲儿！", 0, 3)
				return
			end
		end
		local day = GetDayOfYear()
		local rec = DelItem(varMap,varPlayer,x302523_var_wineitemid,delitemcount)

		if rec > 0 then
		
			local countrycount = x302523_GetMD(varMap, varPlayer,x302523_var_MD[country])
			if x302523_GetMD(varMap, varPlayer,MD_DUANWUJIE_DATE) ~= day then
				x302523_SetMD(varMap, varPlayer,x302523_var_MD[country],countrycount+delitemcount)
				x302523_SetMD(varMap, varPlayer,MD_DUANWUJIE_DATE,day)
			else
				x302523_SetMD(varMap, varPlayer,x302523_var_MD[country],countrycount+delitemcount)
			end
			AddMoney(varMap, varPlayer,3,delitemcount*500)
			
			if extid == 13 then
				Msg2Player(varMap, varPlayer, "你豪爽的干掉所有雄黄酒，参赛队伍士气大增！", 0, 3)
			elseif extid == 12 then
				Msg2Player(varMap, varPlayer, "你痛饮五杯雄黄酒，参赛队伍气势昂扬！", 0, 3)
			elseif extid == 11 then
				Msg2Player(varMap, varPlayer, "你一口喝下这杯雄黄酒，参赛队伍叫好声一片！", 0, 3)
			end
			
			Msg2Player(varMap, varPlayer, format("为了感谢你的支持，你获得了#{_MONEY%d}金卡",delitemcount*500), 0, 3)
			for tempval = 1 ,delitemcount ,1 do
				if country == 0 then
				GamePlayScriptLog( varMap, varPlayer, 3808)
				elseif country == 1 then
				GamePlayScriptLog( varMap, varPlayer, 3809)
				elseif country == 2 then
				GamePlayScriptLog( varMap, varPlayer, 3810)
				elseif country == 3 then
				GamePlayScriptLog( varMap, varPlayer, 3811)
				end
			end
			
			local tempcount = {0,0,0}

			for i=1,delitemcount,1 do
				local itemran = random(1000)
				if itemran <= 3 then
					local temp =random(3)
					tempcount[temp] = tempcount[temp] +1
				end
			end
			if tempcount[1] ~=0 or tempcount[2] ~=0 or tempcount[3] ~=0 then
			GamePlayScriptLog( varMap, varPlayer, 3807)
			StartItemTask(varMap)
			
			for k,v in tempcount do
				if v > 0 then
					ItemAppendBind( varMap, x302523_var_xianjiuItem[k], v)
				end
			end
			
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				for k,v in tempcount do
				if v > 0 then
				Msg2Player(varMap, varPlayer, format("你意外的获得了@item_%d",x302523_var_xianjiuItem[k]), 0, 3)
				end
				end
			end
			end
		end
		
		--刷新面板数据
		for k,v in x302523_var_duizhangobj do
			if FindMonsterByGUID(varMap,v) == varTalknpc then
				local count1 = x302523_GetMD(varMap, varPlayer,x302523_var_MD[k])
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x302523_var_huodong)
				TalkAppendString(varMap,x302523_var_QuestName2[k]..x302523_var_Questshuoming.."\n\t你已经为该队献酒#R"..count1.."#W杯。")
				for k,v in x302523_var_shuliang do
					TalkAppendButton(varMap, x302523_var_FileId, x302523_var_shuliang[k],1,10+k)
				end
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer,varTalknpc)
				break
			end
		end
	
	end
	
end

function x302523_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x302523_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
