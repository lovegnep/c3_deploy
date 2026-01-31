
x800300_var_FileId = 800300

x800300_var_QuestName="将星铭刻"

needMoney = 10000;		----消耗金钱
needitemId 		= 0;


--物品消耗表
function x800300_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end


function x800300_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800300_var_FileId,x800300_var_QuestName,3);
end

function x800300_ProcItemWanfa( varMap, varPlayer, varWanfaType )

		local wanfaDataTable = GetItemWanfaData( varMap );
		local dataCount = getn( wanfaDataTable );
		
		WriteLog(1, format("x800300_ProcItemWanfa: wanfaDataTable=%d", dataCount));
		
		if dataCount ~= 6 then
				WriteLog( 1, format("x800300_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount));			
				return
		end
		
		------------------------------------------
		local itemSerial 	= wanfaDataTable[1];	--物品序列
		local itemServer 	= wanfaDataTable[2];	--物品MapServerId
		local itemWorld 	= wanfaDataTable[3];	--物品WorldId
		local equipPos 		= wanfaDataTable[4];	--装备位置	
		local needitemPos = wanfaDataTable[5]; 		--消耗道具位置
		local isInCardBag = wanfaDataTable[6]; 		--卡牌是否在卡牌背包
		------------------------------------------
		
		--获取玩家等级
		local nPlayerLevel = GetLevel(varMap, varPlayer);
		
		--获取卡牌物品信息
		local cardColor, cardStarLevel, cardName,cardId = GetCardInfoByPos( varMap, varPlayer, isInCardBag, needitemPos );
		
		--检查装备物品是否合法
		if IsItemValid( varMap, varPlayer, equipPos ) == 0 then
				WriteLog( 1, format("x800300_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, equipPos=%d",varMap,GetGUID(varMap,varPlayer),equipPos));			
				return
		end
		
		--检查消耗物品是否合法
		if cardColor == -1 then
				WriteLog( 1, format("x800300_ProcItemWanfa card invalid! varMap=%d,PlayerGUID=%X, needitemPos=%d",varMap,GetGUID(varMap,varPlayer),needitemPos));			
				return
		end
		
		--检查物品SNID是否和客户端发过来的一致
		local serial,server,world = GetItemProperty( varMap, varPlayer, equipPos, "SNID" );
		if serial ~= itemSerial or server ~= itemServer or itemWorld ~= world then
				WriteLog( 1, format("x800300_ProcItemWanfa item snid invalid! varMap=%d,PlayerGUID=%X,C1=%d,C2=%d,C3=%d,S1=%d,S2=%d,S3=%d",varMap,GetGUID(varMap,varPlayer),itemSerial,itemServer,itemWorld,serial,server,world) );			
				return
		end

		--检查物品是否是装备
		local itemClass = GetItemProperty( varMap, varPlayer, equipPos, "ItemClass" );
		if itemClass ~= ICLASS_EQUIP then
				Msg2Player( varMap, varPlayer, "将星铭刻失败！", 0, 3 );
				return
		end
		
		--检查是否是卡牌	 
		if cardColor == nil then
				Msg2Player( varMap, varPlayer, "将星铭刻失败！", 0, 3 );
				return
		end
		
		--检查等级是否足够
		local nCardLevel = GetCardLevel( varMap, varPlayer,cardId )
		if nCardLevel > nPlayerLevel then
				Msg2Player( varMap, varPlayer, "等级低于将星卡等级，将星铭刻失败", 0, 3 );
				NotifyItemWanfa( varMap, varPlayer, varWanfaType, -5 )
				return
		end
		
		--检查卡牌是否能镶嵌到此物品
		if IsCardSuitForEquip(varMap, varPlayer, equipPos, cardId) == 0 then
			Msg2Player( varMap, varPlayer, "将星卡不支持此装备", 0, 3 );
			return
		end
		
		--钱是否足够
		if IsEnoughMoney( varMap, varPlayer, needMoney ) == 0 then
			Msg2Player( varMap, varPlayer, "金钱不足！", 0, 3 );
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, -4 );
			return
		end	 
		
	  --消耗物品
		if isInCardBag ~= 1 then
		
				if 1 ~= DelItemByIndexInBag( varMap, varPlayer, needitemPos, 1 ) then
						WriteLog( 1, format("x800161_ProcItemWanfa DelItemByIndexInBag err: varMap=%d,PlayerGUID=%X, MainBag cardpos=%d, itemnum=%d",varMap,GetGUID(varMap,varPlayer),item.Pos,item.num) );	
						return
				end
			
		else

				if 1 ~= DelItemByIndexInBag( varMap, varPlayer, needitemPos, 1, 63, 1) then
						WriteLog( 1, format("x800161_ProcItemWanfa DelItemByIndexInBag err: varMap=%d,PlayerGUID=%X, MainBag cardpos=%d, itemnum=%d",varMap,GetGUID(varMap,varPlayer),item.Pos,item.num) );	
						return
				end
		end

		--消耗金钱
		local varRet, varType = SpendMoney( varMap, varPlayer, needMoney );
		if varRet == -1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, -5 )
			WriteLog(1, format("x800300_ProcItemWanfa SpendMoney failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			return
		end
	
		--给物品增加属性
		local tackSoulResult = SetItemCardAttr(varMap, varPlayer,equipPos,cardId);
		if tackSoulResult == -1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, -5 )
			WriteLog(1, format("x800300_ProcItemWanfa SetItemCardAttr failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			return
		end
		
		--设置装备为绑定
		BindItem( varMap, varPlayer, equipPos )
		
		--刷新客户端
		NotifyItemInfo( varMap, varPlayer, equipPos );
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, 1 );
		Msg2Player( varMap, varPlayer, "将星铭刻完成", 0, 3 );
end
