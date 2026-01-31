--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--3001.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x415003_g_scriptId = 415003 --临时写这个,真正用的时候一定要改.
--需要的等级

--效果的ID
x415003_g_Impact1 = 8001 --临时写这个
x415003_g_Impact2 = -1 --不用
x415003_g_Equip ={10287300,10287301,10287302,10287303,10287304,10287305}
x415003_g_Equip2 ={10287306,10287307,10287308,10287309,10287310,10287311}

--**********************************
--事件交互入口
--**********************************
function x415003_FixedBuf(sceneId,selfId,bufId)

	--取得所有BUF的数量
	local nImpactCount = GetImpactListCount(sceneId,selfId)
	if nImpactCount <=0 then
		return
	end
	
	--搜索我关心的BUF数量
	local nCollectCount = 0
	for i=0,nImpactCount-1 do
		
		if GetImpactDataIndex(sceneId,selfId,i) == bufId then
			nCollectCount = nCollectCount + 1
		end
	end
	
	--如果BUF数量异常 执行修复操作
	if nCollectCount > 1 then
		
		nCollectCount = nCollectCount -1
		
		for i = 1,nCollectCount do
			CancelSpecificImpact(sceneId,selfId,bufId)
		end
		if bufId == 7767 then
			GamePlayScriptLog( varMap, varPlayer, 3827)
		end
		WriteLog(1,format("BUFERROR:sceneId=%d,GUID=%X,level=%d,BufTotalCount=%d,BufCount=%d,BufId=%d",GetPlayerGUID(sceneId,selfId),sceneId,GetLevel(sceneId,selfId),nImpactCount,nCollectCount,bufId))
	end
end


function x415003_ProcEventEntry( sceneId, selfId, Pos,OPType )
			if OPType ==0 then
				local YN = 0
				for i, item in x415003_g_Equip do
					local equip	=GetEquipItemCountByLess(sceneId, selfId, 0,0,item)
					if equip >= 1 then
						YN = 1
						break
					end
				end
				if YN == 0 then
					if IsHaveSpecificImpact( sceneId, selfId, 8728) == 1 then
						x415003_FixedBuf(sceneId,selfId,8728)
						CancelSpecificImpact( sceneId, selfId, 8728)
					end	
				end	
				
				local YN2 = 0
				for i, item in x415003_g_Equip2 do
					local equip	=GetEquipItemCountByLess(sceneId, selfId, 0,0,item)
					if equip >= 1 then
						YN2 = 1
						break
					end
				end
				if YN2 == 0 then
					if IsHaveSpecificImpact( sceneId, selfId, 8729) == 1 then
						x415003_FixedBuf(sceneId,selfId,8729)
						CancelSpecificImpact( sceneId, selfId, 8729)
					end
				end	
				LuaCallNoclosure( 415004,"TalkOff",sceneId, selfId, Pos)
			end
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x415003_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x415003_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x415003_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	--if(1~=VerifyUsedItem(sceneId, selfId)) then
		--return 0
	--end
	--return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x415003_OnDeplete( sceneId, selfId )
	--if(DepletingUsedItem(sceneId, selfId)) then
		--return 1;
	--end
	--return 0;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x415003_OnActivateOnce( sceneId, selfId )
	--if(-1~=x415003_g_Impact1) then
		--SendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x415003_g_Impact1, 0);
	--end
	--return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x415003_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
