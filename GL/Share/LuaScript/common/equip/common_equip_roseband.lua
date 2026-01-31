x800095_var_ScriptId = 800095

--任务文本描述
x800095_var_MissionName="十星启动"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x800095_ProcEventEntry( varMap, varPlayer, targetId )	--点击该任务后执行此脚本
end

--**********************************
--列举事件
--**********************************
function x800095_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	TalkAppendButton(varMap,x800095_var_ScriptId,x800095_var_MissionName,3);
end


--**********************************
--处理玩法
--**********************************
--一些位运算小函数定义

x800095_bit_num_map = {}
for i = 1, 16 do
		x800095_bit_num_map[i] = 2 ^ ( 16 - i )
end

function x800095_bit_move_left(_x, _offset) --左移
			return _x * ( 2 ^ _offset) 
end 

function x800095_num_to_bit( _num ) --数字转换为bit数组
		local bit = {}
		for i = 1, 16 do
				if _num >= x800095_bit_num_map[i] then
					 bit[i] = 1
					 _num = _num - x800095_bit_num_map[i]
				else
					 bit[i] = 0
				end
		end
		return bit
end
											 
function x800095_bit_to_num( _bit ) --bit数组转换为数字
		 local num = 0
		 for i = 1, 16 do
		 		 if _bit[i] == 1 then
		 		 		num = num + x800095_bit_num_map[i]
		 		 end
		 end
		 return num
end
		
function x800095_bit_or_operate( _x, _y ) --或运算
			local _x_bit = x800095_num_to_bit( _x )
			local _y_bit = x800095_num_to_bit( _y )
			local _ret_bit = {}
			for i = 1, 16 do
				if _x_bit[i] == 1 or _y_bit[i] == 1 then
						_ret_bit[i] = 1
				else
						_ret_bit[i] = 0
				end
			end
			return x800095_bit_to_num( _ret_bit )
end

