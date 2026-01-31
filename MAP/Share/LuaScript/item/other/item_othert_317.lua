--冥王龙麟福袋	
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号

x432317_var_FileId = 432317432317
x432317_var_LevelMin = 1	

x432317_var_ItemTable             = {
                                    { itemId = 12030202 , probability = 500,special = 0, broad = 2, itemname = "江湖请柬"        }, 
                                    { itemId = 11010020 , probability = 1000,special = 0, broad = 50, itemname = "先锋徽章"      }, 
                                    { itemId = 12030203 , probability = 500,special = 0, broad = 1, itemname = "朝廷请柬"    }, 
                                    { itemId = 12041101 , probability = 1000,special = 0, broad = 10,  itemname = "修行草"      }, 
                                    { itemId = 11010021 , probability = 1000,special = 0, broad = 30,  itemname = "黄金先锋徽章"        }, 
                                    { itemId = 11990050 , probability = 800,special = 0, broad = 20, itemname = "回魂丹"        }, 
                                    { itemId = 12054300 , probability = 800, special = 0, broad = 6,  itemname = "还童书"        }, 
                                    { itemId = 11990114 , probability = 800, special = 0, broad = 1,  itemname = "次生钻石矿"        }, 
                                    { itemId = 11990011 , probability = 1000, special = 0, broad = 10,  itemname = "三番令"        }, 
                                    { itemId = 12030013 , probability = 1000, special = 0, broad = 15,  itemname = "芝华士"      }, 
                                    { itemId = 12030258 , probability = 1000, special = 0, broad = 5,  itemname = "全福月饼"    }, 
                                    { itemId = 11970022 , probability = 200,  special = 0, broad = 15,  itemname = "强效乱士符"        }, 
                                    { itemId = 12500011 , probability = 200,  special = 1, broad = 1,  itemname = "双喜麟门包"        }, 
                                    { itemId = 12030502 , probability = 150,  special = 1, broad = 1,  itemname = "宫廷时装礼包"  }, 
                                    { itemId = 12050285 , probability = 50,  special = 1, broad = 1,  itemname = "极品钢爪翼龙降世符"    }, 
}                                                                                 

--**********************************
--事件交互入口
--**********************************
function x432317_ProcEventEntry( varMap, varPlayer, varBagIdx )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x432317_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x432317_ProcCancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x432317_ProcConditionCheck( varMap, varPlayer )
	
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
function x432317_ProcDeplete( varMap, varPlayer )
	
	
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
function x432317_ProcActivateOnce( varMap, varPlayer, varImpact )

	local lv = GetLevel(varMap, varPlayer)
	if lv < x432317_var_LevelMin then
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

	local rand = random( 1, 10000)
    local varIndex = 1
    local num1 = 1
    local num2 = 1
    local giveitem = 12030639
    for varI, item in x432317_var_ItemTable do
        num1 = num1 + item.probability
        if rand >= num2 and rand < num1 then
            varIndex = varI
            break
        end
        num2 = num2 + item.probability
    end

    giveitem = x432317_var_ItemTable[ varIndex].itemId

	StartItemTask(varMap)
	ItemAppendBind( varMap, giveitem, x432317_var_ItemTable[ varIndex].broad)

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开箱子，获得了礼品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

			-- 世界广播
			if x432317_var_ItemTable[ varIndex].special == 1 then
				LuaAllScenceM2Wrold( varMap, format( "恭喜玩家%s打开冥王龙麟福袋获得#{_ITEM%d}", GetName( varMap, varPlayer), x432317_var_ItemTable[ varIndex].itemId), 5, 1)
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
function x432317_ProcActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end
