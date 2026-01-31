x700121_CSP_FUBENTYPE				= 1
x700121_CSP_SCRIPTID				=	1
x700121_CSP_TICKCOUNT				= 2
x700121_CSP_FROMvarMap			= 3
x700121_CSP_ISCLOSING				= 4
x700121_CSP_LEAVECOUNTDOWN	= 5
x700121_CSP_TEAMID					=	6
x700121_CSP_BACKSCENEX      = 7
x700121_CSP_BACKSCENEZ      = 8
x700121_CSP_FUBENLEVEL			=	9

x700121_CSP_KILLCOUNT				=	20
x700121_CSP_FUBEN_SCENE_ID	=	21


x700121_CSP_CURRENTSTEP			=	23
x700121_CSP_CURRENTSTEP_TICKCOUNT	=	24
x700121_CSP_MONSTER_COUNT		=	25
x700121_CSP_BOSS_ID					=	26

x700121_CSP_AREA_ID					=	28
x700121_CSP_AREA_FLAG				=	29

x700121_CSP_BOSS_COMBAT_BEGIN_TIME 	= 30	-- 记录boss进入战斗开始时的秒数
x700121_CSP_BOSS_HP_ACTION_FLAG 		= 31	-- boss血量百分比行为标记 (31 - 40) 预留10个标记


x700121_CSP_ZHANCHE					= 238
x700121_CSP_XIANJINBOSS			=	239


x700121_CSP_HUMAN_COUNT			=	240
x700121_CSP_OBJID_START			=	241
x700121_CSP_NEXT_SCENE			= 247
x700121_CSP_GUID_START      = 248
x700121_CSP_FUBEN_TYPE			=	254	
x700121_CSP_FUBEN_MODE			= 255 

x700121_CSP_LOOPINDEX				= 295


x700121_var_FileId 					= 700121 
x700121_var_QuestId					= 6608


x700121_var_TimeIntervalTab = {1,30,30,30,36,36,36}   
	
x700121_var_Level_Limit = 70
x700121_var_Rate_Limit  = 50

x700121_var_Boos_Time_kuangbao  = 300; -- boss 战斗15分钟后狂暴 时间
x700121_var_Boos_Time_KB_buffid = 32071;  -- boss 战斗15分钟后狂暴buffid
x700121_var_Skill_Use = {
							--使用几率x%,技能id,技能类型0单体1群攻
							{pre=5,		skillID=13700,		skilltype=0}, 
							{pre=2,	  skillID=13701,		skilltype=1}, 
							{pre=93,	skillID=0,		    skilltype=0}, 	
						 }

x700121_var_HP_Step = {0.2,0.5,0.8} 	-- 血量百分之x时触发  由小-》大
x700121_var_HP_Step_Buff1 = 32070;	 	-- buff1 (狂暴)
x700121_var_HP_Step_Buff2 = 13114;	 	-- buff2 (定身)
x700121_var_HP_Step_Buff3 = 13164;	 	-- buff3 (沉默)
x700121_var_HP_Step_Skill = 13702;	 	-- 技能  (群攻)


x700121_var_MonsterZuoBiao = {
															  { 
															  	 --{x=84,y=84},
															  	 {x=84,y=44}--,
															  	 --{x=44,y=44},
															  },
														 }

x700121_var_MonsterType = {	 --num1：近战 num2：远程
														 { level = 1  , exp = 412 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62001,62002} }, bigMonsterNum = 4, bigMonsterType = { {62021,62022} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 2  , exp = 425 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62003,62004} }, bigMonsterNum = 4, bigMonsterType = { {62023,62024} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 3  , exp = 439 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62005,62006} }, bigMonsterNum = 4, bigMonsterType = { {62025,62026} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 4  , exp = 452 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62007,62008} }, bigMonsterNum = 4, bigMonsterType = { {62027,62028} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 5  , exp = 466 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62009,62010} }, bigMonsterNum = 4, bigMonsterType = { {62029,62030} }, bossMonsterNum = 1, bossMonsterType = {62041}, },
														 { level = 6  , exp = 479 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62011,62012} }, bigMonsterNum = 4, bigMonsterType = { {62031,62032} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 7  , exp = 492 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62013,62014} }, bigMonsterNum = 4, bigMonsterType = { {62033,62034} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 8  , exp = 506 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62015,62016} }, bigMonsterNum = 4, bigMonsterType = { {62035,62036} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 9  , exp = 519 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62017,62018} }, bigMonsterNum = 4, bigMonsterType = { {62037,62038} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 10 , exp = 533 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62019,62020} }, bigMonsterNum = 4, bigMonsterType = { {62039,62040} }, bossMonsterNum = 1, bossMonsterType = {62042}, },
														 { level = 11 , exp = 546 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62051,62052} }, bigMonsterNum = 4, bigMonsterType = { {62071,62072} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 12 , exp = 559 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62053,62054} }, bigMonsterNum = 4, bigMonsterType = { {62073,62074} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 13 , exp = 573 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62055,62056} }, bigMonsterNum = 4, bigMonsterType = { {62075,62076} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 14 , exp = 586 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62057,62058} }, bigMonsterNum = 4, bigMonsterType = { {62077,62078} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 15 , exp = 600 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62059,62060} }, bigMonsterNum = 4, bigMonsterType = { {62079,62080} }, bossMonsterNum = 1, bossMonsterType = {62091}, },
														 { level = 16 , exp = 613 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62061,62062} }, bigMonsterNum = 4, bigMonsterType = { {62081,62082} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 17 , exp = 626 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62063,62064} }, bigMonsterNum = 4, bigMonsterType = { {62083,62084} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 18 , exp = 640 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62065,62066} }, bigMonsterNum = 4, bigMonsterType = { {62085,62086} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 19 , exp = 653 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62067,62068} }, bigMonsterNum = 4, bigMonsterType = { {62087,62088} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 20 , exp = 667 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62069,62070} }, bigMonsterNum = 4, bigMonsterType = { {62089,62090} }, bossMonsterNum = 1, bossMonsterType = {62092}, },
														 { level = 21 , exp = 680 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62101,62102} }, bigMonsterNum = 4, bigMonsterType = { {62121,62122} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 22 , exp = 693 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62103,62104} }, bigMonsterNum = 4, bigMonsterType = { {62123,62124} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 23 , exp = 707 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62105,62106} }, bigMonsterNum = 4, bigMonsterType = { {62125,62126} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 24 , exp = 720 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62107,62108} }, bigMonsterNum = 4, bigMonsterType = { {62127,62128} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 25 , exp = 734 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62109,62110} }, bigMonsterNum = 4, bigMonsterType = { {62129,62130} }, bossMonsterNum = 1, bossMonsterType = {62141}, },
														 { level = 26 , exp = 747 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62111,62112} }, bigMonsterNum = 4, bigMonsterType = { {62131,62132} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 27 , exp = 760 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62113,62114} }, bigMonsterNum = 4, bigMonsterType = { {62133,62134} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 28 , exp = 774 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62115,62116} }, bigMonsterNum = 4, bigMonsterType = { {62135,62136} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 29 , exp = 787 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62117,62118} }, bigMonsterNum = 4, bigMonsterType = { {62137,62138} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 30 , exp = 801 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62119,62120} }, bigMonsterNum = 4, bigMonsterType = { {62139,62140} }, bossMonsterNum = 1, bossMonsterType = {62142}, },
														 { level = 31 , exp = 814 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62151,62152} }, bigMonsterNum = 4, bigMonsterType = { {62171,62172} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 32 , exp = 827 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62153,62154} }, bigMonsterNum = 4, bigMonsterType = { {62173,62174} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 33 , exp = 841 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62155,62156} }, bigMonsterNum = 4, bigMonsterType = { {62175,62176} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 34 , exp = 854 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62157,62158} }, bigMonsterNum = 4, bigMonsterType = { {62177,62178} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 35 , exp = 868 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62159,62160} }, bigMonsterNum = 4, bigMonsterType = { {62179,62180} }, bossMonsterNum = 1, bossMonsterType = {62191}, },
														 { level = 36 , exp = 881 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62161,62162} }, bigMonsterNum = 4, bigMonsterType = { {62181,62182} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 37 , exp = 895 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62163,62164} }, bigMonsterNum = 4, bigMonsterType = { {62183,62184} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 38 , exp = 908 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62165,62166} }, bigMonsterNum = 4, bigMonsterType = { {62185,62186} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 39 , exp = 922 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62167,62168} }, bigMonsterNum = 4, bigMonsterType = { {62187,62188} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 40 , exp = 936 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62169,62170} }, bigMonsterNum = 4, bigMonsterType = { {62189,62190} }, bossMonsterNum = 1, bossMonsterType = {62192}, },
														 { level = 41 , exp = 948 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62201,62202} }, bigMonsterNum = 4, bigMonsterType = { {62221,62222} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 42 , exp = 960 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62203,62204} }, bigMonsterNum = 4, bigMonsterType = { {62223,62224} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 43 , exp = 973 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62205,62206} }, bigMonsterNum = 4, bigMonsterType = { {62225,62226} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 44 , exp = 985 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62207,62208} }, bigMonsterNum = 4, bigMonsterType = { {62227,62228} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 45 , exp = 998 , normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62209,62210} }, bigMonsterNum = 4, bigMonsterType = { {62229,62230} }, bossMonsterNum = 1, bossMonsterType = {62241}, },
														 { level = 46 , exp = 1011, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62211,62212} }, bigMonsterNum = 4, bigMonsterType = { {62231,62232} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 47 , exp = 1024, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62213,62214} }, bigMonsterNum = 4, bigMonsterType = { {62233,62234} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 48 , exp = 1038, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62215,62216} }, bigMonsterNum = 4, bigMonsterType = { {62235,62236} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 49 , exp = 1051, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62217,62218} }, bigMonsterNum = 4, bigMonsterType = { {62237,62238} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 50 , exp = 1065, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62219,62220} }, bigMonsterNum = 4, bigMonsterType = { {62239,62240} }, bossMonsterNum = 1, bossMonsterType = {62242}, },
														 { level = 51 , exp = 1078, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62251,62252} }, bigMonsterNum = 4, bigMonsterType = { {62271,62272} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 52 , exp = 1091, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62253,62254} }, bigMonsterNum = 4, bigMonsterType = { {62273,62274} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 53 , exp = 1105, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62255,62256} }, bigMonsterNum = 4, bigMonsterType = { {62275,62276} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 54 , exp = 1118, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62257,62258} }, bigMonsterNum = 4, bigMonsterType = { {62277,62278} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 55 , exp = 1132, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62259,62260} }, bigMonsterNum = 4, bigMonsterType = { {62279,62280} }, bossMonsterNum = 1, bossMonsterType = {62291}, },
														 { level = 56 , exp = 1145, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62261,62262} }, bigMonsterNum = 4, bigMonsterType = { {62281,62282} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 57 , exp = 1159, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62263,62264} }, bigMonsterNum = 4, bigMonsterType = { {62283,62284} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 58 , exp = 1172, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62265,62266} }, bigMonsterNum = 4, bigMonsterType = { {62285,62286} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 59 , exp = 1186, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62267,62268} }, bigMonsterNum = 4, bigMonsterType = { {62287,62288} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 60 , exp = 1200, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62269,62270} }, bigMonsterNum = 4, bigMonsterType = { {62289,62290} }, bossMonsterNum = 1, bossMonsterType = {62292}, },
														 { level = 61 , exp = 1213, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62301,62302} }, bigMonsterNum = 4, bigMonsterType = { {62321,62322} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 62 , exp = 1226, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62303,62304} }, bigMonsterNum = 4, bigMonsterType = { {62323,62324} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 63 , exp = 1240, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62305,62306} }, bigMonsterNum = 4, bigMonsterType = { {62325,62326} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 64 , exp = 1253, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62307,62308} }, bigMonsterNum = 4, bigMonsterType = { {62327,62328} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 65 , exp = 1267, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62309,62310} }, bigMonsterNum = 4, bigMonsterType = { {62329,62330} }, bossMonsterNum = 1, bossMonsterType = {62341}, },
														 { level = 66 , exp = 1280, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62311,62312} }, bigMonsterNum = 4, bigMonsterType = { {62331,62332} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 67 , exp = 1293, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62313,62314} }, bigMonsterNum = 4, bigMonsterType = { {62333,62334} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 68 , exp = 1307, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62315,62316} }, bigMonsterNum = 4, bigMonsterType = { {62335,62336} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 69 , exp = 1320, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62317,62318} }, bigMonsterNum = 4, bigMonsterType = { {62337,62338} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 70 , exp = 1334, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62319,62320} }, bigMonsterNum = 4, bigMonsterType = { {62339,62340} }, bossMonsterNum = 1, bossMonsterType = {62342}, },
														 { level = 71 , exp = 1347, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62351,62352} }, bigMonsterNum = 4, bigMonsterType = { {62371,62372} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 72 , exp = 1360, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62353,62354} }, bigMonsterNum = 4, bigMonsterType = { {62373,62374} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 73 , exp = 1374, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62355,62356} }, bigMonsterNum = 4, bigMonsterType = { {62375,62376} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 74 , exp = 1387, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62357,62358} }, bigMonsterNum = 4, bigMonsterType = { {62377,62378} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 75 , exp = 1401, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62359,62360} }, bigMonsterNum = 4, bigMonsterType = { {62379,62380} }, bossMonsterNum = 1, bossMonsterType = {62391}, },
														 { level = 76 , exp = 1414, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62361,62362} }, bigMonsterNum = 4, bigMonsterType = { {62381,62382} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 77 , exp = 1427, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62363,62364} }, bigMonsterNum = 4, bigMonsterType = { {62383,62384} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 78 , exp = 1441, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62365,62366} }, bigMonsterNum = 4, bigMonsterType = { {62385,62386} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 79 , exp = 1454, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62367,62368} }, bigMonsterNum = 4, bigMonsterType = { {62387,62388} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 80 , exp = 1468, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62369,62370} }, bigMonsterNum = 4, bigMonsterType = { {62389,62390} }, bossMonsterNum = 1, bossMonsterType = {62392}, },
														 { level = 81 , exp = 1500, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62401,62402} }, bigMonsterNum = 4, bigMonsterType = { {62421,62422} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 82 , exp = 1600, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62403,62404} }, bigMonsterNum = 4, bigMonsterType = { {62423,62424} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 83 , exp = 1700, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62405,62406} }, bigMonsterNum = 4, bigMonsterType = { {62425,62426} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 84 , exp = 1800, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62407,62408} }, bigMonsterNum = 4, bigMonsterType = { {62427,62428} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 85 , exp = 1900, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62409,62410} }, bigMonsterNum = 4, bigMonsterType = { {62429,62430} }, bossMonsterNum = 1, bossMonsterType = {62441}, },
														 { level = 86 , exp = 2000, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62411,62412} }, bigMonsterNum = 4, bigMonsterType = { {62431,62432} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 87 , exp = 2100, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62413,62414} }, bigMonsterNum = 4, bigMonsterType = { {62433,62434} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 88 , exp = 2200, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62415,62416} }, bigMonsterNum = 4, bigMonsterType = { {62435,62436} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 89 , exp = 2300, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62417,62418} }, bigMonsterNum = 4, bigMonsterType = { {62437,62438} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 90 , exp = 2400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62419,62420} }, bigMonsterNum = 4, bigMonsterType = { {62439,62440} }, bossMonsterNum = 1, bossMonsterType = {62442}, },
														 { level = 91 , exp = 2500, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62451,62452} }, bigMonsterNum = 4, bigMonsterType = { {62471,62472} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 92 , exp = 2600, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62453,62454} }, bigMonsterNum = 4, bigMonsterType = { {62473,62474} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 93 , exp = 2700, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62455,62456} }, bigMonsterNum = 4, bigMonsterType = { {62475,62476} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 94 , exp = 2800, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62457,62458} }, bigMonsterNum = 4, bigMonsterType = { {62477,62478} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 95 , exp = 2900, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62459,62460} }, bigMonsterNum = 4, bigMonsterType = { {62479,62480} }, bossMonsterNum = 1, bossMonsterType = {62491}, },
														 { level = 96 , exp = 3000, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62461,62462} }, bigMonsterNum = 4, bigMonsterType = { {62481,62482} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 97 , exp = 3100, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62463,62464} }, bigMonsterNum = 4, bigMonsterType = { {62483,62484} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 98 , exp = 3200, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62465,62466} }, bigMonsterNum = 4, bigMonsterType = { {62485,62486} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 99 , exp = 3300, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62467,62468} }, bigMonsterNum = 4, bigMonsterType = { {62487,62488} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 100, exp = 3400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62469,62470} }, bigMonsterNum = 4, bigMonsterType = { {62489,62490} }, bossMonsterNum = 1, bossMonsterType = {62492}, },
														 { level = 101, exp = 3500, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62501,62502} }, bigMonsterNum = 4, bigMonsterType = { {62521,62522} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 102, exp = 3600, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62503,62504} }, bigMonsterNum = 4, bigMonsterType = { {62523,62524} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 103, exp = 3700, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62505,62506} }, bigMonsterNum = 4, bigMonsterType = { {62525,62526} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 104, exp = 3800, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62507,62508} }, bigMonsterNum = 4, bigMonsterType = { {62527,62528} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 105, exp = 3900, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62509,62510} }, bigMonsterNum = 4, bigMonsterType = { {62529,62530} }, bossMonsterNum = 1, bossMonsterType = {62541}, },
														 { level = 106, exp = 4000, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62511,62512} }, bigMonsterNum = 4, bigMonsterType = { {62531,62532} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 107, exp = 4100, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62513,62514} }, bigMonsterNum = 4, bigMonsterType = { {62533,62534} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 108, exp = 4200, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62515,62516} }, bigMonsterNum = 4, bigMonsterType = { {62535,62536} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 109, exp = 4300, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62517,62518} }, bigMonsterNum = 4, bigMonsterType = { {62537,62538} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 110, exp = 4400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62519,62520} }, bigMonsterNum = 4, bigMonsterType = { {62539,62540} }, bossMonsterNum = 1, bossMonsterType = {62542}, },
														 { level = 111, exp = 4500, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62551,62552} }, bigMonsterNum = 4, bigMonsterType = { {62571,62572} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 112, exp = 4600, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62553,62554} }, bigMonsterNum = 4, bigMonsterType = { {62573,62574} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 113, exp = 4700, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62555,62556} }, bigMonsterNum = 4, bigMonsterType = { {62575,62576} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 114, exp = 4800, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62557,62558} }, bigMonsterNum = 4, bigMonsterType = { {62577,62578} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 115, exp = 4900, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62559,62560} }, bigMonsterNum = 4, bigMonsterType = { {62579,62580} }, bossMonsterNum = 1, bossMonsterType = {62591}, },
														 { level = 116, exp = 5000, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62561,62562} }, bigMonsterNum = 4, bigMonsterType = { {62581,62582} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 117, exp = 5100, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62563,62564} }, bigMonsterNum = 4, bigMonsterType = { {62583,62584} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 118, exp = 5200, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62565,62566} }, bigMonsterNum = 4, bigMonsterType = { {62585,62586} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 119, exp = 5300, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62567,62568} }, bigMonsterNum = 4, bigMonsterType = { {62587,62588} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 120, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62569,62570} }, bigMonsterNum = 4, bigMonsterType = { {62589,62590} }, bossMonsterNum = 1, bossMonsterType = {62592}, },
														 { level = 121, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62601,62602} }, bigMonsterNum = 4, bigMonsterType = { {62621,62622} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 122, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62603,62604} }, bigMonsterNum = 4, bigMonsterType = { {62623,62624} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 123, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62605,62606} }, bigMonsterNum = 4, bigMonsterType = { {62625,62626} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 124, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62607,62608} }, bigMonsterNum = 4, bigMonsterType = { {62627,62628} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 125, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62609,62610} }, bigMonsterNum = 4, bigMonsterType = { {62629,62630} }, bossMonsterNum = 1, bossMonsterType = {62641}, },
														 { level = 126, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62611,62612} }, bigMonsterNum = 4, bigMonsterType = { {62631,62632} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 127, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62613,62614} }, bigMonsterNum = 4, bigMonsterType = { {62633,62634} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 128, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62615,62616} }, bigMonsterNum = 4, bigMonsterType = { {62635,62636} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 129, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62617,62618} }, bigMonsterNum = 4, bigMonsterType = { {62637,62638} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 130, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62619,62620} }, bigMonsterNum = 4, bigMonsterType = { {62639,62640} }, bossMonsterNum = 1, bossMonsterType = {62642}, },
														 { level = 131, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62651,62652} }, bigMonsterNum = 4, bigMonsterType = { {62671,62672} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 132, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62653,62654} }, bigMonsterNum = 4, bigMonsterType = { {62673,62674} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 133, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62655,62656} }, bigMonsterNum = 4, bigMonsterType = { {62675,62676} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 134, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62657,62658} }, bigMonsterNum = 4, bigMonsterType = { {62677,62678} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 135, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62659,62660} }, bigMonsterNum = 4, bigMonsterType = { {62679,62680} }, bossMonsterNum = 1, bossMonsterType = {62691}, },
														 { level = 136, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62661,62662} }, bigMonsterNum = 4, bigMonsterType = { {62681,62682} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 137, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62663,62664} }, bigMonsterNum = 4, bigMonsterType = { {62683,62684} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 138, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62665,62666} }, bigMonsterNum = 4, bigMonsterType = { {62685,62686} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 139, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62667,62668} }, bigMonsterNum = 4, bigMonsterType = { {62687,62688} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 140, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62669,62670} }, bigMonsterNum = 4, bigMonsterType = { {62689,62690} }, bossMonsterNum = 1, bossMonsterType = {62692}, },
														 { level = 141, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62701,62702} }, bigMonsterNum = 4, bigMonsterType = { {62721,62722} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 142, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62703,62704} }, bigMonsterNum = 4, bigMonsterType = { {62723,62724} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 143, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62705,62706} }, bigMonsterNum = 4, bigMonsterType = { {62725,62726} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 144, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62707,62708} }, bigMonsterNum = 4, bigMonsterType = { {62727,62728} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 145, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62709,62710} }, bigMonsterNum = 4, bigMonsterType = { {62729,62730} }, bossMonsterNum = 1, bossMonsterType = {62741}, },
														 { level = 146, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62711,62712} }, bigMonsterNum = 4, bigMonsterType = { {62731,62732} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 147, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62713,62714} }, bigMonsterNum = 4, bigMonsterType = { {62733,62734} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 148, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62715,62716} }, bigMonsterNum = 4, bigMonsterType = { {62735,62736} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 149, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62717,62718} }, bigMonsterNum = 4, bigMonsterType = { {62737,62738} }, bossMonsterNum = 0, bossMonsterType = {}, },
														 { level = 150, exp = 5400, normalMonsterNum1 = 10, normalMonsterNum2 = 5, normalMonsterType = { {62719,62720} }, bigMonsterNum = 4, bigMonsterType = { {62739,62740} }, bossMonsterNum = 1, bossMonsterType = {62742}, },
													}                                                                                                                                                             
													                                                                                                                                                              
