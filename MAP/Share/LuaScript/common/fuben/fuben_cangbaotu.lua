
--脚本ID
x700110_var_ScriptId 						= 700110                  

-- 地图中NPC最大数量
x700110_var_Sence_Npc_MaxNum  	= 8
-- 当前存在的NPC的数量
x700110_var_CurNpcNum 					= 0
-- 刷新的NPC ID
x700110_var_NpcID								= 3607
-- 刷新的NPC的GUID
x700110_var_NpcGUID							= 141537
-- NPC生存时间
x700110_var_NpcLiveTime 				= 10 *60*1000

-- 记录场景中存在的NPC
x700110_var_LiveNpcMap = {
												[5] = {
																[1] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[2] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[3] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[4] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[5] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[6] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[7] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[8] = {varnPosX = 0, varnPosY = 0, varObjID = -1}
															 },
												[8] = {
																[1] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[2] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[3] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[4] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[5] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[6] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[7] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[8] = {varnPosX = 0, varnPosY = 0, varObjID = -1}
															 },														 															 
												[11] = {
																[1] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[2] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[3] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[4] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[5] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[6] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[7] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[8] = {varnPosX = 0, varnPosY = 0, varObjID = -1}
															 },
												[17] = {
																[1] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[2] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[3] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[4] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[5] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[6] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[7] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[8] = {varnPosX = 0, varnPosY = 0, varObjID = -1}
															 },			
												[20] = {
																[1] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[2] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[3] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[4] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[5] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[6] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[7] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[8] = {varnPosX = 0, varnPosY = 0, varObjID = -1}
															 },			
												[23] = {
																[1] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[2] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[3] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[4] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[5] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[6] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[7] = {varnPosX = 0, varnPosY = 0, varObjID = -1},
																[8] = {varnPosX = 0, varnPosY = 0, varObjID = -1}
															 },											 															 															 															 															 															 															 															 															 															 															 															 															
												}

-- 坐标
x700110_var_Pos5 = { 
																{varnPosX = 38,varnPosY = 57},
																{varnPosX = 64,varnPosY = 39},
																{varnPosX = 101,varnPosY = 65},
																{varnPosX = 68,varnPosY = 78},
																{varnPosX = 115,varnPosY = 84},
																{varnPosX = 159,varnPosY = 49},
																{varnPosX = 150,varnPosY = 81},
																{varnPosX = 175,varnPosY = 38},
																{varnPosX = 204,varnPosY = 60},
																{varnPosX = 222,varnPosY = 34},
																{varnPosX = 29,varnPosY = 99},
																{varnPosX = 35,varnPosY = 110},
																{varnPosX = 67,varnPosY = 151},
																{varnPosX = 89,varnPosY = 128},
																{varnPosX = 122,varnPosY = 144},
																{varnPosX = 156,varnPosY = 133},
																{varnPosX = 199,varnPosY = 113},
																{varnPosX = 232,varnPosY = 127},
																{varnPosX = 220,varnPosY = 133},
																{varnPosX = 167,varnPosY = 153},
																{varnPosX = 41,varnPosY = 222},
																{varnPosX = 51,varnPosY = 174},
																{varnPosX = 81,varnPosY = 199},
																{varnPosX = 115,varnPosY = 201},
																{varnPosX = 124,varnPosY = 161},
																{varnPosX = 144,varnPosY = 177},
																{varnPosX = 161,varnPosY = 204},
																{varnPosX = 133,varnPosY = 213},
																{varnPosX = 125,varnPosY = 130},
																{varnPosX = 117,varnPosY = 99},
								}        
								
