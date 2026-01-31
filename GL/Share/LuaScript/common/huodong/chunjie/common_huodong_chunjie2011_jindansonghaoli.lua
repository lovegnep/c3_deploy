----春节活动之金蛋送豪礼

x310806_g_ScriptId = 310806;
x310806_g_GoldEggId = 12030146;      --金蛋id
x310806_g_GameLogId = 2505;


--奖品配置, 注意 probability之和应为100
x310806_g_GiftList = {
          { id = 12030056, 	probability =2       ,count = 1 }, 
          { id = 12030057, 	probability =1       ,count = 1 },
          { id = 12030058, 	probability =0.5     ,count = 1 },
          { id = 12030059, 	probability =0.1     ,count = 1 },
          { id = 12030048, 	probability =0.005   ,count = 1 },
          { id = 11990015, 	probability =2.5     ,count = 1 },
          { id = 12041103, 	probability =2.5     ,count = 1 },
          { id = 11000550, 	probability =3       ,count = 1 }, 
          { id = 11000552, 	probability =0.2     ,count = 1 },
          { id = 12030511, 	probability =0.07    ,count = 1 },
          { id = 11990110, 	probability =0.5     ,count = 1 },
          { id = 11000501, 	probability =2       ,count = 1 },
          { id = 11000902, 	probability =2       ,count = 1 },
          { id = 12041101, 	probability =2       ,count = 1 },
          { id = 12030202, 	probability =0.3     ,count = 1 },
          { id = 12030203, 	probability =0.05    ,count = 1 },
          { id = 12030201, 	probability =2.5     ,count = 1 },
          { id = 12030213, 	probability =2.5     ,count = 1 },
          { id = 11990400, 	probability =2       ,count = 1 },
          { id = 11990050, 	probability =3       ,count = 1 },
          { id = 12030217, 	probability =2       ,count = 1 },
          { id = 12030043, 	probability =2       ,count = 1 },
          { id = 12041108, 	probability =3       ,count = 1 },
          { id = 12030031, 	probability =1       ,count = 1 },
          { id = 12030018, 	probability =3       ,count = 1 },
          { id = 12110206, 	probability =3       ,count = 1 },
          { id = 12110207, 	probability =1       ,count = 1 },
          { id = 12054300, 	probability =3       ,count = 1 },
          { id = 12030218, 	probability =1       ,count = 1 },
          { id = 12030503, 	probability =0.1     ,count = 1 },  
          { id = 11010001, 	probability =2       ,count = 1 }, 
          { id = 11000800, 	probability =2       ,count = 1 },
          { id = 12041102, 	probability =2       ,count = 1 },
          { id = 12050271, 	probability =0.0045  ,count = 1 },
          { id = 12050260, 	probability =0.00045 ,count = 1 },
          { id = 12050267, 	probability =0.00005 ,count = 1 },
          { id = 11990117, 	probability =2       ,count = 1 },
          { id = 12030016, 	probability =2       ,count = 1 }, 
          { id = 12030022, 	probability =0.5     ,count = 1 },
          { id = 12030023, 	probability =0.5     ,count = 1 },
          { id = 12030024, 	probability =0.5     ,count = 1 },
          { id = 12030025, 	probability =0.5     ,count = 1 },
          { id = 12030505, 	probability =0.1     ,count = 1 },
          { id = 12030258, 	probability =1       ,count = 1 },
          { id = 12030512, 	probability =0.05    ,count = 1 },
          { id = 12041109, 	probability =2       ,count = 1 },
          { id = 12041097, 	probability =2       ,count = 1 },
          { id = 12041110, 	probability =3       ,count = 1 },
          { id = 12041111, 	probability =3       ,count = 1 },
          { id = 12041112, 	probability =3       ,count = 1 },
          { id = 11000544, 	probability =2       ,count = 1 },
          { id = 12041090, 	probability =2       ,count = 1 },
          { id = 12041091, 	probability =2       ,count = 1 },
          { id = 12041092, 	probability =2       ,count = 1 },
          { id = 12041093, 	probability =2       ,count = 1 },
          { id = 12041094, 	probability =2       ,count = 1 },
          { id = 12250008, 	probability =2       ,count = 1 },
          { id = 11000300, 	probability =0.02    ,count = 1 },
          { id = 12031001, 	probability =3       ,count = 1 },
          { id = 12031002, 	probability =3       ,count = 1 },  
          { id = 12031003, 	probability =3       ,count = 1 }, 
          { id = 12031004, 	probability =3       ,count = 1 },
          
                                                                                                                     
}    

--//////////////////////////////////////////////////////////////////////////////////                                                                

x310806_g_GiftList_RandomRange = {};
x310806_g_GiftList_RandomRange_Init = 0;                                                        

