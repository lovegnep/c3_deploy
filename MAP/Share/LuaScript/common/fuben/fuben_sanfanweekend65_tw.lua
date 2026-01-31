

x701128_var_FileId 		= 701128
x701128_var_ScriptName	= "提交三番令(六十五级)"

x701128_var_SubmitItem	= 11990011

x701128_var_TitleInfo		= "\t你是否觉得最近没时间来三番副本？不要烦恼，找我就好了，只要你交给我两个#G三番令#W我就能给予你完成三番副本对应的经验。当然这么做会#Y占用一次三番副本次数#W。\n\t怎么样，你愿意交给我两个#G三番令#W，获得%d点经验吗？\n \n#G小提示：\n\t一天只能提交三次三番令，一周总共可以提交7次。\n\t有江湖请柬效果时提交，经验奖励会翻倍。"

						
function x701128_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	local varLevel = GetLevel(varMap,varPlayer)
	StartTalkTask(varMap)
		
		local varExp =varLevel*163350
		if varLevel < 70 then
			varExp =3256200
		elseif varLevel < 75 then
			varExp =3499200
		elseif varLevel < 80 then
			varExp =12577950
		elseif varLevel < 85 then
			varExp =varLevel*163350
		end				
		TalkAppendString(varMap,"#Y"..x701128_var_ScriptName.."#W")
		TalkAppendString(varMap,format(x701128_var_TitleInfo,varExp))
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x701128_var_FileId, x701128_var_FileId)
end


function x701128_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	--local week = GetWeek()
	--if week == 0 or week == 6 then
		TalkAppendButton(varMap,x701128_var_FileId,x701128_var_ScriptName,3,0)
	--end
end

function x701128_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x701128_ProcAccept( varMap, varPlayer )
	--local week = GetWeek()
	--if week == 1 or week == 2 or week == 3 or week == 4 or week == 5 then
				--Msg2Player(varMap, varPlayer,format("提交#{_ITEM%d}失败，请于周六或周日再来", x701128_var_SubmitItem), 0, 2)
				--Msg2Player(varMap, varPlayer,format("提交#{_ITEM%d}失败，请于周六或周日再来", x701128_var_SubmitItem), 0, 3)
				--return
	--end			

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel <65 then
		Msg2Player( varMap, varPlayer, "很抱歉，你等级过低，提交失败", 8, 3)
		Msg2Player( varMap, varPlayer, "很抱歉，你等级过低，提交失败", 8, 2)
		return
	end

	if varLevel >84 then
		Msg2Player( varMap, varPlayer, "很抱歉，你等级过高，提交失败", 8, 3)
		Msg2Player( varMap, varPlayer, "很抱歉，你等级过高，提交失败", 8, 2)
		return
	end

	if GetItemCountInBag(varMap, varPlayer, x701128_var_SubmitItem) < 2 then
		local varMsg = format("很抱歉，你没有2个#{_ITEM%d}，提交失败", x701128_var_SubmitItem)
		Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		return
	end
	
	local weekcount = 0
	local varDaycount = 0
	
	local weekIndex = GetWeekIndex()
	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DATE[1],MD_FUBEN_QIULONGDAO_DATE[2],MD_FUBEN_QIULONGDAO_DATE[3])
	if lastWeek == weekIndex then
		weekcount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1],MD_FUBEN_QIULONGDAO_DAYCOUNT[2],MD_FUBEN_QIULONGDAO_DAYCOUNT[3] )
	end
			
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAY[1],MD_FUBEN_QIULONGDAO_TODAY[2],MD_FUBEN_QIULONGDAO_TODAY[3] )
	if varToday == varLastday then	
		varDaycount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1],MD_FUBEN_QIULONGDAO_TODAYCOUNT[2],MD_FUBEN_QIULONGDAO_TODAYCOUNT[3] )
	end
	
	if weekcount > 18 or varDaycount > 6 then
		local varMsg = "很抱歉，您今天已经没有剩余的三番次数"
		Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		return
	end
	
	local date = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_WEEKEND_SANFAN_DATE[1],MD_FUBEN_WEEKEND_SANFAN_DATE[2],MD_FUBEN_WEEKEND_SANFAN_DATE[3])
	--if varToday == date then
		--local varMsg = "很抱歉，一天只能提交一次三番令"
		--Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		--Msg2Player( varMap, varPlayer, varMsg, 8, 2)
		--return
	--end
	
	if weekIndex ~= lastWeek then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DATE[1], MD_FUBEN_QIULONGDAO_DATE[2], MD_FUBEN_QIULONGDAO_DATE[3], weekIndex)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3], 3)
	else
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3], weekcount+3)
	end
	
	if varToday ~= varLastday then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAY[1], MD_FUBEN_QIULONGDAO_TODAY[2], MD_FUBEN_QIULONGDAO_TODAY[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3], 3)
	else
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3], varDaycount+3)
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_WEEKEND_SANFAN_DATE[1], MD_FUBEN_WEEKEND_SANFAN_DATE[2], MD_FUBEN_WEEKEND_SANFAN_DATE[3], varToday)
	
	if DelItem(varMap, varPlayer, x701128_var_SubmitItem, 2) ~= 1 then return 0 end
	
	local varExp =varLevel*163350
		if varLevel < 70 then
			varExp =3256200
		elseif varLevel < 75 then
			varExp =3499200
		elseif varLevel < 80 then
			varExp =12577950
		elseif varLevel < 85 then
			varExp =varLevel*163350
		end				
	if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
		AddExp(varMap, varPlayer, varExp*2)
		Msg2Player(varMap, varPlayer,format("提交三番令完成，在江湖请柬作用下获得了#G经验%d#cffcf00点",varExp*2), 0, 2)
		Msg2Player(varMap, varPlayer,format("提交三番令完成，在江湖请柬作用下获得了#G经验%d#cffcf00点",varExp*2), 0, 3)
	else	
		AddExp(varMap, varPlayer, varExp)
		Msg2Player(varMap, varPlayer,format("提交三番令完成，获得了#G经验%d#cffcf00点",varExp), 0, 2)
		Msg2Player(varMap, varPlayer,format("提交三番令完成，获得了#G经验%d#cffcf00点",varExp), 0, 3)
	end
end