x700121_var_CaiJiZuoBiao = {                                                                                                                                                            
													 		{                                                                                                                                                         
													 			 {                                                                                                                                                      
																		{36.391619, 92.549265},                                                                                                                             
																		{36.352205, 93.46562},                                                                                                                              
																		{53.703458, 85.386646},                                                                                                                             
																		{53.664044, 86.303001},                                                                                                                             
																		{45.165382, 78.665355},                                                                                                                             
																		{45.125968, 79.58171},                                                                                                                              
																		{34.620547, 74.976146},                                                                                                                             
																		{34.581133, 75.892501},                                                                                                                             
													 			 },                                                                                                                                                     
													 			 {                                                                                                                                                      
																		{35.887415, 93.787858},                                                                                                                             
																		{36.84894, 93.632624},                                                                                                                              
																		{35.405662, 92.861801},                                                                                                                             
																		{36.661756, 92.11551},                                                                                                                              
																		{37.37008, 92.597504},                                                                                                                              
																		{37.497242, 93.440087},                                                                                                                             
																		{53.199254, 86.625239},                                                                                                                             
																		{54.160779, 86.470005},                                                                                                                             
																		{52.717501, 85.699182},                                                                                                                             
																		{53.973595, 84.952891},                                                                                                                             
																		{54.681919, 85.434885},                                                                                                                             
																		{54.809081, 86.277468},                                                                                                                             
																		{44.661178, 79.903948},                                                                                                                             
																		{45.622703, 79.748714},                                                                                                                             
																		{44.179425, 78.977891},                                                                                                                             
																		{45.435519, 78.2316},                                                                                                                               
																		{46.143843, 78.713594},                                                                                                                             
																		{46.271005, 79.556177},                                                                                                                             
																		{34.116343, 76.214739},                                                                                                                             
																		{35.077868, 76.059505},                                                                                                                             
																		{33.63459, 75.288682},                                                                                                                              
																		{34.890684, 74.542391},                                                                                                                             
																		{35.599008, 75.024385},                                                                                                                             
																		{35.72617, 75.866968},                                                                                                                              
													 			 },                                                                                                                                                     
													 			 {                                                                                                                                                      
													 			 		{36.403033, 93.937641},                                                                                                                             
																		{35.945425, 92.655361},                                                                                                                             
																		{36.805823, 92.628185},                                                                                                                             
																		{35.950215, 93.171523},                                                                                                                             
																		{37.029507, 93.068395},                                                                                                                             
																		{36.499143, 92.992385},                                                                                                                             
																		{53.714872, 86.775022},                                                                                                                             
																		{53.257264, 85.492742},                                                                                                                             
																		{54.117662, 85.465566},                                                                                                                             
																		{53.262054, 86.008904},                                                                                                                             
																		{54.341346, 85.905776},                                                                                                                             
																		{53.810982, 85.829766},                                                                                                                             
																		{45.176796, 80.053731},                                                                                                                             
																		{44.719188, 78.771451},                                                                                                                             
																		{45.579586, 78.744275},                                                                                                                             
																		{44.723978, 79.287613},                                                                                                                             
																		{45.80327, 79.184485},                                                                                                                              
																		{45.272906, 79.108475},                                                                                                                             
																		{34.631961, 76.364522},                                                                                                                             
																		{34.174353, 75.082242},                                                                                                                             
																		{35.034751, 75.055066},                                                                                                                             
																		{34.179143, 75.598404},                                                                                                                             
																		{35.258435, 75.495276},                                                                                                                             
																		{34.728071, 75.419266},                                                                                                                             
													 			 },                                                                                                                                                     
													 		},--区域一                                                                                                                                                
													 		{                                                                                                                                                         
													 			 {                                                                                                                                                      
																		{92.609764, 90.730779},                                                                                                                             
																		{92.57035, 91.647134},                                                                                                                              
																		{78.421604, 86.503018},                                                                                                                             
																		{78.38219, 87.419373},                                                                                                                              
																		{87.584139, 78.885877},                                                                                                                             
																		{87.544725, 79.802232},                                                                                                                             
																		{73.19574, 74.457463},                                                                                                                              
																		{73.156326, 75.373818},                                                                                                                             
													 			 },                                                                                                                                                     
													 			 {                                                                                                                                                      
																		{92.10556, 91.969372},                                                                                                                              
																		{93.067085, 91.814138},                                                                                                                             
																		{91.623807, 91.043315},                                                                                                                             
																		{92.879901, 90.297024},                                                                                                                             
																		{93.588225, 90.779018},                                                                                                                             
																		{93.715387, 91.621601},                                                                                                                             
																		{77.9174, 87.741611},                                                                                                                               
																		{78.878925, 87.586377},                                                                                                                             
																		{77.435647, 86.815554},                                                                                                                             
																		{78.691741, 86.069263},                                                                                                                             
																		{79.400065, 86.551257},                                                                                                                             
																		{79.527227, 87.39384},                                                                                                                              
																		{87.079935, 80.12447},                                                                                                                              
																		{88.04146, 79.969236},                                                                                                                              
																		{86.598182, 79.198413},                                                                                                                             
																		{87.854276, 78.452122},                                                                                                                             
																		{88.5626, 78.934116},                                                                                                                               
																		{88.689762, 79.776699},                                                                                                                             
																		{72.691536, 75.696056},                                                                                                                             
																		{73.653061, 75.540822},                                                                                                                             
																		{72.209783, 74.769999},                                                                                                                             
																		{73.465877, 74.023708},                                                                                                                             
																		{74.174201, 74.505702},                                                                                                                             
																		{74.301363, 75.348285},                                                                                                                             
													 			 },                                                                                                                                                     
													 			 {                                                                                                                                                      
													 			 		{92.621178, 92.119155},                                                                                                                             
																		{92.16357, 90.836875},                                                                                                                              
																		{93.023968, 90.809699},                                                                                                                             
																		{92.16836, 91.353037},                                                                                                                              
																		{93.247652, 91.249909},                                                                                                                             
																		{92.717288, 91.173899},                                                                                                                             
																		{78.433018, 87.891394},                                                                                                                             
																		{77.97541, 86.609114},                                                                                                                              
																		{78.835808, 86.581938},                                                                                                                             
																		{77.9802, 87.125276},                                                                                                                               
																		{79.059492, 87.022148},                                                                                                                             
																		{78.529128, 86.946138},                                                                                                                             
																		{87.595553, 80.274253},                                                                                                                             
																		{87.137945, 78.991973},                                                                                                                             
																		{87.998343, 78.964797},                                                                                                                             
																		{87.142735, 79.508135},                                                                                                                             
																		{88.222027, 79.405007},                                                                                                                             
																		{87.691663, 79.328997},                                                                                                                             
																		{73.207154, 75.845839},                                                                                                                             
																		{72.749546, 74.563559},                                                                                                                             
																		{73.609944, 74.536383},                                                       
																		{72.754336, 75.079721},                                                       
																		{73.833628, 74.976593},                                                       
																		{73.303264, 74.900583},                                                       
													 			 },
													 		},--区域二
													 		{
													 			 {
													 			 		{92.787007, 51.639673},
																		{92.747593, 52.556028},
																		{75.352157, 43.605795},
																		{75.312743, 44.52215},
																		{86.769527, 38.517686},
																		{86.730113, 39.434041},
																		{77.66694, 34.554055},
																		{77.627526, 35.47041},
													 			 },
													 			 {
																		{92.282803, 52.878266},
																		{93.244328, 52.723032},
																		{91.80105, 51.952209},
																		{93.057144, 51.205918},
																		{93.765468, 51.687912},
																		{93.89263, 52.530495},
																		{74.847953, 44.844388},
																		{75.809478, 44.689154},
																		{74.3662, 43.918331},
																		{75.622294, 43.17204},
																		{76.330618, 43.654034},
																		{76.45778, 44.496617},
																		{86.265323, 39.756279},
																		{87.226848, 39.601045},
																		{85.78357, 38.830222},
																		{87.039664, 38.083931},
																		{87.747988, 38.565925},
																		{87.87515, 39.408508},
																		{77.162736, 35.792648},
																		{78.124261, 35.637414},
																		{76.680983, 34.866591},
																		{77.937077, 34.592},
																		{78.645401, 34.602294},
																		{78.772563, 35.444877},
													 			 },
													 			 {
																		{92.798421, 53.028049},
																		{92.340813, 51.745769},
																		{93.201211, 51.718593},
																		{92.345603, 52.261931},
																		{93.424895, 52.158803},
																		{92.894531, 52.082793},
																		{75.363571, 44.994171},
																		{74.905963, 43.711891},
																		{75.766361, 43.684715},
																		{74.910753, 44.228053},
																		{75.990045, 44.124925},
																		{75.459681, 44.048915},
																		{86.780941, 39.906062},
																		{86.323333, 38.623782},
																		{87.183731, 38.596606},
																		{86.328123, 39.139944},
																		{87.407415, 39.036816},
																		{86.877051, 38.960806},
																		{77.678354, 35.942431},
																		{77.220746, 34.660151},
																		{78.081144, 34.632975},
																		{77.225536, 35.176313},
																		{78.304828, 35.073185},
																		{77.774464, 34.997175},        
													 			 },
													 		},--区域三
													 		{
													 			 {
																		{35.954666, 53.810153},
																		{35.915252, 54.726508},
																		{51.914441, 47.825715},
																		{51.875027, 48.74207},
																		{36.638001, 40.913538},
																		{36.598587, 41.829893},
																		{51.122726, 33.725127},
																		{51.083312, 34.641482},
													 			 },
													 			 {
																		{35.450462, 55.048746},
																		{36.411987, 54.893512},
																		{34.968709, 54.122689},
																		{36.224803, 53.376398},
																		{36.933127, 53.858392},
																		{37.060289, 54.700975},
																		{51.410237, 49.064308},
																		{52.371762, 48.909074},
																		{50.928484, 48.138251},
																		{52.184578, 47.39196},
																		{52.892902, 47.873954},
																		{53.020064, 48.716537},
																		{36.133797, 42.152131},
																		{37.095322, 41.996897},
																		{35.652044, 41.226074},
																		{36.908138, 40.479783},
																		{37.616462, 40.961777},
																		{37.743624, 41.80436},
																		{50.618522, 34.96372},
																		{51.580047, 34.808486},
																		{50.136769, 34.037663},
																		{51.392863, 33.291372},
																		{52.101187, 33.773366},
																		{52.228349, 34.615949},
													 			 },
													 			 {
																		{35.96608, 55.198529},
																		{35.508472, 53.916249},
																		{36.36887, 53.889073},
																		{35.513262, 54.432411},
																		{36.592554, 54.329283},
																		{36.06219, 54.253273},
																		{51.925855, 49.214091},
																		{51.468247, 47.931811},
																		{52.328645, 47.904635},
																		{51.473037, 48.447973},
																		{52.552329, 48.344845},
																		{52.021965, 48.268835},
																		{36.649415, 42.301914},
																		{36.191807, 41.019634},
																		{37.052205, 40.992458},
																		{36.196597, 41.535796},
																		{37.275889, 41.432668},
																		{36.745525, 41.356658},
																		{51.13414, 35.113503},
																		{50.676532, 33.831223},
																		{51.53693, 33.804047},
																		{50.681322, 34.347385},
																		{51.760614, 34.244257},
																		{51.23025, 34.168247},        
													 			 },
													 		},--区域四
													 }

