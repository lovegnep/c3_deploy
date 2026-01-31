




--DECLARE_QUEST_INFO_START--


x300783_var_QuestId 				= 	9410                     
x300783_var_FileId 					= 	300783                  
x300783_var_QuestKind 				= 	1                       
x300783_var_LevelLess					= 	75                      


x300783_var_QuestName				= 	"【帮会】帮会跑环"
x300783_var_QuestTarget				= 	""          
x300783_var_QuestInfo				= 	"\t时下多事之秋，帮会中有很多棘手的事情需要得力的人去做，我希望你能助上一臂之力。\n\t你是否要接受任务？"         
x300783_var_ContinueInfo				= 	"\t怎么？你连这些简单的帮会任务都无法完成？看来我们要另外物色人选了。"  
x300783_var_QuestCompleted			= 	"\t你的表现让我很欣慰，希望你以后能够继续为我们的帮会多做贡献！"  
x300783_var_QuestHelp				=	"\t帮会跑环任务，环数越高，#G经验奖励#W也越高！\n\t帮会跑环中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。"          


x300783_var_ExtTarget					=	{ {type=20,n=1,target="【帮会】帮会跑环"}}



x300783_var_ExpBonus					= 	0;
x300783_var_BonusItem					=	{}	

x300783_var_BonusMoney1               = 	0
x300783_var_BonusMoney2               =   0
x300783_var_BonusMoney3               =   0

x300783_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300783_var_GameId					=	1030
x300783_var_DayCountLimited			=	1
x300783_var_nDaySpace					=	5    

x300783_var_EnterTime					=	{                       
											{min=0*60+0,  max=23*60+59},
										}

x300783_var_MaxStep					=	200
x300783_var_ReplyNpcId				=	138533
x300783_var_ReplyNpcObjId				=	3

x300783_G_TYPE_SONGXIN		=1
x300783_G_TYPE_SHOUJI		=2
x300783_G_TYPE_KILL			=3

x300783_var_BaseBonusRate = {1200,1800,2100,2400,2700,3000,3300,3600,3900,4200}  
x300783_var_ExtraBonusRate = {1,1.2,1.4,1.6,1.8,2,2.2,2.4,2.6,2.8,3,3.2,3.4,3.6,3.8,4,4.2,4.4,4.6,4.8}  


x300783_var_NeedGuildValue = {1150,650,320,110,50}




x300783_var_QuestInfo1				= 	"\t最近帮中事物繁杂，使我无法抽身拜会曾经支持过我们帮会的朋友，请你代我去拜望一下他们，就说：我们在任何情况下也不会忘记曾经帮助过我们的恩人。"
x300783_var_ContinueInfo1				= 	"\t你这么快就找到我们的朋友了？"
x300783_var_QuestCompleted1			= 	"\t你真是太客气了，些许帮助你们不必记挂在心。"
x300783_var_QuestHelp1				=	"\t#G帮会功德#W小于50点，每轮跑环任务可以完成#G100环#W子任务。随着自身帮会功德的增加，子任务环数也会增加，最高为每轮可完成#G200环#W子任务。"          

x300783_var_QuestTable1 =	{ 
								{ varId=1,  ncount=3, replynpclist = {{varId=138600,varName="  找到@npc_138600"},{varId=138824,varName="  找到@npc_138824"},{varId=138822,varName="  找到@npc_138822"}}},
								{ varId=3,  ncount=3, replynpclist = {{varId=138800,varName="  找到@npc_138800"},{varId=138254,varName="  找到@npc_138254"},{varId=138252,varName="  找到@npc_138252"}}},
								{ varId=11, ncount=3, replynpclist = {{varId=138802,varName="  找到@npc_138802"},{varId=138811,varName="  找到@npc_138811"},{varId=138810,varName="  找到@npc_138810"}}},
								{ varId=13, ncount=3, replynpclist = {{varId=138804,varName="  找到@npc_138804"},{varId=138516,varName="  找到@npc_138516"},{varId=138810,varName="  找到@npc_138810"}}},
								{ varId=21, ncount=3, replynpclist = {{varId=138812,varName="  找到@npc_138812"},{varId=138515,varName="  找到@npc_138515"},{varId=138518,varName="  找到@npc_138518"}}},
								{ varId=23, ncount=3, replynpclist = {{varId=138814,varName="  找到@npc_138814"},{varId=138817,varName="  找到@npc_138817"},{varId=138812,varName="  找到@npc_138812"}}},
								{ varId=31, ncount=3, replynpclist = {{varId=138819,varName="  找到@npc_138819"},{varId=138584,varName="  找到@npc_138584"},{varId=138802,varName="  找到@npc_138802"}}},
								{ varId=33, ncount=3, replynpclist = {{varId=138109,varName="  找到@npc_138109"},{varId=138075,varName="  找到@npc_138075"},{varId=138605,varName="  找到@npc_138605"}}},
								{ varId=41, ncount=3, replynpclist = {{varId=138817,varName="  找到@npc_138817"},{varId=138075,varName="  找到@npc_138075"},{varId=138108,varName="  找到@npc_138108"}}},
								{ varId=43, ncount=3, replynpclist = {{varId=138656,varName="  找到@npc_138656"},{varId=138075,varName="  找到@npc_138075"},{varId=138108,varName="  找到@npc_138108"}}},
								{ varId=51, ncount=3, replynpclist = {{varId=129326,varName="  去边塞找到@npc_129326"},{varId=129026,varName="  去边塞找到@npc_129026"},{varId=129022,varName="  去边塞找到@npc_129022"}}},
								{ varId=53, ncount=3, replynpclist = {{varId=129708,varName="  去边塞找到@npc_129708"},{varId=129115,varName="  去边塞找到@npc_129115"},{varId=129118,varName="  去边塞找到@npc_129118"}}},
								{ varId=61, ncount=3, replynpclist = {{varId=129059,varName="  去边塞找到@npc_129059"},{varId=129026,varName="  去边塞找到@npc_129026"},{varId=129708,varName="  去边塞找到@npc_129708"}}},
								{ varId=63, ncount=3, replynpclist = {{varId=129022,varName="  去边塞找到@npc_129022"},{varId=129115,varName="  去边塞找到@npc_129115"},{varId=129027,varName="  去边塞找到@npc_129027"}}},
								{ varId=71, ncount=3, replynpclist = {{varId=139106,varName="  去大都找到@npc_139106"},{varId=140991,varName="  去大都找到@npc_140991"},{varId=140992,varName="  去大都找到@npc_140992"}}},
								{ varId=73, ncount=3, replynpclist = {{varId=139067,varName="  去大都找到@npc_139067"},{varId=140993,varName="  去大都找到@npc_140993"},{varId=140986,varName="  去大都找到@npc_140986"}}},
								{ varId=81, ncount=3, replynpclist = {{varId=140417,varName="  去大都找到@npc_140417"},{varId=140417,varName="  去大都找到@npc_140417"},{varId=129027,varName="  去边塞找到@npc_129027"}}},
								{ varId=83, ncount=2, replynpclist = {{varId=143008,varName="  去威海港找到@npc_143008"},{varId=143009,varName="  去威海港找到@npc_143009"}}},
								{ varId=91, ncount=2, replynpclist = {{varId=143014,varName="  去威海港找到@npc_143014"},{varId=143015,varName="  去威海港找到@npc_143015"}}},
								{ varId=93, ncount=2, replynpclist = {{varId=143031,varName="  去威海港找到@npc_143031"},{varId=143075,varName="  去威海港找到@npc_143075"}}},
								{ varId=101,  ncount=3, replynpclist = {{varId=138600,varName="  找到@npc_138600"},{varId=138824,varName="  找到@npc_138824"},{varId=138822,varName="  找到@npc_138822"}}},
								{ varId=103,  ncount=3, replynpclist = {{varId=138800,varName="  找到@npc_138800"},{varId=138254,varName="  找到@npc_138254"},{varId=138252,varName="  找到@npc_138252"}}},
								{ varId=111, ncount=3, replynpclist = {{varId=138802,varName="  找到@npc_138802"},{varId=138811,varName="  找到@npc_138811"},{varId=138810,varName="  找到@npc_138810"}}},
								{ varId=113, ncount=3, replynpclist = {{varId=138804,varName="  找到@npc_138804"},{varId=138516,varName="  找到@npc_138516"},{varId=138810,varName="  找到@npc_138810"}}},
								{ varId=121, ncount=3, replynpclist = {{varId=138812,varName="  找到@npc_138812"},{varId=138515,varName="  找到@npc_138515"},{varId=138518,varName="  找到@npc_138518"}}},
								{ varId=123, ncount=3, replynpclist = {{varId=138814,varName="  找到@npc_138814"},{varId=138817,varName="  找到@npc_138817"},{varId=138812,varName="  找到@npc_138812"}}},
								{ varId=131, ncount=3, replynpclist = {{varId=138819,varName="  找到@npc_138819"},{varId=138584,varName="  找到@npc_138584"},{varId=138802,varName="  找到@npc_138802"}}},
								{ varId=133, ncount=3, replynpclist = {{varId=138109,varName="  找到@npc_138109"},{varId=138075,varName="  找到@npc_138075"},{varId=138605,varName="  找到@npc_138605"}}},
								{ varId=141, ncount=3, replynpclist = {{varId=138817,varName="  找到@npc_138817"},{varId=138075,varName="  找到@npc_138075"},{varId=138108,varName="  找到@npc_138108"}}},
								{ varId=143, ncount=3, replynpclist = {{varId=138656,varName="  找到@npc_138656"},{varId=138075,varName="  找到@npc_138075"},{varId=138108,varName="  找到@npc_138108"}}},
								{ varId=151, ncount=3, replynpclist = {{varId=129326,varName="  去边塞找到@npc_129326"},{varId=129026,varName="  去边塞找到@npc_129026"},{varId=129022,varName="  去边塞找到@npc_129022"}}},
								{ varId=153, ncount=3, replynpclist = {{varId=129708,varName="  去边塞找到@npc_129708"},{varId=129115,varName="  去边塞找到@npc_129115"},{varId=129118,varName="  去边塞找到@npc_129118"}}},
								{ varId=161, ncount=3, replynpclist = {{varId=129059,varName="  去边塞找到@npc_129059"},{varId=129026,varName="  去边塞找到@npc_129026"},{varId=129708,varName="  去边塞找到@npc_129708"}}},
								{ varId=163, ncount=3, replynpclist = {{varId=129022,varName="  去边塞找到@npc_129022"},{varId=129115,varName="  去边塞找到@npc_129115"},{varId=129027,varName="  去边塞找到@npc_129027"}}},
								{ varId=171, ncount=3, replynpclist = {{varId=139106,varName="  去大都找到@npc_139106"},{varId=140991,varName="  去大都找到@npc_140991"},{varId=140992,varName="  去大都找到@npc_140992"}}},
								{ varId=173, ncount=3, replynpclist = {{varId=139067,varName="  去大都找到@npc_139067"},{varId=140993,varName="  去大都找到@npc_140993"},{varId=140986,varName="  去大都找到@npc_140986"}}},
								{ varId=181, ncount=3, replynpclist = {{varId=140417,varName="  去大都找到@npc_140417"},{varId=140417,varName="  去大都找到@npc_140417"},{varId=129027,varName="  去边塞找到@npc_129027"}}},
								{ varId=183, ncount=2, replynpclist = {{varId=143008,varName="  去威海港找到@npc_143008"},{varId=143009,varName="  去威海港找到@npc_143009"}}},
								{ varId=191, ncount=2, replynpclist = {{varId=143014,varName="  去威海港找到@npc_143014"},{varId=143015,varName="  去威海港找到@npc_143015"}}},
								{ varId=193, ncount=2, replynpclist = {{varId=143031,varName="  去威海港找到@npc_143031"},{varId=143075,varName="  去威海港找到@npc_143075"}}},
							}



