

x930174_var_FileId 		= 930174
x930174_var_ScriptName	= "#R【传送】其它场景"
x930174_var_SelectIndex = {}
x930174_var_maplist = {
	--{id=451,name="角斗场",pos={
	--	{42,128},
	--}},
	{id=901,name="龙之谷",level=80,pos={
		{63,63},
	}},
	{id=1892,name="领主战场",level=90,pos={
		{130,103},
	}},
	--{id=122,name="战场",pos={
	--	{130,103},
	--}},
	{id=568,name="那不勒斯港",level=100,pos={
		{255,364},
	}},
	{id=572,name="拉古扎港",level=105,pos={
		{130,103},
	}},
	{id=573,name="阿尔及尔港",level=110,pos={
		{125,134},
	}},
	{id=574,name="贝鲁特港",level=120,pos={
		{125,134},
	}},
}
x930174_var_TitleInfo		= "\t"

						
function x930174_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,seleteId)
	x930174_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,x930174_var_ScriptName)
		for varI, item in x930174_var_maplist  do
			TalkAppendButton( varMap, x930174_var_FileId, "#R【传送】"..item.name, 3, varI )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)


	end
	if seleteId >= 1 and seleteId <= getn(x930174_var_maplist) then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x930174_var_ScriptName.."#W")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930174_var_FileId, -1)
	end
	

end


function x930174_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local level = GetLevel(varMap, varPlayer)
    if level >= 40 then
        TalkAppendButton(varMap,x930174_var_FileId,x930174_var_ScriptName,3,-1)
    end


end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x930174_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x930174_ProcAccept( varMap, varPlayer )
	local id =  x930174_var_SelectIndex[GetGUID(varMap, varPlayer)]

	local varguo=GetCurCountry(varMap, varPlayer)
	local mapid = x930174_var_maplist[id].id
	local pos = x930174_var_maplist[id].pos[1]
	local x = pos[1]+random(1,10)
	local z = pos[2]+random(1,10)

	local level = GetLevel(varMap, varPlayer)
	if level < x930174_var_maplist[id].level then
		Msg2Player(varMap, varPlayer,format("人物等级不足，需要达到#R%d#W",x930174_var_maplist[id].level),8,3)
		Msg2Player(varMap, varPlayer,format("人物等级不足，需要达到#R%d#W",x930174_var_maplist[id].level),8,2)
		return
	end

	NewWorld(varMap,varPlayer,mapid,x,z,930174)
end