x700110_var_Pos8 = { 
																{varnPosX = 34,varnPosY = 39},
																{varnPosX = 37,varnPosY = 59},
																{varnPosX = 71,varnPosY = 34},
																{varnPosX = 74,varnPosY = 67},
																{varnPosX = 101,varnPosY = 63},
																{varnPosX = 147,varnPosY = 61},
																{varnPosX = 132,varnPosY = 71},
																{varnPosX = 155,varnPosY = 85},
																{varnPosX = 186,varnPosY = 75},
																{varnPosX = 190,varnPosY = 48},
																{varnPosX = 57,varnPosY = 110},
																{varnPosX = 85,varnPosY = 116},
																{varnPosX = 119,varnPosY = 138},
																{varnPosX = 70,varnPosY = 163},
																{varnPosX = 109,varnPosY = 174},
																{varnPosX = 149,varnPosY = 161},
																{varnPosX = 193,varnPosY = 163},
																{varnPosX = 216,varnPosY = 157},
																{varnPosX = 177,varnPosY = 126},
																{varnPosX = 203,varnPosY = 115},
																{varnPosX = 49,varnPosY = 213},
																{varnPosX = 53,varnPosY = 190},
																{varnPosX = 71,varnPosY = 171},
																{varnPosX = 134,varnPosY = 186},
																{varnPosX = 75,varnPosY = 208},
																{varnPosX = 140,varnPosY = 185},
																{varnPosX = 148,varnPosY = 216},
																{varnPosX = 176,varnPosY = 201},
																{varnPosX = 198,varnPosY = 198},
																{varnPosX = 202,varnPosY = 215},
								} 								
								
x700110_var_Pos11 = { 
																{varnPosX = 34,varnPosY = 84},
																{varnPosX = 55,varnPosY = 42},
																{varnPosX = 86,varnPosY = 31},
																{varnPosX = 81,varnPosY = 71},
																{varnPosX = 99,varnPosY = 38},
																{varnPosX = 147,varnPosY = 54},
																{varnPosX = 177,varnPosY = 34},
																{varnPosX = 209,varnPosY = 55},
																{varnPosX = 204,varnPosY = 78},
																{varnPosX = 214,varnPosY = 71},
																{varnPosX = 30,varnPosY = 122},
																{varnPosX = 49,varnPosY = 166},
																{varnPosX = 63,varnPosY = 137},
																{varnPosX = 89,varnPosY = 152},
																{varnPosX = 89,varnPosY = 177},
																{varnPosX = 128,varnPosY = 182},
																{varnPosX = 152,varnPosY = 161},
																{varnPosX = 183,varnPosY = 143},
																{varnPosX = 209,varnPosY = 126},
																{varnPosX = 217,varnPosY = 149},
																{varnPosX = 34,varnPosY = 208},
																{varnPosX = 49,varnPosY = 229},
																{varnPosX = 77,varnPosY = 191},
																{varnPosX = 119,varnPosY = 190},
																{varnPosX = 127,varnPosY = 220},
																{varnPosX = 154,varnPosY = 194},
																{varnPosX = 152,varnPosY = 214},
																{varnPosX = 195,varnPosY = 200},
																{varnPosX = 209,varnPosY = 170},
																{varnPosX = 216,varnPosY = 152},
								}								


x700110_var_Pos17 = { 
																{varnPosX = 53,varnPosY = 93},
																{varnPosX = 36,varnPosY = 50},
																{varnPosX = 64,varnPosY = 60},
																{varnPosX = 99,varnPosY = 43},
																{varnPosX = 95,varnPosY = 89},
																{varnPosX = 148,varnPosY = 58},
																{varnPosX = 147,varnPosY = 74},
																{varnPosX = 169,varnPosY = 50},
																{varnPosX = 196,varnPosY = 53},
																{varnPosX = 192,varnPosY = 73},
																{varnPosX = 31,varnPosY = 159},
																{varnPosX = 86,varnPosY = 128},
																{varnPosX = 118,varnPosY = 152},
																{varnPosX = 144,varnPosY = 128},
																{varnPosX = 124,varnPosY = 158},
																{varnPosX = 170,varnPosY = 143},
																{varnPosX = 198,varnPosY = 118},
																{varnPosX = 206,varnPosY = 121},
																{varnPosX = 195,varnPosY = 151},
																{varnPosX = 165,varnPosY = 168},
																{varnPosX = 53,varnPosY = 183},
																{varnPosX = 73,varnPosY = 174},
																{varnPosX = 62,varnPosY = 224},
																{varnPosX = 124,varnPosY = 193},
																{varnPosX = 141,varnPosY = 212},
																{varnPosX = 173,varnPosY = 185},
																{varnPosX = 209,varnPosY = 163},
																{varnPosX = 199,varnPosY = 189},
																{varnPosX = 198,varnPosY = 215},
																{varnPosX = 206,varnPosY = 186},
								}		

