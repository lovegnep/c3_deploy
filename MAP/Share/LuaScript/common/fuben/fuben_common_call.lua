



x700103_var_FileId			=	700103



x700103_CSP_FUBENTYPE				= 	0
x700103_CSP_SCRIPTID				=	1
x700103_CSP_TICKCOUNT				= 	2
x700103_CSP_BACKSCENEID				= 	3
x700103_CSP_ISCLOSING				= 	4
x700103_CSP_LEAVECOUNTDOWN			= 	5
x700103_CSP_TEAMID					=	6
x700103_CSP_TICKTIME				=	7
x700103_CSP_HOLDTIME				=	8
x700103_CSP_FUBENLEVEL				=	9

x700103_CSP_FUBEN_SCENE_ID			=	10
x700103_CSP_CLOSETICK				=	11
x700103_CSP_TICKCOUNT_ADD			=	12
x700103_CSP_TICKCOUNT_SUB			=	13
x700103_CSP_B_TOPLIST_ABLE			=	14
x700103_CSP_PLAYER_DEAD				=	15


x700103_CSP_HUMAN_COUNT				=	240
x700103_CSP_PLAYER_ENTER_START		=	241

x700103_CSP_LAST_TICKOUNT			=	247
x700103_CSP_GUID_START              =   248  
x700103_CSP_FUBEN_TYPE				=	254	
x700103_CSP_FUBEN_MODE				=   255

x700103_var_baoxiangexpmulti = {
{level = 37 , multi = 10000},
{level = 57 , multi = 23400},
{level = 72 , multi = 32400},
{level = 160 , multi = 108900}															
}




x700103_var_TopListMonsterLimited = {
									{varScript = 700028, varCount = 10, campid = 21},  
									{varScript = 700023, varCount = 10, campid = 21},  
									{varScript = 700004, varCount = 10, campid = 21},  
									{varScript = 700024, varCount = 10, campid = 21},  
									{varScript = 700008, varCount = 10, campid = 21},  
									{varScript = 700009, varCount = 10, campid = 21},  
									{varScript = 700108, varCount = 10, campid = 21},  
									{varScript = 700027, varCount = 10, campid = 21},  
									{varScript = 700109, varCount = 10, campid = 21},  
									{varScript = 700030, varCount = 10, campid = 21},  
									{varScript = 700031, varCount = 10, campid = 21},  
									{varScript = 700032, varCount = 10, campid = 21},  
									{varScript = 700084, varCount = 10, campid = 21}, 
									{varScript = 700085, varCount = 10, campid = 21}, 
									{varScript = 700086, varCount = 10, campid = 21}, 
									{varScript = 700087, varCount = 10, campid = 21}, 
									{varScript = 700088, varCount = 10, campid = 21}, 
									{varScript = 700089, varCount = 10, campid = 21}, 
									{varScript = 700090, varCount = 10, campid = 21}, 
									{varScript = 700091, varCount = 10, campid = 21}, 
									{varScript = 700092, varCount = 10, campid = 21}, 
								}




function x700103_ProcFubuenCompleted(varMap)
	if GetSceneType(varMap)~=1 then
		return
	end

    LuaCallNoclosure(930193, "OnFubenPassCallback", varMap)

	local nFubenType = GetFubenData_Param(varMap, 0 )
	local nFubenMode = GetFubenData_Param(varMap, 255 )

	local nParam = 0
	
	local strFubenName = ""
	if nFubenType == FUBEN_DONGHAIHAIYAN then
		nParam = QIULONGDAO_TOPLIST
		strFubenName = "囚龙岛"
	elseif nFubenType == FUBEN_HESHIBI then
		nParam = HESHIBI_TOPLIST
		strFubenName = "和氏璧"
	elseif nFubenType == FUBEN_HUOQIYING then
		nParam = CAISHENDIAN_TOPLIST
		strFubenName = "赤血号"
	elseif nFubenType == FUBEN_ZHUJIAZHUANG3 then
		nParam = ZHUJIAZHUANG_TOPLIST
		strFubenName = "祝家庄"
	elseif nFubenType == FUBEN_FUTUTA4 then
		nParam = LUNHUITAI_TOPLIST
		strFubenName = "轮回台"
	elseif nFubenType == FUBEN_TANSUO_ZHANSHENMU_3 then
		nParam = ZHANSHENMU_TOPLIST
		strFubenName = "夏王墓"
	elseif nFubenType == FUBEN_YINDUSHENMIAO3 then
		nParam = INDIANTEMPLE_TOPLIST
		strFubenName = "印度河"
	elseif nFubenType == FUBEN_JIAOTANGMIMI3 then
		nParam = JINGJIAOTANG_TOPLIST
		strFubenName = "大教堂"
    --elseif nFubenType == FUBEN_TIANGUAN then
    --    strFubenName = "天关"
	else
		return
	end

	



	if nFubenType ~= FUBEN_FUTUTA4 then
		if nFubenMode == 0 then
			return
		end
	else
		Type = GetFubenData_Param(varMap, x700103_CSP_FUBEN_TYPE )
		if Type ~= 0 then
			return
		end
	end
	
	local nResult = x700103_CheckFubenTopList(varMap)
	if nResult~=3 and nResult~=6 then
		return
	end

	local nTick = GetFubenData_Param(varMap, x700103_CSP_LAST_TICKOUNT )
	local nTickCount = GetFubenData_Param(varMap, x700103_CSP_TICKCOUNT )

	local humancount = GetFuben_PlayerCount(varMap);

	
	local nowTime = (nTick+nTickCount)*5;
	local nHour = floor(nowTime/3600)
	local nMinute = floor(nowTime/60)
	local nSec = mod(nowTime,60)
	
	local strTime = "恭喜您仅用了"
	if nHour>0 then
		strTime = strTime..format("%d小时", nHour)
	end
	if nMinute>0 then
		strTime = strTime..format("%d分",nMinute)
	end
	if nSec>0 then
		strTime = strTime..format("%d秒",nSec)
	end

	strTime = strTime.."完成了"..strFubenName.."副本";
	
	x700103_ShowTipsToAll(varMap,strTime)
	
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		SendToplistKeyValue2GL(varMap,humanId,nParam,(nTick+nTickCount)*5)
	end

	if nowTime>15*60 then
		return
	end

	if nFubenType == FUBEN_DONGHAIHAIYAN then
		LuaCallNoclosure( 701103, "ProcFubuenCompleted", varMap) 
	elseif nFubenType == FUBEN_HESHIBI then
		LuaCallNoclosure( 701109, "ProcFubuenCompleted", varMap)  
	elseif nFubenType == FUBEN_HUOQIYING then						
		LuaCallNoclosure( 701115, "ProcFubuenCompleted", varMap)  
	elseif nFubenType == FUBEN_ZHUJIAZHUANG3 then
		LuaCallNoclosure( 701121, "ProcFubuenCompleted", varMap) 
	elseif nFubenType == FUBEN_FUTUTA4 then
		
	elseif nFubenType == FUBEN_TANSUO_ZHANSHENMU_3 then
		LuaCallNoclosure( 701106, "ProcFubuenCompleted", varMap) 
		
	elseif nFubenType == FUBEN_YINDUSHENMIAO3 then
		LuaCallNoclosure( 701118, "ProcFubuenCompleted", varMap)	
	elseif nFubenType == FUBEN_JIAOTANGMIMI3 then
		LuaCallNoclosure( 701112, "ProcFubuenCompleted", varMap)  
	else
		return
	end

	
	
	
