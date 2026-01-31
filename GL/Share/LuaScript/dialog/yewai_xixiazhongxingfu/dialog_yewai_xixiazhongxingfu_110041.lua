 
x800210_var_FileId	= 800210
x800210_var_temp = 0


function x800210_ProcEventEntry( varMap, varPlayer,varTalknpc )

end

function x800210_ProcDie(varMap, varPlayer, varKiller)
	x800210_var_temp = x800210_var_temp +1
	
	if x800210_var_temp <10 then
    Msg2Player( varMap, varKiller, format("入侵家园的强盗已被击杀！(%d/10)",x800210_var_temp), 8, 3)
    Msg2Player( varMap, varKiller, format("入侵家园的强盗已被击杀！(%d/10)",x800210_var_temp), 8, 2)
	elseif x800210_var_temp ==10 then
		
		local itemid = 12271046
		Msg2Player( varMap, varKiller, "你已经击杀足够的家园强盗，获得1个@item_"..itemid, 8, 3)
   		Msg2Player( varMap, varKiller, "你已经击杀足够的家园强盗，获得1个@item_"..itemid, 8, 2)
			
			StartItemTask(varMap)
			ItemAppendBind(varMap, itemid, 1)
			if StopItemTask(varMap, varKiller) <= 0 then
				Msg2Player(varMap, varKiller, "背包已满", 8, 2)
				Msg2Player(varMap, varKiller, "背包已满", 8, 3)
			else
		  	DeliverItemListSendToPlayer(varMap, varKiller)
			end
	end
end
