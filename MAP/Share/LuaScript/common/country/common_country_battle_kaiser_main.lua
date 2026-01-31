--√˙◊≈óM«ªÌÒ Ÿ∫÷π“------¡ê∫÷π“

x310120_var_FileId		 										= 310120
x310120_var_MainMapID											= SCENE_BATTLE_KAISER	--√˙◊≈óM¡ê≤øÿÊId
x310120_var_BackroomMapId									=	SCENE_BATTLE_KAISER_BACKROOM -- √˙◊≈óM≥˘èk≤øÿÊ
--Å≤Ω‹‹÷íö≥˘ÒÛ«ªà~Ù¨ª™∆Z
x310120_var_SecretStreetMapIds						=	{550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 565, 566}
x310120_var_MissionNoticeMap							=	{50, 150, 250, 350} --?ï^–ûêFÑz·˚ªoÌı…∆«ª≤øÿÊ
x310120_var_PrintInfoLog									=	1	--ª≥µÃº€π“Ò˚Õ[Í|õü?µÇ
x310120_var_PrintDebugLog									=	0	--ª≥µÃÒ˚è≥?µÇ

x310120_var_KaiserTimerIndex							=	314	--√˙◊≈timerÕ∞∏ú«ª€∏l

x310120_var_NoKaiserScript								=	310121 --¡ÉÙ¨√˙◊≈«ª∫÷π“
x310120_var_HasKaiserScript								=	310122 --Ù¨√˙◊≈«ª∫÷π“
x310120_var_BackroomScript								=	310124 --≥˘èk«ª∫÷π“
x310120_var_AssistantScript								=	310123 --¬‰¡î∫÷π“
x310120_var_SecretStreetScript						=	310125	--≥˘ÒÛ∫÷π“
x310120_var_QuestId												=	9230

x310120_var_QuestKillNumIndex								=	4	--?ï^Å´?«ª€∏l

x310120_var_ExtHonourLimit								=	1500 --∑Ô?ÕøÇX?Ù˚«ªäf∞j≥t
x310120_var_ToplistLevelLimit							=	65
x310120_var_ToplistId											=	0 --?’Õ◊´ˆπÇk€˝
x310120_var_ToplistRank										=	99 --?’Õ◊´ˆπ√“∞Ù

--‹¢ÇkäC«ª≤‹Ω≤
x310120_var_IsStarted											=	0	--√˙◊≈óMåÎ¥·±m√›ÙÀåa«ªË˜µÇ
x310120_var_HasKaiser											=	0	--Ë˜äoΩ ?åÎ¥·±mÙ¨±◊Öt

--±◊ƒ£≤‹Ω≤Õ[≥t
x310120_var_IsKaiser											= {0, 2}	--Ë˜äoÍπ“Ø 1√˙◊≈, 2¡ê—±, 0¬‰—±
x310120_var_KaiserConcatenationCount			=	{2, 8} --√˙◊≈‡I—ØÛ∞?∞Ùñf
x310120_var_KaiserConcatenationTempCount	=	{10, 7} --√˙◊≈Û∞?ªπäC∞Ùñf
x310120_var_KaiserTotalCount							=	{17, 15} --‹ö∆ÕΩ ≥π√˙◊≈«ª∞Ùñf
x310120_var_LastKaiserDay									=	{0, 15}	--äf∞Ù∑Ô?√˙◊≈«ª??
x310120_var_KaiserCancelNotice						=	"%s±æ¥Œª µ€’Ω»°œ˚!!!"
x310120_var_ToplistCase										=	"≈≈––∞Ò◊Ó··“ª√˚µ»º∂≤ª¬˙65º∂,"
x310120_var_KingCase											=	"”…Ï∂Àƒπ˙√ª”–π˙ÕıªÚ÷ª”–“ª∏ˆπ˙º“¥Ê‘⁄π˙Õı,"
x310120_var_KaiserStartNotice							=	"ª µ€’Ω‘⁄…≥≥«ø™ º¡À£°"

--√˙◊≈óMÙÀåa«ªΩ“ª‚
function x310120_ProcBattleKaiserStart(varMap)
	if (x310120_ValidateMap(varMap) == 0) then
		return
	end
	
	if (x310120_var_PrintDebugLog == 1) then
	--	WriteLog(1, 
	--	format("x310120_ProcBattleKaiserStart Debug --- x310120_var_IsStarted = %d, x310120_ValidateIsFinishAhead = %d, varMap = %d",
	--					 x310120_var_IsStarted, x310120_ValidateIsFinishAhead(), varMap))
	end
	
	if (x310120_var_IsStarted == 0) then
		if (x310120_ValidateIsFinishAhead() == 0) then
			x310120_ProcBattleStartup(varMap)
		end	
	end

end

--ªo≥πNPC¬•Buff«ª??
function x310120_ProcAddNpcBuff(varMap, varCountry, varTarget, varBuff)
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ProcAddNpcBuff Info --- varMap = %d, varCountry = %d, varBuff = %d", 
					varMap, varCountry, varBuff))
	end
	
	if (varMap == x310120_var_BackroomMapId) then --◊ÓÜt«ªÕ≥ñf∏ú,´ÄäÛÌœΩ“ª‚Ÿã≥N≥˘èkªª›‘çî¬•buff«ªÍ|õü
						
	LuaCallNoclosure( x310120_var_BackroomScript, "ProcAddNpcBuff", 
					varMap, varCountry, varTarget, varBuff)
	end