x300783_var_QuestInfo2				= 	"\t现在世道纷乱，百姓处在水深火热之中，我们帮会中的有识之士准备组织起来保境安民，但目前帮中物资匮急需补充，你可否资助一些？\n"
x300783_var_ContinueInfo2				= 	"\t这件物品着这么难以找到吗？"
x300783_var_QuestCompleted2			= 	"\t谢谢你的慷慨解囊。"
x300783_var_QuestHelp2				=	"\t#G帮会功德#W小于50点，每轮跑环任务可以完成#G100环#W子任务。随着自身帮会功德的增加，子任务环数也会增加，最高为每轮可完成#G200环#W子任务。"          

x300783_var_QuestTable2 =	{ 
							
{ varId=2, ncount=4,needitem={{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}},
{ varId=4, ncount=6,needitem={{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=6, ncount=6,needitem={{varItem=11000200,varCount=1},{varItem=11050001,varCount=1},{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}}, 
{ varId=7, ncount=8,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=9, ncount=6,needitem={{varItem=11000200,varCount=1},{varItem=11050001,varCount=1},{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}},
{ varId=10, ncount=8,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=12, ncount=4,needitem={{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}},
{ varId=14, ncount=6,needitem={{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=16, ncount=6,needitem={{varItem=11000200,varCount=1},{varItem=11050001,varCount=1},{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}},
{ varId=17, ncount=8,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=19, ncount=11,needitem={{varItem=12010200,varCount=1},{varItem=12020001,varCount=1},{varItem=12020002,varCount=1},{varItem=12020003,varCount=1},{varItem=12020004,varCount=1},{varItem=12020005,varCount=1},{varItem=12020006,varCount=1},{varItem=12010300,varCount=1},{varItem=14030001,varCount=1},{varItem=14030006,varCount=1},{varItem=14030011,varCount=1}}},
{ varId=20, ncount=13,needitem={{varItem=10280040,varCount=1},{varItem=10290040,varCount=1},{varItem=10200040,varCount=1},{varItem=10230040,varCount=1},{varItem=10250040,varCount=1},{varItem=10260040,varCount=1},{varItem=10270040,varCount=1},{varItem=10010040,varCount=1},{varItem=10020040,varCount=1},{varItem=10030040,varCount=1},{varItem=10040040,varCount=1},{varItem=10050040,varCount=1},{varItem=10060040,varCount=1}}},
{ varId=22, ncount=4,needitem={{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}},
{ varId=24, ncount=6,needitem={{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=26, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1}}},
{ varId=27, ncount=8,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=29, ncount=11,needitem={{varItem=12010200,varCount=1},{varItem=12020001,varCount=1},{varItem=12020002,varCount=1},{varItem=12020003,varCount=1},{varItem=12020004,varCount=1},{varItem=12020005,varCount=1},{varItem=12020006,varCount=1},{varItem=12010300,varCount=1},{varItem=14020001,varCount=1},{varItem=14020006,varCount=1},{varItem=14020011,varCount=1}}},
{ varId=30, ncount=13,needitem={{varItem=10280040,varCount=1},{varItem=10290040,varCount=1},{varItem=10200040,varCount=1},{varItem=10230040,varCount=1},{varItem=10250040,varCount=1},{varItem=10260040,varCount=1},{varItem=10270040,varCount=1},{varItem=10010040,varCount=1},{varItem=10020040,varCount=1},{varItem=10030040,varCount=1},{varItem=10040040,varCount=1},{varItem=10050040,varCount=1},{varItem=10060040,varCount=1}}},
{ varId=32, ncount=8,needitem={{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=34, ncount=6,needitem={{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=36, ncount=10,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020002,varCount=1},{varItem=11020001,varCount=1},{varItem=11030401,varCount=1},{varItem=11030001,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=37, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1}}},
{ varId=39, ncount=11,needitem={{varItem=12010200,varCount=1},{varItem=12020001,varCount=1},{varItem=12020002,varCount=1},{varItem=12020003,varCount=1},{varItem=12020004,varCount=1},{varItem=12020005,varCount=1},{varItem=12020006,varCount=1},{varItem=12010300,varCount=1},{varItem=14030001,varCount=1},{varItem=14030006,varCount=1},{varItem=14030011,varCount=1}}},
{ varId=40, ncount=13,needitem={{varItem=10280040,varCount=1},{varItem=10290040,varCount=1},{varItem=10200040,varCount=1},{varItem=10230040,varCount=1},{varItem=10250040,varCount=1},{varItem=10260040,varCount=1},{varItem=10270040,varCount=1},{varItem=10010040,varCount=1},{varItem=10020040,varCount=1},{varItem=10030040,varCount=1},{varItem=10040040,varCount=1},{varItem=10050040,varCount=1},{varItem=10060040,varCount=1}}},
{ varId=42, ncount=4,needitem={{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=44, ncount=12,needitem={{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=46, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=47, ncount=14,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041010,varCount=1},{varItem=11041000,varCount=1},{varItem=11041020,varCount=1},{varItem=11041030,varCount=1},{varItem=11041040,varCount=1},{varItem=11041050,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=49, ncount=11,needitem={{varItem=12010200,varCount=1},{varItem=12020001,varCount=1},{varItem=12020002,varCount=1},{varItem=12020003,varCount=1},{varItem=12020004,varCount=1},{varItem=12020005,varCount=1},{varItem=12020006,varCount=1},{varItem=12010300,varCount=1},{varItem=14030001,varCount=1},{varItem=14030006,varCount=1},{varItem=14030011,varCount=1}}},
{ varId=50, ncount=13,needitem={{varItem=10280040,varCount=1},{varItem=10290040,varCount=1},{varItem=10200040,varCount=1},{varItem=10230040,varCount=1},{varItem=10250040,varCount=1},{varItem=10260040,varCount=1},{varItem=10270040,varCount=1},{varItem=10010040,varCount=1},{varItem=10020040,varCount=1},{varItem=10030040,varCount=1},{varItem=10040040,varCount=1},{varItem=10050040,varCount=1},{varItem=10060040,varCount=1}}},
{ varId=52, ncount=4,needitem={{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=54, ncount=6,needitem={{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=56, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=57, ncount=6,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1}}},
{ varId=59, ncount=19,needitem={{varItem=12010300,varCount=1},{varItem=12020001,varCount=1},{varItem=12020002,varCount=1},{varItem=12020003,varCount=1},{varItem=14030001,varCount=1},{varItem=14020006,varCount=1},{varItem=14020011,varCount=1},{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14030002,varCount=1},{varItem=14030007,varCount=1},{varItem=14030012,varCount=1},{varItem=14030012,varCount=1}}},
{ varId=60, ncount=13,needitem={{varItem=10280040,varCount=1},{varItem=10290040,varCount=1},{varItem=10200040,varCount=1},{varItem=10230040,varCount=1},{varItem=10250040,varCount=1},{varItem=10260040,varCount=1},{varItem=10270040,varCount=1},{varItem=10010040,varCount=1},{varItem=10020040,varCount=1},{varItem=10030040,varCount=1},{varItem=10040040,varCount=1},{varItem=10050040,varCount=1},{varItem=10060040,varCount=1}}},
{ varId=62, ncount=4,needitem={{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=64, ncount=6,needitem={{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=66, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=67, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=69, ncount=12,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14020002,varCount=1},{varItem=14020007,varCount=1},{varItem=14020012,varCount=1},{varItem=14020012,varCount=1}}},
{ varId=70, ncount=20,needitem={{varItem=10280040,varCount=1},{varItem=10270040,varCount=1},{varItem=10250040,varCount=1},{varItem=10010040,varCount=1},{varItem=10030040,varCount=1},{varItem=10060040,varCount=1},{varItem=10280050,varCount=1},{varItem=10290050,varCount=1},{varItem=10010050,varCount=1},{varItem=10020050,varCount=1},{varItem=10030050,varCount=1},{varItem=10040050,varCount=1},{varItem=10050050,varCount=1},{varItem=10060050,varCount=1},{varItem=10200050,varCount=1},{varItem=10230050,varCount=1},{varItem=10250050,varCount=1},{varItem=10260050,varCount=1},{varItem=10260050,varCount=1},{varItem=10270050,varCount=1}}},
{ varId=72, ncount=4,needitem={{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=74, ncount=6,needitem={{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=76, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1}}},
{ varId=77, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=79, ncount=11,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14030002,varCount=1},{varItem=14030007,varCount=1},{varItem=14030012,varCount=1}}},
{ varId=80, ncount=13,needitem={{varItem=10280050,varCount=1},{varItem=10290050,varCount=1},{varItem=10010050,varCount=1},{varItem=10020050,varCount=1},{varItem=10030050,varCount=1},{varItem=10040050,varCount=1},{varItem=10050050,varCount=1},{varItem=10060050,varCount=1},{varItem=10200050,varCount=1},{varItem=10230050,varCount=1},{varItem=10250050,varCount=1},{varItem=10260050,varCount=1},{varItem=10270050,varCount=1}}},
{ varId=82, ncount=8,needitem={{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=84, ncount=6,needitem={{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=86, ncount=10,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020006,varCount=1},{varItem=11020007,varCount=1},{varItem=11030003,varCount=1},{varItem=11030402,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=87, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1}}},
{ varId=89, ncount=11,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14020002,varCount=1},{varItem=14020007,varCount=1},{varItem=14020012,varCount=1}}},
{ varId=90, ncount=13,needitem={{varItem=10280050,varCount=1},{varItem=10290050,varCount=1},{varItem=10010050,varCount=1},{varItem=10020050,varCount=1},{varItem=10030050,varCount=1},{varItem=10040050,varCount=1},{varItem=10050050,varCount=1},{varItem=10060050,varCount=1},{varItem=10200050,varCount=1},{varItem=10230050,varCount=1},{varItem=10250050,varCount=1},{varItem=10260050,varCount=1},{varItem=10270050,varCount=1}}},
{ varId=92, ncount=4,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=94, ncount=12,needitem={{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=96, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=97, ncount=14,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041011,varCount=1},{varItem=11041001,varCount=1},{varItem=11041021,varCount=1},{varItem=11041031,varCount=1},{varItem=11041041,varCount=1},{varItem=11041051,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=99, ncount=11,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14030002,varCount=1},{varItem=14030007,varCount=1},{varItem=14030012,varCount=1}}},
{ varId=100, ncount=13,needitem={{varItem=10280050,varCount=1},{varItem=10290050,varCount=1},{varItem=10010050,varCount=1},{varItem=10020050,varCount=1},{varItem=10030050,varCount=1},{varItem=10040050,varCount=1},{varItem=10050050,varCount=1},{varItem=10060050,varCount=1},{varItem=10200050,varCount=1},{varItem=10230050,varCount=1},{varItem=10250050,varCount=1},{varItem=10260050,varCount=1},{varItem=10270050,varCount=1}}},
{ varId=102, ncount=4,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=104, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=106, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=107, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=109, ncount=25,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14020002,varCount=1},{varItem=14020007,varCount=1},{varItem=14020012,varCount=1},{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=110, ncount=13,needitem={{varItem=10280050,varCount=1},{varItem=10290050,varCount=1},{varItem=10010050,varCount=1},{varItem=10020050,varCount=1},{varItem=10030050,varCount=1},{varItem=10040050,varCount=1},{varItem=10050050,varCount=1},{varItem=10060050,varCount=1},{varItem=10200050,varCount=1},{varItem=10230050,varCount=1},{varItem=10250050,varCount=1},{varItem=10260050,varCount=1},{varItem=10270050,varCount=1}}},
{ varId=112,ncount=4,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=114, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=116, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=117, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=119, ncount=25,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14020002,varCount=1},{varItem=14020007,varCount=1},{varItem=14020012,varCount=1},{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=120, ncount=20,needitem={{varItem=10280050,varCount=1},{varItem=10020050,varCount=1},{varItem=10040050,varCount=1},{varItem=10060050,varCount=1},{varItem=10250050,varCount=1},{varItem=10270050,varCount=1},{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=122, ncount=4,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=124, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=126, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=127, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=129, ncount=25,needitem={{varItem=12010201,varCount=1},{varItem=12020011,varCount=1},{varItem=12020012,varCount=1},{varItem=12020013,varCount=1},{varItem=12020014,varCount=1},{varItem=12020015,varCount=1},{varItem=12020016,varCount=1},{varItem=12010301,varCount=1},{varItem=14020002,varCount=1},{varItem=14020007,varCount=1},{varItem=14020012,varCount=1},{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=130, ncount=20,needitem={{varItem=10280050,varCount=1},{varItem=10020050,varCount=1},{varItem=10040050,varCount=1},{varItem=10060050,varCount=1},{varItem=10250050,varCount=1},{varItem=10270050,varCount=1},{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=132, ncount=4,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=134, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=136, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=137, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=139, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=140, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=142, ncount=4,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=144, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=146, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=147, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=149, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=150, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=152, ncount=8,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1},{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=154, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=156, ncount=6,needitem={{varItem=11000201,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1}}},
{ varId=157, ncount=8,needitem={{varItem=11000202,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=159, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=160, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=162, ncount=8,needitem={{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1},{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=164, ncount=6,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=166, ncount=10,needitem={{varItem=11000202,varCount=1},{varItem=11050002,varCount=1},{varItem=11020010,varCount=1},{varItem=11020011,varCount=1},{varItem=11030005,varCount=1},{varItem=11030403,varCount=1},{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=167, ncount=8,needitem={{varItem=11000203,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1}}},
{ varId=169, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=170, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=172, ncount=4,needitem={{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=174, ncount=12,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1},{varItem=11041013,varCount=1},{varItem=11041003,varCount=1},{varItem=11041023,varCount=1},{varItem=11041033,varCount=1},{varItem=11041043,varCount=1},{varItem=11041053,varCount=1}}},
{ varId=176, ncount=6,needitem={{varItem=11000202,varCount=1},{varItem=11050002,varCount=1},{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=177, ncount=14,needitem={{varItem=11000203,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1},{varItem=11041013,varCount=1},{varItem=11041003,varCount=1},{varItem=11041023,varCount=1},{varItem=11041033,varCount=1},{varItem=11041043,varCount=1},{varItem=11041053,varCount=1}}},
{ varId=179, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=180, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=182, ncount=4,needitem={{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=184, ncount=12,needitem={{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1},{varItem=11041013,varCount=1},{varItem=11041003,varCount=1},{varItem=11041023,varCount=1},{varItem=11041033,varCount=1},{varItem=11041043,varCount=1},{varItem=11041053,varCount=1}}},
{ varId=186, ncount=6,needitem={{varItem=11000202,varCount=1},{varItem=11050002,varCount=1},{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=187, ncount=14,needitem={{varItem=11000203,varCount=1},{varItem=11050003,varCount=1},{varItem=11041012,varCount=1},{varItem=11041002,varCount=1},{varItem=11041022,varCount=1},{varItem=11041032,varCount=1},{varItem=11041042,varCount=1},{varItem=11041052,varCount=1},{varItem=11041013,varCount=1},{varItem=11041003,varCount=1},{varItem=11041023,varCount=1},{varItem=11041033,varCount=1},{varItem=11041043,varCount=1},{varItem=11041053,varCount=1}}},
{ varId=189, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=190, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
{ varId=192, ncount=4,needitem={{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=194, ncount=6,needitem={{varItem=11041013,varCount=1},{varItem=11041003,varCount=1},{varItem=11041023,varCount=1},{varItem=11041033,varCount=1},{varItem=11041043,varCount=1},{varItem=11041053,varCount=1}}},
{ varId=196, ncount=6,needitem={{varItem=11000202,varCount=1},{varItem=11050002,varCount=1},{varItem=11020014,varCount=1},{varItem=11020015,varCount=1},{varItem=11030007,varCount=1},{varItem=11030404,varCount=1}}},
{ varId=197, ncount=8,needitem={{varItem=11000203,varCount=1},{varItem=11050003,varCount=1},{varItem=11041013,varCount=1},{varItem=11041003,varCount=1},{varItem=11041023,varCount=1},{varItem=11041033,varCount=1},{varItem=11041043,varCount=1},{varItem=11041053,varCount=1}}},
{ varId=199, ncount=13,needitem={{varItem=14040002,varCount=1},{varItem=14010002,varCount=1},{varItem=14010007,varCount=1},{varItem=14010012,varCount=1},{varItem=14040006,varCount=1},{varItem=12010202,varCount=1},{varItem=12020021,varCount=1},{varItem=12020022,varCount=1},{varItem=12020023,varCount=1},{varItem=12020024,varCount=1},{varItem=12020025,varCount=1},{varItem=12020026,varCount=1},{varItem=12010302,varCount=1}}},
{ varId=200, ncount=13,needitem={{varItem=10280070,varCount=1},{varItem=10290070,varCount=1},{varItem=10200060,varCount=1},{varItem=10230060,varCount=1},{varItem=10250060,varCount=1},{varItem=10260060,varCount=1},{varItem=10270060,varCount=1},{varItem=10010060,varCount=1},{varItem=10020060,varCount=1},{varItem=10030060,varCount=1},{varItem=10040060,varCount=1},{varItem=10050060,varCount=1},{varItem=10060060,varCount=1}}},
							}



x300783_var_QuestInfo3				= 	"\t无论是过去还是现在，我大元的敌人从未终止过对我们的骚扰，现在有一个艰巨的使命交给你，不管敌人藏身于何处都要彻底的消灭他们。"
x300783_var_ContinueInfo3				= 	"\t你还没有消灭那些敌人，怎么就回来了？"
x300783_var_QuestCompleted3			= 	"\t你的勇于无畏捍卫了我们蒙古人的尊严，你会成为后世景仰的勇士。"
x300783_var_QuestHelp3				=	"\t#G帮会功德#W小于50点，每轮跑环任务可以完成#G100环#W子任务。随着自身帮会功德的增加，子任务环数也会增加，最高为每轮可完成#G200环#W子任务。"          

x300783_var_QuestTable3 =	{ 
								{ varId=5, ncount=3,needkill={{typeid=691,varCount=3, varName="  前往@npc_81014消灭3个@npc_21003", name1="@npc_21003"},{typeid=692,varCount=3, varName="  前往@npc_81014消灭3个@npc_21004", name1="@npc_21004"},{typeid=686,varCount=3, varName="  前往@npc_81014消灭3个@npc_21010", name1="@npc_21010"}}},
								{ varId=8, ncount=3,needkill={{typeid=692,varCount=3, varName="  前往@npc_81014消灭3个@npc_21004", name1="@npc_21004"},{typeid=686,varCount=3, varName="  前往@npc_81014消灭3个@npc_21010", name1="@npc_21010"},{typeid=682,varCount=3, varName="  前往@npc_81014消灭3个@npc_21001", name1="@npc_21001"}}},
								{ varId=15, ncount=3,needkill={{typeid=686,varCount=3, varName="  前往@npc_81014消灭3个@npc_21010", name1="@npc_21010"},{typeid=682,varCount=3, varName="  前往@npc_81014消灭3个@npc_21001", name1="@npc_21001"},{typeid=695,varCount=3, varName="  前往@npc_81014消灭3个@npc_21009", name1="@npc_21009"}}},
								{ varId=18, ncount=2,needkill={{typeid=1440,varCount=3, varName="  前往@npc_81019消灭3个@npc_2200", name1="@npc_2200"},{typeid=1441,varCount=3, varName="  前往@npc_81019消灭3个@npc_2201", name1="@npc_2201"}}},
								{ varId=25, ncount=2,needkill={{typeid=1440,varCount=3, varName="  前往@npc_81019消灭3个@npc_2200", name1="@npc_2200"},{typeid=1441,varCount=3, varName="  前往@npc_81019消灭3个@npc_2201", name1="@npc_2201"}}},
								{ varId=28, ncount=3,needkill={{typeid=1411,varCount=3, varName="  前往@npc_81015消灭3个@npc_23005", name1="@npc_23005"},{typeid=1404,varCount=3, varName="  前往@npc_81015消灭3个@npc_23009", name1="@npc_23009"},{typeid=1412,varCount=3, varName="  前往@npc_81015消灭3个@npc_23012", name1="@npc_23012"}}},
								{ varId=35, ncount=3,needkill={{typeid=1404,varCount=3, varName="  前往@npc_81015消灭3个@npc_23009", name1="@npc_23009"},{typeid=1409,varCount=3, varName="  前往@npc_81015消灭3个@npc_23001", name1="@npc_23001"},{typeid=1402,varCount=3, varName="  前往@npc_81015消灭3个@npc_23007", name1="@npc_23007"}}},
								{ varId=38, ncount=3,needkill={{typeid=1409,varCount=3, varName="  前往@npc_81015消灭3个@npc_23001", name1="@npc_23001"},{typeid=1412,varCount=3, varName="  前往@npc_81015消灭3个@npc_23012", name1="@npc_23012"},{typeid=1402,varCount=3, varName="  前往@npc_81015消灭3个@npc_23007", name1="@npc_23007"}}},
								{ varId=45, ncount=2,needkill={{typeid=808,varCount=3, varName="  前往@npc_81016消灭3个@npc_22010", name1="@npc_22010"},{typeid=801,varCount=3, varName="  前往@npc_81016消灭3个@npc_22003", name1="@npc_22003"}}},
								{ varId=48, ncount=2,needkill={{typeid=808,varCount=3, varName="  前往@npc_81016消灭3个@npc_22010", name1="@npc_22010"},{typeid=800,varCount=3, varName="  前往@npc_81016消灭3个@npc_22000", name1="@npc_22000"}}},
								{ varId=55, ncount=2,needkill={{typeid=800,varCount=3, varName="  前往@npc_81016消灭3个@npc_22000", name1="@npc_22000"},{typeid=807,varCount=3, varName="  前往@npc_81016消灭3个@npc_22008", name1="@npc_22008"}}},
								{ varId=58, ncount=1,needkill={{typeid=1450,varCount=3, varName="  前往@npc_81017消灭3个@npc_2202", name1="@npc_2202"}}},
								{ varId=65, ncount=1,needkill={{typeid=1451,varCount=3, varName="  前往@npc_81017消灭3个@npc_2203", name1="@npc_2203"}}},
								{ varId=68, ncount=1,needkill={{typeid=1208,varCount=2, varName="  前往@npc_81018消灭2个@npc_85050", name1="@npc_85050"}}},
								{ varId=75, ncount=1,needkill={{typeid=1207,varCount=2, varName="  前往@npc_81018消灭2个@npc_85051", name1="@npc_85051"}}},
								{ varId=78, ncount=1,needkill={{typeid=1682,varCount=3, varName="  前往@npc_81020消灭3个@npc_112102", name1="@npc_112102"}}},
								{ varId=85, ncount=1,needkill={{typeid=1686,varCount=3, varName="  前往@npc_81020消灭3个@npc_112101", name1="@npc_112101"}}},
								{ varId=88, ncount=1,needkill={{typeid=1702,varCount=3, varName="  前往@npc_81021消灭3个@npc_113101", name1="@npc_113101"}}},
								{ varId=95, ncount=1,needkill={{typeid=1706,varCount=3, varName="  前往@npc_81021消灭2个@npc_113106", name1="@npc_113106"}}},
								{ varId=98, ncount=1,needkill={{typeid=1713,varCount=2, varName="  前往@npc_81021消灭2个@npc_113113", name1="@npc_113113"}}},
								{ varId=105, ncount=2,needkill={{typeid=1440,varCount=3, varName="  前往@npc_81019消灭3个@npc_2200", name1="@npc_2200"},{typeid=1441,varCount=3, varName="  前往@npc_81019消灭3个@npc_2201", name1="@npc_2201"}}},
								{ varId=108, ncount=2,needkill={{typeid=1440,varCount=3, varName="  前往@npc_81019消灭3个@npc_2200", name1="@npc_2200"},{typeid=1441,varCount=3, varName="  前往@npc_81019消灭3个@npc_2201", name1="@npc_2201"}}},
								{ varId=115, ncount=3,needkill={{typeid=1411,varCount=3, varName="  前往@npc_81015消灭3个@npc_23005", name1="@npc_23005"},{typeid=1404,varCount=3, varName="  前往@npc_81015消灭3个@npc_23009", name1="@npc_23009"},{typeid=1412,varCount=3, varName="  前往@npc_81015消灭3个@npc_23012", name1="@npc_23012"}}},
								{ varId=118, ncount=3,needkill={{typeid=1404,varCount=3, varName="  前往@npc_81015消灭3个@npc_23009", name1="@npc_23009"},{typeid=1409,varCount=3, varName="  前往@npc_81015消灭3个@npc_23001", name1="@npc_23001"},{typeid=1402,varCount=3, varName="  前往@npc_81015消灭3个@npc_23007", name1="@npc_23007"}}},
								{ varId=125, ncount=3,needkill={{typeid=1409,varCount=3, varName="  前往@npc_81015消灭3个@npc_23001", name1="@npc_23001"},{typeid=1412,varCount=3, varName="  前往@npc_81015消灭3个@npc_23012", name1="@npc_23012"},{typeid=1402,varCount=3, varName="  前往@npc_81015消灭3个@npc_23007", name1="@npc_23007"}}},
								{ varId=128, ncount=2,needkill={{typeid=808,varCount=3, varName="  前往@npc_81016消灭3个@npc_22010", name1="@npc_22010"},{typeid=801,varCount=3, varName="  前往@npc_81016消灭3个@npc_22003", name1="@npc_22003"}}},
								{ varId=135, ncount=2,needkill={{typeid=808,varCount=3, varName="  前往@npc_81016消灭3个@npc_22010", name1="@npc_22010"},{typeid=800,varCount=3, varName="  前往@npc_81016消灭3个@npc_22000", name1="@npc_22000"}}},
								{ varId=138, ncount=2,needkill={{typeid=800,varCount=3, varName="  前往@npc_81016消灭3个@npc_22000", name1="@npc_22000"},{typeid=807,varCount=3, varName="  前往@npc_81016消灭3个@npc_22008", name1="@npc_22008"}}},
								{ varId=145, ncount=1,needkill={{typeid=1450,varCount=3, varName="  前往@npc_81017消灭3个@npc_2202", name1="@npc_2202"}}},
								{ varId=148, ncount=1,needkill={{typeid=1451,varCount=3, varName="  前往@npc_81017消灭3个@npc_2203", name1="@npc_2203"}}},
								{ varId=155, ncount=3,needkill={{typeid=691,varCount=3, varName="  前往@npc_81014消灭3个@npc_21003", name1="@npc_21003"},{typeid=692,varCount=3, varName="  前往@npc_81014消灭3个@npc_21004", name1="@npc_21004"},{typeid=686,varCount=3, varName="  前往@npc_81014消灭3个@npc_21010", name1="@npc_21010"}}},
								{ varId=158, ncount=3,needkill={{typeid=692,varCount=3, varName="  前往@npc_81014消灭3个@npc_21004", name1="@npc_21004"},{typeid=686,varCount=3, varName="  前往@npc_81014消灭3个@npc_21010", name1="@npc_21010"},{typeid=682,varCount=3, varName="  前往@npc_81014消灭3个@npc_21001", name1="@npc_21001"}}},
								{ varId=165, ncount=3,needkill={{typeid=686,varCount=3, varName="  前往@npc_81014消灭3个@npc_21010", name1="@npc_21010"},{typeid=682,varCount=3, varName="  前往@npc_81014消灭3个@npc_21001", name1="@npc_21001"},{typeid=695,varCount=3, varName="  前往@npc_81014消灭3个@npc_21009", name1="@npc_21009"}}},
								{ varId=168, ncount=2,needkill={{typeid=1440,varCount=3, varName="  前往@npc_81019消灭3个@npc_2200", name1="@npc_2200"},{typeid=1441,varCount=3, varName="  前往@npc_81019消灭3个@npc_2201", name1="@npc_2201"}}},
								{ varId=175, ncount=2,needkill={{typeid=1440,varCount=3, varName="  前往@npc_81019消灭3个@npc_2200", name1="@npc_2200"},{typeid=1441,varCount=3, varName="  前往@npc_81019消灭3个@npc_2201", name1="@npc_2201"}}},														
								{ varId=178, ncount=1,needkill={{typeid=1682,varCount=3, varName="  前往@npc_81020消灭3个@npc_112102", name1="@npc_112102"}}},
								{ varId=185, ncount=1,needkill={{typeid=1686,varCount=3, varName="  前往@npc_81020消灭3个@npc_112101", name1="@npc_112101"}}},
								{ varId=188, ncount=1,needkill={{typeid=1702,varCount=3, varName="  前往@npc_81021消灭3个@npc_113101", name1="@npc_113101"}}},
								{ varId=195, ncount=1,needkill={{typeid=1706,varCount=3, varName="  前往@npc_81021消灭2个@npc_113106", name1="@npc_113106"}}},
								{ varId=198, ncount=1,needkill={{typeid=1713,varCount=2, varName="  前往@npc_81021消灭2个@npc_113113", name1="@npc_113113"}}},
							}



function x300783_GetQuestId( varMap, varPlayer )
	return x300783_var_QuestId
end

function x300783_GetQuestStep(varMap, varPlayer)

	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])
	if nLastFlag>=x300783_GetMaxStep(varMap,varPlayer) then
		nLastFlag = 0
	end
	return nLastFlag+1
	
end

function x300783_SaveQuestStep(varMap, varPlayer)

	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])



	if nLastFlag<(x300783_GetMaxStep(varMap,varPlayer)-1) then
		
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],nLastFlag+1)
		local varMyQuest = x300783_GetQuestId( varMap, varPlayer )	
		x300783_DispatchQuestInfo( varMap, varPlayer, x300783_var_ReplyNpcObjId, varMyQuest, 0 )
	else
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],0)
		x300783_SetDayCount(varMap, varPlayer)
		
		
		
	end
	
  
end

function x300783_ResetQuestStep(varMap, varPlayer)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],0)
end

function x300783_GetQuestTypeById(varStep)
	local varIndex =0
	for varI,item in x300783_var_QuestTable1 do
		varIndex = varIndex+1;
		if item.varId == varStep then
			return x300783_G_TYPE_SONGXIN, varIndex
		end
	end
	
	local varIndex =0
	for varI,item in x300783_var_QuestTable2 do
		varIndex = varIndex+1;
		if item.varId == varStep then
			return x300783_G_TYPE_SHOUJI, varIndex
		end
	end

	local varIndex =0
	for varI,item in x300783_var_QuestTable3 do
		varIndex = varIndex+1;
		if item.varId == varStep then
			return x300783_G_TYPE_KILL, varIndex
		end
	end
end

function x300783_GetMaxStep(varMap,varPlayer)
	local nGuildMerit = GetGuildMerit(varMap,varPlayer) 
	
	local iIndex = 0

	for varI, item in x300783_var_NeedGuildValue do
		
		if nGuildMerit>=x300783_var_NeedGuildValue[varI] then
			break
		end
		iIndex = iIndex +1
	end
	

	return 200-20*iIndex
	
	
	
end

function x300783_GetData(varMap, varPlayer)
	local varStep = x300783_GetQuestStep(varMap, varPlayer)
	local nType,varIndex = x300783_GetQuestTypeById(varStep)
	local n1 = mod(varStep,10)

	

	local n2 = (varStep - mod(varStep,10))/10+1
	if n1==0 then
		n1 = 10
		
		n2 = (varStep - mod(varStep,10))/10
	end
	
	local nBaseBonusRate = x300783_var_BaseBonusRate[n1]  
	local nExtraBonusRate = x300783_var_ExtraBonusRate[n2] 
	local nLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = nLevel*nBaseBonusRate*nExtraBonusRate

	varExpBonus = tonumber(format("%d",varExpBonus))
	
	return varStep,nType,varIndex,varExpBonus
end

function x300783_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300783_var_GameId)<=0 then
		return
	end

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300783_var_LevelLess then
       return
    end

  if GetGuildID( varMap, varPlayer ) == -1 then
		return 0
	end  

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300783_var_QuestName,8,1);
		
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		TalkAppendButton(varMap, varMyQuest, x300783_var_QuestName,varState,varState);

	end


	DeliverTalkMenu(varMap, varPlayer, varTalknpc)


	
end








function x300783_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	
	
	if GetGameOpenById(x300783_var_GameId)<=0 then
		x300783_ShowTips(varMap, varPlayer, "此活动未开启")
		return
	end

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )	
	
	

	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		if varExt~=30 then
		
		x300783_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		else
			x300783_ShowTips(varMap, varPlayer, "你没有任务"..x300783_var_QuestName)
			return
		end
		
		
	else
		if varExt==7 then 
			x300783_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
		elseif varExt==30 then
			x300783_DispatchSongxinInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		else
			
			x300783_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
	
end



function x300783_DispatchSongxinInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if nType~=x300783_G_TYPE_SONGXIN then
		return
	end

	

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..x300783_var_QuestName)
	
	TalkAppendString( varMap,"\t你真是太客气了，些许帮助你们不必记挂在心。")
	
	TalkAppendString(varMap," ")

	StopTalkTask()

	DeliverTalkMenu( varMap, varPlayer, varTalknpc)

	x300783_QuestLogRefresh( varMap, varPlayer, varMyQuest)
end




function x300783_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )
	

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300783_var_QuestName)
		
			
		TalkAppendString(varMap,x300783_var_QuestInfo)
		TalkAppendString(varMap," ")
			
		
					
		TalkAppendString( varMap,x300783_var_QuestTarget)
		

		
		if varExpBonus > 0 then
			AddQuestExpBonus( varMap, varExpBonus)
		end

		TalkAppendString( varMap,"#G小提示：#W\n\t#G帮会功德#W小于50点，每轮跑环任务可以完成#G100环#W子任务。随着自身帮会功德的增加，子任务环数也会增加，最高为每轮可完成#G200环#W子任务。")
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300783_var_FileId, varQuest,0);
end





function x300783_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300783_var_QuestName)
		TalkAppendString(varMap," ")
		TalkAppendString(varMap,"\t您还没有完成本次任务，请赶快去完成吧！")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300783_var_FileId, varQuest,0);
	


end










function x300783_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300783_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，感谢你所做出的贡献，相信在大家的共同努力下，我们的帮会一定会更加强盛。")
	

	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
		
	StopTalkTask()
	
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300783_var_FileId, varQuest);

end


function x300783_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300783_var_GameId)<=0 then
		
		return 0;
	end
	return 1;

end

function x300783_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300783_var_GameId)<=0 then
		x300783_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0
	end


	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300783_var_LevelLess then
		x300783_ShowTips(varMap, varPlayer, "您的等级不足，无法接取此任务")
		return 0
	end

	if GetGuildID( varMap, varPlayer ) == -1 then
		x300783_ShowTips(varMap, varPlayer, "您还没有加入帮会，无法接取此任务")
		return 0
	end

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300783_ShowTips(varMap, varPlayer, "您已经接取了该任务，请先完成当前任务")
		return 0;
	end


	if x300783_var_DayCountLimited >0 then
		local varDayCount, nLastDay = x300783_GetDayCount(varMap, varPlayer)

		
		if varDayCount>= x300783_var_DayCountLimited then
			local varToday = GetDayOfYear() 

			local nNeedDay = x300783_var_nDaySpace-(varToday-nLastDay)

			x300783_ShowTips(varMap, varPlayer, format("很抱歉，【帮会】帮会跑环任务，请%d天后来接任务！",nNeedDay))
			return 0;
		end
	end

	

	return 1;

end



function x300783_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	if x300783_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300783_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300783_var_FileId, 1, 0, 1,1)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x300783_var_QuestName;
		x300783_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)


		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

		local nRandom =0;
		if nType == x300783_G_TYPE_SONGXIN then
			nRandom = random(1,x300783_var_QuestTable1[varIndex].ncount)
		elseif nType == x300783_G_TYPE_SHOUJI then
			nRandom = random(1,x300783_var_QuestTable2[varIndex].ncount)
		elseif nType == x300783_G_TYPE_KILL then
			nRandom = random(1,x300783_var_QuestTable3[varIndex].ncount)
		end
	
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nRandom )
		

		x300783_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest,nRandom )

		if nType == x300783_G_TYPE_SHOUJI then
			x300783_CheckShoujiHaveAll(varMap, varPlayer, nRandom)
		end

		GamePlayScriptLog(varMap, varPlayer, 1271)
		return 1
	else
		
		x300783_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end


function x300783_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300783_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务:"..x300783_var_QuestName;
	    x300783_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

	
		

		
		
	else
		x300783_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300783_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )
	
	
	
	if GetGameOpenById(x300783_var_GameId)<=0 then
		x300783_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	
	if x300783_CheckSubmit(varMap, varPlayer )>0 then
		if nType == x300783_G_TYPE_SHOUJI then
			if x300783_SubmitShouji(varMap, varPlayer,varTalknpc)<=0 then
				return 0
			end
		end
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then

			local varStr = "您完成了任务:"..x300783_var_QuestName;
			x300783_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			
			
			x300783_GiveReward(varMap,varPlayer)

			x300783_SaveQuestStep(varMap, varPlayer)

			 LuaCallNoclosure( 300783, "ProcEventEntry", varMap, varPlayer, varTalknpc, x300783_var_QuestId )	
			GamePlayScriptLog(varMap, varPlayer, 1272)
			
		else
			x300783_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end


function x300783_SubmitShouji(varMap, varPlayer,varTalknpc)
	
	
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )



	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	
	if nType ~= x300783_G_TYPE_SHOUJI then
		return 1
	end
	
	local itemid_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount

	
	if GetItemClass(itemid_t)~=10 then

		local varRet = DelItem(varMap, varPlayer,itemid_t,count_t)
		
		if varRet<=0 then
			x300783_ShowTips(varMap, varPlayer, "删除物品失败")
			
			return 0
		else
		
		end
	
	else
		
		
		
		local varItemCount = GetItemCount( varMap, varPlayer, itemid_t )
		
		StartGCDTask( varMap)
			GCDAppendInt( varMap, x300783_var_FileId)
			GCDAppendInt( varMap, varMyQuest)
			GCDAppendInt( varMap, varTalknpc)
			GCDAppendInt( varMap, itemid_t)
			
			
			DeliverGCDInfo( varMap, varPlayer, 106)  
		StopGCDTask( varMap)

		StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y"..x300783_var_QuestName)
			TalkAppendString( varMap, "\t你需要选择一件上交的物品" )
		StopTalkTask( varMap)
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)

		

		return 0
	end

	return 1
end

function x300783_ProcComitSubmitItem(varMap, varPlayer,varBagIdx)

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	
	if x300783_CheckSubmit(varMap, varPlayer )>0 then
		
		if EraseItem(varMap, varPlayer,varBagIdx)>0 then
			local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

			if varRet>0 then

				local varStr = "您完成了任务:"..x300783_var_QuestName;
				x300783_ShowTips(varMap, varPlayer, varStr)
				Msg2Player(varMap,varPlayer,varStr,8,2)

				
				
				x300783_GiveReward(varMap,varPlayer)

				x300783_SaveQuestStep(varMap, varPlayer)


				GamePlayScriptLog(varMap, varPlayer, 1272)
				
			else
				x300783_ShowTips(varMap, varPlayer, "交任务失败")
			end
		else
			x300783_ShowTips(varMap, varPlayer, "删除物品失败")
		end
		
	end
end



function x300783_GiveReward(varMap,varPlayer)
	
	if GetGameOpenById(x300783_var_GameId)<=0 then
		x300783_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if nType ==x300783_G_TYPE_SONGXIN then
	end
	
	AddExp(varMap,varPlayer,varExpBonus)
	StartTalkTask(varMap);
	TalkAppendString(varMap, "#o您获得了#R经验"..varExpBonus.."点#o的奖励");
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"#o您完成了【帮会】帮会跑环任务，获得了#R经验"..varExpBonus.."点#o的奖励",4,2)
	
	
end



function x300783_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300783_var_GameId)<=0 then
		x300783_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )


	

	if (varCompleted)<=0 then
		return 0
	end

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if nType==x300783_G_TYPE_SONGXIN then
	
	elseif nType == x300783_G_TYPE_SHOUJI then
		local itemid_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount
		local varItemCount = GetItemCount( varMap, varPlayer, itemid_t )
		if varItemCount<count_t then
			return 0
		end
		
	end

	return 1;
end









function x300783_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, nRandom )


	
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..x300783_var_QuestName)
	if nType == x300783_G_TYPE_SONGXIN then
		local strName = x300783_var_QuestTable1[varIndex].replynpclist[nRandom].varName
		TalkAppendString(varMap,x300783_var_QuestInfo1)
		TalkAppendString( varMap,"\n#Y任务目标:")
		TalkAppendString(varMap,"#W"..strName)
	elseif nType == x300783_G_TYPE_SHOUJI then
		local str1 = "收集"..x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount.."个#G@itemid_"..x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem.."\n"
		
		TalkAppendString(varMap,x300783_var_QuestInfo2)
		TalkAppendString( varMap,"\n#Y任务目标:")
		TalkAppendString(varMap,"#W"..str1)
	elseif nType == x300783_G_TYPE_KILL then
		local str1 =x300783_var_QuestTable3[varIndex].needkill[nRandom].varName.."\n"
		
		TalkAppendString(varMap,x300783_var_QuestInfo3)
		TalkAppendString( varMap,"\n#Y任务目标:")
		TalkAppendString(varMap,"#W"..str1)
	end
	
	
	

	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	

	StopTalkTask()

	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	
	


end










function x300783_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300783_GetQuestName(varMap,varPlayer),        
							x300783_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300783_GetReplyNpcId(varMap,varPlayer),			
							x300783_GetQuestMethod(varMap,varPlayer),               
							x300783_GetQuestText(varMap,varPlayer),	
							x300783_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x300783_GetQuestName(varMap,varPlayer)
	
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	return x300783_var_QuestName..format("(%d/%d)",varStep,x300783_GetMaxStep(varMap,varPlayer));
end

function x300783_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
	local value0 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value7 = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	local str1=""

	if nType == x300783_G_TYPE_SONGXIN then
		local strName = x300783_var_QuestTable1[varIndex].replynpclist[nRandom].varName
		str1 = format(""..strName.."(%d/1)",value0)

		if value0>=1 then
			str1 = "#G"..str1
		else
			str1 = "#W"..str1
		end

		return str1
		
	elseif nType == x300783_G_TYPE_SHOUJI then
		

		local varId = x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount
		
		local strTail = format("(%d/%d)",value0,count_t)
		if value0>=count_t then
			strTail = "#G"..strTail
		else
			strTail = "#W"..strTail
		end
		str1 = str1.."  #W收集"..count_t.."个#G@itemid_"..varId..strTail
		

		return str1
	elseif  nType == x300783_G_TYPE_KILL then
		local name_t = x300783_var_QuestTable3[varIndex].needkill[nRandom].varName
		local count_t = x300783_var_QuestTable3[varIndex].needkill[nRandom].varCount
		
		local strTail = format("(%d/%d)\n",value0,count_t)
		if value0>=count_t then
			strTail = "#G"..strTail
		else
			strTail = "#W"..strTail
		end
		str1 = str1.."#G"..name_t..strTail

		return str1
	end
	

	

	
end

function x300783_GetReplyNpcId(varMap,varPlayer)
	return x300783_var_ReplyNpcId;
end

function x300783_GetQuestMethod(varMap,varPlayer)
	

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local str1=""

	if nType == x300783_G_TYPE_SONGXIN then
		local strName = x300783_var_QuestTable1[varIndex].replynpclist[nRandom].varName
		str1 = ""..strName
	elseif nType == x300783_G_TYPE_SHOUJI then
		
		local varId = x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount
		
		str1 = str1.."\t#W收集"..count_t.."个#G@itemid_"..varId


	elseif nType == x300783_G_TYPE_KILL then
		local name_t = x300783_var_QuestTable3[varIndex].needkill[nRandom].varName
		local count_t = x300783_var_QuestTable3[varIndex].needkill[nRandom].varCount
		
		str1 = str1.."#G"..name_t


		
	end

	return str1
end

function x300783_GetQuestText(varMap,varPlayer)
	
	

	return x300783_var_QuestInfo
end

function x300783_GetQuestHelp(varMap,varPlayer)
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	if nType == x300783_G_TYPE_SONGXIN then
		return x300783_var_QuestHelp1
	elseif nType == x300783_G_TYPE_SHOUJI then
		return x300783_var_QuestHelp2
	elseif nType == x300783_G_TYPE_KILL then
		return x300783_var_QuestHelp3
	end

	return " "
	
end



function x300783_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300783_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300783_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if nType ~= x300783_G_TYPE_SONGXIN then
		return
	end

	if nType == x300783_G_TYPE_SONGXIN then
		if value1<=0 then
			local nReplyNpcId = x300783_var_QuestTable1[varIndex].replynpclist[nRandom].varId

			if varTalkNpcGUID==nReplyNpcId then
				TalkAppendButton(varMap, varMyQuest, x300783_var_QuestName,2,30);
			end
		end
		
	end
	
	

	
end




function x300783_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE[1], MD_GUILD_CIRCLE_MISSION_DATE[2],MD_GUILD_CIRCLE_MISSION_DATE[3] );
	
	if varToday>=varLastday then
		if (varToday-varLastday)>=x300783_var_nDaySpace then  
			return 0
		end
	else
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2],MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3] );

	return varDaycount, varLastday;

	

end




function x300783_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE[1], MD_GUILD_CIRCLE_MISSION_DATE[2], MD_GUILD_CIRCLE_MISSION_DATE[3])
	
	if varToday>=varLastday then
		if (varToday-varLastday)>=x300783_var_nDaySpace then  
			SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE[1], MD_GUILD_CIRCLE_MISSION_DATE[2], MD_GUILD_CIRCLE_MISSION_DATE[3], varToday)
			SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3], 1)
		else
			local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3])
			SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3], varDaycount+1)
		end
	else 
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE[1], MD_GUILD_CIRCLE_MISSION_DATE[2], MD_GUILD_CIRCLE_MISSION_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3], 1)
		
	end
	
	
	
	
