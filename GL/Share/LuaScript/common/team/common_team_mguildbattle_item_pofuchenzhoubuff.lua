
x303149_var_FileId	= 303149

function x303149_ProcIntervalOverEvent( varMap, varPlayer, varImpact )
		
		--local varMapType = GetSceneType(varMap)
		--if ( varMapType ~= 7 ) then
			--return
		--end
		
		if ( varMap < 3584 or varMap > 3886 ) then
			return
		end
		
		if ( varImpact == 32568 ) then
			local varSelfHp = 0
			varSelfHp = GetHp( varMap, varPlayer )
			SetHp( varMap, varPlayer, -varSelfHp*0.5 )
		elseif ( varImpact == 32569 ) then
			local varSelfHp = 0
			varSelfHp = GetHp( varMap, varPlayer )
			SetHp( varMap, varPlayer, -varSelfHp*0.5 )
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32570, 0)
		end
		
end


function x303149_ProcActiveEvent( varMap, varPlayer )
end


function x303149_ProcFadeOutEvent( varMap, varPlayer )
end

function x303149_ProcEventEntry()
end
