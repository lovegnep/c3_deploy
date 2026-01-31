
x300648_var_ScritpId  =  300648

x300648_var_UICommandID = 100
x300648_var_QuestName = "寻找红绳合成"
x300648_var_ItemId1 = 13011010
x300648_var_ItemId2 = 13011011
x300648_var_MixtureQuestId = 7019
x300648_var_AwardItemId = 13011012 

x300648_var_OR_MIXTURE_FAIL = -2   
x300648_var_OR_FAIL = -1           
x300648_var_OR_SUCC = 1            



function x300648_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	TalkAppendButton(varMap, x300648_var_ScritpId, x300648_var_QuestName,3);
end

function x300648_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	
	
		StartGCDTask(varMap);
		GCDAppendInt(varMap, x300648_var_ScritpId);
		GCDAppendInt(varMap, varTalknpc);
		DeliverGCDInfo(varMap,varPlayer, x300648_var_UICommandID );
		StopGCDTask(varMap);
	
	    
		
		
		
	
end

function x300648_ProcMixture( varMap, varPlayer, item1, item2, item3, item4 )

	local varItem = {-1,-1,-1,-1};
	local itemPos = { item1, item2, item3, item4 };

		for varI=1, 4 do
			if itemPos[varI] ~= -1 then
				varItem[varI] = GetItemTableIndexByIndex( varMap, varPlayer, itemPos[varI] );
			end

		end
		

	  if IsHaveQuestNM( varMap, varPlayer, x300648_var_MixtureQuestId ) > 0  then
	  		local sign1 = -1;
	  		local sign2 = -1;

			local result=x300648_var_OR_SUCC;
	  		for varI=1, 4 do  
				if varItem[varI] ~= -1 then
					if varItem[varI] == x300648_var_ItemId1 then
						sign1 = varI;
					elseif varItem[varI] == x300648_var_ItemId2 then
						sign2 = varI;
					else
						result = x300648_var_OR_FAIL;
						break	
					end
				end
			end

			if result == x300648_var_OR_FAIL then
				StartTalkTask(varMap);
				TalkAppendString(varMap, "请放入相应的物品");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);
				Msg2Player( varMap, varPlayer, "请放入相应的物品",4,2 );
				QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
				return
			end
			
			if sign1~= -1 and sign2 ~= -1 then   

			    if  x300648_Rand() == 1 then
	        		StartItemTask(varMap)
					ItemAppend( varMap, x300648_var_AwardItemId, 1 )
					local varRet = StopItemTask(varMap,varPlayer)
					if varRet > 0 then
					
						DeliverItemListSendToPlayer(varMap,varPlayer)
						StartTalkTask(varMap);
						TalkAppendString(varMap, "你顺利的合成了红绳，你可以找节姻缘申请结婚了。");
						StopTalkTask(varMap);
						DeliverTalkTips(varMap,varPlayer);
						Msg2Player( varMap, varPlayer, "你顺利的合成了红绳，你可以找节姻缘申请结婚了。",4,2 );
						result = x300648_var_OR_SUCC;
						DelQuest(varMap, varPlayer, x300648_var_MixtureQuestId)
						if EraseItem(varMap, varPlayer, itemPos[sign1]) ~= 1 then return 0 end
			       		if EraseItem(varMap, varPlayer, itemPos[sign2]) ~= 1 then return 0 end
						itemPos[sign1] = -1;
			        	itemPos[sign2] = -1;
						QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
					else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
					end
				else   
						StartTalkTask(varMap);
						TalkAppendString(varMap, "合成红绳失败");
						StopTalkTask(varMap);
						DeliverTalkTips(varMap,varPlayer);
						Msg2Player( varMap, varPlayer, "合成红绳失败",4,2 );

						DelQuestNM(varMap, varPlayer, x300648_var_MixtureQuestId)
						result = x300648_var_OR_FAIL;
						QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
				end

			else
				
				StartTalkTask(varMap);
				TalkAppendString(varMap, "请放入相应的物品");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);
				Msg2Player( varMap, varPlayer, "请放入相应的物品",4,2 );
				result = x300648_var_OR_FAIL;
				QuestMixtureResult( varMap, varPlayer, result, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
			end
	  else
			StartTalkTask(varMap);
			TalkAppendString(varMap, "您还没有红绳任务，不能合成");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player( varMap, varPlayer, "您还没有红绳任务，不能合成",4,2 );
			QuestMixtureResult( varMap, varPlayer, x300648_var_OR_FAIL, itemPos[1], itemPos[2], itemPos[3], itemPos[4] );
			return
	  end

end


function x300648_Rand()
	
	
	    
	

	return 1;
end
