x306002_g_ScriptId = 306002

-- 怪物创建后世界广播消息


-- Boss表

function x306002_ProcTimingDoingStart( sceneId, actId, Param1, Param2, Param3, Param4, Param5)

end

-- Boss被杀后处理
function x306002_ProcDie( sceneId, selfId, killerId)
	local ObjType = GetObjType(sceneId,killerId)
	if ObjType == 3 then		-- 被PET杀死
		ObjType = 1
		killerId = GetOwnerID(sceneId, killerId)
	end
	if ObjType ~= 1 then
		return
	end
	if IsPlayerStateNormal( sceneId,killerId ) ~= 1 then
		return
	end
	local name = GetName( sceneId, killerId)
    local countryId = GetCurCountry( sceneId, killerId)
	local countryName = GetCountryName(countryId)
	local msg1 = "强大的战场之魂已被"..countryName..name.."在报名大厅中心击败！"
	local msg2 ="强大的战场之魂已被"..countryName..name.."击败"
	LuaThisScenceM2Wrold( sceneId, msg1, CHAT_PLANE_SCROLL, 1 )
	LuaThisScenceM2Wrold( sceneId, msg2, CHAT_LEFTDOWN, 1 )
	LuaThisScenceM2Wrold( sceneId, msg2, 5, 1 )

end
