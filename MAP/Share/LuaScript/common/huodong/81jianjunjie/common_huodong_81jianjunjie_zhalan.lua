--------------------------------------------------------------------------------------------------------
-- buff 98 激活时处理
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj 
-- 参数：varMap -- 目标玩家ID 
--------------------------------------------------------------------------------------------------------
function x302541_OnImpactActiveOnce( varMap, varPlayer, targetId )

	local maxHp = GetMaxHp(varMap,targetId)
	SetHp( varMap, targetId, -maxHp * 5/100 )
	SendSpecificImpactToUnit( varMap, targetId, targetId, targetId, 26381, 0)
end

----------------------------------------------------------------------------------------------
-- buff 98 消失时的处理 在98号逻辑下buff生效次数用完后buff消失进入此接口
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj  
-- 参数：targetId -- 目标玩家ID 
----------------------------------------------------------------------------------------------
function x302541_OnImpactFadeOut( varMap, varPlayer ,targetId)	


end

----------------------------------------------------------------------------------------------
-- buff 98 在x302541_OnImpactActiveOnce之前在脚本中检测 当前的目标玩家是否可以被激活
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj 
-- 参数：targetId -- 目标玩家ID 
-- 返回值 0 当前目标玩家不可以被处理，1则可以
----------------------------------------------------------------------------------------------
function x302541_CheckImpackScriptIsCanDoByScript( varMap, varPlayer, targetId )
	return 1
end
