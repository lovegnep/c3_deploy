
------------------------------------------------------------------------------------------
--一般物品的默认脚本

x310817_g_scriptId 			= 310817 							--脚本号
x310817_g_ItemID				= 12260003						-- 礼包的物品ID

--奖励的物品
x310817_g_BonusItem     = {
														[1] = {item = 12260005,num=1},--小巧克力
														[2] = {item = 12260006,num=1},--大巧克力
														[3] = {item = 12110206,num=3},--小玫瑰
														--[4] = {item = 10287300,num=1},--神传首饰男
														[5] = {item = 10287349,num=1},--天传首饰男
														[6] = {item = 10287350,num=1},--冥传首饰男
														--[7] = {item = 10287306,num=1},--神传首饰女
														[8] = {item = 10287355,num=1},--天传首饰女
														[9] = {item = 10287356,num=1},--冥传首饰女
														}


function x310817_ProcEventEntry( sceneId, selfId, bagIndex )

	
		-- 检测背包空间
		 if GetBagSpace(sceneId, selfId) <= 0 then
			 Msg2Player( sceneId, selfId, "背包空间已满,无法使用物品", 8, 2)
			 Msg2Player( sceneId, selfId, "背包空间已满,无法使用物品", 8, 3)
			 return
		 end
		if GetItemIDByIndexInBag(sceneId, selfId, bagIndex) ~= x310817_g_ItemID then
			return
		end
		local bind = IsItemBind(sceneId, selfId, bagIndex)
		local level = GetLevel(sceneId, selfId)		
		local bCplay =  DelItemByIndexInBag(sceneId, selfId, bagIndex, 1)
		
		local year,month,day =GetYearMonthDay()
		if year ~= 2011 then
			if bCplay == 1 then 
				StartTalkTask(sceneId)
				TalkAppendString(sceneId,"礼包已过期")
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)
			end
			return
		end
    if bCplay == 1 then
      	StartItemTask(sceneId)
      	local rand = random(1, 1000)
		local rand2 =random(1, 100)

--天传阶段概率算法		
		if level >= 40 and level < 90 then
     		if rand <= 450 then
     			if bind == 1 then
					ItemAppend( sceneId, x310817_g_BonusItem[1].item, 1)
				else
					ItemAppend(sceneId, x310817_g_BonusItem[1].item, 1)
				end
			elseif rand > 450 and rand <= 600 then
				if bind == 1 then
					ItemAppend(sceneId, x310817_g_BonusItem[2].item, 1)
				else
					ItemAppend(sceneId, x310817_g_BonusItem[2].item, 1 )
				end
			elseif rand > 600 and rand <= 997 then
				if bind == 1 then
					ItemAppend(sceneId, x310817_g_BonusItem[3].item, 3)
				else
					ItemAppend(sceneId, x310817_g_BonusItem[3].item, 3)
				end
			elseif rand > 997 and rand <= 999 then
				local msg1 =""
				if bind == 1 then
					if rand2 < 51 then
							ItemAppend(sceneId, x310817_g_BonusItem[5].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[5].item)
					elseif rand2 >50 then
							ItemAppend(sceneId, x310817_g_BonusItem[8].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[8].item)
					end
				else
					if rand2 < 51 then
							ItemAppend(sceneId, x310817_g_BonusItem[5].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[5].item)
					elseif rand2 >50 then
							ItemAppend(sceneId, x310817_g_BonusItem[8].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[8].item)
					end
				end
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_LEFTDOWN, 1)
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_MAIN_RIGHTDOWN, 1)				
			elseif rand > 999 and rand <= 1000 then
				local msg1 =""
				if bind == 1 then
					if rand2 < 51 then
							ItemAppend(sceneId, x310817_g_BonusItem[6].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[6].item)
					elseif rand2 >50 then
							ItemAppend(sceneId, x310817_g_BonusItem[9].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[9].item)
					end
				else
					if rand2 < 51 then
							ItemAppend(sceneId, x310817_g_BonusItem[6].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[6].item)
					elseif rand2 >50 then
							ItemAppend(sceneId, x310817_g_BonusItem[9].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[9].item)
					end
				end
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_LEFTDOWN, 1)
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_MAIN_RIGHTDOWN, 1)		
			end
		end
--冥传阶段概率算法
		if level >= 90 and level < 160 then
     		if rand <= 450 then
     			if bind == 1 then
					ItemAppend( sceneId, x310817_g_BonusItem[1].item, 1)
				else
					ItemAppend(sceneId, x310817_g_BonusItem[1].item, 1)
				end
			elseif rand > 450 and rand <= 600 then
				if bind == 1 then
					ItemAppend(sceneId, x310817_g_BonusItem[2].item, 1)
				else
					ItemAppend(sceneId, x310817_g_BonusItem[2].item, 1 )
				end
			elseif rand > 600 and rand <= 997 then
				if bind == 1 then
					ItemAppend(sceneId, x310817_g_BonusItem[3].item, 3)
				else
					ItemAppend(sceneId, x310817_g_BonusItem[3].item, 3)
				end
			elseif rand > 997 and rand <= 1000 then
				local msg1 =""
				if bind == 1 then
					if rand2 < 51 then
							ItemAppend(sceneId, x310817_g_BonusItem[6].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[6].item)
					elseif rand2 >50 then
							ItemAppend(sceneId, x310817_g_BonusItem[9].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[9].item)
					end
				else
					if rand2 < 51 then
							ItemAppend(sceneId, x310817_g_BonusItem[6].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[6].item)
					elseif rand2 >50 then
							ItemAppend(sceneId, x310817_g_BonusItem[9].item, 1)
							msg1 = format( "#G%s#o打开#G情人节礼包#o获得了#R#{_ITEM%d}", GetName(sceneId, selfId), x310817_g_BonusItem[9].item)
					end
				end
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_LEFTDOWN, 1)
					LuaAllScenceM2Wrold(sceneId, msg1, CHAT_MAIN_RIGHTDOWN, 1)				
			end
		end
	end

	local ret = StopItemTask(sceneId,selfId)

		if ret>0 then
				StartTalkTask(sceneId)
				TalkAppendString(sceneId,"你打开情人节礼包")
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)
				DeliverItemListSendToPlayer(sceneId,selfId)
				
				WriteLog(1, format("x310817_ProcEventEntry  ItemAppend OK: SceneId(%d) GUID(%d) ItemAppend(%d) AddtemNum(%d)", 
					 	sceneId, GetGUID(sceneId, selfId), x310817_g_ItemID, 1))
		else
			StartTalkTask(sceneId)
			TalkAppendString(sceneId,"背包已满，无法得到物品！")
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)
		end

	return bCplay
end

function x310817_ProcIsSpellLikeScript( sceneId, selfId)
	return 0; --这个脚本需要动作支持    
	--返回0，走上面的ProcEventEntry逻辑
	--返回1，走下面的逻辑
end

function x310817_ProcCancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

function x310817_ProcConditionCheck( sceneId, selfId )
	return 0
end

function x310817_ProcDeplete( sceneId, selfId )
	return 0
end

function x310817_ProcActivateOnce( sceneId, selfId )
end

function x310817_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
