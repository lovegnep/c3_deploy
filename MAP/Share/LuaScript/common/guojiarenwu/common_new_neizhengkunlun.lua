--DECLARE_QUEST_INFO_START--

x300512_var_FileId 					= 	300512                  
x300512_var_QuestId 				= 	10302                   

x300512_var_LevelLess					= 	25                      

x300512_var_QuestName				= 	"【个人】国家内政"
x300512_var_QuestTarget				= 	""          
x300512_var_ContinueInfo				= 	"\t怎么？你连这些简单的国家内政都无法完成？看来我们要另外物色人选了。"  
x300512_var_QuestCompleted			= 	"\t信已经送到了？"  
x300512_var_QuestHelp				=	""          
x300512_var_MoneyRage				= 	20

x300512_var_ExtTarget					=	{ {type=20,n=1 ,target=""} }

x300512_var_ExpBonus					= 	0   
x300512_var_BonusItem					=	{}	

x300512_var_BonusMoney1               = 	0   
x300512_var_BonusMoney2               =   0   
x300512_var_BonusMoney3               =   0   
x300512_var_BonusMoney4               =   0   
x300512_var_BonusMoney5               =   0   
x300512_var_BonusMoney6               =   0   

x300512_var_BonusChoiceItem           =   {}
x300512_var_GroupPoint	=	{ {type=10,varId =50,target = "苹果"},{type=10,varId =56,target = "野花"},{type=10,varId =58,target = "黑箱子"},{type=10,varId =55,target = "玉米"}}


--DECLARE_QUEST_INFO_STOP--


x300512_MP_QuestType			    = 1         
x300512_MP_TARGET2					= 2         
x300512_MP_TARGET3					= 3         
x300512_MP_TARGET4					= 4         
x300512_MP_TARGET5					= 5         
x300512_MP_TARGET6					= 6         
x300512_MP_FINISH                   = 7         
x300512_MP_ISCOMPLETE				= 0	        


x300512_var_GrowPoint				    = {
                    { type = 10, varId = 50,target = "苹果",  varItem = 13011500, posId = 81000, varCount = 3, description = "\t我家的宝儿非常想吃#G#{_ITEM13011500}#W，可是我现在脱不开身，所以麻烦你到@npcsp_罕难河草原_81000采一些给我。", tips = "#G点击寻路，找到并采集这些物品完成任务。#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W", Pos = "@npcsp_罕难河草原_81000" },
										{ type = 10, varId = 56,target = "野花",  varItem = 13011506, posId = 81003, varCount = 3, description = "\t相传在@npcsp_罕难河草原_81003有#G#{_ITEM13011506}#W，其蜜汁甘甜，十分解渴，你能带三个回来给我么？", tips = "#G点击寻路，找到并采集这些物品完成任务。#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W", Pos = "@npcsp_罕难河草原_81003" },
										{ type = 10, varId = 58,target = "黑箱子",varItem = 13011508, posId = 81005, varCount = 3, description = "\t我对@npcsp_王城南门附近_81005奇怪的#G#{_ITEM13011508}#W很感兴趣，你能带三个回来给我么？", tips = "#G点击寻路，找到并采集这些物品完成任务。#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W", Pos = "@npcsp_王城南门附近_81005" },
										{ type = 10, varId = 55,target = "玉米",  varItem = 13011505, posId = 81001, varCount = 3, description = "\t说来惭愧，由于我们运输不善，罕难河草原的粮食竟然还没运过来，去那里带些粮食回来吧。", tips = "#G点击寻路，找到并采集这些物品完成任务。#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W", Pos = "@npcsp_罕难河草原_81001" },
										
}

x300512_var_strAcceptQuest          = "您接受了任务：【个人】国家内政(%d/10)"

x300512_var_strAbandonQuest         = "您放弃了任务：【个人】国家内政(%d/10)"

x300512_var_strFinishQuest          = "您完成了任务：【个人】国家内政(%d/10)"

x300512_var_PunishTime                = 5

x300512_SubmitNPCGUID				= 129042

x300512_var_QuestTips               = "如果想了解国家内政的细节，请在@npc_129042处查看国家内政说明。"

x300512_var_QuestDescription        = "\t作为国家一员，要承担起强盛国家的重任，每日内政大臣处理的事情成百上千，请你也助上一臂之力。\n\t你是否要接受任务？"

x300512_var_QuestBook               = "回报@npc_129042"

x300512_var_HighBonusCircleCount      = 10

x300512_ProceRoundCount               = 10
x300512_var_QuestCommentCountOver   = "你今天不能再领取国家内政了，明天再来吧。"
x300512_var_strNotEnoughSpace         = "背包空间不足，无法接受任务"
x300512_var_strQuestFull            = "任务已满，任务接受失败"
x300512_var_strDeliverContinue        = "\t你还没把@item_%d#W送给@npc_%d呢。"
x300512_var_strDeliverComplete        = "\t我的心情好多了，谢谢你带来的消息！"
x300512_var_strKillContinue           = "\t你还没消灭#B%s#W呢。"
x300512_var_strKillComplete           = "\t太好了，你真是祖国的英雄！"
x300512_var_strEscortContinue         = "\t交给你的事都完成了？"
x300512_var_strEscortComplete         = "\t谢谢，你真是帮了大忙。"
x300512_var_strHorseCompinue          = "\t你捉到我要的马了吗？"
x300512_var_strHorseComplete          = "\t你捉到我要的马了吗？"
x300512_var_strMaterialContinue       = "\t我吩咐你的事情，你已经完成了吗？"
x300512_var_strMaterialComplete       = "\t真是太谢谢你的热心帮助了。"
x300512_var_strCollectContinue        = "\t你还没有采集到我要的东西呢。"
x300512_var_strCollectComplete        = "\t你做起事来还真是干净俐落，没想到你这么快就回来了。"
x300512_var_strDigContinue            = "\t你也无法找到它们的埋放地点吗？"
x300512_var_strDigComplete            = "\t恩，果然没错，看来这一带还会有更多的化石材料。"
x300512_var_strGoodHorse              = "\t这是一匹千载难逢的良马幼仔，你真的要把它交给国家吗？"
x300512_var_strNormalHorse            = "\t真是太好了，就在刚才我又收集到了几匹战马，照这个速度的话，用不了多久，我们的骑兵部队就能组建完成。"
x300512_var_strQuestFinishTip       = "任务已经完成，快点回去汇报吧！"
x300512_var_MT_Deliver                = 1
x300512_var_MT_KillMonster            = 2
x300512_var_MT_Collect                = 3
x300512_var_MT_Escort                 = 4
x300512_var_MT_Dig                    = 5
x300512_var_MT_Horse                  = 6
x300512_var_MT_Material               = 7
x300512_CountrySceneList	        = { 50, 150, 250, 350}
x300512_var_IsEnableId                = 1027

x300512_var_DeliverTable              = {
                                        { questItemId = 13011600, talking = "\t我知道了，到时候会将货物准时送达的！", description = "\t把这封信带给我的朋友，军队需要的货物都写在信上。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t我知道了，到时候会将货物准时送达的！", description = "\t前方来信说他们的物资需要补充，把这封信带给我的朋友，我要的货物都写在信上。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t谢谢，我一切安好，叫他放心吧。", description = "\t最近的几场战争让我很担心，把这封信带给我的朋友，提醒她注意安全。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t我知道了，到时候会将货物准时送达的！", description = "\t把这封信带给我的朋友，军队需要的货物都写在信上。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t谢谢你带来的这封信，万事俱备真是一个好消息。", description = "\t又见到你真是太好了，我这里有一件私事想要求你帮忙，请把这封信带给我的朋友，告诉他托付我的事情已经准备好了。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t谢谢，请你帮我转告他愿我们的友谊天长地久！", description = "\t战争阻碍了我们，我和我的那位朋友很久不见了，你帮我带封信去问候一下。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t我的心情好多了，谢谢你带来的消息！", description = "\t听说我的朋友最近心情很坏，你帮我带一封信安慰一下。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t我知道了，到时候会将货物准时送达的！", description = "\t把这封信带给我的朋友，我要的货物都写在信上。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t谢谢，请你帮我转告他愿我们的友谊天长地久！", description = "\t最近繁重的公务几乎占用了我所有的时间，我和我的朋友已经很久不见了，你帮我带封信去问候一下，让他知道我还没有忘记他这个老朋友。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t(看过信后，他长叹了一口气)\n\t谢谢你带来的这封信，不错，人不能一直沉浸在无尽的痛苦之中，毕竟我还有个大儿子。", description = "\t听说我朋友的小儿子在战斗中牺牲了，这件事对他的打击非常大，他的心情现在几近崩溃，请你帮我带这封信交给他，朋友的关怀或许可以缓解一下他内心的伤痛。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t感谢你带来的消息，感谢艾哈沐大人帮我儿子找到的这份好差事。", description = "\t不要多问，把这封信带给他，他正在等待。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t我的心情好多了，谢谢你带来的消息！", description = "\t战乱让他们妻离子散，我的朋友最近心情很坏，你帮我带一封信安慰一下。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t我的心情好多了，谢谢你带来的消息！", description = "\t听说西北叛军刚洗劫了他们那里，我很担心一位朋友的安全，你帮我带封信去问候一下。", tips = "" }, 
                                        { questItemId = 13011600, talking = "\t感谢你带来的消息。", description = "\t战乱让他们妻离子散，我的朋友最近心情很坏，你帮我带一封信安慰一下。", tips = "" }
}

