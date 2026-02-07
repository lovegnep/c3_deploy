
x700081_var_FileId			=	700081

x700081_CSP_FUBENTYPE				= 0
x700081_CSP_SCRIPTID				=	1
x700081_CSP_TICKCOUNT				= 2
x700081_CSP_BACKSCENEID			= 3
x700081_CSP_ISCLOSING				= 4
x700081_CSP_LEAVECOUNTDOWN	= 5
x700081_CSP_TEAMID					=	6
x700081_CSP_TICKTIME				=	7
x700081_CSP_HOLDTIME				=	8
x700081_CSP_FUBENLEVEL			=	9

x700081_CSP_FUBEN_SCENE_ID	=	10
x700081_CSP_CLOSETICK				=	11
x700081_CSP_TICKCOUNT_ADD		=	12
x700081_CSP_TICKCOUNT_SUB		=	13
x700081_CSP_B_TOPLIST_ABLE	=	14
x700081_CSP_PLAYER_DEAD			=	15
x700081_CSP_FUBEN_KIND			=	16  
x700081_CSP_XINSHOU_FLAG		= 17  
-- 18～19为个别副本特殊标记，AreaID,AreaFlag等
-- 20到239之间为每个副本变量使用，不要动
x700081_CSP_XINSHOU_LEVEL			 = 221  
x700081_CSP_HUMAN_COUNT				 = 240
x700081_CSP_PLAYER_ENTER_START = 241 --分给副本进入状态，多少人需要连续多少个，暂时需要241-246共6个
-- 241到246之间为副本进入状态使用，不要动
x700081_CSP_LAST_TICKOUNT			 = 247
x700081_CSP_GUID_START         = 248  
-- 这中间不要动
x700081_CSP_FUBEN_TYPE				 = 254	
x700081_CSP_FUBEN_MODE				 = 255

------------ 256 ~ 384 一共128个索引给团队副本--------------
------------ 256 ~ 319 用于场景与副本交互的公共数据段-------
x700081_CSP_GROUPID						= 256  -- 团对 ID
x700081_CSP_GROUP_GUID_START  = 257  -- 257 ~ 292 位给团队副本
-- 257 ~ 292 不要动

x700081_CSP_IS_ROOM					=	293  --是否房间(跨服)
x700081_CSP_IS_ROOM_3FAN		=	294  --是否是跨服三番(跨服的第二环和第三环)
x700081_CSP_LOOPINDEX 			= 295 --浮屠塔记录层数

x700081_CSP_JINGYING_INDEX 			  = 296 --精英剧场的剧场索引
x700081_CSP_ENTER_POS_INDEX 			= 297 --精英剧场玩家进入位置的索引
-- 320～383 暂时未使用

------------------------------------------------------------
x700081_var_CreateFubenFlag = {}
x700081_var_CampDefault			  = 1 --默认的阵营(同ROOM)
x700081_var_SanfanTimes				= 3
x700081_var_ZhouSanfanTimes	  = 21
x700081_var_GuanQiaCDBuff     = 32700
x700081_var_GuanqiaBufferClearList = {	--进入退出副本时,需要清除Buffer的列表
																		 }

x700081_ChangleToggleWorld = {} --哪几个World临时开放挑战副本，如果是空则表示所有World都开启
x700081_KuanFuWorldToggle = {} --临时开放哪几个World可以跨服报名，如果是空则表示所有World都开启
x700081_noKuanFuWorldToggle = {146,4202,186,386} --哪几个服务器不开跨服
x700081_var_SearchCorpsScene = 1 --默认全场景军团成员全部传送，否则会只检查Grid范围内队员
x700081_var_SearchCorpsDefaultMode = 1 --跨服搜索默认模式(三番模式)
										 
--标识缴纳道具
x700081_var_PayForFubenFlagTbl = {}
--标识只允许在固定点复活的脚本
x700081_var_ReliveModeTbl = {700300, 700301, 700302, 700303}

x700081_var_FuBenTalkNpc			 = {}
x700081_var_DeleteFuBenTalkNpc = {
																 {varNpcGuid = 141537, varScript = 700110 },
																 {varNpcGuid = 141538, varScript = 490036},
																 {varNpcGuid = 141539, varScript = 490036},
}
x700081_var_ChallengeNpcGuid	 = {123831,126070,129176,132070}   

x700081_var_ScriptGrowPoint		=	{			-- 脚本和采集点类型的对应表
	[700022]={548},				 --轮回台
	[700085]={543,544},		 --战神墓第二环
	[700086]={500},				 --战神墓第三环
	[700102]={535,541},		 --藏宝洞
	[700121]={590,591,592},--浮屠塔
	[700106]={547},        --倩女幽魂
	[700193]={1135,1136},        --矿山秘洞
}

x700081_var_ToplistInfo        = {   
										{ClassName = "祝家庄", ClassIndex = 1,TitleClassID = 57, varIndex = 54,Desc = "祝家庄排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",    
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 71},
												{LevelStart=2,LevelEnd=3,TitleID = 72},
												{LevelStart=4,LevelEnd=20,TitleID = 73},
												{LevelStart=21,LevelEnd=50,TitleID = 74},
												{LevelStart=51,LevelEnd=100,TitleID = 75}
											}
										} ,
										{ClassName = "战场等级", ClassIndex = 2,TitleClassID = 17, Desc = "战场等级排行榜记录着真正的PK强者。玩家初始战场等级为500，战场等级超过500的玩家才有资格出现在排行榜上。参与阔亦田战场每胜利一场+1，每失败一场-1。战场等级最高的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 51},
												{LevelStart=2,LevelEnd=3,TitleID = 52},
												{LevelStart=4,LevelEnd=20,TitleID = 53},
												{LevelStart=21,LevelEnd=50,TitleID = 54},
												{LevelStart=51,LevelEnd=100,TitleID = 55}
											}
										} ,
										{ClassName = "夏王墓", ClassIndex = 3,TitleClassID = 63, varIndex = 58, Desc = "夏王墓排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 92},
												{LevelStart=2,LevelEnd=3,TitleID = 93},
												{LevelStart=4,LevelEnd=20,TitleID = 94},
												{LevelStart=21,LevelEnd=50,TitleID = 95},
												{LevelStart=51,LevelEnd=100,TitleID = 96}
											}
										} ,
										{ClassName = "放烟花", ClassIndex = 4,TitleClassID = 49, Desc = "燃放任何种类的烟花都将增长你在烟花排行榜内的分数，烂漫烟花分数最高的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 46},
												{LevelStart=2,LevelEnd=3,TitleID = 47},
												{LevelStart=4,LevelEnd=20,TitleID = 48},
												{LevelStart=21,LevelEnd=50,TitleID = 49},
												{LevelStart=51,LevelEnd=100,TitleID = 50}
											}
										} ,
										{ClassName = "印度河", ClassIndex = 5,TitleClassID = 65, varIndex = 61, Desc = "印度河排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 97},
												{LevelStart=2,LevelEnd=3,TitleID = 98},
												{LevelStart=4,LevelEnd=20,TitleID = 99},
												{LevelStart=21,LevelEnd=50,TitleID = 100},
												{LevelStart=51,LevelEnd=100,TitleID = 101}
											}
										} ,
										{ClassName = "智力竞赛", ClassIndex = 6,TitleClassID = 37, Desc = "智力竞赛排行榜将累计一周每次智力竞赛的总分数，总分最高的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 31},
												{LevelStart=2,LevelEnd=3,TitleID = 32},
												{LevelStart=4,LevelEnd=20,TitleID = 33},
												{LevelStart=21,LevelEnd=50,TitleID = 34},
												{LevelStart=51,LevelEnd=100,TitleID = 35}
											}
										} ,
										{ClassName = "轮回台", ClassIndex = 7,TitleClassID = 59, varIndex = 35, Desc = "轮回台排行榜记录着守卫国家轮回台的勇士。如果完成副本时剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜",  
										TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 76},
												{LevelStart=2,LevelEnd=3,TitleID = 77},
												{LevelStart=4,LevelEnd=20,TitleID = 78},
												{LevelStart=21,LevelEnd=50,TitleID = 79},
												{LevelStart=51,LevelEnd=100,TitleID = 80}
											}
										} ,
										{ClassName = "玫瑰", ClassIndex = 8,TitleClassID = 31, Desc = "收到过玫瑰花的男女玩家将入驻玫瑰排行榜，任何玫瑰花都会增加1点恋爱指数，恋爱指数最高的前100名玩家可以登上排行榜。",    
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 26},
												{LevelStart=2,LevelEnd=3,TitleID = 27},
												{LevelStart=4,LevelEnd=20,TitleID = 28},
												{LevelStart=21,LevelEnd=50,TitleID = 29},
												{LevelStart=51,LevelEnd=100,TitleID = 30}
											}
										} ,
										{ClassName = "大教堂", ClassIndex = 9,TitleClassID = 61, varIndex = 64,Desc = "大教堂排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",    
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 111},
												{LevelStart=2,LevelEnd=3,TitleID = 112},
												{LevelStart=4,LevelEnd=20,TitleID = 113},
												{LevelStart=21,LevelEnd=50,TitleID = 114},
												{LevelStart=51,LevelEnd=100,TitleID = 91}
											}
										} ,
										{ClassName = "神龙宝藏", ClassIndex = 10,TitleClassID = 43, Desc = "神龙宝藏排行榜会记录下寻宝数量最多的探宝家，每使用一张神龙藏宝图挖掘宝藏都将被记录，挖宝次数最高的前100名玩家可以登上排行榜。",  		
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 36},
												{LevelStart=2,LevelEnd=3,TitleID = 37},
												{LevelStart=4,LevelEnd=20,TitleID = 38},
												{LevelStart=21,LevelEnd=50,TitleID = 39},
												{LevelStart=51,LevelEnd=100,TitleID = 40}
											}
										} ,
										{ClassName = "囚龙岛", ClassIndex = 11,TitleClassID = 51, varIndex = 52 ,Desc = "囚龙岛排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。", 
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 56},
												{LevelStart=2,LevelEnd=3,TitleID = 57},
												{LevelStart=4,LevelEnd=20,TitleID = 58},
												{LevelStart=21,LevelEnd=50,TitleID = 59},
												{LevelStart=51,LevelEnd=100,TitleID = 60}
											}
										} ,
										{ClassName = "屠龙", ClassIndex = 12,TitleClassID = 45, Desc = "屠龙排行榜会记录下真正的屠龙勇士，每杀死一只天龙之魂都将增加你的屠龙数，屠龙数最高的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 41},
												{LevelStart=2,LevelEnd=3,TitleID = 42},
												{LevelStart=4,LevelEnd=20,TitleID = 43},
												{LevelStart=21,LevelEnd=50,TitleID = 44},
												{LevelStart=51,LevelEnd=100,TitleID = 45}
											}
										} ,     
										{ClassName = "和氏璧", ClassIndex = 13,TitleClassID = 53, varIndex = 45,Desc = "和氏璧排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 61},
												{LevelStart=2,LevelEnd=3,TitleID = 62},
												{LevelStart=4,LevelEnd=20,TitleID = 63},
												{LevelStart=21,LevelEnd=50,TitleID = 64},
												{LevelStart=51,LevelEnd=100,TitleID = 65}
											}
										} ,
										{ClassName = "小喇叭", ClassIndex = 14,TitleClassID = 47,  
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 102},
												{LevelStart=2,LevelEnd=3,TitleID = 103},
												{LevelStart=4,LevelEnd=20,TitleID = 104},
												{LevelStart=21,LevelEnd=50,TitleID = 105},
												{LevelStart=51,LevelEnd=100,TitleID = 106}
											}
										} ,
										{ClassName = "赤血号", ClassIndex = 15,TitleClassID = 55, varIndex = 46,Desc = "赤血号排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名的玩家可以登上排行榜。",   
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 66},
												{LevelStart=2,LevelEnd=3,TitleID = 67},
												{LevelStart=4,LevelEnd=20,TitleID = 68},
												{LevelStart=21,LevelEnd=50,TitleID = 69},
												{LevelStart=51,LevelEnd=100,TitleID = 70}
											}
										} ,
										{ClassName = "杀敌", ClassIndex = 16,TitleClassID = 15, Desc = "杀敌排行榜记录着异国有效杀敌数最多的勇士们。杀死不低于自己等级20级以上的异国玩家才能增加杀敌数，如果2小时内杀死同一个异国玩家超过10次，则再次杀死该玩家将不再增加杀敌数。有效杀敌数最多的前100名玩家可以登上排行榜。",  
											TitleInfo =
											{
												{LevelStart=1,LevelEnd=1,TitleID = 21},
												{LevelStart=2,LevelEnd=3,TitleID = 22},
												{LevelStart=4,LevelEnd=20,TitleID = 23},
												{LevelStart=21,LevelEnd=50,TitleID = 24},
												{LevelStart=51,LevelEnd=100,TitleID = 25}
											}
										},
	 }

x700081_var_RegisterFuben				= {  --npc guid ==0 表示不直接挂NPC, fubentype=0:正常副本， fubentype=1, 试炼， fubentype=2,英雄
										{ varId = 700107, varTalkNpcGUID = {145103,145103,145103,145103}, fubentype=0,loopindex=0, enterLog=1201, leaveLog=1202},  	-- 画皮
										{ varId = 710000, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},  			    							 -- 天赋副本_比武(废弃)
										{ varId = 700229, varTalkNpcGUID = {0,0,0,0}, fubentype=1,loopindex=0},                          --【试炼】藏宝洞(废弃)          
										{ varId = 700206, varTalkNpcGUID = {0,0,0,0}, fubentype=1,loopindex=0},                          --【试炼】景教堂(废弃)          
										{ varId = 700004, varTalkNpcGUID = {150503,150503,150503,150503}, fubentype=1,loopindex=2},      --【试炼】囚笼堡         
										{ varId = 700022, varTalkNpcGUID = {123712,126011,129009,132011}, fubentype=1,loopindex=0},      --【试炼】轮回台          
										{ varId = 700013, varTalkNpcGUID = {150535,150535,150535,150535}, fubentype=1,loopindex=2},      --【个人】试炼虚空境(废弃)           
										{ varId = 700221, varTalkNpcGUID = {0,0,0,0}, fubentype=1,loopindex=0},  					               --【试炼】战神墓(废弃)       
										{ varId = 700008, varTalkNpcGUID = {150511,150511,150511,150511}, fubentype=1,loopindex=2},      --【试炼】和氏璧         
										{ varId = 700009, nid=700008,varTalkNpcGUID = {150509,150509,150509,150509}, fubentype=1,loopindex=2},    --【试炼】金銮殿           
										{ varId = 700212, varTalkNpcGUID = {0,0,0,0}, fubentype=1,loopindex=0},                                   --【试炼】金矿洞(废弃)
										{ varId = 700024, nid=700009,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1}, 	--【试炼】禁宫大内			
										{ varId = 700108, nid=700027,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1}, 	--【试炼】对马岛		    
										{ varId = 700109, varTalkNpcGUID = {0,0,0,0}, fubentype=1,loopindex=0},                                   --【试炼】赤血号
										{ varId = 700023, nid=700004,varTalkNpcGUID = {150501,150501,150501,150501}, fubentype=1,loopindex=2},    --【试炼】囚龙岭           
										{ varId = 700028, nid=700023,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1},  	--【试炼】囚龙岛海滩		
										{ varId = 700210, varTalkNpcGUID = {0,0,0,0}, fubentype=1,loopindex=2},                                   --【试炼】永夜天牢(废弃)
										{ varId = 700027, nid=700109,varTalkNpcGUID = {150533,150533,150533,150533}, fubentype=1,loopindex=2},    --【试炼】水师大营           
										{ varId = 700030, nid=700031,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1},  						--【试炼】三打祝家庄（一）
										{ varId = 700031, nid=700032,varTalkNpcGUID = {150551,150551,150551,150551}, fubentype=1,loopindex=2},  				      --【试炼】三打祝家庄（二）
										{ varId = 700032, varTalkNpcGUID = {150553,150553,150553,150553}, fubentype=1,loopindex=2},  				      --【试炼】三打祝家庄（三）
										{ varId = 700084, nid=700085,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1}, 	--【试炼】探索战神墓（一）		    
										{ varId = 700085, nid=700086,varTalkNpcGUID = {150574,150574,150574,150574}, fubentype=1,loopindex=2},  	--【试炼】探索战神墓（二）			
										{ varId = 700086, varTalkNpcGUID = {150575,150575,150575,150575}, fubentype=1,loopindex=2},  				      --【试炼】探索战神墓（三）
										{ varId = 700087, nid=700088,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1},  	--【试炼】印度神庙（一）		
										{ varId = 700088, nid=700089,varTalkNpcGUID = {150565,150565,150565,150565}, fubentype=1,loopindex=2},  	--【试炼】印度神庙（二）			
										{ varId = 700089, varTalkNpcGUID = {150566,150566,150566,150566}, fubentype=1,loopindex=2},  				      --【试炼】印度神庙（三）
										{ varId = 700090, nid=700091,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=1, loopindex=1},  	--【试炼】教堂的秘密（一）		
										{ varId = 700091, nid=700092,varTalkNpcGUID = {150559,150559,150559,150559}, fubentype=1,loopindex=2},  	--【试炼】教堂的秘密（二）			
										{ varId = 700092, varTalkNpcGUID = {150560,150560,150560,150560}, fubentype=1,loopindex=2},  				      --【试炼】教堂的秘密（三）
										{ varId = 700001, varTalkNpcGUID = {140910,140910,140910,140910}, fubentype=0,loopindex=0, enterLog=1141, leaveLog=1142},               --【队伍】钧窑绝迹 
										{ varId = 700029, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},                                   															--【队伍】藏宝洞（水晶）(废弃)
										{ varId = 700006, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},                                   															--【队伍】景教堂(废弃) 
										{ varId = 700004, varTalkNpcGUID = {150503,150503,150503,150503}, fubentype=0,loopindex=2, enterLog=1051, leaveLog=1052},       				--【队伍】囚笼堡        
										{ varId = 700022, varTalkNpcGUID = {123712,126011,129009,132011}, fubentype=0,loopindex=0,kind = 0, procPlayerEnter=1,procPlayerLeave = 1, enterLog=1021, leaveLog=1022},     --【队伍】轮回台（经验）                  
										{ varId = 700022, varTalkNpcGUID = {123712,126011,129009,132011}, fubentype=0,loopindex=0,kind = 1, procPlayerEnter=1,procPlayerLeave = 1, enterLog=1021, leaveLog=1022},     --【队伍】轮回台（声望）                  
										{ varId = 700022, varTalkNpcGUID = {123712,126011,129009,132011}, fubentype=0,loopindex=0,kind = 2, procPlayerEnter=1,procPlayerLeave = 1, enterLog=1021, leaveLog=1022},     --【队伍】轮回台 (天赋80级以上）          
										{ varId = 700106, varTalkNpcGUID = {145104,145104,145104,145104}, fubentype=0,loopindex=0, enterLog=1011, leaveLog=1012},               --【队伍】倩女幽魂
										{ varId = 700013, varTalkNpcGUID = {150535,150535,150535,150535}, fubentype=0,loopindex=2},               															--【队伍】虚空境(废弃)
										{ varId = 700002, varTalkNpcGUID = {139023,139023,139023,139023}, fubentype=0,loopindex=0, enterLog=1191, leaveLog=1192},               --【队伍】斗戏勾栏院      
										{ varId = 700021, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},                                   															--【队伍】战神墓(废弃)
										{ varId = 700008, varTalkNpcGUID = {150511,150511,150511,150511}, fubentype=0,loopindex=2, enterLog=1081, leaveLog=1082},               --【队伍】和氏璧				
										{ varId = 700009,nid=700008, varTalkNpcGUID = {150507,150507,150507,150507}, fubentype=0,loopindex=2, enterLog=1071, leaveLog=1072},  	--【队伍】金銮殿		    
										{ varId = 700012, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},             					    																			--【队伍】藏宝洞(废弃) 
										{ varId = 700024, nid=700009, varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1061, leaveLog=1062},                      --【队伍】禁宫大内 
										{ varId = 700108, nid=700027,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1161, leaveLog=1162},                       --【队伍】对马岛   
										{ varId = 700109, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=2, enterLog=1181, leaveLog=1182},                                   --【队伍】赤血号   
										{ varId = 700025, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},                                   															--【队伍】神秘墓穴(废弃)
										{ varId = 700020, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},                                                                 --【队伍】神秘墓穴(废弃)
										{ varId = 700019, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=0},                                                                 --【队伍】神秘墓穴(废弃)
										{ varId = 700023, nid=700004,varTalkNpcGUID = {150501,150501,150501,150501}, fubentype=0,loopindex=2, enterLog=1041, leaveLog=1042},    --【队伍】囚龙岭     
										{ varId = 700028, nid=700023,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1031, leaveLog=1032},  	--【队伍】囚龙岛海滩 
										{ varId = 700010, varTalkNpcGUID = {0,0,0,0}, fubentype=0,loopindex=2},                                   															--【队伍】永夜天牢(废弃) 
										{ varId = 700030, nid=700031, varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1231, leaveLog=1232},                             --【队伍】三打祝家庄（一）
										{ varId = 700031, nid=700032, varTalkNpcGUID = {150551,150551,150551,150551}, fubentype=0,loopindex=2, enterLog=1241, leaveLog=1242},               --【队伍】三打祝家庄（二）
										{ varId = 700032, varTalkNpcGUID = {150553,150553,150553,150553}, fubentype=0,loopindex=2, enterLog=1251, leaveLog=1252},               --【队伍】三打祝家庄（三）
										{ varId = 700027, nid=700109,varTalkNpcGUID = {150533,150533,150533,150533}, fubentype=0,loopindex=2, enterLog=1171, leaveLog=1172},    --【队伍】水师大营
										{ varId = 700084, nid=700085,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1121, leaveLog=1122},                       --【队伍】探索战神墓（一）           
										{ varId = 700085, nid=700086,varTalkNpcGUID = {150574,150574,150574,150574}, fubentype=0,loopindex=2, enterLog=1131, leaveLog=1132},    --【队伍】探索战神墓（二）           
										{ varId = 700086, varTalkNpcGUID = {150575,150575,150575,150575}, fubentype=0,loopindex=2, enterLog=1151, leaveLog=1152},               --【队伍】探索战神墓（三）
										{ varId = 700087, nid=700088,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1751, leaveLog=1752},                       --【队伍】印度神庙（一）  
										{ varId = 700088, nid=700089,varTalkNpcGUID = {150565,150565,150565,150565}, fubentype=0,loopindex=2, enterLog=1761, leaveLog=1762},    --【队伍】印度神庙（二）  
										{ varId = 700089, varTalkNpcGUID = {150566,150566,150566,150566}, fubentype=0,loopindex=2, enterLog=1771, leaveLog=1772},               --【队伍】印度神庙（三）  
										{ varId = 700090, nid=700091,varTalkNpcGUID = {123744,126040,129041,132040}, fubentype=0, loopindex=1, enterLog=1091, leaveLog=1092},                  --【队伍】教堂的秘密（一）           
										{ varId = 700091, nid=700092,varTalkNpcGUID = {150559,150559,150559,150559}, fubentype=0,loopindex=2, enterLog=1101, leaveLog=1102},    --【队伍】教堂的秘密（二）           
										{ varId = 700092, varTalkNpcGUID = {150560,150560,150560,150560}, fubentype=0,loopindex=2, enterLog=1111, leaveLog=1112},               --【队伍】教堂的秘密（三）
										{ varId = 700012, varTalkNpcGUID = {150581,150582,150583,150584}, fubentype=0,loopindex=0},               															--【队伍】产出金矿洞(废弃) 
																		
										{ varId = 700136, varTalkNpcGUID = {138000,138000,138000,138000}, fubentype=0,loopindex=0},	--【个人】月宫大作战
										{ varId = 700500, varTalkNpcGUID = {600011,600011,600011,600011}, fubentype=0,loopindex=0},	--【个人】天关
										{ varId = 700501, varTalkNpcGUID = {600011,600011,600011,600011}, fubentype=0,loopindex=0},	--【个人】杳无音讯的村庄
										{ varId = 700502, varTalkNpcGUID = {600011,600011,600011,600011}, fubentype=0,loopindex=0},	--【个人】污染边塞
										{ varId = 700112, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库
										{ varId = 700113, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库
										{ varId = 700114, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库
										{ varId = 700115, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库
										{ varId = 700116, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库
										{ varId = 700117, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库
										{ varId = 700118, varTalkNpcGUID = {141537,141537,141537,141537}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782},               --【队伍】神秘宝库

										{ varId = 700119, varTalkNpcGUID = {141538,141538,141538,141538}, fubentype=1,loopindex=0, enterLog=1781, leaveLog=1782, recordPos=1},     --【个人】十字井副本1
										{ varId = 700119, varTalkNpcGUID = {141539,141539,141539,141539}, fubentype=0,loopindex=0, enterLog=1781, leaveLog=1782, recordPos=1},		 --【队伍】十字井副本1
										{ varId = 700102, varTalkNpcGUID = {123711,126010,129008,132010}, fubentype=0,loopindex=0, enterLog=1211, leaveLog=1212},									 --【队伍】藏宝洞
										{ varId = 700300, varTalkNpcGUID = {123847,123847,123847,123847}, fubentype=3,loopindex=0, costmode = 0, procPlayerEnter=1, process=4064}, --【团队】角斗场1		
										{ varId = 700300, varTalkNpcGUID = {123847,123847,123847,123847}, fubentype=3,loopindex=0, costmode = 1, procPlayerEnter=1, process=4064}, --【团队】角斗场精英模式1
										{ varId = 700302, varTalkNpcGUID = {123848,123848,123848,123848}, fubentype=3,loopindex=0},                                                --【团队】角斗场2		
										{ varId = 700303, varTalkNpcGUID = {123848,123848,123848,123848}, fubentype=3,loopindex=0, costmode = 1},                                  --【团队】角斗场精英模式2
										                                                                                                                                           
										{ varId = 700028,nid=700023, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战囚龙岛           
										{ varId = 700023,nid=700004, varTalkNpcGUID = {150501,150501,150501,150501}, fubentype=2,loopindex=2},                                                --【队伍】挑战囚龙城堡         
										{ varId = 700004, varTalkNpcGUID = {150503,150503,150503,150503}, fubentype=2,loopindex=2},                                                --【队伍】挑战龙穴             
										{ varId = 700024,nid=700009, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战和氏璧           
										{ varId = 700009,nid=700008, varTalkNpcGUID = {150507,150507,150507,150507}, fubentype=2,loopindex=2},                                                --【队伍】挑战和氏璧           
										{ varId = 700008, varTalkNpcGUID = {150509,150509,150509,150509}, fubentype=2,loopindex=2},                                                --【队伍】挑战金銮殿           
										{ varId = 700108,nid=700013, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战对马岛           
										{ varId = 700013,nid=700027, varTalkNpcGUID = {150535,150535,150535,150535}, fubentype=2,loopindex=2},                                                --【队伍】挑战虚空境           
										{ varId = 700027, varTalkNpcGUID = {150533,150533,150533,150533}, fubentype=2,loopindex=2},                                                --【队伍】挑战水师大营         
										{ varId = 700030,nid=700031, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战祝家庄           
										{ varId = 700031,nid=700032, varTalkNpcGUID = {150551,150551,150551,150551}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战祝家庄（二）     
										{ varId = 700032, varTalkNpcGUID = {150553,150553,150553,150553}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战祝家庄（三）     
										{ varId = 700084,nid=700085, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战夏王墓           
										{ varId = 700085,nid=700086, varTalkNpcGUID = {150574,150574,150574,150574}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战夏王陵           
										{ varId = 700086, varTalkNpcGUID = {150575,150575,150575,150575}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战夏王墓           
										{ varId = 700087,nid=700088, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战印度神庙         
										{ varId = 700088,nid=700089, varTalkNpcGUID = {150565,150565,150565,150565}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战象神谷           
										{ varId = 700089, varTalkNpcGUID = {150566,150566,150566,150566}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战印度神庙         
										{ varId = 700090,nid=700091, varTalkNpcGUID = {123848,126148 ,129761,132175}, fubentype=2, loopindex=1},                                               --【队伍】挑战大教堂        
										{ varId = 700091,nid=700092, varTalkNpcGUID = {150559,150559,150559,150559}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战熔岩沼泽      
										{ varId = 700092, varTalkNpcGUID = {150560,150560,150560,150560}, fubentype=2,loopindex=2},  			                                         --【队伍】挑战大教堂
										{ varId = 700193, varTalkNpcGUID = {151007,151007,151007,151007}, fubentype=0,loopindex=0},  			                                         --【个人】庄园矿洞副本
										--普通难度
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {550001,550001,550001,550001}, fubentype = 0, loopindex = 1 , procPlayerEnter = 1,  AItype = 1,enterLog=11101,leaveLog=11201  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 2 , procPlayerEnter = 1,  AItype = 1,enterLog=11102,leaveLog=11202  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 3 , procPlayerEnter = 1,  AItype = 1,enterLog=11103,leaveLog=11203  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 4 , procPlayerEnter = 1,  AItype = 1,enterLog=11104,leaveLog=11204  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 5 , procPlayerEnter = 1,  AItype = 1,enterLog=11105,leaveLog=11205  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 6 , procPlayerEnter = 1,  AItype = 1,enterLog=11106,leaveLog=11206  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 7 , procPlayerEnter = 1,  AItype = 1,enterLog=11107,leaveLog=11207  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 8 , procPlayerEnter = 1,  AItype = 1,enterLog=11108,leaveLog=11208  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 9 , procPlayerEnter = 1,  AItype = 1,enterLog=11109,leaveLog=11209  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 10, procPlayerEnter = 1,  AItype = 1,enterLog=11110,leaveLog=11210  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 11, procPlayerEnter = 1,  AItype = 1,enterLog=11111,leaveLog=11211  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 12, procPlayerEnter = 1,  AItype = 1,enterLog=11112,leaveLog=11212  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 13, procPlayerEnter = 1,  AItype = 1,enterLog=11113,leaveLog=11213  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 14, procPlayerEnter = 1,  AItype = 1,enterLog=11114,leaveLog=11214  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 15, procPlayerEnter = 1,  AItype = 1,enterLog=11115,leaveLog=11215  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 16, procPlayerEnter = 1,  AItype = 1,enterLog=11116,leaveLog=11216  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 17, procPlayerEnter = 1,  AItype = 1,enterLog=11117,leaveLog=11217  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 18, procPlayerEnter = 1,  AItype = 1,enterLog=11118,leaveLog=11218  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 19, procPlayerEnter = 1,  AItype = 1,enterLog=11119,leaveLog=11219  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 20, procPlayerEnter = 1,  AItype = 1,enterLog=11120,leaveLog=11220  },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 21, procPlayerEnter = 1,  AItype = 1,enterLog=11121,leaveLog=11221  },  	--【个人】精英剧场
										 --英雄难度
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 101 , procPlayerEnter = 1,  AItype = 2,enterLog=11122,leaveLog=11222 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 102 , procPlayerEnter = 1,  AItype = 2,enterLog=11123,leaveLog=11223 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 103 , procPlayerEnter = 1,  AItype = 2,enterLog=11124,leaveLog=11224 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 104 , procPlayerEnter = 1,  AItype = 2,enterLog=11125,leaveLog=11225 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 105 , procPlayerEnter = 1,  AItype = 2,enterLog=11126,leaveLog=11226 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 106 , procPlayerEnter = 1,  AItype = 2,enterLog=11127,leaveLog=11227 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 107 , procPlayerEnter = 1,  AItype = 2,enterLog=11128,leaveLog=11228 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 108 , procPlayerEnter = 1,  AItype = 2,enterLog=11129,leaveLog=11229 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 109 , procPlayerEnter = 1,  AItype = 2,enterLog=11130,leaveLog=11230 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 110, procPlayerEnter = 1,  AItype = 2, enterLog=11131,leaveLog=11231},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 111, procPlayerEnter = 1,  AItype = 2, enterLog=11132,leaveLog=11232},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 112, procPlayerEnter = 1,  AItype = 2, enterLog=11133,leaveLog=11233},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 113, procPlayerEnter = 1,  AItype = 2, enterLog=11134,leaveLog=11234},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 114, procPlayerEnter = 1,  AItype = 2, enterLog=11135,leaveLog=11235},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 115, procPlayerEnter = 1,  AItype = 2, enterLog=11136,leaveLog=11236},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 116, procPlayerEnter = 1,  AItype = 2, enterLog=11137,leaveLog=11237},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 117, procPlayerEnter = 1,  AItype = 2, enterLog=11138,leaveLog=11238},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 118, procPlayerEnter = 1,  AItype = 2, enterLog=11139,leaveLog=11239},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 119, procPlayerEnter = 1,  AItype = 2, enterLog=11140,leaveLog=11240},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 120, procPlayerEnter = 1,  AItype = 2, enterLog=11141,leaveLog=11241},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 121, procPlayerEnter = 1,  AItype = 2, enterLog=11142,leaveLog=11242},  	--【个人】精英剧场
										--炼狱难度
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 201 , procPlayerEnter = 1,  AItype = 3,enterLog=11143,leaveLog=11243 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 202 , procPlayerEnter = 1,  AItype = 3,enterLog=11144,leaveLog=11244 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 203 , procPlayerEnter = 1,  AItype = 3,enterLog=11145,leaveLog=11245 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 204 , procPlayerEnter = 1,  AItype = 3,enterLog=11146,leaveLog=11246 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 205 , procPlayerEnter = 1,  AItype = 3,enterLog=11147,leaveLog=11247 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 206 , procPlayerEnter = 1,  AItype = 3,enterLog=11148,leaveLog=11248 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 207 , procPlayerEnter = 1,  AItype = 3,enterLog=11149,leaveLog=11249 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 208 , procPlayerEnter = 1,  AItype = 3,enterLog=11150,leaveLog=11250 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 209 , procPlayerEnter = 1,  AItype = 3,enterLog=11151,leaveLog=11251 },  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 210, procPlayerEnter = 1,  AItype = 3, enterLog=11152,leaveLog=11252},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 211, procPlayerEnter = 1,  AItype = 3, enterLog=11153,leaveLog=11253},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 212, procPlayerEnter = 1,  AItype = 3, enterLog=11154,leaveLog=11254},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 213, procPlayerEnter = 1,  AItype = 3, enterLog=11155,leaveLog=11255},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 214, procPlayerEnter = 1,  AItype = 3, enterLog=11156,leaveLog=11256},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 215, procPlayerEnter = 1,  AItype = 3, enterLog=11157,leaveLog=11257},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 216, procPlayerEnter = 1,  AItype = 3, enterLog=11158,leaveLog=11258},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 217, procPlayerEnter = 1,  AItype = 3, enterLog=11159,leaveLog=11259},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 218, procPlayerEnter = 1,  AItype = 3, enterLog=11160,leaveLog=11260},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 219, procPlayerEnter = 1,  AItype = 3, enterLog=11161,leaveLog=11261},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 220, procPlayerEnter = 1,  AItype = 3, enterLog=11162,leaveLog=11262},  	--【个人】精英剧场
										{ varId = 701130, nid = 701130, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 221, procPlayerEnter = 1,  AItype = 3, enterLog=11163,leaveLog=11263},  	--【个人】精英剧场
										                                                                                                                                                  
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {141176,141176,141176,141176}, fubentype = 0, loopindex = 1  , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 2  , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 3  , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 4  , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 5  , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 6  , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 7  , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 8  , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 9  , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 10 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 11 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 12 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 13 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 14 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 15 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 16 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 17 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 18 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 19 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 20 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 21 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 22 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 23 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 24 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 25 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 26 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 27 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 28 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 29 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 30 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 31 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 32 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 33 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 34 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 35 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 36 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 37 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 38 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 39 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 40 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 41 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 42 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 43 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 44 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 45 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 46 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 47 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 48 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 49 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 50 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 51 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 52 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 53 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 54 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 55 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 56 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 57 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 58 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 59 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 60 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 61 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 62 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 63 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 64 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 65 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 66 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 67 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 68 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 69 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 70 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 71 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 72 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 73 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 74 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 75 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 76 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 77 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 78 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 79 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 80 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 81 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 82 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 83 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 84 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 85 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 86 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 87 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 88 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 89 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 90 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 91 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 92 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 93 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 94 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 95 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 96 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 97 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 98 , procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 99 , procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 100, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 101, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 102, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 103, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 104, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 105, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 106, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 107, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 108, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 109, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 110, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 111, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 112, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 113, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 114, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 115, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 116, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 117, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 118, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 119, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 120, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 121, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 122, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 123, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 124, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 125, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 126, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 127, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 128, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 129, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 130, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 131, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 132, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 133, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 134, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 135, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 136, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 137, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 138, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 139, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 140, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 141, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 142, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121,	varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 143, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 144, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 145, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 146, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 147, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 148, procPlayerEnter = 1 },  	--浮屠塔
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 149, procPlayerEnter = 1 },  	--浮屠塔	   
										{ varId = 700121, nid = 700121, varTalkNpcGUID = {150601,150601,150601,150601}, fubentype = 0, loopindex = 150, procPlayerEnter = 1 },  	--浮屠塔    

																				
									 }

x700081_var_FubenNameList				= {
										"【队伍】画皮",
										"天赋副本_比武",
										"【试炼】藏宝洞",
										"【试炼】景教堂",
										"【个人】试炼囚笼堡",
										"【个人】试炼轮回台",
										"【个人】试炼虚空境",
										"【试炼】战神墓",
										"【个人】试炼和氏璧",
										"【个人】试炼金銮殿",
										"【试炼】金矿洞",
										"【个人】试炼和氏璧",
										"【个人】试炼赤血号",
										"【试炼】黄河坞",
										"【个人】试炼囚龙岭",
										"【个人】试炼囚龙岛",
										"【试炼】永夜天牢",
										"【个人】试炼水师大营",
										"【个人】试炼祝家庄",
										"【个人】试炼祝家庄（二）",
										"【个人】试炼祝家庄（三）",
										"【个人】试炼夏王墓",
										"【个人】试炼夏王陵",
										"【个人】试炼夏王墓",
										"【个人】试炼印度河",
										"【个人】试炼象神谷",
										"【个人】试炼印度神庙",
										"【个人】试炼大教堂",
										"【个人】试炼熔岩沼泽",
										"【个人】试炼大教堂",										
										"【队伍】钧窑绝迹",
										"【队伍】藏宝洞（水晶）",
										"【队伍】景教堂",
										"【队伍】囚笼堡",
										"【队伍】轮回台(经验)",
										"【队伍】轮回台(声望)",
										"【队伍】轮回台(天赋)",
										"【队伍】倩女幽魂",
										"【队伍】虚空境",
										"【队伍】斗戏勾栏院",
										"【队伍】战神墓",
										"【队伍】和氏璧",
										"【队伍】金銮殿",
										"【队伍】藏宝洞",
										"【队伍】和氏璧",
										"【队伍】赤血号",
										"【队伍】黄河坞",
										"【队伍】神秘墓穴",
										"【队伍】神秘墓穴",
										"【队伍】神秘墓穴",
										"【队伍】囚龙岭",
										"【队伍】囚龙岛",
										"【队伍】永夜天牢",
										"【队伍】三打祝家庄",
										"【队伍】三打祝家庄（二）",
										"【队伍】三打祝家庄（三）",
										"【队伍】水师大营",
										"【队伍】夏王墓",
										"【队伍】夏王陵",
										"【队伍】夏王墓",
										"【队伍】印度河",
										"【队伍】象神谷",
										"【队伍】印度神庙",
										"【队伍】大教堂",
										"【队伍】熔岩沼泽",
										"【队伍】大教堂",
										"【队伍】产出金矿洞", 
										"【个人】月宫大作战",
										"【个人】天关",
										"【队伍】杳无音讯的村庄",
										"【队伍】污染边塞",
										"【队伍】神秘宝库",
										"【队伍】神秘宝库",
										"【队伍】神秘宝库",
										"【队伍】神秘宝库",
										"【队伍】神秘宝库",
										"【队伍】神秘宝库",
										"【队伍】神秘宝库",
										"【个人】冥王秘境",		--【个人】十字井副本1
										"【队伍】冥王秘境",		--【队伍】十字井副本1
										"【队伍】藏宝洞",
										"【团队】角斗场",  
										"【团队】角斗场精英模式",  
										"【团队】角斗场2",  
										"【团队】角斗场精英模式2",     
										"【队伍】挑战囚龙岛", 
										"【队伍】挑战囚龙城堡",            
										"【队伍】挑战龙穴",                
										"【队伍】挑战和氏璧",            
										"【队伍】挑战和氏璧",          
										"【队伍】挑战金銮殿",          
										"【队伍】挑战对马岛",          
										"【队伍】挑战虚空境",              
										"【队伍】挑战水师大营",          
										"【队伍】挑战祝家庄",    
										"【队伍】挑战祝家庄（二）",    
										"【队伍】挑战祝家庄（三）",    
										"【队伍】挑战夏王墓",    
										"【队伍】挑战夏王陵",    
										"【队伍】挑战夏王墓",    
										"【队伍】挑战印度神庙",     
										"【队伍】挑战象神谷",     
										"【队伍】挑战印度神庙",     
										                        
										"【队伍】挑战大教堂",    
										"【队伍】挑战熔岩沼泽",    
										"【队伍】挑战大教堂",
										"【个人】矿山秘洞",

										--"【个人】精英副本",
									  }
									  
x700081_var_FubenClassMenu = {
									varTalkNpcGUID = {123744,126040,129041,132040},
									classmenu = 
									{
										{varName = "【个人】试炼副本",fubentype = 1, mode = 0, },  
										{varName = "【队伍】三环副本",fubentype = 0, mode = 0, },  
										{varName = "【队伍】三环副本（三番令）",fubentype = 0, mode = 1, },  
										--{varName = "【队伍】挑战副本",fubentype = 2, mode = 0, },
									}									
								}

--跨服报名选项
x700081_var_kuafu_search = {
														varTalkNpcGUID = {123849,126149,129762,132176},
														classmenu = 
															{
																{varName = "【跨服】三环副本（三番令）" },  
																{varName = "【跨服】三环副本（三番令）" },				
																{varName = "【跨服】三环副本（三番令）" },		
																{varName = "【跨服】三环副本（三番令）" },
															}
														}				
								
x700081_var_CountModeList			= {   --记次模式 0：不记次，1：日记次，2：周记次,  5: 总共次数 
									2,	--【队伍】画皮 
									1,	-- 天赋副本_比武(废弃)
									5,	--【试炼】藏宝洞(废弃)
									5,  --【试炼】景教堂(废弃) 
									5,  --【个人】试炼囚笼堡 
									5,  --【个人】试炼轮回台 
									5,  --【个人】试炼虚空境(废弃)  
									5,  --【试炼】战神墓(废弃)     
									5,  --【个人】试炼和氏璧 
									5,  --【个人】试炼金銮殿 
									5,  --【试炼】金矿洞(废弃)     
									5,  --【试炼】禁宫大内 
									5,  --【试炼】对马岛 
									5,  --【试炼】赤血号     
									5,  --【试炼】囚龙岭 
									5,  --【试炼】囚龙岛海滩 
									5,  --【试炼】永夜天牢(废弃)          
									5,  --【个人】试炼水师大营     
									5,  --【试炼】三打祝家庄（一）       
									5,  --【个人】试炼祝家庄（二） 
									5,  --【个人】试炼祝家庄（三） 
									5,  --【试炼】探索战神墓（一）       
									5,  --【试炼】探索战神墓（二）       
									5,  --【试炼】探索战神墓（三）       
									5,  --【试炼】印度神庙（一）       
									5,  --【试炼】印度神庙（二）       
									5,  --【试炼】印度神庙（三）     
									5,  --【试炼】教堂的秘密（一）     
									5,  --【试炼】教堂的秘密（二）   
									5,  --【试炼】教堂的秘密（三）     
									2,  --【队伍】钧窑绝迹       
									1,  --【队伍】藏宝洞（水晶）(废弃) 
									1,  --【队伍】景教堂(废弃)         
									1,  --【队伍】囚笼堡         
									1,  --【队伍】轮回台(经验)   
									1,  --【队伍】轮回台(声望)   
									1,  --【队伍】轮回台(天赋)   
									2,  --【队伍】倩女幽魂       
									1,  --【队伍】虚空境(废弃)         
									2,  --【队伍】斗戏勾栏院     
									1,  --【队伍】战神墓(废弃) 
									1,  --【队伍】和氏璧 
									1,  --【队伍】金銮殿 
									1,  --【队伍】藏宝洞(废弃) 
									2,  --【队伍】禁宫大内 
									2,  --【队伍】对马岛   
									1,  --【队伍】赤血号   
									1,  --【队伍】神秘墓穴(废弃)  
									1,  --【队伍】神秘墓穴(废弃)  
									1,  --【队伍】神秘墓穴(废弃)  
									1,  --【队伍】囚龙岭   
									2,  --【队伍】囚龙岛海滩   
									1,  --【队伍】永夜天牢(废弃)         
									2,  --【队伍】三打祝家庄（一）       
									1,  --【队伍】三打祝家庄（二） 
									1,  --【队伍】三打祝家庄（三） 
									1,  --【队伍】水师大营         
									2,  --【队伍】探索战神墓（一）           
									1,  --【队伍】探索战神墓（二）           
									1,  --【队伍】探索战神墓（三）           
									2,  --【队伍】印度神庙（一）           
									1,  --【队伍】印度神庙（二）           
									1,  --【队伍】印度神庙（三）         
									2,  --【队伍】教堂的秘密（一）           
									1,  --【队伍】教堂的秘密（二）         
									1,  --【队伍】教堂的秘密（三）           
									1,  --【队伍】产出金矿洞(废弃)       
												        	 													
									0,  --【个人】月宫大作战        
									0,  --【个人】天关
									0,  --【个人】杳无音讯的村庄
									0,  --【个人】污染边塞
									0,  --【队伍】神秘宝库
								  0,  --【队伍】神秘宝库         
									0,  --【队伍】神秘宝库         
									0,  --【队伍】神秘宝库         
									0,  --【队伍】神秘宝库         
									0,  --【队伍】神秘宝库         
									0,	--【队伍】神秘宝库 
									       
									0,   --【个人】十字井副本1	
									0,   --【队伍】十字井副本1
									1,   --【队伍】藏宝洞     
                         
									0,   --【团队】角斗场
									0,   --【团队】角斗场精英模式
									0,   --【团队】角斗场2
									0,   --【团队】角斗场精英模式2								
                         
									2,	 --【队伍】挑战囚龙岛              
									2,	 --【队伍】挑战囚龙城堡            
									2,	 --【队伍】挑战龙穴                
									2,	 --【队伍】挑战和氏璧              
									2,	 --【队伍】挑战和氏璧              
									2,	 --【队伍】挑战金銮殿              
									0,	 --【队伍】挑战对马岛              
									0,	 --【队伍】挑战虚空境              
									0,	 --【队伍】挑战水师大营            
									0,	 --【队伍】挑战祝家庄          
									0,	 --【队伍】挑战祝家庄（二）    
									0,	 --【队伍】挑战祝家庄（三）    
									0,	 --【队伍】挑战夏王墓          
									0,	 --【队伍】挑战夏王陵          
									0,	 --【队伍】挑战夏王墓          
									0,	 --【队伍】挑战印度神庙        
									0,	 --【队伍】挑战象神谷          
									0,	 --【队伍】挑战印度神庙        
									                       
									0,	 --【队伍】挑战大教堂  
									0,	 --【队伍】挑战熔岩沼泽
									0,	 --【队伍】挑战大教堂
									1,	 --【个人】矿山秘洞
									
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									2,   --【个人】精英剧场
									
                                  }                      

x700081_var_CountUntilList			= { --每天（周）进入最大次数
									1,  --【队伍】画皮                  
									1,  -- 天赋副本_比武(废弃)          
									1,	--【试炼】藏宝洞(废弃)          
									1,  --【试炼】景教堂(废弃)          
									1,  --【个人】试炼囚笼堡            
									1,  --【个人】试炼轮回台            
									1,  --【个人】试炼虚空境(废弃)      
									1,  --【试炼】战神墓(废弃)          
									1,  --【个人】试炼和氏璧            
									1,  --【个人】试炼金銮殿            
									1,  --【试炼】金矿洞(废弃)          
									1,  --【试炼】禁宫大内              
									1,  --【试炼】对马岛                
									1,  --【试炼】赤血号                
									1,  --【试炼】囚龙岭                
									1,  --【试炼】囚龙岛海滩            
									1,  --【试炼】永夜天牢(废弃)        
									1,  --【个人】试炼水师大营          
									1,  --【试炼】三打祝家庄（一）      
									1,  --【个人】试炼祝家庄（二）      
									1,  --【个人】试炼祝家庄（三）      
									1,  --【试炼】探索战神墓（一）      
									1,  --【试炼】探索战神墓（二）      
									1,  --【试炼】探索战神墓（三）      
									1,  --【试炼】印度神庙（一）        
									1,  --【试炼】印度神庙（二）        
									1,  --【试炼】印度神庙（三）        
									1,  --【试炼】教堂的秘密（一）      
									1,  --【试炼】教堂的秘密（二）      
									1,  --【试炼】教堂的秘密（三）      
									1,  --【队伍】钧窑绝迹              
									5,  --【队伍】藏宝洞（水晶）(废弃)  
									5,  --【队伍】景教堂(废弃)          
									0,  --【队伍】囚笼堡                
									1,  --【队伍】轮回台(经验)
									1,  --【队伍】轮回台(声望)
									1,  --【队伍】轮回台(天赋)
									1,  --【队伍】倩女幽魂              
									0,  --【队伍】虚空境(废弃)          
									1,  --【队伍】斗戏勾栏院            
									5,  --【队伍】战神墓(废弃)          
									0,  --【队伍】和氏璧                
									0,  --【队伍】金銮殿                
									5,  --【队伍】藏宝洞(废弃)          
									21, --【队伍】禁宫大内              
									21, --【队伍】对马岛                
									0,  --【队伍】赤血号                
									3,  --【队伍】神秘墓穴(废弃)        
									3,  --【队伍】神秘墓穴(废弃)        
									3,  --【队伍】神秘墓穴(废弃)        
									0,  --【队伍】囚龙岭                
									21, --【队伍】囚龙岛海滩            
									5,  --【队伍】永夜天牢(废弃)        
									21, --【队伍】三打祝家庄（一）      
									0,  --【队伍】三打祝家庄（二）      
									0,  --【队伍】三打祝家庄（三）      
									0,  --【队伍】水师大营              
									21, --【队伍】探索战神墓（一）      
									0,  --【队伍】探索战神墓（二）      
									0,  --【队伍】探索战神墓（三）      
									21, --【队伍】印度神庙（一）        
									0,  --【队伍】印度神庙（二）        
									0,  --【队伍】印度神庙（三）        
									21, --【队伍】教堂的秘密（一）      
									0,  --【队伍】教堂的秘密（二）      
									0,  --【队伍】教堂的秘密（三）      
									5,  --【队伍】产出金矿洞(废弃)      
									
									3,  --【个人】月宫大作战 
									3,  --【个人】天关
									3,  --【个人】杳无音讯的村庄
									3,  --【个人】污染边塞
									0,  --【队伍】神秘宝库
									0,  --【队伍】神秘宝库 
									0,  --【队伍】神秘宝库 
									0,  --【队伍】神秘宝库 
									0,  --【队伍】神秘宝库 
									0,  --【队伍】神秘宝库 
									0,  --【队伍】神秘宝库 
									
									0,	--【个人】十字井副本1
									0, --【队伍】十字井副本1
									
									5,  --【队伍】藏宝洞  

									0,   --【团队】角斗场 
									0,   --【团队】角斗场精英模式
									0,   --【团队】角斗场2
									0,   --【团队】角斗场精英模式2

									10,	--【队伍】挑战囚龙岛       
									0,	--【队伍】挑战囚龙城堡     
									0,	--【队伍】挑战龙穴         
									10,	--【队伍】挑战和氏璧       
									0,	--【队伍】挑战和氏璧       
									0,	--【队伍】挑战金銮殿       
									0,	--【队伍】挑战对马岛       
									0,	--【队伍】挑战虚空境       
									0,	--【队伍】挑战水师大营     
									0,	--【队伍】挑战祝家庄       
									0,	--【队伍】挑战祝家庄（二） 
									0,	--【队伍】挑战祝家庄（三） 
									0,	--【队伍】挑战夏王墓       
									0,	--【队伍】挑战夏王陵       
									0,	--【队伍】挑战夏王墓       
									0,	--【队伍】挑战印度神庙     
									0,	--【队伍】挑战象神谷       
									0,	--【队伍】挑战印度神庙     
									0,	--【队伍】挑战大教堂    
									0,	--【队伍】挑战熔岩沼泽  
									0,	--【队伍】挑战大教堂
									2,	--【个人】矿山秘洞
									
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									15,  --【个人】精英剧场
									
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔
									0, --【个人】浮屠塔    
  
									  }                      

x700081_var_LimitMembersList			= {   --队伍最小人数
										1,  --【队伍】画皮                  
										1,  -- 天赋副本_比武(废弃)          
										1,  --【试炼】藏宝洞(废弃)          
										1,  --【试炼】景教堂(废弃)          
										1,  --【个人】试炼囚笼堡            
										1,  --【个人】试炼轮回台            
										1,  --【个人】试炼虚空境(废弃)      
										1,  --【试炼】战神墓(废弃)          
										1,  --【个人】试炼和氏璧            
										1,  --【个人】试炼金銮殿            
										1,  --【试炼】金矿洞(废弃)          
										1,  --【试炼】禁宫大内              
										1,  --【试炼】对马岛                
										1,  --【试炼】赤血号                
										1,  --【试炼】囚龙岭                
										1,  --【试炼】囚龙岛海滩            
										1,  --【试炼】永夜天牢(废弃)        
										1,  --【个人】试炼水师大营          
										1,  --【试炼】三打祝家庄（一）      
										1,  --【个人】试炼祝家庄（二）      
										1,  --【个人】试炼祝家庄（三）      
										1,  --【试炼】探索战神墓（一）      
										1,  --【试炼】探索战神墓（二）      
										1,  --【试炼】探索战神墓（三）      
										1,  --【试炼】印度神庙（一）        
										1,  --【试炼】印度神庙（二）        
										1,  --【试炼】印度神庙（三）        
										1,  --【试炼】教堂的秘密（一）      
										1,  --【试炼】教堂的秘密（二）      
										1,  --【试炼】教堂的秘密（三）      
										1,  --【队伍】钧窑绝迹              
										1,  --【队伍】藏宝洞（水晶）(废弃)  
										1,  --【队伍】景教堂(废弃)          
										1,  --【队伍】囚笼堡                
										1,  --【队伍】轮回台(经验)          
										1,  --【队伍】轮回台(声望)          
										1,  --【队伍】轮回台(天赋)          
										1,  --【队伍】倩女幽魂              
										1,  --【队伍】虚空境(废弃)          
										1,  --【队伍】斗戏勾栏院            
										1,  --【队伍】战神墓(废弃)          
										1,  --【队伍】和氏璧                
										1,  --【队伍】金銮殿                
										1,  --【队伍】藏宝洞(废弃)          
										1,  --【队伍】禁宫大内              
										1,  --【队伍】对马岛                
										1,  --【队伍】赤血号                
										1,  --【队伍】神秘墓穴(废弃)        
										1,  --【队伍】神秘墓穴(废弃)        
										1,  --【队伍】神秘墓穴(废弃)        
										1,  --【队伍】囚龙岭                
										1,  --【队伍】囚龙岛海滩            
										1,  --【队伍】永夜天牢(废弃)        
										1,  --【队伍】三打祝家庄（一）      
										1,  --【队伍】三打祝家庄（二）      
										1,  --【队伍】三打祝家庄（三）      
										1,  --【队伍】水师大营              
										1,  --【队伍】探索战神墓（一）      
										1,  --【队伍】探索战神墓（二）      
										1,  --【队伍】探索战神墓（三）      
										1,  --【队伍】印度神庙（一）        
										1,  --【队伍】印度神庙（二）        
										1,  --【队伍】印度神庙（三）        
										1,  --【队伍】教堂的秘密（一）      
										1,  --【队伍】教堂的秘密（二）      
										1,  --【队伍】教堂的秘密（三）      
										1,  --【队伍】产出金矿洞(废弃)      

										1,  --【个人】月宫大作战 
										1,  --【个人】天关
										1,  --【个人】杳无音讯的村庄
										1,  --【个人】污染边塞
										1,  --【队伍】神秘宝库
										1,  --【队伍】神秘宝库 
										1,  --【队伍】神秘宝库 
										1,  --【队伍】神秘宝库 
										1,  --【队伍】神秘宝库 
     								1,	--【队伍】神秘宝库  
										1,	--【队伍】神秘宝库 
										
										1,  --【个人】十字井副本1
										1,  --【队伍】十字井副本1
										
										1,  --【队伍】藏宝洞

										12,   --【团队】角斗场
      							12,		--【团队】角斗场精英模式
      							12,   --【团队】角斗场2
      							12,		--【团队】角斗场精英模式2
 
										1,   --【队伍】挑战囚龙岛       
 										1,   --【队伍】挑战囚龙城堡     
 										1,   --【队伍】挑战龙穴         
										1,	 --【队伍】挑战和氏璧       
										1,	 --【队伍】挑战和氏璧       
										1,	 --【队伍】挑战金銮殿       
										1,	 --【队伍】挑战对马岛       
										1,	 --【队伍】挑战虚空境       
										1,	 --【队伍】挑战水师大营     
										1,	 --【队伍】挑战祝家庄       
										1,	 --【队伍】挑战祝家庄（二） 
										1,	 --【队伍】挑战祝家庄（三） 
										1,	 --【队伍】挑战夏王墓       
										1,	 --【队伍】挑战夏王陵       
										1,	 --【队伍】挑战夏王墓       
										1,	 --【队伍】挑战印度神庙     
										1,	 --【队伍】挑战象神谷       
										1,	 --【队伍】挑战印度神庙     
										1,	 --【队伍】挑战大教堂       
										1,	 --【队伍】挑战熔岩沼泽     
										1,	 --【队伍】挑战大教堂 
										1,	 --【个人】矿山秘洞
										
										1,  --【个人】精英剧场
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场          
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场 
										
										1,  --【个人】精英剧场
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场          
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场 
										
										1,  --【个人】精英剧场
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场          
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场  
										1,  --【个人】精英剧场 
										
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔	
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔
										1,	 --【个人】浮屠塔       
									  }                      


x700081_var_LevelRangeList				= {  --进入副本等级限制
										{85, 160}, --【队伍】画皮                      
										{80, 100}, -- 天赋副本_比武(废弃)              
										{160,160}, --【试炼】藏宝洞(废弃)                
										{160,160}, --【试炼】景教堂(废弃)                
										{20,160},  --【个人】试炼囚笼堡                 
										{30,50},   --【个人】试炼轮回台                
										{50,160},  --【个人】试炼虚空境(废弃)           
										{160,160}, --【试炼】战神墓(废弃)                
										{40,160},  --【个人】试炼和氏璧                 
										{40,160},  --【个人】试炼金銮殿                 
										{160,160}, --【试炼】金矿洞(废弃)                
										{40,60},   --【试炼】禁宫大内                  
										{50,70},   --【试炼】对马岛                    
										{50,160},  --【试炼】赤血号                     
										{20,160},  --【试炼】囚龙岭                     
										{20,40},   --【试炼】囚龙岛海滩                
										{160,160}, --【试炼】永夜天牢(废弃)              
										{50,160},  --【个人】试炼水师大营               
										{60,80},   --【试炼】三打祝家庄（一）          
										{60,160},  --【个人】试炼祝家庄（二）           
										{60,160},  --【个人】试炼祝家庄（三）           
										{35,55},   --【试炼】探索战神墓（一）          
										{35,160},  --【试炼】探索战神墓（二）          
										{35,160},  --【试炼】探索战神墓（三）          
										{55,75},   --【试炼】印度神庙（一）            
										{55,160},  --【试炼】印度神庙（二）            
										{55,160},  --【试炼】印度神庙（三）            
										{45,65},   --【试炼】教堂的秘密（一）          
										{45,160},  --【试炼】教堂的秘密（二）          
										{45,160},  --【试炼】教堂的秘密（三）          
										{65,160},  --【队伍】钧窑绝迹                   
										{25,160},  --【队伍】藏宝洞（水晶）(废弃)       
										{40,160},  --【队伍】景教堂(废弃)               
										{20,160},  --【队伍】囚笼堡                     
										{30,160},  --【队伍】轮回台(经验)               
										{30,160},  --【队伍】轮回台(声望)               
										{30,160},  --【队伍】轮回台(天赋)               
										{85,160},  --【队伍】倩女幽魂                   
										{50,160},  --【队伍】虚空境(废弃)               
										{65,160},  --【队伍】斗戏勾栏院                 
										{30,160},  --【队伍】战神墓(废弃)               
										{40,160},  --【队伍】和氏璧                     
										{40,160},  --【队伍】金銮殿                     
										{25,160},  --【队伍】藏宝洞(废弃)               
										{40,160},  --【队伍】禁宫大内                   
										{50,160},  --【队伍】对马岛                     
										{50,160},  --【队伍】赤血号                     
										{40,160},  --【队伍】神秘墓穴(废弃)             
										{40,160},  --【队伍】神秘墓穴(废弃)             
										{40,160},  --【队伍】神秘墓穴(废弃)             
										{20,160},  --【队伍】囚龙岭                     
										{20,160},  --【队伍】囚龙岛海滩                 
										{25,160},  --【队伍】永夜天牢(废弃)             
										{60,160},  --【队伍】三打祝家庄（一）           
										{60,160},  --【队伍】三打祝家庄（二）           
										{60,160},  --【队伍】三打祝家庄（三）           
										{50,160},  --【队伍】水师大营                   
										{35,160},  --【队伍】探索战神墓（一）          
										{35,160},  --【队伍】探索战神墓（二）          
										{35,160},  --【队伍】探索战神墓（三）          
										{55,160},  --【队伍】印度神庙（一）            
										{55,160},  --【队伍】印度神庙（二）            
										{55,160},  --【队伍】印度神庙（三）            
										{45,160},  --【队伍】教堂的秘密（一）          
										{45,160},  --【队伍】教堂的秘密（二）          
										{45,160},  --【队伍】教堂的秘密（三）          
										{25,160},  --【队伍】产出金矿洞(废弃)          
																				
										{1,160},   --【个人】月宫大作战
										{1,160},   --【个人】天关
										{1,160},   --【个人】杳无音讯的村庄
										{1,160},   --【个人】污染边塞
										{50,59},   --【队伍】神秘宝库
										{60,69},   --【队伍】神秘宝库 
										{70,79},   --【队伍】神秘宝库 
										{80,89},   --【队伍】神秘宝库 
										{90,99},   --【队伍】神秘宝库 
										{100,109}, --【队伍】神秘宝库 
										{110,119}, --【队伍】神秘宝库 
										
										{70,160},	--【个人】十字井副本1
										{70,160},	--【队伍】十字井副本1
										
										{25,160}, --【队伍】藏宝洞 

										{159,160},   --【团队】角斗场	
										{159,160},   --【团队】角斗场精英模式
										{159,160},   --【团队】角斗场2	
										{159,160},   --【团队】角斗场精英模式2

										{80,160},	 --【队伍】挑战囚龙岛          
										{80,160},	 --【队伍】挑战囚龙城堡        
										{80,160},	 --【队伍】挑战龙穴            
										{90,160},	 --【队伍】挑战和氏璧          
										{90,160},	 --【队伍】挑战和氏璧          
										{90,160},	 --【队伍】挑战金銮殿          
										{150,160},	 --【队伍】挑战对马岛          
										{150,160},	 --【队伍】挑战虚空境          
										{150,160},	 --【队伍】挑战水师大营        
										{150,160},	 --【队伍】挑战祝家庄          
										{150,160},	 --【队伍】挑战祝家庄（二）    
										{150,160},	 --【队伍】挑战祝家庄（三）    
										{150,160},	 --【队伍】挑战夏王墓          
										{150,160},	 --【队伍】挑战夏王陵          
										{150,160},	 --【队伍】挑战夏王墓          
										{150,160},	 --【队伍】挑战印度神庙        
										{150,160},	 --【队伍】挑战象神谷          
										{150,160},	 --【队伍】挑战印度神庙        
										{150,160},	 --【队伍】挑战大教堂          
										{150,160},	 --【队伍】挑战熔岩沼泽        
										{150,160},	 --【队伍】挑战大教堂
										{75,160},	 --【个人】矿山秘洞
										
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场
										{70,160},    --【个人】精英剧场

										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔
										{45,160},     --【个人】浮屠塔     
									
									  }                      

x700081_var_EnterTimeList				={
										{ 
											{min=0*60+0,   max=24*60+0},  
										},
										
										{ 
											{min=0*60+0,   max=24*60+0},  
										},
										
										{ 
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,  max=24*60+0}
										},

										{  
											{min=0*60+0,  max=24*60+0}
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,   max=24*60+0},  
										},
										
										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  
                      {min=0*60+0,  max=24*60+0},
										},

										{  
                      {min=0,  max=24*60+0},
										},
										{  
										  {min=0,  max=24*60+0},
										},
										{  
										  {min=0,  max=24*60+0},
										},
										{  
										  {min=0*60+0,   max=24*60+0},
										},
										{  
										  {min=0*60+0,   max=24*60+0},  
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},--月宫
										},
										{
											{min=0*60+0,  max=24*60+0},--天关
										},{
											{min=0*60+0,  max=24*60+0},--杳无音讯的村庄
										},{
											{min=0*60+0,  max=24*60+0},--污染边塞
										},
										{ 
											{min=0*60+0,  max=24*60+0},--神秘宝库
										},										
										{  
											{min=0*60+0,  max=24*60+0},
										},
										{  
											{min=0*60+0,  max=24*60+0},
										},
										{  
											{min=0*60+0,  max=24*60+0},
										},
										{  
											{min=0*60+0,  max=24*60+0},
										},
										{  
											{min=0*60+0,  max=24*60+0},
										},
										{  
											{min=0*60+0,  max=24*60+0},
										},
										
										{ --【个人】十字井副本1
											{min=0*60+0,  max=24*60+0},
										},
										{ --【队伍】十字井副本1
											{min=0*60+0,  max=24*60+0},
										},
										
										{  
											{min=0*60+0,  max=24*60+0},
										},

										{  --【团队】角斗场
											{min=0*60+0,  max=24*60+0},
										},
										{  --【团队】角斗场精英模式
											{min=0*60+0,  max=24*60+0},
										},	
										{  --【团队】角斗场2
											{min=0*60+0,  max=24*60+0},
										},
										{  --【团队】角斗场精英模式2
											{min=0*60+0,  max=24*60+0},
										},			

										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},
										{ --矿山秘洞
											{min=0*60+0,  max=24*60+0},
										},
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										
										
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										{ 
											{min=0*60+0,  max=24*60+0},
										},    --【个人】精英剧场
										
									 }

x700081_var_EnterDayList				={
										{0,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,6},           
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,6}, 
										{0,1,2,3,4,5,6}, 
										{0,6},           
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
																				
										{0,1,2,3,4,5,6}, --【队伍】月宫
										{0,1,2,3,4,5,6}, --【队伍】天关
										{0,1,2,3,4,5,6}, --【队伍】杳无音讯的村庄
										{0,1,2,3,4,5,6}, --【队伍】污染边塞
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										{0,1,2,3,4,5,6}, --【队伍】神秘宝库
										
										{0,1,2,3,4,5,6}, --【个人】十字井副本1
										{0,1,2,3,4,5,6}, --【队伍】十字井副本1
										
										{0,1,2,3,4,5,6}, --【队伍】藏宝洞6 

										{0,1,2,3,4,5,6}, --【团队】角斗场
										{0,1,2,3,4,5,6}, --【团队】角斗场精英模式
										{0,1,2,3,4,5,6}, --【团队】角斗场2
										{0,1,2,3,4,5,6}, --【团队】角斗场精英模式2

										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6}, 
										{0,1,2,3,4,5,6},
										{0,1,2,3,4,5,6},   --矿山秘洞
										
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										
										
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										{0,1,2,3,4,5,6},   --【个人】精英剧场
										
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔
										{0,1,2,3,4,5,6},       --浮屠塔 
										
									}

x700081_var_SceneMapNavPathList		= {
										"fuben_huapi/fuben_huapi.nav",								--画皮             
										"fuben_lanyuezhixue/fuben_lanyuezhixue.nav",				--天赋副本_比武       
										"fuben_qianfoku/fuben_qianfoku.nav",						--【试炼】藏宝洞          
										"fuben_jingjiaotang/fuben_jingjiaotang.nav",                --【试炼】景教堂          
										"fuben_qiulongbao/fuben_qiulongbao.nav",                    --【试炼】囚笼堡           
										"fuben_lunhuitaicanpo/fuben_lunhuitaicanpo.nav",                      --【试炼】轮回台          
										"fuben_xukongjing/fuben_xukongjing.nav",                    --【试炼】虚空境          
										"fuben_zhanshenmu/fuben_zhanshenmu.nav",                    --【试炼】战神墓          
										"fuben_heshibi/fuben_heshibi.nav",                          --【试炼】和氏璧        
										"fuben_jinluandian/fuben_jinluandian.nav",                  --【试炼】金銮殿       
										"fuben_huangjinkuangdong/fuben_huangjinkuangdong.nav",      --【试炼】金矿洞          
										"fuben_jingongdanei/fuben_jingongdanei.nav",                --【试炼】禁宫大内        
										"fuben_duimadao/fuben_duimadao.nav",                        --【试炼】对马岛      
										"fuben_chixuehao/fuben_chixuehao.nav",                      --【试炼】赤血号         
										"fuben_qiulongling/fuben_qiulongling.nav",                  --【试炼】囚龙岭 
										"fuben_qiulongdaohaitan/fuben_qiulongdaohaitan.nav",        --【试炼】囚龙岛海滩        
										"fuben_yongyetianlao/fuben_yongyetianlao.nav",              --【试炼】永夜天牢        
										"fuben_shuishidaying/fuben_shuishidaying.nav",              --【试炼】水师大营  
										"fuben_zhujiazhuang/fuben_zhujiazhuang.nav",                --【试炼】三打祝家庄（一）
										"fuben_zhujiazhuang2/fuben_zhujiazhuang2.nav",              --【试炼】三打祝家庄（二）
										"fuben_zhujiazhuang3/fuben_zhujiazhuang3.nav",              --【试炼】三打祝家庄（三）
										"fuben_helanshangu/fuben_helanshangu.nav",                  --【试炼】探索战神墓（一）
										"fuben_xiawangling/fuben_xiawangling.nav",                  --【试炼】探索战神墓（二）
										"fuben_xiawangmu/fuben_xiawangmu.nav",                      --【试炼】探索战神墓（三）
										"fuben_beiyinduconglin/fuben_beiyinduconglin.nav",          --【试炼】印度神庙（一）
										"fuben_xiangshengu/fuben_xiangshengu.nav",                  --【试炼】印度神庙（二）
										"fuben_yindushenmiao/fuben_yindushenmiao.nav",              --【试炼】印度神庙（三）
										"fuben_maqueling/fuben_maqueling.nav",                      --【试炼】教堂的秘密（一）
										"fuben_rongyanzhaoze/fuben_rongyanzhaoze.nav",              --【试炼】教堂的秘密（二）
										"fuben_dajiaotang/fuben_dajiaotang.nav",                    --【试炼】教堂的秘密（三）										    
										"fuben_junyao/fuben_junyao.nav",                            --【队伍】钧窑绝迹        
										"fuben_qianfoku/fuben_qianfoku.nav",                        --【队伍】藏宝洞          
										"fuben_jingjiaotang/fuben_jingjiaotang.nav",                --【队伍】景教堂          
										"fuben_qiulongbao/fuben_qiulongbao.nav",                    --【队伍】囚笼堡             
										"fuben_lunhuitaicanpo/fuben_lunhuitaicanpo.nav",                      --【队伍】轮回台(经验)                  
										"fuben_lunhuitaicanpo/fuben_lunhuitaicanpo.nav",                      --【队伍】轮回台(声望)                  
										"fuben_lunhuitaicanpo/fuben_lunhuitaicanpo.nav",                      --【队伍】轮回台(天赋80级以上)          
										"fuben_qiannvyouhun/fuben_qiannvyouhun.nav",                      --【队伍】倩女幽魂         
										"fuben_xukongjing/fuben_xukongjing.nav",                    --【队伍】虚空境          
										"fuben_goulanqutai/fuben_goulanqutai.nav",                  --【队伍】斗戏勾栏院      
										"fuben_zhanshenmu/fuben_zhanshenmu.nav",                    --【队伍】战神墓          
										"fuben_heshibi/fuben_heshibi.nav",                          --【队伍】和氏璧        
										"fuben_jinluandian/fuben_jinluandian.nav",                  --【队伍】金銮殿       
										"fuben_huangjinkuangdong/fuben_huangjinkuangdong.nav",      --【队伍】金矿洞          
										"fuben_jingongdanei/fuben_jingongdanei.nav",                --【队伍】禁宫大内        
										"fuben_duimadao/fuben_duimadao.nav",               		    --【队伍】对马岛      
										"fuben_chixuehao/fuben_chixuehao.nav",                      --【队伍】赤血号         
										"fuben_pitianzhixue/fuben_pitianzhixue.nav",                --【队伍】神秘墓穴        
										"fuben_lanyuezhixue/fuben_lanyuezhixue.nav",                --【队伍】神秘墓穴        
										"fuben_zhurizhixue/fuben_zhurizhixue.nav",                  --【队伍】神秘墓穴        
										"fuben_qiulongling/fuben_qiulongling.nav",                  --【队伍】囚龙岭 
										"fuben_qiulongdaohaitan/fuben_qiulongdaohaitan.nav",        --【队伍】囚龙岛海滩           
										"fuben_yongyetianlao/fuben_yongyetianlao.nav",              --【队伍】永夜天牢        
										"fuben_zhujiazhuang/fuben_zhujiazhuang.nav",                --【队伍】三打祝家庄（一）
										"fuben_zhujiazhuang2/fuben_zhujiazhuang2.nav",              --【队伍】三打祝家庄（二）
										"fuben_zhujiazhuang3/fuben_zhujiazhuang3.nav",              --【队伍】三打祝家庄（三）
										"fuben_shuishidaying/fuben_shuishidaying.nav",    		    --【队伍】水师大营
										"fuben_helanshangu/fuben_helanshangu.nav",                  --【队伍】探索战神墓（一）
										"fuben_xiawangling/fuben_xiawangling.nav",                  --【队伍】探索战神墓（二）
										"fuben_xiawangmu/fuben_xiawangmu.nav",                      --【队伍】探索战神墓（三）
										"fuben_beiyinduconglin/fuben_beiyinduconglin.nav",          --【队伍】印度神庙（一）
										"fuben_xiangshengu/fuben_xiangshengu.nav",                  --【队伍】印度神庙（二）
										"fuben_yindushenmiao/fuben_yindushenmiao.nav",              --【队伍】印度神庙（三）
										"fuben_maqueling/fuben_maqueling.nav",                      --【队伍】教堂的秘密（一）
										"fuben_rongyanzhaoze/fuben_rongyanzhaoze.nav",              --【队伍】教堂的秘密（二）
										"fuben_dajiaotang/fuben_dajiaotang.nav",                    --【队伍】教堂的秘密（三）
										"fuben_huangjinkuangdong/fuben_huangjinkuangdong.nav",      --【队伍】产出金矿洞
										
										"fuben_yuegong/fuben_yuegong.nav",                   	            --【队伍】月宫
										"fuben_tianguan/fuben_tianguan.nav",                   	            --【队伍】天关  使用夏王墓穴地图
										"fuben_ywyxdcz/fuben_ywyxdcz.nav",                   	            --【队伍】杳无音讯的村庄  使用夏王墓穴地图
										"fuben_wuranbiansai/fuben_wuranbiansai.nav",                   	            --【队伍】污染边塞  使用夏王墓穴地图
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										"fuben_wuyishenyuan/fuben_wuyishenyuan.nav",                        --【队伍】神秘宝库
										 "fuben_wuyishenyuan/fuben_wuyishenyuan.nav",								--【个人】十字井副本1
										 "fuben_wuyishenyuan/fuben_wuyishenyuan.nav",--【队伍】十字井副本1
										"fuben_qianfoku/fuben_qianfoku.nav",                        --【队伍】藏宝洞6										

										"fuben_juedouchang/fuben_juedouchang.nav",                  --【团队】角斗场	
										"fuben_juedouchang/fuben_juedouchang.nav", 									--【团队】角斗场精英模式
										"fuben_juedouchang/fuben_juedouchang.nav",                  --【团队】角斗场2	
										"fuben_juedouchang/fuben_juedouchang.nav", 									--【团队】角斗场精英模式2

										"fuben_qiulongdaohaitan/fuben_qiulongdaohaitan.nav",                    --【英雄】囚龙岛海滩            
										"fuben_qiulongling/fuben_qiulongling.nav",          --【英雄】囚龙岭        
										"fuben_qiulongbao/fuben_qiulongbao.nav",                          --【英雄】囚笼堡            
										"fuben_jingongdanei/fuben_jingongdanei.nav",                    --【英雄】禁宫大内   
										"fuben_jinluandian/fuben_jinluandian.nav",                  --【英雄】金銮殿     
										"fuben_heshibi/fuben_heshibi.nav",                          --【英雄】和氏璧        
										"fuben_caishendian/fuben_caishendian.nav",                  --【英雄】对马岛 
								        "fuben_xukongjing/fuben_xukongjing.nav",                    --【英雄】虚空境  
										"fuben_zhuluojigongyuan/fuben_zhuluojigongyuan.nav",        --【英雄】水师大营
										"fuben_zhujiazhuang/fuben_zhujiazhuang.nav",                --【英雄】三打祝家庄（一）
										"fuben_zhujiazhuang2/fuben_zhujiazhuang2.nav",              --【英雄】三打祝家庄（二）
										"fuben_zhujiazhuang3/fuben_zhujiazhuang3.nav",              --【英雄】三打祝家庄（三）
										"fuben_helanshangu/fuben_helanshangu.nav",                  --【英雄】探索战神墓（一）
										"fuben_xiawangling/fuben_xiawangling.nav",                  --【英雄】探索战神墓（二）
										"fuben_xiawangmu/fuben_xiawangmu.nav",                      --【英雄】探索战神墓（三）
										"fuben_beiyinduconglin/fuben_beiyinduconglin.nav",          --【英雄】印度神庙（一）
										"fuben_xiangshengu/fuben_xiangshengu.nav",                  --【英雄】印度神庙（二） 
										"fuben_yindushenmiao/fuben_yindushenmiao.nav",              --【英雄】印度神庙（三） 
										"fuben_maqueling/fuben_maqueling.nav",                      --【英雄】教堂的秘密（一）
										"fuben_rongyanzhaoze/fuben_rongyanzhaoze.nav",              --【英雄】教堂的秘密（二）
										"fuben_dajiaotang/fuben_dajiaotang.nav",                    --【英雄】教堂的秘密（三）
										"city_jiayuankuangdong/city_jiayuankuangdong.nav",                    --【个人】矿山秘洞
										
										"jyfuben1_hannanhecaoyuan/jyfuben1_hannanhecaoyuan.nav",      --【个人】精英剧场
										"jyfuben2_qiyanbu/jyfuben2_qiyanbu.nav",      --【个人】精英剧场
										"jyfuben3_naimanbu/jyfuben3_naimanbu.nav",      --【个人】精英剧场
										"jyfuben4_juyongguan/jyfuben4_juyongguan.nav",      --【个人】精英剧场
										"jyfuben5_fengxiangfu/jyfuben5_fengxiangfu.nav",      --【个人】精英剧场
										"jyfuben6_caizhoucheng/jyfuben6_caizhoucheng.nav",      --【个人】精英剧场
										"jyfuben7_zhongxingfu/jyfuben7_zhongxingfu.nav",      --【个人】精英剧场
										"jyfuben8_jinshan/jyfuben8_jinshan.nav",      --【个人】精英剧场
										"jyfuben9_suiyecheng/jyfuben9_suiyecheng.nav",      --【个人】精英剧场
										"jyfuben10_samaerhan/jyfuben10_samaerhan.nav",      --【个人】精英剧场
										"jyfuben11_hongshamo/jyfuben11_hongshamo.nav",      --【个人】精英剧场
										"jyfuben12_bageda/jyfuben12_bageda.nav",      --【个人】精英剧场
										"jyfuben13_mosikegongguo/jyfuben13_mosikegongguo.nav",      --【个人】精英剧场
										"jyfuben14_jifugongguo/jyfuben14_jifugongguo.nav",      --【个人】精英剧场
										"jyfuben15_bolanwangguo/jyfuben15_bolanwangguo.nav",      --【个人】精英剧场
										"jyfuben16_xiongyaliwangguo/jyfuben16_xiongyaliwangguo.nav",      --【个人】精英剧场
										"jyfuben17_shenshengluomadiguo/jyfuben17_shenshengluomadiguo.nav",      --【个人】精英剧场
										"jyfuben18_baizhantingdiguo/jyfuben18_baizhantingdiguo.nav",      --【个人】精英剧场
										"jyfuben19_duimadao/jyfuben19_duimadao.nav",      --【个人】精英剧场
										"jyfuben20_fugang/jyfuben20_fugang.nav",      --【个人】精英剧场
										"jyfuben21_jiuzhoudao/jyfuben21_jiuzhoudao.nav",      --【个人】精英剧场
										
										
										"jyfuben1_hannanhecaoyuan/jyfuben1_hannanhecaoyuan.nav",      --【个人】精英剧场
										"jyfuben2_qiyanbu/jyfuben2_qiyanbu.nav",      --【个人】精英剧场
										"jyfuben3_naimanbu/jyfuben3_naimanbu.nav",      --【个人】精英剧场
										"jyfuben4_juyongguan/jyfuben4_juyongguan.nav",      --【个人】精英剧场
										"jyfuben5_fengxiangfu/jyfuben5_fengxiangfu.nav",      --【个人】精英剧场
										"jyfuben6_caizhoucheng/jyfuben6_caizhoucheng.nav",      --【个人】精英剧场
										"jyfuben7_zhongxingfu/jyfuben7_zhongxingfu.nav",      --【个人】精英剧场
										"jyfuben8_jinshan/jyfuben8_jinshan.nav",      --【个人】精英剧场
										"jyfuben9_suiyecheng/jyfuben9_suiyecheng.nav",      --【个人】精英剧场
										"jyfuben10_samaerhan/jyfuben10_samaerhan.nav",      --【个人】精英剧场
										"jyfuben11_hongshamo/jyfuben11_hongshamo.nav",      --【个人】精英剧场
										"jyfuben12_bageda/jyfuben12_bageda.nav",      --【个人】精英剧场
										"jyfuben13_mosikegongguo/jyfuben13_mosikegongguo.nav",      --【个人】精英剧场
										"jyfuben14_jifugongguo/jyfuben14_jifugongguo.nav",      --【个人】精英剧场
										"jyfuben15_bolanwangguo/jyfuben15_bolanwangguo.nav",      --【个人】精英剧场
										"jyfuben16_xiongyaliwangguo/jyfuben16_xiongyaliwangguo.nav",      --【个人】精英剧场
										"jyfuben17_shenshengluomadiguo/jyfuben17_shenshengluomadiguo.nav",      --【个人】精英剧场
										"jyfuben18_baizhantingdiguo/jyfuben18_baizhantingdiguo.nav",      --【个人】精英剧场
										"jyfuben19_duimadao/jyfuben19_duimadao.nav",      --【个人】精英剧场
										"jyfuben20_fugang/jyfuben20_fugang.nav",      --【个人】精英剧场
										"jyfuben21_jiuzhoudao/jyfuben21_jiuzhoudao.nav",      --【个人】精英剧场
										
										
										"jyfuben1_hannanhecaoyuan/jyfuben1_hannanhecaoyuan.nav",      --【个人】精英剧场
										"jyfuben2_qiyanbu/jyfuben2_qiyanbu.nav",      --【个人】精英剧场
										"jyfuben3_naimanbu/jyfuben3_naimanbu.nav",      --【个人】精英剧场
										"jyfuben4_juyongguan/jyfuben4_juyongguan.nav",      --【个人】精英剧场
										"jyfuben5_fengxiangfu/jyfuben5_fengxiangfu.nav",      --【个人】精英剧场
										"jyfuben6_caizhoucheng/jyfuben6_caizhoucheng.nav",      --【个人】精英剧场
										"jyfuben7_zhongxingfu/jyfuben7_zhongxingfu.nav",      --【个人】精英剧场
										"jyfuben8_jinshan/jyfuben8_jinshan.nav",      --【个人】精英剧场
										"jyfuben9_suiyecheng/jyfuben9_suiyecheng.nav",      --【个人】精英剧场
										"jyfuben10_samaerhan/jyfuben10_samaerhan.nav",      --【个人】精英剧场
										"jyfuben11_hongshamo/jyfuben11_hongshamo.nav",      --【个人】精英剧场
										"jyfuben12_bageda/jyfuben12_bageda.nav",      --【个人】精英剧场
										"jyfuben13_mosikegongguo/jyfuben13_mosikegongguo.nav",      --【个人】精英剧场
										"jyfuben14_jifugongguo/jyfuben14_jifugongguo.nav",      --【个人】精英剧场
										"jyfuben15_bolanwangguo/jyfuben15_bolanwangguo.nav",      --【个人】精英剧场
										"jyfuben16_xiongyaliwangguo/jyfuben16_xiongyaliwangguo.nav",      --【个人】精英剧场
										"jyfuben17_shenshengluomadiguo/jyfuben17_shenshengluomadiguo.nav",      --【个人】精英剧场
										"jyfuben18_baizhantingdiguo/jyfuben18_baizhantingdiguo.nav",      --【个人】精英剧场
										"jyfuben19_duimadao/jyfuben19_duimadao.nav",      --【个人】精英剧场
										"jyfuben20_fugang/jyfuben20_fugang.nav",      --【个人】精英剧场
										"jyfuben21_jiuzhoudao/jyfuben21_jiuzhoudao.nav",      --【个人】精英剧场
										
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa01_1/fuben_fututa01.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa02_1/fuben_fututa02.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										"fuben_fututa03_1/fuben_fututa03.nav",        --【试炼】浮屠塔（地图后期需要修改）
										             
									  }

x700081_var_FubenTypeList				= {
										FUBEN_HUAPI,				  
										FUBEN_TIANFU,				  
										FUBEN_BAMIYANG,				  
										FUBEN_DAWUSHI,                
										FUBEN_DONGHAIHAIYAN,          
										FUBEN_FUTUTA4,                
										FUBEN_FUTUTA6,                
										FUBEN_GUMU,                   
										FUBEN_HESHIBI,         		  
										FUBEN_JINLUANDIAN,            
										FUBEN_HUANGJINKUANGDONG,      
										FUBEN_HUDI,                   
										FUBEN_HUOCAISHENDIAN,         
										FUBEN_HUOQIYING,              
										FUBEN_LANLONGCHENGBAO,        
										FUBEN_QIULONGDAO,             
										FUBEN_TIANJINGKENG,           
										FUBEN_ZHULUOJI,               
										FUBEN_ZHUJIAZHUANG1,          
										FUBEN_ZHUJIAZHUANG2,          
										FUBEN_ZHUJIAZHUANG3,          
										FUBEN_TANSUO_ZHANSHENMU_1,    
										FUBEN_TANSUO_ZHANSHENMU_2,    
										FUBEN_TANSUO_ZHANSHENMU_3,    
										FUBEN_YINDUSHENMIAO1,         
										FUBEN_YINDUSHENMIAO2,         
										FUBEN_YINDUSHENMIAO3,         
										FUBEN_JIAOTANGMIMI1,          
										FUBEN_JIAOTANGMIMI2,          
										FUBEN_JIAOTANGMIMI3,          
										FUBEN_JUNYAOYAOKOU,           
										FUBEN_BAMIYANG,               
										FUBEN_DAWUSHI,                
										FUBEN_DONGHAIHAIYAN,          
										FUBEN_FUTUTA4,                
										FUBEN_FUTUTA4,                
										FUBEN_FUTUTA4,                
										FUBEN_QIANNVYOUHUN,                
										FUBEN_FUTUTA6,                
										FUBEN_GOULANQUTAI,            
										FUBEN_GUMU,                   
										FUBEN_HESHIBI,           	  
										FUBEN_JINLUANDIAN,            
										FUBEN_HUANGJINKUANGDONG,      
										FUBEN_HUDI,                   
										FUBEN_HUOCAISHENDIAN,         
										FUBEN_HUOQIYING,              
										FUBEN_HUOSHANMUDI,            
										FUBEN_YONGYISENGLIN,          
										FUBEN_SHANGGUMIDAO,           
										FUBEN_LANLONGCHENGBAO,        
										FUBEN_QIULONGDAO,             
										FUBEN_TIANJINGKENG,           
										FUBEN_ZHUJIAZHUANG1,          
										FUBEN_ZHUJIAZHUANG2,          
										FUBEN_ZHUJIAZHUANG3,          
										FUBEN_ZHULUOJI,               
										FUBEN_TANSUO_ZHANSHENMU_1,    
										FUBEN_TANSUO_ZHANSHENMU_2,    
										FUBEN_TANSUO_ZHANSHENMU_3,    
										FUBEN_YINDUSHENMIAO1,         
										FUBEN_YINDUSHENMIAO2,         
										FUBEN_YINDUSHENMIAO3,         
										FUBEN_JIAOTANGMIMI1,          
										FUBEN_JIAOTANGMIMI2,          
										FUBEN_JIAOTANGMIMI3,          
										FUBEN_HUANGJINKUANGDONG,      
										FUBEN_SHENMIBAOKU1,              --【队伍】月宫
										FUBEN_TIANGUAN,              --【队伍】天关
										FUBEN_YWYX,              --【队伍】杳无音讯的村庄
										FUBEN_WRBS,              --【队伍】污染边塞
										FUBEN_SHENMIBAOKU2,              --【队伍】神秘宝库
										FUBEN_SHENMIBAOKU3,              --【队伍】神秘宝库
										FUBEN_SHENMIBAOKU4,              --【队伍】神秘宝库
										FUBEN_SHENMIBAOKU5,              --【队伍】神秘宝库
										FUBEN_SHENMIBAOKU6,              --【队伍】神秘宝库
										FUBEN_SHENMIBAOKU7,              --【队伍】神秘宝库
										FUBEN_SHENMIBAOKU8,              --【队伍】神秘宝库
										FUBEN_SHIZIJING1,			--【个人】十字井副本1
										FUBEN_SHIZIJING2,			--【队伍】十字井副本1
										FUBEN_QIANFOKU6,              --【队伍】藏宝洞6              

										FUBEN_GROUP_JUEDOUCHANG,      --【团队】角斗场
										FUBEN_GROUP_JY_JUEDOUCHANG,   --【团队】角斗场精英模式
										FUBEN_GROUP_JUEDOUCHANG2,      --【团队】角斗场
										FUBEN_GROUP_JY_JUEDOUCHANG2,   --【团队】角斗场精英模式

										FUBEN_QIULONGDAO,             
										FUBEN_LANLONGCHENGBAO,        
										FUBEN_DONGHAIHAIYAN,          
										FUBEN_HUDI,                   
										FUBEN_HESHIBI,           	  
										FUBEN_JINLUANDIAN,            
										FUBEN_HUOCAISHENDIAN,         
										FUBEN_FUTUTA6,                
										FUBEN_ZHULUOJI,               
										FUBEN_ZHUJIAZHUANG1,          
										FUBEN_ZHUJIAZHUANG2,          
										FUBEN_ZHUJIAZHUANG3,          
										FUBEN_TANSUO_ZHANSHENMU_1,    
										FUBEN_TANSUO_ZHANSHENMU_2,    
										FUBEN_TANSUO_ZHANSHENMU_3,    
										FUBEN_YINDUSHENMIAO1,         
										FUBEN_YINDUSHENMIAO2,         
										FUBEN_YINDUSHENMIAO3,         
										FUBEN_JIAOTANGMIMI1,          
										FUBEN_JIAOTANGMIMI2,          
										FUBEN_JIAOTANGMIMI3,
										FUBEN_MIMIKUANGDONG,  --矿山秘洞
										
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										FUBEN_JINGYING,   --【个人】精英剧场
										        
									  }		    
x700081_var_LimitTotalHoldTimeList	= {
										540,	    
										540,	    
										540,		
										540,        
										180,        
										540,        
										540,        
										540*5/2,        
										240,        
										240,        
										540,        
										240,        
										240,        
										300,        
										180,        
										180,        
										540,        
										240,        
										540,        
										540,        
										540,        
										180,        
										180,        
										180,        
										240,        
										240,        
										300,        
										240,        
										240,        
										300,        
																				   
										720,        
										540,        
										540,        
										360,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540*5/2,    
										540,        
										540,        
										540,        
										540,        
										540,        
										540,  	    
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										                    
					                    540,        --【队伍】月宫
					                    540,        --【队伍】天关
					                    540,        --【队伍】杳无音讯的村庄
					                    540,        --【队伍】污染边塞
					                    540,        --【队伍】神秘宝库
					                    540,        --【队伍】神秘宝库
					                    540,        --【队伍】神秘宝库
					                    540,        --【队伍】神秘宝库
					                    540,        --【队伍】神秘宝库
					                    540,        --【队伍】神秘宝库
					                    540,        --【队伍】神秘宝库
					                    540,        --【个人】十字井副本1
					                    540,--【队伍】十字井副本1
					                    540,        --【队伍】藏宝洞6     
					
										540*5/2,        --【团队】角斗场1
										540*5/2,        	--【团队】角斗场精英模式
										240,        --【团队】角斗场2
										240,        	--【团队】角斗场精英模式2
					
										540,	    
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
										540,        
                    540,      --矿山秘洞
					                    540,  
					                    
					                    540,  --【个人】精英剧场  
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场    
					                    
					                    540,  --【个人】精英剧场  
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场  
					                    
					                    540,  --【个人】精英剧场  
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场
					                    540,  --【个人】精英剧场     
									  }						
x700081_var_FutuBackSceneList		= {{0,0,0,0}}

x700081_var_BackSceneList				= {
										{40,40,40,40},	   
										{50,150,250,350},	   
										{50,150,250,350},	  
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										                      
										{39,39,39,39},        
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{40,40,40,40},     
										{50,150,250,350},     
										{39,39,39,39},        
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     

										{87,187,287,387},     --【个人】月宫大作战
										{0,0,0,0},     --【个人】天关
										{0,0,0,0},     --【个人】杳无音讯的村庄
										{0,0,0,0},     --【个人】污染边塞
										{50,150,250,350},     --【队伍】神秘宝库
										{50,150,250,350},     --【队伍】神秘宝库
										{50,150,250,350},     --【队伍】神秘宝库
										{50,150,250,350},     --【队伍】神秘宝库
										{50,150,250,350},     --【队伍】神秘宝库
										{50,150,250,350},     --【队伍】神秘宝库
										{50,150,250,350},     --【队伍】神秘宝库
										{44,44,44,44},     --【个人】十字井副本1
										{44,44,44,44},			--【队伍】十字井副本1
										{50,150,250,350},     --【队伍】藏宝洞6   

										{50,150,250,350},     --【团队】角斗场
										{50,150,250,350},     --【团队】角斗场精英模式      
										{50,150,250,350},     --【团队】角斗场2
										{50,150,250,350},     --【团队】角斗场精英模式2  

										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350},     
										{50,150,250,350}, 
										{50,150,250,350},  --矿山秘洞
										
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
										{0,0,0,0},    --【个人】精英剧场
									  }

x700081_md_List						= { 
										{MD_FUBEN_GOULANQUTAI_DATE,MD_FUBEN_GOULANQUTAI_DAYCOUNT},					
										{MD_FUBEN_TIANFU_DATE, MD_FUBEN_TIANFU_DAYCOUNT},							

										{MD_FUBEN_TRY_BAMIYANG,MD_FUBEN_TRY_BAMIYANG},								
										{MD_FUBEN_TRY_DAWUSHI,MD_FUBEN_TRY_DAWUSHI},                                
										{MD_FUBEN_TRY_DONGHAIHAIYAN,MD_FUBEN_TRY_DONGHAIHAIYAN},                    
										{MD_FUBEN_TRY_FUTUTA4,MD_FUBEN_TRY_FUTUTA4},                                
										{MD_FUBEN_TRY_FUTUTA6,MD_FUBEN_TRY_FUTUTA6},                                
										{MD_FUBEN_TRY_GUMU,MD_FUBEN_TRY_GUMU},                                      
										{MD_FUBEN_TRY_HESHIBISHANG,MD_FUBEN_TRY_HESHIBISHANG},                      
										{MD_FUBEN_TRY_HESHIBIXIA,MD_FUBEN_TRY_HESHIBIXIA},                          
										{MD_FUBEN_TRY_HUANGJINKUANGDONG,MD_FUBEN_TRY_HUANGJINKUANGDONG},            
										{MD_FUBEN_TRY_HUDI,MD_FUBEN_TRY_HUDI},                                      
										{MD_FUBEN_TRY_HUOCAISHENDIAN,MD_FUBEN_TRY_HUOCAISHENDIAN},                  
										{MD_FUBEN_TRY_HUOQIYING,MD_FUBEN_TRY_HUOQIYING},                            
										{MD_FUBEN_TRY_LANLONGCHENGBAO,MD_FUBEN_TRY_LANLONGCHENGBAO},                
										{MD_FUBEN_TRY_QIULONGDAO,MD_FUBEN_TRY_QIULONGDAO},                          
										{MD_FUBEN_TRY_TIANJINGKENG,MD_FUBEN_TRY_TIANJINGKENG},                      
										{MD_FUBEN_TRY_ZHULUOJI,MD_FUBEN_TRY_ZHULUOJI},                              
										{MD_FUBEN_TRY_ZHUJIAZHUANG1,MD_FUBEN_TRY_ZHUJIAZHUANG1},                    
										{MD_FUBEN_TRY_ZHUJIAZHUANG2,MD_FUBEN_TRY_ZHUJIAZHUANG2},                    
										{MD_FUBEN_TRY_ZHUJIAZHUANG3,MD_FUBEN_TRY_ZHUJIAZHUANG3},                    
										{MD_FUBEN_TRY_ZHANSHENMU1,MD_FUBEN_TRY_ZHANSHENMU1},       	                
										{MD_FUBEN_TRY_ZHANSHENMU2,MD_FUBEN_TRY_ZHANSHENMU2},                        
										{MD_FUBEN_TRY_ZHANSHENMU3,MD_FUBEN_TRY_ZHANSHENMU3},                        
										{MD_FUBEN_TRY_SHENMIAO1,MD_FUBEN_TRY_SHENMIAO1},          	                
										{MD_FUBEN_TRY_SHENMIAO2,MD_FUBEN_TRY_SHENMIAO2},                            
										{MD_FUBEN_TRY_SHENMIAO3,MD_FUBEN_TRY_SHENMIAO3},                            
										{MD_FUBEN_TRY_JIAOTANG1,MD_FUBEN_TRY_JIAOTANG1},                            
										{MD_FUBEN_TRY_JIAOTANG2,MD_FUBEN_TRY_JIAOTANG2},                            
										{MD_FUBEN_TRY_JIAOTANG3,MD_FUBEN_TRY_JIAOTANG3},                            
										  
										{MD_FUBEN_JUNYAOYAOKOU_DATE,MD_FUBEN_JUNYAOYAOKOU_DAYCOUNT},					      
										{MD_FUBEN_BAMIYANG_DATE,MD_FUBEN_BAMIYANG_DAYCOUNT},                        
										{MD_FUBEN_DAWUSHI_DATE,MD_FUBEN_DAWUSHI_DAYCOUNT},                          
										{MD_FUBEN_DONGHAIHAIYAN_DATE,MD_FUBEN_DONGHAIHAIYAN_DAYCOUNT},              
										{MD_FUBEN_FUTUTA4_DATE,MD_FUBEN_FUTUTA4_DAYCOUNT},                          
										{MD_FUBEN_FUTUTA4_DATE,MD_FUBEN_FUTUTA4_DAYCOUNT},                          
										{MD_FUBEN_FUTUTA4_DATE,MD_FUBEN_FUTUTA4_DAYCOUNT},                          
										{MD_FUBEN_JUNYAOYAOKOU_DATE,MD_FUBEN_JUNYAOYAOKOU_DAYCOUNT},                          
										{MD_FUBEN_FUTUTA6_DATE,MD_FUBEN_FUTUTA6_DAYCOUNT},                          
										{MD_FUBEN_GOULANQUTAI_DATE,MD_FUBEN_GOULANQUTAI_DAYCOUNT},                  
										{MD_FUBEN_GUMU_DATE,MD_FUBEN_GUMU_DAYCOUNT},                                
										{MD_FUBEN_HESHIBISHANG_DATE,MD_FUBEN_HESHIBISHANG_DAYCOUNT},                
										{MD_FUBEN_HESHIBIXIA_DATE, MD_FUBEN_HESHIBIXIA_DAYCOUNT},                   
										{MD_FUBEN_HUANGJINKUANGDONG_DATE,MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT},      
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},                    
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},                    
										{MD_FUBEN_HUOQIYING_DATE,MD_FUBEN_HUOQIYING_DAYCOUNT},                      
										{MD_FUBEN_YONGYISENGLIN_DATE,MD_FUBEN_YONGYISENGLIN_DAYCOUNT},              
										{MD_FUBEN_YONGYISENGLIN_DATE,MD_FUBEN_YONGYISENGLIN_DAYCOUNT},              
										{MD_FUBEN_YONGYISENGLIN_DATE,MD_FUBEN_YONGYISENGLIN_DAYCOUNT},              
										{MD_FUBEN_LANLONGCHENGBAO_DATE,MD_FUBEN_LANLONGCHENGBAO_DAYCOUNT},          
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},                    
										{MD_FUBEN_TIANJINGKENG_DATE,MD_FUBEN_TIANJINGKENG_DAYCOUNT},                
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},                    
										{MD_FUBEN_ZHUJIAZHUANG2_DATE,MD_FUBEN_ZHUJIAZHUANG2_DAYCOUNT},              
										{MD_FUBEN_ZHUJIAZHUANG3_DATE,MD_FUBEN_ZHUJIAZHUANG3_DAYCOUNT},              
										{MD_FUBEN_ZHULUOJI_DATE,MD_FUBEN_ZHULUOJI_DAYCOUNT},                        
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},       		        
										{MD_FUBEN_YONGYISENGLIN_DATE,MD_FUBEN_YONGYISENGLIN_DAYCOUNT},              
										{MD_FUBEN_YONGYISENGLIN_DATE,MD_FUBEN_YONGYISENGLIN_DAYCOUNT},              
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},          			
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT},                    
										{MD_FUBEN_TIANJINGKENG_DATE,MD_FUBEN_TIANJINGKENG_DAYCOUNT},                
										{MD_FUBEN_QIULONGDAO_DATE,MD_FUBEN_QIULONGDAO_DAYCOUNT, MD_FUBEN_QIULONGDAO_TODAY, MD_FUBEN_QIULONGDAO_TODAYCOUNT},                    
										{MD_FUBEN_ZHUJIAZHUANG2_DATE,MD_FUBEN_ZHUJIAZHUANG2_DAYCOUNT},              
										{MD_FUBEN_ZHUJIAZHUANG3_DATE,MD_FUBEN_ZHUJIAZHUANG3_DAYCOUNT},              
										{MD_FUBEN_ZHULUOJI_DATE,MD_FUBEN_ZHULUOJI_DAYCOUNT},                        
										
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT, MD_FUBEN_HUANGHOUHUAYUAN_X,MD_FUBEN_HUANGHOUHUAYUAN_Y},                                --【队伍】月宫
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT, MD_FUBEN_HUANGHOUHUAYUAN_X,MD_FUBEN_HUANGHOUHUAYUAN_Y},                                --【队伍】天关
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT, MD_FUBEN_HUANGHOUHUAYUAN_X,MD_FUBEN_HUANGHOUHUAYUAN_Y},                                --【队伍】杳无音讯的村庄
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT, MD_FUBEN_HUANGHOUHUAYUAN_X,MD_FUBEN_HUANGHOUHUAYUAN_Y},                                --【队伍】污染边塞
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},                --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},      --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},                          --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},                      --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},      --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},                          --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},                      --【队伍】神秘宝库
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y},  --【个人】十字井副本1
										{MD_FUBEN_HUANGHOUHUAYUAN_DATE,MD_FUBEN_HUANGHOUHUAYUAN_DAYCOUNT,MD_FUBEN_HUANGHOUHUAYUAN_X, MD_FUBEN_HUANGHOUHUAYUAN_Y}, --【队伍】十字井副本1        
										{MD_FUBEN_HUANGJINKUANGDONG_DATE,MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT},      --【队伍】藏宝洞6     

										-- 团队副本MD用于记录副本进度
										{MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS, MD_FUBEN_GROUP_JUEDOUCHANG_WEEK},			-- 【团队】角斗场
										{MD_FUBEN_GROUP_JY_JUEDOUCHANG_PROCESS, MD_FUBEN_GROUP_JY_JUEDOUCHANG_WEEK},		--【团队】角斗场精英模式
										{MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2, MD_FUBEN_GROUP_JUEDOUCHANG_WEEK2},				-- 【团队】角斗场2
										{MD_FUBEN_GROUP_JY_JUEDOUCHANG_PROCESS2, MD_FUBEN_GROUP_JY_JUEDOUCHANG_WEEK2},	--【团队】角斗场精英模式2
										
										
										--挑战副本
										{MD_FUBEN_CHALLENGE_QIULONGDAO_DATE,MD_FUBEN_CHALLENGE_QIULONGDAO_DAYCOUNT}, --挑战囚龙岛 
										{MD_FUBEN_CHALLENGE_QIULONGDAO_DATE,MD_FUBEN_CHALLENGE_QIULONGDAO_DAYCOUNT}, 
										{MD_FUBEN_CHALLENGE_QIULONGDAO_DATE,MD_FUBEN_CHALLENGE_QIULONGDAO_DAYCOUNT}, 
										
										{MD_FUBEN_CHALLENGE_HESHIBI_DATE,MD_FUBEN_CHALLENGE_HESHIBI_DAYCOUNT},--挑战和氏璧
										{MD_FUBEN_CHALLENGE_HESHIBI_DATE,MD_FUBEN_CHALLENGE_HESHIBI_DAYCOUNT},
										{MD_FUBEN_CHALLENGE_HESHIBI_DATE,MD_FUBEN_CHALLENGE_HESHIBI_DAYCOUNT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										{MD_FUBEN_CHALLENGE_DEFAULT,MD_FUBEN_CHALLENGE_DEFAULT},
										
										{MD_FUBEN_MIMIKUANGD_DATE,MD_FUBEN_MIMIKUANGD_DAYCOUNT},  --矿山秘洞

									  }
x700081_var_FutuEnterInfoList				= {"\t你确定要进入浮屠塔么？"}

x700081_var_EnterInfoList				=	{
											"\t灵妖异兽在修炼千年时会遇上天劫，度得过则原丹成型法力大增，度不过则会原丹碎裂魂飞魄灭。更有那些想借机吞食度劫的灵妖异兽灵力以增强自己修为的恶鬼修罗虎视眈眈，趁机夺取法力原丹。本有一只近千年修炼的白狐，无伤无害，渡天劫时却被妖魔堵截。此时，带领将士搜寻天地异像的王生经过此处，发现屋角的柴堆上卧着一只小白狐，嘴角流着丝丝血迹，看来受伤不轻。因不忍小白狐遭受恶鬼的残害，毅然出手相救。\n#Y开放时间：#W周六周日全天开放。\n#Y友情提示：#W挑战分三个阶段，四周的通道内会涌出各种喽罗阻碍你对BOSS的进攻，不提防特殊怪物可能会吃亏哦！组队进入可以提高副本的完成效率，Boss具有超强的伤害力，有治疗系的队友能更轻松游戏。\n#Y副本说明：#W副本存活时间为45分钟，请玩家在该时间内完成。",
											"--ぱ结捌セ_ゑ?Z",
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得水晶奖励！",  

											"\t大巫师勃鲁合利用了两个王子重建旧部的野心，招揽了曾经的旧部，并用巫术把那些人变成了自己的信徒，势力渐渐延伸到了边塞，并占据了景教堂。\n\t迦色尼王对他们产生了警惕，带着迦色尼的勇士，包围了景教堂，却被巫法阻挡在了教堂之外……你需要进入教堂之中，尽快的把邪恶的巫师巴桑给驱逐出去。\n#y开放时间：#w全天\n#y友情提示：#w该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#y副本说明：#w在这个副本中，你可以获得制造材料奖励！",  
											
											"\t刚才击败的只是摩诃末的一个肉身而已，他的真身——三头凶蛟藏身于囚龙堡之中。只有消灭了三头凶蛟，才能真正消灭摩诃末！",  

											"\t为了查清和亲船队失踪的真相，太子利用萨满教的神秘力量创建轮回台，开启时空之门，却被人从中破坏，导致时空错乱，很多史前生物涌现，史前生物随时进攻王城，王城的安危遭受严重的威胁。\n\t太子召集王城的勇士进行抵抗，到轮回台阻止那些史前怪物，消灭一切用心邪恶的人！\n#Y开放时间：#W全天开放，每天仅能进入一次！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！",  

											"\t贫道经过仔细探查，发现方才赤血号仅仅是通往金山大玉海所在之处的一个入口。赤血号，是金山大玉海灵气外泄所成，而此处，正是灵气最为浓密所在。且待贫道施展道法，将你们送往那里。",  

											"\t战神大旗被埋葬在战神墓之中，被人们称为战神的旭烈兀在死后，他的灵魂依旧守护者黄金家族的“战神大旗”。察八儿派遣了他最得力的手下，企图进入战神墓盗取战神大旗，以图提高窝阔台家族在黄金家族的地位。察八儿的手下在进入战神墓后，遇上了忽必烈汗派来的守护者。\n#y开放时间：#w全天\n#y友情提示：#w该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#y副本说明：#w在这个副本中，你可以获得龙眼石奖励！",  

											"\t和氏璧内封印了八位历代枭雄的魂魄。现在这八位枭雄蠢蠢欲动，企图破璧而出重返人间，快去阻止他们！",  

											"\t陈理等率领手下的乱贼已经攻入了金銮殿，快去阻止他们的阴谋！\n#Y副本说明：#R敌对势力如果高于50，则会副本失败！",  

											"\t由于过量开采，惊扰了藏在地下了恶魔，金矿洞内的大量的矿工惨死，在矿洞附近的居民受到了生命威胁。赤老温家族奉大汗的命令，率领众勇士前往矿洞，驱逐敌对势力并杀死恶魔。\n#y开放时间：#w全天\n#y友情提示：#w该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#y副本说明：#w在这个副本中，你可以获得金钱奖励！",  

											"\t唐末黄巢作乱，攻入长安，唐僖宗南逃入蜀，自秦始皇以来象征着至高无上皇权的玉玺——和氏璧竟然不知所踪。没有和氏璧者，不能一统天下，更不能长治久安，所以不久黄巢败亡，其后朱温篡唐，开始了王朝更替频繁、军阀混战不休的五代十国时期。偏安一隅的宋朝，与割据一方的辽、金、西夏、大理、吐蕃彼此攻伐征战。天下大乱达数百年之久。\n\t自唐末战乱时失落的玉玺和氏璧重现人间，落入成吉思汗之手，大元得以统一天下。但金国、西夏的皇族后裔，中原武林的明教盐帮，大元悍将王保保等人，妄图夺取和氏璧，以实现自己的野心。守卫和氏璧的大元怯薛军和这些野心家在皇宫内连番激战……\n\t保卫和氏璧，就是保卫大元，就是保卫天下的黎民百姓。\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t日本武士盘踞在对马岛，阴谋对大元发起攻击。但这个阴谋被大元商人汪大渊获悉，并报给了忽必烈。忽必烈派大元勇士潜入对马岛，火烧日本舰船，消灭了聚集在岛上的日本武士，消除了大元的隐患！\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t北条时宗的爪牙和羽翼都已经被翦除，现在是消灭他的时候了！",  

											"\t登陆囚龙岛海滩之后，是更加阴森恐怖的囚龙岭，摩诃末就躲在那里。勇士，去把他揪出来，斩首示众！",  

											"\t成吉思汗西征时，花剌子模国王摩诃末逃到囚龙岛。因大海所阻，缺少渡船，蒙古军队只能望洋兴叹，率军而返。摩诃末积蓄力量，妄图卷土重来。护国法师丘处机发觉了他的阴谋，于是成吉思汗派出勇士登陆囚龙岛，经过激战，将摩诃末及其部下全部消灭。\n#Y开放时间：#W全天\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t扎兰丁依靠着冰魄银晶获得了不死之身，最后被成吉思汗禁锢在了永夜天牢之中。永夜天牢的封印之力渐渐黯淡，被禁锢在天牢里的扎兰丁试图越狱，重建花剌子模国。\n\t国师苏德延吉儿得悉了扎兰丁的阴谋，派遣你这个王国最杰出的勇士进入永夜天牢，激活封印之力，并打败扎兰丁，从他身上夺得冰魄银晶。\n#y开放时间：#w全天开放！\n#y友情提示：#w该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#y副本说明：#w在这个副本中，你可以获得声望奖励！",  

											"\t前面就是北条时宗的水师大营，妄图侵犯大元的日本战船全都停泊在大营内。速速将这些战船全部烧毁，决不能让敌人的阴谋得逞！",  
											
											"\t那时迁人送绰号'鼓上蚤'，见众好汉顺利攻入，连忙施展'缩骨法'，逃出牢笼，祝家庄内机关重重，处处伏兵，时迁虽出牢笼却未能逃出火坑……\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t本以为可以顺利救出时迁哥哥，不想半路又杀出这个“程咬金”来！看来我们非要二入祝家庄不可，听说那一丈青扈三娘善用异术，庄内五行碑便是她施法的根源。\n\t此庄方圆数里，又勾结官府欺压良民，今日前来正好将它连根拔起，庄内财物抬到山上，足够我等弟兄几年吃喝。\n\t只是怕我们破了那扈三娘的五行碑，他们早已抬走了财宝逃之夭夭，若不先破五行碑那扈三娘着实难以对付。\n\t这可如何是好？\n#Y小提示：\n\t#W扈三娘的能力来自五行碑，如果实力足够，可以选择#G尽量少的破坏五行碑#W，这样在击败扈三娘后会得到#G更丰厚的回报#W。",  

											"\t我乃神行太保戴宗，此次下山特为送信而来，公明哥哥已经向天禀明，祝家为富不仁，欺压良民，草菅人命，梁山今日之举实为替天行道，绝非滥杀无辜！\n\t这位兄弟，快随我一共杀进祝家庄！\n#Y小提示：\n\t#W如果能够在击败祝氏三兄弟之前击败扈三娘，那么你将会得到非常好的回报。",  

											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t前面就是夏王陵了，完颜洪烈手下的精锐都聚集在那里，千万要当心！",
											
											"\t老贼完颜洪烈就在夏王墓穴中，速速将他消灭！",
											
											"\t花剌子模王子札兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除札兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙…… \n#y开放时间：#w全天开放！\n#y友情提示：#w该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#y副本说明：#w在这个副本中，你可以获得大量经验奖励！",
											
											"\t前面的象神谷，隐隐笼罩着一层迷雾，不知什么怪物潜伏其中。也不知有邪神庇护的扎兰丁会耍出什么花招，千万要小心。",
											
											"\t扎兰丁不死之身的秘密，就隐藏在前面的印度神庙之中！只要解开了这个秘密，不死战神扎兰丁就会变成凡夫俗子，将会被轻而易举的击败！",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t大元将士连战连捷，那些欧洲骑士已经溃不成军，我们应当乘胜追击，决不给敌人喘息之机！",
											
											"\t大元将士连战连捷，那些欧洲骑士已经溃不成军，我们应当乘胜追击，决不给敌人喘息之机！",
											
											
											
											

											"\t大都陶家一直有祖训，不得移动此壶，否则就会有妖兽出现，酿成天灾人祸。大奸臣哈嘛手下有一个偏将名叫律罗，因哈嘛大寿在即，又听说陶录一家有宝物，便不顾陶家人的阻拦，带人冲进了钧窑，见到炼妖壶后，一眼便看出此物并非凡品，动手去抢，突然间壶中烈焰突起，将这一干人卷入火海，烈焰腾起，劫火妖魔从壶中幻化而出。\n#Y开放时间：#W仅在每周六、日开放！每周只能进入一次！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！还可以从陶录那里兑换神传钻石原石！",  

											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶奖励！",   

											"\t大巫师勃鲁合利用了两个王子重建旧部的野心，招揽了曾经的旧部，并用巫术把那些人变成了自己的信徒，势力渐渐延伸到了边塞，并占据了景教堂。\n\t迦色尼王对他们产生了警惕，带着迦色尼的勇士，包围了景教堂，却被巫法阻挡在了教堂之外……你需要进入教堂之中，尽快的把邪恶的巫师巴桑给驱逐出去。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！\n#y副本说明：#w在这个副本中，你可以获得制造材料奖励！",  

											"\t刚才击败的只是摩诃末的一个肉身而已，他的真身——三头凶蛟藏身于囚龙堡之中。只有消灭了三头凶蛟，才能真正消灭摩诃末！",  

											"\t为了查清和亲船队失踪的真相，太子利用萨满教的神秘力量创建轮回台，开启时空之门，却被人从中破坏，导致时空错乱，很多史前生物涌现，史前生物随时进攻王城，王城的安危遭受严重的威胁。\n\t太子召集王城的勇士进行抵抗，到轮回台阻止那些史前怪物，消灭一切用心邪恶的人！\n#Y开放时间：#W全天开放，每天仅能进入一次！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！#G副本等级低于五十级时，王城将军将会派出王城中六大护卫协助各位勇士共同完成任务。#R不要放过任何一个怪物，否则可能会导致您无法进入排行榜，怪物到一定时间会消失，消失1个BOSS相当于消失2个小怪！\n#Y副本说明：#W在这个副本中，你可以获得海量经验！当队伍中最低等级的玩家和最高等级的玩家等级差大于等于15级时，怪物难度会大大降低！并且不会降低高级玩家所获得的经验！" ,  
											"\t为了查清和亲船队失踪的真相，太子利用萨满教的神秘力量创建轮回台，开启时空之门，却被人从中破坏，导致时空错乱，很多史前生物涌现，史前生物随时进攻王城，王城的安危遭受严重的威胁。\n\t太子召集王城的勇士进行抵抗，到轮回台阻止那些史前怪物，消灭一切用心邪恶的人！\n#Y开放时间：#W全天开放，每天仅能进入一次！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！#G副本等级低于五十级时，王城将军将会派出王城中六大护卫协助各位勇士共同完成任务。#R不要放过任何一个怪物，否则可能会导致您无法进入排行榜，怪物到一定时间会消失，消失1个BOSS相当于消失2个小怪！\n#Y副本说明：#W在这个副本中，你可以获得海量声望！当队伍中最低等级的玩家和最高等级的玩家等级差大于等于15级时，怪物难度会大大降低！并且不会降低高级玩家所获得的声望！" ,  
											"\t为了查清和亲船队失踪的真相，太子利用萨满教的神秘力量创建轮回台，开启时空之门，却被人从中破坏，导致时空错乱，很多史前生物涌现，史前生物随时进攻王城，王城的安危遭受严重的威胁。\n\t太子召集王城的勇士进行抵抗，到轮回台阻止那些史前怪物，消灭一切用心邪恶的人！\n#Y开放时间：#W全天开放，每天仅能进入一次！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！#G副本等级低于五十级时，王城将军将会派出王城中六大护卫协助各位勇士共同完成任务。#R不要放过任何一个怪物，否则可能会导致您无法进入排行榜，怪物到一定时间会消失，消失1个BOSS相当于消失2个小怪！\n#Y副本说明：#W在这个副本中，你可以获得海量天赋！当队伍中最低等级的玩家和最高等级的玩家等级差大于等于15级时，怪物难度会大大降低！并且不会降低高级玩家所获得的天赋！" ,  
											"\t小倩本是兰若寺的女鬼，受树姥姥控制，为她捕猎男人的精血。心地善良的小倩奉命去勾落魄穷书生宁采臣时，发现酒色财气各种诱惑对他都完全不管用，反而一心只挂记别人安危。小倩被宁采臣感动，非但下不了手伤害他，并爱上了这个质朴憨厚的呆书生。在宁采臣知道小倩是女鬼时，也被她的善良和爱所感动，遂决定帮助她逃出树姥姥的控制。姥姥发现后大怒之下将小倩打入鬼门关。而宁采臣也毅然追入地府寻找小倩。阎王发现宁采臣时，因其乐善好施并阳寿未尽，不予追究。但聂小倩本为女鬼，被黑白无常所羁押。地府一痴情小鬼见二人阴阳相隔却情丝相连，不忍于心遂私自放走聂小倩。地府内是危难阻碍重重，小倩是否能安然逃脱黑白无常的追击与宁采臣重逢，还是未知之数！\n#Y开放时间：#W周六周日，每周仅能进入一次！\n#Y友情提示：#W消灭沿路出现的怪物才能继续前进，而每一次出现的鬼怪会依次递增！触发路边的指明灯可让追击的黑无常停留30秒。\n#Y副本说明：副本存活时间为45分钟，请玩家在该时间内完成。当黑无常追上聂小倩时副本失败！" ,  

											"\t贫道经过仔细探查，发现方才赤血号仅仅是通往金山大玉海所在之处的一个入口。赤血号，是金山大玉海灵气外泄所成，而此处，正是灵气最为浓密所在。且待贫道施展道法，将你们送往那里。",  

											"\t大都之内喜气洋洋，张灯结彩，四大才子欲展平生所学，八月十五在勾栏院中将自己的平生之能尽现出来，不想竟遇到了戏中之戏……\n#Y开放时间：#W仅在每周六、日开放！每周只能进入一次！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！还可能获得墨玉钻——第三孔打孔道具！",  

											"\t战神大旗被埋葬在战神墓之中，被人们称为战神的旭烈兀在死后，他的灵魂依旧守护者黄金家族的“战神大旗”。察八儿派遣了他最得力的手下，企图进入战神墓盗取战神大旗，以图提高窝阔台家族在黄金家族的地位。察八儿的手下在进入战神墓后，遇上了忽必烈汗派来的守护者。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！有治疗系的队友能更轻松游戏！\n#y副本说明：#w在这个副本中，你可以获得龙眼石奖励！",  

											"\t千百年来无数野心家想要得到这个镇国之宝和氏璧，围绕着它的争夺数不胜数，其中有八位野心家不肯承认自己的失败，一直执着地在留在和氏璧之内，只有击败他们才能让异象消失。",  

											"\t恭喜你们，百年来从没有人能击败那八个野心家！现在，我将带你们进入金銮殿，如果你能通过金銮殿的考验，除了会得到非凡的奖励之外更有机会金銮殿，预知未来。\n#Y副本说明：#R敌对势力如果高于50，则会副本失败！",  

											"\t由于过量开采，惊扰了藏在地下了恶魔，金矿洞内的大量的矿工惨死，在矿洞附近的居民受到了生命威胁。赤老温家族奉大汗的命令，率领众勇士前往矿洞，驱逐敌对势力并杀死恶魔。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！\n#y副本说明：#w在这个副本中，你可以获得金钱奖励！",  

											"\t宋金大战后，镇国之宝和氏璧流落民间，百年后突然出现在了东海海眼之中，找到和氏璧的人只要能够降伏隐藏于和氏璧之中的八位枭雄的魂魄就能够借助和氏璧的力量，预见未来百年之事。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t日本武士盘踞在对马岛，阴谋对大元发起攻击。但这个阴谋被大元商人汪大渊获悉，并报给了忽必烈。忽必烈派大元勇士潜入对马岛，火烧日本舰船，消灭了聚集在岛上的日本武士，消除了大元的隐患！\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t北条时宗的爪牙和羽翼都已经被翦除，现在是消灭他的时候了！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得制造材料奖励！",  

											"\t木华黎的揽月之杖，哲别的逐日之弓，速不台的劈天之斧是大草原最有价值的宝物，传闻这些宝物藏在以逐日、揽月、劈天三个标记的古迹之中。\n\t有人发现了这些古迹的入口，你的使命，便是到古迹之中探宝！一探究竟！\n#Y开放时间：#W国家发布！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t木华黎的揽月之杖，哲别的逐日之弓，速不台的劈天之斧是大草原最有价值的宝物，传闻这些宝物藏在以逐日、揽月、劈天三个标记的古迹之中。\n\t有人发现了这些古迹的入口，你的使命，便是到古迹之中探宝！一探究竟！\n#Y开放时间：#W国家发布！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t木华黎的揽月之杖，哲别的逐日之弓，速不台的劈天之斧是大草原最有价值的宝物，传闻这些宝物藏在以逐日、揽月、劈天三个标记的古迹之中。\n\t有人发现了这些古迹的入口，你的使命，便是到古迹之中探宝！一探究竟！\n#Y开放时间：#W国家发布！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  

											"\t登陆囚龙岛海滩之后，是更加阴森恐怖的囚龙岭，摩诃末就躲在那里。勇士，去把他揪出来，斩首示众！",  

											"\t自从郭宝玉将军战败于囚龙岛后，霹雳神火诀落入囚龙岛的魔龙军团手中，而随军大萨满临终前布下的结界随着时间的推移渐渐失效。一旦让魔龙军团脱困，霹雳神火诀将被欧洲诸国所利用，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t郭侃将军奉命前往囚龙岛调查祖父郭宝玉当年战败的原因，并取回遗失的“霹雳神火诀”，在这个时候，极度需要一群武艺高强，勇气十足的勇士，从囚龙岛进入龙穴，在魔龙的手中拿回“霹雳神火诀”。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！\n#y副本说明：#w在这个副本中，你可以获得大量经验奖励！",  

											"\t扎兰丁依靠着冰魄银晶获得了不死之身，最后被成吉思汗禁锢在了永夜天牢之中。永夜天牢的封印之力渐渐黯淡，被禁锢在天牢里的扎兰丁试图越狱，重建花剌子模国。\n\t国师苏德延吉儿得悉了扎兰丁的阴谋，派遣你这个王国最杰出的勇士进入永夜天牢，激活封印之力，并打败扎兰丁，从他身上夺得冰魄银晶。\n#y开放时间：#w全天开放！\n#y友情提示：#w3人以上的队伍，才能进入该副本！有治疗系的队友能更轻松游戏。\n#y副本说明：#w在这个副本中，你可以获得声望奖励！",  

											"\t那时迁人送绰号'鼓上蚤'，见众好汉顺利攻入，连忙施展'缩骨法'，逃出牢笼，祝家庄内机关重重，处处伏兵，时迁虽出牢笼却未能逃出火坑……\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！",  

											"\t本以为可以顺利救出时迁哥哥，不想半路又杀出这个“程咬金”来！看来我们非要二入祝家庄不可，听说那一丈青扈三娘善用异术，庄内五行碑便是她施法的根源。\n\t此庄方圆数里，又勾结官府欺压良民，今日前来正好将它连根拔起，庄内财物抬到山上，足够我等弟兄几年吃喝。\n\t只是怕我们破了那扈三娘的五行碑，他们早已抬走了财宝逃之夭夭，若不先破五行碑那扈三娘着实难以对付。\n\t这可如何是好？\n#Y小提示：\n\t#W扈三娘的能力来自五行碑，如果实力足够，可以选择#G尽量少的破坏五行碑#W，这样在击败扈三娘后会得到#G更丰厚的回报#W。",  

											"\t我乃神行太保戴宗，此次下山特为送信而来，公明哥哥已经向天禀明，祝家为富不仁，欺压良民，草菅人命，梁山今日之举实为替天行道，绝非滥杀无辜！\n\t这位兄弟，快随我一共杀进祝家庄！\n#Y小提示：\n\t#W如果能够在击败祝氏三兄弟之前击败扈三娘，那么你将会得到非常好的回报，#G九旄战神#W出现的概率也会#G显着提高#W。",  

											"\t前面就是北条时宗的水师大营，妄图侵犯大元的日本战船全都停泊在大营内。速速将这些战船全部烧毁，决不能让敌人的阴谋得逞！",  
											
											"\t前面就是夏王陵了，完颜洪烈手下的精锐都聚集在那里，千万要当心！",
											
											"\t前面就是夏王陵了，完颜洪烈手下的精锐都聚集在那里，千万要当心！",
											
											"\t老贼完颜洪烈就在夏王墓穴中，速速将他消灭！",
											
											"\t前面的象神谷，隐隐笼罩着一层迷雾，不知什么怪物潜伏其中。也不知有邪神庇护的扎兰丁会耍出什么花招，千万要小心。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t前面的象神谷，隐隐笼罩着一层迷雾，不知什么怪物潜伏其中。也不知有邪神庇护的扎兰丁会耍出什么花招，千万要小心。",
											
											"\t扎兰丁不死之身的秘密，就隐藏在前面的印度神庙之中！只要解开了这个秘密，不死战神扎兰丁就会变成凡夫俗子，将会被轻而易举的击败！",
											
											"\t大元将士连战连捷，那些欧洲骑士已经溃不成军，我们应当乘胜追击，决不给敌人喘息之机！",
											
											"\t大元将士连战连捷，那些欧洲骑士已经溃不成军，我们应当乘胜追击，决不给敌人喘息之机！",
											
											"\t大元将士连战连捷，那些欧洲骑士已经溃不成军，我们应当乘胜追击，决不给敌人喘息之机！",
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得奖励！",--【队伍】产出金矿洞
											
											"\t月宫出了乱子，有头天虎神兽隔三差五就跑来捣乱，扰的人头疼。快去收服那头作乱的天虎吧！\n#Y开放时间：#W全天开放！\n#Y友情提示：#W必须持有月宫进入次数才可以进入副本，每日最多可进入3次！\n#Y副本说明：#W在这个副本中，需要消灭各种害虫收集月饼材料，完成魔法月饼解除月兔魔咒，击败天虎神兽！",--【个人】月宫大作战 
											"\t天关是一个充满挑战的副本，里面有强大的怪物和Boss。",--【个人】天关
											"\t这是一个充满挑战的副本，里面有强大的怪物和Boss。",--【个人】杳无音讯的村庄
											"\t这是一个充满挑战的副本，里面有强大的怪物和Boss。",--【个人】污染边塞

											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库 
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库 
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库 
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库 
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库 
											
											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】神秘宝库

											"\t这批万奴冥王的爪牙虽然实力一般，但若让他们集合成军，也会造成相当大的麻烦。在他们还没有联合起来之前，各个击破是最好的选择！万奴冥王的爪牙实力一般，通常一个玩家就可以击败他们，获得不菲的经验和宝贝。",  --【个人】十字井副本1
											
											"\t这批万奴冥王的死士突然出现在后花园，必然有着不可告人的目的。在他们还没有联合起来之前，各个击破是最好的选择！万奴冥王的死士虽然不好对付，但若是组队进入（3人以上），击败他们也会获得大量的经验和宝贝。", --【队伍】十字井副本1

											"\t传说佛祖释迦摩尼涅??之后，留下六颗真身舍利，其中一舍利，多方辗转，最终被一位高僧镶嵌在藏宝洞一座大佛的佛头中，可是，自从察合台汗国的那一帮败类来到了王城，他们整日打着黄金家族后裔的幌子，百方打探得知了藏宝洞的位置，并派遣大量人手进入其中，欲盗取佛祖舍利。\n\t百年前我们耶律家族曾追随大汗征战四方，如今我们也不能坐视这宝物落入歹人之手！\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【队伍】藏宝洞6

											"\t组团进角斗场！\n\t\n#Y开放时间：#W全天\n#Y友情提示：#W12人的团队，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【团队】角斗场
											
											"\t组团进角斗场！\n\t\n#Y开放时间：#W全天\n#Y友情提示：#W12人的团队，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【团队】角斗场精英模式
											
											"\t组团进角斗场！\n\t\n#Y开放时间：#W全天\n#Y友情提示：#W12人的团队，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【团队】角斗场
											
											"\t组团进角斗场！\n\t\n#Y开放时间：#W全天\n#Y友情提示：#W12人的团队，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得水晶、龙眼石、生活技能材料、银子等各种奖励！",--【团队】角斗场精英模式2
											
											
											"\t自从郭宝玉将军战败于囚龙岛后，霹雳神火诀落入囚龙岛的魔龙军团手中，而随军大萨满临终前布下的结界随着时间的推移渐渐失效。\n\t郭侃将军奉命前往囚龙岛调查祖父郭宝玉当年战败的原因，并取回遗失的“霹雳神火诀”，我们需要一群勇士，从囚龙岛进入龙穴，在魔龙的手中拿回“霹雳神火诀”。\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t那些红鼻子蓝眼睛的欧洲大军？他们在塞浦路斯被我们打得屁滚尿流，我们最后却陷入了囚龙岛，被魔龙军团偷袭，没有一个人能活着离开！\n\t这批魔龙军团就在这个岛上的城堡里，他们甘愿服侍两只蓝色的恶龙！我们的士兵无法对付这种怪物！\n\t作为随军的萨满大法师，我燃烧了自己的生命，激活了最强大的禁锢结界，“霹雳神火诀”才不至于流传出去。\n\t我的勇士，进入囚龙城堡，去完成你的使命！",  
											"\t龙穴位于囚龙城堡的海底之中，里面深藏着一只三头凶蛟和各种海底怪物。丢失的“霹雳神火诀”很有可能就在这洞穴之中。\n\t“霹雳神火诀”记载了最厉害的火器制作方法，一旦落入欧洲诸国手中，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t这关系到国家未来的安危，十分火急！你必须进入龙穴，为天下百姓解决这个巨大的隐患！",  
											"\t宋金大战后，镇国之宝和氏璧流落民间，百年后突然出现在了东海海眼之中，找到和氏璧的人只要能够降伏隐藏于和氏璧之中的八位枭雄的魂魄就能够借助和氏璧的力量，预见未来百年之事。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t千百年来无数野心家想要得到这个镇国之宝和氏璧，围绕着它的争夺数不胜数，其中有八位野心家不肯承认自己的失败，一直执着地在留在和氏璧之内，只有击败他们才能让异象消失。",  
											"\t恭喜你们，百年来从没有人能击败那八个野心家！现在，我将带你们进入金銮殿，如果你能通过金銮殿的考验，除了会得到非凡的奖励之外更有机会金銮殿，预知未来。\n#Y副本说明：#R敌对势力如果高于50，则会副本失败！",  
											"\t日本武士盘踞在对马岛，阴谋对大元发起攻击。但这个阴谋被大元商人汪大渊获悉，并报给了忽必烈。忽必烈派大元勇士潜入对马岛，火烧日本舰船，消灭了聚集在岛上的日本武士，消除了大元的隐患！\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t贫道经过仔细探查，发现方才赤血号仅仅是通往金山大玉海所在之处的一个入口。赤血号，是金山大玉海灵气外泄所成，而此处，正是灵气最为浓密所在。且待贫道施展道法，将你们送往那里。",  
											"\t方才贫道已经施法打开了此处与金山大玉海所在之地的封印，但是……贫道万万没有想到，那里竟然渺无人迹，只有无数凶兽横行。\n\t按照贫道的推算，这奇异之地的时光应当是亿年之前，盘古开天辟地之后的蛮荒时期，这世间之奇妙，确非我等能够想象，不过，金山大玉海毕竟是上古奇异之物，藏于此地并不为怪。",  
											"\t那时迁人送绰号'鼓上蚤'，见众好汉顺利攻入，连忙施展'缩骨法'，逃出牢笼，祝家庄内机关重重，处处伏兵，时迁虽出牢笼却未能逃出火坑……\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！",  

											"\t本以为可以顺利救出时迁哥哥，不想半路又杀出这个“程咬金”来！看来我们非要二入祝家庄不可，听说那一丈青扈三娘善用异术，庄内五行碑便是她施法的根源。\n\t此庄方圆数里，又勾结官府欺压良民，今日前来正好将它连根拔起，庄内财物抬到山上，足够我等弟兄几年吃喝。\n\t只是怕我们破了那扈三娘的五行碑，他们早已抬走了财宝逃之夭夭，若不先破五行碑那扈三娘着实难以对付。\n\t这可如何是好？\n#Y小提示：\n\t#W扈三娘的能力来自五行碑，如果实力足够，可以选择#G尽量少的破坏五行碑#W，这样在击败扈三娘后会得到#G更丰厚的回报#W。",  

											"\t我乃神行太保戴宗，此次下山特为送信而来，公明哥哥已经向天禀明，祝家为富不仁，欺压良民，草菅人命，梁山今日之举实为替天行道，绝非滥杀无辜！\n\t这位兄弟，快随我一共杀进祝家庄！\n#Y小提示：\n\t#W如果能够在击败祝氏三兄弟之前击败扈三娘，那么你将会得到非常好的回报，#G九旄战神#W出现的概率也会#G显着提高#W。",  

											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											"\t进去之后一切小心行事，祝你好运！",
										
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										    "\t终于进入精英剧场",   --【个人】精英剧场
										} 
										
										
x700081_var_EnterMenuDescList				=	{
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",
											
											
											
											

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",   

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。" ,  
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。" ,  
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。" ,  
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。" ,  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。",  
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", 
																						
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】月宫
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。", --【队伍】天关
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。", --【队伍】杳无音讯的村庄
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。", --【队伍】污染边塞

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】神秘宝库 
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【个人】十字井副本1  
											

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】十字井副本1
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【队伍】藏宝洞

											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【团队】角斗场
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【团队】角斗场精英模式  
										
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【团队】角斗场2
											
											"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回王城。", --【团队】角斗场精英模式2
											
											"\t自从郭宝玉将军战败于囚龙岛后，霹雳神火诀落入囚龙岛的魔龙军团手中，而随军大萨满临终前布下的结界随着时间的推移渐渐失效。一旦让魔龙军团脱困，霹雳神火诀将被欧洲诸国所利用，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t郭侃将军奉命前往囚龙岛调查祖父郭宝玉当年战败的原因，并取回遗失的“霹雳神火诀”，在这个时候，极度需要一群武艺高强，勇气十足的勇士，从囚龙岛进入龙穴，在魔龙的手中拿回“霹雳神火诀”。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！\n#y副本说明：#w在这个副本中，你可以获得大量经验奖励！",  
											"\t那些红鼻子蓝眼睛的欧洲大军？他们在塞浦路斯被我们打得屁滚尿流，我们最后却陷入了囚龙岛，被魔龙军团偷袭，没有一个人能活着离开！\n\t这批魔龙军团就在这个岛上的城堡里，他们甘愿服侍两只蓝色的恶龙！我们的士兵无法对付这种怪物！\n\t作为随军的萨满大法师，我燃烧了自己的生命，激活了最强大的禁锢结界，“霹雳神火诀”才不至于流传出去。\n\t我的勇士，进入囚龙城堡，去完成你的使命！",  
											"\t龙穴位于囚龙城堡的海底之中，里面深藏着一只三头凶蛟和各种海底怪物。丢失的“霹雳神火诀”很有可能就在这洞穴之中。\n\t“霹雳神火诀”记载了最厉害的火器制作方法，一旦落入欧洲诸国手中，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t这关系到国家未来的安危，十分火急！你必须进入龙穴，为天下百姓解决这个巨大的隐患！",  
											"\t宋金大战后，镇国之宝和氏璧流落民间，百年后突然出现在了东海海眼之中，找到和氏璧的人只要能够降伏隐藏于和氏璧之中的八位枭雄的魂魄就能够借助和氏璧的力量，预见未来百年之事。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t千百年来无数野心家想要得到这个镇国之宝和氏璧，围绕着它的争夺数不胜数，其中有八位野心家不肯承认自己的失败，一直执着地在留在和氏璧之内，只有击败他们才能让异象消失。",  
											"\t恭喜你们，百年来从没有人能击败那八个野心家！现在，我将带你们进入金銮殿，如果你能通过金銮殿的考验，除了会得到非凡的奖励之外更有机会金銮殿，预知未来。\n#Y副本说明：#R敌对势力如果高于50，则会副本失败！",  
											"\t日本武士盘踞在对马岛，阴谋对大元发起攻击。但这个阴谋被大元商人汪大渊获悉，并报给了忽必烈。忽必烈派大元勇士潜入对马岛，火烧日本舰船，消灭了聚集在岛上的日本武士，消除了大元的隐患！\n#Y开放时间：#W全天开放！\n#Y友情提示：#W该副本难度较低，单人建立队伍也可进入该副本！仅能进入一次！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t贫道经过仔细探查，发现方才赤血号仅仅是通往金山大玉海所在之处的一个入口。赤血号，是金山大玉海灵气外泄所成，而此处，正是灵气最为浓密所在。且待贫道施展道法，将你们送往那里。",  
											"\t方才贫道已经施法打开了此处与金山大玉海所在之地的封印，但是……贫道万万没有想到，那里竟然渺无人迹，只有无数凶兽横行。\n\t按照贫道的推算，这奇异之地的时光应当是亿年之前，盘古开天辟地之后的蛮荒时期，这世间之奇妙，确非我等能够想象，不过，金山大玉海毕竟是上古奇异之物，藏于此地并不为怪。",  
											"\t那时迁人送绰号'鼓上蚤'，见众好汉顺利攻入，连忙施展'缩骨法'，逃出牢笼，祝家庄内机关重重，处处伏兵，时迁虽出牢笼却未能逃出火坑……\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！",  

											"\t本以为可以顺利救出时迁哥哥，不想半路又杀出这个“程咬金”来！看来我们非要二入祝家庄不可，听说那一丈青扈三娘善用异术，庄内五行碑便是她施法的根源。\n\t此庄方圆数里，又勾结官府欺压良民，今日前来正好将它连根拔起，庄内财物抬到山上，足够我等弟兄几年吃喝。\n\t只是怕我们破了那扈三娘的五行碑，他们早已抬走了财宝逃之夭夭，若不先破五行碑那扈三娘着实难以对付。\n\t这可如何是好？\n#Y小提示：\n\t#W扈三娘的能力来自五行碑，如果实力足够，可以选择#G尽量少的破坏五行碑#W，这样在击败扈三娘后会得到#G更丰厚的回报#W。",  

											"\t我乃神行太保戴宗，此次下山特为送信而来，公明哥哥已经向天禀明，祝家为富不仁，欺压良民，草菅人命，梁山今日之举实为替天行道，绝非滥杀无辜！\n\t这位兄弟，快随我一共杀进祝家庄！\n#Y小提示：\n\t#W如果能够在击败祝氏三兄弟之前击败扈三娘，那么你将会得到非常好的回报，#G九旄战神#W出现的概率也会#G显着提高#W。",  

											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											"\t从这里可以返回庄园！",

                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
                      						"\t如果你感到自己的实力不足以继续进行挑战，我可以把你送回大都。",     --【个人】精英剧场
										} 
										
x700081_var_FutuLeaveMenuDescList		= {"\t浮屠塔出口说明，浮屠塔出口说明"}

x700081_var_LeaveMenuDescList				=	{
											"出口说明 1",
											"出口说明 2",
											
											"出口说明 3",  

											"出口说明 4",  
											
											"\t花剌子模国王魔君摩诃末终于消灭了，大元再次转危为安！天下万民感谢你，大元勇士！",  

											"出口说明 6",  

											"出口说明 7",  

											"\t【试炼】战神墓1！",  

											"\t",  

											"\t陈理等这些乱臣贼子妄想夺取和氏璧，南面称王，结果落得个身首异处的下场！由此可见，我大元天子忽必烈才是真命天子，才是和氏璧的真正主人！",  

											"\t【试炼】金矿洞1",  

											"\t盐帮和漕帮这两个江湖小帮兵微将寡，帮主张士诚和方国珍武功低微，自不量力，居然也想抢夺和氏璧夺取皇位。真是可笑。",  

											"\t大友家的武士以勇猛善战名扬日本，号称精兵。但今日一战，大元将士将他们全歼。可见我战无不胜的大元军队，消灭这些日本武士简直不费吹灰之力！",  

											"\t日本幕府将军北条时宗和他的旗舰“赤血号”一同葬身海底，侵犯大元的阴谋终告破灭。天佑大元！",  

											"\t除最后的堡垒——囚龙堡以外，我大军已经占领了的囚龙岛所有地方，胜利就在眼前！但囚龙堡中的摩诃末真身——三头凶蛟凶悍异常，必将垂死挣扎，此后的战斗必将更加激烈！",  

											"\t当年强大无比的花剌子模国都抵挡不住我军奋力一击，更何况是现在小小的囚龙岛？摩诃末派亦难出在这里企图抵挡大军的讨伐，不过是螳臂挡车而已！",  

											"\t【试炼】永夜天牢1",  

											"\t幕府将军北条时宗的这些战船已经燃起熊熊大火，全都沉入海底了，但他的旗舰“赤血号”还在做困兽之斗，垂死挣扎！",  
											
											"\t【试炼】三打祝家庄（一）1",  

											"\t【试炼】三打祝家庄（二）1",  

											"\t【试炼】三打祝家庄（三）1",  

											"\t完颜洪烈为了复国，将全部希望都寄托在夏王陵中的宝物上，志在必得。因此他在夏王陵一带部署重兵，每前进一步都将非常困难！",
											
											"\t完颜洪烈已经率领他的亲卫进入了夏王墓穴，开始挖掘神兵利器和《元昊兵法》。如果不赶快将他们阻止，一旦神兵利器和《元昊兵法》落入野心勃勃的完颜洪烈手中，那么必将在大元西北掀起一场腥风血雨。",
											
											"\t金国赵王完颜洪烈企图靠夏王陵中的神兵利器和兵法的复国迷梦，终归不过是镜中花水中月，一场空而已！",
											
											"\t我大军势如破竹，那些印度士兵简直就是不堪一击，顷刻间就兵败如山倒。扎兰丁居然想依靠他们复国，看来注定要失败。要不是他获得了“不死之身”，扎兰丁的复国大计不过是空谈而已。",
											
											"\t依靠邪神的庇护，虽然能获得不死之身，耀武扬威，但终归只能得逞一时。任所谓的“不死战神”扎兰丁如何刀枪不入，如何战无不胜，最终仍然会被打回原形，被我大军轻而易举的击败！",
											
											"\t依靠邪神的庇护，虽然能获得不死之身，耀武扬威，但终归只能得逞一时。任所谓的“不死战神”扎兰丁如何刀枪不入，如何战无不胜，最终仍然会被打回原形，被我大军轻而易举的击败！",
											
											"\t麻雀岭是大教堂的第一道防线，由腓特烈二世带领善堂骑士团防守与此。但顷刻之间大元勇士就将善堂骑士团已经被全部消灭，将暴君腓特烈二世斩于剑下！",
											
											"\t熔岩沼泽是大教堂的第二道防线，由暴君圣路易亲自带领条顿骑士团防守。在大元将士的猛攻之下，条顿骑士团摧枯拉朽般的全军覆没，暴君圣路易也身首异处，得到了应有的下场！",
											
											"\t圣殿骑士团已经被全部消灭，暴君贝拉四世已经伏诛！至此，三大骑士团已经全部被消灭！大教堂在烈焰之中轰然倒塌，力量之源已被完全摧毁！",
											
											
											
											

											"\t【队伍】钧窑绝迹1",  

											"\t【队伍】藏宝洞1",   

											"\t【队伍】景教堂",  

											"\t花剌子模国王魔君摩诃末终于消灭了，大元再次转危为安！天下万民感谢你，大元勇士！",  

											"\t【队伍】(经验)  1" ,  
											"\t【队伍】(声望)  1" ,  
											"\t【队伍】(天赋80级以上)1" ,  
											"\t【队伍】倩女幽魂1" ,  

											"\t【队伍】虚空境1",  

											"\t【队伍】斗戏勾栏院1",  

											"\t【队伍】战神墓1",  

											"\t【队伍】和氏璧1",  

											"\t陈理等这些乱臣贼子妄想夺取和氏璧，南面称王，结果落得个身首异处的下场！由此可见，我大元天子忽必烈才是真命天子，才是和氏璧的真正主人！",  

											"\t【队伍】金矿洞1",  

											"\t盐帮和漕帮这两个江湖小帮兵微将寡，帮主张士诚和方国珍武功低微，自不量力，居然也想抢夺和氏璧夺取皇位。真是可笑。",  

											"\t大友家的武士以勇猛善战名扬日本，号称精兵。但今日一战，大元将士将他们全歼。可见我战无不胜的大元军队，消灭这些日本武士简直不费吹灰之力！",  

											"\t日本幕府将军北条时宗和他的旗舰“赤血号”一同葬身海底，侵犯大元的阴谋终告破灭。天佑大元！",  

											"\t【队伍】神秘墓穴1",  

											"\t【队伍】神秘墓穴1-1",  

											"\t【队伍】神秘墓穴1-2",  

											"\t除最后的堡垒——囚龙堡以外，我大军已经占领了的囚龙岛所有地方，胜利就在眼前！但囚龙堡中的摩诃末真身——三头凶蛟凶悍异常，必将垂死挣扎，此后的战斗必将更加激烈！",  

											"\t当年强大无比的花剌子模国都抵挡不住我军奋力一击，更何况是现在小小的囚龙岛？摩诃末派亦难出在这里企图抵挡大军的讨伐，不过是螳臂挡车而已！",  

											"\t【队伍】永夜天牢1",  

											"\t【队伍】三打祝家庄（一）1",  

											"\t【队伍】三打祝家庄（二）1",  

											"\t【队伍】三打祝家庄（三）1",  

											"\t幕府将军北条时宗的这些战船已经燃起熊熊大火，全都沉入海底了，但他的旗舰“赤血号”还在做困兽之斗，垂死挣扎！",  
											
											"\t完颜洪烈为了复国，将全部希望都寄托在夏王陵中的宝物上，志在必得。因此他在夏王陵一带部署重兵，每前进一步都将非常困难！",
											
											"\t完颜洪烈已经率领他的亲卫进入了夏王墓穴，开始挖掘神兵利器和《元昊兵法》。如果不赶快将他们阻止，一旦神兵利器和《元昊兵法》落入野心勃勃的完颜洪烈手中，那么必将在大元西北掀起一场腥风血雨。",
											
											"\t金国赵王完颜洪烈企图靠夏王陵中的神兵利器和兵法的复国迷梦，终归不过是镜中花水中月，一场空而已！",
											
											"\t我大军势如破竹，那些印度士兵简直就是不堪一击，顷刻间就兵败如山倒。扎兰丁居然想依靠他们复国，看来注定要失败。要不是他获得了“不死之身”，扎兰丁的复国大计不过是空谈而已。",
											
											"\t依靠邪神的庇护，虽然能获得不死之身，耀武扬威，但终归只能得逞一时。任所谓的“不死战神”扎兰丁如何刀枪不入，如何战无不胜，最终仍然会被打回原形，被我大军轻而易举的击败！",
											
											"\t依靠邪神的庇护，虽然能获得不死之身，耀武扬威，但终归只能得逞一时。任所谓的“不死战神”扎兰丁如何刀枪不入，如何战无不胜，最终仍然会被打回原形，被我大军轻而易举的击败！",
											
											"\t麻雀岭是大教堂的第一道防线，由腓特烈二世带领善堂骑士团防守与此。但顷刻之间大元勇士就将善堂骑士团已经被全部消灭，将暴君腓特烈二世斩于剑下！",
											
											"\t熔岩沼泽是大教堂的第二道防线，由暴君圣路易亲自带领条顿骑士团防守。在大元将士的猛攻之下，条顿骑士团摧枯拉朽般的全军覆没，暴君圣路易也身首异处，得到了应有的下场！",
											
											"\t圣殿骑士团已经被全部消灭，暴君贝拉四世已经伏诛！至此，三大骑士团已经全部被消灭！大教堂在烈焰之中轰然倒塌，力量之源已被完全摧毁！",
											
											"\t【队伍】产出金矿洞1",
																						
											"\t【个人】月宫大作战",--【个人】月宫大作战  
											"\t【队伍】天关",--【个人】天关
											"\t【队伍】杳无音讯的村庄",--【个人】天关
											"\t【队伍】污染边塞",--【个人】天关

											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库 
											
											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库 
											
											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库 
											
											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库 
											
											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库
											
											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库
											
											"\t【队伍】神秘宝库 1",--【队伍】神秘宝库

											"\t万奴冥王的爪牙实力一般，通常一个玩家就可以击败他们，获得不菲的经验和宝贝。",--【个人】十字井副本1 

											"\t万奴冥王的死士虽然不好对付，但若是组对进入（3人以上），击败他们也会获得大量的经验和宝贝。", --【队伍】十字井副本1

											"\t【队伍】藏宝洞6 1",--【队伍】藏宝洞6
																																
											"\t【团队】角斗场 1",--【团队】角斗场1
 											
											"\t【团队】角斗场角斗场精英模式1",--【团队】角斗场角斗场精英模式1  
																																
											"\t【团队】角斗场 2",--【团队】角斗场2
											
											"\t【团队】角斗场角斗场精英模式2",--【团队】角斗场精英模式2									
											
											"\t自从郭宝玉将军战败于囚龙岛后，霹雳神火诀落入囚龙岛的魔龙军团手中，而随军大萨满临终前布下的结界随着时间的推移渐渐失效。一旦让魔龙军团脱困，霹雳神火诀将被欧洲诸国所利用，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t郭侃将军奉命前往囚龙岛调查祖父郭宝玉当年战败的原因，并取回遗失的“霹雳神火诀”，在这个时候，极度需要一群武艺高强，勇气十足的勇士，从囚龙岛进入龙穴，在魔龙的手中拿回“霹雳神火诀”。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！\n#y副本说明：#w在这个副本中，你可以获得大量经验奖励！",  
											"\t那些红鼻子蓝眼睛的欧洲大军？他们在塞浦路斯被我们打得屁滚尿流，我们最后却陷入了囚龙岛，被魔龙军团偷袭，没有一个人能活着离开！\n\t这批魔龙军团就在这个岛上的城堡里，他们甘愿服侍两只蓝色的恶龙！我们的士兵无法对付这种怪物！\n\t作为随军的萨满大法师，我燃烧了自己的生命，激活了最强大的禁锢结界，“霹雳神火诀”才不至于流传出去。\n\t我的勇士，进入囚龙城堡，去完成你的使命！",  
											"\t龙穴位于囚龙城堡的海底之中，里面深藏着一只三头凶蛟和各种海底怪物。丢失的“霹雳神火诀”很有可能就在这洞穴之中。\n\t“霹雳神火诀”记载了最厉害的火器制作方法，一旦落入欧洲诸国手中，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t这关系到国家未来的安危，十分火急！你必须进入龙穴，为天下百姓解决这个巨大的隐患！",  
											"\t宋金大战后，镇国之宝和氏璧流落民间，百年后突然出现在了东海海眼之中，找到和氏璧的人只要能够降伏隐藏于和氏璧之中的八位枭雄的魂魄就能够借助和氏璧的力量，预见未来百年之事。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t千百年来无数野心家想要得到这个镇国之宝和氏璧，围绕着它的争夺数不胜数，其中有八位野心家不肯承认自己的失败，一直执着地在留在和氏璧之内，只有击败他们才能让异象消失。",  
											"\t恭喜你们，百年来从没有人能击败那八个野心家！现在，我将带你们进入金銮殿，如果你能通过金銮殿的考验，除了会得到非凡的奖励之外更有机会金銮殿，预知未来。\n#Y副本说明：#R敌对势力如果高于50，则会副本失败！",  
											"\t前日，陛下做了一奇梦，他梦见自己身处?R霄宝殿，天帝赐他一样异宝—金山大玉海，并告知凭此物可保江山万代不移。\n\t陛下醒来后，立刻命我等寻找那传说中的金山大玉海，经我多方探查，终于查明赤血号与金山大玉海有着千丝万缕的联系，护国天师玄灵道长已经先行带着他的弟子们进入赤血号。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！#R在规定时间内摧毁火炮是一切的关键！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t贫道经过仔细探查，发现方才赤血号仅仅是通往金山大玉海所在之处的一个入口。赤血号，是金山大玉海灵气外泄所成，而此处，正是灵气最为浓密所在。且待贫道施展道法，将你们送往那里。",  
											"\t方才贫道已经施法打开了此处与金山大玉海所在之地的封印，但是……贫道万万没有想到，那里竟然渺无人迹，只有无数凶兽横行。\n\t按照贫道的推算，这奇异之地的时光应当是亿年之前，盘古开天辟地之后的蛮荒时期，这世间之奇妙，确非我等能够想象，不过，金山大玉海毕竟是上古奇异之物，藏于此地并不为怪。",  
											"\t那时迁人送绰号'鼓上蚤'，见众好汉顺利攻入，连忙施展'缩骨法'，逃出牢笼，祝家庄内机关重重，处处伏兵，时迁虽出牢笼却未能逃出火坑……\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！",  

											"\t本以为可以顺利救出时迁哥哥，不想半路又杀出这个“程咬金”来！看来我们非要二入祝家庄不可，听说那一丈青扈三娘善用异术，庄内五行碑便是她施法的根源。\n\t此庄方圆数里，又勾结官府欺压良民，今日前来正好将它连根拔起，庄内财物抬到山上，足够我等弟兄几年吃喝。\n\t只是怕我们破了那扈三娘的五行碑，他们早已抬走了财宝逃之夭夭，若不先破五行碑那扈三娘着实难以对付。\n\t这可如何是好？\n#Y小提示：\n\t#W扈三娘的能力来自五行碑，如果实力足够，可以选择#G尽量少的破坏五行碑#W，这样在击败扈三娘后会得到#G更丰厚的回报#W。",  

											"\t我乃神行太保戴宗，此次下山特为送信而来，公明哥哥已经向天禀明，祝家为富不仁，欺压良民，草菅人命，梁山今日之举实为替天行道，绝非滥杀无辜！\n\t这位兄弟，快随我一共杀进祝家庄！\n#Y小提示：\n\t#W如果能够在击败祝氏三兄弟之前击败扈三娘，那么你将会得到非常好的回报，#G九旄战神#W出现的概率也会#G显着提高#W。",  

											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											"\t【个人】矿山秘洞",
										
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										  "\t【个人】精英剧场",   --【个人】精英剧场
										}		
										
x700081_var_TeleportWangchengDescList				=	{
											"\t你确定要返回王城吗？",
											"\t你确定要返回王城吗？",
											
											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  
											"\t你确定要返回王城吗？",  
											"\t你确定要返回王城吗？",  
											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  

											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
											
											"\t你确定要返回王城吗？",  
																						
											"\t你确定要返回王城吗？",  --【队伍】月宫
											"\t你确定要返回王城吗？",  --【队伍】天关
											"\t你确定要返回王城吗？",  --【队伍】杳无音讯的村庄
											"\t你确定要返回王城吗？",  --【队伍】污染边塞

											"\t你确定要返回王城吗？",  --【队伍】神秘宝库 
											
											"\t你确定要返回王城吗？",  --【队伍】神秘宝库 
											
											"\t你确定要返回王城吗？",  --【队伍】神秘宝库 
											
											"\t你确定要返回王城吗？",  --【队伍】神秘宝库 
											
											"\t你确定要返回王城吗？",  --【队伍】神秘宝库
											
											"\t你确定要返回王城吗？",  --【队伍】神秘宝库
											
											"\t你确定要返回王城吗？",  --【队伍】神秘宝库
											
											"\t你确定要返回后花园吗？", --【个人】十字井副本1  
											"\t你确定要返回后花园吗？",   --【队伍】十字井副本1

											"\t你确定要返回王城吗？",  --【队伍】藏宝洞6

									  	"\t你确定要返回王城吗？",  --【团队】角斗场
 											
											"\t你确定要返回王城吗？",  --【团队】角斗场角斗场精英模式
																																
											"\t你确定要返回王城吗？",  --【团队】角斗场2
											
											"\t你确定要返回王城吗？",  --【团队】角斗场精英模式2

											"\t自从郭宝玉将军战败于囚龙岛后，霹雳神火诀落入囚龙岛的魔龙军团手中，而随军大萨满临终前布下的结界随着时间的推移渐渐失效。一旦让魔龙军团脱困，霹雳神火诀将被欧洲诸国所利用，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t郭侃将军奉命前往囚龙岛调查祖父郭宝玉当年战败的原因，并取回遗失的“霹雳神火诀”，在这个时候，极度需要一群武艺高强，勇气十足的勇士，从囚龙岛进入龙穴，在魔龙的手中拿回“霹雳神火诀”。\n#y开放时间：#w全天\n#y友情提示：#w3人以上的队伍，才能进入该副本！\n#y副本说明：#w在这个副本中，你可以获得大量经验奖励！",  
											"\t那些红鼻子蓝眼睛的欧洲大军？他们在塞浦路斯被我们打得屁滚尿流，我们最后却陷入了囚龙岛，被魔龙军团偷袭，没有一个人能活着离开！\n\t这批魔龙军团就在这个岛上的城堡里，他们甘愿服侍两只蓝色的恶龙！我们的士兵无法对付这种怪物！\n\t作为随军的萨满大法师，我燃烧了自己的生命，激活了最强大的禁锢结界，“霹雳神火诀”才不至于流传出去。\n\t我的勇士，进入囚龙城堡，去完成你的使命！",  
											"\t龙穴位于囚龙城堡的海底之中，里面深藏着一只三头凶蛟和各种海底怪物。丢失的“霹雳神火诀”很有可能就在这洞穴之中。\n\t“霹雳神火诀”记载了最厉害的火器制作方法，一旦落入欧洲诸国手中，不久的将来，西方人将手持火器而来，中原大地将受到灭顶之灾。\n\t这关系到国家未来的安危，十分火急！你必须进入龙穴，为天下百姓解决这个巨大的隐患！",  
											"\t宋金大战后，镇国之宝和氏璧流落民间，百年后突然出现在了东海海眼之中，找到和氏璧的人只要能够降伏隐藏于和氏璧之中的八位枭雄的魂魄就能够借助和氏璧的力量，预见未来百年之事。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t千百年来无数野心家想要得到这个镇国之宝和氏璧，围绕着它的争夺数不胜数，其中有八位野心家不肯承认自己的失败，一直执着地在留在和氏璧之内，只有击败他们才能让异象消失。",  
											"\t恭喜你们，百年来从没有人能击败那八个野心家！现在，我将带你们进入金銮殿，如果你能通过金銮殿的考验，除了会得到非凡的奖励之外更有机会金銮殿，预知未来。\n#Y副本说明：#R敌对势力如果高于50，则会副本失败！",  
											"\t前日，陛下做了一奇梦，他梦见自己身处?R霄宝殿，天帝赐他一样异宝—金山大玉海，并告知凭此物可保江山万代不移。\n\t陛下醒来后，立刻命我等寻找那传说中的金山大玉海，经我多方探查，终于查明赤血号与金山大玉海有着千丝万缕的联系，护国天师玄灵道长已经先行带着他的弟子们进入赤血号。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！#R在规定时间内摧毁火炮是一切的关键！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",  
											"\t贫道经过仔细探查，发现方才赤血号仅仅是通往金山大玉海所在之处的一个入口。赤血号，是金山大玉海灵气外泄所成，而此处，正是灵气最为浓密所在。且待贫道施展道法，将你们送往那里。",  
											"\t方才贫道已经施法打开了此处与金山大玉海所在之地的封印，但是……贫道万万没有想到，那里竟然渺无人迹，只有无数凶兽横行。\n\t按照贫道的推算，这奇异之地的时光应当是亿年之前，盘古开天辟地之后的蛮荒时期，这世间之奇妙，确非我等能够想象，不过，金山大玉海毕竟是上古奇异之物，藏于此地并不为怪。",  
											"\t那时迁人送绰号'鼓上蚤'，见众好汉顺利攻入，连忙施展'缩骨法'，逃出牢笼，祝家庄内机关重重，处处伏兵，时迁虽出牢笼却未能逃出火坑……\n#Y开放时间：#W全天\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得海量经验奖励！",  

											"\t本以为可以顺利救出时迁哥哥，不想半路又杀出这个“程咬金”来！看来我们非要二入祝家庄不可，听说那一丈青扈三娘善用异术，庄内五行碑便是她施法的根源。\n\t此庄方圆数里，又勾结官府欺压良民，今日前来正好将它连根拔起，庄内财物抬到山上，足够我等弟兄几年吃喝。\n\t只是怕我们破了那扈三娘的五行碑，他们早已抬走了财宝逃之夭夭，若不先破五行碑那扈三娘着实难以对付。\n\t这可如何是好？\n#Y小提示：\n\t#W扈三娘的能力来自五行碑，如果实力足够，可以选择#G尽量少的破坏五行碑#W，这样在击败扈三娘后会得到#G更丰厚的回报#W。",  

											"\t我乃神行太保戴宗，此次下山特为送信而来，公明哥哥已经向天禀明，祝家为富不仁，欺压良民，草菅人命，梁山今日之举实为替天行道，绝非滥杀无辜！\n\t这位兄弟，快随我一共杀进祝家庄！\n#Y小提示：\n\t#W如果能够在击败祝氏三兄弟之前击败扈三娘，那么你将会得到非常好的回报，#G九旄战神#W出现的概率也会#G显着提高#W。",  

											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t金国赵王完颜洪烈在亡国之后，率领残部逃入贺兰山中，妄图复国。他打听到夏王墓中有神兵利器和《元昊兵法》，如果将其夺取可以助其复国，于是率领手下大肆挖掘夏王墓。大元朝廷派遣将士潜入墓穴中，将完颜洪烈等人全部消灭，彻底消灭了金国的残余势力。",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t花剌子模王子扎兰丁被蒙古人打得全军覆没后逃往印度，却意外获得了不死之身。他率领印度国王借给他的十万大军返回花剌子模，连败蒙古大军。国师丘处机发现了破除扎兰丁不死之身的秘密，于是成吉思汗派出蒙古勇士潜入印度丛林中的神庙……",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											
											"\t欧洲骑士入侵东方，烧杀掳掠无恶不作。旭烈兀率蒙古大军吊民伐罪，却屡屡受挫。原来圣灵教堂是欧洲骑士的力量之源，只有摧毁了这座教堂，旭烈兀的大军才能获胜。为了一洗战败之耻，蒙古大军中的勇士组成奇袭营，偷袭圣灵教堂。",
											"\t你确定要返回庄园吗？",
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    
										    
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										    "\t你确定要返回大都吗？",  --【个人】精英剧场
										
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
											"\t你确定要返回王城吗？浮屠塔",
										}										
										
x700081_var_EnterPosList                  =   {
												{ 
													{ idx = 1, varX = 69, z=27 },
													{ idx = 2, varX = 69, z=24 },
													{ idx = 3, varX = 69, z=30 },
													{ idx = 4, varX = 66, z=27 },
													{ idx = 5, varX = 66, z=24 },
													{ idx = 6, varX = 66, z=30 },
												},--1
												
												{ 
													{ idx = 1, varX = 109, z=14 },
													{ idx = 2, varX = 109, z=15 },
													{ idx = 3, varX = 109, z=16 },
													{ idx = 4, varX = 109, z=17 },
													{ idx = 5, varX = 109, z=18 },
													{ idx = 6, varX = 109, z=19 },
												},
												
												{ 
													{ idx = 1, varX = 109, z=14 },
													{ idx = 2, varX = 109, z=15 },
													{ idx = 3, varX = 109, z=16 },
													{ idx = 4, varX = 109, z=17 },
													{ idx = 5, varX = 109, z=18 },
													{ idx = 6, varX = 109, z=19 },
												},

												{ 
													{ idx = 1, varX = 12, z=103 },
													{ idx = 2, varX = 14, z=103 },
													{ idx = 3, varX = 16, z=103 },
													{ idx = 4, varX = 18, z=103 },
													{ idx = 5, varX = 20, z=103 },
													{ idx = 6, varX = 22, z=103 },
												},
												
												{ 
													{ idx = 1, varX = 24, z=85 },
													{ idx = 2, varX = 30, z=85 },
													{ idx = 3, varX = 18, z=87 },
													{ idx = 4, varX = 25, z=91 },
													{ idx = 5, varX = 25, z=81 },
													{ idx = 6, varX = 27, z=87 },
												}, 
                                        		
												{ 
									        { idx = 1, varX = 64, z=59 },
									        { idx = 2, varX = 64, z=58 },
									        { idx = 3, varX = 64, z=60 },
									        { idx = 4, varX = 62, z=59 },
									        { idx = 5, varX = 62, z=58 },
									        { idx = 6, varX = 62, z=60 },
												},

												{ 
									        { idx = 1, varX = 9 , z=9  },
									        { idx = 2, varX = 11, z=9  },
									        { idx = 3, varX = 13, z=9  },
									        { idx = 4, varX = 9,  z=11 },
									        { idx = 5, varX = 11, z=11 },
									        { idx = 6, varX = 13, z=11 },
												},

												{
									        { idx = 1, varX = 113, z=15 },
									        { idx = 2, varX = 115, z=14 },
									        { idx = 3, varX = 113, z=18 },
									        { idx = 4, varX = 115, z=18 },
									        { idx = 5, varX = 112, z=22 },
									        { idx = 6, varX = 114, z=22 },
												},--8

												{--和氏璧
													{ idx = 1, varX = 52, z=51 },
													{ idx = 2, varX = 55, z=51 },
													{ idx = 3, varX = 58, z=51 },
													{ idx = 4, varX = 61, z=51 },
													{ idx = 5, varX = 64, z=51 },
													{ idx = 6, varX = 67, z=51 },
												},

												{--金銮殿
													{ idx = 1, varX = 62, z=109 },
													{ idx = 2, varX = 64, z=109 },
													{ idx = 3, varX = 67, z=109 },
													{ idx = 4, varX = 65, z=109 },
													{ idx = 5, varX = 67, z=108 },
													{ idx = 6, varX = 63, z=107 },
												},
	
												{
													{ idx = 1, varX = 111, z=18 },
													{ idx = 2, varX = 111, z=19 },
													{ idx = 3, varX = 111, z=20 },
													{ idx = 4, varX = 111, z=21 },
													{ idx = 5, varX = 111, z=22 },
													{ idx = 6, varX = 111, z=23 },
												},

												{
													{ idx = 1, varX = 128, z=217 },
													{ idx = 2, varX = 129, z=214 },
													{ idx = 3, varX = 124, z=213 },
													{ idx = 4, varX = 126, z=216 },
													{ idx = 5, varX = 128, z=212 },
													{ idx = 6, varX = 130, z=215 },
												},

												{
													{ idx = 1, varX = 180, z=120 },
													{ idx = 2, varX = 183, z=117 },
													{ idx = 3, varX = 185, z=121 },
													{ idx = 4, varX = 181, z=121 },
													{ idx = 5, varX = 180, z=123 },
													{ idx = 6, varX = 183, z=124 },
												},

												{
													{ idx = 1, varX = 116, z=31 },
													{ idx = 2, varX = 114, z=31 },
													{ idx = 3, varX = 114, z=33 },
													{ idx = 4, varX = 116, z=33 },
													{ idx = 5, varX = 118, z=33 },
													{ idx = 6, varX = 118, z=31 },
												},

												{--囚龙岭
													{ idx = 1, varX = 21, z=102 },
													{ idx = 2, varX = 24, z=103 },
													{ idx = 3, varX = 18, z=98 },
													{ idx = 4, varX = 15, z=103 },
													{ idx = 5, varX = 19, z=105 },
													{ idx = 6, varX = 24, z=97 },
												},

												{--囚龙岛海滩
													{ idx = 1, varX = 133, z=178  },
													{ idx = 2, varX = 132, z=182  },
													{ idx = 3, varX = 128, z=183  },
													{ idx = 4, varX = 129, z=180  },
													{ idx = 5, varX = 130, z=177  },
													{ idx = 6, varX = 134, z=181  },	
												},

												{
													{ idx = 1, varX = 112, z=15 },
													{ idx = 2, varX = 112, z=16 },
													{ idx = 3, varX = 112, z=17 },
													{ idx = 4, varX = 112, z=18 },
													{ idx = 5, varX = 112, z=19 },
													{ idx = 6, varX = 112, z=20 },
												},

												{
												    { idx = 1, varX = 108, z=78 },
												    { idx = 2, varX = 107, z=80 },
												    { idx = 3, varX = 105, z=81 },
												    { idx = 4, varX = 103, z=80 },
												    { idx = 5, varX = 103, z=83 },
												    { idx = 6, varX = 108, z=82 },
												},--18
												
												{
													{ idx = 1, varX = 130, z=46 },
													{ idx = 2, varX = 132, z=46 },
													{ idx = 3, varX = 128, z=46 },
													{ idx = 4, varX = 134, z=46 },
													{ idx = 5, varX = 126, z=46 },
													{ idx = 6, varX = 124, z=46 },
												},

												{
													{ idx = 1, varX = 138, z=204 },
													{ idx = 2, varX = 139, z=204 },
													{ idx = 3, varX = 137, z=204 },
													{ idx = 4, varX = 138, z=202 },
													{ idx = 5, varX = 139, z=202 },
													{ idx = 6, varX = 137, z=202 },
												},

												{
													{ idx = 1, varX = 145, z=210 },
													{ idx = 2, varX = 143, z=210 },
													{ idx = 3, varX = 147, z=210 },
													{ idx = 4, varX = 145, z=206 },
													{ idx = 5, varX = 143, z=206 },
													{ idx = 6, varX = 147, z=206 },
												},
												
												{
													{ idx = 1, varX = 192, z=55 },
													{ idx = 2, varX = 196, z=56 },
													{ idx = 3, varX = 197, z=54 },
													{ idx = 4, varX = 195, z=53 },
													{ idx = 5, varX = 201, z=55 },
													{ idx = 6, varX = 200, z=53 },
												},

												{
													{ idx = 1, varX = 25, z=96  },
													{ idx = 2, varX = 25, z=94 },
													{ idx = 3, varX = 23, z=96 },
													{ idx = 4, varX = 27, z=94  },
													{ idx = 5, varX = 30, z=96  },
													{ idx = 6, varX = 26, z=98  },
												},

												{
													{ idx = 1, varX = 113, z=15 },
													{ idx = 2, varX = 115, z=14 },
													{ idx = 3, varX = 113, z=18 },
													{ idx = 4, varX = 115, z=18 },
													{ idx = 5, varX = 112, z=22 },
													{ idx = 6, varX = 114, z=22 },
												},
												
												{
													{ idx = 1, varX = 112, z=49 },
													{ idx = 2, varX = 110, z=49 },
													{ idx = 3, varX = 115, z=49 },
													{ idx = 4, varX = 100, z=52 },
													{ idx = 5, varX = 112, z=52 },
													{ idx = 6, varX = 115, z=52 },
												},

												{
													{ idx = 1, varX = 34, z=27 },
													{ idx = 2, varX = 36, z=27 },
													{ idx = 3, varX = 34, z=30 },
													{ idx = 4, varX = 38, z=30 },
													{ idx = 5, varX = 38, z=27 },
													{ idx = 6, varX = 36, z=30 },
												},--26

												{
													{ idx = 1, varX = 67, z=106 },
													{ idx = 2, varX = 66, z=106 },
													{ idx = 3, varX = 68, z=106 },
													{ idx = 4, varX = 67, z=105 },
													{ idx = 5, varX = 67, z=107 },
													{ idx = 6, varX = 68, z=107 },
												},
												
												{
													{ idx = 1, varX = 192, z=65 },
													{ idx = 2, varX = 195, z=65 },
													{ idx = 3, varX = 189, z=65 },
													{ idx = 4, varX = 192, z=62 },
													{ idx = 5, varX = 192, z=67 },
													{ idx = 6, varX = 189, z=67 },
												},

												{
													{ idx = 1, varX = 24, z=63 },
													{ idx = 2, varX = 22, z=63 },
													{ idx = 3, varX = 26, z=63 },
													{ idx = 4, varX = 22, z=66 },
													{ idx = 5, varX = 24, z=66 },
													{ idx = 6, varX = 26, z=66 },
												},

												{
													{ idx = 1, varX = 18, z=103 },
													{ idx = 2, varX = 19, z=103 },
													{ idx = 3, varX = 20, z=103 },
													{ idx = 4, varX = 18, z=101 },
													{ idx = 5, varX = 18, z=100 },
													{ idx = 6, varX = 18, z=102 },
												},
												
												
												
												
												{
													{ idx = 1, varX = 121, z=119 },
													{ idx = 2, varX = 121, z=121 },
													{ idx = 3, varX = 121, z=117 },
													{ idx = 4, varX = 123, z=119 },
													{ idx = 5, varX = 123, z=121 },
													{ idx = 6, varX = 123, z=117 },
												},

												{
													{ idx = 1, varX = 109, z=14 },
													{ idx = 2, varX = 109, z=15 },
													{ idx = 3, varX = 109, z=16 },
													{ idx = 4, varX = 109, z=17 },
													{ idx = 5, varX = 109, z=18 },
													{ idx = 6, varX = 109, z=19 },
												},

												{
													{ idx = 1, varX = 12, z=103 },
													{ idx = 2, varX = 14, z=103 },
													{ idx = 3, varX = 16, z=103 },
													{ idx = 4, varX = 18, z=103 },
													{ idx = 5, varX = 20, z=103 },
													{ idx = 6, varX = 22, z=103 },
												},--33

												{
													{ idx = 1, varX = 24, z=85 },
													{ idx = 2, varX = 30, z=85 },
													{ idx = 3, varX = 18, z=87 },
													{ idx = 4, varX = 25, z=91 },
													{ idx = 5, varX = 25, z=81 },
													{ idx = 6, varX = 27, z=87 },
												},

												{
													{ idx = 1, varX = 64, z=59 },
													{ idx = 2, varX = 64, z=58 },
													{ idx = 3, varX = 64, z=60 },
													{ idx = 4, varX = 62, z=59 },
													{ idx = 5, varX = 62, z=58 },
													{ idx = 6, varX = 62, z=60 },
												},
												{
													{ idx = 1, varX = 64, z=59 },
													{ idx = 2, varX = 64, z=58 },
													{ idx = 3, varX = 64, z=60 },
													{ idx = 4, varX = 62, z=59 },
													{ idx = 5, varX = 62, z=58 },
													{ idx = 6, varX = 62, z=60 },
												},
												{
													{ idx = 1, varX = 64, z=59 },
													{ idx = 2, varX = 64, z=58 },
													{ idx = 3, varX = 64, z=60 },
													{ idx = 4, varX = 62, z=59 },
													{ idx = 5, varX = 62, z=58 },
													{ idx = 6, varX = 62, z=60 },
												},
												{
													{ idx = 1, varX = 110, z=20 },
													{ idx = 2, varX = 108, z=18 },
													{ idx = 3, varX = 110, z=15 },
													{ idx = 4, varX = 113, z=15 },
													{ idx = 5, varX = 106, z=18 },
													{ idx = 6, varX = 108, z=20 },
												},
												{
													{ idx = 1, varX = 9 , z=9  },
													{ idx = 2, varX = 11, z=9  },
													{ idx = 3, varX = 13, z=9  },
													{ idx = 4, varX = 9,  z=11 },
													{ idx = 5, varX = 11, z=11 },
													{ idx = 6, varX = 13, z=11 },
												},

												{
													{ idx = 1, varX = 38, z=43 },
													{ idx = 2, varX = 40, z=43 },
													{ idx = 3, varX = 36, z=43 },
													{ idx = 4, varX = 37, z=41 },
													{ idx = 5, varX = 38, z=45 },
													{ idx = 6, varX = 42, z=43 },
												},--40

												{
													{ idx = 1, varX = 113, z=15 },
													{ idx = 2, varX = 115, z=14 },
													{ idx = 3, varX = 113, z=18 },
													{ idx = 4, varX = 115, z=18 },
													{ idx = 5, varX = 112, z=22 },
													{ idx = 6, varX = 114, z=22 },
												},

												{
													{ idx = 1, varX = 52, z=51 },
													{ idx = 2, varX = 55, z=51 },
													{ idx = 3, varX = 58, z=51 },
													{ idx = 4, varX = 61, z=51 },
													{ idx = 5, varX = 64, z=51 },
													{ idx = 6, varX = 67, z=51 },
												},

												{
													{ idx = 1, varX = 62, z=109 },
													{ idx = 2, varX = 64, z=109 },
													{ idx = 3, varX = 67, z=109 },
													{ idx = 4, varX = 65, z=109 },
													{ idx = 5, varX = 67, z=108 },
													{ idx = 6, varX = 63, z=107 },
												},

												{
													{ idx = 1, varX = 111, z=18 },
													{ idx = 2, varX = 111, z=19 },
													{ idx = 3, varX = 111, z=20 },
													{ idx = 4, varX = 111, z=21 },
													{ idx = 5, varX = 111, z=22 },
													{ idx = 6, varX = 111, z=23 },
												},

												{--禁宫大内

													{ idx = 1, varX = 128, z=217 },
													{ idx = 2, varX = 129, z=214 },
													{ idx = 3, varX = 124, z=213 },
													{ idx = 4, varX = 126, z=216 },
													{ idx = 5, varX = 128, z=212 },
													{ idx = 6, varX = 130, z=215 },

												},

												{
													{ idx = 1, varX = 180, z=120 },
													{ idx = 2, varX = 183, z=117 },
													{ idx = 3, varX = 185, z=121 },
													{ idx = 4, varX = 181, z=121 },
													{ idx = 5, varX = 180, z=123 },
													{ idx = 6, varX = 183, z=124 },
												},

												{
													{ idx = 1, varX = 116, z=31 },
													{ idx = 2, varX = 114, z=31 },
													{ idx = 3, varX = 114, z=33 },
													{ idx = 4, varX = 116, z=33 },
													{ idx = 5, varX = 118, z=33 },
													{ idx = 6, varX = 118, z=31 },
												},

												{
													{ idx = 1, varX = 22, z=87 },
													{ idx = 2, varX = 22, z=83 },
													{ idx = 3, varX = 20, z=82 },
													{ idx = 4, varX = 25, z=87 },
													{ idx = 5, varX = 24, z=81 },
													{ idx = 6, varX = 21, z=80 },
												},

												{
													{ idx = 1, varX = 22, z=87 },
													{ idx = 2, varX = 22, z=83 },
													{ idx = 3, varX = 20, z=82 },
													{ idx = 4, varX = 25, z=87 },
													{ idx = 5, varX = 24, z=81 },
													{ idx = 6, varX = 21, z=80 },
												},

												{
													{ idx = 1, varX = 22, z=87 },
													{ idx = 2, varX = 22, z=83 },
													{ idx = 3, varX = 20, z=82 },
													{ idx = 4, varX = 25, z=87 },
													{ idx = 5, varX = 24, z=81 },
													{ idx = 6, varX = 21, z=80 },
												},--50

												{
													{ idx = 1, varX = 21, z=102 },
													{ idx = 2, varX = 24, z=103 },
													{ idx = 3, varX = 18, z=98 },
													{ idx = 4, varX = 15, z=103 },
													{ idx = 5, varX = 19, z=105 },
													{ idx = 6, varX = 24, z=97 },
												},

												{
													{ idx = 1, varX = 133, z=178  },
													{ idx = 2, varX = 132, z=182  },
													{ idx = 3, varX = 128, z=183  },
													{ idx = 4, varX = 129, z=180  },
													{ idx = 5, varX = 130, z=177  },
													{ idx = 6, varX = 134, z=181  },	
												},

												{
													{ idx = 1, varX = 112, z=15 },
													{ idx = 2, varX = 112, z=16 },
													{ idx = 3, varX = 112, z=17 },
													{ idx = 4, varX = 112, z=18 },
													{ idx = 5, varX = 112, z=19 },
													{ idx = 6, varX = 112, z=20 },
												},

												{
													{ idx = 1, varX = 130, z=46 },
													{ idx = 2, varX = 132, z=46 },
													{ idx = 3, varX = 128, z=46 },
													{ idx = 4, varX = 134, z=46 },
													{ idx = 5, varX = 126, z=46 },
													{ idx = 6, varX = 124, z=46 },
												},

												{
													{ idx = 1, varX = 138, z=204 },
													{ idx = 2, varX = 139, z=204 },
													{ idx = 3, varX = 137, z=204 },
													{ idx = 4, varX = 138, z=202 },
													{ idx = 5, varX = 139, z=202 },
													{ idx = 6, varX = 137, z=202 },
												},

												{
													{ idx = 1, varX = 145, z=210 },
													{ idx = 2, varX = 143, z=210 },
													{ idx = 3, varX = 147, z=210 },
													{ idx = 4, varX = 145, z=206 },
													{ idx = 5, varX = 143, z=206 },
													{ idx = 6, varX = 147, z=206 },
												},

												{
											    { idx = 1, varX = 108, z=78 },
											    { idx = 2, varX = 107, z=80 },
											    { idx = 3, varX = 105, z=81 },
											    { idx = 4, varX = 103, z=80 },
											    { idx = 5, varX = 103, z=83 },
											    { idx = 6, varX = 108, z=82 },
												},
												
												{
													{ idx = 1, varX = 192, z=55 },
													{ idx = 2, varX = 196, z=56 },
													{ idx = 3, varX = 197, z=54 },
													{ idx = 4, varX = 195, z=53 },
													{ idx = 5, varX = 201, z=55 },
													{ idx = 6, varX = 200, z=53 },
												},

												{
													{ idx = 1, varX = 25, z=96  },
													{ idx = 2, varX = 25, z=94 },
													{ idx = 3, varX = 23, z=96 },
													{ idx = 4, varX = 27, z=94  },
													{ idx = 5, varX = 30, z=96  },
													{ idx = 6, varX = 26, z=98  },
												},--59

												{
													{ idx = 1, varX = 113, z=15 },
													{ idx = 2, varX = 115, z=14 },
													{ idx = 3, varX = 113, z=18 },
													{ idx = 4, varX = 115, z=18 },
													{ idx = 5, varX = 112, z=22 },
													{ idx = 6, varX = 114, z=22 },
												},
												
												{
													{ idx = 1, varX = 112, z=49 },
													{ idx = 2, varX = 110, z=49 },
													{ idx = 3, varX = 115, z=49 },
													{ idx = 4, varX = 100, z=52 },
													{ idx = 5, varX = 112, z=52 },
													{ idx = 6, varX = 115, z=52 },
												},

												{
													{ idx = 1, varX = 34, z=27 },
													{ idx = 2, varX = 36, z=27 },
													{ idx = 3, varX = 34, z=30 },
													{ idx = 4, varX = 38, z=30 },
													{ idx = 5, varX = 38, z=27 },
													{ idx = 6, varX = 36, z=30 },
												},

												{
													{ idx = 1, varX = 67, z=106 },
													{ idx = 2, varX = 66, z=106 },
													{ idx = 3, varX = 68, z=106 },
													{ idx = 4, varX = 67, z=105 },
													{ idx = 5, varX = 67, z=107 },
													{ idx = 6, varX = 68, z=107 },
												},
												
												{
													{ idx = 1, varX = 192, z=65 },
													{ idx = 2, varX = 195, z=65 },
													{ idx = 3, varX = 189, z=65 },
													{ idx = 4, varX = 192, z=62 },
													{ idx = 5, varX = 192, z=67 },
													{ idx = 6, varX = 189, z=67 },
												},

												{
													{ idx = 1, varX = 24, z=63 },
													{ idx = 2, varX = 22, z=63 },
													{ idx = 3, varX = 26, z=63 },
													{ idx = 4, varX = 22, z=66 },
													{ idx = 5, varX = 24, z=66 },
													{ idx = 6, varX = 26, z=66 },
												},

												{
													{ idx = 1, varX = 18, z=103 },
													{ idx = 2, varX = 19, z=103 },
													{ idx = 3, varX = 20, z=103 },
													{ idx = 4, varX = 18, z=101 },
													{ idx = 5, varX = 18, z=100 },
													{ idx = 6, varX = 18, z=102 },
												},
												
												{
													{ idx = 1, varX = 111, z=18 },
													{ idx = 2, varX = 111, z=19 },
													{ idx = 3, varX = 111, z=20 },
													{ idx = 4, varX = 111, z=21 },
													{ idx = 5, varX = 111, z=22 },
													{ idx = 6, varX = 111, z=23 },
												},
																								
													{--【队伍】神秘宝库
													{ idx = 1, varX = 35, z=30 },
													{ idx = 2, varX = 35, z=30 },
													{ idx = 3, varX = 35, z=30 },
													{ idx = 4, varX = 35, z=30 },
													{ idx = 5, varX = 35, z=30 },
													{ idx = 6, varX = 35, z=30 },
												},--68
													{--【队伍】天关
													{ idx = 1, varX = 114, z=11 },
													{ idx = 2, varX = 114, z=11 },
													{ idx = 3, varX = 114, z=11 },
													{ idx = 4, varX = 114, z=11 },
													{ idx = 5, varX = 114, z=11 },
													{ idx = 6, varX = 114, z=11 },
												},--69
{--【队伍】杳无音讯的村庄
													{ idx = 1, varX = 26, z=75 },
													{ idx = 2, varX = 26, z=75 },
													{ idx = 3, varX = 26, z=75 },
													{ idx = 4, varX = 26, z=75 },
													{ idx = 5, varX = 26, z=75 },
													{ idx = 6, varX = 26, z=75 },
												},--70
{--【队伍】污染边塞
													{ idx = 1, varX = 114, z=15 },
													{ idx = 2, varX = 114, z=15 },
													{ idx = 3, varX = 114, z=15 },
													{ idx = 4, varX = 114, z=15 },
													{ idx = 5, varX = 114, z=15 },
													{ idx = 6, varX = 114, z=15 },
												},--69

												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},
												
												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},
												
												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},
												
												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},
												
												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},

												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},

												{--【队伍】神秘宝库
													{ idx = 1, varX = 107, z=113 },
													{ idx = 2, varX = 111, z=113 },
													{ idx = 3, varX = 114, z=113 },
													{ idx = 4, varX = 112, z=116 },
													{ idx = 5, varX = 107, z=116 },
													{ idx = 6, varX = 110, z=109 },
												},

												{--【个人】十字井副本1
													{ idx = 1, varX = 110, z=77 },
													{ idx = 2, varX = 108, z=77 },
													{ idx = 3, varX = 108, z=76 },
													{ idx = 4, varX = 110, z=75 },
													{ idx = 5, varX = 112, z=74 },
													{ idx = 6, varX = 113, z=77 },
												},
												
												{--【队伍】十字井副本1
													{ idx = 1, varX = 110, z=77 },
													{ idx = 2, varX = 108, z=77 },
													{ idx = 3, varX = 108, z=76 },
													{ idx = 4, varX = 110, z=75 },
													{ idx = 5, varX = 112, z=74 },
													{ idx = 6, varX = 113, z=77 },
												},
												
												{--【队伍】藏宝洞6
													{ idx = 1, varX = 113, z=37 },
													{ idx = 2, varX = 108, z=37 },
													{ idx = 3, varX = 108, z=31 },
													{ idx = 4, varX = 110, z=30 },
													{ idx = 5, varX = 114, z=32 },
													{ idx = 6, varX = 109, z=35 },
												},

												{--【团队】角斗场
													{ idx = 1, varX = 121, z=60 },
													{ idx = 2, varX = 123, z=60 },
													{ idx = 3, varX = 125, z=60 },
													{ idx = 4, varX = 127, z=60 },
													{ idx = 5, varX = 130, z=60 },
													{ idx = 6, varX = 125, z=55 },
												},
												
												{--【团队】角斗场精英模式
													{ idx = 1, varX = 121, z=60 },
													{ idx = 2, varX = 123, z=60 },
													{ idx = 3, varX = 125, z=60 },
													{ idx = 4, varX = 127, z=60 },
													{ idx = 5, varX = 130, z=60 },
													{ idx = 6, varX = 125, z=55 },
												},
												
												{--【团队】角斗场2
													{ idx = 1, varX = 123, z=94 },
													{ idx = 2, varX = 130, z=98 },
													{ idx = 3, varX = 140, z=90 },
													{ idx = 4, varX = 143, z=93 },
													{ idx = 5, varX = 112, z=80 },
													{ idx = 6, varX = 103, z=79 },
												},
												
												{--【团队】角斗场精英模式2
													{ idx = 1, varX = 123, z=94 },
													{ idx = 2, varX = 130, z=98 },
													{ idx = 3, varX = 140, z=90 },
													{ idx = 4, varX = 143, z=93 },
													{ idx = 5, varX = 112, z=80 },
													{ idx = 6, varX = 103, z=79 },
												},												
												
												
												{--【挑战】囚龙岛海滩
													{ idx = 1, varX = 133, z=178  },
													{ idx = 2, varX = 132, z=182  },
													{ idx = 3, varX = 128, z=183  },
													{ idx = 4, varX = 129, z=180  },
													{ idx = 5, varX = 130, z=177  },
													{ idx = 6, varX = 134, z=181  },	
												},

												{--【英雄】囚龙岭     
													{ idx = 1, varX = 21, z=102 },
													{ idx = 2, varX = 24, z=103 },
													{ idx = 3, varX = 18, z=98 },
													{ idx = 4, varX = 15, z=103 },
													{ idx = 5, varX = 19, z=105 },
													{ idx = 6, varX = 24, z=97 },
												},
												{--【英雄】囚笼堡 
													{ idx = 1, varX = 24, z=85 },
													{ idx = 2, varX = 30, z=85 },
													{ idx = 3, varX = 18, z=87 },
													{ idx = 4, varX = 25, z=91 },
													{ idx = 5, varX = 25, z=81 },
													{ idx = 6, varX = 27, z=87 },
												},
												
												{--【英雄】禁宫大内
													{ idx = 1, varX = 128, z=217 },
													{ idx = 2, varX = 129, z=214 },
													{ idx = 3, varX = 124, z=213 },
													{ idx = 4, varX = 126, z=216 },
													{ idx = 5, varX = 128, z=212 },
													{ idx = 6, varX = 130, z=215 },
												},
												{--【英雄】和氏璧 
													{ idx = 1, varX = 62, z=109 },
													{ idx = 2, varX = 64, z=109 },
													{ idx = 3, varX = 67, z=109 },
													{ idx = 4, varX = 65, z=109 },
													{ idx = 5, varX = 67, z=108 },
													{ idx = 6, varX = 63, z=107 },
												},

												{--【英雄】金銮殿 

													{ idx = 1, varX = 52, z=51 },
													{ idx = 2, varX = 55, z=51 },
													{ idx = 3, varX = 58, z=51 },
													{ idx = 4, varX = 61, z=51 },
													{ idx = 5, varX = 64, z=51 },
													{ idx = 6, varX = 67, z=51 },
												},
												{
													{ idx = 1, varX = 23, z=104 },
													{ idx = 2, varX = 22, z=104 },
													{ idx = 3, varX = 21, z=104 },
													{ idx = 4, varX = 20, z=104 },
													{ idx = 5, varX = 21, z=106 },
													{ idx = 6, varX = 22, z=106 },
												},
												{
													{ idx = 1, varX = 9 , z=9  },
													{ idx = 2, varX = 11, z=9  },
													{ idx = 3, varX = 13, z=9  },
													{ idx = 4, varX = 9,  z=11 },
													{ idx = 5, varX = 11, z=11 },
													{ idx = 6, varX = 13, z=11 },
												},
												{
											    { idx = 1, varX = 22, z=24 },
											    { idx = 2, varX = 24, z=22 },
											    { idx = 3, varX = 27, z=21 },
											    { idx = 4, varX = 29, z=24 },
											    { idx = 5, varX = 28, z=26 },
											    { idx = 6, varX = 26, z=28 },
												},
												{
													{ idx = 1, varX = 130, z=46 },
													{ idx = 2, varX = 132, z=46 },
													{ idx = 3, varX = 128, z=46 },
													{ idx = 4, varX = 134, z=46 },
													{ idx = 5, varX = 126, z=46 },
													{ idx = 6, varX = 124, z=46 },
												},

												{
													{ idx = 1, varX = 138, z=204 },
													{ idx = 2, varX = 139, z=204 },
													{ idx = 3, varX = 137, z=204 },
													{ idx = 4, varX = 138, z=202 },
													{ idx = 5, varX = 139, z=202 },
													{ idx = 6, varX = 137, z=202 },
												},

												{
													{ idx = 1, varX = 145, z=210 },
													{ idx = 2, varX = 143, z=210 },
													{ idx = 3, varX = 147, z=210 },
													{ idx = 4, varX = 145, z=206 },
													{ idx = 5, varX = 143, z=206 },
													{ idx = 6, varX = 147, z=206 },
												},
												{
													{ idx = 1, varX = 196, z=53 },
													{ idx = 2, varX = 200, z=53 },
													{ idx = 3, varX = 193, z=53 },
													{ idx = 4, varX = 200, z=50 },
													{ idx = 5, varX = 196, z=50 },
													{ idx = 6, varX = 193, z=50 },
												},

												{
													{ idx = 1, varX = 24, z=99  },
													{ idx = 2, varX = 26, z=100 },
													{ idx = 3, varX = 24, z=100 },
													{ idx = 4, varX = 26, z=99  },
													{ idx = 5, varX = 25, z=96  },
													{ idx = 6, varX = 27, z=98  },
												},

												{
													{ idx = 1, varX = 113, z=15 },
													{ idx = 2, varX = 115, z=14 },
													{ idx = 3, varX = 113, z=18 },
													{ idx = 4, varX = 115, z=18 },
													{ idx = 5, varX = 112, z=22 },
													{ idx = 6, varX = 114, z=22 },
												},
												
												{
													{ idx = 1, varX = 112, z=49 },
													{ idx = 2, varX = 110, z=49 },
													{ idx = 3, varX = 115, z=49 },
													{ idx = 4, varX = 100, z=52 },
													{ idx = 5, varX = 112, z=52 },
													{ idx = 6, varX = 115, z=52 },
												},

												{
													{ idx = 1, varX = 34, z=27 },
													{ idx = 2, varX = 36, z=27 },
													{ idx = 3, varX = 34, z=30 },
													{ idx = 4, varX = 38, z=30 },
													{ idx = 5, varX = 38, z=27 },
													{ idx = 6, varX = 36, z=30 },
												},

												{
													{ idx = 1, varX = 67, z=106 },
													{ idx = 2, varX = 66, z=106 },
													{ idx = 3, varX = 68, z=106 },
													{ idx = 4, varX = 67, z=105 },
													{ idx = 5, varX = 67, z=107 },
													{ idx = 6, varX = 68, z=107 },
												},
												
												{
													{ idx = 1, varX = 192, z=65 },
													{ idx = 2, varX = 195, z=65 },
													{ idx = 3, varX = 189, z=65 },
													{ idx = 4, varX = 192, z=62 },
													{ idx = 5, varX = 192, z=67 },
													{ idx = 6, varX = 189, z=67 },
												},

												{
													{ idx = 1, varX = 24, z=63 },
													{ idx = 2, varX = 22, z=63 },
													{ idx = 3, varX = 26, z=63 },
													{ idx = 4, varX = 22, z=66 },
													{ idx = 5, varX = 24, z=66 },
													{ idx = 6, varX = 26, z=66 },
												},
												{--【英雄】教堂的秘密（三）
													{ idx = 1, x = 18, z=103 },
													{ idx = 2, x = 19, z=103 },
													{ idx = 3, x = 20, z=103 },
													{ idx = 4, x = 18, z=101 },
													{ idx = 5, x = 18, z=100 },
													{ idx = 6, x = 18, z=102 },
												},
													{--矿山秘洞
													{ idx = 1, varX = 39, z=22 },
													{ idx = 2, varX = 39, z=22 },
													{ idx = 3, varX = 39, z=22 },
													{ idx = 4, varX = 39, z=22 },
													{ idx = 5, varX = 39, z=22 },
													{ idx = 6, varX = 39, z=22 },
												},
												
												{--【个人】精英剧场1
													{ idx = 1, varX = 136, z=54  },
													{ idx = 2, varX = 212, z=151 },
													{ idx = 3, varX = 80 , z=181 },

												},
												
												{--【个人】精英剧场2
													{ idx = 1, varX = 119, z=129 },
													{ idx = 2, varX = 74 , z=44  },
													{ idx = 3, varX = 181, z=105 },

												},
												{--【个人】精英剧场3
													{ idx = 1, varX = 67 , z=84  },
													{ idx = 2, varX = 201, z=52  },
													{ idx = 3, varX = 138, z=159 },

												},
												{--【个人】精英剧场4
													{ idx = 1, varX = 118, z=149 },
													{ idx = 2, varX = 198, z=72  },
													{ idx = 3, varX = 60 , z=216 },

												},
												{--【个人】精英剧场5
													{ idx = 1, varX = 119, z=64  },
													{ idx = 2, varX = 187, z=111 },
													{ idx = 3, varX = 88 , z=158 },

												},
												{--【个人】精英剧场6
													{ idx = 1, varX = 143, z=81  },
													{ idx = 2, varX = 180, z=82  },
													{ idx = 3, varX = 201, z=154 },

												},
												{--【个人】精英剧场7
													{ idx = 1, varX = 139, z=73  },
													{ idx = 2, varX = 190, z=143 },
													{ idx = 3, varX = 69 , z=190 },

												},
												{--【个人】精英剧场8
													{ idx = 1, varX = 51 , z=196 },
													{ idx = 2, varX = 189, z=55  },
													{ idx = 3, varX = 38 , z=62  },

												},
												{--【个人】精英剧场9
													{ idx = 1, varX = 116, z=127 },
													{ idx = 2, varX = 52 , z=77  },
													{ idx = 3, varX = 111, z=197 },

												},
												{--【个人】精英剧场10
													{ idx = 1, varX = 127, z=110 },
													{ idx = 2, varX = 198, z=181 },
													{ idx = 3, varX = 90 , z=184 },

												},
												{--【个人】精英剧场11
													{ idx = 1, varX = 130, z=134 },
													{ idx = 2, varX = 200, z=72  },
													{ idx = 3, varX = 206, z=183 },

												},
												{--【个人】精英剧场12
													{ idx = 1, varX = 124, z=206 },
													{ idx = 2, varX = 143, z=94  },
													{ idx = 3, varX = 180, z=201 },

												},
												{--【个人】精英剧场13
													{ idx = 1, varX = 167, z=71  },
													{ idx = 2, varX = 86 , z=96  },
													{ idx = 3, varX = 103, z=205 },

												},
												{--【个人】精英剧场14
													{ idx = 1, varX = 196, z=65  },
													{ idx = 2, varX = 126, z=63  },
													{ idx = 3, varX = 100, z=213 },

												},
												{--【个人】精英剧场15
													{ idx = 1, varX = 209, z=58  },
													{ idx = 2, varX = 176, z=201 },
													{ idx = 3, varX = 80 , z=64  },

												},
												{--【个人】精英剧场16
													{ idx = 1, varX = 196, z=93  },
													{ idx = 2, varX = 201, z=217 },
													{ idx = 3, varX = 66 , z=58  },

												},
												{--【个人】精英剧场17
													{ idx = 1, varX = 48 , z=221 },
													{ idx = 2, varX = 203, z=128 },
													{ idx = 3, varX = 184, z=34  },

												},
												{--【个人】精英剧场18
													{ idx = 1, varX = 65 , z=151 },
													{ idx = 2, varX = 165, z=111 },
													{ idx = 3, varX = 78 , z=108 },

												},
												{--【个人】精英剧场19
													{ idx = 1, varX = 74 , z=119 },
													{ idx = 2, varX = 195, z=179 },
													{ idx = 3, varX = 118, z=190 },

												},
												{--【个人】精英剧场20
													{ idx = 1, varX = 154, z=102 },
													{ idx = 2, varX = 66 , z=116 },
													{ idx = 3, varX = 184, z=209 },

												},
												{--【个人】精英剧场21
													{ idx = 1, varX = 128, z=75  },
													{ idx = 2, varX = 180, z=201 },
													{ idx = 3, varX = 57 , z=197 },

												},	
										
												{--【个人】精英剧场1
													{ idx = 1, varX = 136, z=54  },
													{ idx = 2, varX = 212, z=151 },
													{ idx = 3, varX = 80 , z=181 },

												},
												
												{--【个人】精英剧场2
													{ idx = 1, varX = 119, z=129 },
													{ idx = 2, varX = 74 , z=44  },
													{ idx = 3, varX = 181, z=105 },

												},
												{--【个人】精英剧场3
													{ idx = 1, varX = 67 , z=84  },
													{ idx = 2, varX = 201, z=52  },
													{ idx = 3, varX = 138, z=159 },

												},
												{--【个人】精英剧场4
													{ idx = 1, varX = 118, z=149 },
													{ idx = 2, varX = 198, z=72  },
													{ idx = 3, varX = 60 , z=216 },

												},
												{--【个人】精英剧场5
													{ idx = 1, varX = 119, z=64  },
													{ idx = 2, varX = 187, z=111 },
													{ idx = 3, varX = 88 , z=158 },

												},
												{--【个人】精英剧场6
													{ idx = 1, varX = 143, z=81  },
													{ idx = 2, varX = 180, z=82  },
													{ idx = 3, varX = 201, z=154 },

												},
												{--【个人】精英剧场7
													{ idx = 1, varX = 139, z=73  },
													{ idx = 2, varX = 190, z=143 },
													{ idx = 3, varX = 69 , z=190 },

												},
												{--【个人】精英剧场8
													{ idx = 1, varX = 51 , z=196 },
													{ idx = 2, varX = 189, z=55  },
													{ idx = 3, varX = 38 , z=62  },

												},
												{--【个人】精英剧场9
													{ idx = 1, varX = 116, z=127 },
													{ idx = 2, varX = 52 , z=77  },
													{ idx = 3, varX = 111, z=197 },

												},
												{--【个人】精英剧场10
													{ idx = 1, varX = 127, z=110 },
													{ idx = 2, varX = 198, z=181 },
													{ idx = 3, varX = 90 , z=184 },

												},
												{--【个人】精英剧场11
													{ idx = 1, varX = 130, z=134 },
													{ idx = 2, varX = 200, z=72  },
													{ idx = 3, varX = 206, z=183 },

												},
												{--【个人】精英剧场12
													{ idx = 1, varX = 124, z=206 },
													{ idx = 2, varX = 143, z=94  },
													{ idx = 3, varX = 180, z=201 },

												},
												{--【个人】精英剧场13
													{ idx = 1, varX = 167, z=71  },
													{ idx = 2, varX = 86 , z=96  },
													{ idx = 3, varX = 103, z=205 },

												},
												{--【个人】精英剧场14
													{ idx = 1, varX = 196, z=65  },
													{ idx = 2, varX = 126, z=63  },
													{ idx = 3, varX = 100, z=213 },

												},
												{--【个人】精英剧场15
													{ idx = 1, varX = 209, z=58  },
													{ idx = 2, varX = 176, z=201 },
													{ idx = 3, varX = 80 , z=64  },

												},
												{--【个人】精英剧场16
													{ idx = 1, varX = 196, z=93  },
													{ idx = 2, varX = 201, z=217 },
													{ idx = 3, varX = 66 , z=58  },

												},
												{--【个人】精英剧场17
													{ idx = 1, varX = 48 , z=221 },
													{ idx = 2, varX = 203, z=128 },
													{ idx = 3, varX = 184, z=34  },

												},
												{--【个人】精英剧场18
													{ idx = 1, varX = 65 , z=151 },
													{ idx = 2, varX = 165, z=111 },
													{ idx = 3, varX = 78 , z=108 },

												},
												{--【个人】精英剧场19
													{ idx = 1, varX = 74 , z=119 },
													{ idx = 2, varX = 195, z=179 },
													{ idx = 3, varX = 118, z=190 },

												},
												{--【个人】精英剧场20
													{ idx = 1, varX = 154, z=102 },
													{ idx = 2, varX = 66 , z=116 },
													{ idx = 3, varX = 184, z=209 },

												},
												{--【个人】精英剧场21
													{ idx = 1, varX = 128, z=75  },
													{ idx = 2, varX = 180, z=201 },
													{ idx = 3, varX = 57 , z=197 },

												},	

												{--【个人】精英剧场1
													{ idx = 1, varX = 136, z=54  },
													{ idx = 2, varX = 212, z=151 },
													{ idx = 3, varX = 80 , z=181 },

												},
												
												{--【个人】精英剧场2
													{ idx = 1, varX = 119, z=129 },
													{ idx = 2, varX = 74 , z=44  },
													{ idx = 3, varX = 181, z=105 },

												},
												{--【个人】精英剧场3
													{ idx = 1, varX = 67 , z=84  },
													{ idx = 2, varX = 201, z=52  },
													{ idx = 3, varX = 138, z=159 },

												},
												{--【个人】精英剧场4
													{ idx = 1, varX = 118, z=149 },
													{ idx = 2, varX = 198, z=72  },
													{ idx = 3, varX = 60 , z=216 },

												},
												{--【个人】精英剧场5
													{ idx = 1, varX = 119, z=64  },
													{ idx = 2, varX = 187, z=111 },
													{ idx = 3, varX = 88 , z=158 },

												},
												{--【个人】精英剧场6
													{ idx = 1, varX = 143, z=81  },
													{ idx = 2, varX = 180, z=82  },
													{ idx = 3, varX = 201, z=154 },

												},
												{--【个人】精英剧场7
													{ idx = 1, varX = 139, z=73  },
													{ idx = 2, varX = 190, z=143 },
													{ idx = 3, varX = 69 , z=190 },

												},
												{--【个人】精英剧场8
													{ idx = 1, varX = 51 , z=196 },
													{ idx = 2, varX = 189, z=55  },
													{ idx = 3, varX = 38 , z=62  },

												},
												{--【个人】精英剧场9
													{ idx = 1, varX = 116, z=127 },
													{ idx = 2, varX = 52 , z=77  },
													{ idx = 3, varX = 111, z=197 },

												},
												{--【个人】精英剧场10
													{ idx = 1, varX = 127, z=110 },
													{ idx = 2, varX = 198, z=181 },
													{ idx = 3, varX = 90 , z=184 },

												},
												{--【个人】精英剧场11
													{ idx = 1, varX = 130, z=134 },
													{ idx = 2, varX = 200, z=72  },
													{ idx = 3, varX = 206, z=183 },

												},
												{--【个人】精英剧场12
													{ idx = 1, varX = 124, z=206 },
													{ idx = 2, varX = 143, z=94  },
													{ idx = 3, varX = 180, z=201 },

												},
												{--【个人】精英剧场13
													{ idx = 1, varX = 167, z=71  },
													{ idx = 2, varX = 86 , z=96  },
													{ idx = 3, varX = 103, z=205 },

												},
												{--【个人】精英剧场14
													{ idx = 1, varX = 196, z=65  },
													{ idx = 2, varX = 126, z=63  },
													{ idx = 3, varX = 100, z=213 },

												},
												{--【个人】精英剧场15
													{ idx = 1, varX = 209, z=58  },
													{ idx = 2, varX = 176, z=201 },
													{ idx = 3, varX = 80 , z=64  },

												},
												{--【个人】精英剧场16
													{ idx = 1, varX = 196, z=93  },
													{ idx = 2, varX = 201, z=217 },
													{ idx = 3, varX = 66 , z=58  },

												},
												{--【个人】精英剧场17
													{ idx = 1, varX = 48 , z=221 },
													{ idx = 2, varX = 203, z=128 },
													{ idx = 3, varX = 184, z=34  },

												},
												{--【个人】精英剧场18
													{ idx = 1, varX = 65 , z=151 },
													{ idx = 2, varX = 165, z=111 },
													{ idx = 3, varX = 78 , z=108 },

												},
												{--【个人】精英剧场19
													{ idx = 1, varX = 74 , z=119 },
													{ idx = 2, varX = 195, z=179 },
													{ idx = 3, varX = 118, z=190 },

												},
												{--【个人】精英剧场20
													{ idx = 1, varX = 154, z=102 },
													{ idx = 2, varX = 66 , z=116 },
													{ idx = 3, varX = 184, z=209 },

												},
												{--【个人】精英剧场21
													{ idx = 1, varX = 128, z=75  },
													{ idx = 2, varX = 180, z=201 },
													{ idx = 3, varX = 57 , z=197 },

												},	
											}

x700081_var_BackPosList =   {
												{ --1
													{ idx = 1, varX = 126, z=110 },
													{ idx = 2, varX = 126, z=110 },
													{ idx = 3, varX = 126, z=110 },
													{ idx = 4, varX = 126, z=110 },
													{ idx = 5, varX = 126, z=110 },
													{ idx = 6, varX = 126, z=110 },
												},
												
												{ 
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63},
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},


												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
													{ idx = 7, varX = 300, z=63 },
													{ idx = 8, varX = 300, z=63 },
													{ idx = 9, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},--10

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},--19
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},--28

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												
												
												

												{
													{ idx = 1, varX = 40, z=129 },
													{ idx = 2, varX = 40, z=129 },
													{ idx = 3, varX = 40, z=129 },
													{ idx = 4, varX = 40, z=129 },
													{ idx = 5, varX = 40, z=129 },
													{ idx = 6, varX = 40, z=129 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
													{ idx = 7, varX = 300, z=63 },
													{ idx = 8, varX = 300, z=63 },
													{ idx = 9, varX = 300, z=63 },
												},--35
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
													{ idx = 7, varX = 300, z=63 },
													{ idx = 8, varX = 300, z=63 },
													{ idx = 9, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
													{ idx = 7, varX = 300, z=63 },
													{ idx = 8, varX = 300, z=63 },
													{ idx = 9, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 126, z=110 },
													{ idx = 2, varX = 126, z=110 },
													{ idx = 3, varX = 126, z=110 },
													{ idx = 4, varX = 126, z=110 },
													{ idx = 5, varX = 126, z=110 },
													{ idx = 6, varX = 126, z=110 },
													{ idx = 7, varX = 126, z=110 },
													{ idx = 8, varX = 126, z=110 },
													{ idx = 9, varX = 126, z=110 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 156, z=59 },
													{ idx = 2, varX = 156, z=59 },
													{ idx = 3, varX = 156, z=59 },
													{ idx = 4, varX = 156, z=59 },
													{ idx = 5, varX = 156, z=59 },
													{ idx = 6, varX = 156, z=59 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 }, 
												},--46

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},--53

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},--60
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},--68 月宫
												{
													{ idx = 1, varX = 259, z=192 },
													{ idx = 2, varX = 259, z=192 },
													{ idx = 3, varX = 259, z=192 },
													{ idx = 4, varX = 259, z=192 },
													{ idx = 5, varX = 259, z=192 },
													{ idx = 6, varX = 259, z=192 },
												},--69 天关
												{
													{ idx = 1, varX = 259, z=192 },
													{ idx = 2, varX = 259, z=192 },
													{ idx = 3, varX = 259, z=192 },
													{ idx = 4, varX = 259, z=192 },
													{ idx = 5, varX = 259, z=192 },
													{ idx = 6, varX = 259, z=192 },
												},--70 杳无音讯的村庄
												{
													{ idx = 1, varX = 259, z=192 },
													{ idx = 2, varX = 259, z=192 },
													{ idx = 3, varX = 259, z=192 },
													{ idx = 4, varX = 259, z=192 },
													{ idx = 5, varX = 259, z=192 },
													{ idx = 6, varX = 259, z=192 },
												},--69 污染边塞
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												
												{--【团队】角斗场
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{--【团队】角斗场精英模式
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{--【团队】角斗场
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{--【团队】角斗场精英模式2
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},


												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
												  { idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 }, 
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
													{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},
												
												{
													{ idx = 1, varX = 300, z=63 },
													{ idx = 2, varX = 300, z=63 },
													{ idx = 3, varX = 300, z=63 },
													{ idx = 4, varX = 300, z=63 },
													{ idx = 5, varX = 300, z=63 },
													{ idx = 6, varX = 300, z=63 },
												},

												{ --矿山秘洞
													{ idx = 1, varX = 254, z=120 },
													{ idx = 2, varX = 254, z=120 },
													{ idx = 3, varX = 254, z=120 },
													{ idx = 4, varX = 254, z=120 },
													{ idx = 5, varX = 254, z=120 },
													{ idx = 6, varX = 254, z=120 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
												{--【个人】精英剧场
													{ idx = 1, varX = 137, z=320 },
													{ idx = 2, varX = 137, z=320 },
													{ idx = 3, varX = 137, z=320 },
													{ idx = 4, varX = 137, z=320 },
													{ idx = 5, varX = 137, z=320 },
													{ idx = 6, varX = 137, z=320 },
												},
											}


x700081_var_Item_XJ =	{
												{index = 1,varItem=0, varCount=0},
												{varItem=0, varCount=0},			      
												{varItem=0, varCount=0},			      
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{index = 10,varItem=0, varCount=0},
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},     		    
												{index = 20,varItem=0, varCount=0},
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},    		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												{varItem=0, varCount=0},     		    
												
																								   
												{index = 31,varItem=0, varCount=0},
												{varItem=11990012, varCount=1},     
												{varItem=11990012, varCount=1},     
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=11990012, varCount=1},     
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=11990012, varCount=1},     
												{varItem=11990011, varCount=1},     
												{index = 46,varItem=11990011, varCount=1},
												{varItem=0, varCount=0},   				  
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=11990011, varCount=1},     
												{varItem=11990012, varCount=1},     
												{varItem=11990011, varCount=1},     
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{index = 58,varItem=11990011, varCount=1},
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=11990011, varCount=1},     
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=11990011, varCount=1},     
												{varItem=0, varCount=0},            
												{varItem=0, varCount=0},            
												{varItem=11990012, varCount=1},     

												{index = 68,varItem=11000386, varCount=1},    --月宫
												{index = 69,varItem=12100011, varCount=1},    --天关
												{index = 70,varItem=12100011, varCount=1},    --杳无音讯的村庄
												{index = 71,varItem=12100011, varCount=1},    --污染边塞
												{varItem=0, varCount=1},     --【队伍】神秘宝库
												{varItem=0, varCount=1},     --【队伍】神秘宝库
												{varItem=0, varCount=1},     --【队伍】神秘宝库
												{varItem=0, varCount=1},     --【队伍】神秘宝库
												{varItem=0, varCount=1},     --【队伍】神秘宝库
												{varItem=0, varCount=1},     --【队伍】神秘宝库
												{varItem=0, varCount=1},     --【队伍】神秘宝库

												{varItem=0, varCount=1},     --【个人】十字井副本1
												{varItem=0, varCount=1},  --【队伍】十字井副本1  

												{varItem=11990012, varCount=1},     --【队伍】藏宝洞6  

												{varItem=0, varCount=0},     --【团队】角斗场	
												{varItem=11990012, varCount=1},     --【团队】角斗场精英模式
												{varItem=0, varCount=0},     --【团队】角斗场2	
												{varItem=11990012, varCount=1},     --【团队】角斗场精英模式2

												{varItem=11990011, varCount=0},     --挑战副本第一环，检测物品只做为是否扣现金的标记，实际不扣物品      
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=11990011, varCount=0},     --挑战副本第一环，检测物品只做为是否扣现金的标记，实际不扣物品          
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},
												{varItem=12271408, varCount=1},		--矿山秘洞（道具）
												{varItem=0, varCount=0},	
												
												{varItem=0, varCount=0},   --【个人】精英剧场	
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												
												{varItem=0, varCount=0},   --【个人】精英剧场	
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												
												{varItem=0, varCount=0},   --【个人】精英剧场	
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
											}

x700081_var_Item_ZHOUXJ						=	{								
												{varItem=0, varCount=0},			      
												{varItem=0, varCount=0},			      
												{varItem=0, varCount=0},								
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{index = 12,varItem=0, varCount=0},
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},         		    
												{varItem=0, varCount=0},         		    
												{varItem=0, varCount=0},         		    
												{varItem=0, varCount=0},     			      
												{varItem=0, varCount=0},     			      
												{varItem=0, varCount=0},     			      
												{varItem=0, varCount=0},     			      
												{varItem=0, varCount=0},     			      
												{varItem=0, varCount=0},     			      
												{index = 28,varItem=0, varCount=0},
												{varItem=0, varCount=0},     			      
												{varItem=0, varCount=0},     			      
																								        
												{varItem=0, varCount=0},                
												{varItem=11990012, varCount=1},         
												{varItem=11990012, varCount=1},         
												{varItem=11990012, varCount=0},         
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=11990012, varCount=0},         
												{varItem=0, varCount=0},                
												{varItem=11990012, varCount=1},         
												{index = 42,varItem=11990012, varCount=0},
												{varItem=11990012, varCount=0},         
												{varItem=11990012, varCount=1},         
												{varItem=11990011, varCount=1},         
												{varItem=11990011, varCount=1},         
												{varItem=11990012, varCount=1},         
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=0, varCount=0},                
												{varItem=11990011, varCount=0},         
												{varItem=11990011, varCount=1},         
												{varItem=11990012, varCount=1},         
												{index = 54,varItem=11990011, varCount=1},
												{varItem=11990011, varCount=0},         
												{varItem=11990011, varCount=0},         
												{varItem=11990011, varCount=0},         
												{varItem=11990011, varCount=1},     		
												{varItem=11990011, varCount=0},     		
												{varItem=11990011, varCount=0},     		
												{varItem=11990011, varCount=1},     		
												{varItem=11990011, varCount=0},     		
												{index = 63,varItem=11990011, varCount=0},
												{varItem=11990011, varCount=1},     		
												{varItem=11990011, varCount=0},     		
												{varItem=11990011, varCount=0},     		
												{varItem=11990012, varCount=1},     		
																								
												{index = 68,varItem=11000386, varCount=1},  --月宫
												{index = 69,varItem=12100011, varCount=1},  --天关
												{index = 70,varItem=12100011, varCount=1},  --天关
												{index = 71,varItem=12100011, varCount=1},  --天关
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【队伍】神秘宝库
												{varItem=0, varCount=0},         --【个人】十字井副本1
												{varItem=0, varCount=0}, 				 --【队伍】十字井副本1
												{varItem=11990012, varCount=1},         --【队伍】藏宝洞6 	       
      
												{varItem=11990012, varCount=1},   		  --【团队】角斗场 	
												{varItem=11990012, varCount=1},   		  --【团队】角斗场精英模式
												{varItem=11990012, varCount=1},   		  --【团队】角斗场	
												{varItem=11990012, varCount=1},   		  --【团队】角斗场精英模式2

												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},           
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0},     		   
												{varItem=0, varCount=0}, 
												{varItem=12271408, varCount=1}, 			--矿山秘洞（道具）								 		   
												{varItem=0, varCount=0},  
												
												{varItem=0, varCount=0},   --【个人】精英剧场		
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场	
													
												{varItem=0, varCount=0},   --【个人】精英剧场		
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场					
													
												{varItem=0, varCount=0},   --【个人】精英剧场		
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场
												{varItem=0, varCount=0},   --【个人】精英剧场													 		   
											}
											
x700081_var_FuBenCreateOK				= 	"副本创建完成！"
x700081_var_FuBenCreateFailed			= 	"副本已达上限，请稍后再试！"
x700081_var_CountDownMessage			= 	"你将在%d秒后离开场景！"
x700081_var_TimeOutFailedMessage		= 	"副本时间到！即将被传出副本！"

x700081_str_NotTime				= "进入副本的时间未到"
x700081_str_NotDay				= " 今天不可以进入副本";
x700081_str_UnderLevel			= "你的等级不足%d级！" 
x700081_str_TooHighLevel		= "你的等级高于%d级！" 
x700081_str_UpLevel				= "等级过高"
x700081_str_TimesOver			= "超出次数限制"

x700081_var_NoUserTimeTry				= 	120						
x700081_var_NoUserTime				= 	30						
x700081_var_DefaultTickTime			= 	5						
x700081_var_SpecialTickTimeList		={
										{varId=700021, tick =2},
										{varId=700109, tick =5},
										{varId=700221, tick =2},
										{varId=700207, tick =3},
										{varId=700300, tick =2}, --【团队】角斗场1
										{varId=700301, tick =2}, --【团队】角斗场精英模式1
										{varId=700302, tick =2}, --【团队】角斗场2
										{varId=700303, tick =2}, --【团队】角斗场精英模式2
										{varId=701130, tick =2}, -- 精英剧场
									}

										
x700081_var_DefaultCloseTick					= 	6						
x700081_var_SpecialCloseTickList		={
										{varId=700021, tick =6*5/2},
										{varId=700109, tick =6*5/3},
										{varId=700221, tick =6*5/2},
										{varId=700207, tick =6*5/3},
									}





x700081_var_TopListMonsterLimited = {
									{varScript = 700028, varCount = 10, campid = 21},  
									{varScript = 700023, varCount = 10, campid = 21},  
									{varScript = 700004, varCount = 10, campid = 21},  
									{varScript = 700024, varCount = 10, campid = 21},  
									{varScript = 700008, varCount = 10, campid = 21},  
									{varScript = 700009, varCount = 10, campid = 21},  
									{varScript = 700108, varCount = 10, campid = 21},  
									{varScript = 700013, varCount = 10, campid = 21},  
									{varScript = 700027, varCount = 10, campid = 21},  
									{varScript = 700030, varCount = 10, campid = 21},  
									{varScript = 700031, varCount = 10, campid = 21},  
									{varScript = 700032, varCount = 10, campid = 21},  
									{varScript = 700084, varCount = 10, campid = 21}, 
									{varScript = 700085, varCount = 10, campid = 21}, 
									{varScript = 700086, varCount = 10, campid = 21}, 
									{varScript = 700087, varCount = 10, campid = 21}, 
									{varScript = 700088, varCount = 10, campid = 21}, 
									{varScript = 700089, varCount = 10, campid = 21}, 
									{varScript = 700090, varCount = 10, campid = 21}, 
									{varScript = 700091, varCount = 10, campid = 21}, 
									{varScript = 700092, varCount = 10, campid = 21}, 
								}

--试炼副本后三环对应进入 MD 索引表
x700081_var_TryLoopMDIndexTable =
{
[9]  = 23,
[10] = 23,
[12] = 23,
[5]  = 24,
[15] = 24,
[16] = 24,
[13] = 25,
[14] = 25,
[18] = 25,
[19] = 26,
[20] = 26,
[21] = 26,
[22] = 27,
[23] = 27,
[24] = 27,
[25] = 28,
[26] = 28,
[27] = 28,
[28] = 29,
[29] = 29,
[30] = 29,
}

-- 进入副本时添加特殊buff
x700081_var_addbuff = 
{
	[700024] = {varScript = 700028, fubenType = 2, buffid = 32059},
	[700009] = {varScript = 700009, fubenType = 2, buffid = 32059},
}
-- 需要处理玩家死亡的副本id
x700081_var_CanDealPlayerDie_ScriptId = 
{
	[700023] = 1,
}

x700081_var_FubenYYChannelTab =
{
	-- 需要进入YY频道的副本的scriptid
	700107, 710000,	700229,	700206,	700004,	700022,	700013,	700221,	700008,	700009,	700212,
	700024,	700108,	700109,	700023,	700028,	700210,	700027,	700030,	700031,	700032,	700084,
	700085,	700086,	700087,	700088,	700089,	700090,	700091,	700092,	700001,	700029,	700006,
	700004,	700022,	700022,	700022,	700106,	700013,	700002,	700021,	700008,	700009,	700012,
	700024,	700108,	700109,	700025,	700020,	700019,	700023,	700028,	700010,	700030,	700031,
	700032,	700027,	700084,	700085,	700086,	700087,	700088,	700089,	700090,	700091,	700092,
	700012,	700111,	700112,	700113,	700114,	700115,	700116,	700117,	700118,	700119,	700119,
	700102,	700300,	700300,	700302,	700303,	700028,	700023,	700004,	700024,	700009,	700008,
	700108,	700013,	700027,	700030,	700031,	700032,	700084,	700085,	700086,	700087,	700088,
	700089,	700090,	700091,	700092,
}

--专门配置挑战副本最大次数
x700081_var_ChallengeFubenMaxCountTab =
{
[700004]=10, --挑战囚龙岛第三环龙穴
[700008]=10, --挑战和氏璧第三环和氏璧
}

--配置可以进入精英剧场的中等难度和专家难度的wordID。 如果tab为空表示精英剧场所有难度对所有Word都开放
x700081_var_OpenJingYingFuben_World_Tab =
{

}
function x700081_GetFubenType(varIndex)
	return x700081_var_RegisterFuben[varIndex].fubentype
end

function x700081_GetTitleIndex()	
	local nWeekIndex = GetWeekIndex() 
	
	local nTitleIndex = mod(nWeekIndex,16)
    if nTitleIndex == 0 then
        nTitleIndex = 16
    end
    return nTitleIndex
end

function x700081_IsSanHuanFuben(varIndex)  
	if varIndex == 1 or varIndex == 3 or varIndex == 5 or varIndex == 7 or varIndex == 9 or varIndex == 11 or varIndex == 13 or varIndex == 15 then
		return 1
	end 
	return 0
end
function x700081_GetChallengeFubenIndex(varMap, varPlayer, nNpcGuid)	
	local titleIndex = x700081_GetTitleIndex()
	if x700081_IsSanHuanFuben(titleIndex) == 0 then
		return -1
	end
	
	for varI,s in x700081_var_ChallengeNpcGuid do
		if x700081_var_ChallengeNpcGuid[varI] == nNpcGuid then
			return x700081_var_ToplistInfo[titleIndex].varIndex
		end
	end
    return -1
end


function x700081_IsFirstFuben(varIndex) 
	if x700081_var_RegisterFuben[varIndex].loopindex == 0 or x700081_var_RegisterFuben[varIndex].loopindex == 1 then
		return 1
	end
	return 0 
end
function x700081_ShowFubenList(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)

	local nNpcGuid = GetNpcGuid(varMap,varTalknpc)

	if nNpcGuid<=0 then
		return
	end
	
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	
	local varCountry = GetCurCountry( varMap, varPlayer )
	
	if varScriptFileId==nil then
		local varIndex =0;
		for varI,item in x700081_var_RegisterFuben do
			varIndex = varIndex+1
			if item.varTalkNpcGUID[varCountry+1] == nNpcGuid then


				if x700081_IsFirstFuben(varIndex) ~= 1 then
					if item.fubentype == nFubenType then
						x700081_ProcClearTypeMode(varMap, varPlayer, varTalknpc, varIndex)	
						x700081_ShowFuben(varMap, varPlayer, varTalknpc, varIndex)
					end
				else
					x700081_ProcClearTypeMode(varMap, varPlayer, varTalknpc, varIndex)	
					x700081_ShowFuben(varMap, varPlayer, varTalknpc, varIndex)
				end
			end
		end
	else
		local varIndex =0;
		for varI,item in x700081_var_RegisterFuben do
			varIndex = varIndex+1
			if item.varId == varScriptFileId then
				x700081_ProcClearTypeMode(varMap, varPlayer, varTalknpc, varIndex)	
				x700081_ShowFuben(varMap, varPlayer, varTalknpc, varIndex)
			end
		end
	end
end
function x700081_ProcClearTypeMode(varMap, varPlayer, varTalknpc, varIndex)
	if x700081_IsFirstFuben(varIndex) == 1 then
		SetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE ,0 )
		SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE ,0 )
		SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, 0)
	end
end

function x700081_IsShowTrainMenu(varMap, varPlayer, varTalknpc)  

	local fubenType = 1
	local fubenMode = 0
	
	local varCountry = GetCurCountry( varMap, varPlayer )
	local nNpcGuid = GetNpcGuid(varMap,varTalknpc)
	local varIndex =0;
	
	for varI,item in x700081_var_RegisterFuben do
		varIndex = varIndex+1
		
		if item.varTalkNpcGUID[varCountry+1] == nNpcGuid then
			if item.fubentype == nil then
				item.fubentype = 0
			end
			
			if item.fubentype == fubenType then
			
				local varLevel = GetLevel( varMap,varPlayer )

				local nLevelMin = x700081_var_LevelRangeList[varIndex][1]
				local nLevelMax = x700081_var_LevelRangeList[varIndex][2]
				
				if varLevel >= nLevelMin and varLevel<=nLevelMax then
					local varCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
					
					if varCount < 1 then
						return 1
						
					end
				   
				end

			end
		end
	end
	return 0
	
end

function x700081_IsShowHeroMenu(varMap, varPlayer, varTalknpc)  

	local fubenType = 2
	
	local varCountry = GetCurCountry( varMap, varPlayer )
	local nNpcGuid = GetNpcGuid(varMap,varTalknpc)
	local varIndex =0;
	
	local varLevel = GetLevel( varMap,varPlayer )
	for varI,item in x700081_var_RegisterFuben do
		varIndex = varIndex+1
		
		if item.varTalkNpcGUID[varCountry+1] == nNpcGuid then
			if item.fubentype == nil then
				item.fubentype = 0
			end
			
			if item.fubentype == fubenType then
	
				local nLevelMin = x700081_var_LevelRangeList[varIndex][1]
				local nLevelMax = x700081_var_LevelRangeList[varIndex][2]
				
				if varLevel >= nLevelMin and varLevel <= nLevelMax then
					return 1
				   
				end
				
			end
		end
	end
	return 0
	
end

function x700081_IsFubenScene(varMap) 
	local varMapType = GetSceneType(varMap)
	if varMapType == 1 then 
		return 1
	end
	return 0
end

function x700081_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)
	--local today = GetDayOfYear()
	--SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3], today)
	--SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAYCOUNT1[1], MD_FUBEN_FUTUTA_DAYCOUNT1[2], MD_FUBEN_FUTUTA_DAYCOUNT1[3], 0)--当前次数
	--SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], 0)--当前层数
	--SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3], 0)--最大层数
	--SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3], 1)

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	local nNpcGuid = GetNpcGuid(varMap,varTalknpc)

	if nNpcGuid <=0 then
		return
	end
	
	local varIndex = x700081_GetChallengeFubenIndex(varMap, varPlayer, nNpcGuid)       
 	if varIndex ~= -1 and varIndex ~= nil then
 		if varIndex == 35 then  
 			SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE, 0)
 			SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, 0)
 		else 
 			SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE, 1)           
			SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, 1)       
		end
 		x700081_ShowFuben(varMap, varPlayer, varTalknpc, varIndex)
 		return
 	end

	local varCountry = GetCurCountry( varMap, varPlayer )
	if varScriptFileId == nil then		
		local varTalkNpcGUID = x700081_var_FubenClassMenu.varTalkNpcGUID
		if varTalkNpcGUID[varCountry+1] == nNpcGuid then
			local ClassMenu = x700081_var_FubenClassMenu.classmenu
			for varI,s in ClassMenu do
				if varI == 1 then
					
						
					x700081_ShowFubenName(varMap, varPlayer, varTalknpc, s.fubentype, s.mode)  
				elseif varI==4 then														
					if x700081_IsShowHeroMenu(varMap, varPlayer,varTalknpc) == 1 then
						if x700081_CheckFubenToggle(s.fubentype) == 1 then
							--TalkAppendButton(varMap, x700081_var_FileId, s.varName,14,1000+varI)
						end
					end
				else
					local nLevel = GetLevel(varMap, varPlayer)
					if nLevel >= 20 then
						TalkAppendButton(varMap, x700081_var_FileId, s.varName,14,1000+varI)
					end
				end
			end
			return
		end
		
		varTalkNpcGUID = x700081_var_kuafu_search.varTalkNpcGUID
		if varTalkNpcGUID[varCountry+1] == nNpcGuid then
			local ClassMenu = x700081_var_kuafu_search.classmenu
			local nLevel = GetLevel(varMap, varPlayer)
					if nLevel >= 20 then
					local nToggle = x700081_CheckKuafuToggle()	
						if nToggle == 1 then
							TalkAppendButton(varMap, x700081_var_FileId, ClassMenu[varCountry+1].varName,14,1500)
						end
		  		end	
			return
		end								
	end
	
	--检查挑战副本
	if x700081_IsShowHeroMenu(varMap, varPlayer,varTalknpc) == 1 then
		if x700081_CheckFubenToggle(2) == 1 then
			x700081_ShowFubenList(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)
		end
		return
	end
	
	x700081_ShowFubenList(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)
end

function x700081_GetTeamMinLevel(varMap, varPlayer)

	if IsTeamLeader(varMap, varPlayer) <= 0 then
		local nLevel = GetLevel(varMap, varPlayer)
		return nLevel
	end

	local teamid = GetTeamId(varMap, varPlayer);
	local teamnum = GetTeamSize(varMap, varPlayer);
	local nearteamnum = GetNearTeamCount(varMap, varPlayer);
	
	local nMinLevel = 200
	for varI = 0, nearteamnum - 1 do
		local memberId = GetNearTeamMember(varMap, varPlayer, varI);
		
		local nLevel = GetLevel(varMap, memberId)

		if nLevel<nMinLevel then
			nMinLevel = nLevel
		end
	end

	return nMinLevel
end

function x700081_GetRandomLoopIndex( varMap, varPlayer )	

	local nLevel = x700081_GetTeamMinLevel(varMap, varPlayer)
	
	local randomlist = {}
	local varIndex =0;
	local varCount = 0;
	for varI,item in x700081_var_RegisterFuben do
		varIndex = varIndex+1
		--三番随机选择排除浮屠塔副本，脚本编号 700121
		if item.varId ~= 700121 and item.varId ~= 701130 and item.loopindex == 1 and item.fubentype == 0 and nLevel >= x700081_var_LevelRangeList[varIndex][1] and nLevel <= x700081_var_LevelRangeList[varIndex][2] then
			varCount = varCount +1
			randomlist[varCount] = varIndex
			
		end
	end
	if varCount ==0 then
		return 0
	end
	
	
	local nRandomlist = {}
	local nNewCount = 0;
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_SANHUAN_LASTINDEX[1], MD_FUBEN_SANHUAN_LASTINDEX[2], MD_FUBEN_SANHUAN_LASTINDEX[3], 0)
	local lastIndex = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_SANHUAN_LASTINDEX[1], MD_FUBEN_SANHUAN_LASTINDEX[2], MD_FUBEN_SANHUAN_LASTINDEX[3])
	if lastIndex ~= 0 and varCount > 1 then
		for j,s in randomlist do
			if s ~= lastIndex then
				nNewCount = nNewCount + 1
				nRandomlist[nNewCount] = s
			end
		end
		return nRandomlist[random(1,nNewCount)]
	end

	return randomlist[random(1,varCount)]
end


function x700081_DispatchDetailDesc(varMap , varPlayer , varTalknpc , varIndex , varName, varMode)

	local ranIndex = x700081_GetRandomLoopIndex(varMap, varPlayer)	
	--进行一次检查
	if x700081_NpcEventCheck(varMap, varPlayer, varTalknpc, ranIndex) <= 0 then
		return
	end
	
	StartTalkTask(varMap)
		
		if varMode ==0 then
			TalkAppendString(varMap,"#Y"..varName.."")
		elseif varMode ==1 then
			TalkAppendString(varMap,"#Y"..varName.."")
		elseif varMode ==2 then
			TalkAppendString(varMap,"#Y"..varName.."")
		else
			return
		end
		
		TalkAppendString(varMap,"\n\t每周一共可以进行21次三环副本。使用三番令进入副本，消耗3次本周的副本次数，同时获得3次三环副本的奖励。若本周剩余副本次数不足3次，则不可使用三番令。")

		if varMode ==0 then
			TalkAppendString(varMap,"\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！")
		elseif varMode ==1 then
			TalkAppendString(varMap,"\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得普通三环副本3倍的经验奖励！\n#Y特别提示：#W只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。")
		elseif varMode ==2 then
			TalkAppendString(varMap,"副本说明："..varName.."周三番模式")
		else
			return
		end

		


	StopTalkTask()

	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700081_var_FileId, -1);
	
	
	
	x700081_SaveFubenIndex(varMap, varPlayer, ranIndex)
	
end
function x700081_ShowFuben(varMap, varPlayer, varTalknpc, varIndex)

	local varLevel = GetLevel( varMap,varPlayer )

	local nLevelMin = x700081_var_LevelRangeList[varIndex][1]
	local nLevelMax = x700081_var_LevelRangeList[varIndex][2]
	if varLevel < nLevelMin or varLevel>nLevelMax then
		

       return		
    end

	if x700081_var_RegisterFuben[varIndex].fubentype == 1 then  
		local varCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
		if varCount >= 1 then
			
			return			
		end
	end
	
	if varIndex == 37 and varLevel < 80 then 
		return
	end
	if x700081_var_RegisterFuben[varIndex].fubentype == 1 then
		TalkAppendButton(varMap, x700081_var_FileId, x700081_var_FubenNameList[varIndex],16,varIndex)
	elseif 3 == x700081_var_RegisterFuben[varIndex].fubentype then
		x700081_ShowGroupEntrance(varMap, varPlayer, varIndex)
	else
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			TalkAppendButton(varMap, x700081_var_FileId, "【个人】浮屠塔",14,varIndex)	
		elseif x700081_var_RegisterFuben[varIndex].varId == 701130 then
			TalkAppendButton(varMap, x700081_var_FileId, "【个人】精英剧场",14,varIndex)
		elseif 	x700081_var_RegisterFuben[varIndex].varId == 700193 then --家园副本
			local bSelfGarden = LuaCallNoclosure(800200, "IsPlayerSelfGarden", varMap, varPlayer)
			if bSelfGarden == 1 then
				TalkAppendButton(varMap, x700081_var_FileId, x700081_var_FubenNameList[varIndex],14,varIndex)
			end
		else
			TalkAppendButton(varMap, x700081_var_FileId, x700081_var_FubenNameList[varIndex],14,varIndex)
		end
	end
	
end






function x700081_ShowFubenName(varMap, varPlayer, varTalknpc, fubenType, fubenMode)
	local varCountry = GetCurCountry( varMap, varPlayer )
	local nNpcGuid = GetNpcGuid(varMap,varTalknpc)
	local varIndex =0;
	
	
	if fubenType == 1 then   
		
	elseif fubenType == 2 then  
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【队伍】挑战副本#W\n \n\t从我这里可以进入挑战副本。想挑战人的极限吗？挑战副本是你最好的选择！挑战副本难度较高，必须拥有精良的装备和强大的队友才有可能挑战完成。")
		StopTalkTask()
	end
			
	for varI,item in x700081_var_RegisterFuben do
		varIndex = varIndex+1
		if item.varTalkNpcGUID[varCountry+1] == nNpcGuid then
			if item.fubentype == nil then
				item.fubentype = 0
			end
			
			
			if item.fubentype == fubenType then
				x700081_ProcClearTypeMode(varMap, varPlayer, varTalknpc, varIndex)	
				x700081_ShowFuben(varMap, varPlayer, varTalknpc, varIndex)
				
			end
		end
	end
	
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end

function x700081_KuaFuSearchDesc(varMap , varPlayer , varTalknpc , varIndex ,varMode)

	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y".. "【跨服】三番副本（三番令）" .."")
	TalkAppendString(varMap,"\n\t每周一共可以进行21次三环副本。使用三番令进入副本，消耗3次本周的副本次数，同时获得3次三环副本的奖励。若本周剩余副本次数不足3次，则不可使用三番令。")

	if varMode ==1 then
		TalkAppendString(varMap,"\n#Y开放时间：#W全天开放！\n#Y友情提示：#W个人、队伍都可报名，搜索满6人后，才可进入副本!\n#Y副本说明：#W在这个副本中，你可以获得普通三环副本3倍的经验奖励！\n#Y特别提示：#W只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。")
	else
		return
	end

	StopTalkTask()
  DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700081_var_FileId, -1)
 
 	x700081_SaveFubenIndex(varMap, varPlayer, varIndex)  --index计为报名
	
end

function x700081_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, varIndex)

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end
	if varIndex== nil then
		
		return
	end
	
	if varIndex == 1500 then
		--WriteLog(1, "跨服报名")
		local nToggle = x700081_CheckKuafuToggle()		
		if nToggle == 1 then
			x700081_KuaFuSearchDesc(varMap, varPlayer, varTalknpc, varIndex, x700081_var_SearchCorpsDefaultMode)
		end
		
		return
	end
	
	if varIndex > 1000 then
		varIndex = varIndex - 1000
		if varIndex == 2 or varIndex == 3 then
			
			local varName = x700081_var_FubenClassMenu.classmenu[varIndex].varName
			local fubenMode = x700081_var_FubenClassMenu.classmenu[varIndex].mode
			if fubenMode == nil then
				fubenMode = 0
			end
			SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, fubenMode)
			SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE, fubenMode)
			x700081_DispatchDetailDesc(varMap , varPlayer , varTalknpc, varIndex, varName, fubenMode)			
		else
			local fubenType = x700081_var_FubenClassMenu.classmenu[varIndex].fubentype
			local fubenMode = x700081_var_FubenClassMenu.classmenu[varIndex].mode
			if fubenMode == nil then
				fubenMode = 0
			end
			SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, fubenMode)
			SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE, fubenMode)
			x700081_ShowFubenName(varMap, varPlayer, varTalknpc, fubenType, fubenMode)
		end
		
	else
		
		if ( x700081_var_RegisterFuben[varIndex].varId == 700121 ) then

			local today = GetDayOfYear()
			local lastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3])
			
			--获取VIP等级
			local nItemID, nItemNum, vipLevel = GetPeerVipInfo(varMap, varPlayer, 1)
			local perCountXianZhi = 2
			local perFreeCountXianZhi = 1
			LuaCallNoclosure(700121, "ReturnFuTuTa", varMap, varPlayer)
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

			--if ( futuCount >= countXianZhi ) then
			--	Msg2Player( varMap, varPlayer, "每天最多只能进行"..countXianZhi.."次【个人】浮屠塔", 8, 3 )		
			--	--return   
			--end
			countXianZhi = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_XIANCI[1], MD_FUBEN_FUTUTA_XIANCI[2], MD_FUBEN_FUTUTA_XIANCI[3])
			--if ( futuCount >= countXianZhi ) then
			--	Msg2Player( varMap, varPlayer, "每天只能进行"..perFreeCountXianZhi.."次免费【个人】浮屠塔，您可以在主界面中选择增加次数", 8, 3 )		
			--	--return   
			--end
			
			local currentLoop = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3])
			local loopMax = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3])
			
			local varLevel = GetLevel(varMap, varPlayer)
			local perM = 30
			if ( varLevel - perM > 0 and varLevel - perM > loopMax ) then
				loopMax = varLevel - perM
				SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3], loopMax)
			end
			
			if ( currentLoop < 1 ) then
				currentLoop = 1
				SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_CURRENTINDEX[1], MD_FUBEN_LOOP_CURRENTINDEX[2], MD_FUBEN_LOOP_CURRENTINDEX[3], currentLoop)
			end
			if ( loopMax > LuaCallNoclosure(700121, "GetLoop", varMap, varPlayer) ) then
				loopMax = LuaCallNoclosure(700121, "GetLoop", varMap, varPlayer)
				SetPlayerGameData(varMap, varPlayer, MD_FUBEN_LOOP_INDEX[1], MD_FUBEN_LOOP_INDEX[2], MD_FUBEN_LOOP_INDEX[3], loopMax)
			end
			
			--WriteLog(1, "x700081_ProcEventEntry：Guid ============== "..GetGUID(varMap, varPlayer)..", fuben_currentLoop == "..currentLoop)
			--WriteLog(1, "x700081_ProcEventEntry：Guid ============== "..GetGUID(varMap, varPlayer)..", fuben_loopMax == "..loopMax)
			--WriteLog(1, "x700081_ProcEventEntry：Guid ============== "..GetGUID(varMap, varPlayer)..", futuCount == "..futuCount)
			
			x700081_SaveFubenIndex(varMap, varPlayer, varIndex)
			ShowFutuUI( varMap, varPlayer, 0, currentLoop, loopMax, futuCount, countXianZhi )
			return		
		end
		
	  if ( x700081_var_RegisterFuben[varIndex].varId == 701130 ) then  --【个人】精英剧场
	      x700081_SaveFubenIndex(varMap, varPlayer, varIndex)
	      
	      --SetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3], 12) 
	      
	      --获取剧场可玩最大索引
	      local jingyingIndex = GetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3])
	      
	      if (jingyingIndex == 0) then
	          jingyingIndex = 1
	      end
	      
	      local enterCount = x700081_GetEnterCount(varMap, varPlayer,varIndex)
	      
		    ShowFutuUI( varMap, varPlayer, 3, jingyingIndex, enterCount, -1, -1 )
		    WriteLog(1, "x700081_ProcEventEntry：Guid ============== "..GetGUID(varMap, varPlayer)..", varMap == "..varMap..", varPlayer == "..varPlayer.." jingyingIndex:"..jingyingIndex.." enterCount:"..enterCount)
		    return
		end
		
		x700081_DispatchEnterInfo( varMap, varPlayer, varTalknpc, varIndex )
	end
	
end

function x700081_NpcEventCheck(varMap, varPlayer, varTalknpc, varIndex)
			
		local varCountry = GetCurCountry( varMap, varPlayer )
		local varTalkNpcGUID = x700081_var_RegisterFuben[varIndex].varTalkNpcGUID[varCountry+1]
		local nNpcGuid = GetNpcGuid(varMap,varTalknpc)
		if varTalkNpcGUID ~= nNpcGuid then
			WriteLog(1, "Fuben Warning: EventEntry With Bad NpcGUID, GUID=%X, varIndex=%d, nNpcGuid=%d", GetGUID(varMap, varPlayer), varIndex, nNpcGuid)
			return 0
		end
		
		local nLevel = GetLevel(varMap, varPlayer)
		if nLevel < x700081_var_LevelRangeList[varIndex][1] then
			WriteLog(1, "Fuben Warning: EventEntry With Bad Level, GUID=%X, Level=%d, varIndex=%d", GetGUID(varMap, varPlayer), nLevel, varIndex)
			return 0
		end
		return 1
end


function x700081_DispatchEnterInfo( varMap, varPlayer, varTalknpc, varIndex )
	
	--npccheck
	if x700081_NpcEventCheck(varMap, varPlayer, varTalknpc, varIndex) <= 0 then
		return
	end
	
	x700081_SaveFubenIndex(varMap, varPlayer, varIndex)
	
	local strTopList = x700081_GetTopListText(varMap)

	StartTalkTask(varMap)

		if x700081_var_CountUntilList[varIndex]<=0 then   

			local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)

			if nFubenMode==1 then  
				if  x700081_var_RegisterFuben[varIndex].varId == 700121 then
					TalkAppendString(varMap,"【个人】浮屠塔")
				else
					TalkAppendString(varMap,x700081_var_FubenNameList[varIndex])
				end
				
			elseif nFubenMode==2 then  
				if  x700081_var_RegisterFuben[varIndex].varId == 700121 then
					TalkAppendString(varMap,"【个人】浮屠塔")
				else
					TalkAppendString(varMap,x700081_var_FubenNameList[varIndex])
				end	
			else
				if  x700081_var_RegisterFuben[varIndex].varId == 700121 then
					TalkAppendString(varMap,"#Y".."【个人】浮屠塔")
				else
					TalkAppendString(varMap,"#Y"..x700081_var_FubenNameList[varIndex])
				end
			end

		else
			if  x700081_var_RegisterFuben[varIndex].varId == 700121 then
				TalkAppendString(varMap,"#Y".."【个人】浮屠塔")
			else
				TalkAppendString(varMap,"#Y"..x700081_var_FubenNameList[varIndex])
			end
		end	
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			TalkAppendString(varMap,x700081_var_FutuEnterInfoList[1]..strTopList)
		else
			TalkAppendString(varMap,x700081_var_EnterInfoList[varIndex]..strTopList)
			local CostGold = x700081_GetCost(varMap, varPlayer, varIndex )	
			local Entercount = x700081_GetEnterCount(varMap, varPlayer, varIndex)+1    
			if varIndex == 83 or varIndex == 86 then
				if Entercount > 10 then 
					TalkAppendString(varMap,"#R本周此挑战副本次数已满")
				else
					TalkAppendString(varMap,format("本周第#R%d#W次挑战此副本，本次挑战副本需要花费现金#R#{_MONEY%d}。",Entercount ,CostGold))
				end
			end				
		end
		

	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700081_var_FileId, -1);
end

function x700081_SaveFubenIndex(varMap, varPlayer, nValue)
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3], nValue)
end

function x700081_GetFubenIndex(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3])
end

function x700081_SaveNextFubenIndex(varMap, varPlayer, nValue)
	SetPlayerGameData(varMap, varPlayer, MD_NEXT_FUBEN_INDEX[1], MD_NEXT_FUBEN_INDEX[2], MD_NEXT_FUBEN_INDEX[3], nValue)
end

function x700081_GetNextFubenIndex(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_NEXT_FUBEN_INDEX[1], MD_NEXT_FUBEN_INDEX[2], MD_NEXT_FUBEN_INDEX[3])
end

function x700081_SaveNextFubenFutuIndex(varMap, varPlayer, nValue)
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAISHUAHUANSHU[1], MD_FUBEN_FUTUTA_DAISHUAHUANSHU[2], MD_FUBEN_FUTUTA_DAISHUAHUANSHU[3], nValue)
end

function x700081_GetNextFubenFutuIndex(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DAISHUAHUANSHU[1], MD_FUBEN_FUTUTA_DAISHUAHUANSHU[2], MD_FUBEN_FUTUTA_DAISHUAHUANSHU[3])
end
function x700081_DaiShuaSaveNextFubenIndex(varMap, varPlayer, loop)
	if ( loop > LuaCallNoclosure(700121, "GetLoop", varMap, varPlayer) ) then
		return
	end
	
	for i, item in x700081_var_RegisterFuben do
		if ( item.varId == 700121 ) then
			if ( item.loopindex == loop ) then
				x700081_SaveNextFubenFutuIndex(varMap, varPlayer, i)
			end
		end
	end 
end

function x700081_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		x700081_var_FuBenTalkNpc[varPlayer] = -1
		for i, item in x700081_var_DeleteFuBenTalkNpc do
			if nil ~= varTalknpc and varTalknpc >=0 then
				local nMonstGuid = GetMonsterGUID(varMap, varTalknpc)
				if -1 ~= nMonstGuid and item.varNpcGuid == nMonstGuid then
					x700081_var_FuBenTalkNpc[varPlayer] = varTalknpc
					break
				end
			end
		end

    return 1
end





function x700081_GetFubenMode( varMap, varPlayer )
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	if x700081_IsFubenScene(varMap) == 0 then
		nFubenMode = GetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE)
	end
	return nFubenMode
end

function x700081_ProcAskEnterFuben(varMap, varPlayer, NpcID, selectLayer)


	if GetGameOpenById( 1103 ) <= 0 then
		return
	end

	-- 检测NPC是否有这个脚本
	if (0 == CheckNpcScript(varMap, varPlayer, NpcID, x700081_var_FileId)) then
		return
	end
	
		-- 根据所选剧场找到索引 【个人】精英剧场
	local varIndex1 = x700081_GetFubenIndex(varMap, varPlayer)
	--Msg2Player( varMap, varPlayer, "进入【个人】精英剧场 varIndex1:"..varIndex1, 8, 3 )	
	if ( x700081_var_RegisterFuben[varIndex1].varId == 701130 ) then
	    local jingyingIndex = GetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3])
	    if (jingyingIndex == 0) then
	        jingyingIndex = 1
	    end
	    
	    if (selectLayer > jingyingIndex) then ---玩家所选剧场大于最大可玩
	        Msg2Player( varMap, varPlayer, "您还不能玩当前剧场", 8, 3 )	
	        WriteLog(1, "x700081_ProcAskEnterFuben selectLayer > jingyingIndex ===selectLayer"..selectLayer)
	        return
	    end
	    
	    local varIndex2 = 0
	    for varI,item in x700081_var_RegisterFuben do
		      if item.varId == 701130 and item.loopindex == selectLayer then
			        varIndex2 = varI
			        break
		      end
	    end
	
	    if 0 ~= varIndex2 then     --【个人】精英剧场
	        WriteLog(1, "x700081_ProcAskEnterFuben GetGUID=="..GetGUID(varMap, varPlayer)..", varMap == "..varMap..", varPlayer == "..varPlayer.." varIndex:"..varIndex2.." selectLayer:"..selectLayer)
	       
	        ----检查此游戏世界是否开放英雄和炼狱难度的精英剧场
	        if ( selectLayer > 100) then
	            ---过滤world的服务器
	            local worldID = GetWorldIdEx()
	            local worldList = getn(x700081_var_OpenJingYingFuben_World_Tab)
	            local bFind = 1
	        
	            if (worldList < 1 ) then
	                bFind = 1
	            else
	                for k, v in x700081_var_OpenJingYingFuben_World_Tab do
	                    if (v == worldID) then
	                        bFind = 1
	                        break
	                    end
	                end
	            end          
	        
	            if 0 == bFind then
	                Msg2Player( varMap, varPlayer, "很抱歉，暂时未开放当前难度的精英剧场。", 8, 3 )
	           		return
	           end	
	      end
   --       if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 and selectLayer < 100 then
   --           Msg2Player( varMap, varPlayer, "很抱歉，排行榜最后一名不到70级无法开启普通难度精英剧场。", 8, 3 )
   --           return
    --      elseif GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 80 and selectLayer < 200 and selectLayer > 100 then
    --          Msg2Player( varMap, varPlayer, "很抱歉，排行榜最后一名不到80级无法开启英雄难度精英剧场。", 8, 3 )
    --          return
     --     elseif GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 90 and selectLayer < 300 and selectLayer > 200 then
     --         Msg2Player( varMap, varPlayer, "很抱歉，排行榜最后一名不到90级无法开启传说难度精英剧场。", 8, 3 )
     --         return
      --    end	   

	        ---检查进入次数
	        local varCount = x700081_GetEnterCount(varMap, varPlayer, varIndex2)
	        if (varCount >=  x700081_var_CountUntilList[varIndex2]) then
	            Msg2Player( varMap, varPlayer, "超过周可进入最大次数。", 8, 3 )	
	            return
	        end
	        
	        ---增加周进入计数
	        --x700081_SetEnterCount(varMap, varPlayer,varIndex2, 0)
	        
	        -------
	        x700081_SaveFubenIndex(varMap, varPlayer, varIndex2)
	        SetFubenData_Param(varMap, x700081_CSP_JINGYING_INDEX, selectLayer)
	        x700081_ProcAccept(varMap, varPlayer)   -- 执行ACCTPET
	        return
	    else
	        WriteLog(1, "x700081_ProcAskEnterFuben enter jingyingJuchang ERR===selectLayer"..selectLayer)
	        return
	    end
	end
	
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_FUTUTA_DATE1[1], MD_FUBEN_FUTUTA_DATE1[2], MD_FUBEN_FUTUTA_DATE1[3])
	
	--获取VIP等级
	local nItemID, nItemNum, vipLevel = GetPeerVipInfo(varMap, varPlayer, 1)
	local perCountXianZhi = 2
	local perFreeCountXianZhi = 1
	LuaCallNoclosure(700121, "ReturnFuTuTa", varMap, varPlayer)
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
	
	if (IsHaveSpecificImpact(varMap, varPlayer, 32702) ~= 0) then                                                                                                                                                                                                                                                           
		Msg2Player( varMap, varPlayer, "在冷却时间内不能使用相关功能", 8, 3 )		
		return                                                                                                                                                                                                                                                                       
	end
	
	if ( currentLoop > LuaCallNoclosure(700121, "GetLoop", varMap, varPlayer) ) then
		Msg2Player(varMap, varPlayer, "您已经达到最高层，请重置层数后再继续挑战", 8, 3)
		return
	end
	
	if ( selectLayer < currentLoop ) then
		return
	end
	
	if ( loopMax > LuaCallNoclosure(700121, "GetLoop", varMap, varPlayer) ) then
		return
	elseif ( loopMax == LuaCallNoclosure(700121, "GetLoop", varMap, varPlayer) ) then
		if ( selectLayer > loopMax ) then
			return
		end
	else
		if ( selectLayer > loopMax+1 ) then
			return
		end
	end
	
	-- 获取所选浮屠塔层数
	SetFubenData_Param(varMap, x700081_CSP_LOOPINDEX, selectLayer)
	x700081_DaiShuaSaveNextFubenIndex(varMap, varPlayer, selectLayer)

	SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, 1)
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE, 1)

	-- 根据层数找到索引
	local varIndex = 0
	for varI,item in x700081_var_RegisterFuben do
		if item.varId == 700121 and item.loopindex == selectLayer then
			varIndex = varI
		end
	end
	x700081_SaveFubenIndex(varMap, varPlayer, varIndex)
	--浮土塔活跃度
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,6)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,7)

	-- 执行ACCTPET
	x700081_ProcAccept(varMap, varPlayer)
end

function x700081_ProcAccept( varMap, varPlayer )

	local varIndex = x700081_GetFubenIndex(varMap, varPlayer)
	if varIndex == nil then
		return
	end
	
	WriteLog(1, format("x700081_ProcAccept --- GUID = %d, varIndex = %d", 
												GetGUID(varMap, varPlayer), varIndex ))
												
	if varIndex <= 0 then	
		return
	end
	
	if varIndex == 1500 then --index == 1500计为报名（跨服报名）			
		local nToggle = x700081_CheckKuafuToggle()		
		if nToggle == 1 then
			KuaFuSearch(varMap, varPlayer)
		end	
		return
	end
		
	local nFubenType = x700081_var_RegisterFuben[varIndex].fubentype
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE, nFubenType)
	
	SetPlayerGameData(varMap, varPlayer, MD_FUBEN_SANHUAN_LASTINDEX[1], MD_FUBEN_SANHUAN_LASTINDEX[2], MD_FUBEN_SANHUAN_LASTINDEX[3], varIndex)
	
	
	local nFubenMode = x700081_GetFubenMode(varMap, varPlayer )

	if 3 == nFubenType then
		local nCostmode = x700081_var_RegisterFuben[varIndex].costmode
		if nil == nCostmode then
			nCostmode = 0
		end

		x700081_ProcRequestEnterGroupFuben(varMap, varPlayer, varIndex, nFubenType, nCostmode, 0)

	elseif x700081_var_CountUntilList[varIndex]<=0 then   

		
		x700081_ProcRequestEnterFuben(varMap, varPlayer, nFubenMode,varIndex);
		
	else	
		
		x700081_ProcRequestEnterFuben(varMap, varPlayer, nFubenMode,varIndex);	
		
	end
	
end

function x700081_ProcRequestEnterFuben(varMap, varPlayer, varMode, varIndex, varScriptFileId )

	if varMode==nil or varIndex==nil then
		return
	end
	
	--如果本环是ROOM，可以进入下一环，那么就是ROOM的三番
	local nIsFubenScene = x700081_IsFubenScene(varMap)
	if nIsFubenScene == 1 then --只有副本场景才设置ROOM三番
		  local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)		
			if nIsRoom ~= 1 then
		  	SetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN , 0)
		  	--WriteLog(1, "x700081_MakeFuben_Team room0" )
		  else
		  	SetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN , 1)
		  	--WriteLog(1, "x700081_MakeFuben_Team room1" )
		  end	
	end

	if(varIndex == 0) then
		varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId)
	end

	x700081_SaveFubenIndex(varMap, varPlayer, varIndex)
	local varRet = 0

	local nType = x700081_GetFubenType(varIndex)
	varRet = x700081_CheckRequest(varMap, varPlayer,varIndex, varMode, nType)
	
	if varRet<=0 then
		return
	end

	varRet = x700081_CheckAllMemberItemRequest(varMap, varPlayer, varMode, varIndex)
	
  if varRet<=0 then
		return
	end

	
	varRet = x700081_CheckAllMemberNextLoopIndex(varMap, varPlayer, varIndex)
	if varRet <= 0 then
		WriteLog(1, 
			format("x700081_ProcRequestEnterFuben --- ERROR !!! x700081_CheckAllMemberNextLoopIndex, GUID = %X, varIndex = %d, expectIndex = %d",
							GetGUID(varMap, varPlayer), varIndex, x700081_GetNextFubenIndex(varMap, varPlayer)))
		return
	end

	if varRet > 0 then
		x700081_ProcApproveRequestEnterFuben(varMap, varPlayer, varRet, varMode, varIndex, varScriptFileId)
	end
end

function x700081_CheckOwnerItemRequest(varMap, varPlayer, varMode, varIndex)		
 		
		local playerName = GetName(varMap, varPlayer)
	 	if varMode == 1 then
	 		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
	 			return 1
	 		end
			if x700081_var_Item_XJ[varIndex].varItem<=0 then
				return 1
			end
			local Num = GetItemCount( varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem )
	
			if Num<x700081_var_Item_XJ[varIndex].varCount then
				x700081_ShowTips(varMap, varPlayer, format("你身上@itemid_%d不足%d个,不能进入此副本",x700081_var_Item_XJ[varIndex].varItem,x700081_var_Item_XJ[varIndex].varCount))
				return 0
			end
		elseif varMode == 2 then
			if x700081_var_Item_ZHOUXJ[varIndex].varItem<=0 then
				return 1
			end
			local Num = GetItemCount( varMap, varPlayer, x700081_var_Item_ZHOUXJ[varIndex].varItem )
	
			if Num<x700081_var_Item_ZHOUXJ[varIndex].varCount then
				x700081_ShowTips(varMap, varPlayer, format("你身上@itemid_%d不足%d个,不能进入此副本",x700081_var_Item_ZHOUXJ[varIndex].varItem,x700081_var_Item_ZHOUXJ[varIndex].varCount))
				return 0
			end
		end
		if x700081_var_RegisterFuben[varIndex].varId == 700193 and nFubenType == 0 then -- 家园矿山处理做一个特殊处理
			if x700081_var_Item_XJ[varIndex].varItem > 0 then
				local num = GetItemCount( varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem )
				if num<x700081_var_Item_XJ[varIndex].varCount then
					x700081_ShowTips(varMap, varPlayer, format("你身上@itemid_%d不足%d个",x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount))
					return 1
				end
			end
		end
	local fubenScriptID = x700081_var_RegisterFuben[varIndex].varId
	if fubenScriptID == 700500 then
		--天关
		if GetLevel(varMap, varPlayer) < 85 then
			x700081_ShowTips(varMap, varPlayer, format("等级不足%d", 85))
			return 0
		end
	elseif fubenScriptID == 700501 then
		--杳无音讯的村庄
		if GetLevel(varMap, varPlayer) < 90 then
			x700081_ShowTips(varMap, varPlayer, format("等级不足%d", 90))
			return 0
		end
	elseif fubenScriptID == 700502 then
		--污染边塞
		if GetLevel(varMap, varPlayer) < 95 then
			x700081_ShowTips(varMap, varPlayer, format("等级不足%d", 95))
			return 0
		end
	end
	if (fubenScriptID == 700136 or fubenScriptID == 700500 or fubenScriptID == 700501 or fubenScriptID == 700502) and nFubenType == 0 then -- 月宫处理做一个特殊处理
			if x700081_var_Item_XJ[varIndex].varItem > 0 then
				local num = GetItemCount( varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem )
				if num<x700081_var_Item_XJ[varIndex].varCount then
					x700081_ShowTips(varMap, varPlayer, format("你身上@itemid_%d不足%d个",x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount))
					return 1
				end
			end
		end
		return 1
end

function x700081_CheckAllMemberItemRequest(varMap, varPlayer, varMode, varIndex)
	if GetGameOpenById(1022)<=0 then
		
		return 0
	end
	local ErrorCode = x700081_IsPlayerErrorState( varMap,varPlayer )
	if ErrorCode~=0 then
		return 0
	end
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
		if nFubenType == 2 then
			local teamnum = GetNearTeamCount(varMap, varPlayer)
			if x700081_var_Item_XJ[varIndex].varItem>0 then
				for varI = 0, teamnum - 1 do
					local memberId = GetNearTeamMember(varMap, varPlayer, varI);
						local IsHaveGold = GetMoney(varMap, memberId,2)
						local playerName = GetName(varMap, memberId)			
						if IsHaveGold < x700081_GetCost(varMap, memberId, varIndex ) then
							x700081_ShowTips(varMap, varPlayer, format(playerName.."的现金不足#{_MONEY%d},不能进入此副本",x700081_GetCost(varMap, memberId, varIndex)))
							return 0
						end
				end
				if GetMoney(varMap, varPlayer,2) < x700081_GetCost(varMap, varPlayer, varIndex) then
					x700081_ShowTips(varMap, varPlayer, format("您的现金不足#{_MONEY%d},不能进入此副本",x700081_GetCost(varMap, varPlayer, varIndex)))
					return 0
				end	
			end		
		end
		
	if x700081_var_RegisterFuben[varIndex].varId == 700193 and nFubenType == 0 then -- 家园矿山处理做一个特殊处理
		if x700081_var_Item_XJ[varIndex].varItem > 0 then
			local num = GetItemCount( varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem )
			if num<x700081_var_Item_XJ[varIndex].varCount then
				x700081_ShowTips(varMap, varPlayer, format("身上@itemid_%d不足%d个",x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount))
				return 0
			end
		end
	end
	local fubenScriptID = x700081_var_RegisterFuben[varIndex].varId

	if fubenScriptID == 700500 then
		--天关
		if GetLevel(varMap, varPlayer) < 85 then
			x700081_ShowTips(varMap, varPlayer, format("等级不足%d", 85))
			return 0
		end
	elseif fubenScriptID == 700501 then
		--杳无音讯的村庄
		if GetLevel(varMap, varPlayer) < 90 then
			x700081_ShowTips(varMap, varPlayer, format("等级不足%d", 90))
			return 0
		end
	elseif fubenScriptID == 700502 then
		--污染边塞
		if GetLevel(varMap, varPlayer) < 95 then
			x700081_ShowTips(varMap, varPlayer, format("等级不足%d", 95))
			return 0
		end
	end

	if (fubenScriptID == 700136 or fubenScriptID == 700500 or fubenScriptID == 700501 or fubenScriptID == 700502) and nFubenType == 0 then -- 月宫处理做一个特殊处理
		if x700081_var_Item_XJ[varIndex].varItem > 0 then
			local num = GetItemCount( varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem )
			if num<x700081_var_Item_XJ[varIndex].varCount then
				x700081_ShowTips(varMap, varPlayer, format("身上@itemid_%d不足%d个",x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount))
				return 0
			end
		end
	end
	local teamnum = 0
	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan == 1 then
		local nGUID = ObjId2Guid(varMap, varPlayer)
		local bFind,nGIndex = x700081_FindFubenPlayer(varMap,nGUID)
		if bFind == nil or bFind == 0 then
			return 0
		end
		teamnum = x700081_GetCorpsCount(varMap, varPlayer, nGIndex)--军团 
	else
		teamnum = GetNearTeamCount(varMap, varPlayer)
	end
		
	if varMode==1 then
		for varI = 0, teamnum - 1 do
			local memberId = GetNearTeamMember(varMap, varPlayer, varI);
			if x700081_var_RegisterFuben[varIndex].varId ~= 700121 then
				if x700081_var_Item_XJ[varIndex].varItem>0 then
					local Num = GetItemCount( varMap, memberId, x700081_var_Item_XJ[varIndex].varItem )
					local playerName = GetName(varMap, memberId)
	
					if Num<x700081_var_Item_XJ[varIndex].varCount then
						x700081_ShowTips(varMap, varPlayer, format(playerName.."身上@itemid_%d不足%d个",x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount))
						return 0
					end
				end
			end
		end
	elseif varMode==2 then	
		for varI = 0, teamnum - 1 do
			local memberId = GetNearTeamMember(varMap, varPlayer, varI);
			if x700081_var_Item_ZHOUXJ[varIndex].varItem>0 then
				local Num = GetItemCount( varMap, memberId, x700081_var_Item_ZHOUXJ[varIndex].varItem )
				local playerName = GetName(varMap, memberId)

				if Num<x700081_var_Item_ZHOUXJ[varIndex].varCount then
					x700081_ShowTips(varMap, varPlayer, format(playerName.."身上@itemid_%d不足%d个",x700081_var_Item_ZHOUXJ[varIndex].varItem,x700081_var_Item_ZHOUXJ[varIndex].varCount))
					return 0
			end
			end

		end
	end

	return 1
end

function x700081_CheckAllMemberNextLoopIndex(varMap, varPlayer, varIndex)
	
	if x700081_IsFirstFuben(varIndex) == 1 then	--第一环,不检测玩家的下环索引
		return 1
	end
	
	local teamnum = 0
	
	local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)
	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	x700081_WriteDebugLog("x700081_CheckAllMemberNextLoopIndex", " nIsRoom", nIsRoom, "nIsRoom3Fan", nIsRoom3Fan)

	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan == 1 then
		local nGUID = ObjId2Guid(varMap, varPlayer)
		local bFind,nGIndex = x700081_FindFubenPlayer(varMap,nGUID)
		if bFind == nil or bFind == 0 then
			return 0
		end
		teamnum =  x700081_GetCorpsCount(varMap, varPlayer, nGIndex)--军团检测		
	else		
		teamnum =  GetNearTeamCount(varMap, varPlayer,varIndex, varMode, nType)
	end	
	x700081_WriteDebugLog("x700081_CheckAllMemberNextLoopIndex", " teamnum", teamnum, "varMap", varMap, "varIndex", varIndex)
	for varI = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(varMap, varPlayer, varI);
		if ( x700081_var_RegisterFuben[varIndex].varId == 700121 ) then
			if x700081_GetNextFubenFutuIndex(varMap, varPlayer) ~= varIndex then
				return 0
			end
		else
			if x700081_GetNextFubenIndex(varMap, varPlayer) ~= varIndex then
				return 0
			end
		end
	end
	
	return 1
end


function x700081_ProcXianJinRequestOk(varMap, varPlayer, varIndex, varMode)  
	if varMode == 1 then
		if ( x700081_var_RegisterFuben[varIndex].varId ~= 700121 ) then
			if x700081_var_Item_XJ[varIndex].varCount>0 then
				if DelItem(varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount) ~= 1 then return 0 end
					--三番活跃度添加
				LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 1,0)
				LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,8)
			end
		end
	elseif varMode == 2 then
		if x700081_var_Item_ZHOUXJ[varIndex].varCount>0 then
			if DelItem(varMap, varPlayer, x700081_var_Item_ZHOUXJ[varIndex].varItem, x700081_var_Item_ZHOUXJ[varIndex].varCount) ~= 1 then return 0 end
		end
	end
	if x700081_var_RegisterFuben[varIndex].varId == 700193 then -- 家园矿山处理做一个特殊处理
		if x700081_var_Item_XJ[varIndex].varCount > 0 then
			if DelItem(varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount) ~= 1 then return 0 end
		end
	end	
	local fubenScriptID = x700081_var_RegisterFuben[varIndex].varId
	if fubenScriptID == 700136 or fubenScriptID == 700500 or fubenScriptID == 700501 or fubenScriptID == 700502 then -- 月宫处理做一个特殊处理
		if x700081_var_Item_XJ[varIndex].varCount > 0 then
			if DelItem(varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount) ~= 1 then
				return 0
			end
		end
	end		
end

function x700081_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
	TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700081_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700081_ProcFubenSceneCreated( varMap, varScriptFileId, varIndex )
	if ( (x700081_var_RegisterFuben[varIndex].varId == 700121 or x700081_var_RegisterFuben[varIndex].varId == 701130 ) and x700081_var_CreateFubenFlag[varMap] == 1) then
		return
	end
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)

	if nFubenMode==1 and x700081_var_RegisterFuben[varIndex].varId ~= 700121 and x700081_var_Item_XJ[varIndex].varCount > 0 then
	  x700081_ShowTipsToAll(varMap, format("你上交了%d个@itemid_%d",x700081_var_Item_XJ[varIndex].varCount,x700081_var_Item_XJ[varIndex].varItem))
	elseif nFubenMode==2 and x700081_var_Item_ZHOUXJ[varIndex].varCount > 0 then
	  	x700081_ShowTipsToAll(varMap, format("你上交了%d个@itemid_%d",x700081_var_Item_ZHOUXJ[varIndex].varCount,x700081_var_Item_ZHOUXJ[varIndex].varItem))
	end

	LuaCallNoclosure(varScriptFileId,"ProcFubenSceneCreated", varMap)
end

function x700081_CheckRequest(varMap, varPlayer, varIndex, varMode, nType)
	
	--检测当前服务器是否开放
	local varRet = x700081_CheckFubenToggle(nType)
	if varRet<=0 then
		return 0;
	end

	varRet = x700081_CheckCommonCondition(varMap, varPlayer,varIndex, varMode)

	if varRet<=0 then
		return 0;
	end

	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan == 1 then
		varRet =  x700081_CheckCorpsCondition(varMap, varPlayer,varIndex, varMode, nType)	--军团检测
	else
		varRet =  x700081_CheckTeamCondition(varMap, varPlayer,varIndex, varMode, nType)
	end
	
	if varRet<=0 then
		return 0;
	end

	varRet = x700081_CheckLawlessEnter(varMap, varPlayer, varIndex, varMode, nType)
	if varRet<=0 then
		return 0;
	end
	return 1
end

function x700081_CheckCommonCondition(varMap, varPlayer,varIndex, varMode)
	if varIndex == 37 then
		if IsNewServer()==1 then
	--		if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 80 then
	--				Msg2Player(varMap,varPlayer,"很抱歉，轮回台（天赋）暂未开启！",8,3)
       --				return 0
    	--	end
    	end
	end	
	local varRet = x700081_CheckCommonCondition_Day(varMap, varPlayer,varIndex)  

	if varRet <=0 then
		return 0;
	end
	
	local varRet = x700081_CheckCommonCondition_Time(varMap, varPlayer,varIndex)  

	if varRet <=0 then
		return 0;
	end
	
	local varRet = x700081_CheckCommonCondition_Level(varMap, varPlayer,varIndex)  

	if varRet <=0 then
		return 0;
	end
	
	
	local varRet = x700081_CheckCommonCondition_Times(varMap, varPlayer,varIndex, varMode)  
	if varRet <=0 then
		return 0;
	end
	
	varRet = x700081_CheckTeam(varMap, varPlayer,varIndex, varMode)
	if varRet <=0 then
		return 0;
	end

	return 1;

end

function x700081_CheckTeam(varMap, varPlayer, varIndex, varMode)
	local teamid = GetTeamId(varMap, varPlayer)
	if (x700081_var_RegisterFuben[varIndex].varId == 700193 and teamid >= 0) then
		Msg2Player(varMap,varPlayer,"很抱歉，组队状态下不能进入该副本！",8,3)
		return 0
	end
	
	return 1
end

function x700081_CheckCommonCondition_Time(varMap, varPlayer,varIndex)
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*60+minute
	
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		if nowtime >= 0*60+0 and nowtime <= 24*60+0 then
			return 1;
		end
	else
		for varI, item in x700081_var_EnterTimeList[varIndex] do
			if nowtime >= item.min and nowtime <= item.max then
				return 1;	
			end
		end
	end
	StartTalkTask(varMap);
		TalkAppendString(varMap, x700081_str_NotTime);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	return 0;
end

function x700081_CheckCommonCondition_Day(varMap, varPlayer,varIndex)

	local weekDay = GetWeek()
	for varI, item in x700081_var_EnterDayList[varIndex] do
		if weekDay==item then
			
			
			return 1;
			
		end
	end
	StartTalkTask(varMap);
		TalkAppendString(varMap, x700081_str_NotDay);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	return 0;
end

function x700081_CheckCommonCondition_Level(varMap, varPlayer,varIndex)
	
	local varLevel = GetLevel( varMap,varPlayer )

	local nLevelMin = x700081_var_LevelRangeList[varIndex][1]
	local nLevelMax = x700081_var_LevelRangeList[varIndex][2]
    if varLevel < nLevelMin then
        StartTalkTask(varMap);
			TalkAppendString(varMap, format(x700081_str_UnderLevel,nLevelMin));
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
    end

	if varLevel > nLevelMax then
        StartTalkTask(varMap);
			TalkAppendString(varMap, format(x700081_str_TooHighLevel,nLevelMax));
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
    end
	
	return 1;
end



function x700081_CheckCommonCondition_Times(varMap, varPlayer,varIndex, varMode)
	if  x700081_GetFubenType(varIndex) == 2 then
		return 1
	end
	if x700081_var_CountUntilList[varIndex] >0 then
		
		local enterCount = x700081_GetEnterCount(varMap, varPlayer,varIndex)
		WriteLog(1, format(" x700081_CheckCommonCondition_Times --------- varIndex = %d, enterCount = %d, Count = %d", 
										varIndex, enterCount, x700081_var_CountUntilList[varIndex]))
		
		local maxNum = x700081_var_CountUntilList[varIndex]
		
		--藏宝洞特殊处理
		if varIndex == 78 then 
			local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 5)
			maxNum = maxNum + peerVipValue
		end
		
		if enterCount>= maxNum  and x700081_var_RegisterFuben[varIndex].varId ~= 701130 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, x700081_str_TimesOver);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0 
		end
	end
	return 1;
end

function x700081_CheckSelfCondition(varMap, varPlayer,varIndex, varMode, nType)
	local varRet, tips;
	local nearteamnum = 1
	local bPassed = 1
		varRet, tips = x700081_CheckAllMemberMinLevel(varMap, varPlayer, nearteamnum,varIndex);
		if varRet <= 0 then
			varStr = tips;
			bPassed = 0
		end

		varRet, tips = x700081_CheckAllMemberMaxLevel(varMap, varPlayer, nearteamnum,varIndex);
		if varRet <= 0 then
			varStr = tips;
			bPassed = 0
		end

		varRet, tips = x700081_CheckAllMemberEnterCount(varMap, varPlayer, nearteamnum, varMode ,varIndex);
		if varRet == 0 then
			varStr = tips;
			bPassed = 0
		end

		varRet, tips = x700081_CheckAllMemberErrorState(varMap, varPlayer, nearteamnum)
		if varRet <= 0 then
			varStr = tips;
			bPassed = 0
		end

		varRet, tips = x700081_CountryBattleLite(varMap, varPlayer)

		if varRet<=0 then
			varStr = tips;
			bPassed = 0
		end

	if bPassed == 1 then
		return 1;
	else
		if varStr ~= "" then
			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end


	return 1;
end

---------------------------------------------
--三番?团条件检测
---------------------------------------------
function x700081_CheckCorpsCondition(varMap, varPlayer,varIndex, varMode, nType)

	local nGUID = ObjId2Guid(varMap, varPlayer)
	local bFind,nGIndex = x700081_FindFubenPlayer(varMap,nGUID)
	if bFind == nil or bFind == 0 then
			return 0
	end

	local nearteamnum = x700081_GetCorpsCount(varMap, varPlayer, nGIndex);
	local varStr = ""
	local bPassed = 0
	
	local nGUID = ObjId2Guid(varMap, varPlayer);
	if nGUID == -1 then
		return 0
	end
	
	local bFind = x700081_FindFubenPlayer(varMap,nGUID)
	if bFind == nil or bFind == 0 then
		return 0
	end

	--试炼检查等级
	if nType == 1  and nearteamnum < 0 then		
		--不进
	else
			--如果范围传送，要求检测所在队员在范围内
			if x700081_var_SearchCorpsScene == 0 then
					if x700081_CheckAllCorpsMemberNear(varMap, varPlayer) == 0 then
						varStr = "需要所有的队友在附近！"
						bPassed = 0
					end
			end
		
		if nearteamnum < x700081_var_LimitMembersList[varIndex] then
			varStr	= format("附近队友不足%d人！", x700081_var_LimitMembersList[varIndex])
			bPassed = 0
		else		
			local varRet, tips;	
			varRet, tips = x700081_CheckAllMemberMinLevel(varMap, varPlayer, nearteamnum,varIndex);
			if varRet <= 0 then
				varStr = tips;
				bPassed = 0
			end
	
			varRet, tips = x700081_CheckAllMemberMaxLevel(varMap, varPlayer, nearteamnum,varIndex);
			if varRet <= 0 then
				varStr = tips;
				bPassed = 0
			end
	
			varRet, tips = x700081_CheckAllMemberEnterCount(varMap, varPlayer, nearteamnum, varMode ,varIndex);
			if varRet == 0 then
				varStr = tips;
				bPassed = 0
			end
 
			varRet, tips = x700081_CheckAllMemberErrorState(varMap, varPlayer, nearteamnum)
			if varRet <= 0 then
				varStr = tips;
				bPassed = 0
			end
	
			varRet, tips = x700081_CountryBattleLite(varMap, varPlayer)	
			if varRet<=0 then
				varStr = tips;
				bPassed = 0
			end			
		end	
	end

	--
	if bPassed == 1 then
		return 1;
	else
		if varStr ~= "" then
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end
		
	return 1	
end
--------------------------------------------------
--军团玩家是否都在范围
--------------------------------------------------
function x700081_CheckAllCorpsMemberNear(varMap, varPlayer)
		local nGUID = ObjId2Guid(varMap, varPlayer)
		local bFind,nGIndex = x700081_FindFubenPlayer(varMap,nGUID)
		if bFind == nil or bFind == 0 then
			return
		end

    local nNearCount  = x700081_GetCorpsCount( varMap,varPlayer, nGIndex)
    local nTotalCount = FUBEN_GROUP_TEAM_PLAYER_COUNT

    if nNearCount ~= nTotalCount then
        return 0
    end
    return 1
end

function x700081_CheckTeamCondition(varMap, varPlayer, varIndex, varMode, nType)
	
	local teamid = GetTeamId(varMap, varPlayer);
	local teamnum = GetTeamSize(varMap, varPlayer);
	local nearteamnum = GetNearTeamCount(varMap, varPlayer);

	local varStr = "";
	local bPassed = 1;
	
	if nType == 1 and nearteamnum < 0 then --为什么会有nearteamnum <0
		local varRet, tips;
	
			varRet, tips = x700081_CheckAllMemberMinLevel(varMap, varPlayer, nearteamnum,varIndex);
			if varRet <= 0 then
				varStr = tips;
				bPassed = 0
			end
	
			varRet, tips = x700081_CheckAllMemberMaxLevel(varMap, varPlayer, nearteamnum,varIndex);
			if varRet <= 0 then
				varStr = tips;
				bPassed = 0
			end
	
			varRet, tips = x700081_CheckAllMemberEnterCount(varMap, varPlayer, nearteamnum, varMode ,varIndex);
			if varRet == 0 then
				varStr = tips;
				bPassed = 0
			end
	
			 
			varRet, tips = x700081_CheckAllMemberErrorState(varMap, varPlayer, nearteamnum)
			if varRet <= 0 then
				varStr = tips;
				bPassed = 0
			end
	
			varRet, tips = x700081_CountryBattleLite(varMap, varPlayer)
	
			if varRet<=0 then
				varStr = tips;
				bPassed = 0
			end
	else
		if x700081_var_RegisterFuben[varIndex].varId ~= 700121 and x700081_var_RegisterFuben[varIndex].varId ~= 701130 
				and x700081_var_RegisterFuben[varIndex].varId ~= 700193 then	-- 700193 为矿山秘洞副本,也只能单人进入
			if teamid < 0 then
				varStr	= "您还没有队伍，请先建立队伍！"
				bPassed = 0
			elseif IsTeamLeader(varMap, varPlayer) <= 0 then
				varStr	= "你不是队长！"
				bPassed = 0
			elseif x700081_CheckAllMemberNear( varMap,varPlayer) <= 0 then
				varStr	= "需要所有的队友在附近！"
				bPassed = 0
			elseif teamnum < x700081_var_LimitMembersList[varIndex] then
				varStr	= format("你的队伍不足%d人！", x700081_var_LimitMembersList[varIndex])
				bPassed = 0
			elseif nearteamnum < x700081_var_LimitMembersList[varIndex] then
				varStr	= format("附近队友不足%d人！", x700081_var_LimitMembersList[varIndex])
				bPassed = 0
			else
				local varRet, tips;
		
				varRet, tips = x700081_CheckAllMemberMinLevel(varMap, varPlayer, nearteamnum,varIndex);
				if varRet <= 0 then
					varStr = tips;
					bPassed = 0
				end
		
				varRet, tips = x700081_CheckAllMemberMaxLevel(varMap, varPlayer, nearteamnum,varIndex);
				if varRet <= 0 then
					varStr = tips;
					bPassed = 0
				end
		
				varRet, tips = x700081_CheckAllMemberEnterCount(varMap, varPlayer, nearteamnum, varMode ,varIndex);
				if varRet == 0 then
					varStr = tips;
					bPassed = 0
				end

				varRet, tips = x700081_CheckAllMemberErrorState(varMap, varPlayer, nearteamnum)
				if varRet <= 0 then
					varStr = tips;
					bPassed = 0
				end
		
				varRet, tips = x700081_CountryBattleLite(varMap, varPlayer)
		
				if varRet<=0 then
					varStr = tips;
					bPassed = 0
				end
			end
		else
			if teamid >= 0 then
				if ( teamnum > 1 ) then
					if (x700081_var_RegisterFuben[varIndex].varId == 700193) then
						varStr	= "组队状态下无法进入矿山秘洞！"
						bPassed = 0
					elseif (x700081_var_RegisterFuben[varIndex].varId == 700121) then
						varStr	= "浮屠塔只支援单人挑战模式！"
						bPassed = 0
					elseif (x700081_var_RegisterFuben[varIndex].varId == 701130) then
						 varStr	= "精英剧场只支援单人挑战模式！"
						 bPassed = 0
					end
				end
				local varRet, tips;
	
				varRet, tips = x700081_CheckAllMemberMinLevel(varMap, varPlayer, nearteamnum,varIndex);
				if varRet <= 0 then
					varStr = tips;
					bPassed = 0
				end
	
				varRet, tips = x700081_CheckAllMemberMaxLevel(varMap, varPlayer, nearteamnum,varIndex);
				if varRet <= 0 then
					varStr = tips;
					bPassed = 0
				end
	
				varRet, tips = x700081_CheckAllMemberEnterCount(varMap, varPlayer, nearteamnum, varMode ,varIndex);
				if varRet == 0 then
					varStr = tips;
					bPassed = 0
				end

				varRet, tips = x700081_CheckAllMemberErrorState(varMap, varPlayer, nearteamnum)
				if varRet <= 0 then
					varStr = tips;
					bPassed = 0
				end
	
				varRet, tips = x700081_CountryBattleLite(varMap, varPlayer)
	
				if varRet<=0 then
					varStr = tips;
					bPassed = 0
				end
			end			
		end
	end
	if bPassed == 1 then
		return 1;
	else
		if varStr ~= "" then
			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end


	return 1;
end

function x700081_CountryBattleLite(varMap, varPlayer)
	local teamid = GetTeamId(varMap, varPlayer);
	local teamnum = GetTeamSize(varMap, varPlayer);
	local nearteamnum = GetNearTeamCount(varMap, varPlayer);
	local tips=""
	if teamnum <= 0 then
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteFubenTrans",varMap,varPlayer) == 0 then 
			
			local varName = GetName(varMap, varPlayer)
	
			tips = varName.."正在进行【国家】屠城战,不能进入副本！"
			return 0, tips
		end
	else
		for varI = 0, teamnum - 1 do
			local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	
			if memberId >= 0 then 
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteFubenTrans",varMap,memberId) == 0 then 
				
				local varName = GetName(varMap, memberId)
	
				tips = varName.."正在进行【国家】屠城战,不能进入副本！"
				return 0, tips
				end
			end
		end
	end
	
	return 1,tips
end


function x700081_ProcApproveRequestEnterFuben(varMap, varPlayer, nEnterType, varMode, varIndex, varScriptFileId)
	
	WriteLog(1, format("x700081_ProcApproveRequestEnterFuben --- GUID = %d, varIndex = %d, varMode = %d", 
						GetGUID(varMap, varPlayer), varIndex, varMode))
	
	LuaCallNoclosure(700095,"CheckChanchuApproveRequest",varMap,varPlayer, varMode, varScriptFileId)
	
	local memberNum = 0
	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan == 1 then
		local nGUID = ObjId2Guid(varMap, varPlayer)
		local bFind,nGIndex = x700081_FindFubenPlayer(varMap,nGUID)
		if bFind == nil or bFind == 0 then
			return
		end
		memberNum = x700081_GetCorpsCount(varMap, varPlayer, nGIndex)
	else
	 	memberNum = GetNearTeamCount(varMap, varPlayer)
	end
	
	x700081_MakeFuben_Team(varMap, varPlayer, memberNum,varMode, varIndex);
end

function x700081_MakeFuben_Team(varMap, varPlayer, memberNum, varMode, varIndex)
	x700081_WriteDebugLog("x700081_MakeFuben_Team", "memberNum" , memberNum , "varIndex", varIndex)

	if memberNum <= 0 then
		local ErrorCode = x700081_IsPlayerErrorState( varMap, varPlayer )
	    if ErrorCode == 0 then
	       SetPlayerMutexState( varMap, varPlayer , PLAYER_STATE_READYFUBEN ,1)
	    end
	else
		for varI = 0, memberNum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local ErrorCode = x700081_IsPlayerErrorState( varMap, memberId )
	        if ErrorCode == 0 then
	            
	           SetPlayerMutexState( varMap, memberId , PLAYER_STATE_READYFUBEN ,1)
	        end
	    end
	end
	
	local leaderguid = ObjId2Guid(varMap, varPlayer);
  local varX,z = GetWorldPos(varMap,varPlayer)

	x700081_WriteDebugLog("x700081_MakeFuben_Team", "leaderguid" , leaderguid)

	local sceneParamList ={}
	for varI=0, 255 do
		local nValue = GetFubenData_Param(varMap, varI);
		sceneParamList[varI+1] = nValue;
	end
	
	if GetSceneType(varMap)==1 then
		local nTick = GetFubenData_Param(varMap, x700081_CSP_LAST_TICKOUNT )
		local nTickCount = GetFubenData_Param(varMap, x700081_CSP_TICKCOUNT )
		local nAdd = GetFubenData_Param(varMap, x700081_CSP_TICKCOUNT_ADD )
		local nSub = GetFubenData_Param(varMap, x700081_CSP_TICKCOUNT_SUB )
		SetFubenData_Param(varMap, x700081_CSP_LAST_TICKOUNT ,nTick+nTickCount-nAdd+nSub )

		local bPlayerDead = GetFubenData_Param(varMap,x700081_CSP_PLAYER_DEAD)

		SetFubenData_Param(varMap,x700081_CSP_PLAYER_DEAD, bPlayerDead)
	else
		SetFubenData_Param(varMap, x700081_CSP_LAST_TICKOUNT ,0 )
		SetFubenData_Param(varMap,x700081_CSP_PLAYER_DEAD, 0)
	end
	
	x700081_CheckFubenTopList(varMap)

	SetSceneLoad_Map(varMap, x700081_var_SceneMapNavPathList[varIndex]);			   
	SetFubenData_TeamLeader(varMap, leaderguid);   --无论是否Room都要设置，不然三番下次进来ProcFubenReady的时候无法拉人
	
	local nType = x700081_GetFubenType(varIndex)
	if nType == 1 then
		SetFubenData_NoUserCloseTime(varMap, x700081_var_NoUserTimeTry * 1000);            
	else
		SetFubenData_NoUserCloseTime(varMap, x700081_var_NoUserTime * 1000);            
	end
	local nTickTime = x700081_GetTickTimeByScriptId(varMap, x700081_var_RegisterFuben[varIndex].varId)
	SetFubenData_Timer(varMap, nTickTime * 1000);                        
	SetFubenData_Param(varMap, x700081_CSP_TICKTIME, nTickTime);

	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		SetFubenData_Param(varMap, x700081_CSP_FUBENTYPE, FUBEN_FUTUTA);	
	else
		SetFubenData_Param(varMap, x700081_CSP_FUBENTYPE, x700081_var_FubenTypeList[varIndex]);
	end
	SetFubenData_Param(varMap, x700081_CSP_SCRIPTID, x700081_var_RegisterFuben[varIndex].varId)	
	SetFubenData_Param(varMap, x700081_CSP_TICKCOUNT, 0);							
	SetFubenData_Param(varMap, x700081_CSP_BACKSCENEID, -1);	
	SetFubenData_Param(varMap, x700081_CSP_ISCLOSING, 0);							
	SetFubenData_Param(varMap, x700081_CSP_LEAVECOUNTDOWN, 0);						
  SetFubenData_Param(varMap, x700081_CSP_TEAMID, GetTeamId(varMap, varPlayer));
  local nHoldTime
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		nHoldTime = 540
	else
		nHoldTime = x700081_var_LimitTotalHoldTimeList[varIndex]
	end
	SetFubenData_Param(varMap, x700081_CSP_HOLDTIME, nHoldTime);

	local nCloseTick =  x700081_GetCloseTickByScriptId(varMap, x700081_var_RegisterFuben[varIndex].varId)
	SetFubenData_Param(varMap, x700081_CSP_CLOSETICK, nCloseTick);
	
	
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE ,nType )
	
	
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE ,varMode )
	
	
	for varI=x700081_CSP_GUID_START, 254-1 do
		SetFubenData_Param(varMap, varI ,0 )
	end
	
	if x700081_var_RegisterFuben[varIndex].kind ~= nil then   
		SetFubenData_Param(varMap, x700081_CSP_FUBEN_KIND ,x700081_var_RegisterFuben[varIndex].kind )
	end
	

	if memberNum <= 0 then
		local guid = GetPlayerGUID( varMap,varPlayer )
		guid = format("%u", guid)
	    local paramidx = x700081_CSP_GUID_START
	
	    SetFubenData_Param(varMap, paramidx ,guid )
	    
	    --根据四种有问题的试炼副本索引范围进行 MD 设置
	    if varIndex >= 5 and varIndex <= 30 then
	    	if x700081_var_TryLoopMDIndexTable[varIndex] ~= nil then
				SetPlayerGameData(varMap, varPlayer, 255, x700081_var_TryLoopMDIndexTable[varIndex], 1, 1)
			end
	    end
	else
	    for varI= 0 ,memberNum - 1  do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local guid = GetPlayerGUID( varMap,memberId )
	        guid = format("%u", guid)
	        local paramidx = x700081_CSP_GUID_START + varI
	
	        SetFubenData_Param(varMap, paramidx ,guid )
	        
		    if varIndex >= 5 and varIndex <= 30 then
		    	if x700081_var_TryLoopMDIndexTable[varIndex] ~= nil then
					SetPlayerGameData(varMap, memberId, 255, x700081_var_TryLoopMDIndexTable[varIndex], 1, 1)
				end
		    end
	    end
	end

	x700081_InitAutoLevel_Team(varMap,varPlayer, varIndex, memberNum,2)


	local nRoomType = 0
	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan ~= 1 then
		nRoomType = 0 --正常副本
	else
		nRoomType = 1 --本地ROOM
	end	
	local varSelectMap = CreateFubenLocal(varMap, memberNum, nRoomType); --创建本地副本
	if varSelectMap < 0 then
		StartTalkTask(varMap)
    TalkAppendString( varMap, "全服关卡已达上限,下环副本在排队创建中,请稍等再试..." );
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer) 
    SetPlayerMutexState( varMap,varPlayer ,PLAYER_STATE_READYFUBEN ,0)
    if x700081_var_RegisterFuben[varIndex].varId == 700121 or x700081_var_RegisterFuben[varIndex].varId == 701130  then
    	x700081_var_CreateFubenFlag[varMap] = 1
    end
		return
	else
		x700081_var_CreateFubenFlag[varMap] = 0
	end

	for varI=0, 255 do
		local nValue = sceneParamList[varI+1];
		SetFubenData_Param(varMap, varI,nValue);
	end

    if varSelectMap > 0 then
    	if memberNum < 0 then
    		StartTalkTask(varMap);
	        TalkAppendString(varMap, x700081_var_FuBenCreateOK);
	        StopTalkTask();
	        DeliverTalkTips(varMap, varPlayer);
    	else
	        for varI = 0, memberNum - 1 do
	            local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	            StartTalkTask(varMap);
	            TalkAppendString(varMap, x700081_var_FuBenCreateOK);
	            StopTalkTask();
	            DeliverTalkTips(varMap, memberId);
	        end
		end
    
		if varMode==1 then
			GamePlayScriptLog(varMap, varPlayer, 1003)  

		else
			GamePlayScriptLog(varMap, varPlayer, 1001)  
		end		

    else
		if memberNum < 0 then
			StartTalkTask(varMap);
	            TalkAppendString(varMap, x700081_var_FuBenCreateFailed);
	            StopTalkTask();
	            DeliverTalkTips(varMap, varPlayer);
	
	            
	            SetPlayerMutexState( varMap,varPlayer ,PLAYER_STATE_READYFUBEN ,0)
		else
	        for varI = 0, memberNum - 1 do
	            local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	            StartTalkTask(varMap);
	            TalkAppendString(varMap, x700081_var_FuBenCreateFailed);
	            StopTalkTask();
	            DeliverTalkTips(varMap, memberId);
	
	            
	            SetPlayerMutexState( varMap,memberId ,PLAYER_STATE_READYFUBEN ,0)
	        end
	    end
    end
end


function x700081_ProcFubenReady(varMap, destsceneId)

	if x700081_IsMutlMap(destsceneId) == 1 then
		x700081_OnFubenReady_Room(varMap, destsceneId)
		
		--ROOM拉完人后，清除上个场景的标记，否则和ROOM入口相同的map中从NPC进入正常副本时，创建LocalFuben成功拉人没进TeamReady却进了RoomReady导致无法拉人
		SetFubenData_Param(varMap, x700081_CSP_IS_ROOM, 0)
	else
			local varFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
			if 3 == varFubenType then
				x700081_ProcFubenReady_Group(varMap, destsceneId)
			else 
				x700081_ProcFubenReady_Team(varMap, destsceneId)
			end
	end

end

function x700081_ProcFubenReady_Team(varMap, destsceneId)

	local leaderguid = GetFubenData_TeamLeader(destsceneId);
	local leaderObjId = Guid2ObjId(varMap, leaderguid);	
	local varIndex = x700081_GetFubenIndex(varMap, leaderObjId)	
	local varScriptFileId = x700081_var_RegisterFuben[varIndex].varId
	x700081_DeleteNpcAfterEnter(varMap, leaderObjId)
	
	for varI=20, 239 do	
			SetFubenData_Param(destsceneId,varI,0)
	end
	
	local varMode = GetFubenData_Param(destsceneId, x700081_CSP_FUBEN_MODE )	
	SetFubenData_Param(destsceneId, x700081_CSP_FUBEN_SCENE_ID, destsceneId);
	
	if varMode==1 then
		if GetGameOpenById(1022)<=0 then
			return 0
		end
	end
	
	--检查三番
	local memberNum = 0
	local nIsRoom3Fan = GetFubenData_Param(destsceneId, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan == 1 then
		local nGUID = ObjId2Guid(varMap, leaderObjId)
		local bFind,nGIndex = x700081_FindFubenPlayer(varMap,nGUID)
		x700081_WriteDebugLog("x700081_ProcFubenReady_Team is room")
		if bFind == nil or bFind == 0 then
			return
		end
		memberNum = x700081_GetCorpsCount(varMap, leaderObjId, nGIndex)	 
	else
		x700081_WriteDebugLog("x700081_ProcFubenReady_Team is local")
		memberNum = GetNearTeamCount(varMap, leaderObjId)
	end
	
	local varMsg = "CSD,EnterFuben,"..varScriptFileId..","..destsceneId..","..memberNum
	local j=0
	for varI=x700081_CSP_GUID_START, 254-1 do
		local nGuid = GetFubenData_Param(destsceneId,varI)

		if nGuid~=0 then
			local memberId =  Guid2ObjId(varMap, nGuid);
			if x700081_var_RegisterFuben[varIndex].enterLog ~= nil then
				if nIsRoom3Fan == 1 then
					GamePlayScriptLog(varMap, memberId, x700081_var_RegisterFuben[varIndex].enterLog + 10000)--跨服log默认增加10000
				else
					GamePlayScriptLog(varMap, memberId, x700081_var_RegisterFuben[varIndex].enterLog)
				end
			end
			local nFromSceneId = GetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID)
			if nFromSceneId<0 then
				if IsPlayerStateNormal(varMap,memberId ) > 0 then
					local countryId = GetCurCountry( varMap, memberId )
					if x700081_var_RegisterFuben[varIndex].varId == 700121 then
						SetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID, x700081_var_FutuBackSceneList[1][countryId+1]);
					else
						SetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID, x700081_var_BackSceneList[varIndex][countryId+1]);
					end
				end
			end

			local ErrorCode = x700081_IsPlayerErrorState( varMap,memberId )
			if ErrorCode == 0 then 
			
				--清除随机搜索进入副本标志
				--SetPlayerRuntimeData( varMap, memberId, RD_GUANKA_RANDOM_SEARCH_MODE,0)
				local varX
				local z
				if x700081_var_RegisterFuben[varIndex].varId == 700121 then
					varX = 44
					z = 84
				elseif x700081_var_RegisterFuben[varIndex].varId == 701130 then
				    local pos = random(1,3)
				    varX = x700081_var_EnterPosList[varIndex][pos].varX
					  z = x700081_var_EnterPosList[varIndex][pos].z
					  SetFubenData_Param(destsceneId, x700081_CSP_ENTER_POS_INDEX, pos)
				else 
					varX = x700081_var_EnterPosList[varIndex][j+1].varX
					z = x700081_var_EnterPosList[varIndex][j+1].z
				end

				if 1 == x700081_var_RegisterFuben[varIndex].recordPos then
						x700081_RecordEnterCoordinate(varMap, memberId, varIndex)
				end
				
				if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,memberId,destsceneId) == 1 then
					NewWorld(varMap, memberId, destsceneId, varX, z, x700081_var_FileId);
					varMsg = varMsg..","..nGuid
				end
				
				j = j+1	
				
			end

			if IsPlayerStateNormal(varMap,memberId ) > 0 then
				
				SetPlayerMutexState( varMap,memberId ,PLAYER_STATE_READYFUBEN ,0)
			end

			
		end
	end
	
	--x700081_SaveFubenIndex(varMap, leaderObjId, -1)
    WriteLog(1,varMsg)     
end


function x700081_GetBackPosition(varMap, varPlayer, varIndex)
  --WriteLog(1, "x700081_GetBackPosition varIndex=="..varIndex)
	local npos = random(1,6)
	local x1,z1
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		x1 = 50
		z1 = 251
	elseif x700081_var_RegisterFuben[varIndex].varId == 701130 then
			x1 = 137
		  z1 = 320
	else
		x1 = x700081_var_BackPosList[varIndex][npos].varX
		z1 = x700081_var_BackPosList[varIndex][npos].z
	end
	return x1,z1
	
end




function x700081_ProcPlayerEnter(varMap, varPlayer)
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	local varIndex =0;

	varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)

	local leaveFlag = GetFubenData_Param(varMap, x700081_CSP_ISCLOSING);

	if leaveFlag > 0 then
		
		--提示xx秒后将退出副本
		local leaveCountDown = GetFubenData_Param(varMap, x700081_CSP_LEAVECOUNTDOWN) + 1;
		local nCloseTick = GetFubenData_Param(varMap, x700081_CSP_CLOSETICK);
		
		if leaveCountDown >= nCloseTick then
			RelivePlayerNM( varMap,varPlayer,2) 
			SetPlayerMutexState( varMap,varPlayer,PLAYER_STATE_DIE,0)
			TimerCommand( varMap, varPlayer, 1, 7010, 3, varScriptFileId, -1, -1 );

			--执行传送
			x700081_ExcutePlayerNewWorld(varMap,varPlayer)
			return
		end
	end
	
	local varX,z = x700081_GetBackPosition(varMap, varPlayer, varIndex)
	SetPlayerDefaultReliveInfo(varMap, varPlayer, "%10", "%10", "%10", varMap, varX, z);

	if 3 == nFubenType then
		x700081_ProcGroupPlayerEnter(varMap,varPlayer,varIndex)
	else
		local myGuid = GetPlayerGUID( varMap,varPlayer )
		myGuid = format("%u",myGuid)
				
		if x700081_IsMutlMap(varMap) ~= 1 then --not room
			local bFind =0
			for varI= 0 ,6 - 1  do   
	      local paramidx = x700081_CSP_GUID_START + varI
	      local guid = GetFubenData_Param(varMap, paramidx )
	
				guid=format("%u",guid)
				if myGuid==guid then
					bFind =1
					break;
				end
		  end
		 else --room
		 	local bFind,nGIndex,nTIndex,nPIndex,nGUID,nWorldID,nLevel,nGuildID,nCountryID,nTmpCamp =x700081_FindFubenPlayer(varMap,myGuid)		 	
		 end
	
		if bFind==0 and x700081_GetFubenType(varIndex) ~= 2 then
			local nWeekCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
			FubenIllegalEnterLog(varMap, varPlayer, 1001,nWeekCount)
		end
	end
	
	 --x700081_SaveFubenIndex(varMap, varPlayer, -1)
end

function x700081_ProcSwitchWeekAndDay(varMap, varPlayer, varIndex, varMode)

	local n_dateIndex = nil
	local n_dateCount = nil
	local n_today = nil
	local n_todayCount = nil
	
	 if x700081_var_RegisterFuben[varIndex].varId == 701130 then 
	 	 	 n_dateIndex = MD_FUBEN_JINGYING_WEEK
	     n_dateCount = MD_FUBEN_JINGYING_WEEKCOUNT
	 else
	 	   n_dateIndex = x700081_md_List[varIndex][1]
	     n_dateCount = x700081_md_List[varIndex][2]
	     n_today = x700081_md_List[varIndex][3]
	     n_todayCount = x700081_md_List[varIndex][4]
	 end
	
	local lastDate = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3])
	
	local n_CountMode
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		n_CountMode = 0
	else
		n_CountMode = x700081_var_CountModeList[varIndex]
	end
	if varMode == 1 and n_CountMode == 2 then --主要针对跨服三番
		local weekIndex = GetWeekIndex()
		if weekIndex ~= lastDate then
			SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], weekIndex)
			SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], 0)	
		end
		
		local varToday = GetDayOfYear()
		
		if n_today ~= nil and n_todayCount ~= nil then
			local lastDate_ = GetPlayerGameData(varMap, varPlayer, n_today[1], n_today[2], n_today[3])
			WriteLog(1, format("x700081_ProcSwitchWeekAndDay --- weekIndex = %d, lastDate = %d, varToday = %d, lastDate_ = %d", weekIndex, lastDate, varToday, lastDate_))
			if varToday ~= lastDate_ then
				SetPlayerGameData(varMap, varPlayer, n_today[1], n_today[2], n_today[3], varToday)
				SetPlayerGameData(varMap, varPlayer, n_todayCount[1], n_todayCount[2], n_todayCount[3], 0)
			end
		end
	end
end

function x700081_ProcPlayerEnterFinished(varMap, varPlayer)
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	local varIndex = 0
	local bProcPlayerEnter = 0
	
	x700081_WriteDebugLog("x700081_ProcPlayerEnterFinished", "nFubenType", nFubenType, "varScriptFileId", varScriptFileId)
	
	varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)
	
	local varMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE )
	local enterCount, todayCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
	WriteLog(1, format(" ---------- Player = %d, enterCount = %d", GetGUID(varMap, varPlayer), enterCount))
	local countMode
	if (x700081_IsFirstFuben(varIndex) == 1) then
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			countMode = 0;
		else
			countMode = x700081_var_CountModeList[varIndex];
		end
		if countMode ~= 0 then --如果有计次
			x700081_ProcSwitchWeekAndDay(varMap, varPlayer, varIndex, varMode)	-- 处理切周和切天的逻辑		
			
			local maxNum = x700081_var_CountUntilList[varIndex]
			if varIndex == 78 then 
				local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 5)
				maxNum = maxNum + peerVipValue
			--	WriteLog(1,format("=========peervip benefit========max=%d,now=%d",maxNum, enterCount))
			end
			
			if (enterCount >= maxNum and x700081_var_RegisterFuben[varIndex].varId ~= 701130) then
				x700081_ExcutePlayerNewWorld(varMap, varPlayer)	
				Msg2Player(varMap, varPlayer, "次数已达上限！！！", 8, 3)
				WriteLog(1, "Fuben KickOut! Reason:" .. "Room3Fan EnterCount Over Time,GUID = " .. GetGUID(varMap, varPlayer) .. "---------" .. varIndex)
				return
			end
		end
	end
	
	if (varMode == 1 and todayCount ~= nil) then
		WriteLog(1, format(" ---------- Player = %d, todayCount = %d", GetGUID(varMap, varPlayer), todayCount))
		if (todayCount >= 9) then
			x700081_ExcutePlayerNewWorld(varMap, varPlayer)	
			Msg2Player(varMap, varPlayer, "次数已达上限！！！", 8, 3)
			WriteLog(1, "Fuben KickOut! Reason:" .. "Room3Fan TodayCount Over Time,GUID = " .. GetGUID(varMap, varPlayer) .. "---------" .. varIndex)
			return
		end
	end
	
	local nNextLoopIndex = x700081_GetNextLoopIndex(varMap, varPlayer, varScriptFileId, nFubenType)
	
	WriteLog(1, format("x700081_ProcGroupPlayerEnterFinished --- Info... SavePlayerNextFubenIndex GUID = %X, varScriptFileId = %d, nNextLoopIndex = %d"
									, GetGUID(varMap, varPlayer), varScriptFileId, nNextLoopIndex))
									
	if ( varScriptFileId == 700121 ) then
		x700081_SaveNextFubenFutuIndex(varMap, varPlayer, nNextLoopIndex+1)
	else
		x700081_SaveNextFubenIndex(varMap, varPlayer, nNextLoopIndex)
	end
	if nil ~= x700081_var_RegisterFuben[varIndex].procPlayerEnter and 1 == x700081_var_RegisterFuben[varIndex].procPlayerEnter then
		bProcPlayerEnter = 1
	end

	
	-- 添加副本中的buff
	if (x700081_var_addbuff[varScriptFileId] ~= nil ) then 
		if (x700081_var_addbuff[varScriptFileId].fubenType == nFubenType) then
			SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x700081_var_addbuff[varScriptFileId].buffid, 0);
		end
	end
		if	x700081_var_RegisterFuben[varIndex].varId == 700136 then
			SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 7588, 0);
	end
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u",myGuid)
	
	if 3 == nFubenType then
		x700081_ProcGroupPlayerEnterFinished(varMap, varPlayer, varIndex, myGuid, bProcPlayerEnter, varScriptFileId)
	else
	
		if x700081_IsMutlMap(varMap) ~= 1 then -- not room
				--GUID没有在副本记录中找到，T人
				local bFind =0	
				local iIndex =-1
				for varI= 0 ,6 - 1  do
			       
					iIndex = iIndex+1
			        local paramidx = x700081_CSP_GUID_START + varI
			
			        local guid = GetFubenData_Param(varMap, paramidx )
					guid=format("%u",guid)
					if myGuid==guid then
						bFind =1
						break;
					end
			  end
				
				if tonumber(bFind) == tonumber(0) then
				
			 	 --找不到玩家剔出副本
					x700081_ExcutePlayerNewWorld(varMap,varPlayer)	
					WriteLog(1,"Fuben KickOut! Reason:".."illeage enter,"..varScriptFileId..",".. myGuid..","..GetName(varMap, varPlayer))
					return
				end

				if bProcPlayerEnter == 1 then
					LuaCallNoclosure(varScriptFileId,"ProcPlayerEnter",varMap,varPlayer)
				end
				
				local bLoged = GetFubenData_Param(varMap, x700081_CSP_PLAYER_ENTER_START+iIndex);
				if bLoged==0 then
					local varRet = x700081_ProcPlayerFirstEnterFuben(varMap,varPlayer, varIndex)
					
					if varRet>0 then
						SetFubenData_Param(varMap, x700081_CSP_PLAYER_ENTER_START+iIndex, 1 )	
					end
				end
				
		else --room				
				--跨服默认三番
				SetPlayerRuntimeData(varMap,varPlayer,RD_FUBENPARAM_MODE, x700081_var_SearchCorpsDefaultMode)
			
				local bFind,nGIndex,nTIndex,nPIndex,nGUID,nWorldID,nLevel,nGuildID,nCountryID,nTmpCamp =x700081_FindFubenPlayer(varMap,myGuid)
				if bFind ~= 1 then
						--找不到玩家剔出副本
						x700081_ExcutePlayerNewWorld(varMap,varPlayer)	
						WriteLog(1,"Fuben KickOut! Reason:".."illeage enter not in room,"..varScriptFileId..",".. myGuid..","..GetName(varMap, varPlayer))
						return
				end
				
				x700081_WriteDebugLog("x700081_ProcPlayerEnterFinished", "nTmpCamp", nTmpCampd)
			
				--设置阵营
				if nTmpCamp ~= -1 then
					SetCurCamp(varMap,varPlayer,nTmpCamp);
				end
				
				if bProcPlayerEnter == 1 then
					LuaCallNoclosure(varScriptFileId,"ProcPlayerEnter",varMap,varPlayer)
				end
				
				--算出唯一
				local iIndex = nGIndex * FUBEN_GROUP_TEAM_COUNT*FUBEN_GROUP_TEAM_PLAYER_COUNT + nTIndex *FUBEN_GROUP_TEAM_PLAYER_COUNT + nPIndex
				local bLoged = GetFubenData_Param(varMap, x700081_CSP_PLAYER_ENTER_START+iIndex);
				if bLoged==0 then
					local nRet = x700081_ProcPlayerFirstEnterFuben(varMap,varPlayer, varIndex, 1)
					if nRet>0 then
						SetFubenData_Param(varMap, x700081_CSP_PLAYER_ENTER_START+iIndex, 1 )	
					end
				end
		
        if x700081_var_RegisterFuben[varIndex].enterLog ~= nil then
					GamePlayScriptLog(varMap, varPlayer, x700081_var_RegisterFuben[varIndex].enterLog + 10000)--跨服log默认增加10000
				end
		
			--记录日志
			WriteLog(1,format("Player Enter Room:%d,varMap:%d,GUID:%s,Name:%s,TmpCamp:%d",
									nFubenType,varMap,myGuid,GetName(varMap, varPlayer),nTmpCamp))
		end --end x700081_IsMutlMap

	
		--春节补偿（三环副本）数值计算
		local nIndex = x700081_GetFubenIndex(varMap, varPlayer)
		local fubenmode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
		local num = x700081_GetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SANHUAN)
		local time = GetDayOfYear()
		if time >= 24 and time < 45 then
			if nIndex == 45 or nIndex == 46 or nIndex == 52 or nIndex == 54 or nIndex == 58 or nIndex == 61 or nIndex == 64 then
				if num < 63 and fubenmode == 0 then			
					x700081_SetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SANHUAN, num + 1)
				elseif num < 63 and fubenmode == 1 then
					x700081_SetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SANHUAN, num + 3)			
				end
			end
		end	
		
		
		--春节补偿（轮回台副本）数值计算	
		local num1 = x700081_GetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_LUNHUITAI)
		if time >= 24 and time < 45 and num1 < 22 then
			if nIndex == 35 or nIndex == 36 or nIndex == 37 then
				x700081_SetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_LUNHUITAI, num1 + 1)
			end		
		end
	end
	
	--如果是三番，还要设置一次阵营
	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom3Fan == 1 then
		SetCurCamp(varMap,varPlayer, x700081_var_CampDefault);
	end

	--x700081_SaveFubenIndex(varMap, varPlayer, -1)
	
	-- 判断是否加入YY副本临时频道
	for idx,item in x700081_var_FubenYYChannelTab do
		if item == varScriptFileId then
			x700081_EnterYYFubenTempChannel(varMap, varPlayer)
			break
		end
	end
							
end

function x700081_ProcPlayerLeave(varMap, varPlayer)
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	local varIndex =0;
	local bProcPlayerLeave = 0
	
	varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)

	if nil ~= x700081_var_RegisterFuben[varIndex].procPlayerLeave and 1 == x700081_var_RegisterFuben[varIndex].procPlayerLeave then
		bProcPlayerLeave = 1
	end
	
		-- 最后一个人,清理采集点
	if (GetFuben_PlayerCount(varMap) <= 1) then	
		if (x700081_var_ScriptGrowPoint[varScriptFileId] ~= nil) then
			local groupTypeTable = x700081_var_ScriptGrowPoint[varScriptFileId]
			for i, item in groupTypeTable do
				RecycleGrowPointByType(varMap, item, -1)
			end
		end
	end
	
	if 3 == nFubenType then
		x700081_ProcGroupPlayerLeave(varMap, varPlayer)
	end

	if varIndex > 0 then
		if x700081_var_RegisterFuben[varIndex].leaveLog ~= nil then
			local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)
			if nIsRoom == 1 then
				GamePlayScriptLog(varMap, varPlayer, x700081_var_RegisterFuben[varIndex].leaveLog + 10000)--跨服log默认增加10000
			else
				GamePlayScriptLog(varMap, varPlayer, x700081_var_RegisterFuben[varIndex].leaveLog)
			end
			
		end
	end
		
	
	if bProcPlayerLeave == 1 then
		LuaCallNoclosure(varScriptFileId,"ProcPlayerLeave",varMap,varPlayer)
	end	

	--以下是房间的处理(是房间并且是第一环)
	if x700081_IsMutlMap(varMap) == 1 then
		  BroadCastBattleRoomGroupClear( varMap, varPlayer)-- 离开副本时清除标记信息并同步客户端的清理		  
   else
    	--如果是三番，需要恢复阵营
    	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
			if nIsRoom3Fan == 1 then
				local nCountryId = GetCurCountry( varMap,varPlayer )
	  		SetCurCamp(varMap,varPlayer,nCountryId )  	
			end
			return
	end
	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	local bFind,nGIndex,nTIndex,nPIndex,nGUID,nWorldID,nLevel,nGuildID,nCountryID,nTmpCamp =x700081_FindFubenPlayer(varMap,myGuid)
		
	--恢复阵营处理	
	if bFind > 0 and nTmpCamp ~= -1 then
		local nCountryId = GetCurCountry( varMap,varPlayer )
  	SetCurCamp(varMap,varPlayer,nCountryId )  	
  end
	
end

function x700081_ProcPlayerFirstEnterFuben(varMap, varPlayer, varIndex, varKuaFu)

	local varMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE )
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	local nDateCount = x700081_var_CountUntilList[varIndex]
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varRet = x700081_CheckOwnerItemRequest(varMap, varPlayer, varMode, varIndex) 
	WriteLog(1, format("x700081_ProcFubenSceneCreated nFubenType --- varMap = %d, varPlayer = %d, nFubenType = %d",varMap, varPlayer, nFubenType))
	if varRet>0 then
		if nFubenType == 2 then 
			local IsHaveGold = GetMoney(varMap, varPlayer,2)
			if IsHaveGold >= x700081_GetCost(varMap, varPlayer, varIndex) then
				if x700081_GetCost(varMap, varPlayer, varIndex) > 0 then
					CostMoney(varMap, varPlayer, 2, x700081_GetCost(varMap, varPlayer, varIndex),3730)		
					GamePlayScriptLog( varMap, varPlayer, 3730+nDateCount)				
					x700081_ShowTips(varMap, varPlayer, format("花费现金#{_MONEY%d}",x700081_GetCost(varMap, varPlayer, varIndex)))	
					WriteLog(1, format("x700081_ProcFubenSceneCreated CostMoneyok --- varMap = %d, varPlayer = %d, Money = %d",varMap, varPlayer, x700081_GetCost(varMap, varPlayer, varIndex)))
				end
			else 
				WriteLog(1, format("x700081_ProcFubenSceneCreated CostMoneyError!!!! --- varMap = %d, varPlayer = %d, Money = %d",varMap, varPlayer, IsHaveGold))
			end		
		end
		x700081_ProcXianJinRequestOk(varMap, varPlayer, varIndex, varMode)  
		--轮回台设置活跃度
		if varIndex == 35 or varIndex == 36 or varIndex == 37 then 
	 		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,2)
	 		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,2)
		end
		x700081_SetTotalCount(varMap, varPlayer, varIndex, varMode)   
		if( nDateCount > 0 and x700081_var_RegisterFuben[varIndex].varId ~= 701130) then
			x700081_SetEnterCount(varMap, varPlayer,varIndex, varMode)		
		end
		
		if varKuaFu == 1 then
			--清除副本buffer列表
			x700081_ClearGuanQiaBuffer(varMap,varPlayer)
			
			--增加副本使用CD buffer
			x700081_AddGuanQiaCDBuffer(varMap, varPlayer)
		end
		
	else
		--执行传送
		x700081_ExcutePlayerNewWorld(varMap,varPlayer)
			
		local myGuid = GetPlayerGUID( varMap,varPlayer )
		myGuid = format("%u",myGuid)
		WriteLog(1,"Fuben KickOut! Reason:".."not enough item,"..varScriptFileId..",".. myGuid..","..GetName(varMap, varPlayer))
		return 0
	end
	return 1
end


function x700081_EnterTick(varMap, nowTickCount, varScriptFileId, varIndex)
	LuaCallNoclosure(varScriptFileId,"EnterTick", varMap, nowTickCount)
end

function x700081_ProcFubenTimer(varMap, nowTime)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varIndex =0;

	varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)

	local nTickTime = GetFubenData_Param(varMap, x700081_CSP_TICKTIME );
	local nowTickCount = GetFubenData_Param(varMap, x700081_CSP_TICKCOUNT) + 1;
	
	SetFubenData_Param(varMap, x700081_CSP_TICKCOUNT, nowTickCount);

	local leaveFlag = GetFubenData_Param(varMap, x700081_CSP_ISCLOSING);

	if leaveFlag > 0 then
		local leaveCountDown = GetFubenData_Param(varMap, x700081_CSP_LEAVECOUNTDOWN) + 1;
		
		SetFubenData_Param(varMap, x700081_CSP_LEAVECOUNTDOWN, leaveCountDown);
		
		local nCloseTick = GetFubenData_Param(varMap, x700081_CSP_CLOSETICK);
		
		if leaveCountDown >= nCloseTick then
			local oldsceneId = GetFubenData_Param(varMap, x700081_CSP_BACKSCENEID);
			local humancount = GetFuben_PlayerCount(varMap);

			if humancount > 0 and tonumber(3) == tonumber(nFubenType) then
				x700081_ClearFubenInfo(varMap, varIndex, nFubenType)  -- 副本关闭，玩家离开副本前清除与副本关联的数据
			end

			for	varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI);
        		RelivePlayerNM( varMap,humanId,2)
				SetPlayerMutexState( varMap,humanId,PLAYER_STATE_DIE,0)
        		TimerCommand( varMap, humanId, 1, 7010, 3, varScriptFileId, -1, -1 );
        		--local varX,z = x700081_GetBackPosition(varMap, varPlayer, varIndex)
				--NewWorld(varMap, humanId, oldsceneId, varX, z, varScriptFileId);
	        	x700081_ExcutePlayerNewWorld(varMap,humanId) --执行传送(检查三番，本地副本，ROOM)
	        	x700081_ClearGuanQiaCDBuffer(varMap, humanId) --清除副本搜索CD
			end
			
		elseif leaveCountDown < nCloseTick then
			local humancount = GetFuben_PlayerCount(varMap);
			for	varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI);
 				local varStr = format(x700081_var_CountDownMessage, (nCloseTick - leaveCountDown) * nTickTime);
				StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
				StopTalkTask(varMap);
				DeliverTalkTips(varMap, humanId);
		 
	      x700081_ClearGuanQiaCDBuffer(varMap, humanId) --清除副本搜索CD
			end
		end
	else
    if nowTickCount == 1 then
			x700081_ProcFubenSceneCreated(varMap, varScriptFileId, varIndex )
    end

		local humancount = GetFuben_PlayerCount(varMap);

    if nowTickCount >= 2 then
			if humancount>0 then
				x700081_EnterTick(varMap, nowTickCount,varScriptFileId, varIndex )
			end
		end

		local nHoldTime = GetFubenData_Param(varMap, x700081_CSP_HOLDTIME);
    local nTime = ( nHoldTime- nowTickCount )*nTickTime
		
		for varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);

      TimerCommand( varMap, humanId, 1, 7010, 3, varScriptFileId, -1, -1 );

      if nTime > 0 then
          local nEventTime = nTime
          if nTime > 10 then
              nEventTime = nTime - 10
          end
          TimerCommand( varMap, humanId, 2, 7010, 3, varScriptFileId, nTime, nTime );
      end

			if nowTickCount == nHoldTime then
				StartTalkTask(varMap);
				TalkAppendString(varMap, x700081_var_TimeOutFailedMessage);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end
		end

    if nowTickCount == nHoldTime then
        SetFubenData_Param(varMap, x700081_CSP_ISCLOSING,1);
    end
	end
end

function x700081_InitAutoLevel_Team( varMap,varPlayer , varIndex, memberNum,autoleveltype )

    if autoleveltype == 0 then          

        
        local maxlevel = 0
        if memberNum <= 0 then
        	local varLevel = GetLevel(varMap,varPlayer)
	
	        if maxlevel < varLevel then
	            maxlevel = varLevel
	        end
        else
	        for varI = 0, memberNum - 1 do
	            local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	            local varLevel = GetLevel(varMap,memberId)
	
	            if maxlevel < varLevel then
	                maxlevel = varLevel
	            end
	        end
		end
        SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, maxlevel) ;					    

    elseif autoleveltype == 1 then      

        
        local minlevel = 1000
        if memberNum <= 0 then
        	local varLevel = GetLevel(varMap,varPlayer)
	
	            if minlevel > varLevel then
	                minlevel = varLevel
	            end
        else
	        for varI = 0, memberNum - 1 do
	            local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	            local varLevel = GetLevel(varMap,memberId)
	
	            if minlevel > varLevel then
	                minlevel = varLevel
	            end
	        end
		end
        SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, minlevel) ;					    

    elseif autoleveltype == 2 then      

        

        local averagelevel = 0
        local levelval1 = 0
        local levelval2 = 0
        
        local maxLevel = 0
        local minLevel = 200
        	
        if memberNum <= 0 then
        	 local varLevel = GetLevel(varMap,varPlayer)
	
	            levelval1 = levelval1 + varLevel*varLevel
	            levelval2 = levelval2 + varLevel
        else
        	
	        for varI = 0, memberNum - 1 do
	            local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	            local varLevel = GetLevel(varMap,memberId)
				
	            levelval1 = levelval1 + varLevel*varLevel
	            levelval2 = levelval2 + varLevel
	            
	            if varLevel < minLevel then
					minLevel = varLevel
				end
				if varLevel > maxLevel then
					maxLevel = varLevel
				end
	        end
		end
        averagelevel = levelval1 / levelval2

        SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, averagelevel) ;					
        
        if varIndex == 35 or varIndex == 36 or varIndex == 37 then 
	        if maxLevel - minLevel >= 15 then	
				SetFubenData_Param( varMap, x700081_CSP_XINSHOU_FLAG, 1)
				
				SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, 30 )
			end
		end
	end
end





function x700081_IsPlayerErrorState( varMap,varPlayer )

    local varState

    varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        return 1
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        return 1
    end

		varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_ENJAIL )
    if varState == 1 then
        return 1
    end	

	
	varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_WEDDING )
    if varState == 1 then
        return 1
    end

	varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        return 1
    end

	varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TIESAN )
    if varState == 1 then
        return 1
    end
	


    return 0

end






function x700081_GetEnterCount(varMap, varPlayer, varIndex)

	if x700081_var_RegisterFuben[varIndex].fubentype == 0 then  
		
		local n_dateIndex = nil
		local n_dateCount = nil
		if x700081_var_RegisterFuben[varIndex].varId ~= 700121 then
		  if (x700081_var_RegisterFuben[varIndex].varId == 701130) then
		  		n_dateIndex = MD_FUBEN_JINGYING_WEEK
			    n_dateCount = MD_FUBEN_JINGYING_WEEKCOUNT
		  else
		  		n_dateIndex = x700081_md_List[varIndex][1]
			    n_dateCount = x700081_md_List[varIndex][2]
		  end
		end
		
		local n_CountMode
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			n_CountMode = 0
		else
			n_CountMode = x700081_var_CountModeList[varIndex]
		end
		
		if n_CountMode == 0 then
			return 0
		elseif n_CountMode == 1 then
			local varToday = GetDayOfYear()
			local varLastday = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2],n_dateIndex[3] )
			if varToday ~= varLastday then
				return 0
			end
			local varDaycount = GetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2],n_dateCount[3] )
			return varDaycount
		elseif n_CountMode == 2 then
			local weekIndex = GetWeekIndex()
			local lastWeek = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2],n_dateIndex[3] )
			if lastWeek ~= weekIndex then
				return 0, 0
			end
			local weekcount = GetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2],n_dateCount[3] )
			
			local varDaycount = 0
			
			local n_today = nil
			local n_todayCount = nil
			if x700081_var_RegisterFuben[varIndex].varId ~= 701130 then 
					n_today = x700081_md_List[varIndex][3]
			    n_todayCount = x700081_md_List[varIndex][4]
			end
			
			if n_today ~= nil and n_todayCount ~= nil then
				local varToday = GetDayOfYear()
				local varLastday = GetPlayerGameData(varMap, varPlayer, n_today[1], n_today[2],n_today[3] )
				if varToday == varLastday then	
					varDaycount = GetPlayerGameData(varMap, varPlayer, n_todayCount[1], n_todayCount[2],n_todayCount[3] )
				end
			end
			
			return weekcount, varDaycount
		end
	elseif x700081_var_RegisterFuben[varIndex].fubentype==1 then
		local nMDcount = x700081_md_List[varIndex][1]
		local varCount = GetPlayerGameData(varMap, varPlayer, nMDcount[1], nMDcount[2], nMDcount[3])
		return varCount
	elseif x700081_var_RegisterFuben[varIndex].fubentype==2 then 
		
		local n_dateIndex = x700081_md_List[varIndex][1]
		local n_dateCount = x700081_md_List[varIndex][2]
		local n_CountMode
		
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			n_CountMode = 0
		else
			n_CountMode = x700081_var_CountModeList[varIndex]
		end
		
		if n_CountMode == 0 then
			return 0
		elseif n_CountMode == 1 then
			local varToday = GetDayOfYear()
			local varLastday = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2],n_dateIndex[3] )
			if varToday ~= varLastday then
				return 0
			end
			local varDaycount = GetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2],n_dateCount[3] )
			return varDaycount
		elseif n_CountMode == 2 then
			local weekIndex = GetWeekIndex()
			local lastWeek = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2],n_dateIndex[3] )
			if lastWeek ~= weekIndex then
				return 0, 0
			end
			local weekcount = GetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2],n_dateCount[3] )
			
			local varDaycount = 0
			
			local n_today = nil
			local n_todayCount = nil
			
			if x700081_var_RegisterFuben[varIndex].varId ~= 701130 then 
					n_today = x700081_md_List[varIndex][3]
			    n_todayCount = x700081_md_List[varIndex][4]
      end
			if n_today ~= nil and n_todayCount ~= nil then
				local varToday = GetDayOfYear()
				local varLastday = GetPlayerGameData(varMap, varPlayer, n_today[1], n_today[2],n_today[3] )
				if varToday == varLastday then	
					varDaycount = GetPlayerGameData(varMap, varPlayer, n_todayCount[1], n_todayCount[2],n_todayCount[3] )
				end
			end			
			return weekcount, varDaycount
		end --end n_CountMode
	end--end fubentype	

end

function x700081_SetTotalCount(varMap, varPlayer, varIndex, varMode)
	if x700081_var_RegisterFuben[varIndex].fubentype==0 and x700081_var_RegisterFuben[varIndex].loopindex==1 then
		local varCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_SANHUANTOTAL[1], MD_FUBEN_SANHUANTOTAL[2], MD_FUBEN_SANHUANTOTAL[3])
		if varMode == 0 then
			varCount = varCount + 1
		elseif varMode == 1 then
			varCount = varCount + 3
		elseif varMode == 2 then
			varCount = varCount + 21
		end
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_SANHUANTOTAL[1], MD_FUBEN_SANHUANTOTAL[2], MD_FUBEN_SANHUANTOTAL[3], varCount)
	end
end



function x700081_SetEnterCount(varMap, varPlayer, varIndex, varMode, varMaxCount)

	if x700081_var_RegisterFuben[varIndex].fubentype==0 then
	
		local n_dateIndex = nil
		local n_dateCount = nil
	  if x700081_var_RegisterFuben[varIndex].varId == 701130 then    ----精英剧场特殊处理
	      n_dateIndex = MD_FUBEN_JINGYING_WEEK
        n_dateCount = MD_FUBEN_JINGYING_WEEKCOUNT
	  else
	  		n_dateIndex = x700081_md_List[varIndex][1]
		    n_dateCount = x700081_md_List[varIndex][2]
	  end

		local n_CountMode
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			n_CountMode = 0
		else
			n_CountMode = x700081_var_CountModeList[varIndex]
		end
		
		if n_CountMode == 0 then
			return
		end
		
		local varToday = GetDayOfYear()
		local weekIndex = GetWeekIndex()
		
		local lastDate = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3])
		local dateCount = GetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3])
		
		if varMode == 0 then
			if n_CountMode == 1 then
				if varToday ~= lastDate then
					SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], varToday)
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], 1)
				else
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], dateCount+1)
				end
			elseif n_CountMode == 2 then
				if weekIndex ~= lastDate then
					SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], weekIndex)
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], 1)
				else
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], dateCount+1)
				end
			end
		elseif varMode == 1 then
			if n_CountMode == 1 then
				if varToday ~= lastDate then
					SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], varToday)
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], x700081_var_CountUntilList[varIndex])
				else
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], dateCount+x700081_var_CountUntilList[varIndex])
				end
			elseif n_CountMode == 2 then
				if weekIndex ~= lastDate then
					SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], weekIndex)
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], x700081_var_SanfanTimes)
				else
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], dateCount+x700081_var_SanfanTimes)
				end
				
				local n_today = nil
				local n_todayCount = nil
			  if x700081_var_RegisterFuben[varIndex].varId ~= 701130 then 
					  n_today = x700081_md_List[varIndex][3]
			      n_todayCount = x700081_md_List[varIndex][4]
        end
      
				if n_today ~= nil and n_todayCount ~= nil then
					local lastDate_ = GetPlayerGameData(varMap, varPlayer, n_today[1], n_today[2], n_today[3])
					local dateCount_ = GetPlayerGameData(varMap, varPlayer, n_todayCount[1], n_todayCount[2], n_todayCount[3])
					
					if varToday ~= lastDate_ then
						SetPlayerGameData(varMap, varPlayer, n_today[1], n_today[2], n_today[3], varToday)
						SetPlayerGameData(varMap, varPlayer, n_todayCount[1], n_todayCount[2], n_todayCount[3], 3)
					else
						SetPlayerGameData(varMap, varPlayer, n_todayCount[1], n_todayCount[2], n_todayCount[3], dateCount_+3)
					end
				end
			end

		elseif varMode == 2 then
			if n_CountMode == 1 then
				if varToday ~= lastDate then
					SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], varToday)
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], x700081_var_ZhouSanfanTimes)
				else
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], dateCount+x700081_var_ZhouSanfanTimes)
				end
			elseif n_CountMode == 2 then
				if weekIndex ~= lastDate then
					SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], weekIndex)
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], x700081_var_ZhouSanfanTimes)
				else
					SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], dateCount+x700081_var_ZhouSanfanTimes)
				end
			end
		end
	elseif x700081_var_RegisterFuben[varIndex].fubentype==1 then 
		local nMDcount = x700081_md_List[varIndex][1]
		SetPlayerGameData(varMap, varPlayer, nMDcount[1], nMDcount[2], nMDcount[3], 1)
	
	-- 挑战副本	
	elseif x700081_var_RegisterFuben[varIndex].fubentype == 2 then 	
		local n_dateIndex = x700081_md_List[varIndex][1]
		local n_dateCount = x700081_md_List[varIndex][2]
		local n_CountMode
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			n_CountMode = 0
		else
			n_CountMode = x700081_var_CountModeList[varIndex]		
		end
		if n_CountMode == 0 then
			return
		end
		
		local varToday = GetDayOfYear()
		local weekIndex = GetWeekIndex()
		
		local lastDate = GetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3])
		local dateCount = GetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3])
		local curCount = dateCount + 1
		
		if varMaxCount == 1 then --直接设置成最大值
			curCount = x700081_var_ChallengeFubenMaxCountTab[x700081_var_RegisterFuben[varIndex].varId]
		end
		
		--挑战无道具不检查varMode
		if n_CountMode == 1 then
			if varToday ~= lastDate then
				SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], varToday)
				SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], 1)
			else
				SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], curCount)
			end
		elseif n_CountMode == 2 then
			if weekIndex ~= lastDate then
				SetPlayerGameData(varMap, varPlayer, n_dateIndex[1], n_dateIndex[2], n_dateIndex[3], weekIndex)
				SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], 1)
			else
				SetPlayerGameData(varMap, varPlayer, n_dateCount[1], n_dateCount[2], n_dateCount[3], curCount)
			end
		end
	end
	--end挑战副本
end

function x700081_ProcDie(varMap, varPlayer, varKiller)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	if (x700081_var_CanDealPlayerDie_ScriptId[varScriptFileId] ~= nil) then
		LuaCallNoclosure( varScriptFileId, "ProcDie", varMap, varPlayer, varKiller )
	end
end

function x700081_ProcPlayerDie(varMap, varPlayer, varKiller)
	if GetSceneType(varMap) ==  1 then
		SetFubenData_Param(varMap,x700081_CSP_PLAYER_DEAD, 1)
	end
end

function x700081_CheckAllMemberNear(varMap, varPlayer)
    local nNearCount  = GetNearTeamCount( varMap,varPlayer )
    local nTotalCount = GetTeamSize( varMap,varPlayer )

    if nNearCount ~= nTotalCount then
        return 0
    end

    return 1
end

function x700081_CheckAllMemberMaxLevel(varMap, varPlayer, teamnum, varIndex)


	local tips,result

	result = 1

	
	local nLevelMax = x700081_var_LevelRangeList[varIndex][2]

	if(  nLevelMax> 0 ) then
		if teamnum < 0 then
			if GetLevel(varMap, varPlayer) > nLevelMax then
				if result == 1 then
					result = 0
					tips = GetName(varMap, varPlayer)
				else
					tips = tips..","..GetName(varMap, varPlayer)
				end
			end
		else
			for varI = 0, teamnum - 1 do
				local memberId = GetNearTeamMember(varMap, varPlayer, varI);
				if GetLevel(varMap, memberId) > nLevelMax then
					if result == 1 then
						result = 0
						tips = GetName(varMap, memberId)
					else
						tips = tips..","..GetName(varMap, memberId)
					end
				end
			end
		end
	end

	if result == 0 then
		tips = tips..format("的等级超过%d级！", nLevelMax)
	end

	return result,tips;
end

function x700081_CheckAllMemberMinLevel(varMap, varPlayer, teamnum, varIndex)


	local tips,result

	result = 1

	local nLevelMin = x700081_var_LevelRangeList[varIndex][1]
	

	if nLevelMin> 0 then
		if teamnum < 0 then
			if GetLevel(varMap, varPlayer) < nLevelMin then
				if result == 1 then
					result = 0
					tips = GetName(varMap, varPlayer)
				else
					tips = tips..","..GetName(varMap, varPlayer)
				end
			end
		else
			for varI = 0, teamnum - 1 do
				local memberId = GetNearTeamMember(varMap, varPlayer, varI);
				if GetLevel(varMap, memberId) < nLevelMin then
					if result == 1 then
						result = 0
						tips = GetName(varMap, memberId)
					else
						tips = tips..","..GetName(varMap, memberId)
					end
				end
			end
		end
	end
	if result == 0 then
		tips = tips..format("的等级不足%d级！", nLevelMin)
	end

	return result,tips;
end


function x700081_CheckAllMemberEnterCount(varMap, varPlayer, teamnum, varMode, varIndex)

	local tips,result

	result = 1

	if varMode==nil then
		varMode=0
	end

	local nType = x700081_GetFubenType(varIndex)	
	local nCountLimited = x700081_var_CountUntilList[varIndex]
	local peerVipValueMember = 0
	
	if varIndex == 78 then 
		local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 5)
		nCountLimited = nCountLimited + peerVipValue
	end
	
	if nCountLimited <= 0 then
		return 1,nil
	end
		
		
	--挑战副本
	if nType == 2 then	
		local str_ = ""
		for varI = 0, teamnum - 1 do
			local memberId = GetNearTeamMember(varMap, varPlayer, varI);			
			local enterCount = x700081_GetEnterCount(varMap, memberId, varIndex)
			
			local maxCountMember = x700081_var_CountUntilList[varIndex]
			if varIndex == 78 then
				peerVipValueMember = GetPeerVipBenefit(varMap, memberId, 5)
				maxCountMember = maxCountMember + peerVipValueMember
			end
			
			if enterCount >= maxCountMember then			
				if result == 1 then
					result = 0
					str_ = GetName(varMap, memberId)
				else
					str_ = str_..","..GetName(varMap, memberId)
				end
			end
		end
		
		if str_ ~= "" then
			if result == 1 then
					result = 0
					tips = format("很抱歉！%s本周进入本挑战副本超过次数，请下周再来挑战！", "#G"..str_.."#o")
			else
					tips = str_..","..format("很抱歉！%s本周进入本挑战副本已经超过次数，请下周再来挑战！", "#G"..str_.."#o")
			end
			return result,tips;
		end
	end	--end 挑战副本
	
	if varMode == 1 then   
		if teamnum < 0 then
			local enterCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
			if enterCount > (nCountLimited - x700081_var_SanfanTimes) then
			
				if result == 1 then
					result = 0
					tips = GetName(varMap, varPlayer)
				else
					tips = tips..","..GetName(varMap, varPlayer)
				end
			end
		else
			for varI = 0, teamnum - 1 do
				local memberId = GetNearTeamMember(varMap, varPlayer, varI);
				
				local enterCount = x700081_GetEnterCount(varMap, memberId, varIndex)
				if enterCount > (nCountLimited - x700081_var_SanfanTimes) then
				
					if result == 1 then
						result = 0
						tips = GetName(varMap, memberId)
					else
						tips = tips..","..GetName(varMap, memberId)
					end
				end
			end
		end
		if result ~= 0 then
			local str_ = ""
			if teamnum < 0 then
				local enterCount, todayCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
				
				if todayCount ~= nil and todayCount >= 4 then
					if str_ == "" then
						str_ = GetName(varMap, varPlayer)
					else
						str_ = str_..","..GetName(varMap, varPlayer)
					end
				end
			else
				for varI = 0, teamnum - 1 do
					local memberId = GetNearTeamMember(varMap, varPlayer, varI)
					local enterCount, todayCount = x700081_GetEnterCount(varMap, memberId, varIndex)
				
					if todayCount ~= nil and todayCount >= 7 then
						if str_ == "" then
							str_ = GetName(varMap, memberId)
						else
							str_ = str_..","..GetName(varMap, memberId)
						end
						break
					end
				end
			end
			if str_ ~= "" then
				if result == 1 then
					result = 0
					tips = format("很抱歉！%s今天进入三环副本（三番令）已满3次，请明天再来！", "#G"..str_.."#o")
				else
					tips = tips..","..format("很抱歉！%s今天进入三环副本（三番令）已满3次，请明天再来！", "#G"..str_.."#o")
				end
				return result,tips;
			end
		end
	elseif varMode == 2 then  
		if teamnum < 0 then
			local enterCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
			if enterCount > (nCountLimited - x700081_var_ZhouSanfanTimes) then
				if result == 1 then
					result = 0
					tips = GetName(varMap, varPlayer)
				else
					tips = tips..","..GetName(varMap, varPlayer)
				end
			end
		else
			for varI = 0, teamnum - 1 do
				local memberId = GetNearTeamMember(varMap, varPlayer, varI);
				local enterCount = x700081_GetEnterCount(varMap, memberId, varIndex)
				if enterCount > (nCountLimited - x700081_var_ZhouSanfanTimes) then
					if result == 1 then
						result = 0
						tips = GetName(varMap, memberId)
					else
						tips = tips..","..GetName(varMap, memberId)
					end
				end
			end
		end
	else                     
		if teamnum < 0 then
			local enterCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
			
			local maxCountMember = x700081_var_CountUntilList[varIndex]
			if varIndex == 78 then
				peerVipValueMember = GetPeerVipBenefit(varMap, varPlayer, 5)
				maxCountMember = maxCountMember + peerVipValueMember
			end
			
			if enterCount  >= maxCountMember then
				if result == 1 then
					result = 0
					tips = GetName(varMap, varPlayer)
				else
					tips = tips..","..GetName(varMap, varPlayer)
				end
			end
			
			--5 到 30 的是之前2和3环没有设置进入次数的试炼副本，进行额外记录的 MD 判定
	    	if varIndex >= 5 and varIndex <= 30 and GetSceneType(varMap) == 0 then
		    	if x700081_var_TryLoopMDIndexTable[varIndex] ~= nil then
					if GetPlayerGameData(varMap, varPlayer, 255, x700081_var_TryLoopMDIndexTable[varIndex], 1) == 1 then
						result = 0
						tips = ""
					end
				end
		    end
		else
			for varI = 0, teamnum - 1 do
				local memberId = GetNearTeamMember(varMap, varPlayer, varI);
				local enterCount = x700081_GetEnterCount(varMap, memberId, varIndex)
				
				local maxCountMember = x700081_var_CountUntilList[varIndex]
				if varIndex == 78 then
					peerVipValueMember = GetPeerVipBenefit(varMap, memberId, 5)
					maxCountMember = maxCountMember + peerVipValueMember
				end
			
				if enterCount  >= maxCountMember then
					if result == 1 then
						result = 0
						tips = GetName(varMap, memberId)
					else
						tips = tips..","..GetName(varMap, memberId)
					end
				end
				
				--同上试炼判定，队伍模式
		    	if varIndex >= 5 and varIndex <= 30 and GetSceneType(varMap) == 0 then
		    		if x700081_var_TryLoopMDIndexTable[varIndex] ~= nil then
						if GetPlayerGameData(varMap, memberId, 255, x700081_var_TryLoopMDIndexTable[varIndex], 1) == 1 then
							result = 0
							tips = ""
						end
					end
			    end
			end
		end
	end
	
	if result == 0 then
		if varMode==1 then
			tips = tips.." 本周副本剩余次数不足，无法进入三环副本（三番令）！"
		elseif varMode == 2 then
			tips = tips.." 本周副本剩余次数不足，无法进入黄金三番副本！"		
		else
			tips = tips.." 超过副本次数限制"
		end
	end

	return result,tips;

end

function x700081_CheckAllMemberErrorState( varMap, varPlayer, teamnum )

    local result,tips ;
    
    
    result,tips = x700081_CheckAllMemberErrorState_NormalState( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end
    
    
    result,tips = x700081_CheckAllMemberErrorState_ReadyFubenState( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_Die( varMap, varPlayer, teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_AutoPlay( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_Stall( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_MentalGame( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_CrashBox( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_Bus( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

	 
    result,tips = x700081_CheckAllMemberErrorState_Enjail( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

	
	
	result,tips = x700081_CheckAllMemberErrorState_Wedding( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

	
	result,tips = x700081_CheckAllMemberErrorState_Tongqu( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

	
	result,tips = x700081_CheckAllMemberErrorState_Tiesan( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    
    result,tips = x700081_CheckAllMemberErrorState_Baolong( varMap,varPlayer,teamnum )
    if result == 0 then
        return result,tips
    end

    result,tips = x700081_CheckAllMemberErrorState_houhuayuanshizijing(varMap, varPlayer, teamnum)
    if result == 0 then
        return result,tips
    end	

    return 1


end

function x700081_CheckAllMemberErrorState_houhuayuanshizijing(varMap, varPlayer, teamnum)
    
    local tips,result

	result = 1

	

    if teamnum == -1 then


		local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7538 )
		local IsHaveFlag1 = IsHaveSpecificImpact(varMap, varPlayer, 7629 )

	    local varState =0
	    if IsHaveFlag == 1 or IsHaveFlag1 == 1 then
	    	varState = 1
	    end

	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
		end
			end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        
			local IsHaveFlag = IsHaveSpecificImpact(varMap, memberId, 7538 )
			local IsHaveFlag1 = IsHaveSpecificImpact(varMap, memberId, 7629 )		
			    
		    local varState =0
		    if IsHaveFlag == 1 or IsHaveFlag1 ==1 then
		    	varState = 1
		    end
		    
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于变身状态"
	end

	return result,tips

end



function x700081_CheckAllMemberErrorState_NormalState( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
    if teamnum == -1 then
    	local varState = IsPlayerStateNormal(varMap,varPlayer )
    	if varState == 0 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerStateNormal(varMap,memberId )
	        if varState == 0 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end
	if result == 0 then
		tips = tips.." 离线或不在当前场景"
	end

	return result,tips;
end




function x700081_CheckAllMemberErrorState_ReadyFubenState( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    if teamnum == -1 then
    	 local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_READYFUBEN )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, varPlayer)
	            else
	                tips = tips..","..GetName(varMap, varPlayer)
	            end
	     end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_READYFUBEN )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 已经处于准备副本状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_MentalGame( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
    if teamnum == -1 then
    	 local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, varPlayer)
	            else
	                tips = tips..","..GetName(varMap, varPlayer)
	            end
	     end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_MENTALGAME )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于答题状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_Stall( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
    if teamnum == -1 then
    	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_STALL )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end
	
	if result == 0 then
		tips = tips.." 处于设摊状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_Die( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
    if teamnum == -1 then
     	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_DIE )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于死亡状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_CrashBox( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
    if teamnum == -1 then
    	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_CRASHBOX )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于运镖状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_AutoPlay( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
    if teamnum == -1 then
    	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
	    local state2 = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
	    if varState == 1 or state2 == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_AUTOPLAY )
	        local state2 = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_SUBTRAIN )
	        if varState == 1 or state2 == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于代练或挂机状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_Bus( varMap, varPlayer, teamnum )
    local tips,result

	result = 1

    
     if teamnum == -1 then
    	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_BUS )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end
	if result == 0 then
		tips = tips.." 处于bus状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_Enjail( varMap, varPlayer, teamnum )
    local tips,result

	result = 1


    
    if teamnum == -1 then
   		local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_ENJAIL )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_ENJAIL )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于监禁状态"
	end

	return result,tips
end





function x700081_CheckAllMemberErrorState_Wedding( varMap, varPlayer, teamnum )
    local tips,result

	result = 1


    
    if teamnum == -1 then
    	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_WEDDING )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_WEDDING )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于婚礼状态"
	end

	return result,tips
end





function x700081_CheckAllMemberErrorState_Baolong( varMap, varPlayer, teamnum )
    local tips,result

	result = 1


    
    if teamnum == -1 then
    
    	
		local IsHaveFlag1 = IsHaveSpecificImpact(varMap, varPlayer, 7536 )
	    local IsHaveFlag2 = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
	    
	    local varState =0
	    if IsHaveFlag1 == 1 or IsHaveFlag2 == 1 then
	    	varState = 1
	    end
	    
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        
			local IsHaveFlag1 = IsHaveSpecificImpact(varMap, memberId, 7536 )
		    local IsHaveFlag2 = IsHaveSpecificImpact(varMap, memberId, 7537 )
		    
		    local varState =0
		    if IsHaveFlag1 == 1 or IsHaveFlag2 == 1 then
		    	varState = 1
		    end
		    
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end

	if result == 0 then
		tips = tips.." 处于暴龙大作战状态"
	end

	return result,tips
end




function x700081_CheckAllMemberErrorState_Tongqu( varMap, varPlayer, teamnum )
    local tips,result

	result = 1


    
    if teamnum == -1 then
    	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_TONGQUBUFF )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end
	
	if result == 0 then
		tips = tips.." 处于童趣状态"
	end

	return result,tips
end





function x700081_CheckAllMemberErrorState_Tiesan( varMap, varPlayer, teamnum )
    local tips,result

	result = 1


    
    if teamnum == -1 then
   	 	local varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TIESAN )
	    if varState == 1 then
	        if result == 1 then
	            result = 0
	            tips = GetName(varMap, varPlayer)
	        else
	            tips = tips..","..GetName(varMap, varPlayer)
	        end
	    end
    else
	    for varI = 0, teamnum - 1 do
	        local memberId = GetNearTeamMember(varMap, varPlayer, varI);
	        local varState = IsPlayerMutexState(varMap,memberId,PLAYER_STATE_TIESAN )
	        if varState == 1 then
	            if result == 1 then
	                result = 0
	                tips = GetName(varMap, memberId)
	            else
	                tips = tips..","..GetName(varMap, memberId)
	            end
	        end
	    end
	end
	if result == 0 then
		tips = tips.." 处于铁人三项状态"
	end

	return result,tips
end




function x700081_ProcFubuenCompleted(varMap)
	if GetSceneType(varMap)~=1 then
		return
	end

	

	local nFubenType = GetFubenData_Param(varMap, 0 )
	local nFubenMode = GetFubenData_Param(varMap, 255 )

	local nParam = 0
	
	local strFubenName = ""
	if nFubenType == FUBEN_DONGHAIHAIYAN then
		nParam = QIULONGDAO_TOPLIST
		strFubenName = "囚龙岛"
	elseif nFubenType == FUBEN_HESHIBI then
		nParam = HESHIBI_TOPLIST
		strFubenName = "和氏璧"
	elseif nFubenType == FUBEN_ZHULUOJI then
		nParam = CAISHENDIAN_TOPLIST
		strFubenName = "赤血号"
	elseif nFubenType == FUBEN_ZHUJIAZHUANG3 then
		nParam = ZHUJIAZHUANG_TOPLIST
		strFubenName = "祝家庄"
	elseif nFubenType == FUBEN_FUTUTA4 then
		nParam = LUNHUITAI_TOPLIST
		strFubenName = "轮回台"
	elseif nFubenType == FUBEN_TANSUO_ZHANSHENMU_3 then
		nParam = ZHANSHENMU_TOPLIST
		strFubenName = "夏王墓"
	elseif nFubenType == FUBEN_YINDUSHENMIAO3 then
		nParam = INDIANTEMPLE_TOPLIST
		strFubenName = "印度河"
	elseif nFubenType == FUBEN_JIAOTANGMIMI3 then
		nParam = JINGJIAOTANG_TOPLIST
		strFubenName = "大教堂"			
	else
		return
	end

	



	if nFubenType ~= FUBEN_FUTUTA4 then
		if nFubenMode == 0 then
			return
		end
	else
		Type = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE )
		if Type ~= 0 then
			return
		end
	end
	
	local nResult = x700081_CheckFubenTopList(varMap)
	if nResult~=3 and nResult~=6 then
		return
	end

	local nTick = GetFubenData_Param(varMap, x700081_CSP_LAST_TICKOUNT )
	local nTickCount = GetFubenData_Param(varMap, x700081_CSP_TICKCOUNT )

	local humancount = GetFuben_PlayerCount(varMap);

	
	local nowTime = (nTick+nTickCount)*5;
	local nHour = floor(nowTime/3600)
	local nMinute = floor(mod(nowTime,3600)/60)
	local nSec = mod(nowTime,60)
	
	local strTime = "恭喜您仅用了"
	if nHour>0 then
		strTime = strTime..format("%d小时", nHour)
	end
	if nMinute>0 then
		strTime = strTime..format("%d分",nMinute)
	end
	if nSec>0 then
		strTime = strTime..format("%d秒",nSec)
	end

	strTime = strTime.."完成了"..strFubenName.."副本";
	
	x700081_ShowTipsToAll(varMap,strTime)
	
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		SendToplistKeyValue2GL(varMap,humanId,nParam,(nTick+nTickCount)*5)
	end
	
	
end





function x700081_CheckFubenTopList(varMap, nCheckMode)
	if GetSceneType(varMap)~=1 then
		return 1 
	end

	
	local bToplistDisabled = GetFubenData_Param(varMap, x700081_CSP_B_TOPLIST_ABLE )

	if(bToplistDisabled>0) then
		return 2 
	end

	local varScriptFileId = GetFubenData_Param(varMap, 1 )

	

	local bFind = 0;
	local varMaxCount = 0;
	local nStdCampId = 0
	for varI,item in x700081_var_TopListMonsterLimited do
		if item.varScript ==  varScriptFileId then
			bFind = 1;
			varMaxCount = item.varCount;
			nStdCampId = item.campid
			break;
		end
	end

	if(bFind==0) then
		return 3 
	end

	local nFubenType = GetFubenData_Param(varMap, 0 )
	local nFubenMode = GetFubenData_Param(varMap, 255 )

	



	if nFubenType ~= FUBEN_FUTUTA4 then
		if nFubenMode == 0 then
			return 4 
		end
	else
		Type = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE )
		if Type ~= 0 then
			return
		end
	end
	
	local varCount = 0;
	local nMonsterCount = GetMonsterCount(varMap)
	for varI=1,nMonsterCount do
    	local varObj = GetMonsterObjID(varMap,varI-1)

		local nCamp = GetMonsterCamp(varMap,varObj)
    	if nCamp == nStdCampId then  
    		varCount = varCount + 1
    	end
	end

	if(varCount>varMaxCount) then
		if nCheckMode~=nil then
			if nCheckMode==1 then
			else
				SetFubenData_Param(varMap, x700081_CSP_B_TOPLIST_ABLE, 1 )
				x700081_ShowTipsToAll(varMap,"剩余怪物数过多，无法进入排行榜！")
			end
		else
			SetFubenData_Param(varMap, x700081_CSP_B_TOPLIST_ABLE, 1 )
			x700081_ShowTipsToAll(varMap,"剩余怪物数过多，无法进入排行榜！")
		end
		 
		return 5, varCount,varMaxCount 
	end
	return 6


	
end


function x700081_GetTopListText(varMap)
	local nResult, varCount, varMaxCount = x700081_CheckFubenTopList(varMap, 1)

	
	
	if nResult==5 then
		local varStr = "\n#Y排行榜说明：#W剩余怪物数过多，无法进入排行榜！"
		return varStr
	else
		return ""
	end

	


end


function x700081_GetTickTimeByScriptId(varMap, varScriptFileId)
	for varI,item in x700081_var_SpecialTickTimeList do
		if item.varId == varScriptFileId then
			return item.tick
		end
	end

	return x700081_var_DefaultTickTime;
end



function x700081_GetCloseTickByScriptId(varMap, varScriptFileId)
	for varI,item in x700081_var_SpecialCloseTickList do
		if item.varId == varScriptFileId then
			return item.tick
		end
	end

	return x700081_var_DefaultCloseTick;
end




function x700081_GetNextLoopIndex(varMap, varPlayer, varScriptFileId, nFubenType)
	local varNextScript = 0
	local varIndex = 0
	
	if ( varScriptFileId == 700121 ) then
		local loopcount = GetFubenData_Param(varMap, x700081_CSP_LOOPINDEX)
		
		WriteLog(1, "x700081_GetNextLoopIndex：Guid ============== "..GetGUID(varMap, varPlayer)..", loopCount ============== "..loopcount) 
		
		for varI,item in x700081_var_RegisterFuben do
			if item.varId == varScriptFileId and item.fubentype == nFubenType and item.loopindex == loopcount then
				return varI
			end
		end
		
		
	else
		varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)
	
		varNextScript = x700081_var_RegisterFuben[varIndex].nid
	
		if varNextScript ~= 0 then
			return x700081_GetCurrentFubenIndex(varMap, varNextScript, nFubenType)
		end
	end

	return 0
end

function x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)
	local nCostMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)

	if nil == nFubenType then
		for varI,item in x700081_var_RegisterFuben do
			if item.varId == varScriptFileId then
				return varI
			end
		end
	elseif 3 == nFubenType then
		for varI,item in x700081_var_RegisterFuben do
			if item.varId == varScriptFileId and item.fubentype == nFubenType and  nil ~= item.costmode and tonumber(nCostMode) == tonumber(item.costmode) then
				return varI
			end
		end
	else
		for varI,item in x700081_var_RegisterFuben do
			if ( varScriptFileId == 700121 ) then
				local loopcount = GetFubenData_Param(varMap, x700081_CSP_LOOPINDEX)
				if item.varId == varScriptFileId and item.fubentype == nFubenType and item.loopindex == loopcount then
					return varI
				end
			else
				if item.varId == varScriptFileId and item.fubentype == nFubenType then
					return varI
				end
			end
		end
	end

	return 0
end

function x700081_NextLoopFuben( varMap, varPlayer, varScriptFileId )
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	local varIndex = x700081_GetNextLoopIndex(varMap, varPlayer, varScriptFileId, nFubenType )
	
	WriteLog(1, format("x700081_NextLoopFuben --- GUID = %d, varScriptFileId = %d, varIndex = %d", 
							GetGUID(varMap, varPlayer), varScriptFileId, varIndex))
							
	if varIndex <= 0 then
		local varMsg = "Error! varExt loop fuben is fail, varScriptFileId= "..varScriptFileId.."nFubenType= "..nFubenType
		WriteLog(1,varMsg)
		return
	end
	x700081_SaveFubenIndex( varMap, varPlayer, varIndex )
	
	local nFubenType = x700081_var_RegisterFuben[varIndex].fubentype
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE, nFubenType)
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
		

	
	x700081_ProcRequestEnterFuben(varMap, varPlayer, nFubenMode, varIndex);	
	
end

function x700081_GetNextLoopFubenDesc( varMap, varPlayer, varScriptFileId )	
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)

	local varIndex = x700081_GetNextLoopIndex(varMap, varPlayer, varScriptFileId, nFubenType )
	
	if varIndex <= 0 or varIndex > getn(x700081_var_EnterInfoList) then
		local varMsg = "Error! Get varExt loop fuben is fail, varScriptFileId= "..varScriptFileId.."nFubenType= "..nFubenType
		WriteLog(1,varMsg)
		return
	end
	
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		return x700081_var_FutuEnterInfoList[1]
	else
		return x700081_var_EnterInfoList[varIndex]	
	end
end

function x700081_GetEnterFubenDesc( varMap, varPlayer, varScriptFileId )	
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	
	local varIndex = x700081_GetCurrentFubenIndex(varMap , varScriptFileId, nFubenType )
	
	if varIndex <= 0 or varIndex > getn(x700081_var_EnterMenuDescList) then
		local varMsg = "Error! Get varExt loop fuben is fail, varScriptFileId= "..varScriptFileId.."nFubenType= "..nFubenType
		WriteLog(1,varMsg)
		return
	end
	
	return x700081_var_EnterMenuDescList[varIndex]
	
end

function x700081_GetLeaveFubenDesc( varMap, varPlayer, varScriptFileId )	
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	
	local varIndex = x700081_GetCurrentFubenIndex(varMap , varScriptFileId, nFubenType )
	
	if varIndex <= 0 or varIndex > getn(x700081_var_LeaveMenuDescList) then
		local varMsg = "Error! Get varExt loop fuben is fail, varScriptFileId= "..varScriptFileId.."nFubenType= "..nFubenType
		WriteLog(1,varMsg)
		return
	end
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		return x700081_var_FutuLeaveMenuDescList[1]
	else
		return x700081_var_LeaveMenuDescList[varIndex]
	end
end

function x700081_GetTeleportWangchengDesc( varMap, varPlayer, varScriptFileId )	
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local nFubenMode = GetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE)
	
	local varIndex = x700081_GetCurrentFubenIndex(varMap , varScriptFileId, nFubenType )
	
	if varIndex <= 0 or varIndex > getn(x700081_var_TeleportWangchengDescList) then
		local varMsg = "Error! Get varExt loop fuben is fail, varScriptFileId= "..varScriptFileId.."nFubenType= "..nFubenType
		WriteLog(1,varMsg)
		return
	end
	
	return x700081_var_TeleportWangchengDescList[varIndex]
	
end


function x700081_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x700081_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x700081_ProcGroupPlayerLeave(varMap, varPlayer)
	local myGuid = GetPlayerGUID(varMap, varPlayer)
	myGuid = format("%u",myGuid)

	for i= 0 ,35  do
	  local paramidx = x700081_CSP_GROUP_GUID_START + i
	  local guid = GetFubenData_Param(varMap, paramidx)

		guid=format("%u",guid)

		if myGuid == guid then
			SetFubenData_Param(varMap, paramidx, 0)
			break;
		end
  end
end

function x700081_ProcGroupPlayerEnter(varMap, varPlayer, varIndex)

end

function x700081_ClearFubenInfo(varMap, varIndex, nFubenType)
	if 3 == nFubenType then  -- 团队副本
		local igroupId = GetFubenData_Param(varMap, x700081_CSP_GROUPID)   -- 获取团队id
		ClearGroupFubenInfo(varMap, igroupId, varIndex)  -- 清除玩家所在团队的副本进度等信息
		if nil ~= x700081_var_PayForFubenFlagTbl[varMap] then
			x700081_var_PayForFubenFlagTbl[varMap] = nil -- 清除进入副本缴纳道具记录
		end
	end
end

function x700081_ProcGroupPlayerEnterFinished(varMap, varPlayer, varIndex, myGuid, bProcPlayerEnter, varScriptFileId)
	local bFind = 0
	local igroupId = GetFubenData_Param(varMap, x700081_CSP_GROUPID)

	for i= 0 ,35  do
    local paramidx = x700081_CSP_GROUP_GUID_START + i
    local guid = GetFubenData_Param(varMap, paramidx)

		guid = format("%u",guid)
		if myGuid == guid and 0 ~= guid then
			bFind =1
			break;
		end
  end

	if tonumber(bFind) == tonumber(0) then
		local x,z = x700081_GetBackPosition(varMap, varPlayer, varIndex)
		local oldsceneId = GetFubenData_Param(varMap, x700081_CSP_BACKSCENEID);
		NewWorld(varMap, varPlayer, oldsceneId, x, z, varScriptFileId);	
		WriteLog(1,"Fuben KickOut! Reason:".."illeage enter,"..",".. myGuid..","..GetName(varMap, varPlayer))
		return
	end
	
	--处理玩家进入情况，不是所有的副本都有此操作，如果需要此操作，请注册procPlayerEnter标记
	if bProcPlayerEnter == 1 then
		LuaCallNoclosure(varScriptFileId,"ProcPlayerEnter",varMap,varPlayer) --进入副本脚本函数
	end

	local bLoged = 0

	--服务器启动后第一次进入此副本
	if nil == x700081_var_PayForFubenFlagTbl[varMap] then
		x700081_var_PayForFubenFlagTbl[varMap] = {}
	end

	if nil == x700081_var_PayForFubenFlagTbl[varMap][myGuid] then
		x700081_var_PayForFubenFlagTbl[varMap][myGuid] = 0
	elseif 1 == x700081_var_PayForFubenFlagTbl[varMap][myGuid] then
		bLoged = 1
	end

	if bLoged==0 then
		local nRet = x700081_ProcPlayerFirstEnterFuben(varMap,varPlayer, varIndex)
		if nRet>0 then
			x700081_var_PayForFubenFlagTbl[varMap][myGuid] = 1
		else
			return
		end
	end

	local iprocess = GetGroupFubenProcess(varMap, varPlayer, igroupId, varIndex)

	if -1 ~= iprocess then
		x700081_SetGroupSelfFubenProcess(varMap, varPlayer, varIndex, iprocess) --同步团队进度
	end
end

-- 检查团长或者团队成员是否都满足等级要求
function x700081_CheckGroupMemberLevel(varMap, varPlayer, varIndex, bcreateFuben)
	local tips = ""
	local success = 1
	local failed = 0

	if GetLevel(varMap, varPlayer) < x700081_var_LevelRangeList[varIndex][1] then
			tips = GetName(varMap, varPlayer)
	end

	if "" ~= tips then
		if 1 == bcreateFuben then
			tips = tips.."您的等级不符,无法创建副本！"
		elseif 0 == bcreateFuben then
			tips = tips.."您的等级不符,无法进入副本！"
		end

		x700081_ShowTips(varMap, varPlayer, tips)
		return failed
	end

	if GetLevel(varMap, varPlayer) > x700081_var_LevelRangeList[varIndex][2] then
			tips = "玩家"..GetName(varMap, varPlayer)
	end

	if "" ~= tips then
		if 1 == bcreateFuben then
			tips = tips.."您的等级不符,无法创建副本！"
		elseif 0 == bcreateFuben then
			tips = tips.."您的等级不符,无法进入副本！"
		end

		x700081_ShowTips(varMap, varPlayer, tips)
		return failed
	end

	return success
end

-- 检查团长或者团队成员是否都满足等级要求
function x700081_CheckGroupMemberItem(varMap, varPlayer, varIndex, varCostMode, varDestsceneId)
	if GetGameOpenById(1022)<=0 then
		return 0
	end

	local ErrorCode = x700081_IsPlayerErrorState(varMap, varPlayer)
	if ErrorCode~=0 then
		return 0
	end

	if nil ~= varDestsceneId then
		local myGuid = GetPlayerGUID(varMap, varPlayer)
		myGuid = format("%u", myGuid)

		if nil ~= x700081_var_PayForFubenFlagTbl[varDestsceneId] and nil ~= x700081_var_PayForFubenFlagTbl[varDestsceneId][myGuid] and 1 == x700081_var_PayForFubenFlagTbl[varDestsceneId][myGuid] then
			return 1
		end
	end

	if nil ~= varCostMode and varCostMode == 1 then
		if x700081_var_Item_XJ[varIndex].varItem>0 then
			local Num = GetItemCount(varMap, varPlayer, x700081_var_Item_XJ[varIndex].varItem )

			if Num<x700081_var_Item_XJ[varIndex].varCount then
				x700081_ShowTips(varMap, varPlayer, format("您身上@itemid_%d不足%d个",x700081_var_Item_XJ[varIndex].varItem, x700081_var_Item_XJ[varIndex].varCount))
				return 0
			end
		end
	elseif nil ~= varCostMode and varCostMode == 2 then	--ZHOUXJ
		if x700081_var_Item_ZHOUXJ[varIndex].varItem>0 then
			local Num = GetItemCount(varMap, varPlayer, x700081_var_Item_ZHOUXJ[varIndex].varItem )

			if Num<x700081_var_Item_ZHOUXJ[varIndex].varCount then
				x700081_ShowTips(varMap, varPlayer, format("您身上@itemid_%d不足%d个",x700081_var_Item_ZHOUXJ[varIndex].varItem, x700081_var_Item_ZHOUXJ[varIndex].varCount))
				return 0
			end
		end
	end

	return 1
end

function x700081_GetGroupSelfFubenProcess(varMap, varPlayer, varIndex)
	local mdProcess = nil
	local mdlastWeekIndex = nil
	if x700081_var_RegisterFuben[varIndex].varId == 701130 then 
	  	mdProcess = MD_FUBEN_JINGYING_WEEK
	    mdlastWeekIndex = MD_FUBEN_JINGYING_WEEKCOUNT
	else
	 	  mdProcess = x700081_md_List[varIndex][1]
	    mdlastWeekIndex = x700081_md_List[varIndex][2]
	end
	
	local lastWeekIndex = GetPlayerGameData(varMap, varPlayer, mdlastWeekIndex[1], mdlastWeekIndex[2], mdlastWeekIndex[3])
	local curWeekIndex = GetWeekIndex()

	if tonumber(lastWeekIndex) ~= tonumber(curWeekIndex) then
		x700081_SetGroupSelfFubenProcess(varMap, varPlayer, varIndex, 0)
	end
		
	return GetPlayerGameData(varMap, varPlayer, mdProcess[1], mdProcess[2], mdProcess[3])
end

function x700081_SetGroupSelfFubenProcess(varMap, varPlayer, varIndex, nValue)
	local mdProcess = nil
	local mdCurWeekIndex = nil
	
	if x700081_var_RegisterFuben[varIndex].varId == 701130 then 
	  	mdProcess = MD_FUBEN_JINGYING_WEEK
	    mdlastWeekIndex = MD_FUBEN_JINGYING_WEEKCOUNT
	else
	 	  mdProcess = x700081_md_List[varIndex][1]
	    mdlastWeekIndex = x700081_md_List[varIndex][2]
	end
	
	local curWeekIndex = GetWeekIndex()

	SetPlayerGameData(varMap, varPlayer, mdCurWeekIndex[1], mdCurWeekIndex[2], mdCurWeekIndex[3], curWeekIndex)
	SetPlayerGameData(varMap, varPlayer, mdProcess[1], mdProcess[2], mdProcess[3], nValue)
end

-- 检查进入副本条件
function x700081_CheckGroupEnterFubenCondition(varMap, varPlayer, varIndex, varCostMode, varEnterMode)
	local str = "";
	local igroupId = GetGroupId(varMap, varPlayer)
	local iprocess = GetGroupFubenProcess(varMap, varPlayer,igroupId,varIndex)
	local iselfProcess =x700081_GetGroupSelfFubenProcess(varMap, varPlayer, varIndex)
	local destsceneId = GetGroupFubenMapId(varMap, varPlayer, igroupId, varIndex)
	local igroupNum = x700081_GetGroupFubenPlayerCount(destsceneId)

	-- 是否在开放时间
	--if x700081_CheckCommonCondition_Day(varMap, varPlayer,varIndex) == 0 then
	--	return
	--elseif x700081_CheckCommonCondition_Time(varMap, varPlayer,varIndex) == 0 then
	--	return
	-- 是否有团队
	if igroupId < 0 then
		str	= "您不是团队成员，无法进入副本！"
	-- 所在团队是否已有副本
	elseif IsGroupFubenCreateSuccess(varMap, varPlayer,igroupId, varIndex)<=0 then
		str	= "您的团队没有创建副本，无法进入副本！"
	-- 自身进度是否大于团队副本进度
	elseif iselfProcess > iprocess then
		str	= "您的进度不符，无法进入副本！"
		-- 是否处于屠城战期间
	elseif x700081_CheckGroupMemberErrorState_BattleLite(varMap, varPlayer, 0) == 0 then
		return
		-- 是否死亡
	elseif x700081_CheckGroupMemberErrorState_Die(varMap, varPlayer, 0) == 0 then
		return 0
		-- 是否护送任务
	elseif x700081_CheckGroupMemberErrorState_CrashBox(varMap, varPlayer, 0) == 0 then
		return 0
		-- 是否都满足副本等级要求
	elseif x700081_CheckGroupMemberLevel(varMap, varPlayer, varIndex, 0) == 0 then
		return 0
	-- 团队人数是否符合要求
	elseif igroupNum >= x700081_var_LimitMembersList[varIndex] then
			str	= "团队人数过多！"
	elseif x700081_CheckGroupMemberItem(varMap, varPlayer, varIndex, varCostMode, destsceneId) == 0 then
		return 0
	end

	if str ~= "" then
		x700081_ShowTips(varMap, varPlayer, str)
		do return 0 end
	end

	if tonumber(0) == tonumber(varEnterMode) then
		local nGroupPro = BitCount(iprocess)
		local nSelfProc	= BitCount(iselfProcess)
		
		if nGroupPro > nSelfProc then
			OpenGroupFubenProcessConfirm(varMap, varPlayer, x700081_var_FileId, nGroupPro, nSelfProc)
			return 0
		end
	end

	return 1;
end

-- 显示创建或进入团队副本
function x700081_ShowGroupEntrance(varMap, varPlayer, varIndex)
	local igroupId = GetGroupId(varMap, varPlayer)
	local item = ""

	if igroupId < 0 or nil == igroupId then
		igroupId = -1
	end

	local nCostMode = x700081_var_RegisterFuben[varIndex].costmode
	if nil == nCostMode then
		nCostMode = 0
	end

	if nCostMode == 1 then
		if x700081_var_Item_XJ[varIndex].varItem>0 then
			item = format("(@itemid_%d)",x700081_var_Item_XJ[varIndex].varItem)
		end
	elseif nCostMode==2 then	--ZHOUXJ
		if x700081_var_Item_ZHOUXJ[varIndex].varItem>0 then
			item = format("周现金(@itemid_%d)",x700081_var_Item_ZHOUXJ[varIndex].varItem)
		end
	end

	if IsGroupFubenCreateSuccess(varMap, varPlayer, igroupId, varIndex)>0 then
		if "" ~= item then
			if x700081_var_RegisterFuben[varIndex].varId == 700121 then
				TalkAppendButton(varMap, x700081_var_FileId, "进入".."【个人】浮屠塔"..item,14,varIndex)
			else
				TalkAppendButton(varMap, x700081_var_FileId, "进入"..x700081_var_FubenNameList[varIndex]..item,14,varIndex)
			end
		else
			if x700081_var_RegisterFuben[varIndex].varId == 700121 then
				TalkAppendButton(varMap, x700081_var_FileId, "进入".."【个人】浮屠塔",14,varIndex)
			else 
				TalkAppendButton(varMap, x700081_var_FileId, "进入"..x700081_var_FubenNameList[varIndex],14,varIndex)
			end
		end
	else
		if "" ~= item then
			if x700081_var_RegisterFuben[varIndex].varId == 700121 then
				TalkAppendButton(varMap, x700081_var_FileId, "创建".."【个人】浮屠塔"..item,16,varIndex)
			else
				TalkAppendButton(varMap, x700081_var_FileId, "创建"..x700081_var_FubenNameList[varIndex]..item,16,varIndex)
			end
		else
			if x700081_var_RegisterFuben[varIndex].varId == 700121 then
				TalkAppendButton(varMap, x700081_var_FileId, "创建".."【个人】浮屠塔",16,varIndex)
			else
				TalkAppendButton(varMap, x700081_var_FileId, "创建"..x700081_var_FubenNameList[varIndex],16,varIndex)
			end
		end
	end
end

-- 判断是否为创建或进入团队副本
function x700081_ProcRequestEnterGroupFuben(varMap, varPlayer, varIndex, nFubenType, varCostMode, varEnterMode)
	local igroupId = GetGroupId(varMap, varPlayer);

	if igroupId < 0 or nil == igroupId then
		igroupId = -1
	end

	if IsGroupFubenCreateSuccess(varMap, varPlayer,igroupId, varIndex) > 0 then
		local nRet = x700081_CheckGroupEnterFubenCondition(varMap, varPlayer, varIndex, varCostMode, varEnterMode)
		if nRet > 0 then
			x700081_ProcApproveRequestEnterGroupFuben(varMap, varPlayer, varIndex)
		end
	else
		local nRet = x700081_CheckGroupCreateFubenCondition(varMap, varPlayer, varIndex, varCostMode)
		if nRet > 0 then
			x700081_ProcApproveRequestCreateGroupFuben(varMap, varPlayer, varIndex, nFubenType, varCostMode)
		end
	end
end

-- 检查创建团队副本条件
function x700081_CheckGroupCreateFubenCondition(varMap, varPlayer, varIndex, nFubenMode)

	local str = "";
	local igroupId = GetGroupId(varMap, varPlayer);
	local iFubenProc = x700081_var_RegisterFuben[varIndex].process

		--是否有团队
	if igroupId < 0 then
		str	= "您不在团队中！"
		-- 是否团长
	elseif IsGroupLeader(varMap, varPlayer)<=0 then
		str	= "您不是团长，无法创建副本！"
		-- 所在团队是否已有副本
	elseif nil ~= iFubenProc and	x700081_GetGroupSelfFubenProcess(varMap, varPlayer, varIndex)>= iFubenProc then
		str	= "本周此副本已完成，等待下周进入！"
		-- 检查等级是否符合要求
	elseif x700081_CheckGroupMemberLevel(varMap, varPlayer, varIndex, 1) == 0 then
		return 0
		-- 是否处于屠城战期间
	elseif x700081_CheckGroupMemberErrorState_BattleLite(varMap, varPlayer, 1) == 0 then
		return
		-- 是否死亡
	elseif x700081_CheckGroupMemberErrorState_Die(varMap, varPlayer, 1) == 0 then
		return 0
		-- 是否护送任务
	elseif x700081_CheckGroupMemberErrorState_CrashBox(varMap, varPlayer, 1) == 0 then
		return 0
	elseif x700081_CheckGroupMemberItem(varMap, varPlayer, varIndex, nFubenMode) == 0 then
		return 0
	end

	if str ~= "" then
		x700081_ShowTips(varMap, varPlayer, str)
		do return 0 end
	end

	return 1;
end

-- 创建团队副本
function x700081_ProcApproveRequestCreateGroupFuben(varMap, varPlayer, varIndex, nFubenType, VarCostMode)
  local ErrorCode = x700081_IsPlayerErrorState(varMap, varPlayer)

  if ErrorCode == 0 then
      --进入副本状态
      SetPlayerMutexState( varMap, varPlayer , PLAYER_STATE_READYFUBEN ,1)
  end
  
	local sceneParamList ={}
	for varI=0, 383 do
		local nValue = GetFubenData_Param(varMap, varI)
		sceneParamList[varI+1] = nValue
	end

	local leaderguid = ObjId2Guid(varMap, varPlayer);

	SetFubenData_Param(varMap, x700081_CSP_LAST_TICKOUNT ,0 )
	SetFubenData_Param(varMap,x700081_CSP_PLAYER_DEAD, 0)
	SetSceneLoad_Map(varMap, x700081_var_SceneMapNavPathList[varIndex]);			   --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	SetFubenData_TeamLeader(varMap, leaderguid)
	SetFubenData_NoUserCloseTime(varMap, x700081_var_NoUserTime * 1000);            --场景没人的保留时间

	local nTickTime = x700081_GetTickTimeByScriptId(varMap, x700081_var_RegisterFuben[varIndex].varId)
	SetFubenData_Timer(varMap, nTickTime * 1000);                        --设置定时器触发频率
	SetFubenData_Param(varMap, x700081_CSP_TICKTIME, nTickTime);
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		SetFubenData_Param(varMap, x700081_CSP_FUBENTYPE, FUBEN_FUTUTA);
	else
		SetFubenData_Param(varMap, x700081_CSP_FUBENTYPE, x700081_var_FubenTypeList[varIndex]);	--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	end
	SetFubenData_Param(varMap, x700081_CSP_SCRIPTID, x700081_var_RegisterFuben[varIndex].varId)	--将1号数据设置为副本场景事件脚本号
	SetFubenData_Param(varMap, x700081_CSP_TICKCOUNT, 0);							--设置定时器调用次数
	SetFubenData_Param(varMap, x700081_CSP_BACKSCENEID, -1);						--设置副本入口场景号, 初始化
	SetFubenData_Param(varMap, x700081_CSP_ISCLOSING, 0);							--设置副本关闭标志, 0开放，1关闭
	SetFubenData_Param(varMap, x700081_CSP_LEAVECOUNTDOWN, 0);						--设置离开倒计时次数
  SetFubenData_Param(varMap, x700081_CSP_HUMAN_COUNT, x700081_var_LimitMembersList[varIndex]) -- 保存进入副本最大人数限制
  SetFubenData_Param(varMap, x700081_CSP_IS_ROOM, 0)
  SetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN, 0)
	local nHodeTime
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		nHoldTime = 540
	else 
		nHoldTime = x700081_var_LimitTotalHoldTimeList[varIndex]
	end
	SetFubenData_Param(varMap, x700081_CSP_HOLDTIME, nHoldTime);

	local nCloseTick =  x700081_GetCloseTickByScriptId(varMap, x700081_var_RegisterFuben[varIndex].varId)
	SetFubenData_Param(varMap, x700081_CSP_CLOSETICK, nCloseTick);

	--保存副本类型
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE ,nFubenType)

	--保存副本模式
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE ,VarCostMode)

	local level = GetLevel(varMap,varPlayer)
	SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, level)
	
	for i,item in x700081_var_ReliveModeTbl do
		if x700081_var_ReliveModeTbl[i] ~= nil and tonumber(x700081_var_RegisterFuben[varIndex].varId) == tonumber(x700081_var_ReliveModeTbl[i]) then
			SetFubenData_OnlyReliveFixedPos(varMap, 1)-- 设置复活模式   1:只允许在固定点复活
			break
		end
	end

	local bRetSceneID = CreateFuben(varMap); 										--初始化完成后调用创建副本函数
	
	for varI=0, 383 do
		local nValue = sceneParamList[varI+1]
		SetFubenData_Param(varMap, varI, nValue)
	end

  if bRetSceneID > 0 then
      StartTalkTask(varMap);
      TalkAppendString(varMap, x700081_var_FuBenCreateOK);
      StopTalkTask();
      DeliverTalkTips(varMap, varPlayer);
  else
      StartTalkTask(varMap);
      TalkAppendString(varMap, x700081_var_FuBenCreateFailed);
      StopTalkTask();
      DeliverTalkTips(varMap, varPlayer);

      -- unlock
      SetPlayerMutexState( varMap,varPlayer ,PLAYER_STATE_READYFUBEN, 0)
  end
end

-- 进入团队副本
function x700081_ProcApproveRequestEnterGroupFuben(varMap, varPlayer, varIndex)
	if x700081_var_RegisterFuben[varIndex].enterLog ~= nil then
		GamePlayScriptLog(varMap, varPlayer, x700081_var_RegisterFuben[varIndex].enterLog)
	end

	local igroupId = GetGroupId(varMap, varPlayer)
	local destsceneId = GetGroupFubenMapId(varMap, varPlayer, igroupId, varIndex)
	local nFromSceneId = GetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID)

	if nil == destsceneId or destsceneId < 0 then
		WriteLog(1, "destsceneId error!")
		return
	end

	if nFromSceneId<0 then
		if IsPlayerStateNormal(varMap, varPlayer) > 0 then
			local countryId = GetCurCountry( varMap, varPlayer )
			if x700081_var_RegisterFuben[varIndex].varId == 700121 then 
				SetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID, x700081_var_FutuBackSceneList[1][countryId+1]);
			else
				SetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID, x700081_var_BackSceneList[varIndex][countryId+1]);--设置副本入口场景号
			end
		end
	end

	local ErrorCode = x700081_IsPlayerErrorState(varMap, varPlayer)
	if ErrorCode == 0 then --正常游戏状态
		local pos = random(1,6)
		local x,z
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			x = 44
			z = 84
		elseif x700081_var_RegisterFuben[varIndex].varId == 701130 then
		    local pos2 = random(1,4)
				x = x700081_var_EnterPosList[varIndex][pos2].varX
				z = x700081_var_EnterPosList[varIndex][pos2].z
				SetFubenData_Param(destsceneId, x700081_CSP_ENTER_POS_INDEX, pos2)
		else		
			x = x700081_var_EnterPosList[varIndex][pos].varX
			z = x700081_var_EnterPosList[varIndex][pos].z
		end

		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,destsceneId) == 1 then
			local guid = GetPlayerGUID(varMap, varPlayer)
			guid = format("%u", guid)
			-- 设置玩家进入团队副本标识
			for i = 0, 35 do
				local paramidx = x700081_CSP_GROUP_GUID_START + i
				local memberid = GetFubenData_Param(destsceneId, paramidx)
				memberid  = format("%u", memberid)
				if format("%u", 0)== memberid then
					-- 设置在目标地图副本数据中
					SetFubenData_Param(destsceneId, paramidx , guid)
					break
				elseif guid == memberid then
					break
				end
			end
			NewWorld(varMap, varPlayer, destsceneId, x, z, x700081_var_FileId);
		end
	end

	if IsPlayerStateNormal(varMap,varPlayer) > 0 then
		-- unlock
		SetPlayerMutexState( varMap,varPlayer ,PLAYER_STATE_READYFUBEN ,0)
	end
end

function x700081_ProcMapQuit(varMap)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID)
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)
	
	if ( varScriptFileId ~= 700121 ) then
		if varIndex <= 0 or varIndex > getn(x700081_var_LeaveMenuDescList) then
			local varMsg = "Error! x700081_ProcMapQuit Get fuben index fail, varScriptFileId= "..varScriptFileId.."nFubenType= "..nFubenType
			WriteLog(1, varMsg)
			return
		end
	end

	if tonumber(3) == tonumber(nFubenType) then
		x700081_ClearFubenInfo(varMap, varIndex, nFubenType)  -- 副本关闭，玩家离开副本前清除与副本关联的数据
	end
end

function x700081_ProcPlayerRelive(varMap, playerId, ReliveType)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID)
  LuaCallNoclosure(varScriptFileId,"ProcPlayerRelive", varMap, playerId, ReliveType)
end

-- 对团队副本参数等做一些初始化,只有创建团队副本的玩家才会进入此函数
function x700081_ProcFubenReady_Group(varMap, destsceneId)	
	local leaderguid = GetFubenData_TeamLeader(destsceneId)
	local leaderObjId = Guid2ObjId(varMap, leaderguid)
	local varIndex = x700081_GetFubenIndex(varMap, leaderObjId)
	local varScriptFileId = x700081_var_RegisterFuben[varIndex].varId

	for varI=20, 239 do
			SetFubenData_Param(destsceneId,varI,0)
	end

	for i=320, 383 do
		SetFubenData_Param(destsceneId, i, 0)
	end

	local igroupId = GetGroupId(varMap, leaderObjId)   -- 获取团队id

  SetFubenData_Param(destsceneId, x700081_CSP_GROUPID, igroupId); 	--保存团队号
	SetFubenData_Param(destsceneId, x700081_CSP_GROUP_GUID_START , leaderguid) -- 设置团长进入标识

	SetFubenData_Param(destsceneId, x700081_CSP_FUBEN_SCENE_ID, destsceneId)   -- 保存副本场景号
	SetGroupFubenCreateFlag(varMap, leaderObjId, igroupId, varIndex, 1) 	-- 设置副本创建成功的标识

	local iProcess = x700081_GetGroupSelfFubenProcess(varMap, leaderObjId, varIndex) -- 获取团队团长进度
	SetGroupFubenProcess(varMap, leaderObjId, igroupId, varIndex, iProcess)		-- 设置副本进度
	SetGroupFubenMapId(varMap, leaderObjId, igroupId, varIndex, destsceneId)  -- 设置副本地图

	--进入副本DEBUG信息
  local msg = "CSD,EnterFuben,"..varScriptFileId..","..destsceneId

	if x700081_var_RegisterFuben[varIndex].enterLog ~= nil then
		GamePlayScriptLog(varMap, leaderObjId, x700081_var_RegisterFuben[varIndex].enterLog)
	end

	local nFromSceneId = GetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID)

	if nFromSceneId<0 then
		if IsPlayerStateNormal(varMap,leaderObjId ) > 0 then
			local countryId = GetCurCountry( varMap, leaderObjId )
			if x700081_var_RegisterFuben[varIndex].varId == 700121 then
				SetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID, x700081_var_FutuBackSceneList[1][countryId+1]);
			else
				SetFubenData_Param(destsceneId, x700081_CSP_BACKSCENEID, x700081_var_BackSceneList[varIndex][countryId+1]);--设置副本入口场景号
			end
		end
	end

	local ErrorCode = x700081_IsPlayerErrorState(varMap, leaderObjId)

	if ErrorCode == 0 then --正常游戏状态
		local pos = random(1,6)
		local varX,z
		if x700081_var_RegisterFuben[varIndex].varId == 700121 then
			varX = 44
			z = 84	
		elseif x700081_var_RegisterFuben[varIndex].varId == 701130 then
		    local pos2 = random(1,4)
				x = x700081_var_EnterPosList[varIndex][pos2].varX
				z = x700081_var_EnterPosList[varIndex][pos2].z
				SetFubenData_Param(destsceneId, x700081_CSP_ENTER_POS_INDEX, pos2)
		else		
			varX = x700081_var_EnterPosList[varIndex][pos].varX
			z = x700081_var_EnterPosList[varIndex][pos].z
		end

		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,leaderObjId,destsceneId) == 1 then
			NewWorld(varMap, leaderObjId, destsceneId, varX, z, x700081_var_FileId);
			msg = msg..","..leaderguid
		end
	end

	if IsPlayerStateNormal(varMap,leaderObjId ) > 0 then
		SetPlayerMutexState( varMap,leaderObjId ,PLAYER_STATE_READYFUBEN , 0)
	end

 	--x700081_SaveFubenIndex(varMap, leaderObjId, -1)
  	WriteLog(1,msg)
end

---------------------------------------------------------------------------------------------------
--团队成员是否处于屠城战状态
---------------------------------------------------------------------------------------------------
function x700081_CheckGroupMemberErrorState_BattleLite(varMap, varPlayer, bcreateFuben)
  local tips = ""
  local result = 1

	if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteFubenTrans",varMap,varPlayer) == 0 then --如果处于屠城战状态
      tips = GetName(varMap, varPlayer)
	end

	if "" ~= tips then
		if 1 == bcreateFuben then
			tips = tips.."屠城战期间,无法创建副本！"
		elseif 0 == bcreateFuben then
			tips = tips.."屠城战期间,无法进入副本！"
		end

		x700081_ShowTips(varMap, varPlayer, tips)
		result = 0
	end

	return result
end

---------------------------------------------------------------------------------------------------
--团队成员是否处于死亡状态
---------------------------------------------------------------------------------------------------
function x700081_CheckGroupMemberErrorState_Die( varMap, varPlayer, bcreateFuben)
  local tips = ""
  local result = 1

  local state = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
  if state == 1 then
     tips = GetName(varMap, varPlayer)
  end

	if "" ~= tips then
		if 1 == bcreateFuben then
			tips = tips.."您处于死亡状态,无法创建副本！"
		elseif 0 == bcreateFuben then
			tips = tips.."您处于死亡状态,无法进入副本！"
		end

		x700081_ShowTips(varMap, varPlayer, tips)
		result = 0
	end

	return result
end

---------------------------------------------------------------------------------------------------
--团队成员是否处于运镖状态
---------------------------------------------------------------------------------------------------
function x700081_CheckGroupMemberErrorState_CrashBox( varMap, varPlayer, bcreateFuben)
  local tips = ""
  local result = 1

  local state = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
  if state == 1 then
     tips = GetName(varMap, varPlayer)
  end

	if "" ~= tips then
		if 1 == bcreateFuben then
			tips = tips.."您有护送任务,无法创建副本！"
		elseif 0 == bcreateFuben then
			tips = tips.."您有护送任务,无法进入副本！"
		end

		x700081_ShowTips(varMap, varPlayer, tips)
		result = 0
	end

	return result
end

function x700081_DeleteNpcAfterEnter(varMap, varPlayer)
	if x700081_var_FuBenTalkNpc[varPlayer] ~= nil and x700081_var_FuBenTalkNpc[varPlayer] ~= -1 then
		local nMonstGuid = GetMonsterGUID(varMap, x700081_var_FuBenTalkNpc[varPlayer])
		for i, item in x700081_var_DeleteFuBenTalkNpc do
			if	-1 ~= nMonstGuid and item.varNpcGuid == nMonstGuid then
				LuaCallNoclosure(item.varScript,"DeleteNpc", varMap, x700081_var_FuBenTalkNpc[varPlayer])
				x700081_var_FuBenTalkNpc[varPlayer] = -1
				break
			end
		end
	end
end

function x700081_RecordEnterCoordinate(varMap, varPlayer, varIndex)
	local x,z = GetWorldPos(varMap,varPlayer)
	x700081_SetMD( varMap, varPlayer, x700081_md_List[varIndex][3], x)
	x700081_SetMD( varMap, varPlayer, x700081_md_List[varIndex][4], z)
end

function x700081_ProcConformFubenProcess(varMap, varPlayer)
	local nIndex = x700081_GetFubenIndex(varMap, varPlayer)
	local nFubenType = x700081_var_RegisterFuben[nIndex].fubentype
	local nCostMode = x700081_var_RegisterFuben[nIndex].costmode
	x700081_ProcRequestEnterGroupFuben(varMap, varPlayer, nIndex, nFubenType, nCostMode, 1)
end

function x700081_CheckLawlessEnter(varMap, varPlayer, varIndex, varMode, nType)
	local varScriptFileId = x700081_var_RegisterFuben[varIndex].varId

	--该判定有问题，目前值 x700081_var_DeleteFuBenTalkNpc 配置值 varScriptFileId 不会等于 item.varFubenScript
	--需修改 x700081_var_DeleteFuBenTalkNpc 配置后才会进行冥王秘境 NPC 进入判定
	for i, item in x700081_var_DeleteFuBenTalkNpc do
		if item.varFubenScript ~= nil and varScriptFileId == item.varFubenScript then
			local monsterId = x700081_var_FuBenTalkNpc[varPlayer]
			local longGuid = GetPlayerGUID(varMap, varPlayer)
			local msgTip = "x700081_CheckLawlessEnter:".."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"

			if nil == monsterId or -1 == monsterId then
				WriteLog(1, msgTip)
				return 0
			end

			local monstrGuid = GetMonsterGUID(varMap, monsterId)

			if nil == monstrGuid or -1 == monstrGuid then
				WriteLog(1, msgTip)
				return 0
			end
			
			local find = 0

			-- 判断npc是否存活
			for j, child in x700081_var_DeleteFuBenTalkNpc do
				if child.varNpcGuid == monstrGuid then
					find = 1
					break
				end
			end

			if find <= 0 then
				WriteLog(1, msgTip)
				return 0
			end

			-- 判断与点击的npc的距离
			if 0 == IsInDist(varMap, varPlayer, monsterId, 5) then
				WriteLog(1, msgTip)
				return 0
			end
		end
	end

	-- 对不再后花园的进入请求认定为外挂
	if varScriptFileId == 700119 and varMap ~= 44 then
		WriteLog(1, format("x700081_CheckLawlessEnter PB varMap=%d PlayerGUID=%X", varMap, GetGUID(varMap, varPlayer)))
		return 0
	end

	return 1
end

function x700081_GetGroupFubenPlayerCount(varMap)
	local nCount = 0

	for i= 0 ,35  do
	  local paramidx = x700081_CSP_GROUP_GUID_START + i
	  local guid = GetFubenData_Param(varMap, paramidx)

		if tonumber(0) ~= tonumber(guid) then
			nCount = nCount + 1
		end
  end

  return nCount
end


---------------------------------------------------------------------------------
--查找副本玩家数据
---------------------------------------------------------------------------------
function x700081_FindFubenPlayer(varMap,nGUID)
	
	for i=0, FUBEN_GROUP_COUNT-1 do
		for j=0,FUBEN_GROUP_TEAM_COUNT-1 do
			for k=0,FUBEN_GROUP_TEAM_PLAYER_COUNT-1 do
				local _GUID,nWorldID,nLevel,nGuildID,nCountryID,nTmpCamp = GetFubenData_Player(varMap, i ,j,k )
					--WriteLog(1, "guid " .. _GUID .. " world " .. nWorldID .. " Level:" .. nLevel .. " nGuildID:" .. nGuildID .. " nTmpCamp:" .. nTmpCamp)
				if _GUID ~= -1 and _GUID == tonumber(nGUID) then
					return 1,i,j,k,_GUID,nWorldID,nLevel,nGuildID,nCountryID,nTmpCamp
				end
				
			end
		end
	end
	return 0
	
end
----------------------------------------------------
--进入退出副本时的buffer清除处理
----------------------------------------------------
function x700081_ClearGuanQiaBuffer(varMap, varPlayer)

	if x700081_IsMutlMap(varMap) == 1 then
			for i, item in 	x700081_var_GuanqiaBufferClearList do
				if item >= 0  and IsHaveSpecificImpact(varMap, varPlayer, item) == 1 then
					CancelSpecificImpact(varMap, varPlayer, item);
				end		
			end
	end		
end

----------------------------------------------------
--进入副本时的buffer增加处理
----------------------------------------------------
function x700081_AddGuanQiaCDBuffer(varMap, varPlayer)

	local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)			
--	if nIsRoom == nil or nIsRoom ~= 1 then
--		--不是跨服副本直接返回
--		return
--	end
	
	--获副本类型 0非副本,本地副本 1跨服普通副本 2跨服战场 3跨服英雄副本 10 决斗场
	local nGuanQiaType = GetSceneTypeForFuBen(varMap)
	if nGuanQiaType == 10 then
		return
	end
	
	--玩家使用跨界系统进入副本后将在之后10分钟内无法再次使用跨界系统
	--增加一个10分钟buffer
	if IsHaveSpecificImpact(varMap, varPlayer, x700081_var_GuanQiaCDBuff) == 1 then
		CancelSpecificImpact(varMap, varPlayer, x700081_var_GuanQiaCDBuff);
	end		
	SendSpecificImpactToUnit(varMap,varPlayer, varPlayer,varPlayer,x700081_var_GuanQiaCDBuff,0)	
	
	--WriteLog(1, "################# addBuffer" ..x700081_var_GuanQiaCDBuff )
	
	
	--30分钟内强退出副本buffer,副本正常结束后清除
--	if IsHaveSpecificImpact(varMap, varPlayer, 27) == 1 then
--		CancelSpecificImpact(varMap, varPlayer, 27);
--	end
--	SendSpecificImpactToUnit(varMap,varPlayer, varPlayer,varPlayer,27,0)
		
end

----------------------------------------------------
--退出副本时的buffer增加处理
----------------------------------------------------
function x700081_ClearGuanQiaCDBuffer(varMap, varPlayer)
	local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)			
	if nIsRoom == nil or nIsRoom ~= 1 then
		--不是跨服副本直接返回
		return
	end
	
	--30分钟内强退出副本buffer,副本正常结束后清除
--	if IsHaveSpecificImpact(varMap, varPlayer, 27) == 1 then
--		CancelSpecificImpact(varMap, varPlayer, 27);
--	end
end

---------------------------------------------------------------------------------------------------
--初始化自动等级for room
---------------------------------------------------------------------------------------------------
function x700081_InitAutoLevel_Room( varMap,autoleveltype )

	--todo 需要和策划确定方案 for 副本搜索器 add by Michael Lin 2011-07-21
	-----------------	
	if autoleveltype == 0 then          -- 最高等级匹配

		--取得房间里玩家最高等级
		local maxlevel = 1;		
		--todo
		
    SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, maxlevel) ;	--配置副本等级

  elseif autoleveltype == 1 then      -- 最低等级匹配

   	--取得房间里玩家最低等级
		local minlevel = 1;
		--todo
		
    SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, minlevel) ;	--配置副本等级

  elseif autoleveltype == 2 then      --平均等级匹配
  
	  --计算平均等级
	  local averagelevel = 1;
		--todo
	
	  SetFubenData_Param(varMap, x700081_CSP_FUBENLEVEL, averagelevel) ;					--配置副本等级
	  
    end		
end

--------------------------------------------
--副本中玩家退出时切换场景处理
--------------------------------------------
function x700081_ExcutePlayerNewWorld(varMap, varPlayer)

		local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
		local nScriptId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
		--检查
		local nIndex =-1
		for i,item in x700081_var_RegisterFuben do		
			if item.varId == nScriptId and item.fubentype==nFubenType  then
				nIndex = i
				break
			end
		end
		
		if nIndex == -1 then
			return
		end
	
		--清除跨服副本buffer列表
		x700081_ClearGuanQiaBuffer(varMap, varPlayer);
		
		--执行传送
		nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)
		if nIsRoom == 1 then --跨服副本退出处理，包括三番，也是记录第一个跨服之前的这个位置
				--取得备份场景
				local scenePre = GetPlayerGameData(varMap, varPlayer, MD_HUMAN_SCENE_PRE[1], MD_HUMAN_SCENE_PRE[2], MD_HUMAN_SCENE_PRE[3])				
				scenePre = scenePre - 1				
				if scenePre >= 0 then
				  --取得备份坐标
				  local CurX = GetPlayerGameData(varMap, varPlayer, MD_HUMAN_POSX_PRE[1], MD_HUMAN_POSX_PRE[2], MD_HUMAN_POSX_PRE[3])
				  local CurZ = GetPlayerGameData(varMap, varPlayer, MD_HUMAN_POSZ_PRE[1], MD_HUMAN_POSZ_PRE[2], MD_HUMAN_POSZ_PRE[3])				
				  
					SetPlayerGameData(varMap, varPlayer, MD_HUMAN_SCENE_PRE[1], MD_HUMAN_SCENE_PRE[2], MD_HUMAN_SCENE_PRE[3],0)
					SetPlayerGameData(varMap, varPlayer, MD_HUMAN_POSX_PRE[1],	 MD_HUMAN_POSX_PRE[2], MD_HUMAN_POSX_PRE[3],0)
					SetPlayerGameData(varMap, varPlayer, MD_HUMAN_POSZ_PRE[1],  MD_HUMAN_POSZ_PRE[2],  MD_HUMAN_POSZ_PRE[3],0)						  						
								  
				  NewWorld(varMap, varPlayer, scenePre, CurX, CurZ, nScriptId);
				end	
		else --单服副本退出处理
			local oldsceneId = GetFubenData_Param(varMap, x700081_CSP_BACKSCENEID);
			local x,z = x700081_GetBackPosition(varMap, varPlayer, nIndex)
			NewWorld(varMap, varPlayer, oldsceneId, x, z, nScriptId);
		end   						
			
end

---------------------------------------------------------------------------------
--根据创建副本房间
---------------------------------------------------------------------------------
function x700081_ProcMakeRoom(varMap, nRoomType)	

	local nIndex = x700081_GetIndexByRoomType(nRoomType)	
	if nIndex <= 0 then
		return 0
	end

	--取得相关数据
	local nTickTime = x700081_GetTickTimeByScriptId(varMap, x700081_var_RegisterFuben[nIndex].varId)
	local nHoldTime
	if x700081_var_RegisterFuben[nIndex].varId == 700121 then
		nHoldTime =540
	else
		nHoldTime = x700081_var_LimitTotalHoldTimeList[nIndex]
	end
	local nCloseTick =  x700081_GetCloseTickByScriptId(varMap, x700081_var_RegisterFuben[nIndex].varId)
	local nType = x700081_GetFubenType(nIndex)
	
	x700081_CheckFubenTopList(varMap)

	--设置副本参数
	SetSceneLoad_Map(varMap, x700081_var_SceneMapNavPathList[nIndex]);			   			--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	SetFubenData_TeamLeader(varMap, -1);   												--设置队长ID
	SetFubenData_NoUserCloseTime(varMap, x700081_var_NoUserTime * 1000);            			--场景没人的保留时间
	SetFubenData_Timer(varMap, nTickTime * 1000);                        					--设置定时器触发频率	
	SetFubenData_Param(varMap, x700081_CSP_TICKTIME, nTickTime);							--设置Tick间隔
	if x700081_var_RegisterFuben[nIndex].varId == 700121 then
		SetFubenData_Param(varMap, x700081_CSP_FUBENTYPE, FUBEN_FUTUTA);
	else
		SetFubenData_Param(varMap, x700081_CSP_FUBENTYPE, x700081_var_FubenTypeList[nIndex]);	--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	end
	SetFubenData_Param(varMap, x700081_CSP_SCRIPTID, x700081_var_RegisterFuben[nIndex].varId)	--将1号数据设置为副本场景事件脚本号	
	SetFubenData_Param(varMap, x700081_CSP_TICKCOUNT, 0);									--设置定时器调用次数
	SetFubenData_Param(varMap, x700081_CSP_BACKSCENEID, -1);								--设置副本入口场景号, 初始化
	SetFubenData_Param(varMap, x700081_CSP_ISCLOSING, 0);									--设置副本关闭标志, 0开放，1关闭
	SetFubenData_Param(varMap, x700081_CSP_LEAVECOUNTDOWN, 0);								--设置离开倒计时次数
  SetFubenData_Param(varMap, x700081_CSP_TEAMID, -1); 									--保存队伍号	
	SetFubenData_Param(varMap, x700081_CSP_HOLDTIME, nHoldTime);							--设置副本的总时间
	SetFubenData_Param(varMap, x700081_CSP_CLOSETICK, nCloseTick);							--设置副本的总TICK
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE ,nType )								--保存副本类型	
	SetFubenData_Param(varMap, x700081_CSP_LAST_TICKOUNT ,0 )
	SetFubenData_Param(varMap, x700081_CSP_PLAYER_DEAD, 0)
	SetFubenData_Param(varMap, x700081_CSP_IS_ROOM, 1)
	SetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN , 0)							--默认不ROOM是三番
	SetFubenData_Param(varMap, x700081_CSP_FUBEN_MODE, x700081_var_SearchCorpsDefaultMode)         			  --目前跨服只有三番

	--处理级别
	x700081_InitAutoLevel_Room(varMap,2);
	return 1
		
end

---------------------------------------------------------------------------------
--请求拉人操作
---------------------------------------------------------------------------------
function x700081_ProcEnterRoom(varMap,varPlayer,dstSceneId,dstX,dstZ,bakSceneId,bakPosX,bakPosZ)
	
	--进行一些状态检查处理操作
		--场景检查
		if varMap == dstSceneId then
			return
		end
		
		if GetSceneType(varMap) ~= 0 then
				StartTalkTask(varMap)
		    TalkAppendString( varMap, "处于副本或战场中不能传送" );
		    StopTalkTask(varMap)
		    DeliverTalkTips(varMap,varPlayer)
		    return
		end
		
	  --检查状态
		local state,msgState = LuaCallNoclosure(CHUANSONG_SCENEMAP_SCRIPT,"BattleTransCheckPlayerState", varMap,varPlayer)		
		if state == 1 then		    
		    StartTalkTask(varMap)
		    TalkAppendString( varMap, msgState );
		    StopTalkTask(varMap)
		    DeliverTalkTips(varMap,varPlayer)
		    return
		end
		
	--玩家检查GUID检查
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	if myGuid == nil or myGuid == -1 then
		 return
	end
	
	--保存玩家当前所在场景及位置到MD
	local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
	SetPlayerGameData(varMap, varPlayer, MD_HUMAN_SCENE_PRE[1], MD_HUMAN_SCENE_PRE[2], MD_HUMAN_SCENE_PRE[3],varMap + 1) -- +1是把0号做为无效值来存
	SetPlayerGameData(varMap, varPlayer, MD_HUMAN_POSX_PRE[1],	 MD_HUMAN_POSX_PRE[2], 	MD_HUMAN_POSX_PRE[3],nCurX)
	SetPlayerGameData(varMap, varPlayer, MD_HUMAN_POSZ_PRE[1],  MD_HUMAN_POSZ_PRE[2],  MD_HUMAN_POSZ_PRE[3],nCurZ)

	-- 进入副本或战场前把随机搜索标记保存到MD，避免中途掉线再回来领不了奖励
   --GetPlayerGameData( varMap, varPlayer, MD_GUANKA_RANDOM_FLAG[1], MD_GUANKA_RANDOM_FLAG[2], MD_GUANKA_RANDOM_FLAG[3], GetPlayerRuntimeData( varMap, varPlayer, RD_GUANKA_RANDOM_SEARCH_MODE ) )

	--执行切场景操作
	NewWorldEx(varMap,varPlayer,dstSceneId,dstX,dstZ,bakSceneId,bakPosX,bakPosZ,700081)
	
	--记录日志
	local msgEnter = format("ProcEnterRoom,GUID:%s,Name:%s,Cscene[%d,%f,%f],Dscene[%d,%f,%f],Bscene[%d,%f,%f]",
											myGuid,GetName(varMap,varPlayer),
											varMap,nCurX,nCurZ,
											dstSceneId,dstX,dstZ,
											bakSceneId,bakPosX,bakPosZ);
											
	WriteLog(1,msgEnter);
	
end

---------------------------------------------------------------------------------
--退出副本
---------------------------------------------------------------------------------
function x700081_ProcExitRoom(varMap,varPlayer)
	
	local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)			
	if nIsRoom == nil or nIsRoom ~= 1 then--不是跨服副本直接返回		
		return
	end
		
	--玩家检查GUID检查
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	if myGuid == nil or myGuid == -1 then
		 return
	end
			
	--传出副本
	x700081_ExcutePlayerNewWorld(varMap,varPlayer)
	
	--记录日志
	local msgEnter = format("x700081_ProcExitRoom,GUID:%s,Name:%s,scene:%d.",
											myGuid,GetName(varMap,varPlayer),varMap);

	WriteLog(1,msgEnter);	
	
end

---------------------------------------------------------------------------------------------------
--跨服房间已经准备完毕，此时可执行一些必要的脚本处理
---------------------------------------------------------------------------------------------------
function x700081_OnFubenReady_Room(varMap, destsceneId)
	
	--副本data初始化
	for i=20, 239 do
			SetFubenData_Param(destsceneId,i,0)
	end
	
	--副本模式	
	local nMode = GetFubenData_Param(destsceneId, x700081_CSP_FUBEN_MODE )
	
	--保存副本场景号
	SetFubenData_Param(destsceneId, x700081_CSP_FUBEN_SCENE_ID, destsceneId);
	
	--房间逻辑脚本号
	local nScriptId = GetFubenData_Param(destsceneId, x700081_CSP_SCRIPTID)
	
	--fubenready的时候就已经有了军团信息，直接进行自适应等级
	local allLevel = 0
	local memNumber = 0
		for i=0, FUBEN_GROUP_COUNT-1 do
		for j=0,FUBEN_GROUP_TEAM_COUNT-1 do
			for k=0,FUBEN_GROUP_TEAM_PLAYER_COUNT-1 do
				local _GUID,nWorldID,nLevel,nGuildID,nCountryID,nTmpCamp = GetFubenData_Player(destsceneId, i ,j,k )				
				if _GUID ~= -1  then
					allLevel = allLevel + nLevel
					memNumber = memNumber + 1
				end				
			end
		end
	end
	
	WriteLog(1, "memNumber" .. memNumber .. "allLevel" .. allLevel)
	if memNumber > 0 then
		local midLevel = allLevel / memNumber
		SetFubenData_Param(destsceneId, x700081_CSP_FUBENLEVEL, midLevel)
		WriteLog(1, "midLevel" .. midLevel .. "midLevel" .. midLevel)
	end
	

	--写日志
  local msg = format("OnRoomReady,si:%d,ssi:%d,dsi:%d,m:%d.",nScriptId,varMap,destsceneId,nMode);	
  WriteLog(1,msg)	

end

--------------------------------------------------------------
--是否跨服第一次关卡（房间且不是三番）
--------------------------------------------------------------
function x700081_IsMutlMap(varMap)
	local nIsRoom = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM)
	local nIsRoom3Fan = GetFubenData_Param(varMap, x700081_CSP_IS_ROOM_3FAN)
	if nIsRoom == 1 and nIsRoom3Fan ~= 1 then
		return 1
	end	
	return 0
end

--------------------------------------------------------------
--查找军团队友方法（全场景还是Grid经验范围内）（三番传送检测）
--------------------------------------------------------------
function x700081_GetCorpsCount(varMap, varPlayer, varGIndex)	
	local memberNum = 0
	
	if x700081_var_SearchCorpsScene == 1 then
		memberNum = GetSceneCorpsCount(varMap, varPlayer, varGIndex)--场景所有
	else
		memberNum = GetNearCorpsCount(varMap, varPlayer, varGIndex)	--附近经验范围
	end
	
	return memberNum
end

-------------------------------------------------------------
-- 设置达到副本进入最大次数，本(日/周)不可以再进
-------------------------------------------------------------
function x700081_SetMaxEnterCount(varMap, varPlayer)	
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	local varScriptFileId = GetFubenData_Param(varMap, x700081_CSP_SCRIPTID )
	varIndex = x700081_GetCurrentFubenIndex(varMap, varScriptFileId, nFubenType)

	local varMode = 0
	local varMaxCount = 1 --直接使用最大值
	x700081_SetEnterCount(varMap, varPlayer,varIndex, varMode, varMaxCount)

end



--------------------------------------------------------------
-- 检测当前服务器是否开放
--------------------------------------------------------------
function x700081_CheckFubenToggle(fubenType)
	local nToggle = 0		
	if fubenType == 2 then --挑战副本
		if getn(x700081_ChangleToggleWorld) == 0 then
			nToggle = 1
		else
			for i, v in x700081_ChangleToggleWorld do 
				if GetWorldIdEx() == v then
					nToggle = 1
					break
				end
			end
		end
	else
		nToggle = 1
	end
	return nToggle
end

------------------------------------------------------------
--检测跨服是否开放
------------------------------------------------------------
function x700081_CheckKuafuToggle()
	local nToggle = 1
	if getn(x700081_noKuanFuWorldToggle) == 0 then
		nToggle = 0
	else
		for i, v in x700081_noKuanFuWorldToggle do 
			if GetWorldIdEx() == v then
				nToggle = 0
				break
			end
		end
	end
	
	return nToggle
end

-------------------------------------------------------------
--检测跨服搜索条件
-------------------------------------------------------------
function x700081_CheckKuaFuSearchEnum(varMap, varPlayer, nRoomType, nShowTips)

	--根据Room找到位置
	local varIndex = x700081_GetIndexByRoomType(nRoomType)	
	if varIndex < 1 then
		return 0
	end

	--day
	local nCheckDay = 0
	local weekDay = GetWeek()
	for varI, item in x700081_var_EnterDayList[varIndex] do
		if weekDay==item then
			nCheckDay = 1
			break
		end
	end
	
	if nCheckDay ~= 1 then
		if nShowTips == 1 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, x700081_str_NotDay);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
		end
		return 0
	end
	
	--time
	local nCheckTime = 0
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*60+minute	
	if x700081_var_RegisterFuben[varIndex].varId == 700121 then
		if nowtime >= 0*60+0 and nowtime <= 24*60+0 then
			nCheckTime = 1
		end
	else 
		for varI, item in x700081_var_EnterTimeList[varIndex] do
			if nowtime >= item.min and nowtime <= item.max then
				nCheckTime = 1
				break
			end
		end
	end
	
	if nCheckTime ~= 1 then
		if nShowTips == 1 then
				StartTalkTask(varMap);
				TalkAppendString(varMap, x700081_str_NotTime);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
		end
		return 0
	end
	
	--times
	local nCheckTimes = 0
	if x700081_var_CountUntilList[varIndex] > 0 then
		local enterCount = x700081_GetEnterCount(varMap, varPlayer,varIndex)
		--WriteLog(1, "enterCount" .. enterCount .. " x700081_var_CountUntilList[varIndex]" .. x700081_var_CountUntilList[varIndex])
		if enterCount < x700081_var_CountUntilList[varIndex] then
			nCheckTimes = 1
		end
	end
	
	if nCheckTimes ~= 1 then
		if nShowTips == 1 then	
				StartTalkTask(varMap);
				TalkAppendString(varMap, x700081_str_TimesOver);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
		end
		return 0
	end
	
	--检查队伍成员
	local nCheckTeam = 1
	local varErr = "";	
	local varRet, tips;	


	local teamid = GetTeamId(varMap, varPlayer);
	if teamid >= 0 then	
			if IsTeamLeader(varMap, varPlayer) ~= 1 then
				nCheckTeam = 0
			else
				local teamnum = GetTeamSize(varMap, varPlayer);
				local nearteamnum = GetNearTeamCount(varMap, varPlayer);


				varRet, tips = x700081_CheckAllMemberMinLevel(varMap, varPlayer, nearteamnum,varIndex);
				if varRet <= 0 then
					varErr = tips;
					nCheckTeam = 0
				end
		
				varRet, tips = x700081_CheckAllMemberMaxLevel(varMap, varPlayer, nearteamnum,varIndex);
				if varRet <= 0 then
					varErr = tips
					nCheckTeam = 0
				end
		
				varRet, tips = x700081_CheckAllMemberEnterCount(varMap, varPlayer, nearteamnum, x700081_var_SearchCorpsDefaultMode ,varIndex);
				if varRet == 0 then
					varErr = tips;
					nCheckTeam = 0
				end
	
				varRet, tips = x700081_CheckAllMemberErrorState(varMap, varPlayer, nearteamnum)
				if varRet <= 0 then
					varErr = tips;
					nCheckTeam = 0
				end
		
				varRet, tips = x700081_CountryBattleLite(varMap, varPlayer)
				if varRet<=0 then
					varErr = tips;
					nCheckTeam = 0
				end
		
			end
	else
		
		local enterCount, todayCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
		if todayCount ~= nil and todayCount >= 7 then
			local str_ = GetName(varMap, varPlayer)
			tips = format("很抱歉! %s今天进入三环副本（三番令）已满3次，请明天再来！", "#G"..str_.."#o")
			varErr = tips
			nCheckTeam = 0
		end
	end
	
	if nCheckTeam ~= 1 then
			--给提示
			if nShowTips == 1 and varErr ~= "" then
				StartTalkTask(varMap);
				TalkAppendString(varMap, varErr);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end	
		return 0
	end

	return 1
end

-------------------------------------------------------------
--根据RoomType得到副本Index
-------------------------------------------------------------
function x700081_GetIndexByRoomType(nRoomType)
	local nIndex = -1
	local nFubenType = 0 --默认选择正常副本
	for i,item in x700081_var_FubenTypeList do		
		if item  == nRoomType then					
			if x700081_var_RegisterFuben[i].fubentype == nFubenType then			
				nIndex = i
				break
			end
		end
	end
	return nIndex	
end

-------------------------------------------------------------
-- 判断当前副本是否是高级副本
-------------------------------------------------------------
function x700081_IsHeroCopyScene(varMap, varPlayer)
	local nFubenType = GetFubenData_Param(varMap, x700081_CSP_FUBEN_TYPE)
	if nFubenType == 2 then
		return 1
	end
	
	return 0
end
	
-------------------------------------------------------------
--debug日志
-------------------------------------------------------------
function x700081_WriteDebugLog(varTip, ...)
	local logFlag = 0 
	if logFlag ~= 1 then
		return
	end
	
	local printResult = varTip .. ": "
	local index = 1
	 for i,v in arg do
	 		if mod(index, 2) == 0 then
	 			printResult = printResult .. tostring(v) .. " | "
	 		else
	 			printResult = printResult .. tostring(v) .. "="
	 		end
	 end
	 
	 WriteLog(1, printResult)
end

--------------------------------------------------------------
-- 进入YY副本临时频道
--------------------------------------------------------------
function x700081_EnterYYFubenTempChannel(varMap, varPlayer)
	local nFlag, nYYGuid1, nYYGuid2 = GetYYTempChannelGUID(varMap, varPlayer) 
	
	if (nFlag == 1) then
		local Guid = format("%d-%d", nYYGuid1, nYYGuid2);
		local FinalGuid = " ";
		FinalGuid = "70C3FB"..Guid;
		EnterYYTempChannel(varMap, varPlayer,FinalGuid)
		--print("#################################加入YY svr 发送通知##############################")
	end
	
end
--------------------------------------------------------------
-- 进入挑战副本花费现金
--------------------------------------------------------------
function x700081_GetCost(varMap, varPlayer, varIndex)
	local enterCount = x700081_GetEnterCount(varMap, varPlayer, varIndex)
	local cost = 0
	if  enterCount == 1 then
		cost = 500
	elseif enterCount == 2 then
		cost = 500
	elseif enterCount == 3 then
		cost = 500
	elseif enterCount == 4 then
		cost = 500
	elseif enterCount == 5 then
		cost = 1000	
	elseif enterCount == 6 then
		cost = 1000	
	elseif enterCount == 7 then
		cost = 1500	
	elseif enterCount == 8 then
		cost = 1500	
	elseif enterCount == 9 then
		cost = 2000	
	elseif enterCount >= 10 then
		cost = 2000	
	end
	return cost
end
