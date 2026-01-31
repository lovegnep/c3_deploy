
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号

x302501_var_FileId 		= 302501 
--需要的等级
x302501_var_LevelMin		=	60
--道具计次
x302501_var_count = 90


--**********************************
--事件交互入口
--**********************************
function x302501_ProcEventEntry( varMap, varPlayer, varBagIdx )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x302501_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x302501_ProcCancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x302501_ProcConditionCheck( varMap, varPlayer )

	if GetLevel(varMap, varPlayer)< x302501_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	local digongmap = {79,83,84,85,95,96,97,112,113,114,115,116,179,183,184,185,195,196,197,212,213,214,215,216,279,283,284,285,295,296,297,312,313,314,315,316,379,383,384,385,395,396,397,412,413,414,415,416}
	local temp = 0
	for k,v in digongmap do
		if varMap == v then
			temp = 1
			break
		end
	end
	
	--副本和圣山地宫有效
	if GetSceneType(varMap) ~=1 and temp ~= 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"只能在副本和圣山地宫中使用")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	--是否组队
	if HasTeam(varMap,varPlayer) <1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"只能在队伍中使用")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	--周围至少3个玩家
	if GetNearTeamCount(varMap,varPlayer) <= 3 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你周围至少需要3个队友才能开启封印")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
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
function x302501_ProcDeplete( varMap, varPlayer )
	
	
	--if(DepletingUsedItem(sceneId, selfId)) == 1 then
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
function x302501_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

--	if GetLevel(varMap, varPlayer)< x302501_var_LevelMin then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap,"等级不足")
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		return 0
--	end
--		
--	local digongmap = {79,83,84,85,95,96,97,112,113,114,115,116,179,183,184,185,195,196,197,212,213,214,215,216,279,283,284,285,295,296,297,312,313,314,315,316,379,383,384,385,395,396,397,412,413,414,415,416}
--	local temp = 0
--	for k,v in digongmap do
--		if varMap == k then
--			temp = 1
--			break
--		end
--	end
--	
--	--副本和圣山地宫有效
--	if GetSceneType(varMap) ~=1 and temp ~= 1 then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap,"只能在副本和圣山地宫中使用")
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		return 0
--	end
--	
--	--是否组队
--	if HasTeam(varMap,varPlayer) <1 then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap,"只能在队伍中使用")
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		return 0
--	end
--	
--	--周围至少3个玩家
--	if GetNearTeamCount(varMap,varPlayer) >= 3 then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap,"你周围至少需要3个队友才能开启封印")
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		return 0
--	end
	

	--召唤生物
	local level = floor(GetLevel(varMap, varPlayer)/10)
	local monx,mony = GetWorldPos(varMap, varPlayer)
	local monid = {
			48250,
			48251,
			48252,
			48253,
			48254,
			48255,
			48256,
			48257,
			48258,
			48259,
			48260,
			48261,
			48262,
			48263,
			48264,
	}
	CreateMonster(varMap, monid[level],monx,mony,1,-1,-1,-1,21,600000,90)
	
	
		--物品使用次数减少
	local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer );
	local curTimes = GetBagItemMultTimes( varMap, varPlayer, bagIndex)
	if curTimes <= 1 then
	    DelItemByIndexInBag( varMap, varPlayer, bagIndex, 1)
	else
		SetBagItemMultTimes( varMap, varPlayer, bagIndex, curTimes - 1)
	end
	
	local name =  GetName(varMap, varPlayer)
	local msg = name.."撕开封印，召唤出了魔君"
	Msg2Player(varMap,varPlayer,msg,8,3)
	Msg2Player(varMap,varPlayer,msg,8,2)
	Msg2Player(varMap,varPlayer,msg,1,0)
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x302501_ProcActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end
