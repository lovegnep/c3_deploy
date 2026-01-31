
--初级荣誉卡





x418570_var_FileId 		= 418570
x418570_var_FileItemId 		= 12030926

x418570_var_LevelMin		=	1
x418570_var_exchry		=	100





function x418570_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418570_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418570_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418570_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418570_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418570_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	
		AddHonor(varMap, varPlayer, 100)
		Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 100),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 100),4,2)
	else
	
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end


function x418570_Procautouseryk( varMap, varPlayer )


    local Num = GetItemCount( varMap, varPlayer, x418570_var_FileItemId )
    if Num > 0 then
        if DelItem(varMap,varPlayer,x418570_var_FileItemId,Num) == 1 then
            AddHonor(varMap, varPlayer, Num*x418570_var_exchry)
            Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", Num*x418570_var_exchry),4,3)
            Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", Num*x418570_var_exchry),4,2)

        end
    end

end




function x418570_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
