
--DECLARE_QUEST_INFO_START--

x930136_var_FileId = 930136

x930136_var_SelectIndex = {}


x930136_var_ExcObjID = {
	{level = 1 ,num = 100, needID = 12273000, needNum = 100, needName = "1元充值券"},
	{level = 2 ,num = 5000, needID = 12273000, needNum = 100, needName = "1元充值券"},
	{level = 3 ,num = 10000, needID = 12273001, needNum = 200, needName = "5元充值券"},
	{level = 4 ,num = 30000, needID = 12273001, needNum = 200, needName = "5元充值券"},
	{level = 5 ,num = 50000, needID = 12273002, needNum = 400, needName = "10元充值券"},
	{level = 6 ,num = 100000, needID = 12273002, needNum = 400, needName = "10元充值券"},
	{level = 7 ,num = 200000, needID = 12273003, needNum = 600, needName = "50元充值券"},
	{level = 8 ,num = 500000, needID = 12273003, needNum = 600, needName = "50元充值券"},
	{level = 9 ,num = 800000, needID = 12273004, needNum = 1000, needName = "100元充值券"},
	{level = 10 ,num = 1300000, needID = 12273004, needNum = 1000, needName = "100元充值券"},
}


x930136_moneylist = {
	[12273000]=1,
	[12273001]=5,
	[12273002]=10,
	[12273003]=50,
	[12273004]=100,
}

--道具与最小vip等级的对应关系
x930136_moneylevellist = {
	[12273000]=0,
	[12273001]=2,
	[12273002]=4,
	[12273003]=6,
	[12273004]=8,
}

x930136_var_QuestName = "【升级】%s"


--DECLARE_QUEST_INFO_STOP--



function x930136_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
	local money = GetPlayerGameData(varMap,varPlayer,MD_HANDBOOKINGER_INVEST_TIME[1],MD_HANDBOOKINGER_INVEST_TIME[2],MD_HANDBOOKINGER_INVEST_TIME[3])


	local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
	local nextLevel = 0
	if nLevelPre < 10 then
		nextLevel = nLevelPre + 1
	else
		Msg2Player(varMap, varPlayer,format("当前贵族等级%d,已经满级", nLevelPre),8,2)
		Msg2Player(varMap, varPlayer,format("当前贵族等级%d,已经满级", nLevelPre),8,3)
		return 0
	end
	if seleteId == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,format("您已经充值了#R%d元#W\n您当前是#R贵族%d#W级\n",money,nLevelPre))
		TalkAppendString(varMap,format("升级到下级还需要充值#R%d元#W！",x930136_var_ExcObjID[nextLevel].num-money))

		local str = ""
		for k, v in x930136_moneylevellist do
			if v <= nLevelPre then
				str = str .. format("@item_%d", k) .. "\n"
			end
		end

		TalkAppendString(varMap,"可以使用道具列表如下：\n\n" .. str)
		TalkAppendString(varMap,"\n\n点击确定将自动扣除背包内#G充值券#W")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930136_var_FileId, -1);
	end

end


function x930136_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930136_var_FileId,"【充值】贵族等级",3,-1);

end

function x930136_ProcAccept( varMap, varPlayer )

	x930136_Accept( varMap, varPlayer )

end

function x930136_Accept( varMap, varPlayer )
	local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
	local nextLevel = 0
	if nLevelPre < 10 then
		nextLevel = nLevelPre + 1
	else
		Msg2Player(varMap, varPlayer,format("当前贵族等级%d,已经满级", nLevelPre),8,2)
    	Msg2Player(varMap, varPlayer,format("当前贵族等级%d,已经满级", nLevelPre),8,3)
		return 0
	end

    Msg2Player(varMap, varPlayer,format("当前贵族等级%d,下级%d", nLevelPre, nextLevel),8,2)
    Msg2Player(varMap, varPlayer,format("当前贵族等级%d,下级%d", nLevelPre, nextLevel),8,3)

	local curmoney = GetPlayerGameData(varMap,varPlayer,MD_HANDBOOKINGER_INVEST_TIME[1],MD_HANDBOOKINGER_INVEST_TIME[2],MD_HANDBOOKINGER_INVEST_TIME[3])
	local maxmoney = x930136_var_ExcObjID[getn(x930136_var_ExcObjID)].num
	local promoney = curmoney
	for mt, money in x930136_moneylist do
		if x930136_moneylevellist[mt] <= nLevelPre then
			local cnt = GetItemCount( varMap, varPlayer, mt)
			if cnt > 0 then
				if DelItem(varMap,varPlayer,mt,cnt) ~= 1 then
					Msg2Player(varMap, varPlayer,"充值失败！",8,2)
					Msg2Player(varMap, varPlayer,"充值失败！",8,3)
					return 0
				end
			end
			local mm = cnt * money
			promoney = promoney + mm
			if promoney >= maxmoney then
				break
			end
		end

	end
	if promoney == curmoney then
		Msg2Player(varMap, varPlayer,"您没有对应充值券，继续肝吧！",8,2)
		Msg2Player(varMap, varPlayer,"您没有对应充值券，继续肝吧！",8,3)
		return 0
	end

	SetPlayerGameData(varMap,varPlayer,MD_HANDBOOKINGER_INVEST_TIME[1],MD_HANDBOOKINGER_INVEST_TIME[2],MD_HANDBOOKINGER_INVEST_TIME[3], promoney)
    SetPeerVipValue(varMap, varPlayer, promoney);

	Msg2Player(varMap, varPlayer,format("恭喜，您成功充值了%d！", promoney-curmoney),8,2)
	Msg2Player(varMap, varPlayer,format("恭喜，您成功充值了%d！", promoney-curmoney),8,3)

    local nItemID2, nItemNum2, nLevelAfter2 = GetPeerVipInfo(varMap, varPlayer, 1);

    -- 领金改变MD值
    if nLevelPre ~= nLevelAfter2 then
        SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM1[1], MD_PEER_VIP_REWORD_ITEM1[2], MD_PEER_VIP_REWORD_ITEM1[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM2[1], MD_PEER_VIP_REWORD_ITEM2[2], MD_PEER_VIP_REWORD_ITEM2[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM3[1], MD_PEER_VIP_REWORD_ITEM3[2], MD_PEER_VIP_REWORD_ITEM3[3], 0)

        --通知客户端物品可领按钮回复正常
        MsgPeerVipItemOK(varMap, varPlayer, 4);

        LuaCallNoclosure( SCENE_SCRIPT_ID, "OnPlayerVipLvChg", varMap, varPlayer, nLevelAfter2)
        Msg2Player(varMap, varPlayer,format("升级贵族等级%d成功", nLevelAfter2),8,2)
        Msg2Player(varMap, varPlayer,format("升级贵族等级%d成功", nLevelAfter2),8,3)


		local name = GetName(varMap,varPlayer)
		local varMsg = format("恭喜土豪玩家#R%s#W贵族等级提升到#R%d#W级", name, nLevelAfter2)
		LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
    end


end

function x930136_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930136_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930136_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930136_CheckSubmit( varMap, varPlayer )

end




function x930136_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930136_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930136_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930136_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
