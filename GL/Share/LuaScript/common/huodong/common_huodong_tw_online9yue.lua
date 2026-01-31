
--x205012_var_GameId =2005
x205012_var_FileId = 205012

x205012_var_NoMoney								= "对不起，您的现金不足，无法购买！"

x205012_var_Nottime ="不在活动时间内，无法购买！"
x205012_var_Repeat ="你已经购买过礼包了，无法再次购买！"

x205012_var_choice ={
											[9]={menu="购买1份礼包",num=1},
											[10]={menu="购买10份礼包",num=10},
											[11]={menu="购买50份礼包",num=50}
}

x205012_var_itemlist={
											[1]={menu="购买七彩冰激淩",item=12032031,itemname="七彩冰激淩",time={beginmonth=10,endmonth=10,beginday=4,endday=18,begintime=12*60,endtime=12*60},cost=15*1000,status=0,text="\n\t为了感谢广大游戏玩家对成吉思汗3的支持，#R10月4日12点 - 11月1日12点期间#W，玩家可在王城#G新手领奖大使（梅伊娜）#W处，购买七彩冰激淩，机会难得，千万不要错过！"},
											[2]={menu="购买炫彩冰激淩",item=12032035,itemname="炫彩冰激淩",time={beginmonth=10,endmonth=11,beginday=18,endday=1,begintime=12*60,endtime=12*60},cost=15*1000,status=0,text="\n\t为了感谢广大游戏玩家对成吉思汗3的支持，#R10月18日12点 - 11月1日12点期间#W，玩家可在王城#G新手领奖大使（梅伊娜）#W处，购买炫彩冰激淩，机会难得，千万不要错过！"},
											[3]={menu="购买火山冰激淩",item=12032036,itemname="火山冰激淩",time={beginmonth=11,endmonth=11,beginday=1,endday=15,begintime=12*60,endtime=12*60},cost=15*1000,status=0,text="\n\t为了感谢广大游戏玩家对成吉思汗3的支持，#R11月1日12点 - 11月15日12点#W，玩家可在王城#G新手领奖大使（梅伊娜）#W处，购买火山冰激淩，机会难得，千万不要错过！"},
											[4]={menu="购买风暴冰激淩",item=12035341,itemname="风暴冰激淩",time={beginmonth=11,endmonth=11,beginday=15,endday=29,begintime=12*60,endtime=12*60},cost=15*1000,status=0,text="\n\t为了感谢广大游戏玩家对成吉思汗3的支持，#R11月15日12点 - 11月29日12点#W，玩家可在王城#G新手领奖大使（梅伊娜）#W处，购买风暴冰激淩，机会难得，千万不要错过！"},
											[5]={menu="购买再世将星特权卡",item=12035273,itemname="再世将星特权卡",time={beginmonth=10,endmonth=11,beginday=4,endday=1,begintime=12*60,endtime=12*60},cost=249*1000,status=0,text="\n\t为了感谢广大游戏玩家对成吉思汗3的支持，#R10月4日12点 - 11月1日12点#W，玩家可在王城#G新手领奖大使（梅伊娜）#W处，购买再世将星特权卡。\n#R每个角色限购一次，机不可失，时不再来，赶紧购买吧！#W"}

}

x205012_var_SelectButtonHis ={}	
x205012_var_SelectButton ={}												
x205012_var_MD =MD_CUXIAO_9_11YUE



--活动开启状态判断
function checkTimeAndChangeStatus()

	local y , m , d = GetYearMonthDay()
	local minute = GetMinOfDay()
	for i,data in x205012_var_itemlist do
		data.status= 0 
		if y~=2012 then  data.status=0  end 
		if data.time.beginmonth ~= data.time.endmonth then --不同月问题判断
			if m==data.time.beginmonth and d>data.time.beginday then data.status=1  end
			if m==data.time.endmonth and d<data.time.endday then data.status =1  end
		else
			if m==data.time.endmonth and d>data.time.beginday and d<data.time.endday then data.status=1  end
		end
		if m == data.time.beginmonth and d==data.time.beginday and minute>=data.time.begintime then  data.status=1  end  --开始结束两天处理
		if m== data.time.endmonth and d==data.time.endday and minute<data.time.endtime then data.status =1  end
	end 
end


--支付函数
function x205012_PayMoney(varMap,varPlayer,value)

	local nGoldMode = GetGoldMode( varMap,varPlayer )
	
	if nGoldMode == 1 then		
		if CostMoney(varMap, varPlayer, 2, value) == -1 then
			return 0
		end
	
	elseif nGoldMode == 0 then	

			if CostMoney(varMap, varPlayer, 2, value) == -1 then
				return 0

		end
	else
		return 0
	end	
	
	return 1

end