x700110_var_Pos20 = { 
																{varnPosX = 24,varnPosY = 42},
																{varnPosX = 39,varnPosY = 29},
																{varnPosX = 57,varnPosY = 64},
																{varnPosX = 82,varnPosY = 52},
																{varnPosX = 111,varnPosY = 53},
																{varnPosX = 138,varnPosY = 66},
																{varnPosX = 157,varnPosY = 41},
																{varnPosX = 185,varnPosY = 27},
																{varnPosX = 213,varnPosY = 27},
																{varnPosX = 199,varnPosY = 78},
																{varnPosX = 240,varnPosY = 76},
																{varnPosX = 233,varnPosY = 113},
																{varnPosX = 214,varnPosY = 128},
																{varnPosX = 187,varnPosY = 137},
																{varnPosX = 179,varnPosY = 165},
																{varnPosX = 177,varnPosY = 208},
																{varnPosX = 197,varnPosY = 200},
																{varnPosX = 211,varnPosY = 175},
																{varnPosX = 198,varnPosY = 218},
																{varnPosX = 224,varnPosY = 211},
																{varnPosX = 222,varnPosY = 228},
																{varnPosX = 131,varnPosY = 109},
																{varnPosX = 122,varnPosY = 151},
																{varnPosX = 54,varnPosY = 162},
																{varnPosX = 29,varnPosY = 166},
																{varnPosX = 113,varnPosY = 200},
																{varnPosX = 87,varnPosY = 227},
																{varnPosX = 52,varnPosY = 234},
																{varnPosX = 54,varnPosY = 205},
																{varnPosX = 194,varnPosY = 142},
								}		

x700110_var_Pos23 = { 
																{varnPosX = 39,varnPosY = 78},
																{varnPosX = 60,varnPosY = 80},
																{varnPosX = 78,varnPosY = 61},
																{varnPosX = 96,varnPosY = 73},
																{varnPosX = 115,varnPosY = 54},
																{varnPosX = 116,varnPosY = 83},
																{varnPosX = 115,varnPosY = 83},
																{varnPosX = 173,varnPosY = 62},
																{varnPosX = 205,varnPosY = 51},
																{varnPosX = 223,varnPosY = 28},
																{varnPosX = 114,varnPosY = 114},
																{varnPosX = 114,varnPosY = 140},
																{varnPosX = 93,varnPosY = 150},
																{varnPosX = 68,varnPosY = 157},
																{varnPosX = 51,varnPosY = 147},
																{varnPosX = 31,varnPosY = 140},
																{varnPosX = 100,varnPosY = 173},
																{varnPosX = 110,varnPosY = 197},
																{varnPosX = 107,varnPosY = 227},
																{varnPosX = 129,varnPosY = 209},
																{varnPosX = 158,varnPosY = 210},
																{varnPosX = 180,varnPosY = 214},
																{varnPosX = 173,varnPosY = 175},
																{varnPosX = 185,varnPosY = 141},
																{varnPosX = 199,varnPosY = 187},
																{varnPosX = 217,varnPosY = 187},
																{varnPosX = 217,varnPosY = 205},
																{varnPosX = 232,varnPosY = 224},
																{varnPosX = 222,varnPosY = 230},
																{varnPosX = 115,varnPosY = 127},
								}										
-- 场景ID对应的坐标点表                           
x700110_var_SenceMap = {                   
											 [5] = x700110_var_Pos5,
											 [8] = x700110_var_Pos8,
											 [11] = x700110_var_Pos11,
											 [17] = x700110_var_Pos17,
											 [20] = x700110_var_Pos20,
											 [23] = x700110_var_Pos23
										 }
                                         