x700121_var_CaiJiType = { 
													 { level = 1  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 2  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 3  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 4  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 5  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 6  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 7  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 8  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 9  , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 10 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 11 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 12 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 13 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 14 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 15 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 16 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 17 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 18 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 19 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 20 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 21 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 22 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 23 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 24 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 25 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 26 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 27 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 28 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 29 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 30 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 31 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 32 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 33 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 34 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 35 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 36 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 37 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 38 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 39 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 40 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 41 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 42 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 43 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 44 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 45 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 46 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 47 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 48 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 49 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 50 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 51 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 52 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 53 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 54 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 55 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 56 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 57 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 58 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 59 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 60 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 61 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 62 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 63 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 64 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 65 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 66 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 67 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 68 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 69 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 70 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 71 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 72 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 73 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 74 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 75 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 76 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 77 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 78 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 79 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 80 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 81 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 82 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 83 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 84 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 85 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 86 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 87 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 88 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 89 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 90 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 91 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 92 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 93 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 94 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 95 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 96 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 97 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 98 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 99 , caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 100, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 101, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 102, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 103, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 104, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 105, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 106, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 107, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 108, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 109, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 110, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 111, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 112, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 113, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 114, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 115, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 116, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 117, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 118, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 119, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 120, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 121, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 122, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 123, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 124, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 125, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 126, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 127, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 128, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 129, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 130, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 131, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 132, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 133, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 134, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 135, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 136, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 137, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 138, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 139, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 140, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 141, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 142, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 143, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 144, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 145, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 146, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 147, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 148, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 149, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
													 { level = 150, caijiType = { {count = 1, type = {590,591,592}}, {count = 2, type = {593,594}}, {count = 4, type = {595,596}} } },
												} 
												  
x700121_var_CaiJiQuanZhong = {
																4,
																1,
														 }

x700121_var_CaiJiItem = {
													{ itemId = 0       , percent = 300000, name = ""                , },
													{ itemId = 11000800, percent = 250   , name = "离石剂"          , },
													{ itemId = 11000810, percent = 250   , name = "残破的背包图样"  , },
													{ itemId = 11000902, percent = 250   , name = "高级洗石剂"      , },
													{ itemId = 11010001, percent = 250   , name = "一级皇家秘银"    , },
													{ itemId = 11020001, percent = 10000 , name = "甘草"            , },
													{ itemId = 11020002, percent = 10000 , name = "红花"            , },
													{ itemId = 11020006, percent = 10000 , name = "茯苓"            , },
													{ itemId = 11020007, percent = 10000 , name = "伸筋藤"          , },
													{ itemId = 11020010, percent = 10000 , name = "天麻"            , },
													{ itemId = 11020011, percent = 10000 , name = "朱砂"            , },
													{ itemId = 11020014, percent = 10000 , name = "防风"            , },
													{ itemId = 11020015, percent = 10000 , name = "桂枝"            , },
													{ itemId = 11030001, percent = 10000 , name = "初级矿石"        , },
													{ itemId = 11030003, percent = 10000 , name = "中级矿石"        , },
													{ itemId = 11030005, percent = 10000 , name = "高级矿石"        , },
													{ itemId = 11030007, percent = 10000 , name = "圣徒级矿石"      , },
													{ itemId = 11030401, percent = 10000 , name = "马蜂"            , },
													{ itemId = 11030402, percent = 10000 , name = "牛虻"            , },
													{ itemId = 11030403, percent = 10000 , name = "吸血蝙蝠"        , },
													{ itemId = 11030404, percent = 10000 , name = "碧血蟾蜍"        , },
													{ itemId = 11030405, percent = 10000 , name = "七步蛇"          , },
													{ itemId = 11030406, percent = 10000 , name = "七步封喉"        , },
													{ itemId = 11030501, percent = 10000 , name = "熔火石"          , },
													{ itemId = 11030502, percent = 10000 , name = "黑曜石"          , },
													{ itemId = 11050001, percent = 10000 , name = "初级龙眼石"      , },
													{ itemId = 11050002, percent = 10000 , name = "中级龙眼石"      , },
													{ itemId = 11050003, percent = 10000 , name = "高级龙眼石"      , },
													{ itemId = 11050004, percent = 10000 , name = "天之龙眼石"      , },
													{ itemId = 11050005, percent = 10000 , name = "冥之龙眼石"      , },
													{ itemId = 11060001, percent = 500   , name = "王国银票"        , },
													{ itemId = 11060002, percent = 100   , name = "大元银票"        , },
													{ itemId = 11060003, percent = 15    , name = "帝国银票"        , gonggao = 1 },
													{ itemId = 11960001, percent = 5000  , name = "蒙古软皮囊"      , },
													{ itemId = 11960002, percent = 5000  , name = "天山白狐皮"      , },
													{ itemId = 11960003, percent = 5000  , name = "回鹘丝锦囊"      , },
													{ itemId = 11960004, percent = 5000  , name = "景德青花瓶"      , },
													{ itemId = 11960005, percent = 5000  , name = "波斯绿毡毯"      , },
													{ itemId = 11960006, percent = 5000  , name = "里昂鎏银碗"      , },
													{ itemId = 11960007, percent = 5000  , name = "缅甸翠玉瓶"      , },
													{ itemId = 11960008, percent = 5000  , name = "印度羊脂瓶"      , },
													{ itemId = 11960009, percent = 5000  , name = "昆仑翡翠石"      , },
													{ itemId = 11960010, percent = 5000  , name = "中原钧窑瓶"      , },
													{ itemId = 11990015, percent = 500   , name = "藏宝令"          , },
													{ itemId = 11990050, percent = 500   , name = "回魂丹"          , },
													{ itemId = 11990110, percent = 500   , name = "募集券"          , gonggao = 1 },
													{ itemId = 11990400, percent = 500   , name = "融合剂"          , },
													{ itemId = 12010001, percent = 5000  , name = "小跌打药"        , },
													{ itemId = 12010002, percent = 5000  , name = "大跌打药"        , },
													{ itemId = 12010003, percent = 5000  , name = "小疗伤药"        , },
													{ itemId = 12010004, percent = 5000  , name = "大疗伤药"        , },
													{ itemId = 12030011, percent = 500   , name = "杰克丹尼"        , },
													{ itemId = 12030012, percent = 500   , name = "路易十三"        , },
													{ itemId = 12030013, percent = 250   , name = "芝华士"          , },
													{ itemId = 12030014, percent = 250   , name = "轩尼诗理查"      , },
													{ itemId = 12030016, percent = 250   , name = "队伍召集令"      , },
													{ itemId = 12030017, percent = 250   , name = "哈瓦那雪茄"      , },
													{ itemId = 12030018, percent = 250   , name = "蒙面巾"          , },
													{ itemId = 12030043, percent = 1000  , name = "千里镜"          , },
													{ itemId = 12030044, percent = 500   , name = "金砂"            , },
													{ itemId = 12030045, percent = 250   , name = "金条"            , gonggao = 1 },
													{ itemId = 12030046, percent = 100   , name = "金元宝"          , gonggao = 1 },
													{ itemId = 12030088, percent = 500   , name = "冥龙之首残骸"    , },
													{ itemId = 12030089, percent = 500   , name = "冥龙之身残骸"    , },
													{ itemId = 12030090, percent = 500   , name = "冥龙之爪残骸"    , },
													{ itemId = 12030091, percent = 500   , name = "冥龙之尾残骸"    , },
													{ itemId = 12030107, percent = 1000  , name = "神龙藏宝图"      , },
													{ itemId = 12030201, percent = 500   , name = "修理石"          , },
													{ itemId = 12030204, percent = 1000  , name = "声望卡"          , },
													{ itemId = 12030213, percent = 1000  , name = "强效极乐草"      , },
													{ itemId = 12041011, percent = 1000  , name = "小神力丸"        , },
													{ itemId = 12041012, percent = 1000  , name = "中神力丸"        , },
													{ itemId = 12041013, percent = 1000  , name = "大神力丸"        , },
													{ itemId = 12041014, percent = 250   , name = "四象神力丸"      , },
													{ itemId = 12041021, percent = 100   , name = "小魔道丸"        , },
													{ itemId = 12041022, percent = 100   , name = "中魔道丸"        , },
													{ itemId = 12041023, percent = 100   , name = "大魔道丸"        , },
													{ itemId = 12041024, percent = 250   , name = "四象魔道丸"      , },
													{ itemId = 12041031, percent = 1000  , name = "小仙火丸"        , },
													{ itemId = 12041032, percent = 1000  , name = "中仙火丸"        , },
													{ itemId = 12041033, percent = 1000  , name = "大仙火丸"        , },
													{ itemId = 12041034, percent = 250   , name = "四象仙火丸"      , },
													{ itemId = 12041090, percent = 250   , name = "免伤神水"        , },
													{ itemId = 12041091, percent = 250   , name = "极速神水"        , },
													{ itemId = 12041094, percent = 250   , name = "无敌神水"        , },
													{ itemId = 12041097, percent = 250   , name = "生命琼浆"        , },
													{ itemId = 12041098, percent = 250   , name = "暴韧神水"        , },
													{ itemId = 12041099, percent = 250   , name = "生命神水"        , },
													{ itemId = 12041101, percent = 500   , name = "修行草"          , },
													{ itemId = 12041102, percent = 500   , name = "天赋丹"          , },
													{ itemId = 12041103, percent = 500   , name = "活力丹"          , },
													{ itemId = 12041110, percent = 500   , name = "一级碎甲丸"      , },
													{ itemId = 12041111, percent = 500   , name = "一级穿甲丸"      , },
													{ itemId = 12041112, percent = 500   , name = "一级熔甲丸"      , },
													{ itemId = 12050011, percent = 500   , name = "天生.二"         , },
													{ itemId = 12050012, percent = 200   , name = "天生.三"         , },
													{ itemId = 12050013, percent = 50    , name = "天生.四"         , gonggao = 1 },
													{ itemId = 12050090, percent = 1000  , name = "一级融雪丹"      , },
													{ itemId = 12050091, percent = 800   , name = "二级融雪丹"      , },
													{ itemId = 12050092, percent = 600   , name = "三级融雪丹"      , },
													{ itemId = 12050093, percent = 400   , name = "四级融雪丹"      , gonggao = 1 },
													{ itemId = 12050094, percent = 200   , name = "五级融雪丹"      , gonggao = 1 },
													{ itemId = 12054300, percent = 500   , name = "还童书"          , },
													{ itemId = 12110206, percent = 500   , name = "钟情一生"        , },
													{ itemId = 11970018, percent = 500   , name = "浮世印"          , },
													{ itemId = 11970021, percent = 800   , name = "乱士符"          , },
													{ itemId = 11970022, percent = 500   , name = "强效乱士符"      , },
													{ itemId = 11970023, percent = 100   , name = "黄金乱士符"      , gonggao = 1 },
													{ itemId = 12035041, percent = 50    , name = "秘钻·黄金藏宝图" , gonggao = 1 },
													{ itemId = 12035042, percent = 50    , name = "洗石·黄金藏宝图" , gonggao = 1 },
													{ itemId = 12035043, percent = 50    , name = "外装·黄金藏宝图" , gonggao = 1 },
													{ itemId = 12035044, percent = 50    , name = "奥钻·黄金藏宝图" , gonggao = 1 },
													{ itemId = 12035016, percent = 50    , name = "骑乘·黄金藏宝图" , gonggao = 1 },
													{ itemId = 11000300, percent = 5     , name = "灵魂印"          , gonggao = 1 },
													{ itemId = 45011106, percent = 6     , name = "黄卡艾莲娜"      , gonggao = 1 },
													{ itemId = 45011336, percent = 6     , name = "黄卡菲丽琶"      , gonggao = 1 },
													{ itemId = 45011576, percent = 6     , name = "黄卡察八儿"      , gonggao = 1 },
													{ itemId = 45011581, percent = 6     , name = "黄卡贝林格瑞亚"  , gonggao = 1 },
													{ itemId = 45012056, percent = 6     , name = "黄卡塞得特"      , gonggao = 1 },
													{ itemId = 45012286, percent = 6     , name = "黄卡文天祥"      , gonggao = 1 },
													{ itemId = 45012516, percent = 6     , name = "黄卡赵构"        , gonggao = 1 },
													{ itemId = 45012771, percent = 6     , name = "黄卡弗拉基米尔"  , gonggao = 1 },
													{ itemId = 45011121, percent = 6     , name = "黄卡娜拉"        , gonggao = 1 },
													{ itemId = 45011346, percent = 6     , name = "黄卡但德罗"      , gonggao = 1 },
													{ itemId = 45011351, percent = 6     , name = "黄卡赤速梯"      , gonggao = 1 },
													{ itemId = 45011591, percent = 6     , name = "黄卡吉牙思"      , gonggao = 1 },
													{ itemId = 45011826, percent = 5     , name = "黄卡萝拉"        , gonggao = 1 },
													{ itemId = 45012071, percent = 5     , name = "黄卡达耶"        , gonggao = 1 },
													{ itemId = 45012301, percent = 5     , name = "黄卡卫绍王"      , gonggao = 1 },
													{ itemId = 45012526, percent = 5     , name = "黄卡章宗"        , gonggao = 1 },
													{ itemId = 45012536, percent = 4     , name = "黄卡赵惇"        , gonggao = 1 },
													{ itemId = 45012786, percent = 4     , name = "黄卡郭宝玉"      , gonggao = 1 },
													{ itemId = 45013011, percent = 4     , name = "黄卡赫尔温"      , gonggao = 1 },
													{ itemId = 45013241, percent = 4     , name = "黄卡耶律楚材"    , gonggao = 1 },
													{ itemId = 45011366, percent = 4     , name = "黄卡贝拉三世"    , gonggao = 1 },
													{ itemId = 45011606, percent = 4     , name = "黄卡哈康六世"    , gonggao = 1 },
													{ itemId = 45012311, percent = 4     , name = "黄卡赫肯三世"    , gonggao = 1 },
													{ itemId = 45012316, percent = 4     , name = "黄卡薇拉狄亚"    , gonggao = 1 },
												}
												
x700121_var_GuanZiId = {
													{ itemId = 12030937, countMin = 1, countMax = 1 },
													{ itemId = 12030938, countMin = 2, countMax = 3 },
													{ itemId = 12030939, countMin = 4, countMax = 6 },
											 }

x700121_var_NPC = {                                                                                                                                                                                                                                                                                                         
										{ type = 13, x = 44, z = 90, guid = 150600, facedir = 180, name = "塔中僧", title = "浮屠塔出口传送人" },                                                                                                                                                                                                                 
										{ type = 13, x = 92, z = 36, guid = 150601, facedir = 315, name = "塔中僧", title = "浮屠塔上层传送人" },                                                                                                                                                                                                                 
									}

x700121_var_GuanQiaSkillBox = {                                                                                                                                                                                                                                                                                                       
																{ percent = 4, type = 61902, name = "群伤技能", buff = 32705, skill = {1650, 1651, 1652, 1653, 1654, 1655, 1656, 1657} },                                                                                                                                                                                                                 
																{ percent = 5, type = 61903, name = "增益效果", buff = 32705, skill = { { effectBuff = 26001, buff = {26002,26003,26004,26005,26006,26007,26008,26009,26010,26011} }, { effectBuff = 26021, buff = {26022,26023,26024,26025,26026,26027,26028,26029,26030,26031} }, { effectBuff = 26041, buff = {26042,26043,26044,26045,26046,26047,26048,26049,26050,26051} }, { effectBuff = 26061, buff = {26062,26063,26064,26065,26066,26067,26068,26069,26070,26071} }, { effectBuff = 26081, buff = {26082,26083,26084,26085,26086,26087,26088,26089,26090,26091} }, { effectBuff = 26101, buff = {26102,26103,26104,26105,26106,26107,26108,26109,26110,26111} }, { effectBuff = 26121, buff = {26122,26123,26124,26125,26126,26127,26128,26129,26130,26131} }, { effectBuff = 26141, buff = {26142,26143,26144,26145,26146,26147,26148,26149,26150,26151} }, { effectBuff = 26161, buff = {26162,26163,26164,26165,26166,26167,26168,26169,26170,26171} }, { effectBuff = 26181, buff = {26182,26183,26184,26185,26186,26187,26188,26189,26190,26191} }, { effectBuff = 26201, buff = {26202,26203,26204,26205,26206,26207,26208,26209,26210,26211} }, { effectBuff = 26221, buff = {26222,26223,26224,26225,26226,26227,26228,26229,26230,26231} }, } },                                                                                                                                                                                                                 
																																																			 --type: 1是给怪上 2是给自己上
																{ percent = 1, type = 61901, name = "特殊效果", buff = 32705, skill = { {type = 1, effectBuff = 32725, buff = 32726}, {type = 1, effectBuff = 32727, buff = 32728}, {type = 2, buff = 32729} } },
															}
															
x700121_var_HuChiBuff = {
													{ 1321, 1322, 1323, 1324, 1325, 1326, 1327, 1328, 1329, 1330 },
													{ 2081, 2082, 2083, 2084, 2085, 2086, 2087, 2088, 2089, 2090 },
													{ 3091, 3092, 3093, 3094, 3095, 3096, 3097, 3098, 3099, 3100 },
													{ 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4098, 4099, 4100 },
													{ 5081, 5082, 5083, 5084, 5085, 5086, 5087, 5088, 5089, 5090 },
													{ 6101, 6102, 6103, 6104, 6105, 6106, 6107, 6108, 6109, 6110 },
													{ 17040, 17041, 17042, 17043, 17044, 17045, 17046, 17047, 17048, 17049 },
													{ 18080, 18081, 18082, 18083, 18084, 18085, 18086, 18087, 18088, 18089 },
													{ 19070, 19071, 19072, 19073, 19074, 19075, 19076, 19077, 19078, 19079 },
													{ 20070, 20071, 20072, 20073, 20074, 20075, 20076, 20077, 20078, 20079 },
													{ 21060, 21061, 21062, 21063, 21064, 21065, 21066, 21067, 21068, 21069 },
													{ 22080, 22081, 22082, 22083, 22084, 22085, 22086, 22087, 22088, 22089 },
												}
															
x700121_var_MonsterAI = {
													{ { AI = 980, name = "#e7A7A7A#cFF8000武士" }, { AI = 981, name = "#e7A7A7A#cFF8000剑侠" }, { AI = 982, name = "#e7A7A7A#cFF8000十字军" }, { AI = 981, name = "#e7A7A7A#cFF8000剑侠" }, { AI = 981, name = "#e7A7A7A#cFF8000剑侠" }, { AI = 981, name = "#e7A7A7A#cFF8000剑侠" } },--降低武士和十字军出现的概率
													{ { AI = 984, name = "#e7A7A7A#cFF8000骑射" }, { AI = 985, name = "#e7A7A7A#cFF8000火枪" }, { AI = 986, name = "#e7A7A7A#cFF8000先知" }, { AI = 987, name = "#e7A7A7A#cFF8000刺客" }, { AI = 988, name = "#e7A7A7A#cFF8000近卫军" }, { AI = 989, name = "#e7A7A7A#cFF8000隐修士" } }
												}
												
x700121_var_Exp = {
										--双倍
									 	{ buff = 7510, value = 1 },
									 	{ buff = 7511, value = 1 },
									 	{ buff = 9007, value = 1 },
									 	--马书悟性
									 	{ buff = 11150, value = 0.05 },
										{ buff = 11151, value = 0.07 },
										{ buff = 11152, value = 0.09 },
										{ buff = 11153, value = 0.11 },
										{ buff = 11154, value = 0.13 },
										{ buff = 11155, value = 0.15 },
										{ buff = 11156, value = 0.17 },
										{ buff = 11157, value = 0.19 },
										{ buff = 11158, value = 0.21 },
										{ buff = 11159, value = 0.23 },
										--朝廷请柬
										{ buff = 9012, value = 0.3 },
										{ buff = 9011, value = 0.2 },
										{ buff = 9013, value = 0.2 },
										--各种经验buff
										{ buff = 8825 , value = 0.15 },
										{ buff = 8826 , value = 0.12 },
										{ buff = 8827 , value = 0.09 },
										{ buff = 8828 , value = 0.06 },
										{ buff = 8829 , value = 0.03 },
										{ buff = 32400, value = 0.15 },
										{ buff = 32401, value = 0.13 },
										{ buff = 32402, value = 0.12 },
										{ buff = 32403, value = 0.11 },
										{ buff = 32404, value = 0.1  },
										{ buff = 32405, value = 0.09 },
										{ buff = 32406, value = 0.08 },
										{ buff = 32407, value = 0.07 },
										{ buff = 32408, value = 0.05 },
										{ buff = 32150, value = 0.02 },
										{ buff = 32151, value = 0.05 },
									}                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                            
x700121_var_ClearCDMoney = 3000	

x700121_var_AddCountMoney = {6000,6000,6000,6000}			

x700121_var_VIP = {
										{ vipLevel = 4 , countXianZhi = 3, freeCountXianZhi = 1 },
										{ vipLevel = 5 , countXianZhi = 3, freeCountXianZhi = 1 },
										{ vipLevel = 6 , countXianZhi = 3, freeCountXianZhi = 1 },
										{ vipLevel = 7 , countXianZhi = 3, freeCountXianZhi = 1 },
										{ vipLevel = 8 , countXianZhi = 4, freeCountXianZhi = 1 },
										{ vipLevel = 9 , countXianZhi = 4, freeCountXianZhi = 1 },
										{ vipLevel = 10, countXianZhi = 4, freeCountXianZhi = 1 },
									}	                                                                                                                                                                                                                                                                            
														                                                                                                                                                                                                                                                                                                
--记录所杀怪物数量                                                                                                                                                                                                                                                                                                          
x700121_var_KillCount = {}                                                                                                                                                                                                                                                                                                  
x700121_var_KillBoss = {}
x700121_var_IsNeedKillBoss = {}

x700121_var_loopFlag = {}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
function x700121_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)                                                                                                                                                                                                                                    
	--StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                   
	----TalkAppendString(varMap,"进入下一层")                                                                                                                                                                                                                                                                                 
	--TalkAppendButton(varMap, x700121_var_FileId, "进入下一层",16,999)                                                                                                                                                                                                                                                       
	--StopTalkTask()                                                                                                                                                                                                                                                                                                          
	----DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700121_var_FileId, -1);                                                                                                                                                                                                                                               
	--DeliverTalkMenu(varMap, varPlayer, varTalknpc)                                                                                                                                                                                                                                                                          
	                                                                                                                                                                                                                                                                                                                          
	local objID = GetMonsterGUID(varMap, varTalknpc)                                                                                                                                                                                                                                                                          
	StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
		TalkAppendString(varMap,"#Y【个人】浮屠塔#W")                                                                                                                                                                                                                                                                           
		TalkAppendString(varMap,"\n\t浮屠塔中封印着各种妖魔鬼怪，在塔中试练，可以迅速提高自己的能力，如果运气好还可以得到传说中的神兵利器。")                                                                                                                                                                                   
		if ( objID == x700121_var_NPC[1].guid ) then                                                                                                                                                                                                                                                                            
			TalkAppendButton(varMap, x700121_var_FileId, "退出浮屠塔", 3, 91)                                                                                                                                                                                                                                                    
		elseif ( objID == x700121_var_NPC[2].guid ) then                                                                                                                                                                                                                                                                        
			local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)                                                                                                                                                                                                                                                   
			if ( loopCount < getn(x700121_var_MonsterType) ) then                                                                                                                                                                                                                                                                 
				TalkAppendButton(varMap, x700121_var_FileId, "进入下一层", 3, 90)                                                                                                                                                                                                                                                  
			else                                                                                                                                                                                                                                                                                                                  
				TalkAppendButton(varMap, x700121_var_FileId, "退出浮屠塔", 3, 91)                                                                                                                                                                                                                                                  
			end                                                                                                                                                                                                                                                                                                                   
		end                                                                                                                                                                                                                                                                                                                     
	StopTalkTask()                                                                                                                                                                                                                                                                                                            
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)                                                                                                                                                                                                                                                                            
end                                                                                                                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                                                            
function x700121_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)                                                                                                                                                                                                                                      
	--StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                   
	----TalkAppendString(varMap,"进入下一层")                                                                                                                                                                                                                                                                                 
	--TalkAppendButton(varMap, x700121_var_FileId, "进入下一层",16,999)                                                                                                                                                                                                                                                       
	--StopTalkTask()                                                                                                                                                                                                                                                                                                          
	----DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700121_var_FileId, -1);                                                                                                                                                                                                                                               
	--DeliverTalkMenu(varMap, varPlayer, varTalknpc)                                                                                                                                                                                                                                                                          
	                                                                                                                                                                                                                                                                                                                          
	local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)--环数                                                                                                                                                                                                                                                 
	local TheMonster = 0                                                                                                                                                                                                                                                                                                      
	for i, monster in x700121_var_MonsterType do                                                                                                                                                                                                                                                                              
		if ( monster.level == loopCount ) then                                                                                                                                                                                                                                                                              
			TheMonster = monster                                                                                                                                                                                                                                                                                                  
			break                                                                                                                                                                                                                                                                                                                 
		end                                                                                                                                                                                                                                                                                                                     
	end                                                                                                                                                                                                                                                                                                                       
	                  
	if nFlag == 90 then
		StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
			TalkAppendString(varMap,"#Y【个人】浮屠塔#W")
			TalkAppendString(varMap,"\n\t确定要进入下一层么？")
			--TalkAppendButton(varMap, x700121_var_FileId, "确定", 3, 100)
		StopTalkTask()                                                                                                                                                                                                                                                                                                            
		--DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x700121_var_FileId, 10285);
	elseif nFlag == 91 then
		StartTalkTask(varMap)                                                                                                                                                                                                                                                     
			TalkAppendString(varMap,"#Y【个人】浮屠塔#W")
			TalkAppendString(varMap,"\n\t确定要退出浮屠塔么？")
			TalkAppendButton(varMap, x700121_var_FileId, "确定", 3, 101)
		StopTalkTask()                                                                                                                                                                                                                                                                                                            
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)    	                                                                                                                                                                                                                                                                                                        
	elseif nFlag == 100 then                                                                                                                                                                                                                                                                                                      
	                                                                                                                                                                                                                                                                                                               
	elseif nFlag == 101 then                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                        
		NewWorld( varMap, varPlayer, 0, 50 + random( 0, 1 ), 251 + random( 0, 1 ), 700121)                                                                                                                                                                                                                                      
	end                                                                                                                                                                                                                                                                                                                       
