

x270112_var_FileId = 270112   
x270112_var_QuestName = ""
x270112_var_QuestInfo = ""
x270112_var_QuestError = ""
x270112_var_Recruitmsg = {
													{varLevel = 1, varName = "一级招募员", varExp = 100, varAward = 3},
													{varLevel = 2, varName = "二级招募员", varExp = 200, varAward = 4},
													{varLevel = 3, varName = "三级招募员", varExp = 500, varAward = 5},
													{varLevel = 4, varName = "四级招募员", varExp = 900, varAward = 6},
													{varLevel = 5, varName = "五级招募员", varExp = 1500, varAward = 7},
													{varLevel = 6, varName = "六级招募员", varExp = 2500, varAward = 8},
													{varLevel = 7, varName = "七级招募员", varExp = 4000, varAward = 9},
													{varLevel = 8, varName = "八级招募员", varExp = 6000, varAward = 10},
													{varLevel = 9, varName = "九级招募员", varExp = 10000, varAward = 11},
													{varLevel = 10, varName = "十级招募员", varExp = 10000, varAward =12},
												}
--DECLARE_QUEST_INFO_STOP--



function x270112_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
				--获取自身招募等级

			if seleteId == 11 then
				if GetTeamSize(varMap, varPlayer ) < 1 then
					Msg2Player(varMap, varPlayer, "您还未组建队伍", 0, 3)
					return 
				end
				if IsTeamLeader( varMap, varPlayer) ~= 1 then
					Msg2Player(varMap, varPlayer, "您还不是队长", 0, 3)
					return
				end
				if x270112_TeamNum( varMap, varPlayer ) ~= 1 then
						Msg2Player(varMap, varPlayer, "队伍成员不在您身边", 0, 3)
						return
				end
				if x270112_IsRecruit( varMap, varPlayer ) ~= 1 then
						Msg2Player(varMap, varPlayer, "队伍成员不全为您的招募成员", 0, 3)
						return	
				end				
				local level = GetRecruitLevel(varMap, varPlayer, 2)	--1上级，2自己	
				local mixMoney = x270112_GetMoney( varMap, varPlayer )
				local money = x270112_MoneyName(mixMoney)
				local exp = x270112_MoneyMix( varMap, varPlayer )
				StartTalkTask(varMap)
				TalkAppendString(varMap, "【领取奖励】")
				TalkAppendString(varMap, format("\t身为招募员的您，可带领招募的成员在此领取奖励。\n\t您当前为#R%s#W，可获得下线成员消费的#R百分之%d#W的金卡返利！",x270112_var_Recruitmsg[level].varName,x270112_var_Recruitmsg[level].varAward))
				TalkAppendString(varMap, "【奖励资讯】")
				TalkAppendString(varMap, format("您当前可领取的奖励为：#R%s#W金卡，#R%d#W招募经验",money ,exp))
				TalkAppendButton(varMap,x270112_var_FileId,"领奖",3,19)
				
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				return
			end
			if seleteId == 19 then 
				if GetTeamSize(varMap, varPlayer ) < 1 then
					Msg2Player(varMap, varPlayer, "您还未组建队伍", 0, 3)
					return 
				end
				if IsTeamLeader( varMap, varPlayer) ~= 1 then
					Msg2Player(varMap, varPlayer, "您还不是队长", 0, 3)
					return
				end
				if x270112_TeamNum( varMap, varPlayer ) ~= 1 then
						Msg2Player(varMap, varPlayer, "队伍成员不在您身边", 0, 3)
						return
				end
				if x270112_IsRecruit( varMap, varPlayer ) ~= 1 then
						Msg2Player(varMap, varPlayer, "队伍成员不全为您的招募成员", 0, 3)
						return	
				end
				x270112_Accept( varMap, varPlayer, varTalknpc ,seleteId )
				local level = GetRecruitLevel(varMap, varPlayer, 2)	--1上级，2自己	
				local mixMoney = x270112_GetMoney( varMap, varPlayer )
				local money = x270112_MoneyName(mixMoney)
				local exp = x270112_MoneyMix( varMap, varPlayer )
				StartTalkTask(varMap)
				TalkAppendString(varMap, "【领取奖励】")
				TalkAppendString(varMap, format("\t身为招募员的您，可带领招募的成员在此领取奖励。\n\t您当前为#R%s#W，可获得下线成员消费的#R百分之%d#W的金卡返利！",x270112_var_Recruitmsg[level].varName,x270112_var_Recruitmsg[level].varAward))
				TalkAppendString(varMap, "【奖励资讯】")
				TalkAppendString(varMap, format("您当前可领取的奖励为：#R%s#W金卡，#R%d#W招募经验",money ,exp))
				TalkAppendButton(varMap,x270112_var_FileId,"领奖",3,19)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				return
			end