end

--??óM–ÎåÎ¥·Ò›±pÙÀåa
function x310120_ProcBattleKaiserStartRequest(varMap)
	
	local kaiserCountry = x310120_GetKaiser()
	if (x310120_var_PrintDebugLog == 1) then 
		WriteLog(1, format(" x310120_ProcBattleKaiserStartRequest = %d", kaiserCountry))
	end	
	
	local result = 0
	if (kaiserCountry == -1) then --¡ÉÙ¨√˙◊≈«ªΩ“ª‚
		
		local topListResult = 0
		--Ë∂ΩÀˆπÇk€˝,åÎ¥·≥˚ÂÕÙÀ?„¡ß,Ã?ËÊØ` TODO ±Ö◊∫¬•,äÊäCÖÏ«•ËÊØ`ªo≥π
		local nWorldId = GetWorldIdEx()
		local snid, level = GetToplistInfo(nWorldId, x310120_var_ToplistId, x310120_var_ToplistRank)
		
		--ˆπÇk€˝Ë∂
		if (level >= x310120_var_ToplistLevelLimit) then
			topListResult = 1
		end
		
		if (x310120_var_PrintInfoLog == 1) then
			WriteLog(1, format("x310120_ProcBattleKaiserStartRequest Info --- topListResult = %d ", topListResult ))
		end
		
		--Ë∂ΩÀ∑™∂Â±◊ƒ£±◊ÖtÍ|õü,µÑåÊÙ¨´î∂Â±◊ƒ£Ù¨±◊Öt
		local hasKingResult = 0
		local kingId = -1
		for countryId = 0, 3 do
			kingId = CountryGetKingGUID(countryId)
			if (kingId ~= -1) then
				hasKingResult = 1
				break
			end
		end
		
		if (topListResult == 1 and hasKingResult == 1) then
			result = 1
		else
			local broadcast = x310120_var_KaiserCancelNotice
			if (topListResult == 0) then
				broadcast = format(x310120_var_KaiserCancelNotice, x310120_var_ToplistCase)
			end
			
			if (hasKingResult == 0) then
				broadcast = format(x310120_var_KaiserCancelNotice, x310120_var_KingCase)
			end
			
			LuaAllScenceM2Wrold(varMap, broadcast, 5, 1)
		end
		
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, 
			format("x310120_ProcBattleKaiserStartRequest Debug --- No Kaiser, topListResult = %d, hasKingResult = %d", 
						topListResult, hasKingResult))
		end
		
	else
		if (x310120_GetNextPossibleKaiser() ~= -1) then
			result = 1
		end
	end
	result=1
	BattleKaiserRequestAffirm(result)
end

--ÜïÁÊ¬•ãCÍπ“Ø∞˝ºø
function x310120_PreLoadRoles(varKaiserId, varMainAttackId)
	if (x310120_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310120_PreLoadRoles --- varKaiserId = %d, varMainAttackId = %d",
			varKaiserId, varMainAttackId))
	end
	
	for countryId = 0, 3 do
		if (countryId == varMainAttackId) then
			SetCountryParamByBit(countryId, CD_KAISER_BATTLE_INFO, x310120_var_IsKaiser[1],
				 x310120_var_IsKaiser[2], 2)
		else
			SetCountryParamByBit(countryId, CD_KAISER_BATTLE_INFO, x310120_var_IsKaiser[1],
				 x310120_var_IsKaiser[2], 0)
		end
	end
