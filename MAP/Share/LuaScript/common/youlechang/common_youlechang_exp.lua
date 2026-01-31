
x310348_var_FileId	= 310348




function x310348_FixedBuf(varMap,varPlayer,bufId)

	
	local nImpactCount = GetImpactListCount(varMap,varPlayer)
	if nImpactCount <=0 then
		return
	end
	
	
	local nCollectCount = 0
	for varI=0,nImpactCount-1 do
		
		if GetImpactDataIndex(varMap,varPlayer,varI) == bufId then
			nCollectCount = nCollectCount + 1
		end
	end
	
	
	if nCollectCount > 1 then
		
		nCollectCount = nCollectCount -1
		
		for varI = 1,nCollectCount do
			CancelSpecificImpact(varMap,varPlayer,bufId)
		end
		
		WriteLog(1,format("BUFERROR:varMap=%d,GUID=%X,varLevel=%d,BufTotalCount=%d,BufCount=%d,BufId=%d",GetPlayerGUID(varMap,varPlayer),varMap,GetLevel(varMap,varPlayer),nImpactCount,nCollectCount,bufId))
	end
end


function x310348_ProcIntervalOverEvent( varMap, varPlayer )

	
	x310348_FixedBuf(varMap,varPlayer,7717)

	local day, week = GetWeek()
	if day == 0 or day == 6  then
		if varMap==39 then
			x310348_AddBonus(varMap, varPlayer)
		end
	end
	local varMsg = GetBattleSceneName(varMap)
	if varMsg == "zhanchang_mshuangrenzhanchang/zhanchang_mshuangrenzhanchang.scn"  
		or varMsg == "zhanchang_kuafu2v2/zhanchang_kuafu2v2.scn" 
		or varMsg == "zhanchang_kuafu2v2_02/zhanchang_kuafu2v2_02.scn" 
		or varMsg == "zhanchang_kuafu2v2_03/zhanchang_kuafu2v2_03.scn"
		or varMsg == "zhanchang_kuafu2v2_04/zhanchang_kuafu2v2_04.scn" 
		or varMsg == "zhanchang_kuafu2v2_05/zhanchang_kuafu2v2_05.scn"
		or varMsg == "zhanchang_kuafu2v2_06/zhanchang_kuafu2v2_06.scn"
		or varMsg == "zhanchang_kuafu2v2_07/zhanchang_kuafu2v2_07.scn"
		or varMsg == "zhanchang_kuafu2v2_08/zhanchang_kuafu2v2_08.scn"
		or varMsg == "zhanchang_kuafu2v2_09/zhanchang_kuafu2v2_09.scn"
		or varMsg == "zhanchang_kuafu2v2_10/zhanchang_kuafu2v2_10.scn"
		or varMsg == "zhanchang_kuafu2v2_11/zhanchang_kuafu2v2_11.scn"
		or varMsg == "zhanchang_kuafu2v2_12/zhanchang_kuafu2v2_12.scn"
		or varMsg == "zhanchang_kuafu2v2_13/zhanchang_kuafu2v2_13.scn"
		or varMsg == "zhanchang_kuafu2v2_14/zhanchang_kuafu2v2_14.scn"
		or varMsg == "zhanchang_kuafu2v2_15/zhanchang_kuafu2v2_15.scn"
		or varMsg == "zhanchang_kuafu2v2_16/zhanchang_kuafu2v2_16.scn"	then
		if day == 1 or day == 4 then
			if GetMinOfDay() >= 1195 and GetMinOfDay() <= 1260 then	
				x310348_AddBonus1(varMap, varPlayer)
			end
		elseif day == 0 then
			if GetMinOfDay() >= 775 and GetMinOfDay() <= 900 then	
				x310348_AddBonus1(varMap, varPlayer)		
			end
		else 
			return
		end
	end
end



function x310348_ProcActiveEvent( varMap, varPlayer )

end


function x310348_ProcFadeOutEvent( varMap, varPlayer )

end

function x310348_ProcEventEntry()
end




function x310348_CheckPlayerInArea(varMap, varPlayer)
	if varMap ==39 then
		return 1;
	end

	return 0;
end





function x310348_AddBonus(varMap, varPlayer)
		if GetWeek() ~= 0 and GetWeek() ~= 6 then
			return
		end
		
		if GetWeek() == 6 and GetMinOfDay()>= 1080 then
			return
		end
		
		if GetMinOfDay() < 540 or GetMinOfDay() >=1380 then	
			return
		end

		local varExp = GetLevel( varMap, varPlayer) * 75
		if IsHaveSpecificImpact( varMap, varPlayer, 7510) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7511) == 1 then
			varExp = GetLevel( varMap, varPlayer) * 150;
		end
		AddExp ( varMap , varPlayer , varExp )		
		Msg2Player(varMap,varPlayer,"获得天上人间游园奖励#R经验"..varExp.."点#cffcf00",8,2)
end




function x310348_AddBonus1(varMap, varPlayer)

		if GetWeek() ~= 1 and GetWeek() ~= 4 and GetWeek() ~= 0 then
			return
		end

		local varExp = GetLevel( varMap, varPlayer) * 75
		if IsHaveSpecificImpact( varMap, varPlayer, 7510) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7511) == 1 then
			varExp = GetLevel( varMap, varPlayer) * 150;
		end
		AddExp ( varMap , varPlayer , varExp )		
		Msg2Player(varMap,varPlayer,"获得跨服双人战场奖励#R经验"..varExp.."点#cffcf00",8,2)
end

function x310348_ProcessQuestFail(varMap, varPlayer, varQuest)
end




function x310348_GetDayCount(varMap, varPlayer)

end

