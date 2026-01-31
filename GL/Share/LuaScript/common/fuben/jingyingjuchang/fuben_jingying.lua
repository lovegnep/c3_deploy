
x701130_var_FileId 					= 701130

x701130_CSP_FUBENTYPE				= 0
x701130_CSP_SCRIPTID				=	1
x701130_CSP_TICKCOUNT				= 2
x701130_CSP_BACKSCENEID			= 3
x701130_CSP_ISCLOSING				= 4
x701130_CSP_LEAVECOUNTDOWN	= 5
x701130_CSP_TEAMID					=	6
x701130_CSP_TICKTIME				=	7
x701130_CSP_HOLDTIME				=	8
x701130_CSP_FUBENLEVEL			=	9


x701130_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难

x701130_CSP_AI_NUM	=  21
x701130_CSP_AI_1	=  22
x701130_CSP_AI_2	=  23
x701130_CSP_AI_3	=  24
x701130_CSP_AI_4	=  25
x701130_CSP_AI_5	=  26

x701130_CSP_BOSSID = 27
x701130_CSP_PLAYERID = 28
x701130_CSP_BOSS_TYPE = 29
x701130_CSP_BOSS_X = 30   -----boss出生位置 X
x701130_CSP_BOSS_Z = 31   ----boss出生位置 Z

x701130_CSP_BOSS_STATE = 32
x701130_CSP_BOSS_PLAYSTATE = 33
x701130_STOP_TICK = 34
--------40以后和AI脚本用 每个AI固定10个CSP 一直排到239--------------
--x701130_CSP_JIANJIN_BOSS_COMBAT_START_TIME = 40 -- boss 进入战斗时间
--x701130_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1 = 41


--------------------------------------------------------------
x701130_CSP_JINGYING_INDEX 			  = 296 --剧场索引
x701130_CSP_ENTER_POS_INDEX 			= 297 --玩家进入位置的索引



--------------------------------------------------------------
x701130_AI_COUNT_MAX	=  3   ---每个boss最大AI数目

x701130_JUCHANG_COUNT_MAX	= 21   ---每个难度最大剧场数

x701130_ENTER_COUNT_MAX	= 15   ---周最大可玩次数

-----boss状态定义---------------
x701130_BOSS_STATE_DIALOG  = 0  ----对话状态
x701130_BOSS_STATE_PLAY    = 1  ----表演状态
x701130_BOSS_STATE_COMBAT  = 2  ----战斗状态

------------------------------------------
--配置可以打开精英剧场的wordID。 如果tab为空表示精英剧场对所有Word都开放
x701130_var_OpenJingYingFuben_World_Tab =
{15	,21	,23	,31	,44	,53	,62	,73	,84	,106	,114 , 121	,138	,150	,151	,156	,161	,167	,196	,201	,211	,216	,220	,241	,284	,300	,316	,321	,323	,344	,353	,364	,390	,424	,1002	,1122	,1172	,1222	,1242	,1272	,1302	,1332	,1342	,1352	,1372	,1402	,1432	,1442	,1452	,1462	,1472	,
1502	,1512	,1522	,1532	,1542	,1602	,1612	,1622	,1632	,1642	,1652	,1662	,3002	,3052	,3142	,3152	,3202	,3222	,3232	,3242	,3252	,3262	,3272	,3302	,3312	,3322	,3332	,2702,2712,2722,2732,2742,2752,2762,2772,2782,2792,2802,2812,2822,2832,2842,2852,2862,2872,2882,2892,2902,2912,2922,
2932,2942,2952,2962,2972,2982,2992,}




x701130_var_AI =
{
    {701131,701133,701134,701135,701136,701137,701138,701139,701140,701141,701142,701143,701144},
    --{701131},
    {701131,701133,701134,701135,701136,701137,701138,701139,701140,701141,701142,701143,701144},
    
    {701131,701133,701134,701135,701136,701137,701138,701139,701140,701141,701142,701143,701144},
    
}

x701130_var_boss_title = 
{
	[701131] = {name = "#G+冰结+#W",buff =100 },
	[701133] = {name = "#G+霹雳+#W",buff =100 },
	[701134] = {name = "#G+分身+#W",buff =100 },
	[701135] = {name = "#G+监禁+#W",buff =100 },
	[701136] = {name = "#G+快速+#W",buff =100 },
	[701137] = {name = "#G+流星+#W",buff =100 },
	[701138] = {name = "#G+强命+#W",buff =100 },
	[701139] = {name = "#G+瘟疫+#W",buff =100 },
	[701140] = {name = "#G+烈焰+#W",buff =100 },
	[701141] = {name = "#G+血族+#W",buff =100 },
	[701142] = {name = "#G+磁力+#W",buff =100 },
	[701143] = {name = "#G+召唤+#W",buff =100 },
	[701144] = {name = "#G+瞬闪+#W",buff =100 },
	--[701132] = {name = "#Y*冲撞*#W",buff =100 },
}  
		

x701130_var_NPC = 
{                                                                                                                                                                                                                                                                                                         
    { type = 4380, guid = 550000, facedir = 180, name = "钥匙老人", title = "精英剧场传送人" },
}
									