end

--∑Ô?™B´î∂Â‡IÙ¨Ò›ŸÁΩ ±◊Öt«ª±◊ƒ£,¿Ã¡ê—±‘¥
function x310120_GetNextPossibleKaiser()
	
	local kaiser = x310120_GetKaiser()
	if (x310120_var_PrintDebugLog == 1) then 
		WriteLog(1, format(" kaiser = %d", kaiser))
	end	
	
	local backTable = {} 
	local countryId
	for i = 1, 4 do
		countryId = i - 1
		
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_GetNextPossibleKaiser Debug --- %d π˙º“π˙ÕıId = %d ",
						 countryId, CountryGetKingGUID(countryId)))
		end
						 
		if (countryId ~= kaiser) then
			
			if (CountryGetKingGUID(countryId) ~= -1) then
				for t = 1, 4 do
					if (backTable[t] == nil) then
						backTable[t] = countryId
						break
					end
				end
			end
			
		end
		
	end
	
	if (getn(backTable) == 0) then
		WriteLog(1, format("x310120_GetNextPossibleKaiser Warning!!! --- backTable = nil"))
		return -1
	end
	
	local backTableCount = getn(backTable)
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_GetNextPossibleKaiser Debug --- backTableCount = %d",
					 backTableCount))
	end
	
	local days = 0
	local mainAttackCounryId = -1
	--local tempDay = GetDayTime()
	local tempDay = 4294967296 --‘¥ÍÿÒˆè≥
	local tempDaySortTable = {}
	
	for i = 1, backTableCount do
		countryId = backTable[i]
		days = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_LAST_KAISER_DATE, 
												x310120_var_LastKaiserDay[1], x310120_var_LastKaiserDay[2])
		
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_GetNextPossibleKaiser Debug --- countryId = %d, tempDay = %d, days = %d",
						 countryId, tempDay, days))
		end
		
		if (days <= tempDay) then
			if (days < tempDay) then
				tempDay = days
				tempDaySortTable = {}
			end
			
			for tempIndex = 1, getn(backTable) do
				if (tempDaySortTable[tempIndex] == nil) then
					tempDaySortTable[tempIndex] = countryId
				
					if (x310120_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310120_GetNextPossibleKaiser Debug tempDaySortTable %d = %d",
					 		tempIndex, countryId))
					end
				
					break
				end
			end
		end
		
	end
	
	local tempDayCount = getn(tempDaySortTable)
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_GetNextPossibleKaiser Debug tempDaySortTable number = %d",
						tempDayCount))
	end
	
	if (tempDayCount == 1) then
		return tempDaySortTable[1]
	else --??ÌÒ∞π,åuË∂ΩÀ??€˝
		local tempStrongWeakTable = {}
		local tempStrongWeakScore = -1
		local score = 0
	
		for i = 1, tempDayCount do
			countryId = tempDaySortTable[i]
			score = GetStrongWeakScore(countryId)
			
			if (x310120_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310120_GetNextPossibleKaiser Debug countryId = %d, score = %d, tempStrongWeakScore = %d",
						countryId, score, tempStrongWeakScore))
			end
			
			if (score >= tempStrongWeakScore) then
				
				if (score > tempStrongWeakScore) then
					tempStrongWeakScore = score
					mainAttackCounryId = countryId
					tempStrongWeakTable = {}
				end
				
				for tempIndex = 1, tempDayCount do
					if (tempStrongWeakTable[tempIndex] == nil) then
						tempStrongWeakTable[tempIndex] = countryId
						break
					end
				end
				
			end
		end
		
		local strongWeakTableCount = getn(tempStrongWeakTable)
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, 
				format("x310120_GetNextPossibleKaiser Debug --- tempStrongWeakTable count = %d", 
						strongWeakTableCount))
		end
		
		if (strongWeakTableCount > 1) then
			local index = random(1, strongWeakTableCount)
			
			if (x310120_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310120_GetNextPossibleKaiser Debug --- random StrongWeakTableIndex index = %d", 
						index))
			end
			
			return tempStrongWeakTable[index]
		elseif (getn(tempStrongWeakTable) == 1) then
			return tempStrongWeakTable[1]
		end
		
	end
	
end