end


function x700103_CheckFubenTopList(varMap, nCheckMode)
	if GetSceneType(varMap)~=1 then
		return 1 
	end

	
	local bToplistDisabled = GetFubenData_Param(varMap, x700103_CSP_B_TOPLIST_ABLE )

	if(bToplistDisabled>0) then
		return 2 
	end

	local varScriptFileId = GetFubenData_Param(varMap, 1 )

	

	local bFind = 0;
	local varMaxCount = 0;
	local nStdCampId = 0
	for varI,item in x700103_var_TopListMonsterLimited do
		if item.varScript ==  varScriptFileId then
			bFind = 1;
			varMaxCount = item.varCount;
			nStdCampId = item.campid
			break;
		end
	end

	if(bFind==0) then
		return 3 
	end

	local nFubenType = GetFubenData_Param(varMap, 0 )
	local nFubenMode = GetFubenData_Param(varMap, 255 )

	



	if nFubenType ~= FUBEN_FUTUTA4 then
		if nFubenMode == 0 then
			return 4 
		end
	else
		Type = GetFubenData_Param(varMap, x700103_CSP_FUBEN_TYPE )
		if Type ~= 0 then
			return
		end
	end
	
	local varCount = 0;
	local nMonsterCount = GetMonsterCount(varMap)
	for varI=1,nMonsterCount do
    	local varObj = GetMonsterObjID(varMap,varI-1)

		local nCamp = GetMonsterCamp(varMap,varObj)
    	if nCamp == nStdCampId then  
    		varCount = varCount + 1
    	end
	end

	if(varCount>varMaxCount) then
		if nCheckMode~=nil then
			if nCheckMode==1 then
			else
				SetFubenData_Param(varMap, x700103_CSP_B_TOPLIST_ABLE, 1 )
				x700103_ShowTipsToAll(varMap,"剩余怪物数过多，无法进入排行榜！")
			end
		else
			SetFubenData_Param(varMap, x700103_CSP_B_TOPLIST_ABLE, 1 )
			x700103_ShowTipsToAll(varMap,"剩余怪物数过多，无法进入排行榜！")
		end
		 
		return 5, varCount,varMaxCount 
	end
	return 6


	
end




function x700103_IsPlayerErrorState( varMap,varPlayer )

    local varState

    varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        return 1
    end

		varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_ENJAIL )
    if varState == 1 then
        return 1
    end	

	
	varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_WEDDING )
    if varState == 1 then
        return 1
    end

	varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        return 1
    end

	varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TIESAN )
    if varState == 1 then
        return 1
    end
	


    return 0

end

function x700103_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end


function x700103_ProcXianjinBossDie(varMap)	

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local addInh = 600
		if GetLevel(varMap, humanId) >= 80 then
			if IsHaveSpecificImpact( varMap, humanId, 9012) == 1 then 
				addInh =  addInh + floor(addInh*0.20)
			end
			local refixInh = AddInherenceExp(varMap, humanId, addInh)
			local varStr = format("你获得了%d点天赋值",refixInh)
			Msg2Player(varMap,humanId,varStr,8,2)
			Msg2Player(varMap,humanId,varStr,8,3)
		end
			local level = GetLevel(varMap, humanId)
			local baseexp = level * x700103_GetbaseMulti(varMap, humanId)
			local multi = x700103_IsMulti( varMap, humanId)
		if multi > 0 then
			AddExp(varMap, humanId, floor(baseexp*multi))
			Msg2Player( varMap, humanId, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(baseexp*multi)), 8, 2)
			Msg2Player( varMap, humanId, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(baseexp*multi)), 8, 3)
		end
	end
end

function x700103_ProcZhanCheBossDie(varMap, varRate)
end

function x700103_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end
function x700103_GetbaseMulti(varMap, varPlayer)
	local varLevel =GetLevel( varMap, varPlayer)
	for varI,item in x700103_var_baoxiangexpmulti do
		if varLevel <= item.level then
			return item.multi
		end
	end
	return 0
end
