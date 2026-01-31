------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x430116_g_scriptId  = 430116
x430116_g_pilao			= 60
x430116_g_Bonus 		  =  
{
	[12035244]=
			{
				{levelmin = 39 , levelmax = 50  , nExpBonus = 240000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},--3.5元全福
				{levelmin = 49 , levelmax = 60  ,	nExpBonus = 330000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 59 , levelmax = 70  ,	nExpBonus = 432000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 69 , levelmax = 80  , nExpBonus = 546000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = 672000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = 810000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 99 , levelmax = 160 , nExpBonus = 948000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1}
			},
                
	[12035245]=
			{
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = -1 ,nTianfuBonus = 1.5 , nShengwangBonus = -1 , nRongYuBonus = -1},--exp/160      --声望*2.5
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = -1 ,nTianfuBonus = 1.5 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 99 , levelmax = 160 , nExpBonus = -1 ,nTianfuBonus = 1.5 , nShengwangBonus = -1 , nRongYuBonus = -1}
			},

	[12035246]=
			{
				{levelmin = 39 , levelmax = 50  , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1},--月饼经验*4000威望声望包/威望经验包
				{levelmin = 49 , levelmax = 60  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1},
				{levelmin = 59 , levelmax = 70  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1},
				{levelmin = 69 , levelmax = 80  , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1},
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1},
				{levelmin = 99 , levelmax = 160 , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 500 , nRongYuBonus = -1}
			},
			
	[12035247]=
			{
				{levelmin = 49 , levelmax = 60  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 0.8},  --月饼经验*50000（威望经验包）/(150000*level威望包经验)
				{levelmin = 59 , levelmax = 70  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 0.8},
				{levelmin = 69 , levelmax = 80  , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 0.8},
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 0.8},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 0.8},
				{levelmin = 99 , levelmax = 160 , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 0.8}
			},
			
	[12035248]=
			{
				{levelmin = 39 , levelmax = 50  , nExpBonus = 480000  ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},--7.5元
				{levelmin = 49 , levelmax = 60  ,	nExpBonus = 660000   ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 59 , levelmax = 70  ,	nExpBonus = 864000   ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 69 , levelmax = 80  , nExpBonus = 1092000  ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = 1344000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = 1620000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 99 , levelmax = 160 , nExpBonus = 1896000 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = -1}
			},
			
	[12035249]=
			{
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = -1 ,nTianfuBonus = 3 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = -1 ,nTianfuBonus = 3 , nShengwangBonus = -1 , nRongYuBonus = -1},
				{levelmin = 99 , levelmax = 160 , nExpBonus = -1 ,nTianfuBonus = 3 , nShengwangBonus = -1 , nRongYuBonus = -1}
			},
			
	[12035250]=
			{
				{levelmin = 39 , levelmax = 50  , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1},
				{levelmin = 49 , levelmax = 60  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1},
				{levelmin = 59 , levelmax = 70  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1},
				{levelmin = 69 , levelmax = 80  , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1},
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1},
				{levelmin = 99 , levelmax = 160 , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = 1000 , nRongYuBonus = -1}
			},
			
	[12035251]=
			{
				{levelmin = 49 , levelmax = 60  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 1.5},
				{levelmin = 59 , levelmax = 70  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 1.5},
				{levelmin = 69 , levelmax = 80  , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 1.5},
				{levelmin = 79 , levelmax = 90  ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 1.5},
				{levelmin = 89 , levelmax = 100 ,	nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 1.5},
				{levelmin = 99 , levelmax = 160 , nExpBonus = -1 ,nTianfuBonus = -1 , nShengwangBonus = -1 , nRongYuBonus = 1.5}
			}
														         
}





--**********************************
--事件交互入口：flag = 0表示释放Buff，1表示Buff消失
--**********************************
function x430116_ProcEventEntry( sceneId, selfId, buffIndex, flag)
    
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x430116_ProcIsSpellLikeScript( sceneId, selfId)
	return 1; --这个脚本不需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x430116_ProcCancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行(call OnDeplete)；返回0：条件检测失败，中断后续执行。
