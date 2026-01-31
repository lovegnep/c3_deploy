--春节活动红包
------------------------------------------------------------------------------------------

x310803_g_scriptId = 310803 
x310803_g_HongBaoId = 12035210;  --红包id
x310803_g_GameLogId = 0;      --日志记录id

--随机礼物配置，probability代表 百分之probability 的几率,所以probability之和应当等于100, broadcast得到后是否全服广播
x310803_g_ItemList = {
          { id = 12030066, name="金币道具", 		probability = 50, broadcast = 0 },               
          { id = 12030067, name="高奖金币道具",	probability = 15, broadcast = 1 },                                                                                                                                                             
                                                         
}    


--//////////////////////////////////////////////////////////////////////////////////                                                                

x310803_g_ItemList_RandomRange = {};
x310803_g_ItemList_RandomRange_Init = 0;                                                        

function x310803_InitItemListRandomRange()
	
	local iter = 1
	for i, item in x310803_g_ItemList do
		if i == 1 then
			x310803_g_ItemList_RandomRange[iter] = {}
			x310803_g_ItemList_RandomRange[iter][1] = 1
			x310803_g_ItemList_RandomRange[iter][2] = (100 * item.probability) + 1;
		else
			x310803_g_ItemList_RandomRange[iter] = {}
			x310803_g_ItemList_RandomRange[iter][1] = x310803_g_ItemList_RandomRange[iter-1][2];
			x310803_g_ItemList_RandomRange[iter][2] = x310803_g_ItemList_RandomRange[iter][1] + (100 * item.probability) + 1;
		end
		iter = iter + 1
	end
	
	if x310803_g_ItemList_RandomRange[iter-1][2] < 10000 then
		 x310803_g_ItemList_RandomRange[iter] = {}
		 x310803_g_ItemList_RandomRange[iter][1] = x310803_g_ItemList_RandomRange[iter-1][2]
		 x310803_g_ItemList_RandomRange[iter][2] = 10000 - x310803_g_ItemList_RandomRange[iter][1]
	end
	
	x310803_g_ItemList_RandomRange_Init = 1;
	
end                                                                  
                                                       
--**********************************                                 
--事件交互入口                                                       
--**********************************                                             
function x310803_ProcEventEntry( sceneId, selfId, bagIndex )         
-- 不需要这个接口，但要保留空函数                                    
end                                                                  
                                                                     
--**********************************                                 
--这个物品的使用过程是否类似于技能：                                 
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************                                 
function x310803_ProcIsSpellLikeScript( sceneId, selfId)                 
	return 1; --这个脚本需要动作支持                                   
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x310803_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x310803_ProcConditionCheck( sceneId, selfId )
	
	--校验使用的物品
	
	if(1~=VerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x310803_ProcDeplete( sceneId, selfId )
	return 1;
end



function x310803_OnItemAppendByRandom(sceneId, selfId)
	
	if x310803_g_ItemList_RandomRange_Init == 0 then
		x310803_InitItemListRandomRange();
	end
	
	local item = nil
	local name = nil         
	local chance = random(1, 10000);
	for i, iter in x310803_g_ItemList do
      if chance >= x310803_g_ItemList_RandomRange[i][1] and chance < x310803_g_ItemList_RandomRange[i][2] then
          item = iter.id
          name = iter.name
          break
      end
  end
	
	x310803_OnItemAppend(sceneId, selfId, item ,name) 
	
end

function x310803_OnItemAppend(sceneId, selfId, itemId ,iname)                               
  
  if itemId == nil then
  	DepletingUsedItem(sceneId, selfId);
  	Msg2Player(sceneId, selfId, "很遗憾，您啥也没得到！", 0, 2)
		Msg2Player(sceneId, selfId, "很遗憾，您啥也没得到！", 0, 3)
		return
  end
  
  local bagIndex = GetBagIndexOfUsedItem( sceneId, selfId )

	StartItemTask(sceneId)   
	ItemAppendBind( sceneId,itemId, 1 )
	local ret = StopItemTask(sceneId,selfId)
	if ret > 0 then
		if(DepletingUsedItem(sceneId, selfId)) == 1 then
			StartTalkTask(sceneId)
			local str =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", x310803_g_HongBaoId,itemId)
			local broadCast = 0;
			for i, gift in x310803_g_ItemList do
				if gift.id == itemId then
					broadCast = gift.broadcast;
					break
				end
			end
			if broadCast == 1 then  --好东西，全服广告
				local name = GetName(sceneId,selfId)
				if name == nil then
					name = "Errorname"
				end
				local msg1 =format(name.."使用红包获得1个"..iname)
				LuaAllScenceM2Wrold(sceneId, msg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(sceneId,str)
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)
			DeliverItemListSendToPlayer(sceneId,selfId)
      -- 写日志
      if x310803_g_GameLogId > 0 then
      	GamePlayScriptLog( sceneId, selfId, x310803_g_GameLogId )		
      end	
		end

	else
		StartTalkTask(sceneId)
		TalkAppendString(sceneId,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
	end
	
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x310803_ProcActivateOnce( sceneId, selfId, impactId )   
	if GetBagSpace(sceneId, selfId) <= 0 then
		Msg2Player(sceneId, selfId, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(sceneId, selfId, "背包已满，无法使用此道具", 0, 3)
		return
	end		
		x310803_OnItemAppendByRandom(sceneId, selfId)
	
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x310803_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