function x310806_InitGiftListRandomRange()
	
	local iter = 1
	for i, item in x310806_g_GiftList do
		if i == 1 then
			x310806_g_GiftList_RandomRange[iter] = {}
			x310806_g_GiftList_RandomRange[iter][1] = 1
			x310806_g_GiftList_RandomRange[iter][2] = (100000 * item.probability) + 1;
		else
		 	x310806_g_GiftList_RandomRange[iter] = {}
			x310806_g_GiftList_RandomRange[iter][1] = x310806_g_GiftList_RandomRange[iter-1][2];
			x310806_g_GiftList_RandomRange[iter][2] = x310806_g_GiftList_RandomRange[iter][1] + (100000 * item.probability) + 1;
		end
		iter = iter + 1
	end
	
	if x310806_g_GiftList_RandomRange[iter-1][2] < 10000000 then
		 x310806_g_GiftList_RandomRange[iter] = {}
		 x310806_g_GiftList_RandomRange[iter][1] = x310806_g_GiftList_RandomRange[iter-1][2]
		 x310806_g_GiftList_RandomRange[iter][2] = 10000000 - x310806_g_GiftList_RandomRange[iter][1]
	end
	
	x310806_g_GiftList_RandomRange_Init = 1;
	
end                                                                  
                                                       
--**********************************                                 
--事件交互入口                                                       
--**********************************                                             
function x310806_ProcEventEntry( sceneId, selfId, bagIndex )         
-- 不需要这个接口，但要保留空函数                                    
end                                                                  
                                                                     
--**********************************                                 
--这个物品的使用过程是否类似于技能：                                 
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************                                 
function x310806_ProcIsSkillLikeScript( sceneId, selfId)                 
	return 1; --这个脚本需要动作支持                                   
end

function x310806_ProcIsSpellLikeScript( sceneId, selfId)                 
	return 1; --这个脚本需要动作支持                                   
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x310806_ProcCancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x310806_ProcConditionCheck( sceneId, selfId )
	
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
function x310806_ProcDeplete( sceneId, selfId )
	return 1;
end



function x310806_OnItemAppendByRandom(sceneId, selfId)
	
	--检查是否有金蛋
	local goldEggCount = HaveItemInBagNew( sceneId, selfId, x310806_g_GoldEggId ); --GetCanUseItemCountInBag( sceneId, selfId, x310806_g_GoldEggId );
	if goldEggCount <= 0 then
			Msg2Player(sceneId, selfId, "请先获得一枚金蛋再使用此道具！", 0, 2)
			Msg2Player(sceneId, selfId, "请先获得一枚金蛋再使用此道具！", 0, 3)
			return
	end
	
	--检查每日砸蛋次数
  local today = GetDayOfYear()
  local finishTimes = 0;
 	if GetPlayerGameData( sceneId, selfId, MD_2011CJHD_GOLDEGG_DATE[1], MD_2011CJHD_GOLDEGG_DATE[2], MD_2011CJHD_GOLDEGG_DATE[3] ) ~= today then
 		 --又过了一天，重置日期和次数
  	 SetPlayerGameData( sceneId, selfId, MD_2011CJHD_GOLDEGG_DATE[1], MD_2011CJHD_GOLDEGG_DATE[2], MD_2011CJHD_GOLDEGG_DATE[3], today );
  	 SetPlayerGameData( sceneId, selfId, MD_2011CJHD_GOLDEGG_TIMES[1], MD_2011CJHD_GOLDEGG_TIMES[2], MD_2011CJHD_GOLDEGG_TIMES[3], 0 );
  	 finishTimes = 0;
  else
  	finishTimes = GetPlayerGameData( sceneId, selfId, MD_2011CJHD_GOLDEGG_TIMES[1], MD_2011CJHD_GOLDEGG_TIMES[2], MD_2011CJHD_GOLDEGG_TIMES[3] );
  end
  
  --每天前10次随机获得8~16个人积分
  if finishTimes < 10 then
  		local curScore = GetPlayerGameData( sceneId, selfId, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
  		local addition = random( 8, 16 );
			SetPlayerGameData( sceneId, selfId, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], curScore + addition )
			SetFeastScore( sceneId, selfId, curScore + addition)
      Msg2Player( sceneId, selfId, format( "今天前10次敲金蛋随机获得#R%d#cffcc00点个人节日积分，总积分#R%d",addition, curScore + addition ), 8, 3)
  end
 
 	--按概率分配礼品
 	
	if x310806_g_GiftList_RandomRange_Init == 0 then
		x310806_InitGiftListRandomRange();	--初始化概率表
	end
	
	local itemId = nil
	local itemCount = nil
	local chance = random(1, 10000000);
	for i, iter in x310806_g_GiftList do
      if chance >= x310806_g_GiftList_RandomRange[i][1] and chance < x310806_g_GiftList_RandomRange[i][2] then
          itemId = iter.id
          itemCount = iter.count
          break
      end
  end
	
	x310806_OnItemAppend(sceneId, selfId, itemId, itemCount ) 
	
end