end


function x270112_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
		local a =	LuaCallNoclosure( 802007, "IsServerOpen",varMap, varPlayer)
		if a == 1 then
			TalkAppendButton(varMap,x270112_var_FileId,"领取奖励",3,11)
		end
		local teamSize = GetTeamSize(varMap, varPlayer )
		if teamSize > 1 then
			for i = 1,teamSize, 1 do
				--索引，如果为自身的则跳过
				if GetTeamMemberId(varMap, varPlayer, i-1) ~= varPlayer then
					local playerIDteam = GetTeamMemberId(varMap, varPlayer, i-1)
					if playerIDteam >= 0 then
						LuaCallNoclosure( 802007, "CheckWeek", varMap, playerIDteam)	
					end
				end
			end
		end
end
--钱的格式
function x270112_MoneyName( money)
		if money == 0 then
			return "0两"
		end
		ding  = floor(money/1000000)
		liang = floor((money - ding*1000000)/1000)
		wen   = floor(money -ding*1000000 - liang*1000)
		local str =""
		if ding == 0 then
			if liang == 0 then
			 str =wen.."文"
			else
			 str = tostring(liang.."两"..wen.."文")	
			end
		else
			str = tostring(ding.."锭"..liang.."两"..wen.."文")
		end
		return str
end
--队员是否全在附近 0不在 1在
function x270112_TeamNum( varMap, varPlayer )
--附近队员数
	local nearTeamNum = GetNearTeamCount(varMap, varPlayer)
	local teamNum = GetTeamSize(varMap, varPlayer)
	if nearTeamNum == teamNum then
		return 1
	end
	return 0
end
--是否为招募关系
function x270112_IsRecruit( varMap, varPlayer )
	local teamSize = GetTeamSize(varMap, varPlayer )
	local playerIDteam ={}
	local playerSnIDteam ={}
	for i = 2,teamSize, 1 do
		playerIDteam[i-1] = GetTeamMemberId(varMap, varPlayer, i-1)
		playerSnIDteam[i-1] = GetTeamMemberId(varMap, varPlayer, i-1)
		if GetName(varMap, varPlayer) ~=GetRecruitName(varMap, playerIDteam[i-1], 1, playerSnIDteam[i-1]) then
			return 0
		end
	end
	return 1
end
--成员消费现金总量  单位 两
function x270112_MoneyMix( varMap, varPlayer )
	if GetTeamSize(varMap, varPlayer ) < 1 then
		return 0
	end 
	local teamSize = GetTeamSize(varMap, varPlayer )					
	local moneyMix =0
	for i = 1,teamSize, 1 do
		--索引，如果为自身的则跳过
		if GetTeamMemberId(varMap, varPlayer, i-1) ~= varPlayer then
			local playerIDteam = GetTeamMemberId(varMap, varPlayer, i-1)
			if playerIDteam >= 0 then
				local a =	LuaCallNoclosure( 802007, "GetRecruitGoldMD", varMap, playerIDteam)
				moneyMix = moneyMix + a
			end			
		end
	end
	moneyMix = floor(moneyMix/1000)
	return moneyMix
end
--招募员获得钱
function x270112_GetMoney( varMap, varPlayer )
	local teamSize = GetTeamSize(varMap, varPlayer )
	if teamSize == 0 then
		return 0
	end					
	local moneyMix =0
	for i = 1,teamSize, 1 do
		--索引，如果为自身的则跳过
		if GetTeamMemberId(varMap, varPlayer, i-1) ~= varPlayer then
			local playerIDteam = GetTeamMemberId(varMap, varPlayer, i-1)
			if playerIDteam >0 then
				local a =	LuaCallNoclosure( 802007, "GetRecruitGoldMD", varMap, playerIDteam)
				moneyMix = moneyMix + a
			end
		end
	end
	local level = GetRecruitLevel(varMap, varPlayer, 2)
	local getMoney = floor((x270112_var_Recruitmsg[level].varAward) * moneyMix/100)
	if getMoney <= 0 or getMoney == nil then
		return 0
	end
	return getMoney
