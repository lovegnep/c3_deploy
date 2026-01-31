----春节活动之神秘商人

x310807_g_ScriptId = 310807;
x310807_g_GameOpenId = 1079;
x310807_g_ShopIndexList = { 1, 2, 3, 4, 5 }; --5个等级商店的index
x310807_g_JifenRange = { 16000, 32000, 50000, 65000, 82000 }; --提前开对应商店的积分上限
x310807_g_MissionName = "新春神秘商店"
x310807_g_NPCGuids = { 141113,141114,141115,141116,141117 }

--**********************************

--任务入口函数

--**********************************

function x310807_ProcEventEntry(sceneId, selfId, targetId, scriptId, extId)	--点击该任务后执行此脚本

	if extId == 0 then
	--检查活动是否开启

		if x310807_g_GameOpenId > 0 and GetGameOpenById( x310807_g_GameOpenId ) <= 0 then
	      return
	  end
		
		--找到该npc对应商店在数组中的index
		local npcGuid = GetMonsterGUID( sceneId, targetId );
		local shopIndex = nil;
		for i, item in x310807_g_NPCGuids do
			if item == npcGuid then
				shopIndex = i
				break
			end
		end
		
		if shopIndex == nil then
			return
		end
		
		local bOpen = x310807_IsInValidPeriod( sceneId, shopIndex );	
		
		if bOpen == 0 then
			Msg2Player(sceneId,selfId,"很抱歉，此商店不在开放期间！",8,3)
			return
		end
		DeliverDynamicShopItem(sceneId, selfId, targetId, x310807_g_ShopIndexList[shopIndex] )
	elseif extId == 1 then
			local jifen = GetCountryParam( sceneId, 3,  CD_HUODONG_XINNIAN );
			if jifen < 0 then
				jifen = 0
			end
			local info = format("\t当前全服春节活动积分是:#G"..jifen.."\n \n\t#W当积分到达#R%d#W时#R大都崇天门#W的春节商人一开始定时限量打折出售金币道具。\n\t当积分到达#R%d#W时#R大都中心城#W的春节商人二开始定时限量打折出售金币道具。\n\t当积分到达#R%d#W时#R大都东#W的春节商人三开始定时限量打折出售金币道具。\n\t当积分到达#R%d#W时#R大都南#W的春节商人四开始定时限量打折出售金币道具。\n\t当积分到达#R%d#W时#R大都西#W的春节商人五开始定时限量打折出售金币道具。\n \n#G注：全服春节活动积分通过消灭王城、外城、古道、边塞、大都东、大都南、大都西的海都及海都先锋获得。\n \n#W小提示：即使全服春节活动积分未到制定分值：\n\t#R大都崇天门#W的春节商人也会在#R1月28日#W开始定时限量打折出售金币道具。\n\t#R大都中心城#W的春节商人也会在#R1月31日#W开始定时限量打折出售金币道具。\n\t#R大都东#W的春节商人也会在#R2月3日#W开始定时限量打折出售金币道具。\n\t#R大都南#W的春节商人也会在#R2月6日#W开始定时限量打折出售金币道具。\n\t#R大都西#W的春节商人也会在#R2月9日#W开始定时限量打折出售金币道具。",x310807_g_JifenRange[1],x310807_g_JifenRange[2],x310807_g_JifenRange[3],x310807_g_JifenRange[4],x310807_g_JifenRange[5])
		  StartTalkTask(sceneId)
    	TalkAppendString(sceneId, "#Y".."全服春节活动积分查询".."#W")
			TalkAppendString(sceneId, info) 
    	StopTalkTask()
    	DeliverTalkMenu(sceneId, selfId, targetId, x310807_g_ScriptId, x310807_g_ScriptId, 1)
	
	end

end

function x310807_IsInValidPeriod( sceneId, varShopIndex )
	
	local year, month, day = GetYearMonthDay();
	
	if year ~= 2011 then
		return 0
	end
	
	if month ~= 1 and month ~= 2 then
		return 0
	end
	
	if month == 1 and day < 25 then
		return 0
	end
	
	if month == 2 and day > 14 then
		return 0
	end
	
	
	local jifen = GetCountryParam( sceneId, 3,  CD_HUODONG_XINNIAN );
	
	if jifen >= x310807_g_JifenRange[varShopIndex] then
		return 1
	end
	
	if varShopIndex == 1 then
		 if month == 1 and day >= 28 then
		 	return 1
		 end
		 if month == 2 then
		 	return 1
		 end
	elseif varShopIndex == 2 then
			if month == 1 and day == 31 then
				return 1
			end
			if month == 2 then
				return 1
			end
	elseif varShopIndex == 3 then
			if month == 2 and day >= 3 then
				return 1
			end
	elseif varShopIndex == 4 then
			if month == 2 and day >= 6 then
				return 1
			end
	elseif varShopIndex == 5 then
			if month == 2 and day >= 9 then
				return 1
			end	
	end
	
	return 0
end


--**********************************

--列举事件

--**********************************

function x310807_ProcEnumEvent(sceneId, selfId, targetId, MissionId)	

	TalkAppendButton(sceneId, x310807_g_ScriptId, x310807_g_MissionName,10, 0)
	TalkAppendButton(sceneId, x310807_g_ScriptId, "全服春节活动积分查询", 3, 1 )
	
end



--**********************************

--检测接受条件

--**********************************

function x310807_ProcAcceptCheck(sceneId, selfId, targetId)

end

--**********************************

--接受

--**********************************

function x310807_ProcAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--放弃

--**********************************

function x310807_ProcQuestAbandon(sceneId, selfId, MissionId)

end



--**********************************

--检测是否可以提交

--**********************************

function x310807_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--提交

--**********************************

function x310807_ProcQuestSubmit(sceneId, selfId, targetId, selectRadioId, MissionId)
	
end



--**********************************

--杀死怪物或玩家

--**********************************

function x310807_ProcQuestObjectKilled(sceneId, selfId, objdataId, objId, MissionId)

end



--**********************************

--进入区域事件

--**********************************

function x310807_ProcAreaEntered(sceneId, selfId, zoneId, MissionId)

end



--**********************************

--道具改变

--**********************************

function x310807_ProcQuestItemChanged(sceneId, selfId, itemdataId, MissionId)

end