--**********************************
function x430116_ProcConditionCheck( sceneId, selfId )
	
	--校验使用的物品
	if(1~=VerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行(call OnActivateOnce)；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x430116_ProcDeplete( sceneId, selfId )
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x430116_ProcActivateOnce( sceneId, selfId )

	if GetTiredTime( sceneId, selfId) >= 480 then
		Msg2Player( sceneId, selfId, "您处于疲劳状态，无法使用", 8, 3)
		Msg2Player( sceneId, selfId, "您处于疲劳状态，无法使用", 8, 2)
		return 0
	end
	
	local year, month, day = GetYearMonthDay();
	if year ==2011 then
		if month >= 11 then
		Msg2Player( sceneId, selfId, "月饼已过期，无法使用", 8, 3)
		Msg2Player( sceneId, selfId, "月饼已过期，无法使用", 8, 2)			
			return
		end
	elseif year > 2011 then
		Msg2Player( sceneId, selfId, "月饼已过期，无法使用", 8, 3)
		Msg2Player( sceneId, selfId, "月饼已过期，无法使用", 8, 2)			
		return
	end	
	if DepletingUsedItem(sceneId, selfId) == 1 then
		local itemTableID = GetActuveItemTableIndex(sceneId, selfId)
		-- 增加疲劳时间
		local index =0
		local level = GetLevel(sceneId, selfId)   
		
		for i,item in x430116_g_Bonus[itemTableID] do
			if level < item.levelmax then
				index = i
				break
			end
		end

		if index == 0 then return end
		
		if x430116_g_Bonus[itemTableID][index].nExpBonus > 0 then
			AddExp( sceneId, selfId, x430116_g_Bonus[itemTableID][index].nExpBonus)			
			Msg2Player(sceneId, selfId, "获得#R"..x430116_g_Bonus[itemTableID][index].nExpBonus.."点#o经验" , 8, 2)		
			Msg2Player(sceneId, selfId, "获得#R"..x430116_g_Bonus[itemTableID][index].nExpBonus.."点#o经验" , 8, 3)	
			IncreaseTiredTime(sceneId, selfId, x430116_g_pilao)
			GamePlayScriptLog( sceneId, selfId, 2690)		
		end
		
		if x430116_g_Bonus[itemTableID][index].nTianfuBonus > 0 then
			local tf = GetLevel(sceneId, selfId) * x430116_g_Bonus[itemTableID][index].nTianfuBonus
			local refixtf = AddInherenceExp( sceneId, selfId, tf)		
			Msg2Player(sceneId, selfId, "获得#R"..refixtf.."点#o天赋" , 8, 2)		
			Msg2Player(sceneId, selfId, "获得#R"..refixtf.."点#o天赋" , 8, 3)	
			IncreaseTiredTime(sceneId, selfId, x430116_g_pilao)
			GamePlayScriptLog( sceneId, selfId, 2691)							
		end

		if x430116_g_Bonus[itemTableID][index].nShengwangBonus > 0 then
			local nShengWang =  x430116_g_Bonus[itemTableID][index].nShengwangBonus 
			nShengWang = nShengWang + GetShengWang( sceneId, selfId )
			SetShengWang( sceneId, selfId, nShengWang )
			Msg2Player(sceneId, selfId, "获得#R"..x430116_g_Bonus[itemTableID][index].nShengwangBonus.."点#o声望" , 8, 2)		
			Msg2Player(sceneId, selfId, "获得#R"..x430116_g_Bonus[itemTableID][index].nShengwangBonus.."点#o声望" , 8, 3)	
			IncreaseTiredTime(sceneId, selfId, x430116_g_pilao)
			GamePlayScriptLog( sceneId, selfId, 2692)							
		end
		
		if x430116_g_Bonus[itemTableID][index].nRongYuBonus > 0 then
			local rong = x430116_g_Bonus[itemTableID][index].nRongYuBonus * GetLevel(sceneId, selfId)
 			AddHonor( sceneId,selfId,rong )	
			Msg2Player(sceneId, selfId, "获得#R"..rong.."点#o荣誉" , 8, 2)		
			Msg2Player(sceneId, selfId, "获得#R"..rong.."点#o荣誉" , 8, 3)	
			IncreaseTiredTime(sceneId, selfId, x430116_g_pilao)
			GamePlayScriptLog( sceneId, selfId, 2693)							
		end

		return 1
	else
		StartTalkTask(sceneId)
		TalkAppendString(sceneId,"使用物品异常！")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		return 0
	end

	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x430116_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
