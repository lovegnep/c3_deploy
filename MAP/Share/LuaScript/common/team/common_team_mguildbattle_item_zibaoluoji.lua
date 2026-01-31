
x303147_var_FileId	= 303147

function x303147_ProcIntervalOverEvent( varMap, varPlayer, varImpact )
		
		--local varMapType = GetSceneType(varMap)
		--if ( varMapType ~= 7 ) then
			--return
		--end
		
		if ( varMap < 3584 or varMap > 3886 ) then
			return
		end
		
		local varCamp = GetCurCamp( varMap, varPlayer )
		
		local buffid = 0                                                       
		local NUM = GetImpactListCount(varMap,varPlayer)
		                     
		for i=0,NUM-1 do                                                       
			buffid = GetImpactDataIndex(varMap,varPlayer,i)                  
			if ( buffid == 32563 ) then
				if ( varCamp == 5 ) then
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32566, 0)
				elseif ( varCamp == 6 ) then
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32565, 0)
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32567, 0)
				end
			elseif ( buffid == 32564 ) then
				if ( varCamp == 6 ) then
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32566, 0)
				elseif ( varCamp == 5 ) then
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32565, 0)
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32567, 0)
				end
			end
		end
		
end


function x303147_ProcActiveEvent( varMap, varPlayer )
end


function x303147_ProcFadeOutEvent( varMap, varPlayer )
end

function x303147_ProcEventEntry()
end