x300512_var_DeliverTarget             = {
                                        { varTalknpc = 129003, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129039, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129006, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129007, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129018, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129019, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129020, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129021, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129022, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129023, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129024, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129025, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" }, 
                                        { varTalknpc = 129026, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)。" },
										{ varTalknpc = 129027, description = "\t把@item_%d#W送给@npc_%d#W或收集#G%d#W个@item_%d#W。" }
}

x300512_var_KillMonsterTable          = {
                                        { monsterId = 594, posId = 15021, varCount = 3, varName = "潜伏士兵", 
                                          target = "  前往@npcsp_塔塔尔部剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_塔塔尔部剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_15021！", tips = "" },  
                                        { monsterId = 630, posId = 16007, varCount = 3, varName = "乃蛮斥候", 
                                          target = "  前往@npcsp_克烈部剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_克烈部剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_16007！", tips = "" },  
                                        { monsterId = 748, posId = 105315, varCount = 3, varName = "塔塔尔士兵", 
                                          target = "  前往@npcsp_乃蛮部剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_乃蛮部剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_105315！", tips = "" },  
                                        { monsterId = 1013, posId = 19014, varCount = 3, varName = "群牧监守备", 
                                          target = "  前往@npcsp_太行山剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_太行山剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_19014！", tips = "" },  
                                        { monsterId =641, posId = 20018, varCount = 3, varName = "红寡妇", 
                                          target = "  前往@npcsp_凤翔府剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_凤翔府剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_20018！", tips = "" },  
                                        { monsterId = 1003, posId = 18018, varCount = 3, varName = "银狼", 
                                          target = "  前往@npcsp_阿尔金山剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_阿尔金山剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_18018！", tips = "" },  
                                        { monsterId = 680, posId = 21035, varCount = 3, varName = "猛安军溃兵", 
                                          target = "  前往@npcsp_蔡州城剧场_59632，消灭#R%d#W个@npc_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)",
                                          description = "\t我们不久前派出一些部下，试图穿越记忆之门和我们的祖先取得联系，可是他们在@npcsp_蔡州城剧场_59632处遭到了袭击，全军覆没。\n\t你现在赶去那里，除掉那些残暴的@npc_21035！", tips = "" },  
}

x300512_var_KillMonsterLevel          = {
                                        { minLevel = 25, maxLevel = 30, mosterSet = { 1 } }, 
                                        { minLevel = 30, maxLevel = 35, mosterSet = { 1, 2	} }, 
                                        { minLevel = 35, maxLevel = 40, mosterSet = { 1, 2, 3 } }, 
                                        { minLevel = 40, maxLevel = 50, mosterSet = { 1, 2 , 3, 4 } }, 
                                        { minLevel = 50, maxLevel =160, mosterSet = { 1, 2 , 3, 4, 5 } }, 
                                        
                                        
}

x300512_var_CollectLevel              = {
                                        { minLevel = 25, maxLevel = 160, gpSet = { 1, 2, 3, 4  } }, 
}

x300512_var_EscortTable               = {
                                        { escortType = 10,	varTalkNpcGUID = 129007,	varName = "骑乘恢复人",
                                            targetGuid = 129038,	targetname = "中原草药大师",	varQuestName = "马匹",
                                            finish = "\t谢谢你，总算是送来了，我正要再派人去催呢。",
                                            getmiss = "\t见到你太好了，#Y@myname#W，中原草药大师正需要一匹好马来帮她运送货物，我这里的人手现在很紧张，只好请你帮我把这匹马安全护送她那里去了，你愿意帮我这个忙么？",
                                            intro = "\t骑乘繁殖大师@npc_129007需要把战马送往各地，你去看看他那里有什么需要你帮忙的。",
                                            description = "描述。", 
                                            tips = "小提示。"
                                        }, 
                                        { escortType = 13, varTalkNpcGUID = 137815, varName = "矿主", 
                                            targetGuid = 137823, targetname = "大商贩", varQuestName = "矿车",
                                            finish = "\t又来了一辆矿车，非常感谢你！", 
                                            getmiss = "\t刚才@npc_137823又派人来催促这批矿了，我这里实在是脱不开身，你能帮我把这车矿送到他那里去么？", 
                                            intro = "\t哲别村的矿是我国矿的主要来源，你去@npc_137815那里看看有什么需要你帮忙的。",
                                            description = "描述。", 
                                            tips = "小提示。"
                                        }, 
                                        { escortType = 12, varTalkNpcGUID = 129016, varName = "耶律峰",
                                            targetGuid = 129177, targetname = "王城御卫长",   varQuestName = "村民",
                                            finish = "\t啊，这是谁家的孩子走丢了？好的，我会帮她找到父母的！", 
                                            getmiss = "\t你来的正好，#Y@myname#W，我还正在为怎么把这个迷路的小家伙送回家而发愁呢，我正有要事在身，所以想麻烦你帮我把这个小孩送到@npc_129177那里去，我知道你一定不会拒绝。", 
                                            intro = "\t听说@npc_129016遇到了一些麻烦，你去问问他有没有需要帮助的。",
                                            description = "描述。", 
                                            tips = "小提示。"
                                        }, 
                                        { escortType = 13, varTalkNpcGUID = 129181, varName = "城东商人", 
                                            targetGuid = 129077, targetname = "锻造大师",   varQuestName = "矿车",
                                            finish = "\t感谢你能及时把这个送过来，我们正等着用呢。", 
                                            getmiss = "\t#Y@myname#W，你来的正好，@npc_129077那里急需这些矿石，我现在有些更重要的事要忙，早听说过你不仅本领高强，而且侠义心肠，这车矿石对你来说应该不是什么麻烦吧？", 
                                            intro = "\t@npc_129181那里遇到了一点麻烦，你能去那边帮忙吗？",
                                            description = "描述。", 
                                            tips = "小提示。"
                                        }, 
                                        { escortType = 14, varTalkNpcGUID = 129182, varName = "城西商人",
                                            targetGuid = 129007, targetname = "骑乘恢复", varQuestName = "海货",
                                            finish = "\t啊，谢谢你，看来我们今天的晚餐会很丰盛。", 
                                            getmiss = "\t我手里的海产可是鼎鼎有名，慕名而来的人络绎不绝，上次@npc_129007订购了一些，不过我最近人手紧张，能麻烦你帮我送去么？", 
                                            intro = "\t王城汇聚了众多商人他们手里有很多珍奇物品，你去@npc_129182那边看看有什么可以帮得上的。",
                                            description = "描述。", 
                                            tips = "小提示。"
                                        }, 
                                        { escortType = 15, varTalkNpcGUID = 129066, varName = "王国押运官",
                                            targetGuid = 129177, targetname = "王城御卫长",   varQuestName = "朝廷圣物", 
                                            finish = "\t送来了么？唔，辛苦你了。", 
                                            getmiss = "\t这车中装的是朝廷的圣物，我物色了很久才决定请你担当起这个重要的职责，秘密地将它送到@npc_129177那里，千万不要走漏风声或者私自拆开查看，你知道，过度的好奇心有时候是很危险的。", 
                                            intro = "\t我接到一宗任务，但可惜抽不出身来，可否拜托你来替我做这件事呢？去找@npc_129066吧，他会告诉你更多的。",
                                            description = "描述。", 
                                            tips = "小提示。"
                                        }, 
}                                                                                                   

x300512_var_EscortLevel               = {
                                        { minLevel = 25, maxLevel = 39, quests = 
                                            { 1, 2, 3 }
                                        },
                                        { minLevel = 40, maxLevel = 160, quests = 
                                            { 1, 2, 3, 4, 5, 6 }
                                        },
}

x300512_var_DigTarget                 = {
                                        {   varId = 13013000, varName = "仙灵玉石", 
                                            target = "\t最近我观察圣山之上灵气异常，其地脉更是有仙龙为照，山中定然有很多鲜为人知的化石材料，请你首先到@npc_129003那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。或收集#G%d#W个@item_%d#W(2倍经验)。", 
                                        }, 
                                        {   varId = 13013001, varName = "仙灵光石", 
                                            target = "\t最近我观察圣山之上灵气异常，其地脉更是有仙龙为照，山中定然有很多鲜为人知的化石材料，请你首先到@npc_129003那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。或收集#G%d#W个@item_%d#W(2倍经验)。", 
                                        }, 
                                        {   varId = 13013002, varName = "仙灵彩石", 
                                            target = "\t最近我观察圣山之上灵气异常，其地脉更是有仙龙为照，山中定然有很多鲜为人知的化石材料，请你首先到@npc_129003那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。或收集#G%d#W个@item_%d#W(2倍经验)。", 
                                        }, 
                                        {   varId = 13013003, varName = "仙灵暗石", 
                                            target = "\t最近我观察圣山之上灵气异常，其地脉更是有仙龙为照，山中定然有很多鲜为人知的化石材料，请你首先到@npc_129003那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。或收集#G%d#W个@item_%d#W(2倍经验)。", 
                                        }, 
                                        {   varId = 13013004, varName = "仙灵玄石", 
                                            target = "\t最近我观察圣山之上灵气异常，其地脉更是有仙龙为照，山中定然有很多鲜为人知的化石材料，请你首先到@npc_129003那里购买一个铁铲，用铁铲去#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE附近探索一番，看看有没有#G%s#W。或收集#G%d#W个@item_%d#W(2倍经验)。", 
                                        }, 
}

x300512_var_DigLevel                  = {
                                        { minLevel = 25, maxLevel = 160, quests = 
                                            { 1, 2, 3 , 4, 5}
                                        },

}

x300512_var_CoordinateLib             = {
                                        { posX = 53, posZ = 62  }, 
                                        { posX = 81, posZ = 433  }, 
                                        { posX = 109, posZ = 260  }, 
                                        { posX = 303, posZ = 328  }, 
                                        { posX = 452, posZ = 210 }, 
}

x300512_var_GetHorse                  = {
                                        { varId = 101, varName = "蒙古马", 
                                          info = "\t国家正在征收战马，以供前线，如果你有#G%s#W，请务必上交给我。当然，如果你能找到一匹#G良品以上的%s#W来，我会给你更好的奖励。", 
                                          description = "\t前往@npcsp_马场_90200收集一匹普通或良品(2倍经验)#G%s。"
                                        }, 
                                        { varId = 201, varName = "三河马", 
                                          info = "\t国家正在征收战马，以供前线，如果你有#G%s#W，请务必上交给我。当然，如果你能找到一匹#G良品以上的%s#W来，我会给你更好的奖励。", 
                                          description = "\t前往@npcsp_马场_90201收集一匹普通或良品(2倍经验)#G%s。"
                                        }, 
                                        { varId = 301, varName = "伊犁马", 
                                          info = "\t国家正在征收战马，以供前线，如果你有#G%s#W，请务必上交给我。当然，如果你能找到一匹#G良品以上的%s#W来，我会给你更好的奖励。", 
                                          description = "\t前往@npcsp_马场_90202收集一匹普通或良品(2倍经验)#G%s。"
                                        }, 
                                        { varId = 401, varName = "波斯马", 
                                          info = "\t国家正在征收战马，以供前线，如果你有#G%s#W，请务必上交给我。当然，如果你能找到一匹#G良品以上的%s#W来，我会给你更好的奖励。", 
                                          description = "\t前往@npcsp_马场_90203收集一匹普通或良品(2倍经验)#G%s。"
                                        },
                                        { varId = 501, varName = "天方马", 
                                          info = "\t国家正在征收战马，以供前线，如果你有#G%s#W，请务必上交给我。当然，如果你能找到一匹#G良品以上的%s#W来，我会给你更好的奖励。", 
                                          description = "\t前往@npcsp_马场_90204收集一匹普通或良品(2倍经验)#G%s。"
                                        },
}

x300512_var_GetHorseLevel             = { 
                                        { minLevel = 25, maxLevel = 39, quests = 
                                            { 1 }
                                            },
                                        { minLevel = 40, maxLevel = 59, quests = 
                                            { 2 }
                                            },
                                        { minLevel = 60, maxLevel = 160, quests = 
                                            { 3, 4, 5}                                                                        
                                            },
}

x300512_var_MaterialTable             = {
                                        { base = 12010100, 
                                          advanced = { 12010101, 12010101, 12010101 },
                                          xpCoff = { 2, 2, 2 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  收集@item_%d",
                                          description = "\t一位统领在和海盗的厮杀中受了重伤，当务之急是给他止血，马奶是疗伤的良药我们正在努力收集。",
                                          target = "  收集@item_%d#W或@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10011101, 
                                          advanced = { 11041030, 11041030, 11041030 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129027处购买@item_%d",
                                          description = "\t我们军方储备的武器已经不足以装备那支刚组成的部队了，你去@npc_129027那里买一件武器来给我，我要看看适不适合大批量的采购。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10021101, 
                                          advanced = { 11041030, 11041030, 11041030 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129027处购买@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10041101, 
                                          advanced = { 11041030, 11041030, 11041030 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129027处购买@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10051101, 
                                          advanced = { 11041050, 11041050, 11041050 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129027处购买@item_%d",
                                          description = "\t我们军方储备的武器已经不足以装备那支刚组成的部队了，你去@npc_129027那里买一件武器来给我，我要看看是不适合大批量的采购。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10061101, 
                                          advanced = { 11041050, 11041050, 11041050 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129027处购买@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10031101, 
                                          advanced = { 11041000, 11041000, 11041000 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129027处购买@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10261101, 
                                          advanced = { 11041000, 11041000, 11041000 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129026处购买@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10231101, 
                                          advanced = { 11041040, 11041040, 11041040 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129026处购买@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10271101, 
                                          advanced = { 11041040, 11041040, 11041040 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129026处购买收集@item_%d",
                                          description = "\t我们的一个士兵要运送一批物资补给前线的战士们，可是现在国库积攒的物资实在难以为继，希望你能帮帮忙。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10201101, 
                                          advanced = { 11041020, 11041020, 11041020 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "  去@npc_129026处购买@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10251101, 
                                          advanced = { 11041020, 11041020, 11041020 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t去@npc_129026处购买@item_%d",
                                          description = "\t为了对付叛军，我们训练的强度很大，但是我们的军械物资奇缺，可否帮我们解决一些。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10241101, 
                                          advanced = { 11041010, 11041010, 11041010 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t去@npc_129026处购买@item_%d",
                                          description = "\t为了对付叛军，我们训练的强度很大，但是我们的军械物资奇缺，可否帮我们解决一些。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 12010001, 
                                          advanced = { 11041010, 11041010, 11041010 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129025处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10011102, 
                                          advanced = { 11041030, 11041031 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们军方储备的武器已经不足以装备那支刚组成的部队了，你去@npc_129027那里买一件武器来给我，我要看看是不适合大批量的采购。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10021102, 
                                          advanced = { 11041030, 11041031 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10041102, 
                                          advanced = { 11041030, 11041031 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10051102, 
                                          advanced = { 11041050, 11041051 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10061102, 
                                          advanced = { 11041050, 11041051 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们军方储备的武器已经不足以装备那支刚组成的部队了，你去@npc_129027那里买一件武器来给我，我要看看是不适合大批量的采购。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10031102, 
                                          advanced = { 11041000, 11041001 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129027处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10261102, 
                                          advanced = { 11041000, 11041001 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10231102, 
                                          advanced = { 11041040, 11041041 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们的一个士兵要运送一批物资补给前线的战士们，可是现在国库积攒的物资实在难以为继，希望你能帮帮忙。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10271102, 
                                          advanced = { 11041040, 11041041 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10201102, 
                                          advanced = { 11041020, 11041021 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t天冷了，我们征讨叛军的军队需要补给，王城装备武器等店的东西物美价廉，可否代为购买以些。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10251102, 
                                          advanced = { 11041020, 11041021 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们的一个士兵要运送一批物资补给前线的战士们，可是现在国库积攒的物资实在难以为继，希望你能帮帮忙。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10241102, 
                                          advanced = { 11041010, 11041011 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t为了对付叛军，我们训练的强度很大，但是我们的军械物资奇缺，可否帮我们解决一些。",
                                          target = "  去@npc_129026处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 12010002, 
                                          advanced = { 11041010, 11041011 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t为了对付叛军，我们训练的强度很大，但是我们的军械物资奇缺，可否帮我们解决一些。",
                                          target = "  去@npc_129025处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10011106, 
                                          advanced = { 11041030, 11041031, 11041032 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们军方储备的武器已经不足以装备那支刚组成的部队了，你去@npc_139057那里买一件武器来给我，我要看看是不适合大批量的采购。",
                                          target = "  去大都@npc_139057处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10021106, 
                                          advanced = { 11041030, 11041031, 11041032 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去大都@npc_139057处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10041106, 
                                          advanced = { 11041030, 11041031, 11041032 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t天冷了，我们征讨叛军的军队需要补给，王城装备武器等店的东西物美价廉，可否代为购买以些。",
                                          target = "  去大都@npc_139057处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10051106, 
                                          advanced = { 11041050, 11041051, 11041052 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们军方储备的武器已经不足以装备那支刚组成的部队了，你去@npc_129027那里买一件武器来给我，我要看看是不适合大批量的采购。",
                                          target = "  去大都@npc_139057处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10061106, 
                                          advanced = { 11041050, 11041051, 11041052 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们的一个士兵要运送一批物资补给前线的战士们，可是现在国库积攒的物资实在难以为继，希望你能帮帮忙。",
                                          target = "  去大都@npc_139057处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10031106, 
                                          advanced = { 11041000, 11041001, 11041002 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t太子决定派出戍边军平息王城附近的乱匪，现在军用物资短缺，你可否帮忙收集一些。",
                                          target = "  去大都@npc_139057处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10261106, 
                                          advanced = { 11041000, 11041001, 11041002 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t天冷了，我们征讨叛军的军队需要补给，王城装备武器等店的东西物美价廉，可否代为购买以些。",
                                          target = "  去大都@npc_139058处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10231106, 
                                          advanced = { 11041040, 11041041, 11041042 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t天冷了，我们征讨叛军的军队需要补给，王城装备武器等店的东西物美价廉，可否代为购买以些。",
                                          target = "  去大都@npc_139058处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10271106, 
                                          advanced = { 11041040, 11041041, 11041042 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们的一个士兵要运送一批物资补给前线的战士们，可是现在国库积攒的物资实在难以为继，希望你能帮帮忙。",
                                          target = "  去大都@npc_139058处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10201106, 
                                          advanced = { 11041020, 11041021, 11041022 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t我们的一个士兵要运送一批物资补给前线的战士们，可是现在国库积攒的物资实在难以为继，希望你能帮帮忙。",
                                          target = "  去大都@npc_139058处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10251106, 
                                          advanced = { 11041020, 11041021, 11041022 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去大都@npc_139058处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 10241106, 
                                          advanced = { 11041010, 11041011, 11041012 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去大都@npc_139058处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        }, 

                                        { base = 12010003, 
                                          advanced = { 11041010, 11041011, 11041012 },
                                          xpCoff = { 2, 3,  4 },
                                          money = { 2000, 5000, 12000 },
                                          baseTarget = "\t收集@item_%d",
                                          description = "\t又要开始战争了，我们目前急于储备的军械物资。",
                                          target = "  去@npc_129025处购买@item_%d#W或去收集@item_%d#W(%d倍经验)#W"
                                        },                                                                               
}

x300512_var_MaterialLevel             = {
                                        { minLevel = 25, maxLevel = 39, quests = 
                                            { 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14 }, choose = 1
                                        },
                                        { minLevel = 40, maxLevel = 59, quests = 
                                            { 1, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27 }, choose = 2
                                        },
                                        { minLevel = 60, maxLevel = 160, quests = 
                                            { 1, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40 }, choose = 3
                                        },
}

x300512_var_EscortMaxDistance         = 20

x300512_var_QuestType               = 0

x300512_var_Item2Level                = {
                                        { minLevel = 25, maxLevel = 39, 
                                          items = {
                                                    { varId = 11020001, varCount = 10 }, 
                                                    { varId = 11020002, varCount = 10 }, 
                                                    { varId = 11030001, varCount = 10 }, 
                                                    { varId = 11030401, varCount = 10 }, 
                                                }
                                        }, 
                                        { minLevel = 40, maxLevel = 59, 
                                          items = {
                                                    { varId = 11020001, varCount = 10 }, 
                                                    { varId = 11020002, varCount = 10 }, 
                                                    { varId = 11030001, varCount = 10 }, 
                                                    { varId = 11030401, varCount = 10 }, 
                                                    { varId = 11020006, varCount = 10 }, 
                                                    { varId = 11020007, varCount = 10 }, 
                                                    { varId = 11030003, varCount = 10 }, 
                                                    { varId = 11030402, varCount = 10 }, 
                                                }
                                        }, 
                                        { minLevel = 60, maxLevel = 69, 
                                          items = {
                                                    { varId = 11020001, varCount = 10 }, 
                                                    { varId = 11020002, varCount = 10 }, 
                                                    { varId = 11030001, varCount = 10 }, 
                                                    { varId = 11030401, varCount = 10 }, 
                                                    { varId = 11020006, varCount = 10 }, 
                                                    { varId = 11020007, varCount = 10 }, 
                                                    { varId = 11030003, varCount = 10 }, 
                                                    { varId = 11030402, varCount = 10 }, 
                                                    { varId = 11020010, varCount = 10 }, 
                                                    { varId = 11020011, varCount = 10 }, 
                                                    { varId = 11030005, varCount = 10 }, 
                                                    { varId = 11030404, varCount = 10 }, 
                                                }
                                        }, 
                                        { minLevel = 70, maxLevel = 255, 
                                          items = {
                                                    { varId = 11020001, varCount = 10 }, 
                                                    { varId = 11020002, varCount = 10 }, 
                                                    { varId = 11030001, varCount = 10 }, 
                                                    { varId = 11030401, varCount = 10 }, 
                                                    { varId = 11020006, varCount = 10 }, 
                                                    { varId = 11020007, varCount = 10 }, 
                                                    { varId = 11030003, varCount = 10 }, 
                                                    { varId = 11030402, varCount = 10 }, 
                                                    { varId = 11020010, varCount = 10 }, 
                                                    { varId = 11020011, varCount = 10 }, 
                                                    { varId = 11030005, varCount = 10 }, 
                                                    { varId = 11030404, varCount = 10 }, 
                                                    { varId = 11020015, varCount = 10 }, 
                                                    { varId = 11020014, varCount = 10 }, 
                                                    { varId = 11030007, varCount = 10 }, 
                                                    { varId = 11030404, varCount = 10 }, 
                                                }
                                        }, 
}

x300512_var_FinishBound               = 1000

function x300512_GetRandomItemID( varLevel)
    for varI, item in x300512_var_Item2Level do
        if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            return item.items[ random( 1, getn( item.items) ) ]
        end
    end
end


function x300512_GetDeliverQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetDeliverQuestImpl( varMap, varPlayer, varTalknpc)
end


function x300512_GetKillMonsterQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetKillMonsterQuestImpl( varMap, varPlayer, varTalknpc)
end


function x300512_GetCollectQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetCollectQuestImpl( varMap, varPlayer, varTalknpc)
end


function x300512_GetEscortQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetEscortQuestImpl( varMap, varPlayer, varTalknpc)
end


function x300512_GetDigQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetDigQuestImpl( varMap, varPlayer, varTalknpc)
end


function x300512_GetObtainHorseQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetObtainHorseQuestImpl( varMap, varPlayer, varTalknpc)
end


function x300512_GetObtainMaterialQuest( varMap, varPlayer, varTalknpc)
    return x300512_GetObtainMaterialQuestImpl( varMap, varPlayer, varTalknpc)
end


x300512_var_GetQuestHead            = {
                                        x300512_GetDeliverQuest,     
                                        x300512_GetKillMonsterQuest, 
                                        x300512_GetCollectQuest,     
                                        x300512_GetEscortQuest,      
                                        x300512_GetDigQuest          
}

x300512_var_GetQuestEnd             = {
                                        x300512_GetObtainHorseQuest,      
                                        x300512_GetObtainMaterialQuest    
}

x300512_var_HeadQuestTable          = {
                                        {
                                            low = 25, high = 30,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 31, high = 35,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 36, high = 40,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 41, high = 45,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 46, high = 50,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 51, high = 55,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 56, high = 60,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
                                        {
                                            low = 60, high = 160,            
                                            config = { 20, 20, 20, 20, 20 },
                                        },
}

x300512_var_EndQuestTable           = {
                                        {
                                            low = 25, high = 30,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 31, high = 35,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 36, high = 40,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 41, high = 45,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 46, high = 50,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 51, high = 55,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 56, high = 60,            
                                            config = { 20, 80 },            
                                        },
                                        {
                                            low = 61, high = 160,           
                                            config = { 20, 80 },            
                                        },
}

function x300512_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x300512_var_IsEnableId) <= 0 then
        return 0
    end

	local varLevel = GetLevel( varMap, varPlayer)
	if varLevel < x300512_var_LevelLess then
		 return
	end

    
    local oldQuestId = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID)
    if oldQuestId > 0 then
        if IsHaveQuest( varMap, varPlayer, oldQuestId) > 0 then
            return
        else
            x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID, 0)
        end
    end

    local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300512_var_QuestId)
    TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, varState, 1)
end

function x300512_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExtIdx)	
	if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) > 0 then 
        local varDone = x300512_CheckSubmit( varMap, varPlayer, varTalknpc)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
        if varDone > 0 then
            
            if GetMonsterGUID( varMap, varTalknpc) == x300512_SubmitNPCGUID then
                local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
                local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
                local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
                local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
                if misType == x300512_var_MT_Material then
                    StartGCDTask( varMap)
                        GCDAppendInt( varMap, x300512_var_FileId)
                        GCDAppendInt( varMap, x300512_var_QuestId)
                        GCDAppendInt( varMap, varTalknpc)
                        GCDAppendInt( varMap, x300512_var_MaterialTable[ varIndex].base)
                        GCDAppendInt( varMap, x300512_var_MaterialTable[ varIndex].advanced[ mp3] )
                        DeliverGCDInfo( varMap, varPlayer, 104)
                    StopGCDTask( varMap)

                    StartTalkTask( varMap)
                    TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
                        TalkAppendString( varMap, "\t你想上交哪个物品呢？" )
                    StopTalkTask( varMap)
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                    return
                elseif misType == x300512_var_MT_Horse then
                    
                    StartGCDTask( varMap)
                        GCDAppendInt( varMap, x300512_var_FileId)
                        GCDAppendInt( varMap, x300512_var_QuestId)
                        GCDAppendInt( varMap, varTalknpc)
                        DeliverGCDInfo( varMap, varPlayer, 101)
                    StopGCDTask( varMap)

                    StartTalkTask( varMap)
                        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
                        TalkAppendString( varMap, "\t你想上交哪匹马呢？" )
                    StopTalkTask( varMap)
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                    return
                else
                    local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5)
                    local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
                    if varCount > x300512_var_FinishBound then
                        varCount = varCount - x300512_var_FinishBound
                    end
                    if GetItemCountInBag( varMap, varPlayer, varId) >= varCount then
                        StartGCDTask( varMap)
                            GCDAppendInt( varMap, x300512_var_FileId)
                            GCDAppendInt( varMap, x300512_var_QuestId)
                            GCDAppendInt( varMap, varTalknpc)
                            GCDAppendInt( varMap, varId)
                            DeliverGCDInfo( varMap, varPlayer, 104)
                        StopGCDTask( varMap)

                        StartTalkTask( varMap)
                        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
                            TalkAppendString( varMap, "\t您可以通过选择提交右侧框中的材料，来获得两倍经验和银子的奖励。\n\t如果你点击右侧框中的取消，或关闭右侧框体，你会获得普通的奖励。" )
                        StopTalkTask( varMap)
                        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                    else
                        x300512_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
                    end
                end
            else
                x300512_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
            end
        else
            x300512_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
        end
	else 
        if GetGameOpenById( x300512_var_IsEnableId) <= 0 then
            return 0
        end

        
        local highcircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH)
        if x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) == GetDayOfYear() then
            if highcircle >= x300512_var_HighBonusCircleCount then
                Msg2Player( varMap, varPlayer, x300512_var_QuestCommentCountOver, 8, 2)
                Msg2Player( varMap, varPlayer, x300512_var_QuestCommentCountOver, 8, 3)
                return
            end
        end
		x300512_DispatchQuestInfo( varMap, varPlayer, varTalknpc)	
	end
end

function x300512_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
end


function x300512_GetDeliverQuestImpl( varMap, varPlayer, varTalknpc)
    
    StartItemTask( varMap)
    local varIndex = random( 1, getn( x300512_var_DeliverTable) )
    local item = x300512_var_DeliverTable[ varIndex].questItemId
    ItemAppend( varMap, item, 1)
    local result = StopItemTask( varMap, varPlayer)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strNotEnoughSpace, 8, 3)
        return result
    end

    
    DeliverItemListSendToPlayer( varMap, varPlayer)

    
    result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 0, 0, 1, 1)
    if result == 0 then
        
        if DelItem( varMap, varPlayer, item, 1) ~= 1 then return 0 end
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local tindex = random( 1, getn( x300512_var_DeliverTarget) )
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_Deliver)
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, x300512_var_DeliverTarget[ tindex].varTalknpc)
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3, varIndex)
    
    local ritem = x300512_GetRandomItemID( GetLevel( varMap, varPlayer) )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5, ritem.varId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, ritem.varCount)

    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, x300512_var_DeliverTable[ varIndex].description)
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( x300512_var_DeliverTarget[ tindex].description, 
                                       x300512_var_DeliverTable[ varIndex].questItemId, 
                                       x300512_var_DeliverTarget[ tindex].varTalknpc, 
                                       ritem.varCount, ritem.varId) )
        TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetKillMonsterQuestImpl( varMap, varPlayer, varTalknpc)
    
    local result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 1, 0, 1, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end

    
    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    for varI, item in x300512_var_KillMonsterLevel do
        if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            varIndex = item.mosterSet[ random( 1, getn( item.mosterSet) ) ]
            break
        end
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_KillMonster)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, varIndex)
    
    local ritem = x300512_GetRandomItemID( GetLevel( varMap, varPlayer) )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5, ritem.varId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, ritem.varCount)

    local varCount = x300512_var_KillMonsterTable[ varIndex].varCount
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, x300512_var_KillMonsterTable[ varIndex].description)
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( x300512_var_KillMonsterTable[ varIndex].target, 
                                       varCount, x300512_var_KillMonsterTable[ varIndex].posId, 0, varCount, 
                                       ritem.varCount, ritem.varId) )
        TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetCollectQuestImpl( varMap, varPlayer, varTalknpc)
    
    local result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 0, 0, 1, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end

    
    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    for varI, item in x300512_var_CollectLevel do
        if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            varIndex = item.gpSet[ random( 1, getn( item.gpSet) ) ]
            break
        end
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_Collect)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, varIndex)
    
    local ritem = x300512_GetRandomItemID( GetLevel( varMap, varPlayer) )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5, ritem.varId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, ritem.varCount)

    local varCount = x300512_var_KillMonsterTable[ varIndex].varCount
    local varItem = x300512_var_GrowPoint[ varIndex].varItem
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, x300512_var_GrowPoint[ varIndex].description)
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( "采集@item_%d#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)", 
                                       varItem, GetItemCountInBag( varMap, varPlayer, varItem), x300512_var_GrowPoint[ varIndex].varCount, 
                                       ritem.varCount, ritem.varId) )
        TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetEscortQuestImpl( varMap, varPlayer, varTalknpc)
    
    local result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 0, 0, 1, 1)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end

    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    for varI, item in x300512_var_EscortLevel do
         if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            varIndex = item.quests[ random( 1, getn( item.quests) ) ]
            break
        end
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_Escort)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, varIndex)
    
    local ritem = x300512_GetRandomItemID( GetLevel( varMap, varPlayer) )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5, ritem.varId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, ritem.varCount)

    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, x300512_var_EscortTable[ varIndex].intro..format( "或收集#G%d#W个@item_%d#W。", ritem.varCount, ritem.varId) )
        TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetDigQuestImpl( varMap, varPlayer, varTalknpc)
    
    local result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 0, 0, 1, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end

    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    for varI, item in x300512_var_DigLevel do
         if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            varIndex = item.quests[ random( 1, getn( item.quests) ) ]
            break
        end
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local coord = random( 1, getn( x300512_var_CoordinateLib) )
    local posX, posZ
    posX = x300512_var_CoordinateLib[ coord].posX
    posZ = x300512_var_CoordinateLib[ coord].posZ
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_Dig)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, varIndex)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3, coord)
    
    local ritem = x300512_GetRandomItemID( GetLevel( varMap, varPlayer) )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5, ritem.varId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, ritem.varCount)

    local destSceneId = x300512_CountrySceneList[ GetCurCountry( varMap, varPlayer) + 1]
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( x300512_var_DigTarget[ varIndex].target, 
                                       destSceneId, posX, posZ, posX, posZ, x300512_var_DigTarget[ varIndex].varName, 
                                       ritem.varCount, ritem.varId) )
        TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetObtainHorseQuestImpl( varMap, varPlayer, varTalknpc)
    
    local result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 0, 0, 0, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end

    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    for varI, item in x300512_var_GetHorseLevel do
        if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            varIndex = item.quests[ random( 1, getn( item.quests) ) ]
            break
        end
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_Horse)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, varIndex)
    
    SetQuestEvent( varMap, varPlayer, x300512_var_QuestId, 3)

    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, format( x300512_var_GetHorse[ varIndex].info, x300512_var_GetHorse[ varIndex].varName, x300512_var_GetHorse[ varIndex].varName) )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( x300512_var_GetHorse[ varIndex].description, x300512_var_GetHorse[ varIndex].varName) )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetObtainMaterialQuestImpl( varMap, varPlayer, varTalknpc)
    
    local result = AddQuest( varMap, varPlayer, x300512_var_QuestId, x300512_var_FileId, 0, 0, 1, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFull, 8, 3)
        return result
    end

    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    local choose = 1
    for varI, item in x300512_var_MaterialLevel do
        if varLevel >= item.minLevel and varLevel <= item.maxLevel then
            varIndex = item.quests[ random( 1, getn( item.quests) ) ]
            choose = random( 1, item.choose)
            break
        end
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType, x300512_var_MT_Material)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2, varIndex)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3, choose)

	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, x300512_var_MaterialTable[ varIndex].description)
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( x300512_var_MaterialTable[ varIndex].target, x300512_var_MaterialTable[ varIndex].base, x300512_var_MaterialTable[ varIndex].advanced[ choose], x300512_var_MaterialTable[ varIndex].xpCoff[ choose] ) )
        TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    return 1