end

function x300783_CheckSceneOnKill(varMap, varPlayer)
	return 1
end






function x300783_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

	
	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )

	local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
	for varI = 0, HumenNum-1 do
		local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
		if humanObjId ~= -1 then
			if IsHaveQuestNM( varMap, humanObjId, varMyQuest ) > 0 then	
				x300783_ProcValidKillObject( varMap, humanObjId, varObjData, varObj, varMyQuest )
			end
		end
	end
	
end

function x300783_ProcValidKillObject( varMap, varPlayer, varObjData, varObj, varQuest )

	if x300783_CheckSceneOnKill(varMap, varPlayer)<=0 then
		return 0;
	end

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )


	if varCompleted>0 then
		return
	end

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	if nType ~= x300783_G_TYPE_KILL then
		return
	end

	local bFind = 0
	local iIndex2 = 0
	


	if x300783_var_QuestTable3[varIndex].needkill[nRandom].typeid == varObjData then
		
		bFind =1 
			
	end	

	

	if bFind<=0 then
		return
	end
	
	local value = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )+1
	
	local count_t =x300783_var_QuestTable3[varIndex].needkill[nRandom].varCount
	local name_t = x300783_var_QuestTable3[varIndex].needkill[nRandom].varName

	local name1_t = x300783_var_QuestTable3[varIndex].needkill[nRandom].name1

	
	if count_t>=value then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, value )
		x300783_ShowTips(varMap, varPlayer, format("已杀死%s#Y(%d/%d)",name1_t,value,count_t))
		
		
		if count_t==value then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			x300783_ShowTips(varMap, varPlayer, "已完成任务:"..x300783_var_QuestName)
		end
	
	end

	x300783_QuestLogRefresh( varMap, varPlayer, varMyQuest );
	