---Ë∂ΩÀóMúVåÎ¥·±m√›ñê?∏≥Í∫
function x310120_ValidateIsFinishAhead()
	local kaiserCountry = x310120_GetKaiser()
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ValidateIsFinishAhead() Debug --- kaiserCountry = %d", kaiserCountry))
	end
	
	if (kaiserCountry ~= -1) then
		local day = GetDayTime()
		local kaiserDay = GetCountryParamByBit(kaiserCountry, CD_KAISER_BATTLE_LAST_KAISER_DATE, 
				x310120_var_LastKaiserDay[1], x310120_var_LastKaiserDay[2])		
				
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ValidateIsFinishAhead() Debug ---day = %d, kaiserDay = %d", day, kaiserDay))
		end

		if (day == kaiserDay) then
			return 1
		end
				
	end
	
	return 0
end

--√˙◊≈óM∏≥Í∫«ªΩ“ª‚
function x310120_ProcBattleKaiserOver(varMap)
	if (x310120_ValidateMap(varMap) == 0) then
		return
	end

	if (x310120_var_IsStarted == 1) then
		x310120_ProcBattleShutdown(varMap)
	end
end

--Ë∂ΩÀ√˙◊≈óMåÎ¥·±m√›ÙÀ?
function x310120_IsStart(varMap)
	return x310120_var_IsStarted
end
--Ω“ª‚óMúV?–€«ªÀ™◊Ó 
function x310120_ProcBattleStartup(varMap)
	local lastKaiser = x310120_GetKaiser()
	
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ProcBattleStartup Debug --- varMap = %d, lastKaiser = %d"
					, varMap, lastKaiser))
	end
	
	if (lastKaiser == -1) then --¡ÉÙ¨√˙◊≈
		if (varMap ~= x310120_var_MainMapID) then --¡ê≤øÿÊ∑˚∆ƒΩ“ª‚¡ÉÙ¨√˙◊≈«ª«˚‚‰
			return
		end
		
		x310120_var_HasKaiser = 0
	else 
		--Ω“ª‚Ù¨√˙◊≈«ª«˚‚‰
		x310120_var_HasKaiser = 1
		x310120_PreLoadRoles(lastKaiser, x310120_GetNextPossibleKaiser())
		
		local CountryId =x310120_GetNextPossibleKaiser()
		local CountryName =""
		if CountryId == 0 then
			CountryName ="¬•¿º"
		elseif CountryId == 1 then
			CountryName ="ÃÏ…Ω"
		elseif CountryId == 2 then
			CountryName ="¿•¬ÿ"
		elseif CountryId == 3 then
			CountryName ="∂ÿªÕ"
		end			
		x310120_var_KaiserStartNotice ="ª µ€’Ωø™ º¡À£¨±æ¥Œ÷˜π•∑Ω «"..CountryName.."£°"
	end
	
	local scriptId = x310120_GetCurrentScriptId(varMap)
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ProcBattleStartup Debug --- varMap = %d, scriptId = %d"
					,varMap, scriptId))
	end
	
	if (scriptId ~= 0) then
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcBattleStartup Debug --- PushMissionToServer"))
		end
		
		if (varMap == x310120_var_MainMapID) then --ÌœÙ¨¡êª™∆Z∑˚Ω“ª‚±p™B˜’ŸÁ
			TransferKaiserOrder(8) --ÙÀåa,∆ƒ≥N?∂Ω∆\Éﬂ?ï^
			LuaAllScenceM2Wrold(varMap, x310120_var_KaiserStartNotice, 5, 1)
		end
		LuaCallNoclosure( scriptId, "ProcBattleKaiserProcess", 
								varMap, x310120_var_KaiserTimerIndex)
								
		x310120_var_IsStarted = 1
		
		ChangeMapRestrictiveMode(varMap, 0) --‘ÿÚ€ª™∆Z«ª“´åd
	end
end

--∑Ô?Ω ?Œ¯Çk«ª∫÷π“—Ò
function x310120_GetCurrentScriptId(varMap)
	local kaiserCountry = x310120_GetKaiser()
	
	if (kaiserCountry == -1) then --¡ÉÙ¨±◊Öt
		return x310120_var_NoKaiserScript
	else --Ù¨±◊Öt«ª∫÷π“
		if (varMap == x310120_var_MainMapID) then
			return x310120_var_HasKaiserScript
		elseif (varMap == x310120_var_BackroomMapId) then
			return x310120_var_BackroomScript
		else
			if (x310120_IsSecretStreetMap(varMap) == 1) then --◊ˆÒÛ∫÷π“
					return x310120_var_SecretStreetScript
			end
		end
	end
	
	return 0