function x205012_GiveBonus( varMap,varPlayer,index)
	
	local varselect = x205012_var_SelectButtonHis[GetGUID(varMap, varPlayer)]
	local vartemp ={num=0,cost=0}
	
	
	
		-- 根据选项计算物品个数和物品总价格
	if varselect == 5 then vartemp.num =1
	else
		vartemp.num =x205012_var_choice[index].num
	end
	vartemp.cost =x205012_var_itemlist[varselect].cost*vartemp.num
	
	StartItemTask(varMap)
		ItemAppendBind(varMap,x205012_var_itemlist[varselect].item,vartemp.num)	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
			if x205012_PayMoney(varMap,varPlayer,vartemp.cost) == 1 then		
		
				StartTalkTask(varMap)
				TalkAppendString(varMap,format("恭喜您获得了%d个礼包！扣除了%d两现金！",vartemp.num,vartemp.cost/1000))
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
				--GamePlayScriptLog( varMap, varPlayer, x205012_var_GameId)
				if varselect == 5 then 
				SetPlayerGameData( varMap, varPlayer,x205012_var_MD[ 1], x205012_var_MD[ 2], x205012_var_MD[ 3] ,1)
				end
				return 1			
			else
				StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,x205012_var_NoMoney)	
				StopTalkTask()
				DeliverTalkTips(varMap,varPlayer)
			end		

		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end	
end




function x205012_ProcEventEntry(varMap, varPlayer, varTalknpc,varQuest,varExt)
	
	x205012_var_SelectButton[GetGUID(varMap, varPlayer)] =varExt --保存第一次的选择项
	if varExt <9 then x205012_var_SelectButtonHis[GetGUID(varMap, varPlayer)] = varExt  end --保存第二次的选择项，其实可以记录一条table记录，好猛啊！
	local varselect = x205012_var_SelectButtonHis[GetGUID(varMap, varPlayer)]
	
	if varExt ==5 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x205012_var_itemlist[varExt].menu)
		TalkAppendString(varMap,x205012_var_itemlist[varExt].text)
		AddQuestItemBonus(varMap, x205012_var_itemlist[varExt].item, 1)
		StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x205012_var_FileId, x205012_var_FileId);
		
	elseif varExt ==9 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x205012_var_itemlist[varselect].menu)
		TalkAppendString(varMap,"\n\t购买#G1#W份#R"..x205012_var_itemlist[varselect].itemname.."#W，需要消耗#R"..(x205012_var_itemlist[varselect].cost*1/1000).."#W两现金,你确定要购买吗？")
		AddQuestItemBonus(varMap, x205012_var_itemlist[varselect].item, 1)
		StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x205012_var_FileId, x205012_var_FileId);
	elseif varExt ==10 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x205012_var_itemlist[varselect].menu)
		TalkAppendString(varMap,"\n\t购买#G10#W份#R"..x205012_var_itemlist[varselect].itemname.."#W，需要消耗#R"..(x205012_var_itemlist[varselect].cost*10/1000).."#W两现金,你确定要购买吗？")
		AddQuestItemBonus(varMap, x205012_var_itemlist[varselect].item, 10)
		StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x205012_var_FileId, x205012_var_FileId);
	elseif varExt ==11 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x205012_var_itemlist[varselect].menu)
		TalkAppendString(varMap,"\n\t购买#G50#W份#R"..x205012_var_itemlist[varselect].itemname.."#W，需要消耗#R"..(x205012_var_itemlist[varselect].cost*50/1000).."#W两现金，你确定要购买吗？")
		AddQuestItemBonus(varMap, x205012_var_itemlist[varselect].item, 50)
		StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x205012_var_FileId, x205012_var_FileId);
	else	
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x205012_var_itemlist[varExt].menu)	
		TalkAppendString(varMap,x205012_var_itemlist[varExt].text)
		
		for j,varmenu in x205012_var_choice do
			TalkAppendButton(varMap,x205012_var_FileId ,x205012_var_choice[j].menu,1,j);
		end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
	end
end









function x205012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	checkTimeAndChangeStatus() --确定各促销活动是否已经开始
	for k,data in x205012_var_itemlist do 
		if data.status ==1 then TalkAppendButton(varMap,x205012_var_FileId,data.menu,10,k) end
	end
	
end









function x205012_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end







function x205012_ProcAccept(varMap, varPlayer)

	--防止奇葩过期
	 local index = x205012_var_SelectButton[GetGUID(varMap, varPlayer)] 
	 local varselect = x205012_var_SelectButtonHis[GetGUID(varMap, varPlayer)] 
	 checkTimeAndChangeStatus()
	 if x205012_var_itemlist[varselect].status == 0 then 
	 	Msg2Player( varMap, varPlayer,x205012_var_Nottime, 8, 3)
	 end
	 
	 --将星特权卡特殊处理
	 if varselect==5 then
	 	local temp = GetPlayerGameData( varMap, varPlayer,x205012_var_MD[ 1], x205012_var_MD[ 2], x205012_var_MD[ 3] )
	 	if temp ==1 then 
	 		Msg2Player( varMap, varPlayer,x205012_var_Repeat, 8, 3)
	 		return
	 	end
	 end
	  
    if x205012_GiveBonus( varMap,varPlayer, index ) == 1 then
    	Msg2Player(varMap,varPlayer,"支付完成!",8,3)
    end                                      		              
end





function x205012_GetBuyCount(varMap, varPlayer, Md)

	if GetPlayerGameData( varMap, varPlayer, Md[ 1], Md[ 2], Md[ 3] ) == 1 then
		return 0   --如果MD记录值为1，则已经买过了，返回0不让购买
	else
		return 1
	end
end



function x205012_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x205012_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x205012_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x205012_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x205012_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x205012_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