------------------------------------------------------------------------------------------------
-- 创建NPC                                 
function x700110_CreateNpc(varMap, varPlayer)
		                                 
		if x700110_var_LiveNpcMap[varMap] == nil then
			return                       
		end                              
		                                 
		local nNum = x7001105_GetSenceliveNpcNum(varMap)
		                                 
		if nNum >= x700110_var_Sence_Npc_MaxNum then
			return                       
		end                              
		                                 
		if nNum <= 0 then                
			nNum = x700110_var_Sence_Npc_MaxNum
		else                             
			nNum = x700110_var_Sence_Npc_MaxNum - nNum
		end                              
		                                 
		for i = 0, nNum do               
			local nRandomNum = random (1, getn(x700110_var_SenceMap[varMap]))
		                                 
			local varnPosX, varnPosY           
			varnPosX = x700110_var_SenceMap[varMap][nRandomNum].varnPosX 
			varnPosY = x700110_var_SenceMap[varMap][nRandomNum].varnPosY
			                             
			while x7001105_CheckPosRepeat(varMap, varnPosX, varnPosY) == 1 do
                                         
				nRandomNum = random (1, getn(x700110_var_SenceMap[varMap]))
				                         
				varnPosX = x700110_var_SenceMap[varMap][nRandomNum].varnPosX 
				varnPosY = x700110_var_SenceMap[varMap][nRandomNum].varnPosY
			end                          
	                                     
			-- 添加NPC                     
			local varObjID = CreateMonster(varMap, x700110_var_NpcID, varnPosX , varnPosY , 3, -1, -1, x700110_var_NpcGUID, 20, x700110_var_NpcLiveTime, 0, "赵保藏","神秘宝库传送人")		
			                             
			if varObjID <= 0 then          
				                         
			end                          
			for j = 1, x700110_var_Sence_Npc_MaxNum do
				if GetMonsterPosition(varMap, x700110_var_LiveNpcMap[varMap][j].varObjID) == nil then
					x700110_var_LiveNpcMap[varMap][j].varnPosX 	= varnPosX
					x700110_var_LiveNpcMap[varMap][j].varnPosY 	= varnPosY
					x700110_var_LiveNpcMap[varMap][j].varObjID = varObjID
					break                
				end                      
			end                          
			                             
		end                              
		                                 
		local name = GetName( varMap, varPlayer)
		local area = "领地·凤翔府"
		if varMap == 8 then
			area = "领地·阿尔金山"
		elseif 	varMap == 11 then
			area = "领地·撒马尔罕"
		elseif 	varMap == 17 then
			area = "领地·莫斯科"
		elseif 	varMap == 20 then
			area = "领地·匈牙利"
		elseif 	varMap == 23 then
			area = "领地·大马士革"
		end
   	local broadcast = "玩家"..name.."在"..area.."挖藏宝图时发现了副本神秘宝库的入口！"
   	LuaAllScenceM2Wrold (varMap,broadcast, 0, 1)
    LuaAllScenceM2Wrold (varMap,broadcast, 4, 1)
                                         
end                                      
                                         
-- 删除NPC                                 
function x700110_DeleteNpc(varMap, varPlayer)
	                                     
	DeleteMonster(varMap, varPlayer)       
	                                     
end                                      
                                         
-- 检测随机到的点是否重复                           
function x7001105_CheckPosRepeat(varMap, nPosx, nPosy)
                                         
		for j = 1, x700110_var_Sence_Npc_MaxNum do
			if x700110_var_LiveNpcMap[varMap][j].varnPosX == nPosx and 
				 x700110_var_LiveNpcMap[varMap][j].varnPosY == nPosy then
				return 1                 
			end                          
		end                              
                                         
	return 0                             
end                                      
                                         
-- 获取当前场景存在的NPC的数量                       
function x7001105_GetSenceliveNpcNum(varMap)
		local nNum = 0;                  
		for j = 1, x700110_var_Sence_Npc_MaxNum do
			if GetMonsterPosition(varMap, x700110_var_LiveNpcMap[varMap][j].varObjID) ~= nil then
				nNum = nNum + 1          
			end                          
		end                              
		return nNum                      
end                                      
