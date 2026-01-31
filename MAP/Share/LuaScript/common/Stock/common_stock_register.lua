
x310351_var_FileId = 310351
x310351_var_QuestName = "开通钱庄帐户"


function x310351_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x310351_var_FileId,x310351_var_QuestName,3,-1)
	
end




function x310351_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
		
	if varIndex == -1 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y开通钱庄帐户#W\n\t35级以上玩家可在此开通钱庄帐户,开通需要花费#G1#W两现银。\n\t你确定要开通钱庄帐户吗？")
		StopTalkTask(varMap)	
		TalkAppendButton(varMap,x310351_var_FileId,"开通钱庄帐户",3,1)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		
	elseif varIndex == 1 then
					
		if GetMoney(varMap, varPlayer,0) < GetStockRegisterCharge() then
		
			local text = "\t很遗憾，你的现银不足，开通钱庄帐户需要花费#R#{_MONEY"..GetStockRegisterCharge().."}#W现银。"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, varTalknpc);		
			return
			
		end
	
	if GetMergeDBToggle() == 1 then
		local text = "\t目前本服务器正在与其他服务器进行合并的准备工作，钱庄系统暂时关闭，服务器合并完成后即会开放。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return 	
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
		local text = "\t目前本服务器正在进行资料库升级的准备工作，钱庄系统暂时关闭，资料库升级完成后即会开放。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return 	
	end
		
	if IsEnableStockAccount(varMap, varPlayer) == 1 then
		local text = "\t您已经开通过钱庄帐户了！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return
	end
	
	
	if GetLevel(varMap, varPlayer) < 35 then
	
		local text = "\t只有35级以上的玩家才能开通钱庄帐户！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);		
		return
		
	end
		
	if GetMoney(varMap, varPlayer,0) < GetStockRegisterCharge() then
	
		local text = "\t很遗憾，你的现银不足，开通钱庄帐户需要花费#R#{_MONEY"..GetStockRegisterCharge().."}#W现银#B。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);		
		return
		
	end
	
		RegisterStockAccount( varMap, varPlayer )

		StartTalkTask(varMap)
		TalkAppendString(varMap,"\t恭喜您顺利开通钱庄帐户！您可以进入钱庄进行交易了。\n\t请注意：若您的帐户持续#G30天#W没有进行任何交易操作，将被系统自动删除，帐户内资金直接返还进您的背包中，请记得及时进行交易哦。")
		StopTalkTask(varMap)	
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		
	end
		
end



function x310351_ProcIsCanRegister( varMap, varPlayer )

	if GetMergeDBToggle() == 1 then
		local text = "\t目前本服务器正在与其他服务器进行合并的准备工作，钱庄系统暂时关闭，服务器合并完成后即会开放。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
		local text = "\t目前本服务器正在进行资料库升级的准备工作，钱庄系统暂时关闭，资料库升级完成后即会开放。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if IsEnableStockAccount(varMap, varPlayer) == 1 then
		local text = "\t您已经开通过钱庄帐户了！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0
	end
	
	return 1

end



function x310351_ProcRegisterResult( varMap, varPlayer,result )
	
	if result == 0 then			
		
		local text = "\t开通失败，请稍后在试"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)

	elseif result == 1 then		
		
		local text = "\t恭喜您顺利开通钱庄帐户！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		
	end

end



