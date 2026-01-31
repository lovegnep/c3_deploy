----快速AI-----------------

x701136_var_FileId 					= 701136

x701136_CSP_FUBENTYPE				= 0
x701136_CSP_SCRIPTID				=	1
x701136_CSP_TICKCOUNT				= 2
x701136_CSP_BACKSCENEID			= 3
x701136_CSP_ISCLOSING				= 4
x701136_CSP_LEAVECOUNTDOWN	= 5
x701136_CSP_TEAMID					=	6
x701136_CSP_TICKTIME				=	7
x701136_CSP_HOLDTIME				=	8
x701136_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701136_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701136_CSP_BOSSID = 27
x701136_CSP_PLAYERID = 28

--------------ai csp(本ai范围为90~99)---------------------



-----------------------------------------------------------


x701136_AI_Config = 
{
    {skillid = 32188,skillid1 = 89},   -- 容易
    {skillid = 32208,skillid1 = 90},   -- 中等
    {skillid = 32228,skillid1 = 91},   -- 困难
}


function x701136_ProcFubenSceneCreated( varMap )

end
function x701136_EnterTick(varMap,nowTickCount)
	  --WriteLog(1, "x701136_EnterTick ============== nowTickCount:"..nowTickCount)
    local BossId = GetFubenData_Param(varMap, x701136_CSP_BOSSID)
    local difficulty = GetFubenData_Param(varMap, x701136_CSP_DIFFICULTY)
    if IsHaveSpecificImpact(varMap,BossId,x701136_AI_Config[difficulty].skillid) ~= 1 then
    ------加快速buff----------------------------------------------------------
    SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x701136_AI_Config[difficulty].skillid, 0)
    --SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x701136_AI_Config[difficulty].skillid1, 0)
    SetMonsterExtAIScript(varMap,BossId,x701136_AI_Config[difficulty].skillid1)
    end
end
