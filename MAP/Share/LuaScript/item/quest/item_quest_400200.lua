
x400200_var_FileId = 400200
x400200_var_Buf1 = 7528 

function x400200_ProcEventEntry( varMap, varPlayer, varBagIdx )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"褶皱的黑羽密信")
						TalkAppendString(varMap,"\n\t计划已经开始实施，我们正在建立秘密的基地，锁儿罕会继续利用骸骨召唤古老的米底亚人来切断这里的补给，其他的人也已经开始行动，你们永远不会是孤军奋战，事成之后，我们会履行诺言。\n \n\t窑厂内秘藏的晶石有一种神奇的力量，能够使野兽与人产生同化，这正是你们长期以来所追求的力量，这就算我们兑现承诺的第一步吧。\n \n \n\t\t\t\t勃鲁合")
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, 400200, 2700);
		
end

function x400200_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400200_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400200_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400200_ProcDeplete( varMap, varPlayer )
	return 1
end

function x400200_ProcActivateOnce( varMap, varPlayer )
end

function x400200_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
