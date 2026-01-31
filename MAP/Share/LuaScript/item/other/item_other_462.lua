
--冲级先锋大礼包





x418462_var_FileId 		= 418462

x418462_var_LevelMin		=	1

x418462_item_key_array = {
	[ 12030826 ] = 1 , 
	[ 12030827 ] = 2 , 
	[ 12030828 ] = 3 
	
}

x418462_item_list = 
{

		{
		lv = 60 , list = {{ varId = 12030827 , varNum = 1 } , { varId = 12030047 , varNum = 10 }  } 
    },
    
    {
		lv = 70 , list = {{ varId = 12030828 , varNum = 1 } , { varId = 12030047 , varNum = 15 }  } 
    },

    {
		lv = 80 , list = {  { varId = 12030047 , varNum = 20 }  } 
    }


}





x418462_item_array = {
  { lv = 60 , clr_name = "#Y冲击先锋大礼包（60级）" , item_list = "100两金卡"},
	
	{ lv = 70 , clr_name = "#Y冲击先锋大礼包（70级）" , item_list = "150两金卡"},
	
	{ lv = 80 , clr_name = "#Y冲击先锋大礼包（80级）" , item_list = "200两金卡"}
	}

x418462_title_enabled_color = "";
x418462_title_disabled_color = "#cb4b4b4";

function x418462_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418462_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418462_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418462_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418462_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end
function x418462_ProcActivateOnce( varMap, varPlayer, varImpact )
	LuaCallNoclosure( 418462, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
end


function x418462_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest)

	local tb_id = x418462_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	local lv = GetLevel( varMap , varPlayer );
	
	StartTalkTask(varMap);
	TalkAppendString( varMap , "\t《成吉思汗3 恶狼传说》专门为您准备的冲级奖励，当您达到相应的等级，即可获得成长礼包中的礼物。\n\t玩家在打开礼包时，需要注意自己的背包空间，已使用的礼包为灰色，未使用的礼包为黑色。" );
	
	local clr = nil;
	for varI,s in x418462_item_array do
	
	
		if ( varI < tb_id ) then
			clr = x418462_title_disabled_color;
		else
			clr = x418462_title_enabled_color;
		end
		
		TalkAppendButton( varMap , 10275 , clr.."冲级先锋大礼包("..tostring( s.lv ).."级)" , 3 , varI );
	end
	
	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
end
function x418462_get_item_table_id( varMap , varPlayer )
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


function x418462_get_item_key( varMap , varPlayer )
	local item_id = x418462_get_item_table_id( varMap , varPlayer );
	
	if ( item_id == nil ) then
		return	nil
	end
	
	local key = x418462_item_key_array[ item_id ];
	
	if ( key == nil ) or ( key > getn( x418462_item_array ) ) then
		return nil
	end
	
	return key
end

function x418462_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
	
	StartTalkTask( varMap)
	

	local clr_name = x418462_item_array[ extid ].clr_name;
	local item_list = ""
		item_list =x418462_item_array[extid].item_list

	TalkAppendString( varMap , "\t您目前选择的是"..clr_name.."#W，点击确定您将获得"..item_list );
 	
 	for i, item in x418462_item_list[extid].list do
		if (item.varId~=12030827) and (item.varId~=12030828) then
		AddQuestItemBonus(varMap,item.varId ,item.varNum)
		end
	end


	SetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX, extid)
	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,418462,10275);
end

function x418462_output_msg( varMap, varPlayer , varMsg )
	StartTalkTask(varMap)
	TalkAppendString(varMap,varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end

function x418462_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX);
	local tb_id = x418462_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	--if ( extid == nil ) or 
	   --( extid > x418462_array_size ) then
	  -- return
	--end
	
	if ( tb_id > extid ) then
		Msg2Player( varMap, varPlayer, "您已经领取过该级别礼品", 8, 3 )
		return
	end
	
	if ( tb_id < extid ) then
		local key_lv = x418462_item_list[ tb_id ].lv;
		Msg2Player( varMap, varPlayer, "您需要先领取"..tostring( key_lv ).."级的礼包", 8, 3 );
		return
	end

	local lv = x418462_item_list[ extid ].lv;
	local cur_lv =GetLevel( varMap , varPlayer );
	local cur_metier = GetZhiye( varMap , varPlayer );
	
	
	if cur_lv < lv then
		Msg2Player( varMap, varPlayer, "您还没有达到该级别", 8, 3 )
		return
	end
	
	local year,month,day=GetYearMonthDay()
	if (year>2012) then
	Msg2Player( varMap, varPlayer, "您的礼包已过期", 8, 3 )
	return
	end
	if (year==2012) then
	if (month>3) then
	Msg2Player( varMap, varPlayer, "您的礼包已过期", 8, 3 )
	return
	end
	end
	
	StartItemTask(varMap);
	
	local list = x418462_item_list[ extid ].list;
	local get_num = 0;

        for varI , s in list do

	      local varNum = s.varNum;
				local varId = s.varId;
					ItemAppendBind( varMap , varId , varNum );
					get_num = get_num + 1;
					end
	local varRet = StopItemTask(varMap,varPlayer);
	
	if get_num == 0 then
		x418462_output_msg( varMap,varPlayer,"获取道具失败！" );
	end
	
	if ( varRet > 0 ) then
	
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			x418462_output_msg( varMap,varPlayer,"打开礼包，获得了礼包道具" );
			DeliverItemListSendToPlayer(varMap,varPlayer);
		else
			x418462_output_msg( varMap,varPlayer,"使用物品异常" );
		end
	else
		x418462_output_msg( varMap,varPlayer,"背包空间不足，无法得到物品！" );
	end			
					
	end
					
					
					

function x418462_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

