x205003_item_key_array = {
	[ 12500295 ] = 1 , 
	[ 12500296 ] = 2 , 
	[ 12500297 ] = 3 ,
	[ 12500298 ] = 4 ,
	[ 12500299 ] = 5 ,
	[ 12500300 ] = 6 ,
	[ 12500301 ] = 7 ,
}


x205003_item_array = {
	{ lv = 60 , clr_name = "#Y盛世尊荣礼包（60级）" , item_list = "1个黄紫炫彩水银，10个紫檀木炭。"},
	{ lv = 65 , clr_name = "#Y盛世尊荣礼包（65级）" , item_list = "1个黄紫晕光水银，10个紫檀木炭。" },
	{ lv = 70 , clr_name = "#Y盛世尊荣礼包（70级）" , item_list = "3个原生钻石矿，10个修行草。" },
	{ lv = 75 , clr_name = "#Y盛世尊荣礼包（75级）" , item_list = "4个神天琉璃。" },
	{ lv = 80 , clr_name = "#Y盛世尊荣礼包（80级）" , item_list = "50个微瑕星辰。"},
	{ lv = 85 , clr_name = "#Y盛世尊荣礼包（85级）" , item_list = "4个天冥琉璃。"},	
	{ lv = 90 , clr_name = "#Y盛世尊荣礼包（90级）" , item_list = "50个四级冥铁。"},
};

x205003_item_list = {
	{ lv = 60 ,list={ {varid=11000504,varnum=1},{varid=11000501,varnum=10} } },
	{ lv = 65 ,list={ {varid=11000503,varnum=1},{varid=11000501,varnum=10} } },
	{ lv = 70 ,list={ {varid=11990115,varnum=3},{varid=12041101,varnum=10} } },
	{ lv = 75 ,list={ {varid=11000702,varnum=4} } },
	{ lv = 80 ,list={ {varid=11000550,varnum=50} } },
	{ lv = 85 ,list={ {varid=11000704,varnum=4} } },	
	{ lv = 90 ,list={ {varid=11000606,varnum=50} } },

}

x205003_item_box ={12500296,12500297,12500298,12500299,12500300,12500301}

x205003_title_enabled_color = "";
x205003_title_disabled_color = "#cb4b4b4";

--获取使用物品itemid
function x205003_get_item_table_id( varMap , varPlayer )
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

--获得使用物品的key值
function x205003_get_item_key( varMap , varPlayer )
	local item_id = x205003_get_item_table_id( varMap , varPlayer );
	
	if ( item_id == nil ) then
		return	nil
	end
	
	local key = x205003_item_key_array[ item_id ];
	
	if ( key == nil ) or ( key > getn( x205003_item_array ) ) then
		return nil
	end
	
	return key
end


function x205003_ProcActivateOnce( varMap, varPlayer, varImpact )
	LuaCallNoclosure( 205003, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
end



function x205003_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest)
	local tb_id = x205003_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	local lv = GetLevel( varMap , varPlayer );
	StartTalkTask(varMap);
	TalkAppendString( varMap , "\t成吉思汗3 恶狼传说活动限购礼包，#R盛世尊荣礼包#W，当您达到相应的等级，即可获得成长礼包中的礼物。\n\t玩家在打开礼包时，需要注意自己的背包空间，已使用的礼包为灰色，未使用的礼包为黑色。" );
	for varI,s in x205003_item_array do
	
		local clr = nil;
		if ( varI < tb_id ) then
			clr = x205003_title_disabled_color;
		else
			clr = x205003_title_enabled_color;
		end
		
		TalkAppendButton( varMap , 10277 , clr.."盛世尊荣礼包("..tostring( s.lv ).."级)" , 3 , varI );
	end
	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
end


function x205003_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
	
	StartTalkTask( varMap)
	
	local clr_name = x205003_item_array[ extid ].clr_name;
	local item_list = x205003_item_array[ extid ].item_list;
	
	TalkAppendString( varMap , "\t您目前选择的是"..clr_name.."#W，点击确定您将获得"..item_list );

	local list = x205003_item_list[ extid ].list
	local lv = x205003_item_list[ extid ].lv;
	
	for varI , s in list do
		AddQuestItemBonus( varMap, s.varid, s.varnum);
	end
	SetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX, extid)
	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,205003,10277);
end



function x205003_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX);
	local tb_id = x205003_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
--	if ( extid == nil ) or 
--	   ( extid > x205003_array_size ) then
--	   return
--	end
	
	if ( tb_id > extid ) then
		Msg2Player( varMap, varPlayer, "您已经领取过该级别礼品", 8, 3 )
		return
	end
	
	if ( tb_id < extid ) then
		local key_lv = x205003_item_list[ tb_id ].lv;
		Msg2Player( varMap, varPlayer, "您需要先领取"..tostring( key_lv ).."级的礼包", 8, 3 );
		return
	end

	local lv = x205003_item_list[ extid ].lv;
	local cur_lv =GetLevel( varMap , varPlayer );
	
	
	if cur_lv < lv then
		Msg2Player( varMap, varPlayer, "您还没有达到该级别", 8, 3 )
		return
	end
	
	
	StartItemTask(varMap);
	local list = x205003_item_list[ extid ].list;
	local get_num = 0;
	
	for varI , s in list do
		ItemAppendBind( varMap , s.varid , s.varnum );	
	end
	--给下个包	
	if tb_id<7 then
		ItemAppendBind( varMap , x205003_item_box[tb_id] , 1 );	
	end
	
	local varRet = StopItemTask(varMap,varPlayer);
	
	
	if ( varRet > 0 ) then
	
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			x205003_output_msg( varMap,varPlayer,"打开礼包，获得了礼包道具" );
			DeliverItemListSendToPlayer(varMap,varPlayer);
		else
			x205003_output_msg( varMap,varPlayer,"使用物品异常" );
		end
	else
		x205003_output_msg( varMap,varPlayer,"背包空间不足，无法得到物品！" );
	end
	
	
end

function x205003_output_msg( varMap, varPlayer , varMsg )
	StartTalkTask(varMap)
	TalkAppendString(varMap,varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end



function x205003_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end


function x205003_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x205003_ProcConditionCheck( varMap, varPlayer )

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end


function x205003_ProcDeplete( varMap, varPlayer )
	return 1;
end

function x205003_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