end
--清空存款
function x270112_SetMoney( varMap, varPlayer )
	local teamSize = GetTeamSize(varMap, varPlayer )				
	for i = 1,teamSize, 1 do
		--索引，如果为自身的则跳过
		if GetTeamMemberId(varMap, varPlayer, i-1) ~= varPlayer then
			local playerIDteam = GetTeamMemberId(varMap, varPlayer, i-1)
			if playerIDteam >= 0 then
				LuaCallNoclosure( 802007, "SetRecruitGoldMD", varMap, playerIDteam,0)
			end			
		end
	end
end
--给成员加经验
function x270112_AddExpToPlayer( varMap, varPlayer )
	local teamSize = GetTeamSize(varMap, varPlayer )
	for i = 1,teamSize, 1 do
		--索引，如果为自身 则跳过
		if GetTeamMemberId(varMap, varPlayer, i-1) ~= varPlayer then
			local playerIDteam = GetTeamMemberId(varMap, varPlayer, i-1)
			if playerIDteam >= 0 then
				local a =	LuaCallNoclosure( 802007, "GetRecruitGoldMD", varMap, playerIDteam)
				if a ~= 0 then
					local a =	GetLevel(varMap ,playerIDteam)*100000
					AddExp(varMap ,playerIDteam,a)
				end		
			end
		end
	end
end

function x270112_ProcAccept( varMap, varPlayer )
end
--主运行函数
function x270112_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	if GetTeamSize(varMap, varPlayer ) < 1 then
		Msg2Player(varMap, varPlayer, "您还未组建队伍", 0, 3)
		return 
	end
	if IsTeamLeader( varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "您还不是队长", 0, 3)
		return
	end
	if x270112_TeamNum( varMap, varPlayer ) ~= 1 then
			Msg2Player(varMap, varPlayer, "队伍成员不在您身边", 0, 3)
			return
	end
	if x270112_IsRecruit( varMap, varPlayer ) ~= 1 then
			Msg2Player(varMap, varPlayer, "队伍成员不全为您的招募成员", 0, 3)
			return	
	end
	local mixMoney = x270112_GetMoney( varMap, varPlayer )
	if mixMoney ~= 0 then
		local mon = x270112_MoneyMix( varMap, varPlayer )
		AddMoney(varMap, varPlayer,3,mixMoney)
		x270112_AddExpToPlayer( varMap, varPlayer )
		x270112_SetMoney(varMap, varPlayer)
		local money = x270112_MoneyName(mixMoney)
		Msg2Player(varMap, varPlayer, format("恭喜您获得%s金卡",money), 0, 3)	
		x270112_RecruitLevel(varMap, varPlayer, mon)
	else
		Msg2Player(varMap, varPlayer, "已无可领取的奖励", 0, 3)
	end
end
--招募等级增加
function x270112_RecruitLevel( varMap, varPlayer, money )
	local lv = 0
	local exp = 0
	local lv,exp = GetRecruitLevel( varMap, varPlayer,2)
	if lv == 10 then
		Msg2Player(varMap, varPlayer, "招募等级已达上限", 0, 3)
		return
	end
	local lvtext = lv
	if money > 0 then
		local	exp1 = exp + money
		
		for i = lvtext ,10 do
			if exp1 >= x270112_var_Recruitmsg[lv].varExp then
				lv = lv + 1
				exp1 = exp1 - x270112_var_Recruitmsg[lv-1].varExp
			else
				break
			end
		end
		if lv >= 10 then
			lv = 10
			exp1 = 0
		end
		SetRecruitLevel(varMap, varPlayer,lv,exp1)
		Msg2Player(varMap, varPlayer, format("当前招募等级为%d级，成长值为：%d",lv,exp1), 0, 3)
	end

end		
function x270112_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x270112_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x270112_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x270112_CheckSubmit( varMap, varPlayer )

end




function x270112_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x270112_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x270112_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x270112_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
