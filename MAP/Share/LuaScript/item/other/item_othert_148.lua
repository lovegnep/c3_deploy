--名利双享包	12030980 
------------------------------------------------------------------------------------------
--一般物品的默认脚本

x432148_item_key_array = {
	[ 12030980 ] = 1 , 
	[ 12030981 ] = 2 , 
	[ 12030982 ] = 3 ,
	[ 12030983 ] = 4 ,
	[ 12030984 ] = 5 ,

}

x432148_item_random_list = {
	{ 10200020 , 10230020 , 10240020 , 10250020 , 10260020 , 10270020 },--新手蓝装
	{ 10246092 , 10286092 , 10296072 }--极品武器

};


x432148_item_array = {
	{ lv = 30 , clr_name = "#Y名利双享包（30级）" , item_list = "10个初级龙眼石，小钱包，15个世传水晶和1个江湖请柬。" , shengwang = nil },
	
	{ lv = 40 , clr_name = "#Y名利双享包（40级）" , item_list = "20个初级龙眼石，声望5000点，王国银票，20个国传水晶。" , shengwang = 5000 },
	
	{ lv = 50 , clr_name = "#Y名利双享包（50级）" , item_list = "20个中级龙眼石，声望10000点，大元银票，20个国传水晶。" , shengwang = 10000 },
	
	{ lv = 60 , clr_name = "#Y名利双享包（60级）" , item_list = "30个中级龙眼石，声望15000点，大元银票，30个神传水晶。" , shengwang = 15000 },
	
	{ lv = 65 , clr_name = "#Y名利双享包（65级）" , item_list = "50个高级龙眼石，声望20000点，帝国银票，50个神传水晶。" , shengwang = 20000 }

};

