




x888886_var_FileId 		= 888886

x888886_var_LevelMin		=1

x888886_var_List = { 
{varItem=12036612	,varBox={itemId=12036609	,itemNum=1,itemId2=12036625	,itemNum2=1	},varNum=1	},--无限琼浆
{varItem=12036613	,varBox={itemId=12036610	,itemNum=1,itemId2=12036626	,itemNum2=1	},varNum=1	},
{varItem=12036614	,varBox={itemId=12036611	,itemNum=1,itemId2=12036627	,itemNum2=1	},varNum=1	},
{varItem=12035594	,varBox={itemId=10010090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},--蓝装
{varItem=12035595	,varBox={itemId=10030090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12035596	,varBox={itemId=10050090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12035597	,varBox={itemId=10070090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12035598	,varBox={itemId=10270090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12035599	,varBox={itemId=10260090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12035600	,varBox={itemId=10290090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12035601	,varBox={itemId=10280090	,itemNum=5,itemId2=0	,itemNum2=1	},varNum=1	},

{varItem=12036255	,varBox={itemId=11000552	,itemNum=1,itemId2=0	,itemNum2=1	},varNum=1	},--完美
{varItem=12036256	,varBox={itemId=11000321	,itemNum=1,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12036257	,varBox={itemId=11000322	,itemNum=1,itemId2=0	,itemNum2=1	},varNum=1	},

{varItem=12271325	,varBox={itemId=10306146	,itemNum=1,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12271326	,varBox={itemId=10306147	,itemNum=1,itemId2=0	,itemNum2=1	},varNum=1	},
{varItem=12271328	,varBox={itemId=11012639	,itemNum=50,itemId2=0	,itemNum2=1	},varNum=1	},



													
}




function x888886_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x888886_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x888886_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x888886_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x888886_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x888886_ProcActivateOnce( varMap, varPlayer, varImpact)


	if GetLevel(varMap, varPlayer)< x888886_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	

	local itemInBag = GetActuveItemTableIndex(varMap, varPlayer)
	for varI, item in x888886_var_List do
		if (item.varItem == itemInBag) then
			StartItemTask(varMap)
			for varN=1,item.varNum do
				ItemAppendBind( varMap, item.varBox.itemId, item.varBox.itemNum )
				if (item.varBox.itemId2 > 0) then
					ItemAppendBind( varMap, item.varBox.itemId2, item.varBox.itemNum2 )
				end
			end
		end
	end
	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼品道具.")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x888886_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
