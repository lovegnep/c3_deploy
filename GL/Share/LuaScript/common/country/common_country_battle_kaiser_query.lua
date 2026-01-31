--皇帝战历史查询脚本
x310131_var_FileId		 											= 310131
x310131_var_QueryPrompt											=	"查询皇帝战记录"

x310131_var_CurrentCountryConfirm						="\n当前皇帝国是：#R%s#W"
x310131_var_CurrentHasnoCountryConfirm			="\n\t当前没有皇帝国家产生"

x310131_var_LoulanKaiserInfo								="楼兰共成为过%d次皇帝国,最高连任过%d次" --楼兰获取皇帝的信息
x310131_var_TianshanKaiserInfo							="天山共成为过%d次皇帝国,最高连任过%d次" --天山获取皇帝的信息
x310131_var_KunlunKaiserInfo								="昆仑共成为过%d次皇帝国,最高连任过%d次" --昆仑获取皇帝的信息
x310131_var_DunhuangKaiserInfo							="敦煌共成为过%d次皇帝国,最高连任过%d次" --敦煌获取皇帝的信息

x310131_var_KaiserTotalCount							=	{17, 15} --总共当过皇帝的次数
x310131_var_KaiserConcatenationCount			=	{2, 8} --皇帝最高连任次数

function x310131_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	TalkAppendButton( varMap, x310131_var_FileId, "【国家】"..x310131_var_QueryPrompt, 3, 1); 
end

function x310131_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	
	local kaiserStr = x310131_var_CurrentHasnoCountryConfirm
	local kaiserId = GetEmpireCountry()
	if (kaiserId ~= -1) then
		kaiserStr = format(x310131_var_CurrentCountryConfirm, GetCountryName(kaiserId))
	end
	
	local ordainNum = 0 					--任命次数
	local topConcatenat = 0				--最高连任次数
	
	StartTalkTask(varMap)
	TalkAppendString(varMap, "#Y"..x310131_var_QueryPrompt.."#W")
	TalkAppendString(varMap, kaiserStr)
	
	TalkAppendString(varMap, "\n")
	TalkAppendString(varMap, "#Y各国担任皇帝国记录：#W\n")
	ordainNum = x310131_GetOrdainNum(0)
	topConcatenat = x310131_GetTopConcatenat(0)
	TalkAppendString(varMap, format(x310131_var_LoulanKaiserInfo, ordainNum, topConcatenat))
	
	ordainNum = x310131_GetOrdainNum(1)
	topConcatenat = x310131_GetTopConcatenat(1)
	TalkAppendString(varMap, format(x310131_var_TianshanKaiserInfo, ordainNum, topConcatenat))
	
	ordainNum = x310131_GetOrdainNum(2)
	topConcatenat = x310131_GetTopConcatenat(2)
	TalkAppendString(varMap, format(x310131_var_KunlunKaiserInfo, ordainNum, topConcatenat))
	
	ordainNum = x310131_GetOrdainNum(3)
	topConcatenat = x310131_GetTopConcatenat(3)
	TalkAppendString(varMap, format(x310131_var_DunhuangKaiserInfo, ordainNum, topConcatenat))
	
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	
end

--获取指定国家的任命次数
function x310131_GetOrdainNum(varCountryId)
	local totalCount = GetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_INFO, 
											x310131_var_KaiserTotalCount[1], x310131_var_KaiserTotalCount[2])
	return totalCount
end

--获取指定国家的最高连任次数
function x310131_GetTopConcatenat(varCountryId)
	local count = GetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_INFO, 
											x310131_var_KaiserConcatenationCount[1], x310131_var_KaiserConcatenationCount[2])
	return count
end

function x310131_GetCountryName(varCountryId)
	if(varCountryId == 0) then
		return "楼兰"
	elseif(varCountryId == 1) then
		return "天山"
	elseif(varCountryId == 2) then
		return "昆仑"
	elseif(varCountryId == 3) then
		return "敦煌"
	end
end

function x310131_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310131_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
end
