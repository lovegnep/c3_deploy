x888887_var_FileId = 888887
x888887_var_maillevel = {5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80}											

function x888887_leveluptest( varMap, varObj, varLevel )
		for varI, item in x888887_var_maillevel do 
		if varLevel == x888887_var_maillevel[varI] then
		local text=format("#{levelup_notice_%03d}",varLevel)
		--SendNormalPost(varMap,varObj,GetName(varMap,varObj),text)		
				if GetCurCountry(varMap,varObj) == 0 then
						if varLevel == 20 then
							
						elseif varLevel == 30 then
							
						elseif varLevel == 40 then
							
						elseif varLevel == 50 then
							
						elseif varLevel == 60 then
							
						end							
				elseif GetCurCountry(varMap,varObj) == 1 then
						if varLevel == 20 then
							
						elseif varLevel == 30 then
							
						elseif varLevel == 40 then
							
						elseif varLevel == 50 then
							
						elseif varLevel == 60 then
							
						end						
				elseif GetCurCountry(varMap,varObj) == 2 then
						if varLevel == 20 then
							
						elseif varLevel == 30 then
							
						elseif varLevel == 40 then
							
						elseif varLevel == 50 then
							
						elseif varLevel == 60 then
							
						end						
				elseif GetCurCountry(varMap,varObj) == 3 then
						if varLevel == 20 then
							
						elseif varLevel == 30 then
							
						elseif varLevel == 40 then
							
						elseif varLevel == 50 then
							
						elseif varLevel == 60 then
							
						end						
				end		
		end
		end	
end


function x888887_firstintest( varMap, varObj)
			
		local text=format("#{levelup_notice_000}")
		if text == "" then
			return
		end
		SendNormalPost(varMap,varObj,GetName(varMap,varObj),text)
			
end