end    

function x700121_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
end

function x700121_ProcAccept( varMap, varPlayer )
	--LuaCallNoclosure(700081,"NextLoopFuben", varMap, varPlayer, x700121_var_FileId)
end

function x700121_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)--环数                                                                                                                                                                                                                                                 
	local TheMonster = 0                                                                                                                                                                                                                                                                                                      
	for i, monster in x700121_var_MonsterType do                                                                                                                                                                                                                                                                              
		if ( monster.level == loopCount ) then                                                                                                                                                                                                                                                                                  
			TheMonster = monster                                                                                                                                                                                                                                                                                                  
			break                                                                                                                                                                                                                                                                                                                 
		end                                                                                                                                                                                                                                                                                                                     
	end 

	local teamid = GetTeamId(varMap, varPlayer);                                                                                                                                                                                                                                                                            
	if teamid > 0 then                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		local teamnum = GetTeamSize(varMap, varPlayer);               
		if ( teamnum ~= 1 ) then
			Msg2Player(varMap, varPlayer, "副本浮屠塔只支援单人挑战模式！", 0, 3)                                                                                                                                                                                                                                                 
			return
		end
	end    
	                                                                                                                                                                                                                                                                                            
	if ( x700121_var_KillCount[varMap] < floor( ( (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum) * 0.8 ) ) then                                                                                                 
		Msg2Player(varMap, varPlayer, "您必须击杀80%的怪兽才能进入下一层", 0, 3)                                                                                                                                                                                                                                            
		return                                                                                                                                                                                                                                                                                                              
	end                                                                                                                                                                                                                                                                                                                     
	if ( TheMonster.bossMonsterType[1] ~= nil and x700121_var_IsNeedKillBoss[varMap] == 1 and x700121_var_KillBoss[varMap] <= 0 ) then                                                                                                                                                                                                                                  
		Msg2Player(varMap, varPlayer, "您必须击杀此层的守关头领才能进入下一层", 0, 3)                                                                                                                                                                                                                                           
		return                                                                                                                                                                                                                                                                                                              
	end                                                                                                                                                                                                                                                                                                                     
	local humancount = GetFuben_PlayerCount(varMap);                                                                                                                                                                                                                                                                        
	if ( humancount > 1 ) then                                                                                                                                                                                                                                                                                              
		Msg2Player(varMap, varPlayer, "副本浮屠塔只支援单人挑战模式！", 0, 3)                                                                                                                                                                                                                                                 
		return                                                                                                                                                                                                                                                                                                                
	end                                                                                                                                                                                                                                                                                                                     
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	local nLoopCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])                                                                                                                                                                                         
	if loopCount < getn(x700121_var_MonsterType) and loopCount > nLoopCount then                                                                                                                                                                                                                                          
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3], loopCount)                                                                                                                                                                                               
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	                                                                                                                                                                                                                                                                                                                        
	if ( loopCount < getn(x700121_var_MonsterType) ) then  
		WriteLog(1, "x700121_ProcQuestAccept：Guid ============== "..GetGUID(varMap, varPlayer)..", loopCount ============== "..loopCount..", x700121_var_loopFlag[varMap] ============== "..x700121_var_loopFlag[varMap])
		if x700121_var_loopFlag[varMap] == 0 then                                                                                                                                                                                                                                                                
			SetFubenData_Param(varMap, x700121_CSP_LOOPINDEX, loopCount+1)
			x700121_var_loopFlag[varMap] = 1
			WriteLog(1, "x700121_ProcQuestAccept：Guid ============== "..GetGUID(varMap, varPlayer)..", x700121_var_loopFlag[varMap] has been Changed")                                                                                                                                                                                                                                                        
		end
		LuaCallNoclosure(700081, "NextLoopFuben", varMap, varPlayer, x700121_var_FileId)                                                                                                                                                                                                                                   
	end
	