function x310806_OnItemAppend(sceneId, selfId, itemId, itemCount )
 	
 	local bagIndex = GetBagIndexOfUsedItem( sceneId, selfId );
 	
  if itemId == nil then
  	
  	--消耗金锤使用次数
		local curTimes = GetBagItemMultTimes( sceneId, selfId, bagIndex)
		if curTimes <= 1 then
		  if DelItemByIndexInBag( sceneId, selfId, bagIndex, 1) ~= 1 then return 0 end
		else
			SetBagItemMultTimes( sceneId, selfId, bagIndex, curTimes - 1)
		end
  	 	
	 	---删除金蛋
	  if DelItem(sceneId, selfId, x310806_g_GoldEggId, 1) == 0 then
				Msg2Player(sceneId, selfId, "砸开金蛋失败！", 0, 2)
				Msg2Player(sceneId, selfId, "砸开金蛋失败！", 0, 3)
				return
		end 	 	
  	
  	Msg2Player(sceneId, selfId, "很遗憾，您啥也没得到！", 0, 2)
		Msg2Player(sceneId, selfId, "很遗憾，您啥也没得到！", 0, 3)
		return
		
  end
 		
  
  --获得经验
  if itemId == 0 then
  	 local level = GetLevel( sceneId, selfId );
  	 if level > 0 and level < 120 then
  	 

				  if DelItemByIndexInBag( sceneId, selfId, bagIndex, 1) ~= 1 then return 0 end

  	 	
	  	 	---删除金蛋
			  if DelItem(sceneId, selfId, x310806_g_GoldEggId, 1) == 0 then
						Msg2Player(sceneId, selfId, "砸开金蛋失败！", 0, 2)
						Msg2Player(sceneId, selfId, "砸开金蛋失败！", 0, 3)
						return
				end 	 	
  	 
	  	 	local exp = level * itemCount;
	  	 	AddExp( sceneId, selfId, exp );
	  	 	StartTalkTask(sceneId);
	  	 	local str = format("您砸开了1个@item_%d#cffcf00，获得了%d点经验值！", x310806_g_GoldEggId, exp);
				TalkAppendString(sceneId,str)
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)
				
				if x310806_g_GameLogId > 0 then
	     		GamePlayScriptLog( sceneId, selfId, x310806_g_GameLogId )	--写日志
	     	end
	      x310806_IncreaseBreakGoldEggTimes(sceneId, selfId);				--记录砸蛋次数
      
  	 end
  	 
  	 return
  end
  
  
	StartItemTask(sceneId)         
	local bagIndex = GetBagIndexOfUsedItem( sceneId, selfId)
	if bagIndex >= 0 and IsItemBind(sceneId, selfId, bagIndex) > 0 then
		ItemAppendBind( sceneId,itemId, itemCount ) 
	else
		ItemAppend( sceneId,itemId, itemCount ) 
	end
	
	
	
	
	
	local ret = StopItemTask(sceneId,selfId)
	if ret > 0 then
		--if(DepletingUsedItem(sceneId, selfId)) == 1 then
			
			--消耗金锤使用次数
			  if DelItemByIndexInBag( sceneId, selfId, bagIndex, 1) ~= 1 then return 0 end
	
				
			---删除金蛋
		  if DelItem(sceneId, selfId, x310806_g_GoldEggId, 1) == 0 then
					Msg2Player(sceneId, selfId, "砸开金蛋失败！", 0, 2)
					Msg2Player(sceneId, selfId, "砸开金蛋失败！", 0, 3)
					return
			end 	 	
		
			StartTalkTask(sceneId)
			local str = format("您砸开了1个@item_%d#cffcf00，获得了%d个@item_%d#cffcf00", x310806_g_GoldEggId, itemCount, itemId)
			TalkAppendString(sceneId,str)
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)
			DeliverItemListSendToPlayer(sceneId,selfId)
      
			if x310806_g_GameLogId > 0 then
	     		GamePlayScriptLog( sceneId, selfId, x310806_g_GameLogId )	--写日志
	   	end
	   	
      x310806_IncreaseBreakGoldEggTimes(sceneId, selfId); --记录砸蛋次数	

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
function x310806_ProcActivateOnce( sceneId, selfId, impactId )   
	if GetBagSpace(sceneId, selfId) <= 0 then
		Msg2Player(sceneId, selfId, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(sceneId, selfId, "背包已满，无法使用此道具", 0, 3)
		return
	end		
	
	x310806_OnItemAppendByRandom(sceneId, selfId)
	
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x310806_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end


function x310806_IncreaseBreakGoldEggTimes( sceneId, selfId )
	
	local nowTimes = GetPlayerGameData( sceneId, selfId, MD_2011CJHD_GOLDEGG_TIMES[1], MD_2011CJHD_GOLDEGG_TIMES[2], MD_2011CJHD_GOLDEGG_TIMES[3] );
	if nowTimes <= 10 then
		SetPlayerGameData( sceneId, selfId, MD_2011CJHD_GOLDEGG_TIMES[1], MD_2011CJHD_GOLDEGG_TIMES[2], MD_2011CJHD_GOLDEGG_TIMES[3], nowTimes + 1 );
	end

end

 
