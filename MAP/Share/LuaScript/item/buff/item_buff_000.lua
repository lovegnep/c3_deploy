













x417000_var_FileId = 417000 
x417000_var_QuestId = {2707,2708,2709,2710,2711,2712,3099,3100,3101,3102,3103,3104,1663,1664,1665,1666,1667,1668,3062,3769,3770,3771,3772,3773,3774,3775,3776,3777,3778,3779,3780,3369,3370,3371,3372,3373,3374,3375,3376,3377,3378,3379,3380,3462,3463,3464,3465,3466,3467,3468,3469,3470,3471,3472,3473,3269,3270,3271,3272,3273,3274,3275,3276,3277,3278,3279,3280,4204,4205,4206,4207,4264,4265,4266,4267,4268,4269,4270,4271,4272,4273,4274,4275,4276,4277,4278,4279,4280,4281,4282,4283,4284,4285,4286,4287,4288,4289,4290,4291,4292,4293,4294,4295,4296,4297,4298,4299,4300,4301,4302,4303,4304,4305,4306,4307,4308,4309,4310,4311,4312,4313,4314,4315,4316,4317,4318,4319,4320,4321,4322,4323,4324,4325,4326,4327,4328,4329,4330,4331,4332,4333,4334,4335,4336,4337,4338,4339,4340,4341,4342,4343,4344,4345,4346,4347,4348,4349,4350,4351,4352,4353,4354,4355,4356,4357,4358,4359}




x417000_var_Buf1 = 8001 
x417000_var_Buf2 = -1 