end                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                            
function x700121_ProcFubenSceneCreated( varMap )
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	SetFubenData_Param(varMap, x700121_CSP_CURRENTSTEP, 1)                                                                                                                                                                                                                                                                    
	SetFubenData_Param(varMap, x700121_CSP_BOSS_ID, -2)                                                                                                                                                                                                                                                                       
	SetFubenData_Param(varMap, x700121_CSP_MONSTER_COUNT, 0)                                                                                                                                                                                                                                                                  
	SetFubenData_Param(varMap, x700121_CSP_XIANJINBOSS, -1 )                                                                                                                                                                                                                                                                  
	SetFubenData_Param(varMap, x700121_CSP_ZHANCHE, -1)                                                                                                                                                                                                                                                                       
	                                                                                                                                                                                                                                                                                                                          
	--开始创建                                                                                                                                                                                                                                                                                                                
	local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)--环数                                                                                                                                                                                                                                                 
	                                                                                                                                                                                                                                                                                                                          
	WriteLog(1, "loopCount ============== "..loopCount)                                                                                                                                                                                                                                                                       
	                                                                                                                                                                                                                                                                                                                          
	if ( loopCount < 1 or loopCount > getn(x700121_var_MonsterType) ) then                                                                                                                                                                                                                                                    
		loopCount = 1                                                                                                                                                                                                                                                                                                           
	end                                                                                                                                                                                                                                                                                                                       
	                                                                                                                                                                                                                                                                                                                          
	WriteLog(1, "realLoopCount ============== "..loopCount)                                                                                                                                                                                                                                                                   
	                                                                                                                                                                                                                                                                                                                          
	local TheMonster = 0                                                                                                                                                                                                                                                                                                      
	for i, monster in x700121_var_MonsterType do                                                                                                                                                                                                                                                                              
		if ( monster.level == loopCount ) then
			TheMonster = monster
			break               
		end                   
	end
	
	x700121_var_KillCount[varMap] = 0
	x700121_var_KillBoss[varMap] = 0
	
	local humancount = GetFuben_PlayerCount(varMap);	
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i);
		if ( x700121_var_IsNeedKillBoss[varMap] == 0 ) then
			SyncMonsterCountInfo(varMap, humanId, (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum, 0, loopCount, 0, 0) --显示怪物数量
		elseif ( x700121_var_IsNeedKillBoss[varMap] == 1 ) then
			SyncMonsterCountInfo(varMap, humanId, (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum, 0, loopCount, 1, 0) --显示怪物数量
		end
		WriteLog(1, "x700121_ProcFubenSceneCreated：Guid ============== "..GetGUID(varMap, humanId)..", 开始创建流程")
	end
      
	--创建怪物              
	x700121_CreateMonsters(varMap, loopCount)
	
	--创建采集点            
	x700121_CreateCaiJi(varMap, loopCount)
	
	--创建NPC
	x700121_CreateNPC(varMap)

end

function x700121_ShowUI( varMap, varPlayer )
	local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)--环数
	if ( loopCount < 1 or loopCount > getn(x700121_var_MonsterType) ) then
		return
	end
	
	local TheMonster = 0
	for i, monster in x700121_var_MonsterType do
		if ( monster.level == loopCount ) then
			TheMonster = monster
			break               
		end                   
	end
	
	local level = GetLevel( varMap, varPlayer )
	local loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
	
	x700121_var_IsNeedKillBoss[varMap] = 0
	if ( loopCount > loopMax and loopCount >= level - 22 and TheMonster.bossMonsterType[1] ~= nil ) then
		x700121_var_IsNeedKillBoss[varMap] = 1
	end 
	
	--if ( x700121_var_KillCount[varMap] ~= nil ) then
		if ( x700121_var_IsNeedKillBoss[varMap] == 0 ) then
			SyncMonsterCountInfo(varMap, varPlayer, (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum, 0, loopCount, 0, 0) --显示怪物数量
		elseif ( x700121_var_IsNeedKillBoss[varMap] == 1 ) then
			SyncMonsterCountInfo(varMap, varPlayer, (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum, 0, loopCount, 1, 0) --显示怪物数量
		end
	--end
	
end

--创建怪物                
function x700121_CreateMonsters( varMap, loopCount )
                          
	local monsterTab = {}   
	local monsterTabNum = 0 
	local varAI
	local varName
	local varIndex = 1
	                        
	--创建普通怪物          
	local TheMonster = 0
	for i, monster in x700121_var_MonsterType do
		if ( monster.level == loopCount ) then
			TheMonster = monster
			break               
		end                   
	end                     
                        
	for i=1, getn(TheMonster.normalMonsterType) do
		local X = 0           
		local Y = 0           
		if ( i <= getn(x700121_var_MonsterZuoBiao) ) then
			local randomNormalMonster = random(1,getn(x700121_var_MonsterZuoBiao[i]))
			X = x700121_var_MonsterZuoBiao[i][randomNormalMonster].x
			Y = x700121_var_MonsterZuoBiao[i][randomNormalMonster].y
			monsterTabNum = monsterTabNum + 1
			monsterTab[monsterTabNum] = {}
			monsterTab[monsterTabNum].area = i
			monsterTab[monsterTabNum].place = randomNormalMonster
			monsterTab[monsterTabNum].bigMonsterType = i
			monsterTab[monsterTabNum].bigMonsterCount = 0
			monsterTab[monsterTabNum].bossMonsterCount = 0
		else                  
			local randomWhichArea = 0
			local randomNormalMonster = 0
			local isOK = 0
			while ( isOK == 0 ) do
				randomWhichArea = random(1,getn(x700121_var_MonsterZuoBiao))
				randomNormalMonster = random(1,getn(x700121_var_MonsterZuoBiao[randomWhichArea]))
				isOK = 1    
				for j=1, getn(monsterTab) do
					if ( monsterTab[j].area == randomWhichArea and monsterTab[j].place == randomNormalMonster ) then
						isOK = 0          
					end               
				end 
			end  
			X = x700121_var_MonsterZuoBiao[randomWhichArea][randomNormalMonster].x
			Y = x700121_var_MonsterZuoBiao[randomWhichArea][randomNormalMonster].y           
			if ( isOK == 1 ) then
				monsterTabNum = monsterTabNum + 1
				monsterTab[monsterTabNum] = {}
				monsterTab[monsterTabNum].area = randomWhichArea
				monsterTab[monsterTabNum].place = randomNormalMonster
				monsterTab[monsterTabNum].bigMonsterType = i
				monsterTab[monsterTabNum].bigMonsterCount = 0
				monsterTab[monsterTabNum].bossMonsterCount = 0
			end                 
		end                   
		for j=1, TheMonster.normalMonsterNum1 do
			local pianyiX = 0   
			local pianyiY = 0   
			local randomPianYi = random(1,4)
			if ( randomPianYi == 1 ) then
				pianyiX = random(-10,-5)
				pianyiY = random(-10,-5)
			elseif ( randomPianYi == 2 ) then
				pianyiX = random(-10,-5)
				pianyiY = random(5,10)
			elseif ( randomPianYi == 3 ) then
				pianyiX = random(5,10)
				pianyiY = random(-10,-5)
			elseif ( randomPianYi == 4 ) then
				pianyiX = random(5,10)
				pianyiY = random(5,10)
			end 
			varAI = -1
			varName = ""
			if ( random(1,100) <= 42 ) then
				varIndex = random(1,getn(x700121_var_MonsterAI[1]))
				varAI = x700121_var_MonsterAI[1][varIndex].AI
				varName = x700121_var_MonsterAI[1][varIndex].name.." "
			end           
			CreateMonster(varMap, TheMonster.normalMonsterType[i][1], X+pianyiX, Y+pianyiY, 0, varAI, x700121_var_FileId, -1, 21, -1, 0, "", varName.."", -1)
		end                   
		for j=1, TheMonster.normalMonsterNum2 do
			varAI = 2
			varName = ""
			if ( random(1,100) <= 42 ) then
				varIndex = random(1,getn(x700121_var_MonsterAI[2]))
				varAI = x700121_var_MonsterAI[2][varIndex].AI
				varName = x700121_var_MonsterAI[2][varIndex].name.." "
			end        
			CreateMonster(varMap, TheMonster.normalMonsterType[i][2], X+random(-5,5), Y+random(-5,5), 0, varAI, x700121_var_FileId, -1, 21, -1, 0, "", varName.."", -1)
		end                   
	end                     
	                        
	--创建精英怪物          
	for i=1, TheMonster.bigMonsterNum do
		if ( random(1,100) <= 100 ) then
			local randomBigMonster = random(1,getn(monsterTab))
			local perCount = 0  
			while ( monsterTab[randomBigMonster].bigMonsterCount >= 5 and perCount <= 10 ) do
				randomBigMonster = random(1,(getn(monsterTab)))
				perCount = perCount + 1
			end                 
			if ( monsterTab[randomBigMonster].bigMonsterCount < 5 ) then
				local perRandom = random(1,getn(TheMonster.bigMonsterType[monsterTab[randomBigMonster].bigMonsterType]))
				--没有配置远程怪的情况下，只在近战怪物模型中随机
				--local perRandom = 1
				if ( perRandom == 1 ) then
					varAI = -1
					varName = "#e7A7A7A"
					if ( random(1,100) <= 80 ) then
						varIndex = random(1,getn(x700121_var_MonsterAI[1]))
						varAI = x700121_var_MonsterAI[1][varIndex].AI
						varName = x700121_var_MonsterAI[1][varIndex].name.." "
					end
					CreateMonster(varMap, TheMonster.bigMonsterType[monsterTab[randomBigMonster].bigMonsterType][perRandom], x700121_var_MonsterZuoBiao[monsterTab[randomBigMonster].area][monsterTab[randomBigMonster].place].x+random(-5,5), x700121_var_MonsterZuoBiao[monsterTab[randomBigMonster].area][monsterTab[randomBigMonster].place].y+random(-5,5), 0, varAI, x700121_var_FileId, -1, 21, -1, 0, "", varName.."#S精英", -1)
				elseif ( perRandom == 2 ) then
					varAI = 2
					varName = "#e7A7A7A"
					if ( random(1,100) <= 80 ) then
						varIndex = random(1,getn(x700121_var_MonsterAI[2]))
						varAI = x700121_var_MonsterAI[2][varIndex].AI
						varName = x700121_var_MonsterAI[2][varIndex].name.." "
					end
					CreateMonster(varMap, TheMonster.bigMonsterType[monsterTab[randomBigMonster].bigMonsterType][perRandom], x700121_var_MonsterZuoBiao[monsterTab[randomBigMonster].area][monsterTab[randomBigMonster].place].x+random(-5,5), x700121_var_MonsterZuoBiao[monsterTab[randomBigMonster].area][monsterTab[randomBigMonster].place].y+random(-5,5), 0, varAI, x700121_var_FileId, -1, 21, -1, 0, "", varName.."#S精英", -1)
				end
				--CreateMonster(varMap, TheMonster.bigMonsterType[monsterTab[randomBigMonster].bigMonsterType][perRandom], x700121_var_MonsterZuoBiao[monsterTab[randomBigMonster].area][monsterTab[randomBigMonster].place].x+random(-5,5), x700121_var_MonsterZuoBiao[monsterTab[randomBigMonster].area][monsterTab[randomBigMonster].place].y+random(-5,5), 0, -1, x700121_var_FileId, -1, 21, -1, 0, "", "#S精英", -1)
				monsterTab[randomBigMonster].bigMonsterCount = monsterTab[randomBigMonster].bigMonsterCount + 1
			end                 
		end                   
	end
	
	--创建boss     
	for i=1, TheMonster.bossMonsterNum do
		if ( random(1,100) <= 100 ) then
			local randomBossMonster = random(1,getn(monsterTab))
			local perCount = 0  
			while ( monsterTab[randomBossMonster].bossMonsterCount >= 2 and perCount <= 10 ) do
				randomBossMonster = random(1,(getn(monsterTab)))
				perCount = perCount + 1
			end                 
			if ( monsterTab[randomBossMonster].bossMonsterCount < 2 ) then
				CreateMonster(varMap, TheMonster.bossMonsterType[random(1,getn(TheMonster.bossMonsterType))], x700121_var_MonsterZuoBiao[monsterTab[randomBossMonster].area][monsterTab[randomBossMonster].place].x+random(-5,5), x700121_var_MonsterZuoBiao[monsterTab[randomBossMonster].area][monsterTab[randomBossMonster].place].y+random(-5,5), 0, -1, x700121_var_FileId, -1, 21, -1, 0, "", "#e7A7A7A#cDB00DB守关头领", -1)
				monsterTab[randomBossMonster].bossMonsterCount = monsterTab[randomBossMonster].bossMonsterCount + 1
			end                 
		end                   
	end
	    
end

--创建采集点              
function x700121_CreateCaiJi( varMap, loopCount )

	if ( random(1,100) <= 50 ) then
		return
	end
	                        
	local caiJiTab = {}     
                          
	local Power = 0         
	for i, quanzhong in x700121_var_CaiJiQuanZhong do
		Power = Power + quanzhong
	end                     
	                        
	local randomQuanZhong = random(1,Power)
	Power = 0               
	local quYuCount = 0     
	for j=1, getn(x700121_var_CaiJiQuanZhong) do
		local perPower = Power
		Power = Power + x700121_var_CaiJiQuanZhong[j]
		if ( randomQuanZhong > perPower and randomQuanZhong <= Power ) then
			quYuCount = j       
			break               
		end                   
	end                     
	                        
	for k=1, quYuCount do   
		caiJiTab[k] = {}      
		caiJiTab[k].quYu = 0  
		caiJiTab[k].smallCaiJi = {}
		caiJiTab[k].middleCaiJi = {}
		caiJiTab[k].bigCaiJi = {}
		                      
		local randomQuYu = random(1,getn(x700121_var_CaiJiZuoBiao))
		local isOK = 0        
		while ( isOK == 0 ) do
			isOK = 1            
			for l=1, getn(caiJiTab) do
				if ( caiJiTab[l].quYu == randomQuYu ) then
					isOK = 0        
					randomQuYu = randomQuYu + 1
					if ( randomQuYu > getn(x700121_var_CaiJiZuoBiao) ) then
						randomQuYu = 1
					end             
					break           
				end               
			end                 
		end                   
		                      
		caiJiTab[k].quYu = randomQuYu
		--WriteLog(1, "caiJiTab["..k.."].quYu == "..randomQuYu)
	end                     
	                        
	local TheCaiJi = 0      
	for i, caiji in x700121_var_CaiJiType do
		if ( caiji.level == loopCount ) then
			TheCaiJi = caiji    
			break               
		end                   
	end                     
	 
	--local zanshijishu = 1                       
	WriteLog(1, "----------Small-----------")
	--普通采集点            
	local isHasCaiJiTab = {}
	for j=1, getn(caiJiTab) do
		isHasCaiJiTab[j] = j  
	end                     
	                        
	local smallCaiJiCount = 0
	while ( smallCaiJiCount < TheCaiJi.caijiType[3].count ) do
		local perCreateCaiJiCount = 0
		perCreateCaiJiCount = TheCaiJi.caijiType[3].count - smallCaiJiCount
		if ( perCreateCaiJiCount >= 4 ) then
			perCreateCaiJiCount = random(1,3)
		end                   
		smallCaiJiCount = smallCaiJiCount + perCreateCaiJiCount
		                      
		if ( getn(isHasCaiJiTab) ~= 0 ) then
			local randomQuYuIndex = random(1,getn(isHasCaiJiTab))
			local perCaiJiTabIndex = isHasCaiJiTab[randomQuYuIndex]
			local whichQuYu = caiJiTab[perCaiJiTabIndex].quYu
			local randomZuoBiaoIndex = 0
			                    
			for k=1, perCreateCaiJiCount do
				if ( k == 1 ) then
					randomZuoBiaoIndex = random(1,getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]))
				else              
					randomZuoBiaoIndex = randomZuoBiaoIndex + 1
					if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]) ) then
						randomZuoBiaoIndex = 1
					end             
				end               
				local isOK = 0    
				while ( isOK == 0 ) do
					isOK = 1        
					for i, zuobiao in caiJiTab[perCaiJiTabIndex].smallCaiJi do
						if ( zuobiao == randomZuoBiaoIndex ) then
							randomZuoBiaoIndex = randomZuoBiaoIndex + 1
							if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]) ) then
								randomZuoBiaoIndex = 1
							end         
							isOK = 0
							break      
						end           
					end             
				end               
				local perCount = getn(caiJiTab[perCaiJiTabIndex].smallCaiJi)
				caiJiTab[perCaiJiTabIndex].smallCaiJi[perCount+1] = randomZuoBiaoIndex
				--WriteLog(1, "["..zanshijishu.."]".."quyu1 == "..whichQuYu.." index == "..randomZuoBiaoIndex)
				--zanshijishu = zanshijishu + 1
				ItemBoxEnterScene(x700121_var_CaiJiZuoBiao[whichQuYu][3][randomZuoBiaoIndex][1], x700121_var_CaiJiZuoBiao[whichQuYu][3][randomZuoBiaoIndex][2], TheCaiJi.caijiType[3].type[random(1,getn(TheCaiJi.caijiType[3].type))], varMap, 1, 10309999)
			end                 
			                    
			local perTab = {}   
			local perCount = 1  
			for l=1, getn(isHasCaiJiTab) do
				if ( l ~= randomQuYuIndex ) then
					perTab[perCount] = isHasCaiJiTab[l]
					perCount = perCount + 1
				end               
			end                 
			isHasCaiJiTab = perTab
			                    
		else                  
			local randomQuYuIndex = random(1,getn(caiJiTab))
			local whichQuYu = caiJiTab[randomQuYuIndex].quYu	
			local isOK = 0      
			local perCount = 0  
			while ( isOK == 0 and perCount <= getn(caiJiTab) ) do
				isOK = 1          
				perCount = perCount + 1
				if ( getn(caiJiTab[randomQuYuIndex].smallCaiJi) + perCreateCaiJiCount > getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]) ) then
					randomQuYuIndex = randomQuYuIndex + 1
					if ( randomQuYuIndex > getn(caiJiTab) ) then
						randomQuYuIndex = 1
					end             
					whichQuYu = caiJiTab[randomQuYuIndex].quYu
					isOK = 0                   
				end               
			end                   
			if ( perCount <= getn(caiJiTab) ) then  	                
				local randomZuoBiaoIndex = 0
				for k=1, perCreateCaiJiCount do
					if ( k == 1 ) then
						randomZuoBiaoIndex = random(1,getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]))
					else              
						randomZuoBiaoIndex = randomZuoBiaoIndex + 1
						if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]) ) then
							randomZuoBiaoIndex = 1
						end             
					end               
					isOK = 0          
					while ( isOK == 0 ) do
						isOK = 1        
						for i, zuobiao in caiJiTab[randomQuYuIndex].smallCaiJi do
							if ( zuobiao == randomZuoBiaoIndex ) then
								randomZuoBiaoIndex = randomZuoBiaoIndex + 1
								if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][3]) ) then
									randomZuoBiaoIndex = 1
								end         
								isOK = 0    
								break       
							end           
						end             
					end               
					perCount = getn(caiJiTab[randomQuYuIndex].smallCaiJi)
					caiJiTab[randomQuYuIndex].smallCaiJi[perCount+1] = randomZuoBiaoIndex
					--WriteLog(1, "["..zanshijishu.."]".."quyu2 == "..whichQuYu.." index == "..randomZuoBiaoIndex)
					--zanshijishu = zanshijishu + 1
					ItemBoxEnterScene(x700121_var_CaiJiZuoBiao[whichQuYu][3][randomZuoBiaoIndex][1], x700121_var_CaiJiZuoBiao[whichQuYu][3][randomZuoBiaoIndex][2], TheCaiJi.caijiType[3].type[random(1,getn(TheCaiJi.caijiType[3].type))], varMap, 1, 10309999)
				end                 
			end                    
		end                   
	end                     
	               
	--zanshijishu = 1         
	WriteLog(1, "----------Middle-----------")
	--优质采集点            
	local middleCaiJiCount = 0
	while ( middleCaiJiCount < TheCaiJi.caijiType[2].count ) do
		local perCreateCaiJiCount = 0
		perCreateCaiJiCount = TheCaiJi.caijiType[2].count - middleCaiJiCount
		if ( perCreateCaiJiCount >= 3 ) then
			perCreateCaiJiCount = random(1,2)
		end                   
		middleCaiJiCount = middleCaiJiCount + perCreateCaiJiCount
		                      
		if ( random(1,100) <= 50 ) then
			local randomQuYuIndex = random(1,getn(caiJiTab))
			local whichQuYu = caiJiTab[randomQuYuIndex].quYu	
			local isOK = 0      
			local perCount = 0  
			while ( isOK == 0 and perCount <= getn(caiJiTab) ) do
				isOK = 1          
				perCount = perCount + 1
				if ( getn(caiJiTab[randomQuYuIndex].middleCaiJi) + perCreateCaiJiCount > getn(x700121_var_CaiJiZuoBiao[whichQuYu][2]) ) then
					randomQuYuIndex = randomQuYuIndex + 1
					if ( randomQuYuIndex > getn(caiJiTab) ) then
						randomQuYuIndex = 1
					end             
					whichQuYu = caiJiTab[randomQuYuIndex].quYu
					isOK = 0           
				end               
			end                 
			                    
			if ( perCount <= getn(caiJiTab) ) then                
				local randomZuoBiaoIndex = 0
				for k=1, perCreateCaiJiCount do
					if ( k == 1 ) then
						randomZuoBiaoIndex = random(1,getn(x700121_var_CaiJiZuoBiao[whichQuYu][2]))
					else              
						randomZuoBiaoIndex = randomZuoBiaoIndex + 1
						if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][2]) ) then
							randomZuoBiaoIndex = 1
						end             
					end               
					isOK = 0          
					while ( isOK == 0 ) do
						isOK = 1        
						for i, zuobiao in caiJiTab[randomQuYuIndex].middleCaiJi do
							if ( zuobiao == randomZuoBiaoIndex ) then
								randomZuoBiaoIndex = randomZuoBiaoIndex + 1
								if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][2]) ) then
									randomZuoBiaoIndex = 1
								end         
								isOK = 0    
								break       
							end           
						end             
					end               
					perCount = getn(caiJiTab[randomQuYuIndex].middleCaiJi)
					caiJiTab[randomQuYuIndex].middleCaiJi[perCount+1] = randomZuoBiaoIndex
					--WriteLog(1, "["..zanshijishu.."]".."quyu == "..whichQuYu.." index == "..randomZuoBiaoIndex)
					--zanshijishu = zanshijishu + 1
					ItemBoxEnterScene(x700121_var_CaiJiZuoBiao[whichQuYu][2][randomZuoBiaoIndex][1], x700121_var_CaiJiZuoBiao[whichQuYu][2][randomZuoBiaoIndex][2], TheCaiJi.caijiType[2].type[random(1,getn(TheCaiJi.caijiType[2].type))], varMap, 1, 10309999)
				end 
			end                
		end                   
	end                     
	
	--zanshijishu = 1                      
	WriteLog(1, "----------Big-----------")
	--完美采集点            
	local bigCaiJiCount = 0 
	while ( bigCaiJiCount < TheCaiJi.caijiType[1].count ) do
		local perCreateCaiJiCount = 0
		perCreateCaiJiCount = TheCaiJi.caijiType[1].count - bigCaiJiCount
		if ( perCreateCaiJiCount >= 1 ) then
			perCreateCaiJiCount = 1
		end                   
		bigCaiJiCount = bigCaiJiCount + perCreateCaiJiCount
		                      
		if ( random(1,100) <= 20 ) then
			local randomQuYuIndex = random(1,getn(caiJiTab))
			local whichQuYu = caiJiTab[randomQuYuIndex].quYu	
			local isOK = 0      
			local perCount = 0  
			while ( isOK == 0 and perCount <= getn(caiJiTab) ) do
				isOK = 1          
				perCount = perCount + 1
				if ( getn(caiJiTab[randomQuYuIndex].bigCaiJi) + perCreateCaiJiCount > getn(x700121_var_CaiJiZuoBiao[whichQuYu][1]) ) then
					randomQuYuIndex = randomQuYuIndex + 1
					if ( randomQuYuIndex > getn(caiJiTab) ) then
						randomQuYuIndex = 1
					end             
					whichQuYu = caiJiTab[randomQuYuIndex].quYu
					isOK = 0                  
				end               
			end                 
			                    
			if ( perCount <= getn(caiJiTab) ) then                               
				local randomZuoBiaoIndex = 0
				for k=1, perCreateCaiJiCount do
					if ( k == 1 ) then
						randomZuoBiaoIndex = random(1,getn(x700121_var_CaiJiZuoBiao[whichQuYu][1]))
					else              
						randomZuoBiaoIndex = randomZuoBiaoIndex + 1
						if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][1]) ) then
							randomZuoBiaoIndex = 1
						end             
					end               
					isOK = 0          
					while ( isOK == 0 ) do
						isOK = 1        
						for i, zuobiao in caiJiTab[randomQuYuIndex].bigCaiJi do
							if ( zuobiao == randomZuoBiaoIndex ) then
								randomZuoBiaoIndex = randomZuoBiaoIndex + 1
								if ( randomZuoBiaoIndex > getn(x700121_var_CaiJiZuoBiao[whichQuYu][1]) ) then
									randomZuoBiaoIndex = 1
								end         
								isOK = 0    
								break       
							end           
						end             
					end               
					perCount = getn(caiJiTab[randomQuYuIndex].bigCaiJi)
					caiJiTab[randomQuYuIndex].bigCaiJi[perCount+1] = randomZuoBiaoIndex
					--WriteLog(1, "["..zanshijishu.."]".."quyu == "..whichQuYu.." index == "..randomZuoBiaoIndex)
					--zanshijishu = zanshijishu + 1
					ItemBoxEnterScene(x700121_var_CaiJiZuoBiao[whichQuYu][1][randomZuoBiaoIndex][1], x700121_var_CaiJiZuoBiao[whichQuYu][1][randomZuoBiaoIndex][2], TheCaiJi.caijiType[1].type[random(1,getn(TheCaiJi.caijiType[1].type))], varMap, 1, 10309999)
				end  
			end               
		end                   
	end                     
	                        