end


function x300512_GetFuncIndex( varMap, varPlayer, misType)
    local varLevel = GetLevel( varMap, varPlayer)
    local tbl = x300512_var_HeadQuestTable

    if misType == 1 then
        tbl = x300512_var_EndQuestTable
    end

    
    local varAmount = 0
    for varI, item in tbl do
        if varLevel >= item.low and varLevel <= item.high then
            for j, iter in item.config do
                varAmount = varAmount + iter
            end
            break
        end
    end

    
    local rate = 1
    if varAmount >= 1 then
        rate = random( 1, varAmount)
    end
    local up = 1
    local down = 1
    local result = 1
    for varI, item in tbl do
        if varLevel >= item.low and varLevel <= item.high then
            for j, iter in item.config do
                
                up = down + iter
                if rate >= down and rate < up then
                    result = j
                    break
                end
                
                down = down + iter
            end
            break
        end
    end

    return result
end

function x300512_DeliverQuest( varMap, varPlayer)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local finish   = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local complete = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
    local varLevel = GetLevel( varMap, varPlayer)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    local times = 1
    local xp = x300512_GetExpAward( varMap, varPlayer, varLevel) * times
    local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)
    
    local bItem = 0
	local advMaterial = 0
	
	if GetGameOpenById( x300512_var_IsEnableId) <= 0 then
		return 0
	end

	
	local highcircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH)
	if x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) == GetDayOfYear() then
		if highcircle >= x300512_var_HighBonusCircleCount then
			Msg2Player( varMap, varPlayer, x300512_var_QuestCommentCountOver, 8, 2)
			Msg2Player( varMap, varPlayer, x300512_var_QuestCommentCountOver, 8, 3)
			return
		end
	end	

    if misType ~= x300512_var_MT_Material and misType ~= x300512_var_MT_Horse then
        if GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID) == 1 then
            local cnt = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
            if cnt > x300512_var_FinishBound then
                cnt = cnt - x300512_var_FinishBound
            end
            if DelItem( varMap, varPlayer, GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5), cnt) == 0 then
                Msg2Player( varMap, varPlayer, "提交物品失败，无法交任务", 8, 3)
                return
            end
            SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
            money = money * 4
            xp = xp * 2
            bItem = 1
        end
    end

    if misType == x300512_var_MT_Dig and GetItemCountInBag( varMap, varPlayer, x300512_var_DigTarget[ varIndex].varId) > 0 then
        
        if DelItem( varMap, varPlayer, x300512_var_DigTarget[ varIndex].varId, 1) == 0 then
            return
        end
    elseif misType == x300512_var_MT_Horse then
        local horseGUID_high = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
        local horseGUID_low = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5)
        local isGood = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
        local result = FreeHorse( varMap, varPlayer, horseGUID_high, horseGUID_low)
        if result <= 0 then
            return
        end
        if isGood == 1 then
            times = 2
        end
    elseif misType == x300512_var_MT_Collect then
        local varCount = GetItemCountInBag( varMap, varPlayer, x300512_var_GrowPoint[ varIndex].varItem)
        if varCount > 0 then
            if DelItem( varMap, varPlayer, x300512_var_GrowPoint[ varIndex].varItem, varCount) == 0 then
                Msg2Player( varMap, varPlayer, "提交物品失败，无法交任务", 8, 3)
                return 0
            end
        end
    elseif misType == x300512_var_MT_Material then
        if GetItemCountInBag( varMap, varPlayer, mp4) == 0 then
            Msg2Player( varMap, varPlayer, "你没有这个物品或该物品处于锁定状态", 8, 3)
            return
        else
            if DelItem( varMap, varPlayer, mp4, 1) == 0 then
                Msg2Player( varMap, varPlayer, "交付物品失败，可能是该物品处于锁定状态或已遗失", 8, 3)
                return
            end
        end
        if mp4 ~= x300512_var_MaterialTable[ varIndex].base then
            
            for varI, item in x300512_var_MaterialTable[ varIndex].advanced do
                if item == mp4 then
                    money = x300512_var_MaterialTable[ varIndex].money[ varI] * x300512_var_MoneyRage
                    xp = xp * x300512_var_MaterialTable[ varIndex].xpCoff[ varI]
					advMaterial = 1
                    break
                end
            end
        end
    elseif misType == x300512_var_MT_Deliver and bItem == 1 then
        
        if GetItemCountInBag( varMap, varPlayer, x300512_var_DeliverTable[ mp3].questItemId) > 0 then
            if DelItem( varMap, varPlayer, x300512_var_DeliverTable[ mp3].questItemId, 1) == 0 then
                return
            end
        end
    end
    
	x300512_DeleteQuestBus(varMap,varPlayer)
    DelQuest( varMap, varPlayer, x300512_var_QuestId)
    --活跃度
    GamePlayScriptLog( varMap, varPlayer, 11275)
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,1)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,1)
    if misType ~= x300512_var_MT_Material then
        money = money * times
        shengw = shengw * times
    end
    xp = xp * times
    if( xp > 0) then
        AddExp( varMap, varPlayer, xp)
          local multi = x300512_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(xp*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(xp*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(xp*multi)), 8, 3)
        	end
    end
    
    local moneyType = 0
    if money > 0 then
		-- 如果有江湖请柬才给现银
		if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
			AddMoney( varMap, varPlayer, 0, money)
			-- 如果有朝廷请柬多给金卡
			if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then 
				AddMoney( varMap, varPlayer, 3, money);
			end 
		else
			if misType == x300512_var_MT_Material then
				if advMaterial == 0 then
					AddMoney( varMap, varPlayer, 1, money)
				else
					AddMoney( varMap, varPlayer, 0, money)
				end
			else
				AddMoney( varMap, varPlayer, 1, money)
			end
		end
    end
    if( shengw > 0) then
        SetShengWang(varMap, varPlayer, GetShengWang( varMap, varPlayer) + shengw)
    end
    x300512_DisplayAwardInfo( varMap, varPlayer, moneyType, money, xp, 0, shengw)
    local varText = format( x300512_var_strFinishQuest, x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1)
    local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)
    if varLevel >= 80 then
        local tf = ( highcircle + 1) * 25
        local refixtf = AddInherenceExp( varMap, varPlayer, tf)
        Msg2Player( varMap, varPlayer, format( "获得#R%s#cffcc00点天赋奖励。", refixtf), 8, 2)
    end
    
      
   
    Msg2Player( varMap, varPlayer, varText, 8, 3)
    Msg2Player( varMap, varPlayer, format( x300512_var_strFinishQuest, x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1).."。", 8, 2)
    local curCircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1
   
    if curCircle >= 10 then
		
        curCircle = 0
    end
    x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE, curCircle)
 
	    
    x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH, highcircle + 1)
    x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, GetDayOfYear() )
    
    --【个人】国家内政的职责记次    
    if IsHaveQuestNM( varMap, varPlayer, 1400 ) > 0 and highcircle >= 9 then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, 1400)                                                  
		local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)       
        SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, QuestNum + 1)
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 3)  >= 3 then
        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 7, 1)   
        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 0, 1)        	     
        end 
        LuaCallNoclosure( 330049, "ProcQuestLogRefresh", varMap, varPlayer)  	
    end 
    
    
    if highcircle + 1 == x300512_var_HighBonusCircleCount then
