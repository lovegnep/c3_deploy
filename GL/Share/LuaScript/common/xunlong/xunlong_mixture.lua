
x310050_var_ScritpId  =  310050

x310050_var_UICommandID = 100
x310050_var_QuestName = "天龙魂合成"
x310050_var_ItemId1 = 12030022
x310050_var_ItemId2 = 12030023
x310050_var_ItemId3 = 12030024
x310050_var_ItemId4 = 12030025

x310050_var_AwardItemId = 12030108 

x310050_var_OR_FAIL = -1           
x310050_var_OR_SUCC = 1            



function x310050_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x310050_var_ScritpId, x310050_var_QuestName,3);
end

function x310050_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	
		StartGCDTask(varMap);
		GCDAppendInt(varMap, x310050_var_ScritpId);
		GCDAppendInt(varMap, varTalknpc);
		DeliverGCDInfo(varMap,varPlayer, x310050_var_UICommandID );
		StopGCDTask(varMap);

end

function x310050_ProcMixture( varMap, varPlayer, item1, item2, item3, item4 )


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
			local sign4 = -1;

			local result=x310050_var_OR_SUCC;
	  		for varI=1, 4 do  
				if varItem[varI] ~= -1 then
					if varItem[varI] == x310050_var_ItemId1 then
						sign1 = varI;
					elseif varItem[varI] == x310050_var_ItemId2 then
						sign2 = varI;
					elseif varItem[varI] == x310050_var_ItemId3 then
						sign3 = varI;
					elseif varItem[varI] == x310050_var_ItemId4 then
						sign4 = varI;
					else
						result = x310050_var_OR_FAIL;
						break	
					end
				end
			end

			if result == x310050_var_OR_FAIL then
				StartTalkTask(varMap);
				TalkAppendString(varMap, "放入的道具不正确，无法合成");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);
				Msg2Player( varMap, varPlayer, "放入的道具不正确，无法合成",4,2 );
				QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
				return
			end
			
			if sign1~= -1 and sign2 ~= -1 and sign3 ~= -1 and sign4 ~= -1 then   
	        StartItemTask(varMap)
	        local varBagIdx = -1
	        local bin =-1
	        for t=1,4 do
		        if IsItemBind(varMap,varPlayer,itemPos[t]) == 0 then
		        	bin =0
		        else
		        	bin =1
		        	break
		        end	
		      end  	        
					
					if bin ==1 then
						ItemAppendBind( varMap, x310050_var_AwardItemId, 1 )
					else	
						ItemAppend( varMap, x310050_var_AwardItemId, 1 )
					end	
					
					local varRet = StopItemTask(varMap,varPlayer)
					if varRet > 0 then
						if EraseItem(varMap, varPlayer, itemPos[sign1]) ~= 1 then return 0 end
			      if EraseItem(varMap, varPlayer, itemPos[sign2]) ~= 1 then return 0 end
						if EraseItem(varMap, varPlayer, itemPos[sign3]) ~= 1 then return 0 end
						if EraseItem(varMap, varPlayer, itemPos[sign4]) ~= 1 then return 0 end
			       		itemPos[sign1] = -1;
			        	itemPos[sign2] = -1;
						itemPos[sign3] = -1;
			        	itemPos[sign4] = -1;

						DeliverItemListSendToPlayer(varMap,varPlayer)
						StartTalkTask(varMap);
						TalkAppendString(varMap, "你顺利的合成复苏的天龙魂。");
						StopTalkTask(varMap);

						DeliverTalkTips(varMap,varPlayer);
						Msg2Player( varMap, varPlayer, "你顺利的合成复苏的天龙魂。",4,2 );
						result = x310050_var_OR_SUCC;
						QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
					else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"背包已满，无法获得任务物品")
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
					end
			else
				StartTalkTask(varMap);
				TalkAppendString(varMap, "放入的道具不正确，无法合成");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);
				Msg2Player( varMap, varPlayer, "放入的道具不正确，无法合成",4,2 );
				result = x310050_var_OR_FAIL;
				QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
			end
end
