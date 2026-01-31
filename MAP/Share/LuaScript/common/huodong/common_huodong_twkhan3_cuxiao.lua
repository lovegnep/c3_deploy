--DECLARE_QUEST_INFO_START--

x205004_var_quest_name ="【活动】盛世尊荣礼包"
x205004_var_field_id =205004

x205004_var_Text           ="\n\t尊贵的勇士，您拥有王国的礼遇，毕生难得的机会，只有一次，您只需支付原价#R一折#W就能拥有。活动日期2012年07月5日至2012年09月06日 。"
x205004_var_Content    ="#Y\n礼包内容：#W\n60级：1个黄紫炫彩水银，10个紫檀木炭。\n65级：1个黄紫晕光水银，10个紫檀木炭。\n70级：3个原生钻石矿，10个修行草。\n75级：4个神天琉璃。\n80级：50个微瑕星辰。\n85级：4个天冥琉璃。\n90级：50个四级冥铁。\n#R价格：300两现金#W"
x205004_var_MD            =MD_CUXIAO
x205005_var_Cost          =300*1000
x205004_var_MaxLevel =75
x205004_var_Error ="此礼包只能购买一次！"
x205004_var_NoMoney ="您的现金不足，无法购买！"
x205004_var_ItemBonus ={itemid=12500295,varnum=1,itemname="盛世尊荣礼包"}
x205004_var_Minday =186
x205004_var_Maxday =249





--DECLARE_QUEST_INFO_STOP--





function x205004_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

	local varToday =GetDayOfYear()
	if varToday <x205004_var_Minday or varToday >x205004_var_Maxday then return end   
	
	TalkAppendButton(varMap,x205004_var_field_id,x205004_var_quest_name, 8)	
--	SetPlayerGameData( varMap, varPlayer, x205004_var_MD[ 1], x205004_var_MD[ 2], x205004_var_MD[ 3], 0 )   
end


function x205004_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
			
	StartTalkTask( varMap );
	TalkAppendString(varMap,"#Y"..x205004_var_quest_name)
	TalkAppendString( varMap , x205004_var_Text );
	TalkAppendString( varMap , x205004_var_Content );
	AddQuestItemBonus(varMap,x205004_var_ItemBonus.itemid,x205004_var_ItemBonus.varnum)
	StopTalkTask();
	DeliverTalkInfoNM( varMap , varPlayer , varTalknpc , x205004_var_field_id , varQuest , 0 )
	
end



function x205004_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x205004_PayMoney(varMap,varPlayer, value,OP_Type)

		
	if CostMoney(varMap, varPlayer, 2, value,OP_Type) == -1 then
		return 0
	end	
	
	return 1
end


function x205004_ProcAccept( varMap, varPlayer, varTalknpc, varQuest )
	--md判断
	 if GetPlayerGameData( varMap, varPlayer, x205004_var_MD[ 1], x205004_var_MD[ 2], x205004_var_MD[ 3]) ~=0 then
	 	Msg2Player(varMap,varPlayer,x205004_var_Error,8,2)
		Msg2Player(varMap,varPlayer,x205004_var_Error,8,3)
	 	return
	 end

	if GetBagSpace(varMap, varPlayer) <1 then	
			Msg2Player( varMap, varPlayer, "背包空间不足，至少需要一个空间。", 8, 3)
			Msg2Player( varMap, varPlayer, "背包空间不足，至少需要一个空间。", 8, 2)			
			return
	end
	if x205004_PayMoney(varMap,varPlayer,x205005_var_Cost,308) == 1 then	
		StartItemTask( varMap)
		ItemAppendBind( varMap,x205004_var_ItemBonus.itemid,x205004_var_ItemBonus.varnum)

		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
	    	return
    	end
    

        Msg2Player( varMap, varPlayer, "支付了300两现金，获得了"..x205004_var_ItemBonus.itemname, 8, 3)
        SetPlayerGameData( varMap, varPlayer, x205004_var_MD[ 1], x205004_var_MD[ 2], x205004_var_MD[ 3], 1 )
        DeliverItemListSendToPlayer( varMap, varPlayer)   
    else
    	 Msg2Player( varMap, varPlayer, x205004_var_NoMoney, 8, 3)
    end	     
    
  
end



function x205004_ProcQuestAbandon( varMap, varPlayer, varQuest )

end



function x205004_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end



function x205004_CheckQuestComplete( varMap , varPlayer )

end


function x205004_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

end


function x205004_ProcActiveEvent( varMap, varPlayer )

end


function x205004_ProcIntervalOverEvent( varMap, varPlayer )

end