--			local year, month, day = GetYearMonthDay()
--			local lastDay = GetDayOfYear()
--			local FeastId1 = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
--	   		local varTimes = GetPlayerGameData( varMap, varPlayer, MD_LESSHORSE_COUNT[ 1], MD_LESSHORSE_COUNT[ 2], MD_LESSHORSE_COUNT[ 3] )
--			if FeastId1 ~= 12 then
--			LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,12)
--			SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,12)	
--			end
--			if year == 2012 and lastDay < 90 then
--				if varTimes < 7 then
--					GamePlayScriptLog(varMap, varPlayer, 5004)
--					SetPlayerGameData( varMap, varPlayer, MD_LESSHORSE_COUNT[ 1], MD_LESSHORSE_COUNT[ 2], MD_LESSHORSE_COUNT[ 3], varTimes+1 )
--				end
--			end
			LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,21)
        LuaCallNoclosure( 203788, "FinishNeizheng", varMap, varPlayer)
        local week = x300512_GetCurrentWeek()
        if x300512_GetMD( varMap, varPlayer, MD_NEIZHENG_WEEK) ~= week then
            x300512_SetMD( varMap, varPlayer, MD_NEIZHENG_WEEK, week)
            x300512_SetMD( varMap, varPlayer, MD_NEIZHENG_WEEKCOUNT, 1)
        else
            x300512_SetMD( varMap, varPlayer, MD_NEIZHENG_WEEKCOUNT, x300512_GetMD( varMap, varPlayer, MD_NEIZHENG_WEEKCOUNT) + 1)
        end
        
    if varLevel >=60 then    
       local varRandBai = random( 1, 4)
        if varRandBai == 1 then
        	local bai = 12030143
        	local bai80 = 12030144
        	StartItemTask( varMap)
        		if varLevel >=80 then
        			bai = bai80
        		end
        	ItemAppendBind( varMap, bai, 1)	
        	if StopItemTask( varMap, varPlayer) > 0 then
						DeliverItemListSendToPlayer( varMap, varPlayer)
						Msg2Player( varMap, varPlayer,format( "完成今天全部内政任务，幸运的获得了1个@item_%d", bai), 8, 3)
					else
						Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					end
        end		
     end   
        
		local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
		if maxlevel >= 70 then
			local nCountryIdx = GetCurCountry(varMap, varPlayer);
			
			local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			
			local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
			local ruoguoopen = IsOpenWeakCountryCheck()
			if selfscore <= allscore * 0.15 and selfscore > 0 and allscore > 0 and ruoguoopen == 1 then
				        
				        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 4000)
				        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
					    Msg2Player( varMap, varPlayer, "弱国额外增加#R2#cffcc00两国家金钱。", 8, 2)			
				        StartItemTask( varMap)
				        ItemAppendBind( varMap, 11990050, 5)
				        if StopItemTask( varMap, varPlayer) > 0 then
				            DeliverItemListSendToPlayer( varMap, varPlayer)
				            Msg2Player( varMap, varPlayer, "弱国额外获得#R4#cffcc00个还魂丹", 8, 3)
				        else
				            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
				        end
				        GamePlayScriptLog( varMap, varPlayer, 462)	
			 elseif selfscore <= allscore * 0.18 and selfscore > 0 and allscore > 0 and ruoguoopen == 1 then
				        
				        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 4000)
				        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
					    Msg2Player( varMap, varPlayer, "弱国额外增加#R2#cffcc00两国家金钱。", 8, 2)			
				        StartItemTask( varMap)
				        ItemAppendBind( varMap, 11990050, 3)
				        if StopItemTask( varMap, varPlayer) > 0 then
				            DeliverItemListSendToPlayer( varMap, varPlayer)
				            Msg2Player( varMap, varPlayer, "弱国额外获得#R2#cffcc00个还魂丹", 8, 3)
				        else
				            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
				        end
				        GamePlayScriptLog( varMap, varPlayer, 462)
			elseif selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 and ruoguoopen == 1 then
		        
		        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 4000)
		        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
		        Msg2Player( varMap, varPlayer, "弱国额外增加#R2#cffcc00两国家金钱。", 8, 2)
		        StartItemTask( varMap)
		        ItemAppendBind( varMap, 11990050, 2)
		        if StopItemTask( varMap, varPlayer) > 0 then
		            DeliverItemListSendToPlayer( varMap, varPlayer)
		            Msg2Player( varMap, varPlayer, "弱国额外获得#R1#cffcc00个还魂丹", 8, 3)
		        else
		            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
		        end
		        GamePlayScriptLog( varMap, varPlayer, 462)
				        
			else
		        
		        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 2000)
		        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
				StartItemTask( varMap)
		        ItemAppendBind( varMap, 11990050, 1)
		        if StopItemTask( varMap, varPlayer) > 0 then
		            DeliverItemListSendToPlayer( varMap, varPlayer)
		        else
		            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
		        end
		        GamePlayScriptLog( varMap, varPlayer, 462)
			end
		else
	        
	        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 2000)
	        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
			StartItemTask( varMap)
			ItemAppendBind( varMap, 11990050, 1)
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
			else
				Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
			end
			GamePlayScriptLog( varMap, varPlayer, 462)
		end
    else
        GamePlayScriptLog( varMap, varPlayer, 452)
    end
