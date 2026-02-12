

x930206_var_FileId 		= 930206
x930206_var_ScriptName	= "传送至大都"


x930206_var_TitleInfo		= "\t"

						
function x930206_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x930206_var_ScriptName.."#W")
		TalkAppendString(varMap,x930206_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930206_var_FileId, x930206_var_FileId)
end


function x930206_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x930206_var_FileId,x930206_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x930206_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x930206_ProcAccept( varMap, varPlayer )
	NewWorld(varMap,varPlayer,0,259,192,930206)
end

function x930206_Showzhanshen( varMap, nFubenType,nFubenMode )
	-- 不知道为啥，这里传进来的nFubenType一直等于0
    WriteLog(1,format("x930206_Showzhanshen enter %d %d %d", varMap, nFubenType,nFubenMode))
	-- ========================================
	-- 在这里添加你的自定义逻辑
	-- ========================================

	-- 示例1：根据副本类型给予不同奖励
	local nParam = 0

	local strFubenName = ""
	local jy = 0.08
	if nFubenType == FUBEN_DONGHAIHAIYAN then
		nParam = QIULONGDAO_TOPLIST
		strFubenName = "囚龙岛"
		jy = 0.18
	elseif nFubenType == FUBEN_HESHIBI then
		nParam = HESHIBI_TOPLIST
		strFubenName = "和氏璧"
		jy = 0.15
	elseif nFubenType == FUBEN_HUOQIYING then
		nParam = CAISHENDIAN_TOPLIST
		strFubenName = "赤血号"
		jy = 0.15
	elseif nFubenType == FUBEN_ZHUJIAZHUANG3 then
		nParam = ZHUJIAZHUANG_TOPLIST
		strFubenName = "祝家庄"
		jy = 0.15
	elseif nFubenType == FUBEN_FUTUTA4 then
		nParam = LUNHUITAI_TOPLIST
		strFubenName = "轮回台"
		jy = 0.15
	elseif nFubenType == FUBEN_TANSUO_ZHANSHENMU_3 then
		nParam = ZHANSHENMU_TOPLIST
		strFubenName = "夏王墓"
		jy = 0.15
	elseif nFubenType == FUBEN_YINDUSHENMIAO3 then
		nParam = INDIANTEMPLE_TOPLIST
		strFubenName = "印度河"
		jy = 0.15
	elseif nFubenType == FUBEN_JIAOTANGMIMI3 then
		nParam = JINGJIAOTANG_TOPLIST
		strFubenName = "大教堂"
		jy = 0.15
	elseif nFubenType == FUBEN_TIANGUAN then
		nParam = JINGJIAOTANG_TOPLIST
		strFubenName = "天关"
		jy = 0.15
	else
		jy = 0.65
	end


	 --示例2：根据副本模式给予奖励（普通/困难/英雄）
	 if nFubenMode == 1 then
	     -- 困难模式额外奖励
		 jy = jy + 0.05
	 elseif nFubenMode == 2 then
	     -- 英雄模式额外奖励
		 jy = jy + 0.06
	 end
    WriteLog(1,format("x930206_Showzhanshen leave %d %d %d %.2f", varMap, nFubenType,nFubenMode,jy))

	x930206_ShowTipsToAll(varMap, format("当前副本出战神概率%.2f", jy))

	return floor(jy*100)
end
function x930206_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);


	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);

		Msg2Player( varMap,humanId,varStr,8,2)
		Msg2Player( varMap,humanId,varStr,8,3)
	end
end
