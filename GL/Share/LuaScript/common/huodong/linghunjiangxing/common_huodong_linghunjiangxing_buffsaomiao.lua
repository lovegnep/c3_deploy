
x302518_var_GameId = 1102  
x302518_var_Xinbing_FileId			=	302518
x302518_var_levelupexp ={30,60,90}

function x302518_ProcIntervalOverEvent( varMap, varPlayer )

	if GetItemIsOverTimeByBagPos(varMap, varPlayer,14,1) == 1 then
		if IsHaveSpecificImpact( varMap, varPlayer, 7772) == 1 then
			CancelSpecificImpact(varMap, varPlayer, 7772)
		end
	end
	
	
	local name = GetName(varMap,varPlayer)
	
 	if IsHaveSpecificImpact( varMap, varPlayer, 7773)~=1 and GetLevel(varMap,varPlayer) >=40 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7773, 0)
		local playerLevel1 = GetLevel(varMap,varPlayer)
		if playerLevel1 < 60 then	
			Msg2Player( varMap, varPlayer,format( "您获得了#G%d经验",playerLevel1*x302518_var_levelupexp[1]), 8, 3)
			AddExp(varMap,varPlayer,playerLevel1*x302518_var_levelupexp[1])
		elseif playerLevel1 <80 then
			Msg2Player( varMap, varPlayer,format( "您获得了#G%d经验",playerLevel1*x302518_var_levelupexp[2]), 8, 3)
			AddExp(varMap,varPlayer,playerLevel1*x302518_var_levelupexp[2])	
		else
			Msg2Player( varMap, varPlayer,format( "您获得了#G%d经验",playerLevel1*x302518_var_levelupexp[3]), 8, 3)
			AddExp(varMap,varPlayer,playerLevel1*x302518_var_levelupexp[3])
		end
	end
	local playercount = GetNearObjCount(varMap, varPlayer,10,1,0)
	if playercount >20 then
		playercount =20
	end
	
	for i=0,playercount-1 do
		
		local playerobj = GetNearPlayerMember(varMap, varPlayer,i)
		if IsObjValid(varMap,playerobj) > 0 then
		 	 if IsHaveSpecificImpact( varMap, playerobj, 7773) ~= 1 and IsHaveSpecificImpact( varMap, playerobj, 7772)~=1 and GetLevel(varMap,playerobj) >=40 then
		 	 	SendSpecificImpactToUnit(varMap, playerobj, playerobj, playerobj, 7773, 0)
				local playerLevel1 = GetLevel(varMap,playerobj)*0.8
				if playerLevel1 < 60 then	
					Msg2Player( varMap, playerobj,format( "您受到#G%s#cffcf00的祝福，获得了#G%d经验",name,playerLevel1*x302518_var_levelupexp[1]), 8, 3)
					AddExp(varMap,playerobj,playerLevel1*x302518_var_levelupexp[1])
				elseif playerLevel1 <80 then
					Msg2Player( varMap, playerobj,format( "您受到#G%s#cffcf00的祝福，获得了#G%d经验",name,playerLevel1*x302518_var_levelupexp[2]), 8, 3)
					AddExp(varMap,playerobj,playerLevel1*x302518_var_levelupexp[2])	
				else
					Msg2Player( varMap, playerobj,format( "您受到#G%s#cffcf00的祝福，获得了#G%d经验",name,playerLevel1*x302518_var_levelupexp[3]), 8, 3)
					AddExp(varMap,playerobj,playerLevel1*x302518_var_levelupexp[3])
				end
		 	 end
		end
	end
	
	
end


function x302518_ProcActiveEvent( varMap, varPlayer )

end


function x302518_ProcFadeOutEvent( varMap, varPlayer )

end

function x302518_ProcEventEntry()

end

function x302518_CheckPlayerInArea(varMap, varPlayer)

end