end

function x300512_GetCurrentWeek()
	
	local nCurrentTime = ( GetCurrentTime() + 8 * 3600) / 86400 - 4  
	local nWeek = floor( nCurrentTime / 7)		 

	return nWeek
end

function x300512_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, x300512_var_QuestId) > 0 then
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
        local finish   = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
        local complete = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
        local varLevel = GetLevel( varMap, varPlayer)
        local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
        if finish == 1 and complete == 1 and misType ~= x300512_var_MT_Escort then
            x300512_DeliverQuest( varMap, varPlayer)
        else
            if ( finish == 1 and complete == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) < x300512_var_FinishBound) or 
               ( finish == 0 and complete == 0) then
                local PosX,PosZ = GetWorldPos( varMap, varPlayer)
                local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
                if misType == x300512_var_MT_Escort then
                    if mp4 == 0 then
                        if GetBusId( varMap, varPlayer) == -1 then
                            
                            local varObj = CreateBus( varMap, x300512_var_EscortTable[ varIndex].escortType, PosX, PosZ, 3, 3, 300512, varPlayer, 1210,x300512_var_QuestId,varTalknpc)
                        else
                            Msg2Player( varMap, varPlayer, "你现在的状态不能进行护送", 8, 3)                        
                        end
                        return
                    elseif mp4 == 1 then
                        
                        local busGuid = GetBusId( varMap, varPlayer)
                        if busGuid < 0 or IsObjValid( varMap, busGuid) ~= 1 then						
                            return	0			
                        end
                        DeleteBus( varMap, busGuid, 1)
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, x300512_var_FinishBound + GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) )
                        Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
                    end
                end
                x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
            else
                x300512_DeliverQuest( varMap, varPlayer)
            end
        end
    else
        if GetGameOpenById( x300512_var_IsEnableId) <= 0 then
            return 0
        end

        
        local highcircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH)
        if x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) == GetDayOfYear() then
            if highcircle >= x300512_var_HighBonusCircleCount then
                Msg2Player( varMap, varPlayer, x300512_var_QuestCommentCountOver, 8, 2)
                Msg2Player( varMap, varPlayer, x300512_var_QuestCommentCountOver, 8, 3)
                return
            end
        end

        local result = 0
        if x300512_var_QuestType > 0 then
            
            if x300512_var_QuestType > 5 and x300512_var_QuestType < 8 then
                result = x300512_var_GetQuestEnd[ x300512_var_QuestType - 5]( varMap, varPlayer, varTalknpc)
            elseif x300512_var_QuestType >= 1 and x300512_var_QuestType <= 5 then
                result = x300512_var_GetQuestHead[ x300512_var_QuestType]( varMap, varPlayer, varTalknpc)
            end
        else
            local curCircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
            if curCircle < 5 then
                result = x300512_var_GetQuestHead[ x300512_GetFuncIndex( varMap, varPlayer, 0) ]( varMap, varPlayer, varTalknpc)
                
            else
                result = x300512_var_GetQuestEnd[ x300512_GetFuncIndex( varMap, varPlayer, 1) ]( varMap, varPlayer, varTalknpc)
            end
        end

        
        
        

        if result == 0 then
            return
        end

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
        local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5)
        local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
        local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
        if misType ~= x300512_var_MT_Horse and misType ~= x300512_var_MT_Material then
            if GetItemCountInBag( varMap, varPlayer, varId) >= varCount then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
                Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
            end
        end
        
        

        Msg2Player( varMap, varPlayer, format( x300512_var_strAcceptQuest, x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1), 8, 3)
        Msg2Player( varMap, varPlayer, format( x300512_var_strAcceptQuest, x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1).."。", 8, 2)

        
        x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)

        
        GamePlayScriptLog( varMap, varPlayer, 451)
	end
end


function x300512_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)	

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
	local camp = GetCurCamp( varMap, varPlayer)
	SetBusCurCamp( varMap, busId, camp)
	SetBusTimerTick( varMap , busId, 1000)
	SetBusWaitTime( varMap , busId, 300)
	SetBusQuestID( varMap, busId, x300512_var_QuestId)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, 1)
	x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
end

function x300512_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID) > 0 then
        return LuaCallNoclosure( 300501, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    end

    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) == 0 then
        Msg2Player( varMap, varPlayer, "你没有接受【个人】国家内政，不能采集", 8, 3)
        return 1
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    if misType == x300512_var_MT_Collect then
        if x300512_var_GrowPoint[ varIndex].varItem ~= varNeedItem then
            Msg2Player( varMap, varPlayer, "这不是你要采集的物品", 8, 3)
            return 1
        end
        if GetItemCountInBag( varMap, varPlayer, varNeedItem) >= x300512_var_GrowPoint[ varIndex].varCount then
            Msg2Player( varMap, varPlayer, "你已完成任务，不能继续采集", 8, 3)
            return 1
        end
    else
        return 1
    end

    return 0
