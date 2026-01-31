

x300630_var_QuestName="异国杀怪物品合成"
x300630_var_ItemID1 = 13011007         	
x300630_var_ItemID2 = 13011008         	
x300630_var_ItemID3 = 13011009         	
x300630_var_AwardItemId = 13010021        

x300630_var_QuestId = 7017
x300630_var_KillQuestId =  7007

x300630_var_UICommandID = 100


x300630_var_FileId = 300630

x300630_var_OR_MIXTURE_FAIL = -2   
x300630_var_OR_FAIL = -1           
x300630_var_OR_SUCC = 1            




function x300630_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x300630_var_FileId,x300630_var_QuestName);
end





function x300630_ProcEventEntry( varMap, varPlayer, varTalknpc )

   	local ItemNum1 = GetItemCount( varMap, varPlayer,x300630_var_ItemID1 )
    local ItemNum2 = GetItemCount( varMap, varPlayer,x300630_var_ItemID1 )
	if ItemNum1 <= 0 or ItemNum2 <= 0 then
	 	StartTalkTask(varMap);
		TalkAppendString( varMap, "材料不够，去采集足够的原材料在来合成吧！" );
		StopTalkTask();
		DeliverTalkMenu(varMap, varPlayer, -1)
		return
	end

	
	StartGCDTask(varMap);
	GCDAppendInt(varMap, x300630_var_FileId);
	GCDAppendInt(varMap, varTalknpc);
	DeliverGCDInfo(varMap,varPlayer, x300630_var_UICommandID );
	StopGCDTask(varMap);

 	

end


function x300630_ProcMixture( varMap, varPlayer, item1, item2, item3, item4 )

	local varItem = {-1,-1,-1,-1};
	local itemPos = { item1, item2, item3, item4 };

	for varI=1, 4 do
		if itemPos[varI] ~= -1 then
			varItem[varI] = GetItemTableIndexByIndex( varMap, varPlayer, itemPos[varI] );
		end
	end

	local sign1 = -1;
	local sign2 = -1;
	local sign3 = -1;

	for varI=1, 4 do
		local toggle = 0;

		if varItem[varI] > 0 then

			if varItem[varI] == x300630_var_ItemID1 then
				sign1 = varI;
				toggle=1;
			elseif varItem[varI] == x300630_var_ItemID2 then
				sign2 = varI;
				toggle=1;
			elseif varItem[varI] == x300630_var_ItemID3 then
				sign3= varI;
				toggle=1;
			end

			if toggle == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"放入的材料不正确")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0;
			end
			
		end

	end

	local result;
	local percent = 60;

	if sign3 ~= -1 then
		percent = 95;
	end

	if sign1~= -1 and sign2 ~= -1 then   

		    result = 1;
			if percent >= random(1,95) then
				
			else
				
				if EraseItem(varMap, varPlayer, itemPos[sign1]) ~= 1 then return 0 end
	       		if EraseItem(varMap, varPlayer, itemPos[sign2]) ~= 1 then return 0 end
	       		if percent == 95 then
                   if EraseItem(varMap, varPlayer, itemPos[sign3]) ~= 1 then return 0 end
	       		end
	       		
				
				Msg2Player(varMap,varPlayer,"合成失败",4,2)
				result = x300630_var_OR_FAIL;
				QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
				return 0
			end

			
    		StartItemTask(varMap)
			ItemAppend( varMap, x300630_var_AwardItemId, 1 )
			local varRet = StopItemTask(varMap,varPlayer)

			if varRet > 0 then
				if EraseItem(varMap, varPlayer, itemPos[sign1]) ~= 1 then return 0 end
	       		if EraseItem(varMap, varPlayer, itemPos[sign2]) ~= 1 then return 0 end
	       		
	       		if percent == 95 then
                   if EraseItem(varMap, varPlayer, itemPos[sign3]) ~= 1 then return 0 end
	       		end

	       		itemPos[sign1] = -1;
	        	itemPos[sign2] = -1;

				Msg2Player(varMap,varPlayer,"合成完成",4,2)
				DeliverItemListSendToPlayer(varMap,varPlayer)

				DelQuest(varMap, varPlayer, x300630_var_KillQuestId);
				x300630_Accept(varMap, varPlayer, x300630_var_QuestId )
				
				
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法得到目标物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

	    result = x300630_var_OR_SUCC;

	else
		Msg2Player( varMap, varPlayer, "#R请放入相应的物品", MSG2PLAYER_PARA );
		result = x300630_var_OR_FAIL;

	end

	QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );

	return 0;
end

function x300630_Accept( varMap, varPlayer, varQuest )

	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return -3
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return -4
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return -5
		end
	end

	local	varRet = AddQuestNM( varMap, varPlayer, varQuest ) 

	local varText = GetQuestNameNM( varMap, varPlayer, varQuest )

	varText = "接受任务:" .. varText
	if varRet == 0 then
		varText = "任务获取失败，添加失败"
	elseif varRet == -1 then
		varText = "背包已满,请整理后再来接任务"
	elseif varRet == -2 then
		varText = "任务已达到上限，无法接新的任务"
	else

		return 1
	end

	return -1
end

