--春节活动之天降年兽

x310802_g_ScriptId = 310802;
x310802_g_GameOpenId = 1075;
x310802_g_ValidScene = { 36, 37, 38 , 50, 150, 250, 350, 51, 151, 251, 351, 58, 158 , 258, 358, 86, 186, 286, 386};			--有效场景


--年兽配置表， 第一行配置年兽，第二行配置年兽王
x310802_g_MonsterInfo = {
													{ id = 11003, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽
													{ id = 11004, baseAI = 1, highAI = 975, campId = 21, liveTime = 30 * 60 * 1000, name = "", title = "", dir = 0 }, --年兽王											
												}																	
																
--年兽生成配置表， monsterIndex为在x310802_g_MonsterInfo表格中的索引
x310802_g_CreateMonsterConfigTb = {

			--大都南
			{sceneId=36, pos={ {posX= 82,posZ=206,monsterIndex=1}, {posX=156,posZ=233,monsterIndex=1}, 
												 {posX=156,posZ=233,monsterIndex=1}, {posX=199,posZ=226,monsterIndex=1},
												 {posX=145,posZ=179,monsterIndex=1}, {posX=42 ,posZ=186,monsterIndex=1}, 
												 {posX= 26,posZ=221,monsterIndex=1}, {posX=120,posZ=226,monsterIndex=1},
												 {posX=166,posZ=150,monsterIndex=1}, {posX=27 ,posZ=108,monsterIndex=1}, 
												 {posX= 67,posZ=146,monsterIndex=1}, {posX=34 ,posZ=157,monsterIndex=1},
												 {posX= 57,posZ=232,monsterIndex=1}, {posX=159,posZ=203,monsterIndex=1}, 
												 {posX=120,posZ=156,monsterIndex=1}, {posX=235,posZ=95 ,monsterIndex=1},
												 {posX=228,posZ=158,monsterIndex=1}, {posX=88 ,posZ=169,monsterIndex=1},
												 {posX=119,posZ=192,monsterIndex=1}, {posX=190,posZ=208,monsterIndex=1},
												 {posX=215,posZ=75 ,monsterIndex=1}, {posX=229,posZ=188,monsterIndex=1},
												 {posX=231,posZ=128,monsterIndex=1}, {posX=190,posZ=165,monsterIndex=1},
												 {posX=170,posZ=187,monsterIndex=1}, {posX=236,posZ=210,monsterIndex=1}
											 }	
			},
			
			--大都东
			{sceneId=37, pos={ {posX=143,posZ=46 ,monsterIndex=1}, {posX=120,posZ=33 ,monsterIndex=1},   
												 {posX=76 ,posZ=45 ,monsterIndex=1}, {posX=122,posZ=91 ,monsterIndex=1},
												 {posX=122,posZ=154,monsterIndex=1}, {posX=172,posZ=138,monsterIndex=1},
												 {posX=183,posZ=169,monsterIndex=1}, {posX=218,posZ=223,monsterIndex=1},
												 {posX=232,posZ=197,monsterIndex=1}, {posX=214,posZ=178,monsterIndex=1},
												 {posX=232,posZ=122,monsterIndex=1}, {posX=187,posZ=84 ,monsterIndex=1},
												 {posX=216,posZ=70 ,monsterIndex=1}, {posX=211,posZ=108,monsterIndex=1},
												 {posX=193,posZ=125,monsterIndex=1}, {posX=220,posZ=145,monsterIndex=1},
												 {posX=87 ,posZ=111,monsterIndex=1}, {posX=99 ,posZ=70 ,monsterIndex=1},
												 {posX=118,posZ=236,monsterIndex=1}, {posX=33 ,posZ=176,monsterIndex=1},
												 {posX=98 ,posZ=241,monsterIndex=1}, {posX=52 ,posZ=195,monsterIndex=1},
												 {posX=147,posZ=119,monsterIndex=1}, {posX=64 ,posZ=121,monsterIndex=1},
												 {posX=33 ,posZ=105,monsterIndex=1}, {posX=69 ,posZ=165,monsterIndex=1},
												 {posX=122,posZ=199,monsterIndex=1}, {posX=96 ,posZ=205,monsterIndex=1},
												 {posX=156,posZ=159,monsterIndex=1}, {posX=158,posZ=216,monsterIndex=1}
											 }
			
			},
			
			--大都西
			{sceneId=38, pos={ {posX=136,posZ=102,monsterIndex=1},{posX=144,posZ=201,monsterIndex=1}, 
												 {posX=54 ,posZ=230,monsterIndex=1},{posX=188,posZ=183,monsterIndex=1}, 
												 {posX=209,posZ=128,monsterIndex=1},{posX=95 ,posZ=228,monsterIndex=1}, 
												 {posX=90 ,posZ=108,monsterIndex=1},{posX=81 ,posZ=156,monsterIndex=1}, 
												 {posX=139,posZ=32 ,monsterIndex=1},{posX=121,posZ=174,monsterIndex=1}, 
												 {posX=161,posZ=218,monsterIndex=1},{posX=206,posZ=168,monsterIndex=1}, 
												 {posX=29 ,posZ=32 ,monsterIndex=1},{posX=29 ,posZ=206,monsterIndex=1}, 
												 {posX=42 ,posZ=63 ,monsterIndex=1},{posX=63 ,posZ=137,monsterIndex=1}, 
												 {posX=25 ,posZ=170,monsterIndex=1},{posX=28 ,posZ=91 ,monsterIndex=1}, 
												 {posX=46 ,posZ=120,monsterIndex=1},{posX=104,posZ=22 ,monsterIndex=1}, 
												 {posX=67 ,posZ=39 ,monsterIndex=1},{posX=182,posZ=39 ,monsterIndex=1}, 
												 {posX=98 ,posZ=197,monsterIndex=1},{posX=153,posZ=64 ,monsterIndex=1}, 
												 {posX=103,posZ=139,monsterIndex=1},{posX=113,posZ=76 ,monsterIndex=1}, 
												 {posX=228,posZ=181,monsterIndex=1},{posX=161,posZ=158,monsterIndex=1}, 
												 {posX=227,posZ=116,monsterIndex=1},{posX=186,posZ=110,monsterIndex=1}
											 }												 
											 },
			--楼兰王城
			{sceneId=50, pos={ {posX=59 ,posZ=31 ,monsterIndex=1},{posX=186,posZ=175,monsterIndex=1}, 
												 {posX=71 ,posZ=40 ,monsterIndex=1},{posX=178,posZ=195,monsterIndex=1}, 
												 {posX=67 ,posZ=55 ,monsterIndex=1},{posX=166,posZ=180,monsterIndex=1}, 
												 {posX=59 ,posZ=66 ,monsterIndex=1},{posX=143,posZ=178,monsterIndex=1}, 
												 {posX=90 ,posZ=69 ,monsterIndex=1},{posX=113,posZ=177,monsterIndex=1}, 
												 {posX=113,posZ=76 ,monsterIndex=1},{posX=114,posZ=157,monsterIndex=1}, 
												 {posX=110,posZ=32 ,monsterIndex=1},{posX=142,posZ=162,monsterIndex=1}, 
												 {posX=145,posZ=34 ,monsterIndex=1},{posX=81 ,posZ=192,monsterIndex=1}, 
												 {posX=128,posZ=78 ,monsterIndex=1},{posX=66 ,posZ=181,monsterIndex=1}, 
												 {posX=174,posZ=74 ,monsterIndex=1},{posX=72 ,posZ=160,monsterIndex=1}, 
												 {posX=201,posZ=70 ,monsterIndex=1},{posX=67 ,posZ=132,monsterIndex=1}, 
												 {posX=180,posZ=37 ,monsterIndex=1},{posX=66 ,posZ=105,monsterIndex=1}, 
												 {posX=194,posZ=36 ,monsterIndex=1},{posX=19 ,posZ=140,monsterIndex=1}, 
												 {posX=187,posZ=98 ,monsterIndex=1},{posX=244,posZ=139,monsterIndex=1}, 
												 {posX=187,posZ=157,monsterIndex=1},{posX=157,posZ=135,monsterIndex=1}
											 }												 
			},
			--天山王城
			{sceneId=150, pos={{posX=67 ,posZ=40 ,monsterIndex=1},{posX=170,posZ=180,monsterIndex=1}, 
												 {posX=67 ,posZ=57 ,monsterIndex=1},{posX=187,posZ=189,monsterIndex=1}, 
												 {posX=67 ,posZ=79 ,monsterIndex=1},{posX=185,posZ=170,monsterIndex=1}, 
												 {posX=97 ,posZ=71 ,monsterIndex=1},{posX=193,posZ=139,monsterIndex=1}, 
												 {posX=61 ,posZ=100,monsterIndex=1},{posX=192,posZ=115,monsterIndex=1}, 
												 {posX=19 ,posZ=95 ,monsterIndex=1},{posX=236,posZ=140,monsterIndex=1}, 
												 {posX=16 ,posZ=140,monsterIndex=1},{posX=241,posZ=98 ,monsterIndex=1}, 
												 {posX=67 ,posZ=131,monsterIndex=1},{posX=197,posZ=105,monsterIndex=1}, 
												 {posX=62 ,posZ=166,monsterIndex=1},{posX=157,posZ=104,monsterIndex=1}, 
												 {posX=77 ,posZ=186,monsterIndex=1},{posX=98 ,posZ=111,monsterIndex=1}, 
												 {posX=133,posZ=175,monsterIndex=1},{posX=167,posZ=74 ,monsterIndex=1}, 
												 {posX=133,posZ=158,monsterIndex=1},{posX=186,posZ=73 ,monsterIndex=1}, 
												 {posX=139,posZ=163,monsterIndex=1},{posX=179,posZ=43 ,monsterIndex=1}, 
												 {posX=142,posZ=178,monsterIndex=1},{posX=196,posZ=44 ,monsterIndex=1}, 
												 {posX=127,posZ=100,monsterIndex=1},{posX=128,posZ=79 ,monsterIndex=1}
											 }												 
			},
			--昆仑王城
			{sceneId=250, pos={{posX=80 ,posZ=61 ,monsterIndex=1},{posX=96 ,posZ=23 ,monsterIndex=1}, 
												 {posX=61 ,posZ=71 ,monsterIndex=1},{posX=172,posZ=68 ,monsterIndex=1}, 
												 {posX=79 ,posZ=87 ,monsterIndex=1},{posX=194,posZ=86 ,monsterIndex=1}, 
												 {posX=58 ,posZ=110,monsterIndex=1},{posX=172,posZ=90 ,monsterIndex=1}, 
												 {posX=17 ,posZ=117,monsterIndex=1},{posX=192,posZ=124,monsterIndex=1}, 
												 {posX=20 ,posZ=162,monsterIndex=1},{posX=188,posZ=151,monsterIndex=1}, 
												 {posX=64 ,posZ=161,monsterIndex=1},{posX=238,posZ=158,monsterIndex=1}, 
												 {posX=98 ,posZ=149,monsterIndex=1},{posX=234,posZ=114,monsterIndex=1}, 
												 {posX=100,posZ=120,monsterIndex=1},{posX=189,posZ=213,monsterIndex=1}, 
												 {posX=76 ,posZ=115,monsterIndex=1},{posX=188,posZ=184,monsterIndex=1}, 
												 {posX=116,posZ=99 ,monsterIndex=1},{posX=128,posZ=172,monsterIndex=1}, 
												 {posX=119,posZ=75 ,monsterIndex=1},{posX=102,posZ=210,monsterIndex=1}, 
												 {posX=134,posZ=73 ,monsterIndex=1},{posX=73 ,posZ=217,monsterIndex=1}, 
												 {posX=140,posZ=95 ,monsterIndex=1},{posX=145,posZ=217,monsterIndex=1}, 
												 {posX=158,posZ=26 ,monsterIndex=1},{posX=104,posZ=186,monsterIndex=1}
											 }												 
			},			
			--敦煌王城
			{sceneId=350, pos={{posX=62 ,posZ=65 ,monsterIndex=1},{posX=195,posZ=118,monsterIndex=1}, 
												 {posX=76 ,posZ=71 ,monsterIndex=1},{posX=195,posZ=90 ,monsterIndex=1}, 
												 {posX=67 ,posZ=90 ,monsterIndex=1},{posX=198,posZ=61 ,monsterIndex=1}, 
												 {posX=52 ,posZ=117,monsterIndex=1},{posX=169,posZ=77 ,monsterIndex=1}, 
												 {posX=71 ,posZ=126,monsterIndex=1},{posX=137,posZ=71 ,monsterIndex=1}, 
												 {posX=79 ,posZ=157,monsterIndex=1},{posX=139,posZ=97 ,monsterIndex=1}, 
												 {posX=57 ,posZ=152,monsterIndex=1},{posX=116,posZ=97 ,monsterIndex=1}, 
												 {posX=67 ,posZ=177,monsterIndex=1},{posX=117,posZ=70 ,monsterIndex=1}, 
												 {posX=53 ,posZ=216,monsterIndex=1},{posX=158,posZ=25 ,monsterIndex=1}, 
												 {posX=74 ,posZ=216,monsterIndex=1},{posX=98 ,posZ=24 ,monsterIndex=1}, 
												 {posX=105,posZ=151,monsterIndex=1},{posX=127,posZ=181,monsterIndex=1}, 
												 {posX=103,posZ=125,monsterIndex=1},{posX=108,posZ=187,monsterIndex=1}, 
												 {posX=153,posZ=122,monsterIndex=1},{posX=160,posZ=181,monsterIndex=1}, 
												 {posX=157,posZ=151,monsterIndex=1},{posX=189,posZ=187,monsterIndex=1}, 
												 {posX=189,posZ=150,monsterIndex=1},{posX=187,posZ=218,monsterIndex=1}
											 }												 
			},	
			--楼兰边塞
			{sceneId=51, pos={ {posX=60 ,posZ=73 ,monsterIndex=1},{posX=115,posZ=109,monsterIndex=1}, 
												 {posX=33 ,posZ=74 ,monsterIndex=1},{posX=154,posZ=134,monsterIndex=1}, 
												 {posX=45 ,posZ=97 ,monsterIndex=1},{posX=185,posZ=150,monsterIndex=1}, 
												 {posX=41 ,posZ=118,monsterIndex=1},{posX=210,posZ=133,monsterIndex=1}, 
												 {posX=42 ,posZ=139,monsterIndex=1},{posX=219,posZ=138,monsterIndex=1}, 
												 {posX=70 ,posZ=45 ,monsterIndex=1},{posX=210,posZ=186,monsterIndex=1}, 
												 {posX=111,posZ=36 ,monsterIndex=1},{posX=190,posZ=200,monsterIndex=1}, 
												 {posX=151,posZ=44 ,monsterIndex=1},{posX=165,posZ=219,monsterIndex=1}, 
												 {posX=174,posZ=37 ,monsterIndex=1},{posX=146,posZ=212,monsterIndex=1}, 
												 {posX=167,posZ=66 ,monsterIndex=1},{posX=170,posZ=176,monsterIndex=1}, 
												 {posX=203,posZ=84 ,monsterIndex=1},{posX=80 ,posZ=175,monsterIndex=1}, 
												 {posX=185,posZ=63 ,monsterIndex=1},{posX=95 ,posZ=187,monsterIndex=1}, 
												 {posX=222,posZ=42 ,monsterIndex=1},{posX=97 ,posZ=207,monsterIndex=1}, 
												 {posX=124,posZ=68 ,monsterIndex=1},{posX=51 ,posZ=197,monsterIndex=1}, 
												 {posX=118,posZ=94 ,monsterIndex=1},{posX=48 ,posZ=216,monsterIndex=1}
											 }												 
			},		
			--天山边塞
			{sceneId=151, pos={{posX=206,posZ=20 ,monsterIndex=1},{posX=58 ,posZ=59 ,monsterIndex=1}, 
												 {posX=198,posZ=69 ,monsterIndex=1},{posX=67 ,posZ=152,monsterIndex=1}, 
												 {posX=224,posZ=63 ,monsterIndex=1},{posX=39 ,posZ=155,monsterIndex=1}, 
												 {posX=207,posZ=94 ,monsterIndex=1},{posX=94 ,posZ=182,monsterIndex=1}, 
												 {posX=214,posZ=119,monsterIndex=1},{posX=63 ,posZ=201,monsterIndex=1}, 
												 {posX=203,posZ=147,monsterIndex=1},{posX=33 ,posZ=217,monsterIndex=1}, 
												 {posX=175,posZ=141,monsterIndex=1},{posX=33 ,posZ=191,monsterIndex=1}, 
												 {posX=175,posZ=96 ,monsterIndex=1},{posX=111,posZ=217,monsterIndex=1}, 
												 {posX=142,posZ=101,monsterIndex=1},{posX=164,posZ=216,monsterIndex=1}, 
												 {posX=109,posZ=111,monsterIndex=1},{posX=158,posZ=192,monsterIndex=1}, 
												 {posX=143,posZ=42 ,monsterIndex=1},{posX=205,posZ=189,monsterIndex=1}, 
												 {posX=127,posZ=69 ,monsterIndex=1},{posX=213,posZ=210,monsterIndex=1}, 
												 {posX=102,posZ=43 ,monsterIndex=1},{posX=157,posZ=121,monsterIndex=1}, 
												 {posX=70 ,posZ=36 ,monsterIndex=1},{posX=142,posZ=141,monsterIndex=1}, 
												 {posX=49 ,posZ=91 ,monsterIndex=1},{posX=115,posZ=135,monsterIndex=1}
											 }												 
			},	
			--昆仑边塞
			{sceneId=251, pos={{posX=49 ,posZ=192,monsterIndex=1},{posX=76 ,posZ=51 ,monsterIndex=1}, 
												 {posX=57 ,posZ=177,monsterIndex=1},{posX=52 ,posZ=45 ,monsterIndex=1}, 
												 {posX=56 ,posZ=152,monsterIndex=1},{posX=98 ,posZ=40 ,monsterIndex=1}, 
												 {posX=45 ,posZ=137,monsterIndex=1},{posX=124,posZ=43 ,monsterIndex=1}, 
												 {posX=46 ,posZ=103,monsterIndex=1},{posX=128,posZ=62 ,monsterIndex=1}, 
												 {posX=65 ,posZ=122,monsterIndex=1},{posX=197,posZ=96 ,monsterIndex=1}, 
												 {posX=84 ,posZ=99 ,monsterIndex=1},{posX=213,posZ=103,monsterIndex=1}, 
												 {posX=83 ,posZ=142,monsterIndex=1},{posX=214,posZ=64 ,monsterIndex=1}, 
												 {posX=114,posZ=144,monsterIndex=1},{posX=221,posZ=42 ,monsterIndex=1}, 
												 {posX=133,posZ=100,monsterIndex=1},{posX=189,posZ=48 ,monsterIndex=1}, 
												 {posX=150,posZ=94 ,monsterIndex=1},{posX=172,posZ=37 ,monsterIndex=1}, 
												 {posX=151,posZ=147,monsterIndex=1},{posX=147,posZ=41 ,monsterIndex=1}, 
												 {posX=99 ,posZ=121,monsterIndex=1},{posX=150,posZ=195,monsterIndex=1}, 
												 {posX=68 ,posZ=70 ,monsterIndex=1},{posX=178,posZ=190,monsterIndex=1}, 
												 {posX=89 ,posZ=69 ,monsterIndex=1},{posX=203,posZ=218,monsterIndex=1}
											 }												 
			},			
			--敦煌边塞
			{sceneId=351, pos={{posX=225,posZ=200,monsterIndex=1},{posX=153,posZ=184,monsterIndex=1}, 
												 {posX=209,posZ=181,monsterIndex=1},{posX=126,posZ=184,monsterIndex=1}, 
												 {posX=204,posZ=148,monsterIndex=1},{posX=98 ,posZ=188,monsterIndex=1}, 
												 {posX=222,posZ=128,monsterIndex=1},{posX=69 ,posZ=217,monsterIndex=1}, 
												 {posX=211,posZ=102,monsterIndex=1},{posX=41 ,posZ=196,monsterIndex=1}, 
												 {posX=186,posZ=123,monsterIndex=1},{posX=62 ,posZ=167,monsterIndex=1}, 
												 {posX=173,posZ=144,monsterIndex=1},{posX=46 ,posZ=146,monsterIndex=1}, 
												 {posX=172,posZ=101,monsterIndex=1},{posX=161,posZ=218,monsterIndex=1}, 
												 {posX=155,posZ=120,monsterIndex=1},{posX=185,posZ=207,monsterIndex=1}, 
												 {posX=143,posZ=100,monsterIndex=1},{posX=220,posZ=36 ,monsterIndex=1}, 
												 {posX=117,posZ=101,monsterIndex=1},{posX=194,posZ=55 ,monsterIndex=1}, 
												 {posX=98 ,posZ=122,monsterIndex=1},{posX=173,posZ=41 ,monsterIndex=1}, 
												 {posX=97 ,posZ=141,monsterIndex=1},{posX=69 ,posZ=41 ,monsterIndex=1}, 
												 {posX=116,posZ=144,monsterIndex=1},{posX=36 ,posZ=33 ,monsterIndex=1}, 
												 {posX=142,posZ=148,monsterIndex=1},{posX=36 ,posZ=62 ,monsterIndex=1}
											 }												 
			},									
			--楼兰外城
			{sceneId=58, pos={ {posX=162,posZ=29 ,monsterIndex=1},{posX=47 ,posZ=167,monsterIndex=1}, 
												 {posX=185,posZ=28 ,monsterIndex=1},{posX=100,posZ=156,monsterIndex=1}, 
												 {posX=185,posZ=57 ,monsterIndex=1},{posX=36 ,posZ=129,monsterIndex=1}, 
												 {posX=167,posZ=66 ,monsterIndex=1},{posX=38 ,posZ=104,monsterIndex=1}, 
												 {posX=170,posZ=86 ,monsterIndex=1},{posX=38 ,posZ=76 ,monsterIndex=1}, 
												 {posX=217,posZ=20 ,monsterIndex=1},{posX=38 ,posZ=55 ,monsterIndex=1}, 
												 {posX=218,posZ=53 ,monsterIndex=1},{posX=41 ,posZ=27 ,monsterIndex=1}, 
												 {posX=219,posZ=88 ,monsterIndex=1},{posX=70 ,posZ=29 ,monsterIndex=1}, 
												 {posX=220,posZ=117,monsterIndex=1},{posX=93 ,posZ=29 ,monsterIndex=1}, 
												 {posX=220,posZ=141,monsterIndex=1},{posX=81 ,posZ=55 ,monsterIndex=1}, 
												 {posX=191,posZ=159,monsterIndex=1},{posX=84 ,posZ=90 ,monsterIndex=1}, 
												 {posX=170,posZ=186,monsterIndex=1},{posX=105,posZ=88 ,monsterIndex=1}, 
												 {posX=157,posZ=145,monsterIndex=1},{posX=111,posZ=62 ,monsterIndex=1}, 
												 {posX=100,posZ=189,monsterIndex=1},{posX=167,posZ=162,monsterIndex=1}, 
												 {posX=62 ,posZ=190,monsterIndex=1},{posX=79 ,posZ=173,monsterIndex=1}
											 }												 
			},									
			--天山外城
			{sceneId=158, pos={{posX=102,posZ=31 ,monsterIndex=1},{posX=150,posZ=138,monsterIndex=1}, 
												 {posX=88 ,posZ=30 ,monsterIndex=1},{posX=139,posZ=175,monsterIndex=1}, 
												 {posX=69 ,posZ=31 ,monsterIndex=1},{posX=165,posZ=188,monsterIndex=1}, 
												 {posX=81 ,posZ=56 ,monsterIndex=1},{posX=200,posZ=182,monsterIndex=1}, 
												 {posX=85 ,posZ=72 ,monsterIndex=1},{posX=214,posZ=158,monsterIndex=1}, 
												 {posX=90 ,posZ=92 ,monsterIndex=1},{posX=218,posZ=105,monsterIndex=1}, 
												 {posX=38 ,posZ=15 ,monsterIndex=1},{posX=216,posZ=72 ,monsterIndex=1}, 
												 {posX=38 ,posZ=67 ,monsterIndex=1},{posX=218,posZ=43 ,monsterIndex=1}, 
												 {posX=38 ,posZ=102,monsterIndex=1},{posX=217,posZ=16 ,monsterIndex=1}, 
												 {posX=44 ,posZ=167,monsterIndex=1},{posX=182,posZ=30 ,monsterIndex=1}, 
												 {posX=72 ,posZ=181,monsterIndex=1},{posX=157,posZ=33 ,monsterIndex=1}, 
												 {posX=90 ,posZ=156,monsterIndex=1},{posX=170,posZ=60 ,monsterIndex=1}, 
												 {posX=100,posZ=178,monsterIndex=1},{posX=173,posZ=87 ,monsterIndex=1}, 
												 {posX=109,posZ=189,monsterIndex=1},{posX=146,posZ=75 ,monsterIndex=1}, 
												 {posX=100,posZ=149,monsterIndex=1},{posX=160,posZ=29 ,monsterIndex=1}
											 }												 
			},
			--昆仑外城
			{sceneId=258, pos={{posX=187,posZ=226,monsterIndex=1},{posX=104,posZ=97 ,monsterIndex=1}, 
												 {posX=161,posZ=224,monsterIndex=1},{posX=102,posZ=78 ,monsterIndex=1}, 
												 {posX=132,posZ=220,monsterIndex=1},{posX=78 ,posZ=64 ,monsterIndex=1}, 
												 {posX=103,posZ=225,monsterIndex=1},{posX=143,posZ=63 ,monsterIndex=1}, 
												 {posX=73 ,posZ=225,monsterIndex=1},{posX=150,posZ=102,monsterIndex=1}, 
												 {posX=37 ,posZ=235,monsterIndex=1},{posX=185,posZ=98 ,monsterIndex=1}, 
												 {posX=222,posZ=226,monsterIndex=1},{posX=187,posZ=66 ,monsterIndex=1}, 
												 {posX=34 ,posZ=198,monsterIndex=1},{posX=212,posZ=66 ,monsterIndex=1}, 
												 {posX=219,posZ=201,monsterIndex=1},{posX=206,posZ=90 ,monsterIndex=1}, 
												 {posX=37 ,posZ=162,monsterIndex=1},{posX=219,posZ=127,monsterIndex=1}, 
												 {posX=217,posZ=156,monsterIndex=1},{posX=36 ,posZ=127,monsterIndex=1}, 
												 {posX=38 ,posZ=106,monsterIndex=1},{posX=36 ,posZ=172,monsterIndex=1}, 
												 {posX=220,posZ=106,monsterIndex=1},{posX=35 ,posZ=217,monsterIndex=1}, 
												 {posX=47 ,posZ=84 ,monsterIndex=1},{posX=214,posZ=233,monsterIndex=1}, 
												 {posX=85 ,posZ=114,monsterIndex=1},{posX=219,posZ=175,monsterIndex=1}
											 }												 
			},			
			--敦煌外城
			{sceneId=358, pos={{posX=185,posZ=226,monsterIndex=1},{posX=220,posZ=116,monsterIndex=1}, 
												 {posX=161,posZ=225,monsterIndex=1},{posX=209,posZ=93 ,monsterIndex=1}, 
												 {posX=130,posZ=220,monsterIndex=1},{posX=210,posZ=66 ,monsterIndex=1}, 
												 {posX=101,posZ=224,monsterIndex=1},{posX=184,posZ=67 ,monsterIndex=1}, 
												 {posX=69 ,posZ=224,monsterIndex=1},{posX=167,posZ=99 ,monsterIndex=1}, 
												 {posX=68 ,posZ=200,monsterIndex=1},{posX=99 ,posZ=119,monsterIndex=1}, 
												 {posX=82 ,posZ=169,monsterIndex=1},{posX=101,posZ=85 ,monsterIndex=1}, 
												 {posX=106,posZ=178,monsterIndex=1},{posX=77 ,posZ=68 ,monsterIndex=1}, 
												 {posX=148,posZ=180,monsterIndex=1},{posX=48 ,posZ=79 ,monsterIndex=1}, 
												 {posX=171,posZ=164,monsterIndex=1},{posX=66 ,posZ=101,monsterIndex=1}, 
												 {posX=181,posZ=196,monsterIndex=1},{posX=38 ,posZ=106,monsterIndex=1}, 
												 {posX=214,posZ=238,monsterIndex=1},{posX=36 ,posZ=149,monsterIndex=1}, 
												 {posX=218,posZ=208,monsterIndex=1},{posX=36 ,posZ=177,monsterIndex=1}, 
												 {posX=216,posZ=186,monsterIndex=1},{posX=36 ,posZ=202,monsterIndex=1}, 
												 {posX=218,posZ=149,monsterIndex=1},{posX=37 ,posZ=235,monsterIndex=1}
											 }												 
			},			
			--楼兰古道
			{sceneId=86, pos={ {posX=147,posZ=44 ,monsterIndex=1},{posX=72 ,posZ=132,monsterIndex=1}, 
												 {posX=170,posZ=42 ,monsterIndex=1},{posX=65 ,posZ=98 ,monsterIndex=1}, 
												 {posX=192,posZ=56 ,monsterIndex=1},{posX=52 ,posZ=63 ,monsterIndex=1}, 
												 {posX=214,posZ=79 ,monsterIndex=1},{posX=53 ,posZ=41 ,monsterIndex=1}, 
												 {posX=191,posZ=97 ,monsterIndex=1},{posX=95 ,posZ=84 ,monsterIndex=1}, 
												 {posX=198,posZ=135,monsterIndex=1},{posX=79 ,posZ=45 ,monsterIndex=1}, 
												 {posX=218,posZ=167,monsterIndex=1},{posX=51 ,posZ=55 ,monsterIndex=1}, 
												 {posX=194,posZ=190,monsterIndex=1},{posX=186,posZ=66 ,monsterIndex=1}, 
												 {posX=165,posZ=206,monsterIndex=1},{posX=189,posZ=188,monsterIndex=1}, 
												 {posX=170,posZ=164,monsterIndex=1},{posX=209,posZ=135,monsterIndex=1}, 
												 {posX=117,posZ=154,monsterIndex=1},{posX=126,posZ=102,monsterIndex=1}, 
												 {posX=94 ,posZ=174,monsterIndex=1},{posX=119,posZ=129,monsterIndex=1}, 
												 {posX=62 ,posZ=199,monsterIndex=1},{posX=141,posZ=126,monsterIndex=1}, 
												 {posX=36 ,posZ=186,monsterIndex=1},{posX=82 ,posZ=201,monsterIndex=1}, 
												 {posX=39 ,posZ=152,monsterIndex=1},{posX=149,posZ=51 ,monsterIndex=1}
											 }												 
			},			
			--天山古道
			{sceneId=186, pos={{posX=61 ,posZ=36 ,monsterIndex=1},{posX=224,posZ=160,monsterIndex=1}, 
												 {posX=30 ,posZ=32 ,monsterIndex=1},{posX=210,posZ=135,monsterIndex=1}, 
												 {posX=30 ,posZ=65 ,monsterIndex=1},{posX=222,posZ=114,monsterIndex=1}, 
												 {posX=55 ,posZ=74 ,monsterIndex=1},{posX=192,posZ=100,monsterIndex=1}, 
												 {posX=34 ,posZ=95 ,monsterIndex=1},{posX=221,posZ=67 ,monsterIndex=1}, 
												 {posX=52 ,posZ=106,monsterIndex=1},{posX=212,posZ=46 ,monsterIndex=1}, 
												 {posX=76 ,posZ=113,monsterIndex=1},{posX=217,posZ=28 ,monsterIndex=1}, 
												 {posX=62 ,posZ=133,monsterIndex=1},{posX=160,posZ=38 ,monsterIndex=1}, 
												 {posX=36 ,posZ=147,monsterIndex=1},{posX=167,posZ=70 ,monsterIndex=1}, 
												 {posX=48 ,posZ=171,monsterIndex=1},{posX=160,posZ=93 ,monsterIndex=1}, 
												 {posX=34 ,posZ=215,monsterIndex=1},{posX=149,posZ=116,monsterIndex=1}, 
												 {posX=61 ,posZ=212,monsterIndex=1},{posX=161,posZ=138,monsterIndex=1}, 
												 {posX=98 ,posZ=195,monsterIndex=1},{posX=164,posZ=165,monsterIndex=1}, 
												 {posX=201,posZ=212,monsterIndex=1},{posX=195,posZ=168,monsterIndex=1}, 
												 {posX=214,posZ=182,monsterIndex=1},{posX=170,posZ=122,monsterIndex=1}
											 }												 
			},	
			--昆仑古道
			{sceneId=286, pos={{posX=153,posZ=208,monsterIndex=1},{posX=100,posZ=209,monsterIndex=1}, 
												 {posX=158,posZ=187,monsterIndex=1},{posX=72 ,posZ=208,monsterIndex=1}, 
												 {posX=180,posZ=212,monsterIndex=1},{posX=41 ,posZ=212,monsterIndex=1}, 
												 {posX=208,posZ=210,monsterIndex=1},{posX=34 ,posZ=187,monsterIndex=1}, 
												 {posX=210,posZ=184,monsterIndex=1},{posX=59 ,posZ=179,monsterIndex=1}, 
												 {posX=179,posZ=176,monsterIndex=1},{posX=92 ,posZ=178,monsterIndex=1}, 
												 {posX=188,posZ=148,monsterIndex=1},{posX=116,posZ=141,monsterIndex=1}, 
												 {posX=208,posZ=134,monsterIndex=1},{posX=120,posZ=115,monsterIndex=1}, 
												 {posX=190,posZ=120,monsterIndex=1},{posX=91 ,posZ=107,monsterIndex=1}, 
												 {posX=215,posZ=91 ,monsterIndex=1},{posX=39 ,posZ=86 ,monsterIndex=1}, 
												 {posX=218,posZ=56 ,monsterIndex=1},{posX=44 ,posZ=118,monsterIndex=1}, 
												 {posX=211,posZ=31 ,monsterIndex=1},{posX=76 ,posZ=88 ,monsterIndex=1}, 
												 {posX=193,posZ=52 ,monsterIndex=1},{posX=67 ,posZ=54 ,monsterIndex=1}, 
												 {posX=170,posZ=67 ,monsterIndex=1},{posX=41 ,posZ=47 ,monsterIndex=1}, 
												 {posX=150,posZ=44 ,monsterIndex=1},{posX=44 ,posZ=30 ,monsterIndex=1}
											 }												 
			},		
			--敦煌古道
			{sceneId=386, pos={{posX=120,posZ=220,monsterIndex=1},{posX=156,posZ=40 ,monsterIndex=1}, 
												 {posX=91 ,posZ=213,monsterIndex=1},{posX=177,posZ=40 ,monsterIndex=1}, 
												 {posX=59 ,posZ=215,monsterIndex=1},{posX=207,posZ=45 ,monsterIndex=1}, 
												 {posX=67 ,posZ=187,monsterIndex=1},{posX=203,posZ=67 ,monsterIndex=1}, 
												 {posX=77 ,posZ=159,monsterIndex=1},{posX=176,posZ=64 ,monsterIndex=1}, 
												 {posX=73 ,posZ=132,monsterIndex=1},{posX=191,posZ=109,monsterIndex=1}, 
												 {posX=42 ,posZ=137,monsterIndex=1},{posX=168,posZ=95 ,monsterIndex=1}, 
												 {posX=42 ,posZ=106,monsterIndex=1},{posX=141,posZ=96 ,monsterIndex=1}, 
												 {posX=63 ,posZ=93 ,monsterIndex=1},{posX=137,posZ=129,monsterIndex=1}, 
												 {posX=81 ,posZ=91 ,monsterIndex=1},{posX=138,posZ=160,monsterIndex=1}, 
												 {posX=83 ,posZ=111,monsterIndex=1},{posX=165,posZ=175,monsterIndex=1}, 
												 {posX=58 ,posZ=63 ,monsterIndex=1},{posX=187,posZ=214,monsterIndex=1}, 
												 {posX=67 ,posZ=42 ,monsterIndex=1},{posX=213,posZ=212,monsterIndex=1}, 
												 {posX=89 ,posZ=42 ,monsterIndex=1},{posX=210,posZ=165,monsterIndex=1}, 
												 {posX=37 ,posZ=43 ,monsterIndex=1},{posX=221,posZ=115,monsterIndex=1}
											 }												 
			},		
	
																									
}

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

x310802_g_MonsterObjId2MonsterId = {};

function x310802_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	
	--检查地图是否匹配
	local mapValid = 0;
	for i, item in x310802_g_ValidScene do
		if SceneId == item then
			mapValid = 1;
			break;
		end
	end
	
	if mapValid == 0 then
		return
	end
	
	--检查活动是否开启
	if x310802_g_GameOpenId > 0 and GetGameOpenById( x310802_g_GameOpenId ) <= 0 then
      return
  end
  
  local tableExist = 0
  for x, y in x310802_g_MonsterObjId2MonsterId do
  		if x == SceneId then
  			tableExist = 1
  			break
  		end
  end
  
  if tableExist == 0 then
  	 x310802_g_MonsterObjId2MonsterId[SceneId] = {}
  end
  
 	--创建年兽
	for i, item in x310802_g_CreateMonsterConfigTb do
		if item.sceneId == SceneId then
			for j, itemDetail in item.pos do
					
				 local objId, guid = CreateMonster( SceneId, 
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].id,
																						 itemDetail.posX,  
																						 itemDetail.posZ,  
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].baseAI,
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].highAI,
																						 x310802_g_ScriptId, 
																						 -1,  
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].campId,  
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].liveTime, 
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].dir,
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].name,
																						 x310802_g_MonsterInfo[ itemDetail.monsterIndex ].title );	 
				
				--记录objId对应的monsterId																	 															
				x310802_g_MonsterObjId2MonsterId[SceneId][objId] =  x310802_g_MonsterInfo[ itemDetail.monsterIndex ].id;
				
			end
		end
	end
end

function x310802_ProcDie( sceneId, selfId, killerId )
	
	if IsObjValid( sceneId,killerId ) ~=1 then
		return
	end
	
	local nKillerType = GetObjType(sceneId, killerId)
	if nKillerType == 1 or nKillerType == 3 then  --是玩家或者召唤兽弄死的，加积分
		local jifenAddition = 1;		
		if x310802_g_MonsterObjId2MonsterId[sceneId][selfId] == x310802_g_MonsterInfo[2].id then --年兽王， 加5分
			jifenAddition = 5					
		end
		SetCountryQuestData( sceneId, 3, CD_HUODONG_XINNIAN, jifenAddition, 1 );		
	end

end