end


function x300512_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID) > 0 then
        return LuaCallNoclosure( 300501, "ProcGpRecycle", varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    end

    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) == 0 then
        return 0
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    if misType == x300512_var_MT_Collect then
        StartItemTask( varMap)
        ItemAppend( varMap, varNeedItem, 1)
        if StopItemTask( varMap, varPlayer) > 0 then
            DeliverItemListSendToPlayer( varMap, varPlayer)
            local varCount = GetItemCountInBag( varMap, varPlayer, varNeedItem)
            if varCount >= x300512_var_GrowPoint[ mp2].varCount then
                x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
            else
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, varCount)
                Msg2Player( varMap, varPlayer, format( "你获得了@item_%d#cffcf00(%d/%d)", varNeedItem, varCount, x300512_var_GrowPoint[ mp2].varCount), 8, 3)
            end
            return 1
        else
            Msg2Player( varMap, varPlayer, "无法得到采集物品，请整理道具栏", 8, 3)
        end
    end

    return 0
end


function x300512_ProcQuestAbandon( varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300512_var_QuestId)
	if varHaveQuest > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300512_var_QuestId)
        local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
        local m2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
        local m3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
        local m4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)

        if misType == x300512_var_MT_Deliver then    
            local varCount = GetItemCount( varMap, varPlayer, x300512_var_DeliverTable[ m3].questItemId)
            if varCount > 0 then
                
                if DelItem( varMap, varPlayer, x300512_var_DeliverTable[ m3].questItemId, varCount) == 0 then
                    Msg2Player( varMap, varPlayer, "删除信件失败，不能放弃任务", 8, 3)
                    return
                end
            end
        elseif misType == x300512_var_MT_Escort then
            if m4 == 1 then
                
                local busGuid = GetBusId( varMap, varPlayer)
                if busGuid >= 0 and IsObjValid( varMap, busGuid) == 1 then						
                    DeleteBus( varMap, busGuid, 1)
                end
            end
        elseif misType == x300512_var_MT_Dig then
            
            if GetItemCountInBag( varMap, varPlayer, x300512_var_DigTarget[ m2].varId) > 0 then
                if DelItem( varMap, varPlayer, x300512_var_DigTarget[ m2].varId, 1) == 0 then
                    Msg2Player( varMap, varPlayer, "删除挖掘到的物品失败，不能放弃任务", 8, 3)
                    return
                end
            end
        elseif misType == x300512_var_MT_Collect then
            local varCount = GetItemCountInBag( varMap, varPlayer, x300512_var_GrowPoint[ m2].varItem)
            if varCount > 0 then
                if DelItem( varMap, varPlayer, x300512_var_GrowPoint[ m2].varItem, varCount) == 0 then
                    Msg2Player( varMap, varPlayer, "删除采集到的物品失败，不能放弃任务", 8, 3)
                    return
                end
            end
        end
		DelQuest( varMap, varPlayer, x300512_var_QuestId)

        StartTalkTask( varMap)
        TalkAppendString( varMap, format( x300512_var_strAbandonQuest, x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1) )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, format( x300512_var_strAbandonQuest, x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) + 1), 8, 2)

        --春节补偿奖励计数
        local time = GetDayOfYear()
		local num = x300512_GetMD( varMap, varPlayer, MD_2011CJBC_QUEST_NEIZHENG)
		if time >= 24 and time < 45 then
    		if num < 22 and x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE) == 0 then				
				x300512_SetMD( varMap, varPlayer, MD_2011CJBC_QUEST_NEIZHENG, num + 1)
			end 
		end 
		        
        x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_ABANDON, GetMinOfDay() )
        x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, GetDayOfYear() )
        x300512_SetTimes( varMap, varPlayer, x300512_GetTimes( varMap, varPlayer) + 1)
        x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH, x300512_var_HighBonusCircleCount)
	end
end


function x300512_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300512_var_QuestId)
	return GetQuestParam(varMap, varPlayer, varQuestIdx, x300512_MP_ISCOMPLETE)
end

function x300512_DisplayAwardInfo( varMap, varPlayer, moneyType, money, expAward, honorType, honor) 
	local strInfo;

	if expAward > 0 then
		strInfo = format("#Y获得#R经验%d#Y的奖励。", expAward);
		Msg2Player(varMap, varPlayer, strInfo, 8, 2)
	end

	if honor > 0 then
		if honorType == 0 then 
			strInfo = format("#Y获得#R声望%d#Y的奖励。", honor);
		elseif honorType == 1 then	
			strInfo = format("#Y获得#R声望%d#Y的奖励。", honor);
		elseif honorType == 2 then 
			strInfo = format("#Y获得#RPK值%d#Y的奖励。", honor);
		elseif honorType == 3 then 
			strInfo = format("#Y获得#R荣誉%d#Y的奖励。", honor);
		elseif honorType == 4 then 
			strInfo = format("#Y获得#R帮贡%d#Y的奖励。", honor);
		elseif honorType == 5 then 
			strInfo = format("#Y获得#R文采%d#Y的奖励。", honor);
		end

		Msg2Player(varMap, varPlayer, strInfo, 8, 2)
	end
end


function x300512_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick )
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)

	
	if x300512_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300512_var_BonusMoney1 )
	    Msg2Player(varMap,varPlayer,format("获得#R银卡#{_MONEY%d}#W的奖励。", x300512_var_BonusMoney1),4,2)
	end

	
	if x300512_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300512_var_BonusMoney2 )
	    Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x300512_var_BonusMoney2),4,2)
	end

	
	if x300512_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300512_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x300512_var_BonusMoney3),4,2)
	end

	
	if x300512_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x300512_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x300512_var_BonusMoney4),4,2)
	end

	
	if x300512_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x300512_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x300512_var_BonusMoney5),4,2)
	end

	
	if x300512_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x300512_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x300512_var_BonusMoney6),4,2)
	end

 	
		for varI, item in x300512_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		local result = StopItemTask(varMap,varPlayer)
		if result > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300512_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			local result = StopItemTask(varMap,varPlayer)
			if result > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			
			return
		end
    end
end

function x300512_DeleteQuestBus(varMap,varPlayer)
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    if misType == x300512_var_MT_Escort then
        local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
        if mp4 == 1 then
            local busGuid = GetBusId( varMap, varPlayer)
            if busGuid >= 0 and IsObjValid( varMap, busGuid) == 1 then
                DeleteBus( varMap, busGuid, 1)
            end
        end
    end
   
end


function x300512_ProcQuestSubmit( varMap, varPlayer, varTalknpc, RadioId, varQuest)
    
    x300512_DeliverQuest( varMap, varPlayer)
end


function x300512_CheckPlayerBagFull( varMap ,varPlayer)
	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x300512_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

    
	for j, item in x300512_var_BonusChoiceItem do
		ItemAppend( varMap, item.item, item.n )
    end
		
	local result = StopItemTask(varMap,varPlayer)
	if(result > 0) then
		result = 1;
	else
		result = 0;
	end

	return result
end


function x300512_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
		TalkAppendString( varMap, x300512_var_QuestDescription)
		TalkAppendString( varMap, " " )

		
        local varLevel = GetLevel( varMap, varPlayer)
        local xp = x300512_GetExpAward( varMap, varPlayer, varLevel)
        local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)
        if( xp > 0) then
            AddQuestExpBonus( varMap, xp)
        end
        if( money > 0) then
            
            if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                AddQuestMoneyBonus2( varMap, money)
				if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then 
					AddQuestMoneyBonus3( varMap, money)
				end
            else
                AddQuestMoneyBonus1( varMap, money)
            end
        end
        if( shengw > 0) then
            AddQuestMoneyBonus5( varMap, shengw)
        end
        if varLevel >= 80 then
            AddQuestGeniusBonus( varMap, RefixInherenceExp( varMap, varPlayer, ( highcircle + 1) * 25) )
        end
		
        TalkAppendString( varMap, "#c00FF00小提示:" )
        TalkAppendString( varMap, "#c00FF00#W\t1.只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。\n\t2.更多了解本任务的细节，请点击国家内政说明按钮。" )
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
end


function x300512_GetMoneyAward( varMap, varPlayer, startlevel)
	x300512_CheckDayChanged( varMap, varPlayer)
	local varCircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

	varCircle = varCircle + 1	
	if varCircle > x300512_ProceRoundCount then
		varCircle = 1
	end	

	highcircle = highcircle + 1	

	local BonusMoney = startlevel * x300512_var_MoneyRage	
	local shengw = 5
	if highcircle <= x300512_var_HighBonusCircleCount then
		BonusMoney = BonusMoney * 5
		shengw = 25
	end	
	return BonusMoney,shengw;	
end


function x300512_CheckDayChanged( varMap, varPlayer)
	local varLastday = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY)
	local varToday = GetDayOfYear()
	if varLastday ~= varToday then	
		x300512_SetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, varToday)
		x300512_SetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH, 0)
        x300512_SetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE, 0)
	end
end


function x300512_GetExpAward( varMap, varPlayer, startlevel)
	x300512_CheckDayChanged( varMap, varPlayer)
	local varCircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

	varCircle = varCircle + 1
	if varCircle > x300512_ProceRoundCount then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local exp_rate
	if GetLevel( varMap, varPlayer) >= 60 then
		exp_rate = 3650
	else
		exp_rate = 3650
	end

	local BonusExp = (startlevel * exp_rate * ( varCircle * 2 - 1) / 200)*10
	if highcircle <= x300512_var_HighBonusCircleCount then
		BonusExp = BonusExp * 5
	end
    
    BonusExp = BonusExp * 2
	return BonusExp
end


function x300512_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    local strInfo = ""
    local varLevel = GetLevel( varMap, varPlayer)

    if misType == x300512_var_MT_Deliver then    
        if GetMonsterGUID( varMap, varTalknpc) == mp2 then
            
            if DelItem( varMap, varPlayer, x300512_var_DeliverTable[ mp3].questItemId, 1) == 0 then
                return
            end
            strInfo = x300512_var_DeliverTable[ mp3].talking
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) + x300512_var_FinishBound)  
            x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)

            Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
        else
            strInfo = format( x300512_var_strDeliverContinue, x300512_var_DeliverTable[ mp3].questItemId, mp2)
        end

        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, strInfo)
            TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif misType == x300512_var_MT_Escort then  
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            if mp4 == 0 and GetMonsterGUID( varMap, varTalknpc) == x300512_var_EscortTable[ mp2].varTalkNpcGUID then
                TalkAppendString( varMap, x300512_var_EscortTable[ mp2].getmiss)
            elseif mp4 == 1 and GetMonsterGUID( varMap, varTalknpc) == x300512_var_EscortTable[ mp2].targetGuid then
                local varX, z = GetWorldPos( varMap, varPlayer)
                local busGuid = GetBusId( varMap, varPlayer)
                if busGuid < 0 then
                    return
                end
                local bx, bz = GetWorldPos( varMap, busGuid)
                if abs( varX - bx) > x300512_var_EscortMaxDistance or abs( z - bz) > x300512_var_EscortMaxDistance then
                    Msg2Player( varMap, varPlayer, "护送目标离你太远，无法完成任务", 8, 3)
                    return
                end
                TalkAppendString( varMap, x300512_var_EscortTable[ mp2].finish)
            else
                TalkAppendString( varMap, x300512_var_strEscortContinue)
                TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
                StopTalkTask()
                DeliverTalkMenu( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
                return
            end
        StopTalkTask()
        DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
    elseif misType == x300512_var_MT_Horse then
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, x300512_var_strHorseComplete)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif misType == x300512_var_MT_Material then
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, x300512_var_strMaterialContinue)
            TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif misType == x300512_var_MT_Dig then
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, x300512_var_strDigContinue)
            TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif misType == x300512_var_MT_KillMonster then
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, format( x300512_var_strKillContinue, x300512_var_KillMonsterTable[ mp2].varName) )
            TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif misType == x300512_var_MT_Collect then
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, x300512_var_strCollectContinue)
            TalkAppendString( varMap, "#r #r#G小提示:#W\n如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end
end


function x300512_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local varLevel = GetLevel( varMap, varPlayer)
    local strInfo = ""
    local xp = x300512_GetExpAward( varMap, varPlayer, varLevel)
    local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)
	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

    if misType == x300512_var_MT_Deliver then    
        strInfo = x300512_var_strDeliverComplete
    elseif misType == x300512_var_MT_Escort then
        strInfo = x300512_var_strEscortComplete
    elseif misType == x300512_var_MT_Collect then
        strInfo = x300512_var_strCollectComplete
    elseif misType == x300512_var_MT_KillMonster then
        strInfo = x300512_var_strKillComplete
    elseif misType == x300512_var_MT_Dig then
        strInfo = x300512_var_strDigComplete
    end

    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, strInfo)

        if misType ~= x300512_var_MT_Horse then
            
            if( xp > 0) then
                AddQuestExpBonus( varMap, xp)
            end
            if( money > 0) then
                if misType == x300512_var_MT_Material then
                    AddQuestMoneyBonus2( varMap, money)
                else
                    
                    if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                        AddQuestMoneyBonus2( varMap, money)
						if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then
							AddQuestMoneyBonus3( varMap, money)
						end
                    else
                        AddQuestMoneyBonus1( varMap, money)
                    end
                end
            end
            if( shengw > 0) then
                AddQuestMoneyBonus5( varMap, shengw)
            end
            if varLevel >= 80 then
                AddQuestGeniusBonus( varMap, RefixInherenceExp( varMap, varPlayer, ( highcircle + 1) * 25) )
            end
        end
    StopTalkTask()
    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
