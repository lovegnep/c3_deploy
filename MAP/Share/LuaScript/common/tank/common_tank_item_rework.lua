

x290001_var_FileId = 290001


function x290001_ProcEventEntry( varMap, varPlayer, varBagIdx )


		if (1 == RepaireChariot( varMap, varPlayer, varBagIdx,-1,-1)) then
			Msg2Player(varMap, varPlayer, "您的战车已经完全修复了", 8, 3)
			Msg2Player(varMap, varPlayer, "您的战车已经完全修复了", 8, 2)
		end
end


function x290001_ProcIsSpellLikeScript( varMap, varPlayer)

	return 0; 

end

