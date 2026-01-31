--公测10级礼包
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号

x432004_var_FileId = 432004
x432004_var_ItemList = {}
x432004_var_LevelMin = 10	
x432004_var_ItemList = {10200020,10230020,10240020,10250020,10260020,10270020}
--需要的等级


--**********************************
--事件交互入口
--**********************************
function x432004_ProcEventEntry( varMap, varPlayer, varBagIdx )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x432004_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x432004_ProcCancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x432004_ProcConditionCheck( varMap, varPlayer )
	
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
function x432004_ProcDeplete( varMap, varPlayer )
	
	
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
function x432004_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x432004_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local nZhiYe = GetZhiye( varMap, varPlayer);
	local itemId = 0;

	if nZhiYe==0 then
		itemId = 10010020
	elseif nZhiYe==1 then
		itemId = 10020020
	elseif nZhiYe==2 then
		itemId = 10030020
	elseif nZhiYe==3 then
		itemId = 10040020
	elseif nZhiYe==4 then
		itemId = 10050020
	elseif nZhiYe==5 then
		itemId = 10060020
	elseif nZhiYe==6 then
		itemId = 10350002
	elseif nZhiYe==7 then
		itemId = 10360002
	elseif nZhiYe==8 then
		itemId = 10370002
	elseif nZhiYe==9 then
		itemId = 10380002
	elseif nZhiYe==10 then
		itemId = 10390002
	elseif nZhiYe==11 then
		itemId = 10400002
	end

	if itemId==0 then
		return
	end
	
	local varI = random(1,7)
	local j = random(1,7)
	while(varI==j) do
		j = random(1,7)
	end
	
	local itemId2 = 0
	if varI<=6 then
		itemId2 = x432004_var_ItemList[varI]
	else
		itemId2 = itemId
	end

	local itemId3 = 0
	if j<=6 then
		itemId3 = x432004_var_ItemList[j]
	else
		itemId3 = itemId
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, itemId2, 1 )	--蓝装1
	ItemAppendBind( varMap, itemId3, 1 )	--蓝装2
	ItemAppendBind( varMap, 12030319, 1 )	--银卡5两
	ItemAppendBind( varMap, 10301001, 1 )	--时装1件
	ItemAppendBind( varMap, 11000600, 3 )	--初级绿水晶3个
        ItemAppendBind( varMap, 11000200, 2 )	--世传水晶*2

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x432004_ProcActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end
