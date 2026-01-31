













x417002_var_FileId = 417002 


x417002_var_Buf1 = 8712 




function x417002_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 1 then
		if varMap == 0 then
				local varX,z =GetWorldPos(varMap,varPlayer)
				if varX > 400 then
						local varTalkRandomm =random(1,3)
						if varTalkRandomm == 1 then
							NpcTalk(varMap, varPlayer, "又有好玩的啦！", -1)
						elseif varTalkRandomm == 2 then
							NpcTalk(varMap, varPlayer, "我藏在这你都能找到！你一定是耍赖了！", -1)
						elseif varTalkRandomm == 3 then
							NpcTalk(varMap, varPlayer, "你发现我了，不跟你玩了！", -1)
						end
				else
						local varTalkRandomm =random(1,3)
						if varTalkRandomm == 1 then
							NpcTalk(varMap, varPlayer, "多谢施主搭救！", -1)
						elseif varTalkRandomm == 2 then
							NpcTalk(varMap, varPlayer, "如果施主再晚来些，我就要去见佛祖了！", -1)
						elseif varTalkRandomm == 3 then
							NpcTalk(varMap, varPlayer, "阿弥陀佛！多谢施主！", -1)
						end
				end
		elseif varMap == 56 or varMap == 156 or varMap == 256 or varMap == 356 then
						local varTalkRandomm =random(1,3)
						if varTalkRandomm == 1 then
							NpcTalk(varMap, varPlayer, "我刚刚还在想，如果袋子打开，出现的一个狼头该怎么办！", -1)
						elseif varTalkRandomm == 2 then
							NpcTalk(varMap, varPlayer, "我还以为这次死定了，多谢勇士！", -1)
						elseif varTalkRandomm == 3 then
							NpcTalk(varMap, varPlayer, "果然那萨满没说错，我一定能活到80岁！", -1)
						end
		elseif varMap == 64 or varMap == 164 or varMap == 264 or varMap == 364 then
						local varTalkRandomm =random(1,3)
						if varTalkRandomm == 1 then
							NpcTalk(varMap, varPlayer, "这是哪里？我应该怎么逃出去呢？", -1)
						elseif varTalkRandomm == 2 then
							NpcTalk(varMap, varPlayer, "我在袋子里什么都看不见，但是听见了惨叫声！", -1)
						elseif varTalkRandomm == 3 then
							NpcTalk(varMap, varPlayer, "没想到还能活着出这袋子，谢谢你！", -1)
						end
		elseif varMap == 67 or varMap == 167 or varMap == 267 or varMap == 367 then
						local varTalkRandomm =random(1,2)
						if varTalkRandomm == 1 then
							NpcTalk(varMap, varPlayer, "多谢恩公相救，算命的说我能活到80，果然不错……", -1)
						elseif varTalkRandomm == 2 then
							NpcTalk(varMap, varPlayer, "谢谢你救了我，我还以为死定了。", -1)
						end
		elseif varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 then
				    local varTalkRandomm =random(1,2)
				    if varTalkRandomm == 1 then
							NpcTalk(varMap, varPlayer, "多谢恩公相救，算命的说我能活到80，果然不错……", -1)
						elseif varTalkRandomm == 2 then
							NpcTalk(varMap, varPlayer, "谢谢你救了我，我还以为死定了。", -1)
		        end	
		        LuaCallNoclosure( 304000, "SetPatrol", varMap, varPlayer )		
		end
	end
end