end

--Ω“ª‚óMúV ŸÎ∑«ªÀ™◊Ó
function x310120_ProcBattleShutdown(varMap)
	if (x310120_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310120_ProcBattleShutdown Info --- varMap = %d, The Battle is shutdown !!!", varMap))
	end
	
	local scriptId = x310120_GetCurrentScriptId(varMap)
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ProcBattleStartup Debug --- varMap = %d, scriptId = %d"
					,varMap, scriptId))
	end
	
	if (scriptId ~= 0) then
		LuaCallNoclosure( scriptId, "ProcBattleKaiserOver", varMap)
	end
	local missionNoticeMap1 = -1
	local missionNoticeMap2 = -1
	local missionNoticeMap3 = -1
	local missionNoticeMap4	=	-1
	
	if (x310120_var_MissionNoticeMap[1] ~= nil) then
		missionNoticeMap1 = x310120_var_MissionNoticeMap[1]
	end
	
	if (x310120_var_MissionNoticeMap[2] ~= nil) then
		missionNoticeMap2 = x310120_var_MissionNoticeMap[2]
	end
	
	if (x310120_var_MissionNoticeMap[3] ~= nil) then
		missionNoticeMap3 = x310120_var_MissionNoticeMap[3]
	end
	
	if (x310120_var_MissionNoticeMap[4] ~= nil) then
		missionNoticeMap4 = x310120_var_MissionNoticeMap[4]
	end
	
	if (x310120_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310120_ProcBattleShutdown Debug --- NoticeMap: map1 = %d, map2 = %d, map3 = %d, map4 = %d",
			missionNoticeMap1, missionNoticeMap2, missionNoticeMap3, missionNoticeMap4))
	end
	TransferKaiserOrder(9, -1, -1, missionNoticeMap1, missionNoticeMap2, missionNoticeMap3, missionNoticeMap4)
	
	x310120_var_IsStarted = 0
	x310120_var_HasKaiser = 0
	
	ChangeMapRestrictiveMode(varMap, -1) --‘ÿÚ€ª™∆Z«ª“´åd
end

--ËÊØ`≤øÿÊ
function x310120_ValidateMap(varMap)
	if (varMap ~= x310120_var_MainMapID 
					and varMap ~= x310120_var_BackroomMapId) then
		return 0
	end
		
	return 1
end

--Ω“ª‚Ç`ƒ£¡æ?√˙◊≈óMª™∆Z«ª«˚‚‰
function x310120_ProcPlayerEnter(varMap, varPlayer)
	if (x310120_var_IsStarted == 1) then
		
		local scriptId = x310120_GetCurrentScriptId(varMap)
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcPlayerEnter Debug --- varMap = %d, scriptId = %d"
						,varMap, scriptId))
		end
		
		if (scriptId ~= 0) then
			LuaCallNoclosure( scriptId, "ProcPlayerEnterMap", varMap, varPlayer)
		end
		
	end
end

--Ω“ª‚Ç`ƒ£÷ÚÙÀ√˙◊≈óMª™∆Z«ª«˚‚‰
function x310120_ProcPlayerLeave(varMap, varPlayer)
	if (x310120_var_IsStarted == 1) then
		
		local scriptId = x310120_GetCurrentScriptId(varMap)
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcPlayerLeave Debug --- varMap = %d, scriptId = %d"
						,varMap, scriptId))
		end
		
		if (scriptId ~= 0) then
			LuaCallNoclosure( scriptId, "ProcPlayerLeaveMap", varMap, varPlayer)
		end
	
	end
end

--Ω“ª‚Ç`ƒ£Å˘ÖÜ
function x310120_ProcPlayerRelive( varMap, varPlayer, varReliveOp)
	if (x310120_var_IsStarted == 1) then
		
		local scriptId = x310120_GetCurrentScriptId(varMap)
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcPlayerLeave Debug --- varMap = %d, scriptId = %d"
						,varMap, scriptId))
		end
		
		if (scriptId ~= 0) then
			LuaCallNoclosure( scriptId, "ProcPlayerRelive", varMap, varPlayer, varReliveOp)
			return 1
		end

	end
	return 0
