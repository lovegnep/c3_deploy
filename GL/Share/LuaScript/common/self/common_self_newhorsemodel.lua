

x930123_var_FileId = 930123
x930123_var_QuestName = "#G【坐骑】外形变换"
x930123_var_ModelList = {
{probability = 6000, items = {314,315,346,347,348,349,362,363,365,366,367,370,375,377,379,380,381,385,392,393,394,395,397,400,401,402,404,407,408}},
}
if x930123_var_CountList == nil then x930123_var_CountList = {} end
x930123_var_MaxCount = 50


function x930123_OnEnumerate(varMap, varPlayer, varTalknpc, varQuest)
	AddQuestNumText( varMap, x930123_var_FileId, x930123_var_QuestName, 3, 1)
end

function x930123_DispatchEnterInfo( varMap, varPlayer, varTalknpc)	
	BeginQuestEvent(varMap)
	AddQuestText( varMap, x930123_var_QuestName.."\n#W\t您在我这随机更换第一只坐骑的外形，每小时有"..x930123_var_MaxCount.."次机会。" )
	EndQuestEvent()
	DispatchQuestInfo( varMap, varPlayer, varTalknpc, x930123_var_FileId, -1)
end

function x930123_OnDefaultEvent(sceneId, selfId, NPCId, nScriptId, nFlag)

	if nFlag== nil then
		return
	end

	x930123_DispatchEnterInfo( sceneId, selfId, NPCId )
	
end

function x930123_CheckAccept( varMap, varPlayer, varTalknpc)
    return 1
end

function x930123_OnAccept( varMap, varPlayer)
	local horsecount = GetHorseCount(varMap, varPlayer)
	if horsecount > 0 then
		local newid = x930123_RandomSelect()
		local restcount = x930123_GetRestCount(varMap, varPlayer)
		if restcount < 0 then
			Msg2Player(varMap,varPlayer,"这一小时的变形次数用完了，请下一小时再来",8,2);
			return
		end
		if newid ~= -1 then
			local ret = SetHorseModelID(varMap, varPlayer, 0, newid)
			if ret == newid then
				Msg2Player(varMap,varPlayer,"变换坐骑成功，请下马后重新召唤!",8,2);
				Msg2Player(varMap,varPlayer,"您还有"..restcount.."次机会!",8,2);
			else
				Msg2Player(varMap,varPlayer,"运气不好，变换坐骑失败!",8,2);
			end
		else
			Msg2Player(varMap,varPlayer,"运气不好，变换坐骑失败，请重新尝试!",8,2);
		end
	else
		Msg2Player(varMap,varPlayer,"你还没有坐骑!",8,2);
	end
end



function x930123_RandomSelect()
--	if 1==1 then return 551 end
	local Min = 1
	local Max = 1
	local probability = random(1,6000)
	for varI,iter in x930123_var_ModelList do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
			return iter.items[random(1, getn(iter.items))]
		end
	end
	return -1
end

function x930123_GetRestCount(varMap, varPlayer)
	local guid = GetGUID(varMap, varPlayer)
	local hour, min, second = GetHourMinSec()
	if hour ~= x930123_var_CurHour then
		x930123_var_CountList = {}
		x930123_var_CurHour = hour
	end
	
	local count = x930123_var_CountList[guid]
	if count == nil then
		count = x930123_var_MaxCount
	end
	x930123_var_CountList[guid] = count - 1
	return count - 1
end
