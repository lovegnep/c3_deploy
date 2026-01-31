

x930191_var_FileId 		= 930191
x930191_var_ScriptName	= "说明"
x930191_var_SelectIndex = {}
x930191_var_maplist = {
	--{id=451,name="角斗场",pos={
	--	{42,128},
	--}},
	--{id=1892,name="领主战场",pos={
	--	{130,103},
	--}},
	--{id=122,name="战场",pos={
	--	{130,103},
	--}},
	{id=568,name="那不勒斯港",pos={
		{255,364},
	}},
	--{id=572,name="拉古扎港",pos={
	--	{130,103},
	--}},
	--{id=573,name="阿尔及尔港",pos={
	--	{125,134},
	--}},
	--{id=574,name="贝鲁特港",pos={
	--	{125,134},
	--}},
}
x930191_var_TitleInfo		= "\t"

						
function x930191_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,seleteId)
	x930191_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
    StartTalkTask(varMap)
    TalkAppendString(varMap,x930191_var_ScriptName)
    TalkAppendString(varMap,format("【现金boss】每天的#G21:00、22：00#W在#R恶魔岛#W会刷新出现金boss，掉落大量现金\n\n"))
    TalkAppendString(varMap,format("【挂机】在#R恶魔岛#W挂机杀僵尸得现金，#R周六周日#W现金翻倍哦\n\n"))
    StopTalkTask()
    DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end


function x930191_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local level = GetLevel(varMap, varPlayer)
    TalkAppendButton(varMap,x930191_var_FileId,x930191_var_ScriptName,0,-1)
end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x930191_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x930191_ProcAccept( varMap, varPlayer )
	local id =  x930191_var_SelectIndex[GetGUID(varMap, varPlayer)]

	local varguo=GetCurCountry(varMap, varPlayer)
	local mapid = x930191_var_maplist[id].id
	local pos = x930191_var_maplist[id].pos[1]
	local x = pos[1]+random(1,10)
	local z = pos[2]+random(1,10)

	NewWorld(varMap,varPlayer,mapid,x,z,930191)
end
