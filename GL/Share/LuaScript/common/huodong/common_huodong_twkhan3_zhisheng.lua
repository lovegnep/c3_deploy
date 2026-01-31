--DECLARE_QUEST_INFO_START--

x205000_var_quest_name ="【活动】开创新世纪"
x205000_var_field_id =205000
x205000_var_gameid =2010 


x205000_var_Text           ="\n\t天命的勇士，你们将成就难以想像的伟业！\n\t去寻找黄金家族的末裔，去创建你们的氏族，去夺取你们的家园，去开创你们自己的王国！\n\t黄金家族将再次聚集起来，新的世界征服者将从你们当中诞生！"
x205000_var_MD            =MD_ZHISHENG

x205000_var_MaxLevel =75
x205000_var_Error ="此活动只能参与一次！"
x205000_var_ItemBonus ={
													{itemid=12500292,itemname="75级升级卷轴",num=1},
													{itemid=12500294,itemname="王国传承秘宝",num=1}
												 }






--DECLARE_QUEST_INFO_STOP--





function x205000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x205000_var_gameid) ~= 1 then
		return
	end
	TalkAppendButton(varMap,x205000_var_field_id,x205000_var_quest_name, 8)	
end


function x205000_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	--md判断
	 if GetPlayerGameData( varMap, varPlayer, x205000_var_MD[ 1], x205000_var_MD[ 2], x205000_var_MD[ 3]) ~=0 then
	 	Msg2Player(varMap,varPlayer,x205000_var_Error,8,2)
		Msg2Player(varMap,varPlayer,x205000_var_Error,8,3)
	 	return
	 end
	
	local varLevel =GetLevel(varMap,varPlayer)
	if varLevel >= x205000_var_MaxLevel then 
		Msg2Player(varMap,varPlayer,x205000_var_Error,8,2)
		Msg2Player(varMap,varPlayer,x205000_var_Error,8,3)
		return 
	end
			
	StartTalkTask( varMap );
	TalkAppendString(varMap,"#Y"..x205000_var_quest_name)
	TalkAppendString( varMap , x205000_var_Text );

	AddQuestItemBonus(varMap,x205000_var_ItemBonus[1].itemid,x205000_var_ItemBonus[1].num)
	AddQuestItemBonus(varMap,x205000_var_ItemBonus[2].itemid,x205000_var_ItemBonus[2].num)
	StopTalkTask();
	DeliverTalkInfoNM( varMap , varPlayer , varTalknpc , x205000_var_field_id , varQuest , 0 )
	
end



function x205000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end



function x205000_ProcAccept( varMap, varPlayer, varTalknpc, varQuest )

	if GetBagSpace(varMap, varPlayer) <=1 then	
			Msg2Player( varMap, varPlayer, "背包空间不足，至少需要两个空间。", 8, 3)
			Msg2Player( varMap, varPlayer, "背包空间不足，至少需要两个空间。", 8, 2)			
			return
	end
	
	StartItemTask( varMap)
	ItemAppendBind( varMap,x205000_var_ItemBonus[1].itemid,x205000_var_ItemBonus[1].num)
	ItemAppendBind( varMap,x205000_var_ItemBonus[2].itemid,x205000_var_ItemBonus[2].num)
	if StopItemTask( varMap, varPlayer) == 0 then
	    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
	    return
    end
    Msg2Player( varMap, varPlayer, "恭喜您获得了"..x205000_var_ItemBonus[1].itemname, 8, 3)
    Msg2Player( varMap, varPlayer, "恭喜您获得了"..x205000_var_ItemBonus[2].itemname, 8, 3)
    SetPlayerGameData( varMap, varPlayer, x205000_var_MD[ 1], x205000_var_MD[ 2], x205000_var_MD[ 3], 1 )        
    DeliverItemListSendToPlayer( varMap, varPlayer)
  
end



function x205000_ProcQuestAbandon( varMap, varPlayer, varQuest )

end



function x205000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end



function x205000_CheckQuestComplete( varMap , varPlayer )

end


function x205000_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

end


function x205000_ProcActiveEvent( varMap, varPlayer )

end


function x205000_ProcIntervalOverEvent( varMap, varPlayer )

end


