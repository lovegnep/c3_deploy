
x700127_var_Quest_ScriptId = 700121
x700127_var_GrowType = 595
x700127_var_ItemId = 11000200

-- 以下为采集部分
-- 采集点生成
function x700127_ProcGpCreate( sceneId, growPointType, x, y )
	local ItemBoxId = ItemBoxEnterScene( x, y, x700127_var_GrowType, sceneId, 0, x700127_var_ItemId )
end

-- 采集打开前
function x700127_ProcGpOpen(sceneId,selfId,targetId)

	--return LuaCallNoclosure( x700127_var_Quest_ScriptId, "ProcGpOpen", sceneId, selfId, targetId, x700127_var_ItemId )
	return 0
end

-- 采集回收
function x700127_ProcGpRecycle(sceneId,selfId,targetId)
	
	local isOK = LuaCallNoclosure( x700127_var_Quest_ScriptId, "OnRecycle", sceneId, selfId, targetId, x700127_var_GrowType, x700127_var_ItemId )
	return isOK
	--StartItemTask(sceneId)
	--	ItemAppend( sceneId, 11000210, 1 )
	--	ItemAppend( sceneId, 11000211, 1 )
	--	ItemAppend( sceneId, 11000212, 1 )
	--	ItemAppend( sceneId, 11000213, 1 )
	--	ItemAppend( sceneId, 11000214, 1 )
	--	ItemAppend( sceneId, 11000215, 1 )
	--	DropItemListToScene(sceneId, selfId, 0)
	--return 1
end

-- 采集读条之后
function x700127_ProcGpProcOver(sceneId,selfId,targetId)

end

