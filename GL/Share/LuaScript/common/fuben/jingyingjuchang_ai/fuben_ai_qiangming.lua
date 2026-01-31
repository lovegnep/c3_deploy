----强命AI-----------------

x701138_var_FileId 					= 701138

x701138_CSP_FUBENTYPE				= 0
x701138_CSP_SCRIPTID				=	1
x701138_CSP_TICKCOUNT				= 2
x701138_CSP_BACKSCENEID			= 3
x701138_CSP_ISCLOSING				= 4
x701138_CSP_LEAVECOUNTDOWN	= 5
x701138_CSP_TEAMID					=	6
x701138_CSP_TICKTIME				=	7
x701138_CSP_HOLDTIME				=	8
x701138_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701138_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701138_CSP_BOSSID = 27
x701138_CSP_PLAYERID = 28

--------------ai csp(本ai范围为110~119)---------------------
x701138_CSP_QIANGMING_TICK_COUNT = 110
x701138_CSP_QIANGMING_IS_ADD = 111
x701138_CSP_QIANGMING_BOSS_HP =112


-----------------------------------------------------------------------------
x701138_COOLDOWN_BASE = 3   ----连续3个tick没受到伤害才回血

x701138_AI_Config = 
{
    {incre = 5, },   -- 容易
    {incre = 8, },   -- 中等
    {incre = 12, },   -- 困难
}


function x701138_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701138_CSP_QIANGMING_TICK_COUNT, 0)
    SetFubenData_Param(varMap, x701138_CSP_QIANGMING_IS_ADD, 0)
    
    local BossId = GetFubenData_Param(varMap, x701138_CSP_BOSSID)  
    local nCurHp = GetHp(varMap, BossId)
    SetFubenData_Param(varMap, x701138_CSP_QIANGMING_BOSS_HP, nCurHp)
end

function x701138_EnterTick(varMap,nowTickCount)
	  --WriteLog(1, "x701138_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701138_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701138_CSP_DIFFICULTY)
	  SetFubenData_Param(varMap, x701138_CSP_QIANGMING_IS_ADD, 1)
	  
	  local nCurHp = GetHp(varMap, BossId)
	  local lastTickHP = GetFubenData_Param(varMap, x701138_CSP_QIANGMING_BOSS_HP)
	  --print(nCurHp,lastTickHP)
	  if nCurHp < lastTickHP then  ----受到伤害
	      SetFubenData_Param(varMap, x701138_CSP_QIANGMING_TICK_COUNT, 0)
          SetFubenData_Param(varMap, x701138_CSP_QIANGMING_IS_ADD, 0)
	  else
	      local isAdd = GetFubenData_Param(varMap, x701138_CSP_QIANGMING_IS_ADD)
	      local maxHp = GetMaxHp(varMap,BossId)
	      if isAdd == 1 then
			if IsHaveSpecificImpact(varMap,BossId,32181) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, BossId, BossId, BossId, 32181, 0)
		    end
		    --print(maxHp * x701138_AI_Config[difficulty].incre)
	          -----加血-----------
	        SetHp( varMap, BossId, maxHp * x701138_AI_Config[difficulty].incre/100 )
	      else
	      	  local AITickCount = GetFubenData_Param(varMap, x701138_CSP_QIANGMING_TICK_COUNT)
	          AITickCount = AITickCount + 1
	          
	          if (AITickCount == x701138_COOLDOWN_BASE) then     ---连续 x701138_COOLDOWN_BASE 个tick没受到伤害
	              SetFubenData_Param(varMap, x701138_CSP_QIANGMING_TICK_COUNT, 1)
	          end
	      end        
	  end
	  
	  nCurHp = GetHp(varMap, BossId)
	  SetFubenData_Param(varMap, x701138_CSP_QIANGMING_BOSS_HP, nCurHp)
end