end

function x700121_CreateNPC( varMap )
	local humancount = GetFuben_PlayerCount(varMap);	
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i);
		WriteLog(1, "x700121_CreateNPC：Guid ============== "..GetGUID(varMap, humanId)..", 创建NPC")
	end

	for i, npc in x700121_var_NPC do
		CreateMonster(varMap, npc.type, npc.x, npc.z, 3, -1, -1, npc.guid, 20, -1, npc.facedir, npc.name, npc.title, -1)
	end
end

function x700121_CreateGuanQiaSkillBox( varMap, varPlayer )
	
	local theSkill = 0
	
	local mainPercent = 0
	for i, item in x700121_var_GuanQiaSkillBox do
		mainPercent = mainPercent + item.percent
	end
	
	if ( mainPercent <= 0 ) then
		return
	end
	
	local varPercent = 0
	local varRand = random(1, mainPercent)
	for i, item in x700121_var_GuanQiaSkillBox do
		if ( varRand <= varPercent + item.percent ) then
			theSkill = item
			break
		end
		varPercent = varPercent + item.percent
	end
	
	--theSkill = x700121_var_GuanQiaSkillBox[3]
	
	local varX,varZ = GetWorldPos( varMap, varPlayer )
	local monsterId = CreateMonster( varMap, theSkill.type, varX, varZ, 3, -1, x700121_var_FileId, -1, 20, 20000, 0, theSkill.name, "", -1 )
	SendSpecificImpactToUnit( varMap, monsterId, monsterId, monsterId, theSkill.buff, 0 )
	
