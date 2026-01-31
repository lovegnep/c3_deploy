--双喜麟门包	
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号

x432303_var_FileId = 432303
x432303_var_LevelMin = 1	

x432303_var_ItemTable             = {
                                    { itemId = 12054301, probability = 49, special = 0, broad = 2, itemname =  "还龙书"         }, 
                                    { itemId = 12500008, probability = 49, special = 0, broad = 2, itemname =  "五级融雪丹礼包 "}, 
                                    { itemId = 12050350, probability = 2, special = 1, broad = 1, itemname =  "蓝麒麟降世符  "  }, 
                                                                                                                 
}                                                                               

--**********************************
--事件交互入口
--**********************************
function x432303_ProcEventEntry( varMap, varPlayer, varBagIdx )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x432303_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x432303_ProcCancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x432303_ProcConditionCheck( varMap, varPlayer )
	
	--校验使用的物品
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
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
function x432303_ProcDeplete( varMap, varPlayer )
	
	
	--if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	--	return 1;
	--end
	--return 0;
	
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x432303_ProcActivateOnce( varMap, varPlayer, varImpact )

	local lv = GetLevel(varMap, varPlayer)
	if lv < x432303_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if GetBagSpace( varMap, varPlayer) < 1 then
		Msg2Player( varMap, varPlayer, "背包空间不足1格，无法打开", 8, 3)
		return
	end

	local rand = random( 1, 100)
    local index = 1
    local num1 = 1
    local num2 = 1
    --local giveitem = 12030639
    for i, item in x432303_var_ItemTable do
        num1 = num1 + item.probability
        if rand >= num2 and rand < num1 then
            index = i
            break
        end
        num2 = num2 + item.probability
    end

    giveitem = x432303_var_ItemTable[ index].itemId

	StartItemTask(varMap)
	ItemAppend( varMap, giveitem, x432303_var_ItemTable[ index].broad)

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开箱子，获得了礼品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

			-- 世界广播
			if x432303_var_ItemTable[ index].special == 1 then
				LuaAllScenceM2Wrold( varMap, format( "恭喜玩家%s打开双喜麟门包获得#{_ITEM%d}", GetName( varMap, varPlayer), x432303_var_ItemTable[ index].itemId), 5, 1)
			end
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	else
		StartTalkTask( varMap)
		TalkAppendString( varMap, "背包已满，无法得到物品！" )
		StopTalkTask( varMap)
		DeliverTalkTips( varMap, varPlayer)
	end

end



--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x432303_ProcActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end
