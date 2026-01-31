
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x415004_g_scriptId = 415004 --临时写这个,真正用的时候一定要改.


--戒指手镯配对特效显示表
x415004_g_Equip ={
	[32571] = {
		{10298172,10298181},{10288172,10288181},
		{10298175,10298184},{10288175,10288184},
		{10298178,10298187},{10288178,10288187},
	},
	[32572] = {
		{10298173,10298182},{10288173,10288182},
		{10298176,10298185},{10288176,10288185},
		{10298179,10298188},{10288179,10288188},
	},
	[32573] = {
		{10298174,10298183},{10288174,10288183},
		{10298177,10298186},{10288177,10288186},
		{10298180,10298189},{10288180,10288189},
	},
	[32574] = {
		{10298192,10298201},{10288192,10288201},
		{10298195,10298204},{10288195,10288204},
		{10298198,10298207},{10288198,10288207},
		{10298210,10298219},{10288210,10288219},
		{10298213,10298222},{10288213,10288222},
		{10298216,10298225},{10288216,10288225},
		{10288226,10288229},{10298226,10298229},
		{10288227,10288230},{10298227,10298230},
		{10288228,10288231},{10298228,10298231},
		{10288232,10288235},{10298232,10298235},
		{10288233,10288236},{10298233,10298236},
		{10288234,10288237},{10298234,10298237},
		{10299908,10299910},{10289908,10289910},
		{10299909,10299911},{10289909,10289911},
	},
}

--**********************************
--事件交互入口
--**********************************
function x415004_FixedBuf(varMap,varPlayer,bufId)

	--取得所有BUF的数量
	local nImpactCount = GetImpactListCount(varMap,varPlayer)
	if nImpactCount <=0 then
		return
	end
	
	--搜索我关心的BUF数量
	local nCollectCount = 0
	for i=0,nImpactCount-1 do
		
		if GetImpactDataIndex(varMap,varPlayer,i) == bufId then
			nCollectCount = nCollectCount + 1
		end
	end
	
	--如果BUF数量异常 执行修复操作
	if nCollectCount > 1 then
		
		nCollectCount = nCollectCount -1
		
		for i = 1,nCollectCount do
			if IsHaveSpecificImpact( varMap, varPlayer, bufId) == 1 then
			CancelSpecificImpact(varMap,varPlayer,bufId)
			end
		end
		
		WriteLog(1,format("BUFERROR:varMap=%d,GUID=%X,level=%d,BufTotalCount=%d,BufCount=%d,BufId=%d",GetPlayerGUID(varMap,varPlayer),varMap,GetLevel(varMap,varPlayer),nImpactCount,nCollectCount,bufId))
	end
end



function x415004_ProcEventEntry( varMap, varPlayer, Pos,OPType )

--穿装备的时候进行的操作
	if OPType ==0 then
		--从表中搜索是否穿有装备	
		for buffid,equipid in x415004_g_Equip do
			for k,v in equipid do
				for a,b in v do				
				local isHaveEquip = GetEquipItemCountByLess(varMap, varPlayer, 0,0,b)
				if isHaveEquip >= 1 then
					--判断装备序列是否为偶数
					local isNumeven = mod(k,2)
					local mateindex = k+1
					if isNumeven ==0 then
						mateindex = k-1
					end
					--从配对表里查找是否有改装备
					for i,j in equipid[mateindex] do
						local isHavemateEquip = GetEquipItemCountByLess(varMap, varPlayer, 0,0,j)
						if isHavemateEquip >=1 then
							if IsPlayerStateNormal(varMap, varPlayer) > 0 then
								SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, buffid, 0)
							end
						end
					end
				end
				end	
			end
		end
	--脱装备所进行的操作
	elseif OPType == 1 then
		--LuaCallNoclosure( 300961,"ProcPlayerDie",varMap, varPlayer, varKiller)
		x415004_TalkOff(varMap, varPlayer,Pos)
	end
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x415004_IsSkillLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x415004_CancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x415004_OnConditionCheck( varMap, varPlayer )
	--校验使用的物品
	--if(1~=VerifyUsedItem(varMap, varPlayer)) then
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
function x415004_OnDeplete( varMap, varPlayer )
	--if(DepletingUsedItem(varMap, varPlayer)) then
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
function x415004_OnActivateOnce( varMap, varPlayer )
	--if(-1~=x415004_g_Impact1) then
		--SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x415004_g_Impact1, 0);
	--end
	--return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x415004_OnActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x415004_TalkOff(varMap, varPlayer,pos)
	
	local ishavestillmarkequip = 0
	 
	for buffid,equipid in x415004_g_Equip do
		local ishavestillmarkequip = 0
		for k,v in equipid do
			for a,b in v do				
			local isHaveEquip = GetEquipItemCountByLess(varMap, varPlayer, 0,0,b)
			if isHaveEquip >= 1 then
				--判断装备序列是否为偶数
				local isNumeven = mod(k,2)
				local mateindex = k+1
				if isNumeven ==0 then
					mateindex = k-1
				end
				--从配对表里查找是否有改装备
				for i,j in equipid[mateindex] do
					
					local isHavemateEquip = GetEquipItemCountByLess(varMap, varPlayer, 0,0,j)
					if isHavemateEquip >=1 then
						ishavestillmarkequip = 1
					end
				end
							
			end
			end	
		end
		--搜索到buff取消之
		if IsHaveSpecificImpact(varMap, varPlayer,buffid) > 0 and ishavestillmarkequip ==0 then
			x415004_FixedBuf(varMap,varPlayer,buffid)
			CancelSpecificImpact(varMap, varPlayer,buffid)
		end	
	end

end