end

--Ω“ª‚Ç`ƒ£¡æ?¿£Òˆ?‡K
function x310120_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ProcAreaEntered Debug --- x310120_var_IsStarted = %d, varArea = %d", 
						x310120_var_IsStarted, varArea))
	end
	
	if (x310120_var_IsStarted == 1) then
		local scriptId = x310120_GetCurrentScriptId(varMap)
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcPlayerLeave Debug --- varMap = %d, scriptId = %d"
						,varMap, scriptId))
		end	
		
		if (scriptId ~= 0) then
			LuaCallNoclosure( scriptId, "ProcAreaEntered", varMap, varPlayer, varArea)
		end
	end
	
end

--Ω“ª‚Ç`ƒ£÷ÚÙÀ?‡K
function x310120_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )
	
end

function x310120_ProcMapTimerTick( varMap, monsterobjid )
end

--Ω“ª‚NPCÅ˘ÖÜ«˚‚‰
function x310120_ProcMapDie( varMap, varDieId, varKiller )
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_ProcMapDie Debug --- varMap = %d, varDieId = %d, varKiller = %d", 
						varMap, varDieId, varKiller))
	end
end

--∑Ô?√˙◊≈±◊
function x310120_GetKaiser()
	return GetEmpireCountry()
end

--«§¿Î±◊ƒ£≤‹Ω≤
function x310120_SetCountryFreeParam(varMap, varCurrentKaiserId)
	local lastKaiserId = x310120_GetKaiser()
	
	if (x310120_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310120_SetCountryFreeParam Info --- varCurrentKaiserId = %d, lastKaiserId = %d",
					varCurrentKaiserId, lastKaiserId))
	end
				
	if (lastKaiserId ~= varCurrentKaiserId) then
			--SetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, x310120_var_IsKaiser[1],
			--		 x310120_var_IsKaiser[2], 1)
			CreateEmperor(varMap, varCurrentKaiserId, 1)
			
			if (lastKaiserId ~= -1) then
			if (x310120_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310120_SetCountryFreeParam Debug --- Clear Last Kaiser Free Param"))
			end
			--?√™äf?√˙◊≈±◊ƒ£≤‹Ω≤
			--SetCountryParamByBit(lastKaiserId, CD_KAISER_BATTLE_INFO, x310120_var_IsKaiser[1],
			--		 x310120_var_IsKaiser[2], 0)
			
			--ŒµÛ∞?ªπäCñf?√™
			SetCountryParamByBit(lastKaiserId, CD_KAISER_BATTLE_INFO, 
					x310120_var_KaiserConcatenationTempCount[1], x310120_var_KaiserConcatenationTempCount[2], 0)
					 
			end
	end
	
	--«§¿Î‹ö∞Ùñf
	local totalCount = GetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, 
															x310120_var_KaiserTotalCount[1], x310120_var_KaiserTotalCount[2])
	
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310120_SetCountryFreeParam Debug --- totalCount = %d", totalCount + 1))
	end
	
	SetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, x310120_var_KaiserTotalCount[1],
				 x310120_var_KaiserTotalCount[2], totalCount + 1)
	
	if (lastKaiserId == varCurrentKaiserId) then --Û∞?Ω“ª‚
		
		-- ˝ÖÏÛ∞?ªπäCñf
		local concatenationTemp = GetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, 
									x310120_var_KaiserConcatenationTempCount[1], x310120_var_KaiserConcatenationTempCount[2]) + 1
		
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_SetCountryFreeParam Debug --- Concatenation Kaiser, concatenationTemp = %d", 
							concatenationTemp))
		end
							
		SetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, 
				x310120_var_KaiserConcatenationTempCount[1], x310120_var_KaiserConcatenationTempCount[2], concatenationTemp)
				
		local concatenationCount = GetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, 
														x310120_var_KaiserConcatenationCount[1], x310120_var_KaiserConcatenationCount[2])
														
		if (concatenationTemp > concatenationCount) then --Û∞?ªπäCñf±’≥πŸãÛ∞?∞Ùñf,‘ÿ⁄ÎÛ∞?∞Ùñf
			if (x310120_var_PrintInfoLog == 1) then
				WriteLog(1, format("x310120_SetCountryFreeParam Info --- ConcatenationCount Update!!!"))
			end
			SetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_INFO, 
									x310120_var_KaiserConcatenationCount[1], x310120_var_KaiserConcatenationCount[2], concatenationTemp)
		end
	end
	
	local day = GetDayTime()
	if (x310120_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310120_SetCountryFreeParam() Info --- day = %d", day))
	end
	
	SetCountryParamByBit(varCurrentKaiserId, CD_KAISER_BATTLE_LAST_KAISER_DATE, x310120_var_LastKaiserDay[1],
				 x310120_var_LastKaiserDay[2], day) 
end

--ÙÀ?≥˘èk
function x310120_ProcOpenBackroom(varMap)
	if (x310120_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310120_ProcOpenBackroom Info --- varMap = %d", varMap))
	end

	if (x310120_var_IsStarted == 1) then
		if (varMap == x310120_var_MainMapID) then --?±åÎ¡ê≤øÿÊ
			LuaCallNoclosure( x310120_var_HasKaiserScript, "ProcOpenBackroom", 
						varMap)
		elseif (varMap == x310120_var_BackroomMapId) then
			LuaCallNoclosure( x310120_var_BackroomScript, "ProcOpenBackroom", 
						varMap)
		end
	end
end

--Ω“ª‚Ç`ƒ£Å˘ÖÜ
function x310120_ProcPlayerDie(varMap, varPlayer, varKiller)
	
	if (x310120_var_IsStarted == 1) then
		local scriptId = x310120_GetCurrentScriptId(varMap)
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcPlayerDie Debug --- varMap = %d, scriptId = %d"
						,varMap, scriptId))
		end
		
		if (scriptId ~= 0) then
			LuaCallNoclosure( scriptId, "ProcPlayerDie", varMap, varPlayer, varKiller)
		end
		
	end
end

--Ë∂ΩÀåÎ¥·çR≥˘èk«ª≤øÿÊ
function x310120_IsSecretStreetMap(varMap)
	local isSecretMap = 0
	for mapIndex = 1, getn(x310120_var_SecretStreetMapIds) do
		if (varMap == x310120_var_SecretStreetMapIds) then
			isSecretMap = 1
			break
		end
	end
	
	return isSecretMap
end

--Ω“ª‚Ç`ƒ£ÕøÇX∑Ô?«ª?Ù˚
function x310120_ProcPlayerExtHonour(varMap, varPlayer, varHonour)
	if (x310120_var_IsStarted == 1) then
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, 
					format("x310120_ProcPlayerExtHonour Debug --- varMap = %d, varPlayer = %d, varHonour = %d",
								 varMap, varPlayer, varHonour))
		end
		
		local honourDay = GetPlayerGameData(varMap, varPlayer, MD_KAISER_EXTHONOUR_DATE[1], 
									MD_KAISER_EXTHONOUR_DATE[2], MD_KAISER_EXTHONOUR_DATE[3])
									
		local today = GetDayOfYear()
		if (today ~= honourDay) then
			SetPlayerGameData(varMap, varPlayer, MD_KAISER_EXTHONOUR_DATE[1], 
									MD_KAISER_EXTHONOUR_DATE[2], MD_KAISER_EXTHONOUR_DATE[3], today)
			
			SetPlayerGameData(varMap, varPlayer, MD_KAISER_EXTHONOUR_VALUE[1], 
									MD_KAISER_EXTHONOUR_VALUE[2], MD_KAISER_EXTHONOUR_VALUE[3], 0)						
		end
		
		local currentHonour = GetPlayerGameData(varMap, varPlayer, MD_KAISER_EXTHONOUR_VALUE[1], 
									MD_KAISER_EXTHONOUR_VALUE[2], MD_KAISER_EXTHONOUR_VALUE[3])
		
		if (currentHonour < x310120_var_ExtHonourLimit) then
			
			if (currentHonour + varHonour > x310120_var_ExtHonourLimit) then
				varHonour = x310120_var_ExtHonourLimit - currentHonour
			end
			
			if (x310120_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310120_ProcPlayerExtHonour Info --- varMap = %d, varPlayer = %d, currentHonour = %d, varHonour = %d", 
								varMap, varPlayer, currentHonour, varHonour))
			end
			
			AddHonor(varMap, varPlayer, varHonour)
			Msg2Player(varMap, varPlayer, format("ª µ€’Ω∂ÓÕ‚ªÒµ√»Ÿ”˛%d", varHonour), 0, 2)
			SetPlayerGameData(varMap, varPlayer, MD_KAISER_EXTHONOUR_VALUE[1], 
									MD_KAISER_EXTHONOUR_VALUE[2], MD_KAISER_EXTHONOUR_VALUE[3], currentHonour + varHonour)
		end
	end
	