end


function x300512_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
    if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
    end

    local varQuestIdx = 0
    local varTeamSize = GetNearTeamCount( varMap, varPlayer)
    

    if varTeamSize <= 1 then 
        if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) <= 0 then
            return
        end
        varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
            
            
        end
        local varIndex   = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
        local m1Kill  = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)

        if varObjData == x300512_var_KillMonsterTable[ varIndex].monsterId and m1Kill < x300512_var_KillMonsterTable[ varIndex].varCount then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, m1Kill + 1)
        else
            
            return
        end

    	
        m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    	if m1Kill >= x300512_var_KillMonsterTable[ varIndex].varCount then
    		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
    		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, x300512_var_FinishBound + GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) )
            Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
        else
            Msg2Player( varMap, varPlayer, format( "已消灭#G%s#cffcf00(%d/%d)", x300512_var_KillMonsterTable[ varIndex].varName, m1Kill, x300512_var_KillMonsterTable[ varIndex].varCount), 8, 3)
    	end

        x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
    else
        for varI = 0, varTeamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varPlayer, varI)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x300512_var_QuestId) > 0 then 
                    varQuestIdx = GetQuestIndexByID( varMap, memberId, x300512_var_QuestId)
                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 and GetQuestParam( varMap, memberId, varQuestIdx, x300512_MP_QuestType) == x300512_var_MT_KillMonster then 
                        local varIndex   = GetQuestParam( varMap, memberId, varQuestIdx, x300512_MP_TARGET2)
                        local m1Kill  = GetQuestParam( varMap, memberId, varQuestIdx, x300512_MP_TARGET4)

                        if varObjData == x300512_var_KillMonsterTable[ varIndex].monsterId and m1Kill < x300512_var_KillMonsterTable[ varIndex].varCount then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, x300512_MP_TARGET4, m1Kill + 1)
                        end

                        
                        m1Kill = GetQuestParam( varMap, memberId, varQuestIdx, x300512_MP_TARGET4)
                        if m1Kill >= x300512_var_KillMonsterTable[ varIndex].varCount then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 0, 1)
                            SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
                            SetQuestByIndex( varMap, memberId, varQuestIdx, x300512_MP_TARGET6, x300512_var_FinishBound + GetQuestParam( varMap, memberId, varQuestIdx, x300512_MP_TARGET6) )
                        end

                        x300512_ProcQuestLogRefresh( varMap, memberId, x300512_var_QuestId)
                    end
                end
            end
        end
    end
end


function x300512_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) == 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)

    if misType == x300512_var_MT_Dig then
        if GetItemCountInBag( varMap, varPlayer, x300512_var_DigTarget[ varIndex].varId) >= 1 then
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
                Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
            end
            if GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) < x300512_var_FinishBound then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, x300512_var_FinishBound + GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) )
            end
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
            if GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) > x300512_var_FinishBound then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) - x300512_var_FinishBound)
            end
        end
    elseif misType == x300512_var_MT_Material then
        local have = 0
        if GetItemCountInBag( varMap, varPlayer, x300512_var_MaterialTable[ varIndex].base) >= 1 or GetItemCountInBag( varMap, varPlayer, x300512_var_MaterialTable[ varIndex].advanced[ mp3] ) >= 1 then
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
                return
            end
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
            Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
        end
    elseif misType == x300512_var_MT_Collect then
        local varCount = GetItemCountInBag( varMap, varPlayer, x300512_var_GrowPoint[ varIndex].varItem)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, varCount)
        if varCount >= x300512_var_GrowPoint[ varIndex].varCount then
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
                Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
            end
            if GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) < x300512_var_FinishBound then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, x300512_var_FinishBound + GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) )
            end
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
            if GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) > x300512_var_FinishBound then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) - x300512_var_FinishBound)
            end
        end
    end

    
    if misType ~= x300512_var_MT_Material and misType ~= x300512_var_MT_Horse then
        local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5)
        local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
        if GetItemCountInBag( varMap, varPlayer, varId) >= varCount then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
            
        else
            if GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) < x300512_var_FinishBound then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
            end
        end
    end

    x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
end


function x300512_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    local finish = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local complete = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)

    if finish == 0 and complete == 0 then
        if misType == x300512_var_MT_Deliver and varTalkNpcGUID == mp2 then
            TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, 6, x300512_var_QuestId)
        end
        if misType == x300512_var_MT_Escort then
            if varTalkNpcGUID == x300512_var_EscortTable[ mp2].varTalkNpcGUID and mp4 == 0 then
                TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, 6)
            elseif varTalkNpcGUID == x300512_var_EscortTable[ mp2].targetGuid and mp4 == 1 then
                TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, 6)
            end
        end
    else
        if misType == x300512_var_MT_Deliver and varTalkNpcGUID == mp2 and GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) < x300512_var_FinishBound then
            TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, 6, x300512_var_QuestId)
        end
        if misType == x300512_var_MT_Escort and GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) < x300512_var_FinishBound then
            if varTalkNpcGUID == x300512_var_EscortTable[ mp2].varTalkNpcGUID and mp4 == 0 then
                TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, 6)
            elseif varTalkNpcGUID == x300512_var_EscortTable[ mp2].targetGuid and mp4 == 1 then
                TalkAppendButton( varMap, x300512_var_QuestId, x300512_var_QuestName, 6)
            end
        end
    end
end


function x300512_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) ~= 1 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    local mp5 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5)
    local mp6 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
    if mp6 > x300512_var_FinishBound then
        mp6 = mp6 - x300512_var_FinishBound
    end
    local curCircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
    local highcircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH)

    if misType == x300512_var_MT_Material then
        
        if GetItemCountInBag( varMap, varPlayer, x300512_var_MaterialTable[ mp2].base) >= 1 or GetItemCountInBag( varMap, varPlayer, x300512_var_MaterialTable[ mp2].advanced[ mp3] ) >= 1 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
        end
    elseif misType == x300512_var_MT_Horse then
        local have = 0
        for varI = 0, 5 do
            local hid = GetHorseDataID( varMap, varPlayer, varI)
            local htype = mod( hid, 10)
            if hid >= x300512_var_GetHorse[ mp2].varId and hid < x300512_var_GetHorse[ mp2].varId + 100 and htype > 0 and htype < 5 then
                have = 1
                break
            end
        end

        if have == 1 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
        end
    end

    local finish = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local complete = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
        local strInfo = ""
        local strDescription = ""
        local tips = "#W如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G更多的奖励。#W"
        if misType == x300512_var_MT_Deliver then    
            strInfo = format( "  把@item_%d#W送给@npc_%d或收集#G%d#W个@item_%d#W(2倍经验)", x300512_var_DeliverTable[ mp3].questItemId, mp2, mp6, mp5)
            strDescription = x300512_var_DeliverTable[ mp3].description
        elseif misType == x300512_var_MT_KillMonster then    
            strInfo = format( x300512_var_KillMonsterTable[ mp2].target, x300512_var_KillMonsterTable[ mp2].varCount, x300512_var_KillMonsterTable[ mp2].posId, 
                                      mp4, x300512_var_KillMonsterTable[ mp2].varCount, mp6, mp5)
            strDescription = x300512_var_KillMonsterTable[ mp2].description
        elseif misType == x300512_var_MT_Collect then    
            strInfo = format( "  到%s#W采集#G%s#W(%d/%d)或收集#G%d#W个@item_%d#W(2倍经验)", x300512_var_GrowPoint[ mp2].Pos, 
                                      x300512_var_GrowPoint[ mp2].target, mp4, x300512_var_GrowPoint[ mp2].varCount, mp6, mp5)
            strDescription = x300512_var_GrowPoint[ mp2].description
            tips = x300512_var_GrowPoint[ mp2].tips
        elseif misType == x300512_var_MT_Escort then    
            if mp4 == 0 then
                strInfo = format( "  找到@npc_%d#W或收集#G%d#W个@item_%d#W(2倍经验)", x300512_var_EscortTable[ mp2].varTalkNpcGUID, mp6, mp5)
            elseif mp4 == 1 then
                strInfo = format( "  将%s安全护送到@npc_%d#W那里或收集#G%d#W个@item_%d#W(2倍经验)", x300512_var_EscortTable[ mp2].varQuestName, x300512_var_EscortTable[ mp2].targetGuid, mp6, mp5)
            end
            strDescription = x300512_var_EscortTable[ mp2].intro
        elseif misType == x300512_var_MT_Dig then 
            local destSceneId = x300512_CountrySceneList[ GetCurCountry( varMap, varPlayer) + 1]
            local posX, posZ
            posX = x300512_var_CoordinateLib[ mp3].posX
            posZ = x300512_var_CoordinateLib[ mp3].posZ
            
			if mp6 > x300512_var_FinishBound then
				mp6 = mp6 - x300512_var_FinishBound
			end
            strInfo = format( "  到#aB#h00CCFF{goto_%d,%d,%d}(%d，%d)#aE#W附近使用@item_12030020(可在@npc_129003处购买)#W挖掘(%d/1)或收集#G%d#W个@item_%d#W(2倍经验)", destSceneId, posX, posZ, posX, posZ, finish, mp6, mp5)
            strDescription = format( x300512_var_DigTarget[ mp2].target, destSceneId, posX, posZ, posX, posZ, x300512_var_DigTarget[ mp2].varName, mp6, mp5)
        elseif misType == x300512_var_MT_Horse then
            strInfo = format( x300512_var_GetHorse[ mp2].description, x300512_var_GetHorse[ mp2].varName)
            strDescription = format( x300512_var_GetHorse[ mp2].description, x300512_var_GetHorse[ mp2].varName)
            tips = ""
        elseif misType == x300512_var_MT_Material then
            strDescription = format( x300512_var_MaterialTable[ mp2].target, x300512_var_MaterialTable[ mp2].base, x300512_var_MaterialTable[ mp2].advanced[ mp3], x300512_var_MaterialTable[ mp2].xpCoff[ mp3] )
            strInfo = strDescription
        end
    StartTalkTask(varMap)
    if finish == 1 and complete == 1 then
        AddQuestLogCustomText( varMap,
                                "",                             
                                format( "%s(%d/10)", x300512_var_QuestName, curCircle + 1),          
                                "任务已经完成，请回去向@npc_129042#W汇报！",      
                                "",                             
                                strInfo,                        
                                strDescription,                 
                                tips)                           
    else
        AddQuestLogCustomText( varMap,
                                "",                             
                                format( "%s(%d/10)", x300512_var_QuestName, curCircle + 1),          
                                strInfo,                        
                                "",                             
                                strInfo,                        
                                strDescription,                 
                                tips)                           
    end
    local varLevel = GetLevel( varMap, varPlayer)
    local xp = x300512_GetExpAward( varMap, varPlayer, varLevel)
    local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)
    if( xp > 0) then
        AddQuestExpBonus( varMap, xp)
    end
    if( money > 0) then
        
            
        
            
            if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                AddQuestMoneyBonus2( varMap, money)
				if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then
					AddQuestMoneyBonus3( varMap, money)
				end
            else
                AddQuestMoneyBonus1( varMap, money)
            end
        
    end
    if( shengw > 0) then
        AddQuestMoneyBonus5( varMap, shengw)
    end
    if varLevel >= 80 then
        AddQuestGeniusBonus( varMap, RefixInherenceExp( varMap, varPlayer, ( highcircle + 1) * 25) )
    end
    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end