x432148_item_list = {

	{
		lv = 30 , array = 
		{
			{ metier = 0 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 1 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 2 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 3 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 4 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 5 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
		  { metier = 6 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 7 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 8 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 9 , list = { { varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } ,  
			{ metier = 10 , list = {{ varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } , 
			{ metier = 11 , list = {{ varId = 12030981 , varNum = 1 } , { varId = 11050001 , varNum = 10 } , { varId = 12030321  , varNum = 1 } , { varId = 11000200  , varNum = 15 } , { varId = 12030202  , varNum = 1 } } } 
		}
	} ,

	{
		lv = 40 , array = 
		{
			{ metier = 0 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 1 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 2 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 3 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 4 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 5 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
		 	{ metier = 6 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 7 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 8 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 9 , list = { { varId = 12030982, varNum = 1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 10 , list = { { varId =12030982 , varNum =1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 11 , list = { { varId =12030982 , varNum =1 } , { varId = 11050001 , varNum = 20 } , { varId = 11060001 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } }
		}
	} ,
	

	{
		lv = 50 , array = 
		{
			{ metier = 0 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 1 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 2 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 3 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 4 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 5 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
		  { metier = 6 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 7 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 8 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 9 , list = { { varId = 12030983, varNum = 1 } , { varId = 11050002, varNum = 20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 10 , list = { { varId =12030983 , varNum =1 } , { varId = 11050002 , varNum =20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } } ,
			{ metier = 11 , list = { { varId =12030983 , varNum =1 } , { varId = 11050002 , varNum =20 } , { varId = 11060002 , varNum = 1 } , { varId = 11000201 , varNum = 20 } } }
		}
	} ,
	
	
	{
		lv = 60 , array = 
		{
			{ metier = 0 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 1 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 2 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 3 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 4 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 5 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } ,
		    { metier = 6 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 7 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 8 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 9 , list = { { varId = 12030984, varNum = 1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 10 , list = { { varId =12030984 , varNum =1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } } , 
			{ metier = 11 , list = { { varId =12030984 , varNum =1 } , { varId = 11050002 , varNum = 30 } , { varId = 11060002 , varNum = 1 } , { varId = 11000202 , varNum = 30 } } }
		}
	} ,
	
	{
		lv = 65 , array = 
		{
			{ metier = 0 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 1 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 2 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 3 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 4 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 5 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } ,
		  { metier = 6 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 7 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 8 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 9 , list = { { varId = 11050003, varNum = 50 } , { varId = 11060003, varNum = 1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 10 , list = { { varId =11050003 , varNum =50 } , { varId = 11060003 , varNum =1 } , { varId = 11000202 , varNum = 50 } } } , 
			{ metier = 11 , list = { { varId =11050003 , varNum =50 } , { varId = 11060003 , varNum =1 } , { varId = 11000202 , varNum = 50 } } }
		}
	} 

};


x432148_random_size = 10;
x432148_array_size = 5;
x432148_random_item_id = 10200020;
x432148_title_enabled_color = "";
x432148_title_disabled_color = "#cb4b4b4";


--**********************************
--事件交互入口
--**********************************
function x432148_ProcEventEntry( varMap, varPlayer, varBagIdx )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x432148_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x432148_ProcCancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x432148_ProcConditionCheck( varMap, varPlayer )
	
	--校验使用的物品
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x432148_ProcDeplete( varMap, varPlayer )
	
	
	--if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	--	return 1;
	--end
	--return 0;
	
	return 1;
end




--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x432148_ProcActivateOnce( varMap, varPlayer, varImpact )
	LuaCallNoclosure( 432148, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
end


function x432148_get_item_table_id( varMap , varPlayer )
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


function x432148_get_item_key( varMap , varPlayer )
	local item_id = x432148_get_item_table_id( varMap , varPlayer );
	
	if ( item_id == nil ) then
		return	nil
	end
	
	local key = x432148_item_key_array[ item_id ];
	
	if ( key == nil ) or ( key > getn( x432148_item_array ) ) then
		return nil
	end
	
	return key
end

function x432148_get_random_key( varLevel )
	if ( varLevel == 10 ) then
		return 1
	end
	
	if ( varLevel == 20 ) then
		return 2;
	end
	
	return nil
end


function x432148_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest)

	local tb_id = x432148_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	local lv = GetLevel( varMap , varPlayer );
	
	StartTalkTask(varMap);
	TalkAppendString( varMap , "\t《成吉思汗3 恶狼传说》专门为新手准备的礼物，当您达到相应的等级，即可获得成长礼包中的礼物。\n\t玩家在打开礼包时，需要注意自己的背包空间，已使用的礼包为灰色，未使用的礼包为白色。" );
	
	for varI,s in x432148_item_array do
	
		local clr = nil;
		if ( varI < tb_id ) then
			clr = x432148_title_disabled_color;
		else
			clr = x432148_title_enabled_color;
		end
		
		TalkAppendButton( varMap , 10269 , clr.."名利双享包("..tostring( s.lv ).."级)" , 3 , varI );
	end
	
	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
end




function x432148_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
	
	StartTalkTask( varMap)
	
	local clr_name = x432148_item_array[ extid ].clr_name;
	local item_list = x432148_item_array[ extid ].item_list;
	local cur_metier = GetZhiye( varMap , varPlayer );
	
	TalkAppendString( varMap , "\t您目前选择的是"..clr_name.."#W，点击确定您将获得"..item_list );
	
	--添加图标

	local list = x432148_item_list[ extid ].array;
	local lv = x432148_item_list[ extid ].lv;
	
	for varI , s in list do
	--职业匹配
		if s.metier == cur_metier then
			for j , u in s.list do
			
				local varNum = u.varNum;
				local varId = u.varId;
				if ( varId ~= nil ) then
					if( j <= getn( s.list ) ) then
						local flag = 0;
						for k , r in x432148_item_key_array do
							if ( k == varId ) then
								flag = 1;
							end
						end
						if ( flag == 0 ) then
							AddQuestItemBonus( varMap, varId, varNum);
						end
						
					else
						if ( extid == getn( x432148_item_array ) ) then
							AddQuestItemBonus( varMap, varId, varNum);
						end
					end
				else
					--随机显示
					local random_key = x432148_get_random_key( lv );
					
					if ( random_key ~= nil ) then
					
						local copy = {};
						local ref = x432148_item_random_list[ random_key ];
						
						for varX = 1 , x432148_array_size do
							copy[ varX ] = ref[ varX ];
						end
						local copy_l = getn( copy );
					
						for k = 1 , varNum do
							for varI = 1 , copy_l do
								local r = random( 1 , copy_l );
								local r_id = copy[ r ];
								
								if r_id ~= -1 then
									copy[ r ] = -1;
									AddQuestItemBonus( varMap , r_id , 1 );
									break
								end
							end
						end
						
					end
				end
			end	
		end
	end

	SetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX, extid)
	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc,432148,10269);
end



function x432148_output_msg( varMap, varPlayer , varMsg )
	StartTalkTask(varMap)
	TalkAppendString(varMap,varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end


function x432148_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX);
	local tb_id = x432148_get_item_key( varMap , varPlayer );
	
	if ( tb_id == nil ) then
		return
	end
	
	if ( extid == nil ) or 
	   ( extid > x432148_array_size ) then
	   return
	end
	
	if ( tb_id > extid ) then
		Msg2Player( varMap, varPlayer, "您已经领取过该级别礼品", 8, 3 )
		return
	end
	
	if ( tb_id < extid ) then
		local key_lv = x432148_item_list[ tb_id ].lv;
		Msg2Player( varMap, varPlayer, "您需要先领取"..tostring( key_lv ).."级的礼包", 8, 3 );
		return
	end

	local lv = x432148_item_list[ extid ].lv;
	local cur_lv =GetLevel( varMap , varPlayer );
	local cur_metier = GetZhiye( varMap , varPlayer );
	
	--判断级别
	if cur_lv < lv then
		Msg2Player( varMap, varPlayer, "您还没有达到该级别", 8, 3 )
		return
	end
	
	--判断是否该包
	
	
	StartItemTask(varMap);
	
	local list = x432148_item_list[ extid ].array;
	local get_num = 0;
	
	for varI , s in list do
		--职业匹配
		if s.metier == cur_metier then
		
			for j , u in s.list do
				
				--赋予道具
				local varNum = u.varNum;
				local varId = u.varId;
				
				if varId == nil then

					--随机道具
					local random_key = x432148_get_random_key( lv );
					
					if ( random_key ~= nil ) then
					
						local copy = {};
						local ref = x432148_item_random_list[ random_key ];
						
						for varX = 1 , x432148_array_size do
							copy[ varX ] = ref[ varX ];
						end

						local copy_l = getn( copy );
					
						for k = 1 , varNum do
							for varI = 1 , copy_l do
								local r = random( 1 , copy_l );
								local r_id = copy[ r ];
								
								if r_id ~= nil then
									copy[ r ] = nil;
									ItemAppendBind( varMap , r_id , 1 );
									get_num = get_num + 1;
									break
								end
							end
						end
						
					end

					
				else
					--不随机
					ItemAppendBind( varMap , varId , varNum );
					get_num = get_num + 1;
				end
				
			end
			
		end
	end
	
	
	local varRet = StopItemTask(varMap,varPlayer);
	
	if get_num == 0 then
		x432148_output_msg( varMap,varPlayer,"获取道具失败！" );
	end
	
	if ( varRet > 0 ) then
	
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			x432148_output_msg( varMap,varPlayer,"打开礼包，获得了礼包道具" );
			DeliverItemListSendToPlayer(varMap,varPlayer);
		else
			x432148_output_msg( varMap,varPlayer,"使用物品异常" );
		end
	else
		x432148_output_msg( varMap,varPlayer,"背包已满，无法得到物品！您需要至少有"..tostring( get_num ).."个背包空间！" );
		return
	end
	

	local sw = x432148_item_array[ extid ].shengwang;

	if sw ~= nil then
		local _sw = GetShengWang( varMap, varPlayer );
		SetShengWang( varMap, varPlayer, _sw + sw );
		x432148_output_msg( varMap,varPlayer,"打开礼包，获得了礼包声望"..tostring( sw ).."点" );
	end
	
	
end





--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x432148_ProcActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end