function x800095_ProcItemWanfa( varMap, varPlayer, varWanfaType )
		
		local wanfaDataTable = GetItemWanfaData( varMap )
		local dataCount = getn( wanfaDataTable )
		
		if dataCount ~= 4 then
				WriteLog( 1, format("x800095_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount));			
				return
		end
		
		------------------------------------------
		local itemSerial = wanfaDataTable[1] --物品序列
		local itemServer = wanfaDataTable[2] --物品MapServerId
		local itemWorld = wanfaDataTable[3]  --物品WorldId
		local bagPos = wanfaDataTable[4];    --装备位置	
		------------------------------------------
		
		--检查物品是否合法
		if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
				WriteLog( 1, format("x800095_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));			
				return
		end
		
		--检查物品SNID是否和客户端发过来的一致
		local serial,server,world = GetItemProperty( varMap, varPlayer, bagPos, "SNID" );
		if serial ~= itemSerial or server ~= itemServer or itemWorld ~= world then
				WriteLog( 1, format("x800095_ProcItemWanfa item snid invalid! varMap=%d,PlayerGUID=%X,C1=%d,C2=%d,C3=%d,S1=%d,S2=%d,S3=%d",varMap,GetGUID(varMap,varPlayer),itemSerial,itemServer,itemWorld,serial,server,world) );			
				return
		end
		
		--检查物品是否是装备
		local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
		if itemClass ~= ICLASS_EQUIP then
			 return
		end
		
		--检查装备装备点是否合法
		local equipPoint = GetEquipProperty( varMap, varPlayer, bagPos, "EquipPoint" );
		if equipPoint < HEQUIP_MAINHAND or ( equipPoint > HEQUIP_ADORN2 and equipPoint ~= HEQUIP_JADE ) then
			 Msg2Player( varMap, varPlayer, "启动失败，装备不合法！", 0, 3 )
			 Msg2Player( varMap, varPlayer, "启动失败，装备不合法！", 0, 2 )
			 return
		end 
		
		--检查玩家是否大于等于90级
		if GetLevel( varMap, varPlayer ) < 90 then
			 Msg2Player( varMap, varPlayer, "你还没有达到90级，无法使用此项目!", 0, 3 )
			 Msg2Player( varMap, varPlayer, "你还没有达到90级，无法使用此项目!", 0, 2 )
			 return
		end
		
		--检查装备是否为10星装备
		local starCount = GetEquipProperty( varMap, varPlayer, bagPos, "StarCount" );
		if starCount < 10 then
			 Msg2Player( varMap, varPlayer, "只有十星以上的装备才可以启动！", 0, 3 )
			 Msg2Player( varMap, varPlayer, "只有十星以上的装备才可以启动！", 0, 2 )
			 return
		end
		
		--检查装备是否已经激活10星
		local roseBandCount = GetEquipProperty( varMap, varPlayer, bagPos, "RoseBandCount" );
		if roseBandCount == 10 then
			 Msg2Player( varMap, varPlayer, "启动失败，装备已达到最大启动数目！", 0, 3 );
			 Msg2Player( varMap, varPlayer, "启动失败，装备已达到最大启动数目！", 0, 2 );
			 return
		end
		
		--检查玩家是否有消耗材料
		local materailId = 11990122
		if HaveItemInBagNew( varMap, varPlayer, materailId ) <= 0 then
			 Msg2Player( varMap, varPlayer, "@item_"..materailId.."#cffcf00不足！", 0, 3 );
			 Msg2Player( varMap, varPlayer, "@item_"..materailId.."#cffcf00不足！", 0, 2 );
			 return
		end
		
		
			
		--开始计算
		local tableRecordCount = GetTableRecordCount( TAB_FILE_EQUIPROSEBAND )
		
		local roseBandTable = {}
		local randMax = 0
		for i = 1, tableRecordCount do
				roseBandTable[i] = GetTableRecordByIndex( TAB_FILE_EQUIPROSEBAND, i-1 )
				randMax = randMax + roseBandTable[i][3]
		end
		
		local rand = random( 1, randMax )
		local selLine = -1
		local range = 0
		for i = 1, tableRecordCount do
				if rand > range and rand <= range + roseBandTable[i][3] then
						selLine = i
						break
				end
				range = range + roseBandTable[i][3]
		end
		
		if selLine == -1 then
			 WriteLog( 1, format("x800095_ProcItemWanfa rand failed! varMap=%d,PlayerGUID=%X",varMap, GetGUID(varMap,varPlayer) ) )
			 return
		end
		
		local roseBandCount = roseBandTable[selLine][1]	--得到了激活个数
		
		local roseBand = 0
		--开始随位置
		local bitIndex = {}
		for i = 1, 10 do
				bitIndex[i] = i-1
		end
		
		for i = 1, roseBandCount do
				rand = random( i, 10 )
				local bitNum = x800095_bit_move_left( 1, bitIndex[rand] )
				roseBand = x800095_bit_or_operate( roseBand, bitNum )
				if rand ~= i then
					 local temp = bitIndex[i]
					 bitIndex[i] = bitIndex[rand]
					 bitIndex[rand] = temp
				end
		end
		
		--计算完毕，先消耗物品
		if DelItem( varMap, varPlayer, materailId, 1) == 0 then
			 Msg2Player( varMap, varPlayer, "启动失败！", 0, 3 );
			 WriteLog(1, format("x800095_ProcItemWanfa DelItem failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			 return
		end
		
		--设置物品属性
		if SetEquipRoseBand( varMap, varPlayer, bagPos, roseBand ) == 0 then
			 Msg2Player( varMap, varPlayer, "启动失败！", 0, 3 );
			 WriteLog(1, format("x800095_ProcItemWanfa SetEquipRoseBand failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			 return
		end
		
		NotifyItemInfo( varMap, varPlayer, bagPos )
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, 1 )
		Msg2Player( varMap, varPlayer, "启动完成！", 0, 3 );
		Msg2Player( varMap, varPlayer, "启动完成！", 0, 2 );
		
		
		if roseBandCount >= 9 then
			 local playerName = GetName( varMap, varPlayer );
			 local itemTableIndex = GetItemProperty( varMap, varPlayer, bagPos, "ItemTableIndex" );
			 LuaAllScenceM2Wrold( varMap, 
			 											format("恭喜，%s将[#{_ITEM%d}]启动%d星", playerName, itemTableIndex, roseBandCount ),
			 											CHAT_MAIN_RIGHTDOWN, 1 );
		end
		
		--日志
		WriteEquipLog( varMap, varPlayer, bagPos, eEquipAct_RoseBand )
end