x701130_var_boss =            ---key为剧场索引，vaule为相应boss配置
{
	--普通
   [1]  = {type = 63000, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·丘处机"},
   [2]  = {type = 63001, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·木华黎"},
   [3]  = {type = 63002, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·速不台"},
   [4]  = {type = 63003, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·金轮"},
   [5]  = {type = 63004, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·周伯通"},
   [6]  = {type = 63005, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·耶律楚材"},
   [7]  = {type = 63006, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·高良惠"},
   [8]  = {type = 63007, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·乌罕"},
   [9]  = {type = 63008, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·天宸禅师"},
   [10] = {type = 63009, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·蒙哥"},
   [11] = {type = 63010, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·王处一"},
   [12] = {type = 63011, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·哲别"},
   [13] = {type = 63012, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·伯颜"},
   [14] = {type = 63013, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·史纳都"},
   [15] = {type = 63014, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·贝尔比二世"},
   [16] = {type = 63015, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·斯道尔公爵"},
   [17] = {type = 63016, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·拔都"},
   [18] = {type = 63017, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·瓦伦斯"},
   [19] = {type = 63018, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·洪茶丘"},
   [20] = {type = 63019, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·藤原经资"},
   [21] = {type = 63020, AI = 29, AIScript = 88, facedir = 180, name = "乱魔·维康亲王"},
   --英雄
   [101] = {type = 63021, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·丘处机"},
   [102] = {type = 63022, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·木华黎"},
   [103] = {type = 63023, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·速不台"},
   [104] = {type = 63024, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·金轮"},
   [105] = {type = 63025, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·周伯通"},
   [106] = {type = 63026, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·耶律楚材"},
   [107] = {type = 63027, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·高良惠"},
   [108] = {type = 63028, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·乌罕"},
   [109] = {type = 63029, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·天宸禅师"},
   [110] = {type = 63030, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·蒙哥"},
   [111] = {type = 63031, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·王处一"},
   [112] = {type = 63032, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·哲别"},
   [113] = {type = 63033, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·伯颜"},
   [114] = {type = 63034, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·史纳都"},
   [115] = {type = 63035, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·贝尔比二世"},
   [116] = {type = 63036, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·斯道尔公爵"},
   [117] = {type = 63037, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·拔都"},
   [118] = {type = 63038, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·瓦伦斯"},
   [119] = {type = 63039, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·洪茶丘"},
   [120] = {type = 63040, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·藤原经资"},
   [121] = {type = 63041, AI = 29, AIScript = 88, facedir = 180, name = "疯魔·维康亲王"},
   --炼狱
   [201] = {type = 63042, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·丘处机"},
   [202] = {type = 63043, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·木华黎"},
   [203] = {type = 63044, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·速不台"},
   [204] = {type = 63045, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·金轮"},
   [205] = {type = 63046, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·周伯通"},
   [206] = {type = 63047, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·耶律楚材"},
   [207] = {type = 63048, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·高良惠"},
   [208] = {type = 63049, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·乌罕"},
   [209] = {type = 63050, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·天宸禅师"},
   [210] = {type = 63051, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·蒙哥"},
   [211] = {type = 63052, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·王处一"},
   [212] = {type = 63053, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·哲别"},
   [213] = {type = 63054, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·伯颜"},
   [214] = {type = 63055, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·史纳都"},
   [215] = {type = 63056, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·贝尔比二世"},
   [216] = {type = 63057, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·斯道尔公爵"},
   [217] = {type = 63058, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·拔都"},
   [218] = {type = 63059, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·瓦伦斯"},
   [219] = {type = 63060, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·洪茶丘"},
   [220] = {type = 63061, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·藤原经资"},
   [221] = {type = 63062, AI = 29, AIScript = 88, facedir = 180, name = "狂魔·维康亲王"},
   
}

x701130_var_fenshen_BOSS = {
--普通  
 [1]  = 63140,
 [2]  = 63141,
 [3]  = 63142,
 [4]  = 63143,
 [5]  = 63144,
 [6]  = 63145,
 [7]  = 63146,
 [8]  = 63147,
 [9]  = 63148,
 [10] = 63149,
 [11] = 63150,
 [12] = 63151,
 [13] = 63152,
 [14] = 63153,
 [15] = 63154,
 [16] = 63155,
 [17] = 63156,
 [18] = 63157,
 [19] = 63158,
 [20] = 63159,
 [21] = 63160,
 --英雄      , 
 [101] =63162, 
 [102] =63163, 
 [103] =63164, 
 [104] =63165, 
 [105] =63166, 
 [106] =63167, 
 [107] =63168, 
 [108] =63169, 
 [109] =63170, 
 [110] =63171, 
 [111] =63172, 
 [112] =63173, 
 [113] =63174, 
 [114] =63175, 
 [115] =63176, 
 [116] =63177, 
 [117] =63178, 
 [118] =63179, 
 [119] =63180, 
 [120] =63181, 
 [121] =63182, 
 --炼狱      , 
 [201] =63184, 
 [202] =63185, 
 [203] =63186, 
 [204] =63187, 
 [205] =63188, 
 [206] =63189, 
 [207] =63190, 
 [208] =63191, 
 [209] =63192, 
 [210] =63193, 
 [211] =63194, 
 [212] =63195, 
 [213] =63196, 
 [214] =63197, 
 [215] =63198, 
 [216] =63199, 
 [217] =63200, 
 [218] =63201, 
 [219] =63202, 
 [220] =63203, 
 [221] =63204 

}

x701130_var_boss_pos = 
{
   [63000] = {
				     { x = 113, z=61 },
					   { x = 210, z=112},
					   { x = 67 , z=208},
				    },         
   [63001] = {         
				     { x = 99 , z=147},
					   { x = 97 , z=42 },
					   { x = 199, z=140},
				    },         
   [63002] = {         
				     { x = 64 , z=105},
					   { x = 219, z=74 },
					   { x = 156, z=158},
				    },         
   [63003] = {         
				     { x = 116, z=125},
					   { x = 222, z=56 },
					   { x = 36 , z=225},
				    },         
   [63004] = {         
				     { x = 97 , z=62 },
					   { x = 216, z=105},
					   { x = 78 , z=198},
				    },         
   [63005] = {         
				     { x = 116, z=81 },
					   { x = 210, z=83 },
					   { x = 182, z=169},
				    },         
   [63006] = {         
				     { x = 125, z=43 },
					   { x = 210, z=169},
					   { x = 44 , z=182},
				    },         
   [63007] = {         
				     { x = 50 , z=213},
					   { x = 199, z=37 },
					   { x = 35 , z=43 },
				    },         
   [63008] = {         
				     { x = 143, z=110},
					   { x = 47 , z=107},
					   { x = 118, z=215},
				    },         
   [63009] = {         
				     { x = 127, z=92 },
					   { x = 200, z=204},
					   { x = 76 , z=206},
				    },         
   [63010] = {         
				     { x = 108, z=132},
					   { x = 199, z=40 },
					   { x = 211, z=206},
				    },         
   [63011] = {         
				     { x = 100, z=209},
					   { x = 169, z=94 },
					   { x = 208, z=193},
				    },         
   [63012] = {         
				     { x = 169, z=45 },
					   { x = 58 , z=96 },
					   { x = 82 , z=225},
				    },         
   [63013] = {         
				     { x = 196, z=43 },
					   { x = 137, z=43 },
					   { x = 73 , z=203},
				    },         
   [63014] = {         
				     { x = 213, z=37 },
					   { x = 197, z=214},
					   { x = 57 , z=59 },
				    },         
   [63015] = {         
				     { x = 197, z=86 },
					   { x = 223, z=218},
					   { x = 91 , z=42 },
				    },         
   [63016] = {         
				     { x = 68 , z=222},
					   { x = 226, z=129},
					   { x = 158, z=33 },
				    },         
   [63017] = {         
				     { x = 89 , z=154},
					   { x = 163, z=88 },
					   { x = 59 , z=118},
				    },         
   [63018] = {         
				     { x = 63 , z=145},
					   { x = 200, z=203},
					   { x = 86 , z=203},
				    },         
   [63019] = {         
				     { x = 129, z=105},
					   { x = 39 , z=108},
					   { x = 204, z=214},
				    },         
   [63020] = {         
				     { x = 104, z=60 },
					   { x = 194, z=182},
					   { x = 43 , z=216},
				    },
	--英雄
	[63021] = {
				     { x = 113, z=61 },
					   { x = 210, z=112},
					   { x = 67 , z=208},
				    },         
   [63022] = {         
				     { x = 99 , z=147},
					   { x = 97 , z=42 },
					   { x = 199, z=140},
				    },         
   [63023] = {         
				     { x = 64 , z=105},
					   { x = 219, z=74 },
					   { x = 156, z=158},
				    },         
   [63024] = {         
				     { x = 116, z=125},
					   { x = 222, z=56 },
					   { x = 36 , z=225},
				    },         
   [63025] = {         
				     { x = 97 , z=62 },
					   { x = 216, z=105},
					   { x = 78 , z=198},
				    },         
   [63026] = {         
				     { x = 116, z=81 },
					   { x = 210, z=83 },
					   { x = 182, z=169},
				    },         
   [63027] = {         
				     { x = 125, z=43 },
					   { x = 210, z=169},
					   { x = 44 , z=182},
				    },         
   [63028] = {         
				     { x = 50 , z=213},
					   { x = 199, z=37 },
					   { x = 35 , z=43 },
				    },         
   [63029] = {         
				     { x = 143, z=110},
					   { x = 47 , z=107},
					   { x = 118, z=215},
				    },         
   [63030] = {         
				     { x = 127, z=92 },
					   { x = 200, z=204},
					   { x = 76 , z=206},
				    },         
   [63031] = {         
				     { x = 108, z=132},
					   { x = 199, z=40 },
					   { x = 211, z=206},
				    },         
   [63032] = {         
				     { x = 100, z=209},
					   { x = 169, z=94 },
					   { x = 208, z=193},
				    },         
   [63033] = {         
				     { x = 169, z=45 },
					   { x = 58 , z=96 },
					   { x = 82 , z=225},
				    },         
   [63034] = {         
				     { x = 196, z=43 },
					   { x = 137, z=43 },
					   { x = 73 , z=203},
				    },         
   [63035] = {         
				     { x = 213, z=37 },
					   { x = 197, z=214},
					   { x = 57 , z=59 },
				    },         
   [63036] = {         
				     { x = 197, z=86 },
					   { x = 223, z=218},
					   { x = 91 , z=42 },
				    },         
   [63037] = {         
				     { x = 68 , z=222},
					   { x = 226, z=129},
					   { x = 158, z=33 },
				    },         
   [63038] = {         
				     { x = 89 , z=154},
					   { x = 163, z=88 },
					   { x = 59 , z=118},
				    },         
   [63039] = {         
				     { x = 63 , z=145},
					   { x = 200, z=203},
					   { x = 86 , z=203},
				    },         
   [63040] = {         
				     { x = 129, z=105},
					   { x = 39 , z=108},
					   { x = 204, z=214},
				    },         
   [63041] = {         
				     { x = 104, z=60 },
					   { x = 194, z=182},
					   { x = 43 , z=216},
				    },
	--传说
	[63042] = {
				     { x = 113, z=61 },
					   { x = 210, z=112},
					   { x = 67 , z=208},
				    },         
   [63043] = {         
				     { x = 99 , z=147},
					   { x = 97 , z=42 },
					   { x = 199, z=140},
				    },         
   [63044] = {         
				     { x = 64 , z=105},
					   { x = 219, z=74 },
					   { x = 156, z=158},
				    },         
   [63045] = {         
				     { x = 116, z=125},
					   { x = 222, z=56 },
					   { x = 36 , z=225},
				    },         
   [63046] = {         
				     { x = 97 , z=62 },
					   { x = 216, z=105},
					   { x = 78 , z=198},
				    },         
   [63047] = {         
				     { x = 116, z=81 },
					   { x = 210, z=83 },
					   { x = 182, z=169},
				    },         
   [63048] = {         
				     { x = 125, z=43 },
					   { x = 210, z=169},
					   { x = 44 , z=182},
				    },         
   [63049] = {         
				     { x = 50 , z=213},
					   { x = 199, z=37 },
					   { x = 35 , z=43 },
				    },         
   [63050] = {         
				     { x = 143, z=110},
					   { x = 47 , z=107},
					   { x = 118, z=215},
				    },         
   [63051] = {         
				     { x = 127, z=92 },
					   { x = 200, z=204},
					   { x = 76 , z=206},
				    },         
   [63052] = {         
				     { x = 108, z=132},
					   { x = 199, z=40 },
					   { x = 211, z=206},
				    },         
   [63053] = {         
				     { x = 100, z=209},
					   { x = 169, z=94 },
					   { x = 208, z=193},
				    },         
   [63054] = {         
				     { x = 169, z=45 },
					   { x = 58 , z=96 },
					   { x = 82 , z=225},
				    },         
   [63055] = {         
				     { x = 196, z=43 },
					   { x = 137, z=43 },
					   { x = 73 , z=203},
				    },         
   [63056] = {         
				     { x = 213, z=37 },
					   { x = 197, z=214},
					   { x = 57 , z=59 },
				    },         
   [63057] = {         
				     { x = 197, z=86 },
					   { x = 223, z=218},
					   { x = 91 , z=42 },
				    },         
   [63058] = {         
				     { x = 68 , z=222},
					   { x = 226, z=129},
					   { x = 158, z=33 },
				    },         
   [63059] = {         
				     { x = 89 , z=154},
					   { x = 163, z=88 },
					   { x = 59 , z=118},
				    },         
   [63060] = {         
				     { x = 63 , z=145},
					   { x = 200, z=203},
					   { x = 86 , z=203},
				    },         
   [63061] = {         
				     { x = 129, z=105},
					   { x = 39 , z=108},
					   { x = 204, z=214},
				    },         
   [63062] = {         
				     { x = 104, z=60 },
					   { x = 194, z=182},
					   { x = 43 , z=216},
				    },
				    
}		

x701130_shuoming = {"1.精英剧场为单人副本，每人每周总共能挑战15次。\n2.精英剧场是顺序开启，打过上一关即开启下一关，打通一个难度开启下一难度。\n3.精英副本中BOSS总会出现在离你最近的出没地点。\n4.BOSS会有随机技能，不同难度BOSS的技能数量不同。\n5.不能将BOSS拉出太远，否则他会狂暴的。\n6.只有打过了某一关精英剧场才能使用代刷功能！\n7.排行榜最后一名到了70，80，90之后才会开启相应难度精英剧场。"}
x701130_DaiShua_Cost = 
{ --代刷金币花费
	--普通
   [1]  = {cost=5 , exp =281688 },    
   [2]  = {cost=5 , exp =281688 },     
   [3]  = {cost=5 , exp =281688 },    
   [4]  = {cost=6 , exp =301688 },    
   [5]  = {cost=6 , exp =301688 },    
   [6]  = {cost=6 , exp =301688 },    
   [7]  = {cost=7 , exp =321688 },    
   [8]  = {cost=7 , exp =321688 },    
   [9]  = {cost=7 , exp =321688 },    
   [10] = {cost=8 , exp =341688 },    
   [11] = {cost=8 , exp =341688 },    
   [12] = {cost=8 , exp =341688 },    
   [13] = {cost=9 , exp =361688 },    
   [14] = {cost=9 , exp =361688 },    
   [15] = {cost=9 , exp =361688 },    
   [16] = {cost=10, exp =381688 },    
   [17] = {cost=10, exp =381688 },    
   [18] = {cost=10, exp =381688 },    
   [19] = {cost=11, exp =401688 },    
   [20] = {cost=11, exp =401688 },    
   [21] = {cost=11, exp =401688 },    
   --英雄 {cost=     }            ,
   [101] ={cost=12 ,exp =502356 }, 
   [102] ={cost=12 ,exp =502356 },  
   [103] ={cost=12 ,exp =502356 },   
   [104] ={cost=13 ,exp =552356 },    
   [105] ={cost=13 ,exp =552356 },     
   [106] ={cost=13 ,exp =552356 },      
   [107] ={cost=14 ,exp =602356 }, 
   [108] ={cost=14 ,exp =602356 }, 
   [109] ={cost=14 ,exp =602356 }, 
   [110] ={cost=15 ,exp =652356 },
   [111] ={cost=15 ,exp =652356 },
   [112] ={cost=15 ,exp =652356 },
   [113] ={cost=16 ,exp =702356 }, 
   [114] ={cost=16 ,exp =702356 }, 
   [115] ={cost=16 ,exp =702356 }, 
   [116] ={cost=17 ,exp =752356 }, 
   [117] ={cost=17 ,exp =752356 }, 
   [118] ={cost=17 ,exp =752356 }, 
   [119] ={cost=18 ,exp =802356 }, 
   [120] ={cost=18 ,exp =802356 }, 
   [121] ={cost=18 ,exp =802356 }, 
   --炼狱 {cost=     }            ,
   [201] ={cost=19, exp =1008600},
   [202] ={cost=19, exp =1008600},
   [203] ={cost=19, exp =1008600},
   [204] ={cost=20, exp =1108600},
   [205] ={cost=20, exp =1108600},
   [206] ={cost=20, exp =1108600},
   [207] ={cost=21, exp =1208600},
   [208] ={cost=21, exp =1208600},
   [209] ={cost=21, exp =1208600},
   [210] ={cost=22, exp =1308600},
   [211] ={cost=22, exp =1308600},
   [212] ={cost=22, exp =1308600},
   [213] ={cost=23, exp =1408600},
   [214] ={cost=23, exp =1408600},
   [215] ={cost=23, exp =1408600},
   [216] ={cost=24, exp =1508600},
   [217] ={cost=24, exp =1508600},
   [218] ={cost=24, exp =1508600},
   [219] ={cost=25, exp =1608600},
   [220] ={cost=25, exp =1608600},
   [221] ={cost=25, exp =1608600},
}	
										 



x701130_LingLi_Award = 
{  ----灵力奖励值
    {200, 250, 300, 350, 400, 450, 500,},   --普通
    {700, 750, 800, 850, 900, 950, 1000},   --中等
    {1200, 1250, 1300, 1350, 1400, 1450, 1500},  --专家
}

x701130_TianWai_Drop = 
{ ---天外焚石掉落概率 * 1000
    {475, 500, 525, 550, 575, 600, 625,},   --普通
    {950, 1000, 1050, 1100, 1150, 1200, 1250},   --中等
    {1900, 2000, 2100, 2200, 2300, 2400, 2500},  --专家
}

x701130_Drop_1 =
{  --不分难度龙鳞必掉
   11000356,
}

x701130_Drop_2 =
{  --不分难度随机掉一样物品
   30001002 ,30001007 ,30001012 ,30011002 ,30011007 ,30011012 ,30021002 ,30021007 ,30021012 ,30031002 ,30031007 ,30031012 ,30061002 ,30061007 ,30061012 ,30071002 ,30071007 ,30071012 ,30081002 ,30081007 ,30081012 ,30091002 ,30091007 ,30091012,
}

x701130_Drop_3 =
{ --分难度掉物品
  {  --普通
      { num = 1, rate = 1 ,    quality = 3, itemID = {45011126 ,45011356 ,45011596 ,45011826 ,45012071 ,45012301 ,45012526 ,45012531 ,45012781 ,45013001 ,45013006 ,45013236,} }, 
      { num = 1, rate = 8,     quality = 2, itemID = {45011076 ,45011306 ,45011546 ,45011791 ,45012021 ,45012256 ,45012486 ,45012751 ,45012966 ,45013201,} }, 
      { num = 1, rate = 100, quality = 1, itemID = {45011046 ,45011276 ,45011511 ,45011761 ,45011986 ,45012226 ,45012456 ,45012721 ,45012936 ,45013171,} }, 
      { num = 8, rate = 100, quality = 0, itemID = {45011016 ,45011246 ,45011481 ,45011731 ,45011956 ,45012196 ,45012426 ,45012686 ,45012901 ,45013136,} }, 
  },
  
  { --中等
      { num = 1, rate = 1 ,    quality = 3, itemID = {45011131 ,45011361 ,45011601 ,45011831 ,45012076 ,45012306 ,45012536 ,45012541 ,45012786 ,45013011 ,45013241 ,45013246,} }, 
      { num = 1, rate = 8,     quality = 2, itemID = {45011081 ,45011086 ,45011091 ,45011311 ,45011316 ,45011551 ,45011556 ,45011561 ,45011796 ,45011801 ,45012026 ,45012031 ,45012036 ,45012261 ,45012266 ,45012491 ,45012496 ,45012756 ,45012971 ,45013206,} }, 
      { num = 1, rate = 100, quality = 1, itemID = {45011051 ,45011281 ,45011516 ,45011766 ,45011991 ,45012231 ,45012461 ,45012726 ,45012941 ,45013176,} }, 
      { num = 8, rate = 100, quality = 0, itemID = {45011021 ,45011251 ,45011486 ,45011736 ,45011961 ,45012201 ,45012431 ,45012691 ,45012906 ,45013141,} }, 
  }, 
  
  { --专家
      { num = 1, rate = 1 ,    quality = 3, itemID = {45011136,45011366,45011606,45011611,45011836,45011841,45012081,45012086,45012311,45012316,45012546,45012791,45013016,45013251,} }, 
      { num = 1, rate = 8,     quality = 2, itemID = {45011096,45011101,45011321,45011326,45011566,45011571,45011806,45012041,45012046,45012271,45012276,45012501,45012506,45012761,45012976,45013211,} }, 
      { num = 1, rate = 100, quality = 1, itemID = {45011056,45011286,45011521,45011771,45011996,45012236,45012731,45012946,45013181,} }, 
      { num = 8, rate = 100, quality = 0, itemID = {45011026,45011256,45011491,45011741,45011966,45012206,45012436,45012696,45012911,45013146,} }, 
  }, 
}
		
		
function x701130_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)

    local objID = GetMonsterGUID(varMap, varTalknpc)  
	if ( objID == x701130_var_NPC[1].guid ) then     
		StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
	    TalkAppendString(varMap,"#Y【个人】精英剧场#W")                                                                                                                                                                                                                                                                           
	    TalkAppendString(varMap,"\n\t精英剧场中海都控制了强大的怪物，在剧场击败他们，可以迅速提高自己的能力，同时还可获得大量灵力，卡牌，马装等奖励。")                                                                                                                                                                                                                                                                        
	    TalkAppendButton(varMap, x701130_var_FileId, "继续挑战", 3, 101)      
	    TalkAppendButton(varMap, x701130_var_FileId, "退出副本", 3, 102) 
	    StopTalkTask()                                                                                                                                                                                                                                                                                                            
      DeliverTalkMenu(varMap, varPlayer, varTalknpc)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	end
	if objID == 550001 then
		TalkAppendButton(varMap, x701130_var_FileId, "【个人】精英剧场说明", 0, 103)      
	end
end
									
function x701130_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	local bossID = GetFubenData_Param(varMap, x701130_CSP_BOSSID  )
	if varTalknpc ~= bossID then
	    if nFlag == 101 then  
	        -------显示UI-------------------------
	        local jingyingIndex = GetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3])
	        
	        local regIndex = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3])
	        
	        
	        local enterCount = LuaCallNoclosure(700081, "GetEnterCount", varMap, varPlayer, regIndex)
			    ShowFutuUI( varMap, varPlayer, 3, jingyingIndex, enterCount, -1, -1 )
		elseif nFlag == 102 then
			   ----返回大都-----------------------------------------------------------
			    NewWorld( varMap, varPlayer, 0, 137 + random( 0, 2 ), 320 + random( 0, 2 ), 701130)
	    elseif nFlag == 103 then
	    	StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
		    TalkAppendString(varMap,"#Y【个人】精英剧场#W")                                                                                                                                                                                                                                                                           
		    TalkAppendString(varMap,x701130_shuoming[1])                                                                                                                                                                                                                                                                        
		    StopTalkTask()                                                                                                                                                                                                                                                                                                            
      		DeliverTalkMenu(varMap, varPlayer, varTalknpc)        
	    end
	else
	    StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
		TalkAppendString(varMap,"#Y精英剧场#W")                                                                                                                                                                                                                                                                           
		TalkAppendString(varMap,"\n\t这股奇异的力量我已经不能控制了，当我失去理智的一瞬间，你千万不要手下留情，用你最大的能力帮助我从这个可怕的力量中解脱出来！")                                                                                                                                                                                                                                                                        
		StopTalkTask()                                                                                                                                                                                                                                                                                                            
	    DeliverTalkMenu(varMap, varPlayer, varTalknpc) 
	    x701130_SetBossState(varMap, x701130_BOSS_STATE_PLAY )  
	    local talk={
	    	"啊！血色将铺满整个大地！杀！杀！杀！",
	    	"来自地狱深处的幽冥灵力将使我获得最强大的力量！",
	    	"海都赋予我的能力定能将你斩杀于此地！",
	    	"蝼蚁！你是没法感受这无与伦比的力量的！",
	    }
	    local rantalk = random(getn(talk))
	    NpcTalk(varMap, varTalknpc,talk[rantalk],-1) 
    end
end


function x701130_InitScene( varMap )
    
    SetFubenData_Param(varMap, x701130_CSP_BOSSID, -1)
    SetFubenData_Param(varMap, x701130_CSP_DIFFICULTY, 0)
    SetFubenData_Param(varMap, x701130_CSP_AI_NUM, 0)
    SetFubenData_Param(varMap, x701130_CSP_BOSS_STATE, 0)
    SetFubenData_Param(varMap, x701130_STOP_TICK, 0)
    
    SetFubenData_Param(varMap, x701130_CSP_AI_1, 0)
    SetFubenData_Param(varMap, x701130_CSP_AI_2, 0)
    SetFubenData_Param(varMap, x701130_CSP_AI_3, 0)
    SetFubenData_Param(varMap, x701130_CSP_AI_4, 0)
    SetFubenData_Param(varMap, x701130_CSP_AI_5, 0)
    
    local playerPos = GetFubenData_Param(varMap, x701130_CSP_ENTER_POS_INDEX  )
    local jingyingIndex = GetFubenData_Param(varMap, x701130_CSP_JINGYING_INDEX  )
    --WriteLog(1, "x701130_ProcFubenSceneCreated =========================playerPos:"..playerPos.." ,jingyingIndex:"..jingyingIndex) 
    ----设置AI数目和剧场难度
    if jingyingIndex < 100 then
       SetFubenData_Param(varMap, x701130_CSP_DIFFICULTY, 1)
       SetFubenData_Param(varMap, x701130_CSP_AI_NUM, 1)
    elseif jingyingIndex < 200 then
       SetFubenData_Param(varMap, x701130_CSP_DIFFICULTY, 2)
       SetFubenData_Param(varMap, x701130_CSP_AI_NUM, 2)
    else
       SetFubenData_Param(varMap, x701130_CSP_DIFFICULTY, 3)
       SetFubenData_Param(varMap, x701130_CSP_AI_NUM, 3)
    end
    
    --创建BOSS            
	  x701130_CreateBoss(varMap)
	  
	  -----调用相应AI的ProcFubenSceneCreated函数
    local bossID = GetFubenData_Param(varMap, x701130_CSP_BOSSID  )
    if ( bossID ~=  -1 ) then
        local AIScriptID1 = GetFubenData_Param(varMap, x701130_CSP_AI_1  )
        if AIScriptID1 ~= 0 then
            LuaCallNoclosure(tonumber(AIScriptID1), "ProcFubenSceneCreated", varMap)
        end
       
        local AIScriptID2 = GetFubenData_Param(varMap, x701130_CSP_AI_2  )
        if AIScriptID2~= 0 then
            LuaCallNoclosure(tonumber(AIScriptID2), "ProcFubenSceneCreated", varMap)
        end
       
        local AIScriptID3 = GetFubenData_Param(varMap, x701130_CSP_AI_3  )
        if AIScriptID3 ~= 0 then
            LuaCallNoclosure(tonumber(AIScriptID3), "ProcFubenSceneCreated", varMap)
        end
        local AIScriptID4 = GetFubenData_Param(varMap, x701130_CSP_AI_4  )
        if AIScriptID4 ~= 0 then
            LuaCallNoclosure(tonumber(AIScriptID4), "ProcFubenSceneCreated", varMap)
        end
        local AIScriptID5 = GetFubenData_Param(varMap, x701130_CSP_AI_5  )
        if AIScriptID5 ~= 0 then
            LuaCallNoclosure(tonumber(AIScriptID5), "ProcFubenSceneCreated", varMap)
        end
    --调用剧场火圈的ProcFubenSceneCreated函数
    LuaCallNoclosure(701151, "ProcFubenSceneCreated", varMap)
    end
end
function x701130_ProcFubenSceneCreated( varMap )
    x701130_InitScene(varMap)
end

function x701130_EnterTick(varMap, nowTickCount)
	
   WriteLog(1, "x701130_EnterTick ============== nowTickCount:"..nowTickCount)
   local bossID = GetFubenData_Param(varMap, x701130_CSP_BOSSID  )
   local bossState = GetFubenData_Param(varMap, x701130_CSP_BOSS_STATE )
   local isStopTick = GetFubenData_Param(varMap, x701130_STOP_TICK)
   if ( bossID ~=  -1 and isStopTick == 0 ) then
       if ( bossState == x701130_BOSS_STATE_DIALOG ) then    ------对话状态
       		local ranistalk = random(5)
       	    local talk={
	    	"我是谁！我怎么会出现在这里！",
	    	"这是什么东西围绕着我，头。。。头痛的要裂开了！",
	    	"到底是什么可怕的力量把我带到了这里！",
	    	"啊！我不行了，谁来让我解脱出去！",
		    }
			if ranistalk == 1 then
		    local rantalk = random(getn(talk))
		    NpcTalk(varMap, bossID,talk[rantalk],-1)
		    end
       	    SetFubenData_Param(varMap, x701130_CSP_BOSS_PLAYSTATE, nowTickCount)
            x701130_BossDialog(varMap, nowTickCount)   --对话
       elseif ( bossState == x701130_BOSS_STATE_PLAY ) then   ------表演状态
       		
           x701130_BossPlay(varMap, nowTickCount)      --表演
       elseif ( bossState > x701130_BOSS_STATE_PLAY) then   ----战斗状态
       --添加buff
        if IsHaveSpecificImpact(varMap,BossId,7813) ~= 1 then
	    	SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, 7813, 0)
	    end
	    
       local AIScriptID1 = GetFubenData_Param(varMap, x701130_CSP_AI_1  )
       if AIScriptID1 ~= 0 then
           LuaCallNoclosure(tonumber(AIScriptID1), "EnterTick", varMap, nowTickCount)
       end
       
       local AIScriptID2 = GetFubenData_Param(varMap, x701130_CSP_AI_2  )
       if AIScriptID2~= 0 then
           LuaCallNoclosure(tonumber(AIScriptID2), "EnterTick", varMap, nowTickCount)
       end
       
       local AIScriptID3 = GetFubenData_Param(varMap, x701130_CSP_AI_3  )
       if AIScriptID3 ~= 0 then
           LuaCallNoclosure(tonumber(AIScriptID3), "EnterTick", varMap, nowTickCount)
       end
           local AIScriptID4 = GetFubenData_Param(varMap, x701130_CSP_AI_4  )
           if AIScriptID4 ~= 0 then
               LuaCallNoclosure(tonumber(AIScriptID4), "EnterTick", varMap, nowTickCount)
           end
           
           local AIScriptID5 = GetFubenData_Param(varMap, x701130_CSP_AI_5  )
           if AIScriptID5 ~= 0 then
               LuaCallNoclosure(tonumber(AIScriptID5), "EnterTick", varMap, nowTickCount)
           end
           
       --剧场火圈的心跳
       LuaCallNoclosure(701151, "EnterTick", varMap, nowTickCount)
       end
   end
end

function x701130_BossDialog( varMap, nowTickCount )  --对话

end

function x701130_BossPlay( varMap, nowTickCount )   --表演
	--print(nowTickCount -GetFubenData_Param(varMap, x701130_CSP_BOSS_PLAYSTATE))
	local BossId = GetFubenData_Param(varMap, x701130_CSP_BOSSID  )
	if nowTickCount -GetFubenData_Param(varMap, x701130_CSP_BOSS_PLAYSTATE) == 2 then
		x701130_SetBossState(varMap, x701130_BOSS_STATE_COMBAT )	
		if IsHaveSpecificImpact(varMap,BossId,7815) ~= 1 then
	    	SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, 7815, 0)
	    end
	   if IsHaveSpecificImpact(varMap,BossId,7813) ~= 1 then
	    	SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, 7813, 0)
	    end
	    if IsHaveSpecificImpact(varMap,BossId,7814) == 1 then
	    	CancelSpecificImpact(varMap,BossId,7814)
	    end
	end
end

function x701130_SetBossState(varMap, varState )   --设置boss状态
    SetFubenData_Param(varMap, x701130_CSP_BOSS_STATE, varState)
    if ( varState > x701130_BOSS_STATE_PLAY ) then
        ----改变阵营
        local bossID = GetFubenData_Param(varMap, x701130_CSP_BOSSID  )
        if bossID ~= -1 then
        SetMonsterCamp(varMap, bossID, 21)
        end
   end
end

function x701130_ProcPlayerEnter(varMap, varPlayer)
   --WriteLog(1, "x701130_ProcPlayerEnter ==============================")
   SetFubenData_Param(varMap, x701130_CSP_PLAYERID, varPlayer)
   -----------------------------------------------
   --x701130_InitScene(varMap)
   
   ----增加周进入次数
   local regIndex = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3])
	        
	 LuaCallNoclosure(700081, "SetEnterCount", varMap, varPlayer, regIndex, 0)
end

-----------------------处理死亡逻辑-----------------------------------
function x701130_ProcDie(varMap, varPlayer, varKiller)
    local BossId = GetFubenData_Param(varMap, x701130_CSP_BOSSID)
    local plyerID = GetFubenData_Param(varMap, x701130_CSP_PLAYERID)
    WriteLog(1, "x701130_ProcDie ==============================varPlayer:"..varPlayer.." varKiller:"..varKiller.." BossId:"..BossId)
    
    if BossId == varPlayer then   ---boss挂了
         SetFubenData_Param(varMap, x701130_STOP_TICK, 1)
    
         local diffcult = GetFubenData_Param(varMap, x701130_CSP_DIFFICULTY)   --难度
         local selectLayerIndex = GetFubenData_Param(varMap, x701130_CSP_JINGYING_INDEX  )  --所玩剧场索引
         local typeIndex = 1   ----剧场分类索引(蒙古、金国、中亚。。。)7个
         
         if (diffcult == 1) then
             if mod(selectLayerIndex,3) == 0 then
                 typeIndex = floor(selectLayerIndex/3)
             else
                 typeIndex = floor(selectLayerIndex/3) + 1
             end
         elseif (diffcult == 2) then
             if mod(selectLayerIndex-100,3) == 0 then
                 typeIndex = floor( (selectLayerIndex-100)/3 )
             else
                 typeIndex = floor( (selectLayerIndex-100)/3 ) + 1
             end
         else
             if mod(selectLayerIndex-200,3) == 0 then
                 typeIndex = floor( (selectLayerIndex-200)/3 )
             else
                 typeIndex = floor( (selectLayerIndex-200 )/3 ) + 1
             end
         end
         
         -----给物品奖励-------------------------------------------------------------------------------------------------------
--         StartItemTask(varMap)
--         
--         local randomValue = 1001
--         
--         -----掉落龙鳞----------------------------------------------
--         ItemAppend( varMap, x701130_Drop_1[1], 1 )
--         
--         ---天外焚石掉落概率 * 1000------------------------------------
--         WriteLog(1, "====================diffcult:"..diffcult.." typeIndex:"..typeIndex.."  selectLayerIndex:"..selectLayerIndex)
--         local tianWaiRate = x701130_TianWai_Drop[diffcult][typeIndex]
--         local tianWaiDrop1 = floor(tianWaiRate/1000)  --必掉个数
--         local tianWaiDrop2 = mod(tianWaiRate,1000) --概率掉落个数
--         for i=1,tianWaiDrop1 do
--             --掉落
--             ItemAppend( varMap, 11000715, 1 )
--         end
--         
--         randomValue = random(1, 1000)
--         if tianWaiDrop2 <= randomValue then
--             --掉落
--             ItemAppend( varMap, 11000715, 1 )
--         end
--         
--         --不分难度随机掉一样物品----------------------------------------------
--         local DropLen2 = getn(x701130_Drop_2)
--         randomValue = random(1, DropLen2)
--           --掉落
--         ItemAppend( varMap, x701130_Drop_2[randomValue], 1 )
--         
--         --分难度随机掉一样物品----------------------------------------------
--         local DropLen3 = getn(x701130_Drop_3[diffcult])
--         for i=1, DropLen3 do
--             if x701130_Drop_3[diffcult][i].rate == 100 then
--                 for j=1, x701130_Drop_3[diffcult][i].num do
--                     local itemListLen = getn(x701130_Drop_3[diffcult][i].itemID)
--                     randomValue = random(1, itemListLen)
--                     local item = x701130_Drop_3[diffcult][i].itemID[randomValue]
--                     --掉落
--                     ItemAppend( varMap, item, 1 )
--                 end
--             else
--                 randomValue = random(1, 100)
--                 if (x701130_Drop_3[diffcult][i].rate <= randomValue) then
--                     local itemListLen = getn(x701130_Drop_3[diffcult][i].itemID)
--                     randomValue = random(1, itemListLen)
--                     local item = x701130_Drop_3[diffcult][i].itemID[randomValue]
--                    --掉落
--                    ItemAppend( varMap, item, 1 )
--                 end
--             end
--         end
--         
--        DropItemListToScene(varMap, BossId, 0)
  -----记录通关索引-----
        local jingyingIndex = GetPlayerGameData(varMap, plyerID, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3])
        if (jingyingIndex == 0) then
            jingyingIndex = 1
        end
        
        local saveIndex = jingyingIndex + 1
        if saveIndex > x701130_JUCHANG_COUNT_MAX and saveIndex <  100 then     -----简单剧场索引从1开始， 中等难度剧场索引从101开始， 困难难度索引从201开始
            saveIndex = 101
        elseif saveIndex > x701130_JUCHANG_COUNT_MAX + 100 and saveIndex < 200 then
            saveIndex = 201
        end
        
        local selectLayerIndex = GetFubenData_Param(varMap, x701130_CSP_JINGYING_INDEX  )
        if ( selectLayerIndex == jingyingIndex ) then
            SetPlayerGameData(varMap, plyerID, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3], saveIndex)
        end
        
        ----清除AI--------------
        SetFubenData_Param(varMap, x701130_CSP_AI_1, 0)
        SetFubenData_Param(varMap, x701130_CSP_AI_2, 0)
        SetFubenData_Param(varMap, x701130_CSP_AI_3, 0)
        SetFubenData_Param(varMap, x701130_CSP_AI_4, 0)
        SetFubenData_Param(varMap, x701130_CSP_AI_5, 0)
        
        SetFubenData_Param(varMap, x701130_CSP_BOSSID, -1)
        
        -------调用其它脚本通知函数---------------------
        LuaCallNoclosure(802010, "CMOpenPro", varMap, plyerID)
        ---------------创建NPC传送---------
        x701130_CreateNPC(varMap)  
--        -------------------新服产出-------------------------------------
--	    local tempran = random(2)
--	    if  tempran == 1 then
--	        StartItemTask(varMap)	
--	        ItemAppendBind( varMap, 12271410, 1 )
--	        Msg2Player( varMap, plyerID, "恭喜你获得@item_"..12271410, 8, 3 )	
--	        local ret = StopItemTask(varMap, plyerID)
--	        if (ret <= 0 ) then
--	            Msg2Player( varMap, plyerID, "背包空间不足。", 8, 3 )	
--	            return
--	        end
--	        DeliverItemListSendToPlayer(varMap,plyerID)
--	    end
        ------增加灵力值------使用plyerID而不是varPlayer-------------------------------------------------------------------------
        AddMingWang(varMap, plyerID, x701130_LingLi_Award[diffcult][typeIndex])
        Msg2Player( varMap, plyerID, "击杀被海都控制的灵魂，获取灵力#G"..x701130_LingLi_Award[diffcult][typeIndex].."#cffcf00点", 8, 3 )	
          
        
    end
end

function x701130_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )

end

---------------------------------代刷---------------------------------------------------------
function x701130_DaiShua( varMap, varPlayer, startIndex, endIndex, varFlag )  
    local jingyingIndex = GetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3])
    --代刷临时物品表
    local awardtable = {}
    
    if (jingyingIndex == 0) then
        jingyingIndex = 1
    end
    if (startIndex >= jingyingIndex) then
        Msg2Player( varMap, varPlayer, "您还不能代刷当前剧场。", 8, 3 )	
        return
    end
    
    local diffcult = 1    ---难度
    local typeIndex = 1   ----剧场分类索引(蒙古、金国、中亚。。。)7个
    if (startIndex < 100) then
        diffcult = 1
        if mod(startIndex,3) == 0 then
            typeIndex = floor(startIndex/3)
        else
            typeIndex = floor(startIndex/3) + 1
        end
    elseif (startIndex > 100 and startIndex < 200) then
        diffcult = 2
        if mod(startIndex-100,3) == 0 then
            typeIndex = floor( (startIndex-100)/3 )
        else
            typeIndex = floor( (startIndex-100)/3 ) + 1
        end
    else
        diffcult = 3
        if mod(startIndex-200,3) == 0 then
            typeIndex = floor( (startIndex-200)/3 )
        else
            typeIndex = floor( (startIndex-200)/3 ) + 1
        end
    end
    
    
    ----------------检查周进入次数 15-----------------------
    local regIndex = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3])
    local enterCount = LuaCallNoclosure(700081, "GetEnterCount", varMap, varPlayer, regIndex)
    if enterCount >= x701130_ENTER_COUNT_MAX then
        Msg2Player( varMap, varPlayer, "超过本周最大可玩次数。", 8, 3 )	
        return
    end
    
   -------------检查现金可用数------------------------------
   if ( GetMoney(varMap, varPlayer, 2) < x701130_DaiShua_Cost[startIndex].cost*1000 ) then
        Msg2Player( varMap, varPlayer, "您的现金不足。", 8, 3 )	
        return
   end
   		local stritem = ""
    -------------给物品奖励--------------------------------------------------------------------------------------------
         --StartItemTask(varMap)
         
         local randomValue = 1001
         
         -----掉落龙鳞----------------------------------------------
         local index1 = getn(awardtable)+1
         awardtable[index1]={}
         awardtable[index1].item = x701130_Drop_1[1]
         awardtable[index1].count = 1
         GamePlayScriptLog( varMap, varPlayer, 11274)    
         print("aaaaaaaaaa=============="..awardtable[index1].item,index1)
         ---掉落天外焚石掉落概率 * 1000--------------------------------------
         WriteLog(1, "daishua====================diffcult:"..diffcult.." typeIndex:"..typeIndex.."  startIndex:"..startIndex)
         local tianWaiRate = x701130_TianWai_Drop[diffcult][typeIndex]
         local tianWaiDrop1 = floor(tianWaiRate/1000)  --必掉个数
         local tianWaiDrop2 = mod(tianWaiRate,1000) --概率掉落个数
         local index2 = getn(awardtable)+1
         awardtable[index2]={}
         for i=1,tianWaiDrop1 do
         	awardtable[index2].item = 11000715
         	awardtable[index2].count = 1
         	GamePlayScriptLog( varMap, varPlayer, 11273)
         	
         end
         randomValue = random(1, 1000)
         if tianWaiDrop2 <= randomValue then
         	if awardtable[index2].item ~=nil then
         		awardtable[index2].count = awardtable[index2].count+1
         	else
         	    awardtable[index2].item = 11000715
         		awardtable[index2].count = 1	
         	end
         	GamePlayScriptLog( varMap, varPlayer, 11273)
         end
             
         --不分难度随机掉一样物品----------------------------------------------
         local DropLen2 = getn(x701130_Drop_2)
         randomValue = random(1, DropLen2)
         local index3 = getn(awardtable)+1
         awardtable[index3]={}
         awardtable[index3].item = x701130_Drop_2[randomValue]
         awardtable[index3].count = 1
         GamePlayScriptLog( varMap, varPlayer, 11272)    
		
    	 ---------------新服产出矿石-----------------------------------------------
		 local tempran = random(2)
		 if tempran == 1 then
			 local index4 = getn(awardtable)+1
			 awardtable[index4]={}
	         awardtable[index4].item = 12271410
	         awardtable[index4].count = 1
			 GamePlayScriptLog( varMap, varPlayer, 11270)    
		 end

         --分难度随机掉卡牌----------------------------------------------
         local DropLen3 = getn(x701130_Drop_3[diffcult])
         for i=1, DropLen3 do
             if x701130_Drop_3[diffcult][i].rate == 100 then
                 for j=1, x701130_Drop_3[diffcult][i].num do
                     local itemListLen = getn(x701130_Drop_3[diffcult][i].itemID)
                     randomValue = random(1, itemListLen)
                     local item = x701130_Drop_3[diffcult][i].itemID[randomValue]
                     local index5 = getn(awardtable)+1
                     awardtable[index5]={}
			         awardtable[index5].item = item
			         awardtable[index5].count = 1
			         awardtable[index5].quality = x701130_Drop_3[diffcult][i].quality
			         GamePlayScriptLog( varMap, varPlayer, 11271)    
                 end
             else
                 randomValue = random(1, 100)
                 if (x701130_Drop_3[diffcult][i].rate <= randomValue) then
                     local itemListLen = getn(x701130_Drop_3[diffcult][i].itemID)
                     randomValue = random(1, itemListLen)
                     local item = x701130_Drop_3[diffcult][i].itemID[randomValue]
                     local index5 = getn(awardtable)+1
                     awardtable[index5]={}
			         awardtable[index5].item = item
			         awardtable[index5].count = 1
			         awardtable[index5].quality = x701130_Drop_3[diffcult][i].quality
			         GamePlayScriptLog( varMap, varPlayer, 11271)    
                 end
             end
         end  
	 
         --给玩家添加物品	 
	local tabItemID = {};
	local tabItemNum = {};
	local nCount = 0;

	for k,v in awardtable do
		if v.item ~= nil then
			tabItemID[nCount] = v.item;
			tabItemNum[nCount] = v.count;
			nCount = nCount + 1;		
		 end
	end	

	-- 给东西
	for i = 1, nCount do 
	
		StartItemTask(varMap)	
		ItemAppend( varMap, tabItemID[i-1], tabItemNum[i-1] )
		-- 最后一个的时候给个标记
		if i == nCount then 
					
			local ret = StopItemTask(varMap, varPlayer)
			if (ret <= 0 ) then
					
				Msg2Player( varMap, varPlayer, "背包空间不足。", 8, 3 )
				ShowFutuUI( varMap, varPlayer, 4, tabItemID[i-1], tabItemNum[i-1], 1, 1 )
			else
					
				DeliverItemListSendToPlayer(varMap,varPlayer)
				ShowFutuUI( varMap, varPlayer, 4, tabItemID[i-1], tabItemNum[i-1], 0, 1 )
			end					
		else

			local ret = StopItemTask(varMap, varPlayer)
			if (ret <= 0 ) then
					
				Msg2Player( varMap, varPlayer, "背包空间不足。", 8, 3 )
				ShowFutuUI( varMap, varPlayer, 4, tabItemID[i-1], tabItemNum[i-1], 1, 0 )
			else
					
				DeliverItemListSendToPlayer(varMap,varPlayer)
				ShowFutuUI( varMap, varPlayer, 4, tabItemID[i-1], tabItemNum[i-1], 0, 0 )
			end


		end		

	end				 

    -------------增加经验---------------------
    AddExp(varMap,varPlayer,x701130_DaiShua_Cost[startIndex].exp)
    
    -------------增加灵力值---------------------------------
    AddMingWang(varMap, varPlayer, x701130_LingLi_Award[diffcult][typeIndex])
    Msg2Player( varMap, varPlayer, "恭喜您获取灵力#G"..x701130_LingLi_Award[diffcult][typeIndex].."#cffcf00点", 8, 3 )	
    -----------消耗现金------------------------------------------------------
    CostMoney(varMap, varPlayer, 2, x701130_DaiShua_Cost[startIndex].cost*1000)
    ----------------周进入次数增加-------------------------------
    LuaCallNoclosure(700081, "SetEnterCount", varMap, varPlayer, regIndex, 0)
    GamePlayScriptLog( varMap, varPlayer, 11100)    
    Msg2Player( varMap, varPlayer, "完成代刷精英剧场！", 8, 3 )	
end

-------------------------------------------------------------------------

function x701130_CreateNPC( varMap )
	local playerID = GetFubenData_Param(varMap, x701130_CSP_PLAYERID)  -----玩家id
    local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID) ---玩家坐标
    
	  for i, npc in x701130_var_NPC do
		    local ret = CreateMonster(varMap, npc.type, nPlayerX+random(3), nPlayerZ+random(3), 3, -1, -1, npc.guid, 20, -1, npc.facedir, npc.name, npc.title, -1)
		    if ret == -1 then
		        WriteLog(1, "x701130_CreateNPC  ERR ==============")
		        
		    end
    end
end

function x701130_CreateBoss( varMap )
    local playerPosIndex = GetFubenData_Param(varMap, x701130_CSP_ENTER_POS_INDEX  )
    local jingyingIndex = GetFubenData_Param(varMap, x701130_CSP_JINGYING_INDEX  )
    local AINum = GetFubenData_Param(varMap, x701130_CSP_AI_NUM  )
    
    local bossType = x701130_var_boss[jingyingIndex].type
    local x = x701130_var_boss_pos[bossType][playerPosIndex].x
    local z = x701130_var_boss_pos[bossType][playerPosIndex].z
    SetFubenData_Param(varMap, x701130_CSP_BOSS_X, x)
    SetFubenData_Param(varMap, x701130_CSP_BOSS_Z, z)
    local diffcult = GetFubenData_Param(varMap, x701130_CSP_DIFFICULTY)
    --print("diffcult=="..diffcult)
    local aiLen = getn(x701130_var_AI[diffcult])
    --print(aiLen)
    local tmpList = {}
    local i = 0
    while i < AINum do
        local pos = random(1, aiLen)
        local bfind = 0
        --local tmpLen = getn(tmpList)
        --for j=1, tmpLen do
            --if (pos == tmpList[j]) then
                --bfind = 1
            --end    
        --end
        for k, value in tmpList do
            if tonumber(pos) == tonumber(value) then
                bfind = 1
            end    
        end
        
        if (0 == bfind) then
            i = i + 1
            tmpList[i] = pos
        end
    end
    
    if getn(tmpList) < AINum then
        WriteLog(1, "x701130_CreateBoss get AI ERR ==============")
        return
    end
    
    local title = ""
    for j = 1, AINum do
        local aiPos = tmpList[j]
        local aiScriptID = x701130_var_AI[diffcult][aiPos]
        --print(aiScriptID,aiPos,diffcult)
        title = title..x701130_var_boss_title[aiScriptID].name
        
        if 1 == j then
            SetFubenData_Param(varMap, x701130_CSP_AI_1, aiScriptID)
        elseif 2 == j then
            SetFubenData_Param(varMap, x701130_CSP_AI_2, aiScriptID)
        elseif 3 == j then
            SetFubenData_Param(varMap, x701130_CSP_AI_3, aiScriptID)
        elseif 4 == j then
            SetFubenData_Param(varMap, x701130_CSP_AI_4, aiScriptID)
        elseif 5 == j then
            SetFubenData_Param(varMap, x701130_CSP_AI_5, aiScriptID)
        end
    end
    
    --WriteLog(1, "x701130_CreateBoss  ==============title:"..title.." AINum:"..AINum.." listLen"..getn(tmpList))
    
    local ret = CreateMonster(varMap, bossType, x, z, x701130_var_boss[jingyingIndex].AI, x701130_var_boss[jingyingIndex].AIScript, x701130_var_FileId, 550002, 20, -1, x701130_var_boss[jingyingIndex].facedir, x701130_var_boss[jingyingIndex].name, title, -1)
    if ret == -1 then
        WriteLog(1, "x701130_CreateBoss ERR ==============")
        return
    end
    WriteLog(1, "x701130_CreateBoss ok ==============ret:"..ret)
    SetFubenData_Param(varMap, x701130_CSP_BOSSID, ret)
    SetFubenData_Param(varMap, x701130_CSP_BOSS_TYPE, x701130_var_fenshen_BOSS[jingyingIndex])
    
	if IsHaveSpecificImpact(varMap,ret,7814) ~= 1 then
    	SendSpecificImpactToUnit( varMap, ret, ret, ret, 7814, 0)
    end
    
    
end

function x701130_isWordIDFind()
      --SetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3], 12) 
      ---过滤world的服务器
      local worldID = GetWorldIdEx()
      local worldList = getn(x701130_var_OpenJingYingFuben_World_Tab)
      local bFind = 1
      
      if (worldList < 1 ) then
          bFind = 0
      else
          for k, v in x700081_var_OpenJingYingFuben_World_Tab do
              if (v == worldID) then
                  bFind = 0
                  break
              end
          end
      end          
      return bFind
end