function x417000_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
        
        
        if IsPlayerStateNormal( varMap,varPlayer) ~= 1 then
            return
        end
        
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x417000_var_QuestId[1] )
		if varOpType==0 then
			if IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[1]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[2]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[3]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[4]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[5]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[6]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[7]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[7] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[8]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[8] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[9]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[9] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[10]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[10] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[11]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[11] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[12]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[12] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[13]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[13] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[14]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[14] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[15]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[15] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[16]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[16] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[17]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[17] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[18]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[18] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
					elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[20]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[20] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[21]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[21] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[22]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[22] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[23]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[23] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[24]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[24] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[25]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[25] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[26]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[26] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[27]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[27] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[28]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[28] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[29]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[29] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[30]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[30] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[31]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[31] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
		  elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[32]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[32] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[33]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[33] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[34]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[34] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[35]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[35] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[36]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[36] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[37]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[37] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[38]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[38] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[39]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[39] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[40]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[40] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[41]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[41] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[42]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[42] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[43]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[43] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[44]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[44] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[45]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[45] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[46]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[46] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[47]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[47] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[48]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[48] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[49]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[49] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[50]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[50] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[51]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[51] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[52]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[52] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[53]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[53] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[54]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[54] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[55]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[55] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end		
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[56]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[56] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[57]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[57] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[58]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[58] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[59]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[59] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[60]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[60] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[61]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[61] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[62]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[62] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[63]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[63] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[64]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[64] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[65]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[65] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[66]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[66] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[67]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[67] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end	
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[72]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[72] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[73]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[73] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[74]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[74] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[75]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[75] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[76]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[76] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[77]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[77] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[78]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[78] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[79]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[79] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[80]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[80] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[81]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[81] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[82]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[82] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[83]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[83] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
				end

			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[84]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[84] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[85]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[85] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[86]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[86] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[87]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[87] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[88]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[88] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[89]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[89] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[90]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[90] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[91]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[91] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[92]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[92] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[93]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[93] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[94]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[94] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[95]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[95] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[96]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[96] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[97]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[97] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[98]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[98] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[99]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[99] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[100]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[100] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[101]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[101] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[102]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[102] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[103]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[103] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[104]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[104] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[105]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[105] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[106]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[106] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[107]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[107] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[108]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[108] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[109]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[109] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[110]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[110] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[111]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[111] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[112]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[112] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[113]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[113] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[114]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[114] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[115]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[115] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[116]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[116] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[117]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[117] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[118]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[118] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[119]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[119] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[120]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[120] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[121]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[121] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[122]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[122] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[123]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[123] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[124]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[124] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[125]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[125] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[126]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[126] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[127]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[127] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[128]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[128] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[129]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[129] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[130]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[130] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[131]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[131] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[132]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[132] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[133]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[133] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[134]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[134] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[135]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[135] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[136]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[136] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[137]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[137] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[138]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[138] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[139]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[139] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[140]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[140] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[141]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[141] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[142]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[142] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[143]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[143] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[144]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[144] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[145]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[145] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[146]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[146] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[147]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[147] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[148]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[148] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[149]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[149] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[150]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[150] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[151]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[151] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[152]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[152] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[153]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[153] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[154]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[154] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[155]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[155] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[156]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[156] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[157]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[157] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[158]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[158] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[159]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[159] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[160]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[160] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[161]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[161] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[162]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[162] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[163]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[163] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[164]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[164] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[165]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[165] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[166]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[166] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[167]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[167] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			end
			if IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[19]) > 0 then
		
					if varBagIdx	>=7510 then
						if varBagIdx	<=7511 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[19] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
						end
					end
					
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[68]) > 0 then
		
					if varBagIdx	>=7510 then
						if varBagIdx	<=7511 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[68] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[69]) > 0 then
		
					if varBagIdx	>=7510 then
						if varBagIdx	<=7511 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[69] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[70]) > 0 then
		
					if varBagIdx	>=7510 then
						if varBagIdx	<=7511 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[70] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[71]) > 0 then
		
					if varBagIdx	>=7510 then
						if varBagIdx	<=7511 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[71] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
						end
					end	
			end		
			
			elseif varOpType==1 then
			if IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[1]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[2]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[3]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[4]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[5]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[6]) > 0 then
						
						
						
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[7]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[7] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[8]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[8] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[9]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[9] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[10]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[10] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[11]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[11] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[12]) > 0 then
					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[12] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[13]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[13] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[14]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[14] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[15]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[15] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[16]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[16] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[17]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[17] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[18]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[18] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[20]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[20] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[21]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[21] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[22]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[22] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[23]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[23] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[24]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[24] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[25]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[25] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[26]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[26] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[27]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[27] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[28]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[28] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[29]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[29] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[30]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[30] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[31]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[31] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
				elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[32]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[32] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[33]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[33] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[34]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[34] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[35]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[35] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[36]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[36] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[37]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[37] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[38]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[38] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[39]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[39] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[40]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[40] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[41]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[41] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[42]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[42] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[43]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[43] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[44]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[44] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[45]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[45] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[46]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[46] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[47]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[47] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[48]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[48] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[49]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[49] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[50]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[50] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[51]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[51] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[52]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[52] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[53]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[53] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[54]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[54] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[55]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[55] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end		
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[56]) > 0 then
					if varBagIdx	>1321 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[56] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[57]) > 0 then
					if varBagIdx	>2081 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[57] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[58]) > 0 then
					if varBagIdx	>3091 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[58] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[59]) > 0 then
					if varBagIdx	>4091 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[59] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[60]) > 0 then
					if varBagIdx	>5081 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[60] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[61]) > 0 then

					if varBagIdx	>6101 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[61] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[62]) > 0 then
					if varBagIdx	>17040 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[62] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[63]) > 0 then
					if varBagIdx	>18080 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[63] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[64]) > 0 then
					if varBagIdx	>19070 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[64] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[65]) > 0 then
					if varBagIdx	>20070 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[65] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[66]) > 0 then
					if varBagIdx	>21060 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[66] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[67]) > 0 then

					if varBagIdx	>22080 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[67] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[72]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[72] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[73]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[73] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[74]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[74] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[75]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[75] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[76]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[76] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[77]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[77] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[78]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[78] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[79]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[79] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[80]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[80] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[81]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[81] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[82]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[82] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[83]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[83] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
				end

			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[84]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[84] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[85]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[85] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[86]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[86] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[87]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[87] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[88]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[88] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[89]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[89] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[90]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[90] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[91]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[91] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[92]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[92] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[93]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[93] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[94]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[94] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[95]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[95] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[96]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[96] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[97]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[97] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[98]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[98] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[99]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[99] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[100]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[100] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[101]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[101] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[102]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[102] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[103]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[103] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[104]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[104] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[105]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[105] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[106]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[106] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[107]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[107] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[108]) > 0 then
					if varBagIdx	>1322 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[108] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[109]) > 0 then
					if varBagIdx	>2082 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[109] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[110]) > 0 then
					if varBagIdx	>3092 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[110] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[111]) > 0 then
					if varBagIdx	>4092 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[111] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[112]) > 0 then
					if varBagIdx	>5082 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[112] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[113]) > 0 then

					if varBagIdx	>6102 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[113] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[114]) > 0 then
					if varBagIdx	>17041 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[114] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[115]) > 0 then
					if varBagIdx	>18081 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[115] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[116]) > 0 then
					if varBagIdx	>19071 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[116] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[117]) > 0 then
					if varBagIdx	>20071 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[117] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[118]) > 0 then
					if varBagIdx	>21061 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[118] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[119]) > 0 then

					if varBagIdx	>22081 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[119] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[120]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[120] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[121]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[121] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[122]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[122] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[123]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[123] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[124]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[124] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[125]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[125] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[126]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[126] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[127]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[127] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[128]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[128] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[129]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[129] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[130]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[130] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[131]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[131] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[132]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[132] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[133]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[133] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[134]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[134] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[135]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[135] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[136]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[136] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[137]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[137] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[138]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[138] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[139]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[139] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[140]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[140] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[141]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[141] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[142]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[142] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[143]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[143] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[144]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[144] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[145]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[145] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[146]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[146] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[147]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[147] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[148]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[148] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[149]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[149] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[150]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[150] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[151]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[151] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[152]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[152] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[153]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[153] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[154]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[154] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[155]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[155] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[156]) > 0 then
					if varBagIdx	>1323 then
						if varBagIdx	<=1330 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[156] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[157]) > 0 then
					if varBagIdx	>2083 then
						if varBagIdx	<=2090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[157] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[158]) > 0 then
					if varBagIdx	>3093 then
						if varBagIdx	<=3100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[158] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[159]) > 0 then
					if varBagIdx	>4093 then
						if varBagIdx	<=4100 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[159] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[160]) > 0 then
					if varBagIdx	>5083 then
						if varBagIdx	<=5090 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[160] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[161]) > 0 then

					if varBagIdx	>6103 then
						if varBagIdx	<=6110 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[161] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[162]) > 0 then
					if varBagIdx	>17042 then
						if varBagIdx	<=17049 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[162] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[163]) > 0 then
					if varBagIdx	>18082 then
						if varBagIdx	<=18089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[163] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[164]) > 0 then
					if varBagIdx	>19072 then
						if varBagIdx	<=19079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[164] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[165]) > 0 then
					if varBagIdx	>20072 then
						if varBagIdx	<=20079 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[165] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[166]) > 0 then
					if varBagIdx	>21062 then
						if varBagIdx	<=21069 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[166] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
			elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[167]) > 0 then

					if varBagIdx	>22082 then
						if varBagIdx	<=22089 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[167] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end		
			end
	end
	if IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[19]) > 0 then
					if varBagIdx	>=	7510 then
						if varBagIdx	<=	7511 then
						varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[19] )
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						end
					end
	
	elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[68]) > 0 then

			if varBagIdx	>=7510 then
				if varBagIdx	<=7511 then
				varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[68] )
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
				end
			end
	elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[69]) > 0 then

			if varBagIdx	>=7510 then
				if varBagIdx	<=7511 then
				varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[69] )
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
				end
			end
	elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[70]) > 0 then

			if varBagIdx	>=7510 then
				if varBagIdx	<=7511 then
				varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[70] )
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
				end
			end
	elseif IsHaveQuest(varMap,varPlayer, x417000_var_QuestId[71]) > 0 then

			if varBagIdx	>=7510 then
				if varBagIdx	<=7511 then
				varQuestIdx = GetQuestIndexByID( varMap, varPlayer,  x417000_var_QuestId[71] )
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
				end
			end	
	end				
	end				

end






function x417000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x417000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x417000_ProcConditionCheck( varMap, varPlayer )
	
	
		
	
	
end







function x417000_ProcDeplete( varMap, varPlayer )
	
		
	
	
end








function x417000_ProcActivateOnce( varMap, varPlayer )
	
		
	
	
end







function x417000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
