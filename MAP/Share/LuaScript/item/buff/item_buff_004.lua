















x417004_var_Buf1 = 7043
x417004_var_Buf_OK			=	7058
x417004_var_Buf_Failed	=	7059




function x417004_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 1 then
		local varStr
		local multExp = GetWanFaExpMult( varMap, varPlayer )
	
		if IsHaveSpecificImpact( varMap, varPlayer, x417004_var_Buf1 ) > 0 then
			multExp = multExp - 0.1
			if multExp < 1.0 then multExp = 1.0 end
			varStr = "你被雷击中了！"
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x417004_var_Buf_Failed, 0)
		else
			multExp = multExp + 0.03
			varStr = "你顺利躲避了雷击！"
			
			local bonusExp = floor(GetLevel( varMap, varPlayer ) * 80 * multExp)
			AddExp( varMap,varPlayer, bonusExp )
			varStr = varStr.."获得经验："..bonusExp
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x417004_var_Buf_OK, 0)
		end
		SetWanFaExpMult(  varMap, varPlayer,  multExp )
		
		varStr = varStr.."当前经验倍率："..format("%.2f", multExp)

		StartTalkTask( varMap )
		TalkAppendString( varMap, varStr )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer )
	end
end