end









function x300783_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest, nChangeType, varCount)

    local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if nType ~= x300783_G_TYPE_SHOUJI then
		return
	end

	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local itemid_t	= x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t	= x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount
	if itemid_t==varItemData then
		local Num = GetItemCount( varMap, varPlayer, varItemData )

		if Num<count_t then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
		else
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, count_t )
			
			local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

			if varCompleted<=0 then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
				
				
				
			end
		end
		
	end


	x300783_QuestLogRefresh( varMap, varPlayer, varMyQuest );

    
	
end

function x300783_CheckShoujiHaveAll(varMap, varPlayer, nRandom)
	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)

	if nType ~= x300783_G_TYPE_SHOUJI then
		return
	end

	local itemid_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
	x300783_ProcQuestItemChanged( varMap, varPlayer,itemid_t, -1, -1, -1)
	
end

function x300783_ProcSelectSubmitItem( varMap, varPlayer , varBagIdx, nGuid_Serial, nGuid_Server, nGuid_World)

	if x300783_CheckSubmit(varMap, varPlayer )<=0 then
		return 0
	end

	local varMyQuest = x300783_GetQuestId( varMap, varPlayer )
	
	if IsHaveQuest( varMap, varPlayer, varMyQuest) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)

	local varStep,nType,varIndex,varExpBonus = x300783_GetData(varMap, varPlayer)
	
	if nType ~= x300783_G_TYPE_SHOUJI then
		return 0
	end


	

	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local itemid_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t = x300783_var_QuestTable2[varIndex].needitem[nRandom].varCount

	if (CheckItemMatchInBag( varMap, varPlayer , varBagIdx, itemid_t,nGuid_Serial, nGuid_Server, nGuid_World))>0 then  
		x300783_ProcComitSubmitItem(varMap, varPlayer,varBagIdx)
	end
end



function x300783_ProcLeaveGuild(varMap, varPlayer, varQuest)

	DelQuestNM( varMap, varPlayer, varQuest)
	local message = format("您已经不在帮会中了，删除了任务：%s", x300783_var_QuestName);
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 8, 2);	
	
end




