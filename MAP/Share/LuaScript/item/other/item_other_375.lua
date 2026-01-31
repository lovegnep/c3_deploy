


x418375_item_key_array = {
	[ 12030717 ] = 1 , 
	[ 12030718 ] = 2 , 
	[ 12030719 ] = 3 ,
	[ 12030720 ] = 4 ,
	[ 12030721 ] = 5 ,
}

x418375_item_array = {
	{ lv = 20 , clr_name = "#YQQ新手速成礼包（20级）" , item_list = "1个世传海蓝钻石和1个小生命清露，需要占用3个背包格。"},
	
	{ lv = 30 , clr_name = "#YQQ新手速成礼包（30级）" , item_list = "1个三番令和1个修行草，需要占用3个背包格。"},
	
	{ lv = 40 , clr_name = "#YQQ新手速成礼包（40级）" , item_list = "1个国传海蓝钻石和2个精品杰克丹尼，需要占用3个背包格。"},
	
	{ lv = 50 , clr_name = "#YQQ新手速成礼包（50级）" , item_list = "1个国传灵魂印和5个五仁月饼，需要占用3个背包格。"},
	
	{ lv = 60 , clr_name = "#YQQ新手速成礼包（60级）" , item_list = "50个神传水晶和1个中生命清露，需要占用2个背包格。"},
};

x418375_item_list = {

	{ lv = 20, list = { { varId = 11000210 , varNum = 1}, { varId = 12010020 , varNum = 1} }, list2 = { { varId = 12030718 , varNum = 1} } },
	
	{ lv = 30, list = { { varId = 11990011 , varNum = 1}, { varId = 12041101 , varNum = 1} }, list2 = { { varId = 12030719 , varNum = 1} } },
	
	{ lv = 40, list = { { varId = 11000214 , varNum = 1}, { varId = 12250006 , varNum = 2} }, list2 = { { varId = 12030720 , varNum = 1} } },
	
	{ lv = 50, list = { { varId = 11000302 , varNum = 1}, { varId = 12030253 , varNum = 5} }, list2 = { { varId = 12030721 , varNum = 1} } },
	
	{ lv = 60, list = { { varId = 11000202 , varNum = 50}, { varId = 12010021 , varNum = 1} } },
	
};


x418375_array_size = 5;
x418375_title_enabled_color = "";
x418375_title_disabled_color = "#cb4b4b4";


function x418375_ProcEventEntry( varMap, varPlayer, varBagIdx )

end




function x418375_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end




function x418375_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end




function x418375_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end




function x418375_ProcDeplete( varMap, varPlayer )
	return 1;
end


function x418375_ProcActivateOnce( varMap, varPlayer, varImpact )
	LuaCallNoclosure( 418375, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
end


function x418375_get_item_table_id( varMap , varPlayer )
	local bag_id = GetBagIndexOfUsedItem( varMap , varPlayer );
	
	if ( bag_id == nil ) then
		return nil
	end
	
	local item_id = GetItemIDByIndexInBag( varMap , varPlayer , bag_id );
	
	if ( item_id == nil ) then
		return nil
	end
	
	return item_id
end


function x418375_get_item_key( varMap , varPlayer )
	local item_id = x418375_get_item_table_id( varMap , varPlayer );
	
	if ( item_id == nil ) then
		return	nil
	end
	
	local key = x418375_item_key_array[ item_id ];
	
	if ( key == nil ) or ( key > getn( x418375_item_array ) ) then
		return nil
	end
	
	return key
end


function x418375_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest)

	local tb_id = x418375_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	local lv = GetLevel( varMap , varPlayer );
	
	StartTalkTask(varMap);
	TalkAppendString( varMap , "\t《成吉思汗3 恶狼传说》专门为QQ用户准备的礼物，当您达到相应的等级，即可获得QQ新手速成礼包中的礼物。\n\t玩家在打开礼包时，需要注意自己的背包空间，已使用的礼包为灰色，未使用的礼包为黑色。" );
	
	for varI,s in x418375_item_array do
	
		local clr = nil;
		if ( varI < tb_id ) then
			clr = x418375_title_disabled_color;
		else
			clr = x418375_title_enabled_color;
		end
		
		TalkAppendButton( varMap , 10268 , clr.."QQ新手速成礼包("..tostring( s.lv ).."级)" , 3 , varI );
	end
	
	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
end




function x418375_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid )

	StartTalkTask( varMap)
	
	local clr_name = x418375_item_array[ extid ].clr_name;
	
	local item_list = ""
	item_list = x418375_item_array[ extid ].item_list;
	
	TalkAppendString( varMap , "\t您目前选择的是"..clr_name.."#W，点击确定您将获得"..item_list );
	
	local list = x418375_item_list[ extid ].list;
	
	for varI , s in list do
		AddQuestItemBonus( varMap, s.varId, s.varNum )
	end
	
	SetPlayerRuntimeData( varMap, varPlayer, RD_QQ_BOX, extid)
	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, 418375, 10268);
end


function x418375_output_msg( varMap, varPlayer , varMsg )
	StartTalkTask(varMap)
	TalkAppendString(varMap,varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end


function x418375_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_QQ_BOX);
	local tb_id = x418375_get_item_key( varMap, varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	if ( extid == nil ) or 
	   ( extid > x418375_array_size ) then
	   return
	end
	
	if ( tb_id > extid ) then
		Msg2Player( varMap, varPlayer, "您已经领取过该级别礼品", 8, 3 )
		return
	end
	
	if ( tb_id < extid ) then
		local key_lv = x418375_item_list[ tb_id ].lv;
		Msg2Player( varMap, varPlayer, "您需要先领取"..tostring( key_lv ).."级的礼包", 8, 3 );
		return
	end

	local lv = x418375_item_list[ extid ].lv;
	local cur_lv =GetLevel( varMap , varPlayer );
	
	
	if cur_lv < lv then
		Msg2Player( varMap, varPlayer, "您还没有达到该级别", 8, 3 )
		return
	end
	
	
	

	StartItemTask(varMap);
	
	local list = x418375_item_list[ extid ].list;
	
	if( x418375_item_list[ extid ].list2 ~= nil ) then
		local list2 = x418375_item_list[ extid ].list2;
	 
		for varI , s2 in list2 do
			ItemAppendBind( varMap , s2.varId , s2.varNum );
		end
	end
	
	for varI , s in list do
		ItemAppendBind( varMap , s.varId , s.varNum );
	end
	
	local varRet = StopItemTask(varMap,varPlayer);
	
	if ( varRet > 0 ) then
	
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			x418375_output_msg( varMap,varPlayer,"打开礼包，获得了礼包道具" );
			DeliverItemListSendToPlayer(varMap,varPlayer);
			GamePlayScriptLog( varMap, varPlayer, 2634)
		else
			x418375_output_msg( varMap,varPlayer,"使用物品异常" );
		end
	else
		x418375_output_msg( varMap,varPlayer,"背包空间不足，无法得到物品！" );
	end
	

end











function x418375_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