end

--Ω“ª‚Ç`ƒ£óM⁄Ó«ªÕøÇX?Ù˚
function x310120_ProcPlayerChariotExtHonour(varMap, varPlayer, varHonour)
	if (x310120_var_IsStarted == 1) then
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, 
					format("x310120_ProcPlayerChariotExtHonour Debug --- varMap = %d, varPlayer = %d, varHonour = %d",
								 varMap, varPlayer, varHonour))
		end
		
		local honourDay = GetPlayerGameData(varMap, varPlayer, MD_KAISER_CHARIOT_EXTHONOUR_DATE[1], 
									MD_KAISER_CHARIOT_EXTHONOUR_DATE[2], MD_KAISER_CHARIOT_EXTHONOUR_DATE[3])
									
		local today = GetDayOfYear()
		if (today ~= honourDay) then
			SetPlayerGameData(varMap, varPlayer, MD_KAISER_CHARIOT_EXTHONOUR_DATE[1], 
									MD_KAISER_CHARIOT_EXTHONOUR_DATE[2], MD_KAISER_CHARIOT_EXTHONOUR_DATE[3], today)
			
			SetPlayerGameData(varMap, varPlayer, MD_KAISER_CHARIOT_EXTHONOUR_VALUE[1], 
									MD_KAISER_CHARIOT_EXTHONOUR_VALUE[2], MD_KAISER_CHARIOT_EXTHONOUR_VALUE[3], 0)						
		end
		
		local currentHonour = GetPlayerGameData(varMap, varPlayer, MD_KAISER_CHARIOT_EXTHONOUR_VALUE[1], 
									MD_KAISER_CHARIOT_EXTHONOUR_VALUE[2], MD_KAISER_CHARIOT_EXTHONOUR_VALUE[3])
		
		if (currentHonour < x310120_var_ExtHonourLimit) then
			
			if (currentHonour + varHonour > x310120_var_ExtHonourLimit) then
				varHonour = x310120_var_ExtHonourLimit - currentHonour
			end
			
			if (x310120_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310120_ProcPlayerChariotExtHonour Info --- varMap = %d, varPlayer = %d, currentHonour = %d, varHonour = %d", 
								varMap, varPlayer, currentHonour, varHonour))
			end
			
			AddPlayerChariotHonour(varMap, varPlayer, varHonour)
			Msg2Player(varMap, varPlayer, format("ª µ€’Ω∂ÓÕ‚ªÒµ√’Ω≥µ»Ÿ”˛%d", varHonour), 0, 2)
			SetPlayerGameData(varMap, varPlayer, MD_KAISER_CHARIOT_EXTHONOUR_VALUE[1], 
									MD_KAISER_CHARIOT_EXTHONOUR_VALUE[2], MD_KAISER_CHARIOT_EXTHONOUR_VALUE[3], currentHonour + varHonour)
		end  
		LuaCallNoclosure(x310120_var_FileId, "ProcPlayerKillMission",varMap, varPlayer, 2)
	end
end
--ÇUÿ˜Ç`ƒ£Å´?◊∫«ª?ï^Ω“ª‚
function x310120_ProcPlayerKillMission(varMap, varPlayer, varNum)
	if (IsHaveQuest(varMap, varPlayer, x310120_var_QuestId) > 0) then --ÍπäfÙ¨?ï^
		local questIdx = GetQuestIndexByID( varMap, varPlayer, x310120_var_QuestId)
		local killNum = GetQuestParam( varMap, varPlayer, questIdx, x310120_var_QuestKillNumIndex)
		
		if (x310120_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310120_ProcPlayerKillMission Debug --- varMap = %d, varPlayer = %d, killNum = %d",
						varMap, varPlayer, killNum))
		end
		
		SetQuestParam( varMap, varPlayer, x310120_var_QuestId, x310120_var_QuestKillNumIndex, killNum + varNum)
		--∆M⁄Î?ï^ ˝ñf,?Ñz·˚,∫˛ÙÀ¿ÃÒ›
		--LuaCallNoclosure( x310120_var_AssistantScript, "ProcQuestLogRefresh", varMap, varPlayer, x310120_var_QuestId)
	end
end