end

----------------------------------------------------------------------------------------------
-- buff 98 在x700121_OnImpactActiveOnce之前在脚本中检测 当前的目标玩家是否可以被激活
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj 
-- 参数：varMap -- 目标玩家ID 
-- 返回值 0 当前目标玩家不可以被处理，1则可以
----------------------------------------------------------------------------------------------
function x700121_CheckImpackScriptIsCanDoByScript( varMap, varPlayer, targetId )
	if ( IsHaveSpecificImpact(varMap, varPlayer, 32706) == 0 ) then
		return 1
	end
	return 0
end

--------------------------------------------------------------------------------------------------------
-- buff 98 激活时处理
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj 
-- 参数：varMap -- 目标玩家ID 
--------------------------------------------------------------------------------------------------------
function x700121_OnImpactActiveOnce( varMap, varPlayer, targetId )

	local perType = GetMonsterDataID( varMap, varPlayer )
	for i, item in x700121_var_GuanQiaSkillBox do
		if ( item.type == perType ) then
			if ( IsHaveSpecificImpact(varMap, varPlayer, 32706) == 0 ) then
				SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 32706, 0 )
				if ( i == 1 ) then
					if ( GetGuanQiaSpellCount( varMap, targetId ) < 6 ) then
						local varIndex = random(1,getn(item.skill))
						local varSkill = item.skill[varIndex]
						local varCount = 1
						while ( HaveGuanQiaSpell( varMap, targetId, varSkill ) == 1 and varCount <= getn(item.skill) ) do
							varCount = varCount + 1
							if ( varIndex < getn(item.skill) ) then
								varIndex = varIndex + 1
							else
								varIndex = 1
							end
							varSkill = item.skill[varIndex]
						end
						AddFubenGuanQiaSpellToPlayer(varMap, targetId, 533, varSkill, 3)
					else
						AddFubenGuanQiaSpellToPlayer(varMap, targetId, 533, item.skill[random(1,getn(item.skill))], 3)
					end
				elseif ( i == 2 ) then
					local level = GetLevel( varMap, targetId )
					local varIndex = random(1,getn(item.skill))
					local varNum = 1
					
					if ( level >= 1 and level < 10 ) then
						varNum = 1
					elseif ( level >= 10 and level < 20 ) then
						varNum = 2
					elseif ( level >= 20 and level < 30 ) then
						varNum = 3
					elseif ( level >= 30 and level < 40 ) then
						varNum = 4
					elseif ( level >= 40 and level < 50 ) then
						varNum = 5
					elseif ( level >= 50 and level < 60 ) then
						varNum = 6
					elseif ( level >= 60 and level < 70 ) then
						varNum = 7
					elseif ( level >= 70 and level < 73 ) then
						varNum = 8
					elseif ( level >= 73 and level < 93 ) then
						varNum = 9
					elseif ( level >= 93 ) then
						varNum = 10
					end
					
					local isOK = 1
					for i=varNum, 10 do
						if ( IsHaveSpecificImpact(varMap, targetId, x700121_var_HuChiBuff[varIndex][i]) == 1 ) then
							isOK = 0
						end
					end
					
					SendSpecificImpactToUnit( varMap, targetId, targetId, targetId, item.skill[varIndex].effectBuff, 0 )
					
					if ( isOK == 1 ) then
						SendSpecificImpactToUnit( varMap, targetId, targetId, targetId, item.skill[varIndex].buff[varNum], 0 )
					end
				elseif ( i == 3 ) then 
					local varIndex = random(1,getn(item.skill))
					--varIndex = 1
					
					if ( item.skill[varIndex].type == 1 ) then
						SendSpecificImpactToUnit( varMap, targetId, targetId, targetId, item.skill[varIndex].effectBuff, 0 )
						local perNum =  GetNearObjCount( varMap, targetId, 10, 0, 0 )
						
						if perNum > 0 then
							for	varI=0, perNum-1 do
								local member = GetNearMonster( varMap, targetId, varI )
								if IsObjValid ( varMap, member ) == 1 then
									local ObjType = GetObjType( varMap, member )
									local Camp = GetMonsterCamp( varMap, member )
									if ( member ~= -1 and ObjType == 2 and Camp == 21 ) then
										SendSpecificImpactToUnit( varMap, targetId, targetId, member, item.skill[varIndex].buff, 0 )
									end
								end
							end
						end
					elseif ( item.skill[varIndex].type == 2 ) then
						SendSpecificImpactToUnit( varMap, targetId, targetId, targetId, item.skill[varIndex].buff, 0 )
					end
					
				end
			end
		end
	end

end

----------------------------------------------------------------------------------------------
-- buff 98 消失时的处理 在98号逻辑下buff生效次数用完后buff消失进入此接口
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj  
-- 参数：targetId -- 目标玩家ID 
----------------------------------------------------------------------------------------------
function x700121_OnImpactFadeOut( varMap, varPlayer ,targetId )
	--if IsObjValid( varMap, varPlayer ) == 1 then
	--	DeleteMonsterEx( varMap, varPlayer )
	--end
end

function x700121_OnRecycle( varMap, varPlayer, targetId, growType, itemId )
	
	local varItem = 0
	local TheGrowType = x700121_var_CaiJiType[1].caijiType
	for i=1, getn(TheGrowType) do
		for j, grow in TheGrowType[i].type do	
			if ( growType == grow ) then
				if ( i == 1 ) then
					varItem = x700121_var_GuanZiId[3].itemId             
				elseif ( i == 2 ) then  
					varItem = x700121_var_GuanZiId[2].itemId             
				elseif ( i == 3 ) then  
					varItem = x700121_var_GuanZiId[1].itemId
				end               
			end                 
		end                   
	end
		
	StartItemTask( varMap )
		ItemAppendBind( varMap, varItem, 1 )
	local ret = StopItemTask(varMap, varPlayer)
	if ret > 0 then
		Msg2Player( varMap, varPlayer, "获得了@item_"..varItem, 8, 3 )
		DeliverItemListSendToPlayer(varMap,varPlayer)
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	               
end

function x700121_CreateItemToBag( varMap, varPlayer, varBagIdx, itemId )
	for i, item in x700121_var_GuanZiId do
		if ( itemId == item.itemId ) then
			x700121_DiaoLuo( varMap, varPlayer, varBagIdx, random(item.countMin, item.countMax) )
			break
		end
	end
	
end

function x700121_DiaoLuo( varMap, varPlayer, varBagIdx, count )

	local TheItem = {}
	
	local mainPercent = 0
	for i, item in x700121_var_CaiJiItem do
		mainPercent = mainPercent + item.percent
	end
	
	if ( mainPercent <= 0 ) then
		return
	end
	
	local percount = 0
	for j=1, count do
		local varPercent = 0
		local varRand = random(1, mainPercent)
		for i, item in x700121_var_CaiJiItem do
			if ( varRand <= varPercent + item.percent ) then
				if ( item.itemId ~= 0 ) then
					percount = percount + 1
					TheItem[percount] = item.itemId
				end
				break
			end
			varPercent = varPercent + item.percent
		end
	end
	
	if ( getn(TheItem) ~= 0 ) then
		StartItemTask( varMap )
			for j=1, getn(TheItem) do
				ItemAppendBind( varMap, TheItem[j], 1 )
			end
		local ret = StopItemTask(varMap, varPlayer)
		if ret > 0 then
			if( DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1 ) == 1 ) then
				
				for i, item in TheItem do
					for j, ite in x700121_var_CaiJiItem do
						if ( item == ite.itemId ) then
							Msg2Player( varMap, varPlayer, "获得了@item_"..ite.itemId, 8, 3 )
							if ( ite.gonggao ~= nil and ite.gonggao == 1 ) then
								local playerName = GetName( varMap, varPlayer )	
								LuaAllScenceM2Wrold(varMap, playerName.."从浮屠塔的罐子中得到了"..ite.name, CHAT_MAIN_RIGHTDOWN, 1)
							end
							break
						end
					end
				end
				
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"使用物品异常！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足！")	
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		if( DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1 ) == 1 ) then
			Msg2Player( varMap, varPlayer, "罐子里除了板砖什么也没有", 8, 3 )
		end
	end
	
end

function x700121_DaiShua( varMap, varPlayer, startLoop, endLoop, varFlag )

	if GetGameOpenById( 1100 ) <= 0 then
		return
	end

	--\Share\LuaScript\common\fuben\fuben_dadu_fututadaishua.lua
	LuaCallNoclosure(700130, "ReturnDaiShua", varMap, varPlayer)
	local VarDaiShua = x700130_var_DaiShua

	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3])
	
	--获取VIP等级
	local nItemID, nItemNum, vipLevel = GetPeerVipInfo(varMap, varPlayer, 1)
	local perCountXianZhi = 2
	local perFreeCountXianZhi = 1
	--LuaCallNoclosure(700121, "ReturnFuTuTa", varMap, varPlayer)
	for i, item in x700121_var_VIP do
		if ( vipLevel == item.vipLevel ) then
			perCountXianZhi = item.countXianZhi
			perFreeCountXianZhi = item.freeCountXianZhi
		end
	end
	
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3], perFreeCountXianZhi)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], 1)
	end
	
	local futuCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3])
	local countXianZhi = perCountXianZhi
	
	if ( futuCount >= countXianZhi ) then
		Msg2Player( varMap, varPlayer, "每天最多只能进行"..countXianZhi.."次【个人】浮屠塔", 8, 3 )		
		return   
	end
	countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
	if ( futuCount >= countXianZhi ) then
		Msg2Player( varMap, varPlayer, "每天只能进行"..perFreeCountXianZhi.."次免费【个人】浮屠塔，您可以在主介面中选择增加次数", 8, 3 )		
		return   
	end
	
	local currentLoop = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3])
	local loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
	
	--WriteLog(1, "varPlayer == "..varPlayer)
	--WriteLog(1, "startLoop == "..startLoop)
	--WriteLog(1, "endLoop == "..endLoop)
	--WriteLog(1, "daishua_currentLoop == "..currentLoop)
	--WriteLog(1, "daishua_loopMax == "..loopMax)       
	
	if (IsHaveSpecificImpact(varMap, varPlayer, 32702) ~= 0) then                                                                                                                                                                                                                                                           
		Msg2Player( varMap, varPlayer, "在冷却时间内不能使用相关功能", 8, 3 )		
		return                                                                                                                                                                                                                                                                       
	end
	
	if ( currentLoop > getn(VarDaiShua) ) then
		Msg2Player( varMap, varPlayer, "当前层数已经是最高层，无法使用自动代刷功能", 8, 3 )		
		return	
	end
	
	if ( currentLoop > loopMax ) then
		Msg2Player( varMap, varPlayer, "当前层数需要手动挑战过关，才能使用自动代刷功能", 8, 3 )		
		return	
	end
	
	if ( startLoop < currentLoop or endLoop > loopMax ) then	
		return
	end
	
	if ( startLoop > endLoop ) then
		Msg2Player( varMap, varPlayer, "所选起始层数必须小于结束层数", 8, 3 )		
		return
	end
	
	if ( startLoop < 0 or endLoop > getn(VarDaiShua) ) then
		return
	end
	
	local money = 0
	local exp = 0
	for i=startLoop, endLoop do
		money = money + VarDaiShua[i].money
		exp = exp + VarDaiShua[i].exp
	end 
	
	if ( money == 0 or exp == 0 ) then
		return
	end
	
	if GetGoldMode( varMap, varPlayer ) == 1 then
		if CostMoney( varMap, varPlayer, 2, money, 20 ) == -1 then
			Msg2Player( varMap, varPlayer, "很抱歉，您身上携带的现金不够支付本次费用。", 8, 3 )		
			return
		end
	else
		if CostMoney( varMap, varPlayer, 3, money, 20 ) == -1 then
			Msg2Player( varMap, varPlayer, "很抱歉，您身上携带的金卡不够支付本次费用。", 8, 3 )
			Msg2Player( varMap, varPlayer, "如果要使用现金支付，请在背包介面中勾上优先使用现金结算。", 8, 3 )
			return
		end
	end
	
	GamePlayScriptLog(varMap, varPlayer, 11086)
	
	local TheKaForm = {}
	--获取卡牌
	for i=startLoop, endLoop do
		local TheDaiShua = VarDaiShua[i]
		
		local TheBaiKa = TheDaiShua.baika
		TheKaForm = x700121_DaiShuaItem( TheKaForm, TheBaiKa )
		local TheLvKa = TheDaiShua.lvka
		TheKaForm = x700121_DaiShuaItem( TheKaForm, TheLvKa )
		local TheLanKa = TheDaiShua.lanka
		TheKaForm = x700121_DaiShuaItem( TheKaForm, TheLanKa )
		local TheHuangKa = TheDaiShua.huangka
		TheKaForm = x700121_DaiShuaItem( TheKaForm, TheHuangKa )

	end
	TheKaForm = x700121_ValueSort( TheKaForm )
	
	loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
	if ( varFlag == 0 ) then
		ShowFutuUI( varMap, varPlayer, 0, endLoop+1, loopMax, futuCount, countXianZhi )
	else
		ShowFutuUI( varMap, varPlayer, 2, endLoop+1, loopMax, futuCount, countXianZhi )
	end
	ShowFutuUI( varMap, varPlayer, 1, 45011001, exp, 2, 0 )--经验值
	AddExp( varMap, varPlayer, exp )
	for i, item in TheKaForm do 
		WriteLog(1, "["..i.."]: id == "..item.id..",value == "..item.value..",count == "..item.count)
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, item.id, item.count )

		local ret = StopItemTask(varMap,varPlayer)
		if ret > 0 then
			DeliverItemListSendToPlayer(varMap, varPlayer)
			ShowFutuUI( varMap, varPlayer, 1, item.id, item.count, 1, 0 )
		else
			ShowFutuUI( varMap, varPlayer, 1, item.id, item.count, 0, 0 )
		end
	end
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], endLoop+1)
	
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,6)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,7)
	
