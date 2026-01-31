
x303141_var_FileId	= 303141

x303141_buff_array = {
	buff_look = 	{ 32500, 32501, 32502, 32503, 32504, 32505, 32506, 32507, 32508, 32509, 
									32510, 32511, 32512, 32513, 32514, 32515, 32516, 32517, 32518, 32519,
									32520, 32521, 32522, 32523, 32524, 32525, 32526,
								},
	buff_effect = { 32527, 32528, 32529, 32530, 32531, 32532, 32533, 32534, 32535, 32536,
									32537, 32538, 32539, 32540, 32541, 32542, 32543, 32544, 32545, 32546,
									32547, 32548, 32549, 32550, 32551, 32552, 32553,
								}
}

function x303141_ProcIntervalOverEvent( varMap, varPlayer, varImpact )
		
		local buff_count = -1
		
		for varI,s in x303141_buff_array.buff_look do
			if ( varImpact == s ) then
				buff_count = varI
				break
			end
		end
		
		if ( buff_count == -1 ) then
			return
		end
		
		--local varMapType = GetSceneType(varMap)
		--if ( varMapType ~= 7 ) then
			--return
		--end
		
		if ( varMap < 3584 or varMap > 3886 ) then
			return
		end
		
		if ( x303141_buff_array.buff_effect[buff_count] == nil ) then
			return
		end
		
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x303141_buff_array.buff_effect[buff_count], 0);

end


function x303141_ProcActiveEvent( varMap, varPlayer )
end


function x303141_ProcFadeOutEvent( varMap, varPlayer )
end

function x303141_ProcEventEntry()
end