function x300512_ProcForceAddQuest( varMap, varPlayer, varTalknpc, varQuest)
end


function x300512_GetTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DAOBAOKE_TIMES[ 1], MD_DAOBAOKE_TIMES[ 2], MD_DAOBAOKE_TIMES[ 3] )
end


function x300512_SetTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DAOBAOKE_TIMES[ 1], MD_DAOBAOKE_TIMES[ 2], MD_DAOBAOKE_TIMES[ 3], value)
end

function x300512_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300512_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x300512_ProcCommitItem( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, iHorseIndex)
    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local varLevel = GetLevel( varMap, varPlayer)
	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)
    if misType ~= x300512_var_MT_Material and misType ~= x300512_var_MT_Horse then
        
        local xp = x300512_GetExpAward( varMap, varPlayer, varLevel) * 2
        local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, x300512_var_strMaterialComplete)

            if( xp > 0) then
                AddQuestExpBonus( varMap, xp)
            end
            if( money > 0) then
                if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                    AddQuestMoneyBonus2( varMap, money * 4)
					if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then
						AddQuestMoneyBonus3( varMap, money * 4)
					end
                else
                    AddQuestMoneyBonus1( varMap, money * 4)
                end
            end
            if( shengw > 0) then
                AddQuestMoneyBonus5( varMap, shengw)
            end
            if varLevel >= 80 then
                AddQuestGeniusBonus( varMap, RefixInherenceExp( varMap, varPlayer, ( highcircle + 1) * 25) )
            end
        StopTalkTask()
        DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 1)
    else
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
        local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
        local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
        local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
        
        local xp = x300512_GetExpAward( varMap, varPlayer, varLevel)
        local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)

        if horseGUID_low == 0 then
            if GetItemCountInBag( varMap, varPlayer, x300512_var_MaterialTable[ mp2].base) < 1 then
                Msg2Player( varMap, varPlayer, "你没有这个物品或该物品处于锁定状态", 8, 3)
                return
            end
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, x300512_var_MaterialTable[ mp2].base)
            
        elseif horseGUID_low == 1 then
            if GetItemCountInBag( varMap, varPlayer, x300512_var_MaterialTable[ mp2].advanced[ mp3] ) < 1 then
                Msg2Player( varMap, varPlayer, "你没有这个物品或该物品处于锁定状态", 8, 3)
                return
            end
            
            for varI, item in x300512_var_MaterialTable[ mp2].advanced do
                if x300512_var_MaterialTable[ mp2].advanced[ mp3] == item then
                    xp = x300512_var_MaterialTable[ mp2].xpCoff[ varI] * xp
                    money = x300512_var_MaterialTable[ mp2].money[ varI] * x300512_var_MoneyRage
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, item)
                    break
                end
            end
        elseif horseGUID_low == -1 then
            Msg2Player( varMap, varPlayer, "请选择要提交的物品", 8, 3)
            return
        end

        local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
            TalkAppendString( varMap, x300512_var_strMaterialComplete)

            if( xp > 0) then
                AddQuestExpBonus( varMap, xp)
            end
            if( money > 0) then
				if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
					AddQuestMoneyBonus2( varMap, money)
					if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then
						AddQuestMoneyBonus3( varMap, money)
					end
				else
					if misType == x300512_var_MT_Material then
						local advMaterial = 0
						if mp4 ~= x300512_var_MaterialTable[ mp2].base then
							
							for varI, item in x300512_var_MaterialTable[ mp2].advanced do
								if item == mp4 then
									advMaterial = 1
									break
								end
							end
						end
						if advMaterial == 0 then
							AddQuestMoneyBonus1( varMap, money)
						else
							AddQuestMoneyBonus2( varMap, money)
						end
					else
						AddQuestMoneyBonus1( varMap, money)
					end
				end
            end
            if( shengw > 0) then
                AddQuestMoneyBonus5( varMap, shengw)
            end
            if varLevel >= 80 then
                AddQuestGeniusBonus( varMap, RefixInherenceExp( varMap, varPlayer, ( highcircle + 1) * 25) )
            end
        StopTalkTask()
        DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
    end

    
    StartGCDTask( varMap)
        DeliverGCDInfo( varMap, varPlayer, 105)
    StopGCDTask( varMap)
end


function x300512_ProcDigbyShovel( varMap, varPlayer)
	
	if IsHaveQuestNM( varMap, varPlayer, x300512_var_QuestId) <= 0 then
		return 0
	end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local finish = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local complete = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)

    if misType ~= x300512_var_MT_Dig then
        return 0
    end
    if finish == 1 and complete == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6) > x300512_var_FinishBound then
        return 0
    end

    local destSceneId = x300512_CountrySceneList[ GetCurCountry( varMap, varPlayer) + 1]
    if varMap ~= destSceneId then
        return 0
    end

	
    local varX, z = GetWorldPos( varMap, varPlayer)
    local posX, posZ
    posX = x300512_var_CoordinateLib[ mp3].posX
    posZ = x300512_var_CoordinateLib[ mp3].posZ

    if abs( varX - posX) > 2 or abs( z - posZ) > 2 then
        
        Msg2Player( varMap, varPlayer, format( "这里没有内政任务所需物品，请在灵气旺盛的(%d，%d)附近使用。", posX, posZ), 8, 3)
        return 0
    end

    
    StartItemTask( varMap)
    ItemAppend( varMap, x300512_var_DigTarget[ mp2].varId, 1)
    local result = StopItemTask( varMap, varPlayer)
    if result == 0 then
        Msg2Player( varMap, varPlayer, "背包已满，无法放入挖到的物品", 8, 3)
        Msg2Player( varMap, varPlayer, "背包已满，无法放入挖到的物品！", 8, 2)
        return 1
    end
    DeliverItemListSendToPlayer( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "你得到了"..x300512_var_DigTarget[ mp2].varName.."。", 8, 2)
    Msg2Player( varMap, varPlayer, "你得到了"..x300512_var_DigTarget[ mp2].varName, 8, 3)
    
    
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    Msg2Player(varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
    
    x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)

    
    LuaCallNoclosure( 300331, "LogicDeplete", varMap, varPlayer)

    return 1
end


function x300512_ProcQuestHorseChanged( varMap, varPlayer, horseId, varQuest)
    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local finish = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    local complete = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)

    if misType ~= x300512_var_MT_Horse then
        return
    end

    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local varId = x300512_var_GetHorse[ mp2].varId
    local have = 0
    if IsHaveHorse( varMap, varPlayer, horseId) <= 0 then
        for varI = 0, 5 do
            local hid = GetHorseDataID( varMap, varPlayer, varI)
            local htype = mod( hid, 10)
            if hid >= varId and hid < varId + 100 and htype > 0 and htype < 5 then
                have = 1
                break
            end
        end

        if have == 1 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
            Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
            x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
            x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
        end
        return
    end

    local htype = mod( horseId, 10)
    if horseId >= varId and horseId < varId + 100 and htype > 0 and htype < 5 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        Msg2Player( varMap, varPlayer, x300512_var_strQuestFinishTip, 8, 3)
        x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
    end
end


function x300512_ProcCommitPet( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, iHorseIndex)
    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local horseID = GetHorseDataID( varMap, varPlayer, iHorseIndex)
    local htype = mod( horseID, 10)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local varId = x300512_var_GetHorse[ mp2].varId
    local varLevel = GetLevel( varMap, varPlayer)
    local times = 1
	local highcircle = x300512_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

    local strInfo = ""
    local isGood = 0
    if horseID >= varId and horseID < varId + 100 and htype > 0 and htype < 5 then
        if htype ~= 1 and horseID > 100 then
            
            strInfo = x300512_var_strGoodHorse
            isGood = 1
            times = 2
        else
            
            strInfo = x300512_var_strNormalHorse
        end
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, horseGUID_high)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET5, horseGUID_low)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6, isGood)

        StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300512_var_QuestName)
        TalkAppendString( varMap, strInfo)

  		
        local xp = x300512_GetExpAward( varMap, varPlayer, varLevel) * times
        local money, shengw = x300512_GetMoneyAward( varMap, varPlayer, varLevel)
        money = money * times
        shengw = shengw * times
        if( xp > 0) then
            AddQuestExpBonus( varMap, xp)
        end
        if( money > 0) then
            
            if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                AddQuestMoneyBonus2( varMap, money)
				if IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 then
					AddQuestMoneyBonus3( varMap, money)
				end
            else
                AddQuestMoneyBonus1( varMap, money)
            end
        end
        if( shengw > 0) then
            AddQuestMoneyBonus5( varMap, shengw)
        end
        if varLevel >= 80 then
            AddQuestGeniusBonus( varMap, RefixInherenceExp( varMap, varPlayer, ( highcircle + 1) * 25) )
        end
        StopTalkTask()
        DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300512_var_FileId, x300512_var_QuestId)
    else
        Msg2Player( varMap, varPlayer, "这不是我要的马", 8, 3)
        return
    end

    
    StartGCDTask( varMap)
        DeliverGCDInfo( varMap, varPlayer, 102)
    StopGCDTask( varMap)
end


function x300512_ProcIntoBusEvent( varMap, varPlayer, varTalknpc)
    
	local IsOwner = IsTheBusOwner( varMap, varPlayer, varTalknpc)
	if IsOwner == 1 then
		
		AddBusMember( varMap, varPlayer, varTalknpc)
	end
end

function x300512_ProcBusStopWhenOwnerFarAway( varMap, varPlayer)
	local varText = "你离护送的目标太远了，护送目标无法跟随你。"

	StartTalkTask( varMap)
		TalkAppendString( varMap, varText)
	StopTalkTask( varMap)
	DeliverTalkTips( varMap, varPlayer)

	Msg2Player( varMap, varPlayer, varText, 8, 2)
end

function x300512_ProcWaitTimeOut( varMap, BusId)
	local varPlayer = GetBusMemberObjId( varMap, BusId, 0)	
	if varPlayer == -1 then
		
		if IsObjValid( varMap, BusId) == 1 then
		    DeleteBus( varMap, BusId, 1)
		end
		return
	end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    if misType ~= x300512_var_MT_Escort then
		return
    end

	DeleteBus( varMap, BusId, 1)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, 0)
    Msg2Player( varMap, varPlayer, "由于你离开护送目标时间过久，你的护送目标消失了，请重新接取任务", 8, 3)
    Msg2Player( varMap, varPlayer, "由于你离开护送目标时间过久，你的护送目标消失了，请重新接取任务。", 8, 2)

    x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
end

function x300512_ProcDie( varMap, BusId, idKiller)
	local varPlayer = GetBusMemberObjId( varMap, BusId, 0)	
	if varPlayer == -1 then
		return
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    if misType ~= x300512_var_MT_Escort then
		return
    end
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4, 0)
	
    x300512_ProcQuestLogRefresh( varMap, varPlayer, x300512_var_QuestId)
	Msg2Player(varMap, varPlayer, "护送目标已经死亡，请重新接取任务", 8, 3)
end


function x300512_GMCommand( param0, varParam1, varParam2)
    x300512_var_QuestType = param0
end

function x300512_ProcCommitCancel( varMap, varPlayer, varTalknpc)
    if IsHaveQuest( varMap, varPlayer, x300512_var_QuestId) == 0 then
        return
    end

    
    local curCircle = x300512_GetMD( varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
    if curCircle >= 5 then
        return
    end

    local bFinished = 0
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300512_var_QuestId)
    local misType = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_QuestType)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET4)
    if misType == x300512_var_MT_Deliver then
        bFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
    elseif misType == x300512_var_MT_KillMonster then
        bFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
    elseif misType == x300512_var_MT_Collect then
        bFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
    elseif misType == x300512_var_MT_Escort then
        bFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
    elseif misType == x300512_var_MT_Dig then
        bFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, x300512_MP_TARGET6)
    end

    if bFinished > x300512_var_FinishBound then
        x300512_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
    end
end
function x300512_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end