end

function x700121_DaiShuaItem( theForm, theKaPai )
	
	local theItemForm = theForm

	local mainPercent = 0
	for i, item in theKaPai.item do
		mainPercent = mainPercent + item.percent		
	end
	for j=1, getn(theKaPai.percent) do
		if ( random(1,1000) <= theKaPai.percent[j] ) then
			local varRandom = random(1,mainPercent)
			local perpercent = 0
			for i, item in theKaPai.item do
				if ( varRandom <= perpercent + item.percent ) then
					local isOK = 0
					for k, ite in theItemForm do
						if ( item.id == ite.id ) then
							theItemForm[k].count = theItemForm[k].count + 1
							isOK = 1
							break
						end
					end
					if ( isOK == 0 ) then
						local count = getn(theItemForm)
						theItemForm[count+1] = {}
						theItemForm[count+1].id = item.id
						theItemForm[count+1].value = item.value
						theItemForm[count+1].count = 1
					end
					break
				end
				perpercent = perpercent + item.percent
			end
		end
	end
	
	return theItemForm
	
end

function x700121_ValueSort( theForm )

	local mainForm = {}
	local mainCount = getn(theForm)
	
	for i=1, mainCount do
		mainForm[i] = {}
		
		local percount = -1
		if (getn(theForm) ~= 0) then
			percount = 1
			for j, item in theForm do
				if ( item.value > theForm[percount].value ) then
					percount = j
				elseif ( item.value == theForm[percount].value ) then
					if ( item.count > theForm[percount].count ) then
						percount = j
					end
				end
			end
		end
		
		mainForm[i].id = theForm[percount].id
		mainForm[i].value = theForm[percount].value
		mainForm[i].count = theForm[percount].count
		theForm = x700121_CleanSelect( theForm, percount )
		
	end
	
	return mainForm
	
end

function x700121_CleanSelect( theForm, count )
	
	local perform = {}
	local mainCount = getn(theForm)
	local percount = 0
	
	for i=1, mainCount do
		if ( count ~= i ) then
			percount = percount + 1
			perform[percount] = theForm[i]
		end
	end
	
	return perform
	
end

function x700121_CostClearCDMoney( varMap, varPlayer, varFlag )

	if GetGameOpenById( 1100 ) <= 0 then
		return
	end

	if IsHaveSpecificImpact(varMap, varPlayer, 32702) ~= 1 then		
		Msg2Player( varMap, varPlayer, "不需要清除冷却时间", 8, 3 )		
		return 
	end

	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3])
	
	--获取VIP等级
	local nItemID, nItemNum, vipLevel = GetPeerVipInfo(varMap, varPlayer, 1)
	local perCountXianZhi = 2
	local perFreeCountXianZhi = 1
	--LuaCallNoclosure(700121, "ReturnFuTuTa", varMap, varPlayer)
	for i, item in x700121_var_VIP do
		if ( vipLevel == item.vipLevel ) then
			perCountXianZhi = item.countXianZhi
			perFreeCountXianZhi = item.freeCountXianZhi
		end
	end
	
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3], perFreeCountXianZhi)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], 1)
	end
	
	local futuCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3])
	local countXianZhi = perCountXianZhi
	
	if ( futuCount >= countXianZhi ) then
		Msg2Player( varMap, varPlayer, "每天最多只能进行"..countXianZhi.."次【个人】浮屠塔", 8, 3 )		
		return   
	end
	countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
	if ( futuCount >= countXianZhi ) then
		Msg2Player( varMap, varPlayer, "每天只能进行"..perFreeCountXianZhi.."次免费【个人】浮屠塔，您可以在主介面中选择增加次数", 8, 3 )		
		return   
	end
	
	local money = x700121_var_ClearCDMoney
	
	if GetGoldMode( varMap, varPlayer ) == 1 then
		if CostMoney( varMap, varPlayer, 2, money, 20 ) == -1 then
			Msg2Player( varMap, varPlayer, "很抱歉，您身上携带的现金不够支付本次费用。", 8, 3 )		
			return
		end
	else
		if CostMoney( varMap, varPlayer, 3, money, 20 ) == -1 then
			Msg2Player( varMap, varPlayer, "很抱歉，您身上携带的金卡不够支付本次费用。", 8, 3 )
			Msg2Player( varMap, varPlayer, "如果要使用现金支付，请在背包介面中勾上优先使用现金结算。", 8, 3 )
			return
		end
	end
	
	GamePlayScriptLog(varMap, varPlayer, 11087)
	
	if IsHaveSpecificImpact(varMap, varPlayer, 32702) == 1 then
		CancelSpecificImpact(varMap, varPlayer, 32702)
	end
	
	local currentLoop = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3])
	local loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
	if varFlag == 0 then
		ShowFutuUI( varMap, varPlayer, 0, currentLoop, loopMax, futuCount, countXianZhi )
	else
		ShowFutuUI( varMap, varPlayer, 2, currentLoop, loopMax, futuCount, countXianZhi )
	end
	
end

function x700121_ResetLoop( varMap, varPlayer, varFlag )
	
	if ( GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3]) == 0 or GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3]) == 1 ) then
		Msg2Player( varMap, varPlayer, "当前所在层数已经为一层，不需要重置层数", 8, 3 )
		return
	end

	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], 1)                                                                                                                                                                                                                                                                                                                     
		
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3])
	
	--获取VIP等级
	local nItemID, nItemNum, vipLevel = GetPeerVipInfo(varMap, varPlayer, 1)
	local perCountXianZhi = 2
	local perFreeCountXianZhi = 1
	--LuaCallNoclosure(700121, "ReturnFuTuTa", varMap, varPlayer)
	for i, item in x700121_var_VIP do
		if ( vipLevel == item.vipLevel ) then
			perCountXianZhi = item.countXianZhi
			perFreeCountXianZhi = item.freeCountXianZhi
		end
	end
	
	local futuCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3])
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3], 1)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3], perFreeCountXianZhi)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], 1)
	else
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3], futuCount+1)
	end
	
	SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 32702, 0);
	
	local loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
	futuCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3])
	local countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
	if varFlag == 0 then
		ShowFutuUI( varMap, varPlayer, 0, 1, loopMax, futuCount, countXianZhi )
	else
		ShowFutuUI( varMap, varPlayer, 2, 1, loopMax, futuCount, countXianZhi )
	end
	
	GamePlayScriptLog(varMap, varPlayer, 11088)

end

function x700121_AddCount( varMap, varPlayer, varFlag )

	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3])
	
	--获取VIP等级
	local nItemID, nItemNum, vipLevel = GetPeerVipInfo(varMap, varPlayer, 1)
	local perCountXianZhi = 2
	local perFreeCountXianZhi = 1
	--LuaCallNoclosure(700121, "ReturnFuTuTa", varMap, varPlayer)
	for i, item in x700121_var_VIP do
		if ( vipLevel == item.vipLevel ) then
			perCountXianZhi = item.countXianZhi
			perFreeCountXianZhi = item.freeCountXianZhi
		end
	end
	
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3], perFreeCountXianZhi)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], 1)
	end
	
	local futuCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3])
	local countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
	
	if ( countXianZhi >= perCountXianZhi ) then
		Msg2Player( varMap, varPlayer, "【个人】浮屠塔今日可增加次数已达上限", 8, 3 )		
		return
	end
	
	countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
	--if ( countXianZhi > futuCount ) then
	--	Msg2Player( varMap, varPlayer, "您还有"..(countXianZhi - futuCount).."次可用，不能购买", 8, 3 )		
	--	return
	--end
	
	local money = x700121_var_AddCountMoney[countXianZhi]
	
	if GetGoldMode( varMap, varPlayer ) == 1 then
		if CostMoney( varMap, varPlayer, 2, money, 20 ) == -1 then
			Msg2Player( varMap, varPlayer, "很抱歉，您身上携带的现金不够支付本次费用。", 8, 3 )		
			return
		end
	else
		if CostMoney( varMap, varPlayer, 3, money, 20 ) == -1 then
			Msg2Player( varMap, varPlayer, "很抱歉，您身上携带的金卡不够支付本次费用。", 8, 3 )
			Msg2Player( varMap, varPlayer, "如果要使用现金支付，请在背包介面中勾上优先使用现金结算。", 8, 3 )
			return
		end
	end
	
	GamePlayScriptLog(varMap, varPlayer, 11089)
	
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3], countXianZhi+1 )
	
	local currentLoop = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3])
	local loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
	futuCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3])
	countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
	
	Msg2Player( varMap, varPlayer, "今日可用次数增加到"..countXianZhi.."次", 8, 3 )
	if varFlag == 0 then
		ShowFutuUI( varMap, varPlayer, 0, currentLoop, loopMax, futuCount, countXianZhi )
	else
		ShowFutuUI( varMap, varPlayer, 2, currentLoop, loopMax, futuCount, countXianZhi )
	end
	
end

function x700121_ProcDie(varMap, varPlayer, varKiller)

	local monsterExp = 0

	local id = GetMonsterDataID( varMap, varPlayer )
	
	local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)--环数
	local TheMonster = 0
	for i, monster in x700121_var_MonsterType do
		if ( monster.level == loopCount ) then
			TheMonster = monster
			break               
		end                   
	end    
	
	for i, item in TheMonster.normalMonsterType do
		for j, monster in item do
			if ( id == monster ) then
				monsterExp = TheMonster.exp
			end
		end
	end 
	
	for i, item in TheMonster.bigMonsterType do
		for j, monster in item do
			if ( id == monster ) then
				monsterExp = TheMonster.exp * 3
			end
		end
	end     

	if ( TheMonster.bossMonsterType[1] ~= nil and id == TheMonster.bossMonsterType[1] ) then
		x700121_var_KillBoss[varMap] = x700121_var_KillBoss[varMap] + 1
		monsterExp = TheMonster.exp * 5
	end
	
	x700121_var_KillCount[varMap] = x700121_var_KillCount[varMap] + 1
	local humancount = GetFuben_PlayerCount(varMap);	
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i);
		if ( x700121_var_IsNeedKillBoss[varMap] == 0 ) then
			SyncMonsterCountInfo(varMap, humanId, (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum, x700121_var_KillCount[varMap], loopCount, 0, 0) --显示怪物数量
		elseif ( x700121_var_IsNeedKillBoss[varMap] == 1 ) then
			SyncMonsterCountInfo(varMap, humanId, (TheMonster.normalMonsterNum1 + TheMonster.normalMonsterNum2) * getn(TheMonster.normalMonsterType) + TheMonster.bigMonsterNum + TheMonster.bossMonsterNum, x700121_var_KillCount[varMap], loopCount, 1, x700121_var_KillBoss[varMap]) --显示怪物数量
		end
	end
	
	local ObjType = GetObjType( varMap, varKiller )
	if ObjType == 3 then	-- 被PET杀死
		varKiller = GetOwnerID( varMap, varKiller )
	end
	
	monsterExp = x700121_ExpMore( varMap, varKiller, monsterExp )
	if ( monsterExp > 0 ) then
		AddExp( varMap, varKiller, monsterExp )
		AddActiveHorseExp( varMap, varKiller, monsterExp, 1 )
	end
	
	--创建关卡技能箱子
	if ( random(1,100) <= 20 ) then
		x700121_CreateGuanQiaSkillBox( varMap, varPlayer )
	end
	
end

function x700121_ExpMore(varMap, varPlayer, varExp)
	local expValue = 1
	for i, item in x700121_var_Exp do 
		if ( IsHaveSpecificImpact( varMap, varPlayer, item.buff) == 1 ) then
			expValue = expValue + item.value
		end
  end
	local suit = GetEquipExpWeight( varMap, varPlayer )
	if suit > 0 then
		expValue = expValue + (suit/100)
	end
	varExp = varExp*expValue
	
	local expParam = GetExpParam()
	if expParam > 1.0 then
		varExp = varExp * expParam
	end
	
	varExp = floor(varExp)
	
	return varExp
end

function x700121_GetLoop( varMap, varPlayer )
	return getn(x700121_var_MonsterType)
end

function x700121_GetGuanZiItemCount( varMap, varPlayer, itemId )
	for i, item in x700121_var_GuanZiId do
		if ( itemId == item.itemId ) then
			return item.countMax
		end
	end
	
end

function x700121_ProcPlayerEnter(varMap, varPlayer)
	local loopCount = GetFubenData_Param(varMap, x700121_CSP_LOOPINDEX)--环数                                                                                                                                                                                                                                                 
	                                                                                                                                                                                                                                                                                                                          
	WriteLog(1, "x700121_ProcPlayerEnter：Guid ============== "..GetGUID(varMap, varPlayer)..", loopCount ============== "..loopCount) 

	if QueryPlayerAbility(varMap, varPlayer, 22) ~= 1 then
		SetPlayerAbilityLevel(varMap, varPlayer, 22, 1)
	end
	SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 32703, 0 );
	SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 32704, 0 );
	x700121_ShowUI( varMap, varPlayer )
	x700121_var_loopFlag[varMap] = 0
	OpenGuanqiaSpellUI(varMap, varPlayer, 1)
end

function x700121_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end

function x700121_EnterTick(varMap, nowTickCount)
end

function x700121_ReturnFuTuTa( varMap, varPlayer )
end  
