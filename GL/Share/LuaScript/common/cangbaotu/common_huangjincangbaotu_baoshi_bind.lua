--DECLARE_QUEST_INFO_START--

x300344_var_FileId 					= 	300344                  
x300344_var_QuestId 				= 	8049

x300344_var_QuestKind 				= 	1                       
x300344_var_LevelLess					= 	40                      

x300344_var_QuestName				= 	"【个人】秘钻黄金藏宝图的秘密"                                        
x300344_var_QuestTarget				= 	"  去#aB#h00CCFF{goto_%d,%d,%d}%s(%d,%d)#aE处使用铁铲挖掘宝藏"      
x300344_var_QuestInfo				= 	"通过阅读这张秘钻黄金藏宝图，您发现了宝藏的所在。去#aB#h00CCFF{goto_%d,%d,%d}%s(%d,%d)#aE处去挖掘宝藏吧。\n\t注意：当你使用不绑定的藏宝图且有#G江湖请柬#W状态时，能够获得不绑定的奖励道具，否则为绑定。"            
x300344_var_ContinueInfo				= 	""  
x300344_var_QuestCompleted			= 	"\t看来您已经得到@item_12030107,并初步了解秘钻黄金藏宝图的秘密了吧？现在我给您一条线索，传说按照这条线索追查下去有可能得到传说中的宝藏！传说中的魂魄有可能栖息在地下粮仓，粮仓里深处的五个妖孽趁传说中魂魄虚弱的时候得到了它。打败那些妖孽就有可能得到@item_12030108。"  
x300344_var_QuestHelp				=	"去杂货商人处买一个铁铲，然后去宝藏所在地使用"          

x300344_var_strQuestAbandon         = "您放弃了任务：【个人】秘钻黄金藏宝图的秘密"


x300344_var_ExtTarget					=	{ {type=20,n=1,target="去杂货商人处买一把铁铲，然后去宝藏所在地使用。"} }



x300344_var_ExpBonus					= 	0                    	
x300344_var_BonusItem					=	{}	

x300344_var_BonusMoney1               = 	0  
x300344_var_BonusMoney2               =   0  
x300344_var_BonusMoney3               =   0  
x300344_var_BonusMoney4               =   0  
x300344_var_BonusMoney5               =   0  
x300344_var_BonusMoney6               =   0  

x300344_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300344_MP_TARGET1					= 1   --地图信息
x300344_MP_TARGET2					= 2   --坐标X
x300344_MP_TARGET3					= 3   --坐标Y
x300344_MP_TARGET4					= 4   --挖宝地图ID
x300344_MP_ISCOMPLETE				= 7	  --任务是否完成

x300344_PREVIOUS_QUESTID			= -1		
x300344_NEXT_QUESTID				= 7552		
x300344_NEXT_QUESTSCRIPTID			= 300754	
x300344_QUEST_HUANSHU				= 0			

x300344_var_ItemBonus = {
{varId = 12010020, varName = "小生命清露" 						, 	varNum = 1  	,	 probability = 4000  	},
{varId = 12041102, varName = "天赋丹" 								, 	varNum = 2  	,	 probability = 4000 	},
{varId = 12030108, varName = "复苏的天龙魂" 					, 	varNum = 1  	,	 probability = 6000 	},
{varId = 12041103, varName = "活力丹" 								,		varNum = 5  	,  probability = 4500 	},
{varId = 12030201, varName = "修理石" 								, 	varNum = 5  	,  probability = 4500 	},
{varId = 12030217, varName = "练功人偶" 							, 	varNum = 5  	,  probability = 4000 	},
{varId = 12030013, varName = "芝华士" 								, 	varNum = 5  	,  probability = 2000 	},
{varId = 12030014, varName = "轩尼诗理查" 						, 	varNum = 3  	,  probability = 2000 	},
{varId = 12030092, varName = "完整的的冥龙之魂" 			, 	varNum = 1  	,  probability = 3000   },
{varId = 11000501, varName = "紫檀木炭" 							,		varNum = 2  	,  probability = 2500 	},
{varId = 11000902, varName = "高级洗石剂" 						, 	varNum = 2  	,  probability = 2500		},
{varId = 11990050, varName = "回魂丹" 								, 	varNum = 5  	,  probability = 2500		},
{varId = 12054300, varName = "还童书" 								, 	varNum = 2  	,  probability = 2500		},
{varId = 12030218, varName = "强效练功人偶" 					, 	varNum = 2  	,  probability = 2500		},
{varId = 11010001, varName = "一级皇家秘银"      			, 	varNum = 2  	,  probability = 2500   },
{varId = 11000800, varName = "离石剂"            	 		, 	varNum = 2  	,  probability = 2000   },
{varId = 12041097, varName = "生命琼浆"           		, 	varNum = 5  	,  probability = 2500   },
{varId = 11000550, varName = "微瑕星辰"          	  	, 	varNum = 5  	,  probability = 2500   },
{varId = 11990110, varName = "募集券"              		, 	varNum = 1  	,  probability = 2000   },
{varId = 12030213, varName = "强效极乐草"         		, 	varNum = 5  	,  probability = 2500   },
{varId = 12030200, varName = "小喇叭"              		, 	varNum = 1  	,  probability = 2500   },
{varId = 12031037, varName = "千里符"              		, 	varNum = 1  	,  probability = 2500   },
{varId = 12030258, varName = "全福月饼"           		, 	varNum = 5  	,  probability = 2500   },
{varId = 11000544, varName = "蓝光火石"            		, 	varNum = 1  	,  probability = 2000   },
{varId = 12010021, varName = "中生命清露"          		, 	varNum = 1  	,  probability = 2000   },
{varId = 11000552, varName = "完美星辰"            		, 	varNum = 1  	,  probability = 2000   },
{varId = 12030503, varName = "掌门牌平胡礼包" 		  	, 	varNum = 1  	,  probability = 1000   },
{varId = 12030059, varName = "金砖"                		, 	varNum = 1  	,  probability = 1000   },
{varId = 12041108, varName = "荣誉之星"           		, 	varNum = 5  	,  probability = 2000   },
{varId = 12030203, varName = "朝廷请柬"            		, 	varNum = 1  	,  probability = 670    },
{varId = 11990114, varName = "次生钻石矿"          		, 	varNum = 1  	,  probability = 670    },
{varId = 12033110, varName = "掌门牌:碰碰胡(7天)礼包" , 	varNum = 1  	,  probability = 500    },
{varId = 11990113, varName = "钻石原石"            		, 	varNum = 1  	,  probability = 500    },
{varId = 12033111, varName = "掌门牌:清一色(7天)礼包" , 	varNum = 1  	,  probability = 400    },
{varId = 11990115, varName = "原生钻石矿"          		, 	varNum = 1  	,  probability = 200    },
{varId = 11000135, varName = "淬金钻·帽子"     				, 	varNum = 1  	,  probability = 1000   },
{varId = 11000136, varName = "血金钻·披风"     				, 	varNum = 1 		,  probability = 1000   },
{varId = 11000137, varName = "玄金钻·戒指"     				, 	varNum = 1 		,  probability = 1000   },
{varId = 11000146, varName = "尊金钻·护手"     				, 	varNum = 1 		,  probability = 1000   },
{varId = 11000147, varName = "镗金钻·鞋子"     				, 	varNum = 1 		,  probability = 1000   },
{varId = 11990117, varName = "嘉年华娱乐币"        		, 	varNum = 200  ,  probability = 2000   },
{varId = 12030016, varName = "队伍召集令"          		, 	varNum = 1  	,  probability = 4000   },
{varId = 12266834, varName = "战车修理锤"          		, 	varNum = 1  	,  probability = 3960   },
{varId = 12250002, varName = "精品芝华士"          		, 	varNum = 1  	,  probability = 500    },
{varId = 12250003, varName = "精品轩尼诗理查"         , 	varNum = 1  	,  probability = 250 		},
{varId = 12250004, varName = "精品哈瓦那雪茄"         , 	varNum = 1  	,  probability = 250 		},
{varId = 11970022, varName = "强效乱士符"          		, 	varNum = 5  	,  probability = 2000   },
{varId = 12030048, varName = "百两金卡红包"         	, 	varNum = 1  	,  probability = 100 		},
{varId = 12266902, varName = "疾风辕组件"          		, 	varNum = 1  	,  probability = 1000   },
} 
                              
x300344_var_Bosstable = {  
{mon_ID = 3201, ai = 1, aiscript = 975,	title = "大河之王"      },
{mon_ID = 9780, ai = 1, aiscript = 975,	title = "黑水之王"			},
{mon_ID = 3204, ai = 1, aiscript = 970,	title = "波西米亚之王"  },
{mon_ID = 9781, ai = 1, aiscript = 975,	title = "贺兰山之王"		},
{mon_ID = 3209, ai = 1, aiscript = 970,	title = "雪山之王"	 		},
{mon_ID = 3210, ai = 1, aiscript = 975,	title = "戈壁之王"	 		},
{mon_ID = 3208, ai = 1, aiscript = 975,	title = "平原之王"	 		},
{mon_ID = 3217, ai = 1, aiscript = 972,	title = "高加索之王"		},
{mon_ID = 3200, ai = 1, aiscript = 975,	title = "沙漠之王"	 		},
{mon_ID = 3211, ai = 1, aiscript = 976,	title = "西域之王"	 		},
{mon_ID = 3212, ai = 1, aiscript = 971,	title = "死海之王"  		},
{mon_ID = 3214, ai = 1, aiscript = 977,	title = "巴格达之王"	  },
{mon_ID = 3213, ai = 1, aiscript = 973,	title = "恒河之王"      },
{mon_ID = 9782, ai = 1, aiscript = 975,	title = "叶密立之王"	  },
{mon_ID = 3207, ai = 1, aiscript = 973,	title = "鲜血之王"			},
{mon_ID = 3206, ai = 1, aiscript = 974,	title = "幕府之王"	 		},
{mon_ID = 9783, ai = 1, aiscript = 976,	title = "漠北之王"	 		},
{mon_ID = 9784, ai = 1, aiscript = 976,	title = "撒马尔罕之王"  },
{mon_ID = 3215, ai = 1, aiscript = 970,	title = "顿河之王"  		},
{mon_ID = 3216, ai = 1, aiscript = 971,	title = "伏尔加之王"  	},
{mon_ID = 3202, ai = 1, aiscript = 975,	title = "波兰之王"  		},
{mon_ID = 9785, ai = 1, aiscript = 972,	title = "条顿之王"  		},   
{mon_ID = 9786, ai = 1, aiscript = 976,	title = "哈布斯堡之王"  },
{mon_ID = 9787, ai = 1, aiscript = 975,	title = "大马士革之王"  },
{mon_ID = 9788, ai = 1, aiscript = 974,	title = "圣域之王"  		},
{mon_ID = 3203, ai = 1, aiscript = 971,	title = "匈牙利之王"	 	},
{mon_ID = 3205, ai = 1, aiscript = 974,	title = "埃及之王"			},
}

x300344_var_notifytable = {
12030059,  --金砖
12030203,  --朝廷请柬
11990114,  --次生钻石矿
11990113,  --钻石原石
12033111,  --掌门牌:清一色(7天)礼包
11990115,  --原生钻石矿
12030048,  --百两金卡红包
12250002,  --精品芝华士
12250003,  --精品轩尼诗理查
12250004,  --精品哈瓦那雪茄
11000135,	 --淬金钻·帽子
11000136,	 --血金钻·披风
11000137,	 --玄金钻·戒指
11000146,	 --尊金钻·护手
11000147,	 --镗金钻·鞋子
}

x300344_var_QuestTargetTable0        = {
                                        { varMap = 0, mapName = "王国", posX = 186, posZ = 273 }, 
                                        { varMap = 0, mapName = "王国", posX = 180, posZ = 309 }, 
                                        { varMap = 0, mapName = "王国", posX = 204, posZ = 294 },  
                                        { varMap = 0, mapName = "王国", posX = 214, posZ = 307 }, 
                                        { varMap = 0, mapName = "王国", posX = 231, posZ = 299 }, 
                                        { varMap = 0, mapName = "王国", posX = 243, posZ = 319 }, 
                                        { varMap = 0, mapName = "王国", posX = 282, posZ = 317 }, 
                                        { varMap = 0, mapName = "王国", posX = 280, posZ = 347 }, 
                                        { varMap = 0, mapName = "王国", posX = 307, posZ = 343 }, 
                                        { varMap = 0, mapName = "王国", posX = 324, posZ = 324 }, 
                                        { varMap = 0, mapName = "王国", posX = 316, posZ = 305 }, 
                                        { varMap = 0, mapName = "王国", posX = 317, posZ = 282 }, 
                                        { varMap = 0, mapName = "王国", posX = 350, posZ = 264}, 
                                        { varMap = 0, mapName = "王国", posX = 366, posZ = 260}, 
                                        { varMap = 0, mapName = "王国", posX = 365, posZ = 315}, 
                                        { varMap = 0, mapName = "王国", posX = 385, posZ = 317 }, 
                                        { varMap = 0, mapName = "王国", posX = 388, posZ = 289}, 
                                        { varMap = 0, mapName = "王国", posX = 399, posZ = 311}, 
                                        { varMap = 0, mapName = "王国", posX = 383, posZ = 350}, 
                                        { varMap = 0, mapName = "王国", posX = 356, posZ = 402}, 
                                        { varMap = 0, mapName = "王国", posX = 360, posZ = 420 }, 
                                        { varMap = 0, mapName = "王国", posX = 324, posZ = 406 }, 
                                        { varMap = 0, mapName = "王国", posX = 314, posZ = 393}, 
                                        { varMap = 0, mapName = "王国", posX = 305 ,posZ = 440}, 
                                        { varMap = 0, mapName = "王国", posX = 291 ,posZ = 442 }, 
                                        { varMap = 0, mapName = "王国", posX = 280 ,posZ = 461 }, 
                                        { varMap = 0, mapName = "王国", posX = 264 ,posZ = 458 }, 
                                        { varMap = 0, mapName = "王国", posX = 242 ,posZ = 462 }, 
                                        { varMap = 0, mapName = "王国", posX = 238 ,posZ = 439 }, 
                                        { varMap = 0, mapName = "王国", posX = 235, posZ = 415 }, 
                                        { varMap = 0, mapName = "王国", posX = 218, posZ = 358 }, 
                                        { varMap = 0, mapName = "王国", posX = 208, posZ = 333 }, 
                                        { varMap = 0, mapName = "王国", posX = 181, posZ = 325 }, 
                                        { varMap = 0, mapName = "王国", posX = 153, posZ = 322}, 
                                        { varMap = 0, mapName = "王国", posX = 123, posZ = 339}, 
                                        { varMap = 0, mapName = "王国", posX = 107, posZ = 326 }, 
                                        { varMap = 0, mapName = "王国", posX = 81 , posZ = 351 }, 
                                        { varMap = 0, mapName = "王国", posX = 73 , posZ = 369 }, 
                                        { varMap = 0, mapName = "王国", posX = 85  , posZ =401 }, 
                                        { varMap = 0, mapName = "王国", posX = 109 , posZ =400 }, 
                                        { varMap = 0, mapName = "王国", posX = 106 , posZ =423 }, 
                                        { varMap = 0, mapName = "王国", posX = 110 , posZ =440 }, 
                                        { varMap = 0, mapName = "王国", posX = 69  , posZ =455 }, 
                                        { varMap = 0, mapName = "王国", posX = 74  , posZ =441 }, 
                                        { varMap = 0, mapName = "王国", posX = 96  , posZ =445 }, 
                                        { varMap = 0, mapName = "王国", posX = 116 , posZ =391 }, 
                                        { varMap = 0, mapName = "王国", posX = 145 , posZ =342 }, 
                                        { varMap = 0, mapName = "王国", posX = 170 , posZ =329 }, 
                                        { varMap = 0, mapName = "王国", posX = 199 , posZ =315 }, 
                                        { varMap = 0, mapName = "王国", posX = 244 , posZ =315 }, 
                                        { varMap = 1, mapName = "边塞", posX = 81 , posZ = 306}, 
                                        { varMap = 1, mapName = "边塞", posX = 93 , posZ = 293}, 
                                        { varMap = 1, mapName = "边塞", posX = 68 , posZ = 275},  
                                        { varMap = 1, mapName = "边塞", posX = 48 , posZ = 252}, 
                                        { varMap = 1, mapName = "边塞", posX = 41 , posZ = 243}, 
                                        { varMap = 1, mapName = "边塞", posX = 47 , posZ = 204}, 
                                        { varMap = 1, mapName = "边塞", posX = 56 , posZ = 170}, 
                                        { varMap = 1, mapName = "边塞", posX = 59 , posZ = 145}, 
                                        { varMap = 1, mapName = "边塞", posX = 77 , posZ = 177}, 
                                        { varMap = 1, mapName = "边塞", posX = 98 , posZ = 202}, 
                                        { varMap = 1, mapName = "边塞", posX = 109, posZ = 208}, 
                                        { varMap = 1, mapName = "边塞", posX = 107, posZ = 231}, 
                                        { varMap = 1, mapName = "边塞", posX = 109, posZ = 262 }, 
                                        { varMap = 1, mapName = "边塞", posX = 132, posZ = 283}, 
                                        { varMap = 1, mapName = "边塞", posX = 124, posZ = 310}, 
                                        { varMap = 1, mapName = "边塞", posX = 143, posZ = 353 }, 
                                        { varMap = 1, mapName = "边塞", posX = 162, posZ = 356}, 
                                        { varMap = 1, mapName = "边塞", posX = 177 ,posZ = 370 }, 
                                        { varMap = 1, mapName = "边塞", posX = 201, posZ = 371 }, 
                                        { varMap = 1, mapName = "边塞", posX = 218, posZ = 378 }, 
                                        { varMap = 1, mapName = "边塞", posX = 215, posZ = 354 }, 
                                        { varMap = 1, mapName = "边塞", posX = 264, posZ = 390 }, 
                                        { varMap = 1, mapName = "边塞", posX = 247 ,posZ = 415 }, 
                                        { varMap = 1, mapName = "边塞", posX = 275 ,posZ = 393 }, 
                                        { varMap = 1, mapName = "边塞", posX = 278 ,posZ = 376 }, 
                                        { varMap = 1, mapName = "边塞", posX = 278 ,posZ = 358 }, 
                                        { varMap = 1, mapName = "边塞", posX = 267 ,posZ = 335 }, 
                                        { varMap = 1, mapName = "边塞", posX = 276 ,posZ = 320 }, 
                                        { varMap = 1, mapName = "边塞", posX = 279 ,posZ = 292 }, 
                                        { varMap = 1, mapName = "边塞", posX = 286 ,posZ = 280 }, 
                                        { varMap = 1, mapName = "边塞", posX = 297, posZ = 274 }, 
                                        { varMap = 1, mapName = "边塞", posX = 278, posZ = 277 }, 
                                        { varMap = 1, mapName = "边塞", posX = 267, posZ = 274 }, 
                                        { varMap = 1, mapName = "边塞", posX = 273, posZ = 259 }, 
                                        { varMap = 1, mapName = "边塞", posX = 287, posZ = 258 }, 
                                        { varMap = 1, mapName = "边塞", posX = 269, posZ = 254 }, 
                                        { varMap = 1, mapName = "边塞", posX = 251, posZ = 247 }, 
                                        { varMap = 1, mapName = "边塞", posX = 236, posZ = 242}, 
                                        { varMap = 1, mapName = "边塞", posX = 247, posZ = 219}, 
                                        { varMap = 1, mapName = "边塞", posX = 224, posZ = 226}, 
                                        { varMap = 1, mapName = "边塞", posX = 213, posZ = 235}, 
                                        { varMap = 1, mapName = "边塞", posX = 247 ,posZ = 281}, 
                                        { varMap = 1, mapName = "边塞", posX = 272 ,posZ = 305}, 
                                        { varMap = 1, mapName = "边塞", posX = 260 ,posZ = 352}, 
                                        { varMap = 1, mapName = "边塞", posX = 247 ,posZ = 375}, 
                                        { varMap = 1, mapName = "边塞", posX = 237 ,posZ = 382}, 
                                        { varMap = 1, mapName = "边塞", posX = 207 ,posZ = 396}, 
                                        { varMap = 1, mapName = "边塞", posX = 184 ,posZ = 380}, 
                                        { varMap = 1, mapName = "边塞", posX = 177 ,posZ = 351}, 
                                        { varMap = 1, mapName = "边塞", posX = 154 ,posZ = 330},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 38 , posZ = 57   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 64 , posZ = 39   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 101, posZ = 65   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 68 , posZ = 78   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 84   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 159, posZ = 49   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 150, posZ = 81   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 175, posZ = 38   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 204, posZ = 60   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 222, posZ = 34   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 29 , posZ = 99   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 35 , posZ = 110  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 67 , posZ = 151  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 89 , posZ = 128  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 122, posZ = 144  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 156, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 199, posZ = 113  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 232, posZ = 127  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 220, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 167, posZ = 153  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 41 , posZ = 222  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 51 , posZ = 174  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 81 , posZ = 199  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 201  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 124, posZ = 161  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 144, posZ = 177  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 161, posZ = 204  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 133, posZ = 213  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 125, posZ = 130  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 117, posZ = 99   	},                                           
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 34 , posZ = 39 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 37 , posZ = 59 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 34 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 74 , posZ = 67 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 101, posZ = 63 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 147, posZ = 61 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 132, posZ = 71 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 155, posZ = 85 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 186, posZ = 75 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 190, posZ = 48 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 57 , posZ = 110	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 85 , posZ = 116	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 119, posZ = 138	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 70 , posZ = 163	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 109, posZ = 174	},    
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 149, posZ = 161	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 193, posZ = 163	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 216, posZ = 157	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 177, posZ = 126	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 203, posZ = 115	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 49 , posZ = 213	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 53 , posZ = 190	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 171	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 134, posZ = 186	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 75 , posZ = 208	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 140, posZ = 185	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 148, posZ = 216	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 176, posZ = 201	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 198, posZ = 198	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 202, posZ = 215	},                                        
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 84	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 55 , posZ = 42	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 86 , posZ = 31	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 81 , posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 99 , posZ = 38	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 147, posZ = 54	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 177, posZ = 34	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 55	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 204, posZ = 78	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 214, posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 30 , posZ = 122 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 166 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 63 , posZ = 137 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 152 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 177 },    
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 128, posZ = 182 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 161 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 183, posZ = 143 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 126 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 217, posZ = 149 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 208 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 229 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 77 , posZ = 191 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 119, posZ = 190 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 127, posZ = 220 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 154, posZ = 194 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 214 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 195, posZ = 200 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 170 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 216, posZ = 152 },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 93  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 36 , posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 64 , posZ = 60    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 99 , posZ = 43  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 95 , posZ = 89  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 148, posZ = 58    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 147, posZ = 74    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 169, posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 196, posZ = 53    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 192, posZ = 73    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 31 , posZ = 159   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 86 , posZ = 128 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 118, posZ = 152 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 144, posZ = 128   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 158   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 170, posZ = 143 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 118   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 121   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 195, posZ = 151 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 165, posZ = 168 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 183   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 73 , posZ = 174   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 62 , posZ = 224   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 193   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 141, posZ = 212   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 173, posZ = 185   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 209, posZ = 163 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 199, posZ = 189 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 215   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 186  	},   
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 24 , posZ = 42  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 39 , posZ = 29    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 57 , posZ = 64    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 82 , posZ = 52  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 111, posZ = 53  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 138, posZ = 66    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 157, posZ = 41    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 185, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 213, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 199, posZ = 78    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 240, posZ = 76    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 233, posZ = 113 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 214, posZ = 128 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 187, posZ = 137   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 179, posZ = 165   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 177, posZ = 208 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 197, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 211, posZ = 175   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 198, posZ = 218 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 224, posZ = 211 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 222, posZ = 228   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 131, posZ = 109   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 122, posZ = 151   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 162   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 29 , posZ = 166   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 113, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 87 , posZ = 227   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 52 , posZ = 234 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 205   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 194, posZ = 142   },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 39 , posZ = 78  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 60 , posZ = 80  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 78 , posZ = 61  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 96 , posZ = 73  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 54  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 116, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 62  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 205, posZ = 51  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 223, posZ = 28  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 114 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 93 , posZ = 150 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 68 , posZ = 157 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 51 , posZ = 147 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 31 , posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 100, posZ = 173 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 110, posZ = 197 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 107, posZ = 227 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 129, posZ = 209 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 158, posZ = 210 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 180, posZ = 214 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 175 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 185, posZ = 141 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 199, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 205 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 232, posZ = 224 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 222, posZ = 230 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 127 }, 
                                                                                
}                                                                                        

x300344_var_QuestTargetTable1        = {
                                        { varMap = 0, mapName = "王国", posX = 250, posZ = 254}, 
                                        { varMap = 0, mapName = "王国", posX = 226, posZ = 256 }, 
                                        { varMap = 0, mapName = "王国", posX = 230, posZ = 269 },  
                                        { varMap = 0, mapName = "王国", posX = 227, posZ = 277 }, 
                                        { varMap = 0, mapName = "王国", posX = 202, posZ = 262 }, 
                                        { varMap = 0, mapName = "王国", posX = 194, posZ = 272 }, 
                                        { varMap = 0, mapName = "王国", posX = 190, posZ = 267 }, 
                                        { varMap = 0, mapName = "王国", posX = 191, posZ = 284 }, 
                                        { varMap = 0, mapName = "王国", posX = 207, posZ = 281 }, 
                                        { varMap = 0, mapName = "王国", posX = 184, posZ = 256 }, 
                                        { varMap = 0, mapName = "王国", posX = 185, posZ = 282 }, 
                                        { varMap = 0, mapName = "王国", posX = 183, posZ = 297 }, 
                                        { varMap = 0, mapName = "王国", posX = 182, posZ = 291}, 
                                        { varMap = 0, mapName = "王国", posX = 193, posZ = 295}, 
                                        { varMap = 0, mapName = "王国", posX = 183, posZ = 308}, 
                                        { varMap = 0, mapName = "王国", posX = 190, posZ = 313 }, 
                                        { varMap = 0, mapName = "王国", posX = 180, posZ = 315}, 
                                        { varMap = 0, mapName = "王国", posX = 191 ,posZ = 319}, 
                                        { varMap = 0, mapName = "王国", posX = 205, posZ = 318}, 
                                        { varMap = 0, mapName = "王国", posX = 212, posZ = 314}, 
                                        { varMap = 0, mapName = "王国", posX = 219, posZ = 310}, 
                                        { varMap = 0, mapName = "王国", posX = 217, posZ = 302 }, 
                                        { varMap = 0, mapName = "王国", posX = 227 ,posZ = 309}, 
                                        { varMap = 0, mapName = "王国", posX = 223, posZ = 317}, 
                                        { varMap = 0, mapName = "王国", posX = 213 ,posZ = 326 }, 
                                        { varMap = 0, mapName = "王国", posX = 218 ,posZ = 334 }, 
                                        { varMap = 0, mapName = "王国", posX = 235 ,posZ = 319 }, 
                                        { varMap = 0, mapName = "王国", posX = 242 ,posZ = 302 }, 
                                        { varMap = 0, mapName = "王国", posX = 248 ,posZ = 293 }, 
                                        { varMap = 0, mapName = "王国", posX = 257 ,posZ = 310 }, 
                                        { varMap = 0, mapName = "王国", posX = 260 ,posZ = 296 }, 
                                        { varMap = 0, mapName = "王国", posX = 272 ,posZ = 316 }, 
                                        { varMap = 0, mapName = "王国", posX = 278 ,posZ = 301 }, 
                                        { varMap = 0, mapName = "王国", posX = 281 ,posZ = 284 }, 
                                        { varMap = 0, mapName = "王国", posX = 277 ,posZ = 271 }, 
                                        { varMap = 0, mapName = "王国", posX = 286 ,posZ = 294 }, 
                                        { varMap = 0, mapName = "王国", posX = 302 ,posZ = 298 }, 
                                        { varMap = 0, mapName = "王国", posX = 308, posZ = 302 }, 
                                        { varMap = 0, mapName = "王国", posX = 277, posZ = 263 }, 
                                        { varMap = 0, mapName = "王国", posX = 307, posZ = 264 }, 
                                        { varMap = 0, mapName = "王国", posX = 324 ,posZ = 280 }, 
                                        { varMap = 0, mapName = "王国", posX = 321 ,posZ = 287 }, 
                                        { varMap = 0, mapName = "王国", posX = 309, posZ = 288 }, 
                                        { varMap = 0, mapName = "王国", posX = 353, posZ = 288 }, 
                                        { varMap = 0, mapName = "王国", posX = 373, posZ = 295 }, 
                                        { varMap = 0, mapName = "王国", posX = 372, posZ = 287 }, 
                                        { varMap = 0, mapName = "王国", posX = 373, posZ = 304 }, 
                                        { varMap = 0, mapName = "王国", posX = 375, posZ = 315}, 
                                        { varMap = 0, mapName = "王国", posX = 370, posZ = 314 }, 
                                        { varMap = 0, mapName = "王国", posX = 381, posZ = 309 }, 
                                        { varMap = 1, mapName = "边塞", posX = 241, posZ = 261}, 
                                        { varMap = 1, mapName = "边塞", posX = 252, posZ = 270}, 
                                        { varMap = 1, mapName = "边塞", posX = 248, posZ = 277},  
                                        { varMap = 1, mapName = "边塞", posX = 246, posZ = 284}, 
                                        { varMap = 1, mapName = "边塞", posX = 258, posZ = 267}, 
                                        { varMap = 1, mapName = "边塞", posX = 262, posZ = 234}, 
                                        { varMap = 1, mapName = "边塞", posX = 272, posZ = 210}, 
                                        { varMap = 1, mapName = "边塞", posX = 272, posZ = 202}, 
                                        { varMap = 1, mapName = "边塞", posX = 246, posZ = 183}, 
                                        { varMap = 1, mapName = "边塞", posX = 250, posZ = 175}, 
                                        { varMap = 1, mapName = "边塞", posX = 257, posZ = 181}, 
                                        { varMap = 1, mapName = "边塞", posX = 220, posZ = 125}, 
                                        { varMap = 1, mapName = "边塞", posX = 214, posZ = 119}, 
                                        { varMap = 1, mapName = "边塞", posX = 204, posZ = 114}, 
                                        { varMap = 1, mapName = "边塞", posX = 195, posZ = 109 }, 
                                        { varMap = 1, mapName = "边塞", posX = 191, posZ = 117 }, 
                                        { varMap = 1, mapName = "边塞", posX = 200, posZ = 120 }, 
                                        { varMap = 1, mapName = "边塞", posX = 193 ,posZ = 125 }, 
                                        { varMap = 1, mapName = "边塞", posX = 205, posZ = 129 }, 
                                        { varMap = 1, mapName = "边塞", posX = 197, posZ = 133 }, 
                                        { varMap = 1, mapName = "边塞", posX = 188, posZ = 126 }, 
                                        { varMap = 1, mapName = "边塞", posX = 177, posZ = 131 }, 
                                        { varMap = 1, mapName = "边塞", posX = 180 ,posZ = 140 }, 
                                        { varMap = 1, mapName = "边塞", posX = 189 ,posZ = 145 }, 
                                        { varMap = 1, mapName = "边塞", posX = 180 ,posZ = 168 }, 
                                        { varMap = 1, mapName = "边塞", posX = 169 ,posZ = 179 }, 
                                        { varMap = 1, mapName = "边塞", posX = 173 ,posZ = 183 }, 
                                        { varMap = 1, mapName = "边塞", posX = 167 ,posZ = 190 }, 
                                        { varMap = 1, mapName = "边塞", posX = 180 ,posZ = 196 }, 
                                        { varMap = 1, mapName = "边塞", posX = 190 ,posZ = 193 }, 
                                        { varMap = 1, mapName = "边塞", posX = 146 ,posZ = 181 }, 
                                        { varMap = 1, mapName = "边塞", posX = 139, posZ = 188 }, 
                                        { varMap = 1, mapName = "边塞", posX = 138, posZ = 196 }, 
                                        { varMap = 1, mapName = "边塞", posX = 143, posZ = 203 }, 
                                        { varMap = 1, mapName = "边塞", posX = 88 , posZ = 212 }, 
                                        { varMap = 1, mapName = "边塞", posX = 85 , posZ = 203 }, 
                                        { varMap = 1, mapName = "边塞", posX = 71 , posZ = 200 }, 
                                        { varMap = 1, mapName = "边塞", posX = 53 , posZ = 203 }, 
                                        { varMap = 1, mapName = "边塞", posX = 61 , posZ = 203 }, 
                                        { varMap = 1, mapName = "边塞", posX = 45 , posZ = 211 }, 
                                        { varMap = 1, mapName = "边塞", posX = 37 , posZ = 223 }, 
                                        { varMap = 1, mapName = "边塞", posX = 40 , posZ = 233 }, 
                                        { varMap = 1, mapName = "边塞", posX = 48 , posZ = 194 }, 
                                        { varMap = 1, mapName = "边塞", posX = 57  ,posZ = 139 }, 
                                        { varMap = 1, mapName = "边塞", posX = 49  ,posZ = 148 }, 
                                        { varMap = 1, mapName = "边塞", posX = 55 , posZ = 153}, 
                                        { varMap = 1, mapName = "边塞", posX = 52 , posZ = 157}, 
                                        { varMap = 1, mapName = "边塞", posX = 76 , posZ = 122 }, 
                                        { varMap = 1, mapName = "边塞", posX = 83 , posZ = 102}, 
                                        { varMap = 1, mapName = "边塞", posX = 87 , posZ = 90 },
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 38 , posZ = 57   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 64 , posZ = 39   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 101, posZ = 65   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 68 , posZ = 78   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 84   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 159, posZ = 49   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 150, posZ = 81   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 175, posZ = 38   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 204, posZ = 60   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 222, posZ = 34   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 29 , posZ = 99   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 35 , posZ = 110  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 67 , posZ = 151  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 89 , posZ = 128  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 122, posZ = 144  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 156, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 199, posZ = 113  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 232, posZ = 127  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 220, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 167, posZ = 153  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 41 , posZ = 222  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 51 , posZ = 174  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 81 , posZ = 199  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 201  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 124, posZ = 161  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 144, posZ = 177  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 161, posZ = 204  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 133, posZ = 213  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 125, posZ = 130  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 117, posZ = 99   	},                                           
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 34 , posZ = 39 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 37 , posZ = 59 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 34 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 74 , posZ = 67 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 101, posZ = 63 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 147, posZ = 61 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 132, posZ = 71 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 155, posZ = 85 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 186, posZ = 75 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 190, posZ = 48 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 57 , posZ = 110	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 85 , posZ = 116	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 119, posZ = 138	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 70 , posZ = 163	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 109, posZ = 174	},    
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 149, posZ = 161	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 193, posZ = 163	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 216, posZ = 157	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 177, posZ = 126	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 203, posZ = 115	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 49 , posZ = 213	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 53 , posZ = 190	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 171	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 134, posZ = 186	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 75 , posZ = 208	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 140, posZ = 185	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 148, posZ = 216	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 176, posZ = 201	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 198, posZ = 198	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 202, posZ = 215	},                                        
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 84	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 55 , posZ = 42	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 86 , posZ = 31	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 81 , posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 99 , posZ = 38	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 147, posZ = 54	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 177, posZ = 34	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 55	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 204, posZ = 78	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 214, posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 30 , posZ = 122 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 166 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 63 , posZ = 137 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 152 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 177 },    
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 128, posZ = 182 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 161 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 183, posZ = 143 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 126 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 217, posZ = 149 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 208 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 229 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 77 , posZ = 191 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 119, posZ = 190 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 127, posZ = 220 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 154, posZ = 194 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 214 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 195, posZ = 200 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 170 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 216, posZ = 152 },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 93  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 36 , posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 64 , posZ = 60    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 99 , posZ = 43  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 95 , posZ = 89  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 148, posZ = 58    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 147, posZ = 74    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 169, posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 196, posZ = 53    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 192, posZ = 73    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 31 , posZ = 159   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 86 , posZ = 128 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 118, posZ = 152 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 144, posZ = 128   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 158   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 170, posZ = 143 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 118   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 121   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 195, posZ = 151 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 165, posZ = 168 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 183   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 73 , posZ = 174   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 62 , posZ = 224   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 193   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 141, posZ = 212   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 173, posZ = 185   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 209, posZ = 163 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 199, posZ = 189 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 215   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 186  	},   
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 24 , posZ = 42  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 39 , posZ = 29    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 57 , posZ = 64    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 82 , posZ = 52  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 111, posZ = 53  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 138, posZ = 66    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 157, posZ = 41    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 185, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 213, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 199, posZ = 78    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 240, posZ = 76    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 233, posZ = 113 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 214, posZ = 128 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 187, posZ = 137   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 179, posZ = 165   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 177, posZ = 208 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 197, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 211, posZ = 175   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 198, posZ = 218 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 224, posZ = 211 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 222, posZ = 228   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 131, posZ = 109   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 122, posZ = 151   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 162   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 29 , posZ = 166   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 113, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 87 , posZ = 227   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 52 , posZ = 234 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 205   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 194, posZ = 142   },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 39 , posZ = 78  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 60 , posZ = 80  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 78 , posZ = 61  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 96 , posZ = 73  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 54  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 116, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 62  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 205, posZ = 51  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 223, posZ = 28  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 114 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 93 , posZ = 150 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 68 , posZ = 157 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 51 , posZ = 147 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 31 , posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 100, posZ = 173 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 110, posZ = 197 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 107, posZ = 227 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 129, posZ = 209 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 158, posZ = 210 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 180, posZ = 214 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 175 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 185, posZ = 141 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 199, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 205 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 232, posZ = 224 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 222, posZ = 230 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 127 }, 
}

x300344_var_QuestTargetTable2        = {
                                        { varMap = 0, mapName = "王国", posX = 381,  posZ = 295 }, 
                                        { varMap = 0, mapName = "王国", posX = 367,  posZ = 262}, 
                                        { varMap = 0, mapName = "王国", posX = 379,  posZ = 278 },  
                                        { varMap = 0, mapName = "王国", posX = 374,  posZ = 281}, 
                                        { varMap = 0, mapName = "王国", posX = 369,  posZ = 243}, 
                                        { varMap = 0, mapName = "王国", posX = 379,  posZ = 240}, 
                                        { varMap = 0, mapName = "王国", posX = 406,  posZ = 241}, 
                                        { varMap = 0, mapName = "王国", posX = 407,  posZ = 249}, 
                                        { varMap = 0, mapName = "王国", posX = 392,  posZ = 243}, 
                                        { varMap = 0, mapName = "王国", posX = 387,  posZ = 248}, 
                                        { varMap = 0, mapName = "王国", posX = 361,  posZ = 270}, 
                                        { varMap = 0, mapName = "王国", posX = 354,  posZ = 291}, 
                                        { varMap = 0, mapName = "王国", posX = 350,  posZ = 252}, 
                                        { varMap = 0, mapName = "王国", posX = 342,  posZ = 252 }, 
                                        { varMap = 0, mapName = "王国", posX = 311,  posZ = 252 }, 
                                        { varMap = 0, mapName = "王国", posX = 304,  posZ = 253  }, 
                                        { varMap = 0, mapName = "王国", posX = 289,  posZ = 253 }, 
                                        { varMap = 0, mapName = "王国", posX = 267 , posZ = 256 }, 
                                        { varMap = 0, mapName = "王国", posX = 254,  posZ = 266 }, 
                                        { varMap = 0, mapName = "王国", posX = 235,  posZ = 277 }, 
                                        { varMap = 0, mapName = "王国", posX = 219,  posZ = 283 }, 
                                        { varMap = 0, mapName = "王国", posX = 220,  posZ = 290 }, 
                                        { varMap = 0, mapName = "王国", posX = 199,  posZ = 281 }, 
                                        { varMap = 0, mapName = "王国", posX = 162,  posZ = 274 }, 
                                        { varMap = 0, mapName = "王国", posX = 161,  posZ = 258 }, 
                                        { varMap = 0, mapName = "王国", posX = 134,  posZ = 234 }, 
                                        { varMap = 0, mapName = "王国", posX = 126,  posZ = 240 }, 
                                        { varMap = 0, mapName = "王国", posX = 119,  posZ = 253 }, 
                                        { varMap = 0, mapName = "王国", posX = 119,  posZ = 240 }, 
                                        { varMap = 0, mapName = "王国", posX = 139 , posZ = 212 }, 
                                        { varMap = 0, mapName = "王国", posX = 133 , posZ = 199 }, 
                                        { varMap = 0, mapName = "王国", posX = 121 , posZ = 211 }, 
                                        { varMap = 0, mapName = "王国", posX = 136 , posZ = 229 }, 
                                        { varMap = 0, mapName = "王国", posX = 145 , posZ = 216 }, 
                                        { varMap = 0, mapName = "王国", posX = 160 , posZ = 233 }, 
                                        { varMap = 0, mapName = "王国", posX = 155 , posZ = 228 }, 
                                        { varMap = 0, mapName = "王国", posX = 146 , posZ = 239 }, 
                                        { varMap = 0, mapName = "王国", posX = 134 , posZ = 253 }, 
                                        { varMap = 0, mapName = "王国", posX = 150 , posZ = 247 }, 
                                        { varMap = 0, mapName = "王国", posX = 160 , posZ = 265 }, 
                                        { varMap = 0, mapName = "王国", posX = 163 , posZ = 283 }, 
                                        { varMap = 0, mapName = "王国", posX = 177 , posZ = 298 }, 
                                        { varMap = 0, mapName = "王国", posX = 171 , posZ = 313 }, 
                                        { varMap = 0, mapName = "王国", posX = 158 , posZ = 331 }, 
                                        { varMap = 0, mapName = "王国", posX = 142 , posZ = 334 }, 
                                        { varMap = 0, mapName = "王国", posX = 132 , posZ = 336 }, 
                                        { varMap = 0, mapName = "王国", posX = 119 , posZ = 325 }, 
                                        { varMap = 0, mapName = "王国", posX = 105 , posZ = 342 }, 
                                        { varMap = 0, mapName = "王国", posX = 80  , posZ = 355 }, 
                                        { varMap = 0, mapName = "王国", posX = 78  , posZ = 362}, 
                                        { varMap = 1, mapName = "边塞", posX = 87 ,  posZ = 74 }, 
                                        { varMap = 1, mapName = "边塞", posX = 88 ,  posZ = 64 }, 
                                        { varMap = 1, mapName = "边塞", posX = 79 ,  posZ = 71 },  
                                        { varMap = 1, mapName = "边塞", posX = 103,  posZ = 77 }, 
                                        { varMap = 1, mapName = "边塞", posX = 100,  posZ = 85 }, 
                                        { varMap = 1, mapName = "边塞", posX = 95 ,  posZ = 79 }, 
                                        { varMap = 1, mapName = "边塞", posX = 98 ,  posZ = 67 }, 
                                        { varMap = 1, mapName = "边塞", posX = 104,  posZ = 98  }, 
                                        { varMap = 1, mapName = "边塞", posX = 99 ,  posZ = 91  }, 
                                        { varMap = 1, mapName = "边塞", posX = 101,  posZ = 105 }, 
                                        { varMap = 1, mapName = "边塞", posX = 105,  posZ = 113 }, 
                                        { varMap = 1, mapName = "边塞", posX = 101,  posZ = 119 }, 
                                        { varMap = 1, mapName = "边塞", posX = 97 ,  posZ = 109 }, 
                                        { varMap = 1, mapName = "边塞", posX = 51 ,  posZ = 137 }, 
                                        { varMap = 1, mapName = "边塞", posX = 45 ,  posZ = 152 }, 
                                        { varMap = 1, mapName = "边塞", posX = 155,  posZ = 233  }, 
                                        { varMap = 1, mapName = "边塞", posX = 152,  posZ = 213 }, 
                                        { varMap = 1, mapName = "边塞", posX = 166,  posZ = 197 }, 
                                        { varMap = 1, mapName = "边塞", posX = 187,  posZ = 190 }, 
                                        { varMap = 1, mapName = "边塞", posX = 186,  posZ = 156 }, 
                                        { varMap = 1, mapName = "边塞", posX = 205,  posZ = 160 }, 
                                        { varMap = 1, mapName = "边塞", posX = 198,  posZ = 157 }, 
                                        { varMap = 1, mapName = "边塞", posX = 238 , posZ = 139 }, 
                                        { varMap = 1, mapName = "边塞", posX = 251 , posZ = 140 }, 
                                        { varMap = 1, mapName = "边塞", posX = 264 , posZ = 180 }, 
                                        { varMap = 1, mapName = "边塞", posX = 283 , posZ = 189 }, 
                                        { varMap = 1, mapName = "边塞", posX = 275 , posZ = 207 }, 
                                        { varMap = 1, mapName = "边塞", posX = 269 , posZ = 220 }, 
                                        { varMap = 1, mapName = "边塞", posX = 257 , posZ = 275 }, 
                                        { varMap = 1, mapName = "边塞", posX = 243 , posZ = 287 }, 
                                        { varMap = 1, mapName = "边塞", posX = 267 , posZ = 311 }, 
                                        { varMap = 1, mapName = "边塞", posX = 262 , posZ = 303 }, 
                                        { varMap = 1, mapName = "边塞", posX = 266 , posZ = 329 }, 
                                        { varMap = 1, mapName = "边塞", posX = 264 , posZ = 326}, 
                                        { varMap = 1, mapName = "边塞", posX = 253 , posZ = 328}, 
                                        { varMap = 1, mapName = "边塞", posX = 266 , posZ = 368}, 
                                        { varMap = 1, mapName = "边塞", posX = 273 , posZ = 366}, 
                                        { varMap = 1, mapName = "边塞", posX = 261 , posZ = 371 }, 
                                        { varMap = 1, mapName = "边塞", posX = 247 , posZ = 359 }, 
                                        { varMap = 1, mapName = "边塞", posX = 237 , posZ = 367 }, 
                                        { varMap = 1, mapName = "边塞", posX = 233 , posZ = 375 }, 
                                        { varMap = 1, mapName = "边塞", posX = 230,  posZ = 382 }, 
                                        { varMap = 1, mapName = "边塞", posX = 219,  posZ = 383 }, 
                                        { varMap = 1, mapName = "边塞", posX = 236,  posZ = 387}, 
                                        { varMap = 1, mapName = "边塞", posX = 243,  posZ = 381}, 
                                        { varMap = 1, mapName = "边塞", posX = 224,  posZ = 380 }, 
                                        { varMap = 1, mapName = "边塞", posX = 203,  posZ = 390}, 
                                        { varMap = 1, mapName = "边塞", posX = 212 , posZ = 397}, 
                                        { varMap = 1, mapName = "边塞", posX = 218,  posZ = 407}, 
                                        { varMap = 1, mapName = "边塞", posX = 227,  posZ = 422},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 38 , posZ = 57   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 64 , posZ = 39   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 101, posZ = 65   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 68 , posZ = 78   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 84   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 159, posZ = 49   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 150, posZ = 81   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 175, posZ = 38   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 204, posZ = 60   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 222, posZ = 34   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 29 , posZ = 99   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 35 , posZ = 110  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 67 , posZ = 151  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 89 , posZ = 128  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 122, posZ = 144  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 156, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 199, posZ = 113  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 232, posZ = 127  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 220, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 167, posZ = 153  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 41 , posZ = 222  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 51 , posZ = 174  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 81 , posZ = 199  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 201  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 124, posZ = 161  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 144, posZ = 177  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 161, posZ = 204  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 133, posZ = 213  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 125, posZ = 130  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 117, posZ = 99   	},                                           
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 34 , posZ = 39 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 37 , posZ = 59 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 34 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 74 , posZ = 67 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 101, posZ = 63 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 147, posZ = 61 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 132, posZ = 71 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 155, posZ = 85 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 186, posZ = 75 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 190, posZ = 48 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 57 , posZ = 110	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 85 , posZ = 116	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 119, posZ = 138	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 70 , posZ = 163	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 109, posZ = 174	},    
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 149, posZ = 161	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 193, posZ = 163	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 216, posZ = 157	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 177, posZ = 126	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 203, posZ = 115	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 49 , posZ = 213	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 53 , posZ = 190	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 171	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 134, posZ = 186	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 75 , posZ = 208	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 140, posZ = 185	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 148, posZ = 216	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 176, posZ = 201	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 198, posZ = 198	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 202, posZ = 215	},                                        
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 84	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 55 , posZ = 42	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 86 , posZ = 31	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 81 , posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 99 , posZ = 38	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 147, posZ = 54	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 177, posZ = 34	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 55	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 204, posZ = 78	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 214, posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 30 , posZ = 122 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 166 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 63 , posZ = 137 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 152 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 177 },    
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 128, posZ = 182 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 161 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 183, posZ = 143 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 126 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 217, posZ = 149 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 208 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 229 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 77 , posZ = 191 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 119, posZ = 190 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 127, posZ = 220 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 154, posZ = 194 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 214 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 195, posZ = 200 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 170 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 216, posZ = 152 },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 93  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 36 , posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 64 , posZ = 60    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 99 , posZ = 43  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 95 , posZ = 89  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 148, posZ = 58    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 147, posZ = 74    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 169, posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 196, posZ = 53    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 192, posZ = 73    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 31 , posZ = 159   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 86 , posZ = 128 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 118, posZ = 152 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 144, posZ = 128   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 158   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 170, posZ = 143 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 118   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 121   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 195, posZ = 151 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 165, posZ = 168 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 183   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 73 , posZ = 174   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 62 , posZ = 224   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 193   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 141, posZ = 212   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 173, posZ = 185   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 209, posZ = 163 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 199, posZ = 189 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 215   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 186  	},   
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 24 , posZ = 42  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 39 , posZ = 29    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 57 , posZ = 64    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 82 , posZ = 52  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 111, posZ = 53  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 138, posZ = 66    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 157, posZ = 41    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 185, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 213, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 199, posZ = 78    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 240, posZ = 76    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 233, posZ = 113 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 214, posZ = 128 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 187, posZ = 137   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 179, posZ = 165   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 177, posZ = 208 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 197, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 211, posZ = 175   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 198, posZ = 218 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 224, posZ = 211 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 222, posZ = 228   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 131, posZ = 109   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 122, posZ = 151   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 162   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 29 , posZ = 166   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 113, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 87 , posZ = 227   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 52 , posZ = 234 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 205   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 194, posZ = 142   },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 39 , posZ = 78  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 60 , posZ = 80  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 78 , posZ = 61  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 96 , posZ = 73  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 54  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 116, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 62  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 205, posZ = 51  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 223, posZ = 28  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 114 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 93 , posZ = 150 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 68 , posZ = 157 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 51 , posZ = 147 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 31 , posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 100, posZ = 173 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 110, posZ = 197 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 107, posZ = 227 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 129, posZ = 209 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 158, posZ = 210 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 180, posZ = 214 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 175 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 185, posZ = 141 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 199, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 205 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 232, posZ = 224 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 222, posZ = 230 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 127 }, 
}

x300344_var_QuestTargetTable3        = {
                                        { varMap = 0, mapName = "王国", posX = 71 , posZ = 376 }, 
                                        { varMap = 0, mapName = "王国", posX = 86 , posZ = 381 }, 
                                        { varMap = 0, mapName = "王国", posX = 93 , posZ = 388 },  
                                        { varMap = 0, mapName = "王国", posX = 95 , posZ = 394}, 
                                        { varMap = 0, mapName = "王国", posX = 99 , posZ = 406}, 
                                        { varMap = 0, mapName = "王国", posX = 103, posZ = 421}, 
                                        { varMap = 0, mapName = "王国", posX = 105, posZ = 431}, 
                                        { varMap = 0, mapName = "王国", posX = 93 , posZ = 437}, 
                                        { varMap = 0, mapName = "王国", posX = 88 , posZ = 437 }, 
                                        { varMap = 0, mapName = "王国", posX = 76 , posZ = 446 }, 
                                        { varMap = 0, mapName = "王国", posX = 74 , posZ = 453 }, 
                                        { varMap = 0, mapName = "王国", posX = 80 , posZ = 454 }, 
                                        { varMap = 0, mapName = "王国", posX = 85 , posZ = 454 }, 
                                        { varMap = 0, mapName = "王国", posX = 90 , posZ = 453 }, 
                                        { varMap = 0, mapName = "王国", posX = 96 , posZ = 453 }, 
                                        { varMap = 0, mapName = "王国", posX = 104, posZ = 452  }, 
                                        { varMap = 0, mapName = "王国", posX = 106, posZ = 444 }, 
                                        { varMap = 0, mapName = "王国", posX = 102 ,posZ = 442 }, 
                                        { varMap = 0, mapName = "王国", posX = 93 , posZ = 442 }, 
                                        { varMap = 0, mapName = "王国", posX = 83 , posZ = 449 }, 
                                        { varMap = 0, mapName = "王国", posX = 212, posZ = 407 }, 
                                        { varMap = 0, mapName = "王国", posX = 202, posZ = 398 }, 
                                        { varMap = 0, mapName = "王国", posX = 205 ,posZ = 406 }, 
                                        { varMap = 0, mapName = "王国", posX = 215 ,posZ = 416 }, 
                                        { varMap = 0, mapName = "王国", posX = 224 ,posZ = 411 }, 
                                        { varMap = 0, mapName = "王国", posX = 240 ,posZ = 407 }, 
                                        { varMap = 0, mapName = "王国", posX = 254 ,posZ = 400 }, 
                                        { varMap = 0, mapName = "王国", posX = 262 ,posZ = 386 }, 
                                        { varMap = 0, mapName = "王国", posX = 270 ,posZ = 371 }, 
                                        { varMap = 0, mapName = "王国", posX = 283 ,posZ = 369 }, 
                                        { varMap = 0, mapName = "王国", posX = 295 ,posZ = 360 }, 
                                        { varMap = 0, mapName = "王国", posX = 292 ,posZ = 342 }, 
                                        { varMap = 0, mapName = "王国", posX = 284 ,posZ = 336 }, 
                                        { varMap = 0, mapName = "王国", posX = 280 ,posZ = 321 }, 
                                        { varMap = 0, mapName = "王国", posX = 286 ,posZ = 281 }, 
                                        { varMap = 0, mapName = "王国", posX = 272 ,posZ = 278 }, 
                                        { varMap = 0, mapName = "王国", posX = 271 ,posZ = 260 }, 
                                        { varMap = 0, mapName = "王国", posX = 294 ,posZ = 268 }, 
                                        { varMap = 0, mapName = "王国", posX = 288 ,posZ = 275 }, 
                                        { varMap = 0, mapName = "王国", posX = 314 ,posZ = 295 }, 
                                        { varMap = 0, mapName = "王国", posX = 320 ,posZ = 269 }, 
                                        { varMap = 0, mapName = "王国", posX = 368 ,posZ = 301 }, 
                                        { varMap = 0, mapName = "王国", posX = 368 ,posZ = 287 }, 
                                        { varMap = 0, mapName = "王国", posX = 361 ,posZ = 279 }, 
                                        { varMap = 0, mapName = "王国", posX = 358 ,posZ = 261 }, 
                                        { varMap = 0, mapName = "王国", posX = 365 ,posZ = 249 }, 
                                        { varMap = 0, mapName = "王国", posX = 363 ,posZ = 228 }, 
                                        { varMap = 0, mapName = "王国", posX = 373 ,posZ = 232 }, 
                                        { varMap = 0, mapName = "王国", posX = 377 ,posZ = 250 }, 
                                        { varMap = 0, mapName = "王国", posX = 373 ,posZ = 253}, 
                                        { varMap = 1, mapName = "边塞", posX = 210 ,posZ = 404}, 
                                        { varMap = 1, mapName = "边塞", posX = 229, posZ = 414}, 
                                        { varMap = 1, mapName = "边塞", posX = 238, posZ = 407},  
                                        { varMap = 1, mapName = "边塞", posX = 251, posZ = 395}, 
                                        { varMap = 1, mapName = "边塞", posX = 264, posZ = 396}, 
                                        { varMap = 1, mapName = "边塞", posX = 259, posZ = 405}, 
                                        { varMap = 1, mapName = "边塞", posX = 255, posZ = 378}, 
                                        { varMap = 1, mapName = "边塞", posX = 257, posZ = 359}, 
                                        { varMap = 1, mapName = "边塞", posX = 237, posZ = 357}, 
                                        { varMap = 1, mapName = "边塞", posX = 239, posZ = 376}, 
                                        { varMap = 1, mapName = "边塞", posX = 193, posZ = 371}, 
                                        { varMap = 1, mapName = "边塞", posX = 184, posZ = 373}, 
                                        { varMap = 1, mapName = "边塞", posX = 168, posZ = 354}, 
                                        { varMap = 1, mapName = "边塞", posX = 154, posZ = 347}, 
                                        { varMap = 1, mapName = "边塞", posX = 153, posZ = 371}, 
                                        { varMap = 1, mapName = "边塞", posX = 149, posZ = 342 }, 
                                        { varMap = 1, mapName = "边塞", posX = 153, posZ = 336}, 
                                        { varMap = 1, mapName = "边塞", posX = 150 ,posZ = 327}, 
                                        { varMap = 1, mapName = "边塞", posX = 155, posZ = 323}, 
                                        { varMap = 1, mapName = "边塞", posX = 162, posZ = 327}, 
                                        { varMap = 1, mapName = "边塞", posX = 165, posZ = 337}, 
                                        { varMap = 1, mapName = "边塞", posX = 103, posZ = 363}, 
                                        { varMap = 1, mapName = "边塞", posX = 126 ,posZ = 356 }, 
                                        { varMap = 1, mapName = "边塞", posX = 131 ,posZ = 317 }, 
                                        { varMap = 1, mapName = "边塞", posX = 132 ,posZ = 305 }, 
                                        { varMap = 1, mapName = "边塞", posX = 140 ,posZ = 296 }, 
                                        { varMap = 1, mapName = "边塞", posX = 143 ,posZ = 289 }, 
                                        { varMap = 1, mapName = "边塞", posX = 146 ,posZ = 296 }, 
                                        { varMap = 1, mapName = "边塞", posX = 149 ,posZ = 299 }, 
                                        { varMap = 1, mapName = "边塞", posX = 141 ,posZ = 302 }, 
                                        { varMap = 1, mapName = "边塞", posX = 127 ,posZ = 288 }, 
                                        { varMap = 1, mapName = "边塞", posX = 133 ,posZ = 294 }, 
                                        { varMap = 1, mapName = "边塞", posX = 112, posZ = 251 }, 
                                        { varMap = 1, mapName = "边塞", posX = 98 , posZ = 244 }, 
                                        { varMap = 1, mapName = "边塞", posX = 117, posZ = 254 }, 
                                        { varMap = 1, mapName = "边塞", posX = 106, posZ = 251 }, 
                                        { varMap = 1, mapName = "边塞", posX = 121, posZ = 241 }, 
                                        { varMap = 1, mapName = "边塞", posX = 136, posZ = 226 }, 
                                        { varMap = 1, mapName = "边塞", posX = 123, posZ = 214 }, 
                                        { varMap = 1, mapName = "边塞", posX = 127, posZ = 206 }, 
                                        { varMap = 1, mapName = "边塞", posX = 107, posZ = 196 }, 
                                        { varMap = 1, mapName = "边塞", posX = 89 , posZ = 192 }, 
                                        { varMap = 1, mapName = "边塞", posX = 83  ,posZ = 185}, 
                                        { varMap = 1, mapName = "边塞", posX = 86 , posZ = 180}, 
                                        { varMap = 1, mapName = "边塞", posX = 76 , posZ = 197}, 
                                        { varMap = 1, mapName = "边塞", posX = 77 , posZ = 202}, 
                                        { varMap = 1, mapName = "边塞", posX = 40 , posZ = 205 }, 
                                        { varMap = 1, mapName = "边塞", posX = 41 , posZ = 218}, 
                                        { varMap = 1, mapName = "边塞", posX = 44 , posZ = 247}, 
                                        { varMap = 1, mapName = "边塞", posX = 59 , posZ = 259},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 38 , posZ = 57   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 64 , posZ = 39   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 101, posZ = 65   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 68 , posZ = 78   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 84   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 159, posZ = 49   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 150, posZ = 81   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 175, posZ = 38   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 204, posZ = 60   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 222, posZ = 34   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 29 , posZ = 99   	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 35 , posZ = 110  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 67 , posZ = 151  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 89 , posZ = 128  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 122, posZ = 144  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 156, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 199, posZ = 113  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 232, posZ = 127  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 220, posZ = 133  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 167, posZ = 153  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 41 , posZ = 222  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 51 , posZ = 174  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 81 , posZ = 199  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 115, posZ = 201  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 124, posZ = 161  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 144, posZ = 177  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 161, posZ = 204  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 133, posZ = 213  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 125, posZ = 130  	},
                                        { varMap = 5, mapName = "领地·凤翔府", posX = 117, posZ = 99   	},                                           
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 34 , posZ = 39 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 37 , posZ = 59 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 34 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 74 , posZ = 67 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 101, posZ = 63 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 147, posZ = 61 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 132, posZ = 71 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 155, posZ = 85 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 186, posZ = 75 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 190, posZ = 48 	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 57 , posZ = 110	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 85 , posZ = 116	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 119, posZ = 138	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 70 , posZ = 163	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 109, posZ = 174	},    
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 149, posZ = 161	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 193, posZ = 163	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 216, posZ = 157	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 177, posZ = 126	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 203, posZ = 115	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 49 , posZ = 213	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 53 , posZ = 190	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 71 , posZ = 171	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 134, posZ = 186	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 75 , posZ = 208	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 140, posZ = 185	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 148, posZ = 216	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 176, posZ = 201	}, 
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 198, posZ = 198	},
                                        { varMap = 8, mapName = "领地·阿尔金山", posX = 202, posZ = 215	},                                        
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 84	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 55 , posZ = 42	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 86 , posZ = 31	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 81 , posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 99 , posZ = 38	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 147, posZ = 54	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 177, posZ = 34	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 55	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 204, posZ = 78	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 214, posZ = 71	},
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 30 , posZ = 122 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 166 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 63 , posZ = 137 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 152 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 89 , posZ = 177 },    
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 128, posZ = 182 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 161 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 183, posZ = 143 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 126 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 217, posZ = 149 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 34 , posZ = 208 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 49 , posZ = 229 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 77 , posZ = 191 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 119, posZ = 190 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 127, posZ = 220 }, 
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 154, posZ = 194 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 152, posZ = 214 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 195, posZ = 200 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 209, posZ = 170 },
                                        { varMap = 11, mapName = "领地·撒马尔罕", posX = 216, posZ = 152 },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 93  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 36 , posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 64 , posZ = 60    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 99 , posZ = 43  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 95 , posZ = 89  	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 148, posZ = 58    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 147, posZ = 74    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 169, posZ = 50    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 196, posZ = 53    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 192, posZ = 73    },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 31 , posZ = 159   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 86 , posZ = 128 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 118, posZ = 152 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 144, posZ = 128   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 158   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 170, posZ = 143 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 118   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 121   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 195, posZ = 151 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 165, posZ = 168 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 53 , posZ = 183   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 73 , posZ = 174   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 62 , posZ = 224   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 124, posZ = 193   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 141, posZ = 212   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 173, posZ = 185   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 209, posZ = 163 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 199, posZ = 189 	},
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 198, posZ = 215   },
                                        { varMap = 17, mapName = "领地·莫斯科", posX = 206, posZ = 186  	},   
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 24 , posZ = 42  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 39 , posZ = 29    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 57 , posZ = 64    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 82 , posZ = 52  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 111, posZ = 53  	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 138, posZ = 66    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 157, posZ = 41    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 185, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 213, posZ = 27    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 199, posZ = 78    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 240, posZ = 76    },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 233, posZ = 113 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 214, posZ = 128 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 187, posZ = 137   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 179, posZ = 165   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 177, posZ = 208 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 197, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 211, posZ = 175   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 198, posZ = 218 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 224, posZ = 211 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 222, posZ = 228   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 131, posZ = 109   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 122, posZ = 151   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 162   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 29 , posZ = 166   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 113, posZ = 200   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 87 , posZ = 227   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 52 , posZ = 234 	},
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 54 , posZ = 205   },
                                        { varMap = 20, mapName = "领地·匈牙利", posX = 194, posZ = 142   },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 39 , posZ = 78  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 60 , posZ = 80  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 78 , posZ = 61  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 96 , posZ = 73  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 54  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 116, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 83  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 62  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 205, posZ = 51  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 223, posZ = 28  },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 114 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 114, posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 93 , posZ = 150 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 68 , posZ = 157 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 51 , posZ = 147 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 31 , posZ = 140 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 100, posZ = 173 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 110, posZ = 197 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 107, posZ = 227 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 129, posZ = 209 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 158, posZ = 210 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 180, posZ = 214 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 173, posZ = 175 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 185, posZ = 141 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 199, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 187 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 217, posZ = 205 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 232, posZ = 224 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 222, posZ = 230 },
                                        { varMap = 23, mapName = "领地·大马士革", posX = 115, posZ = 127 }, 
}


x300344_var_MonsterTable              = {
                                        { varLevel = 20, bossId = 3050, strName = "巨角羊"    },
                                        { varLevel = 25, bossId = 3051, strName = "白头鸠"    },
                                        { varLevel = 30, bossId = 3052, strName = "铁骨僵尸"  },
                                        { varLevel = 35, bossId = 3053, strName = "毒爪蛛"    },
                                        { varLevel = 40, bossId = 3054, strName = "狡尾狐"    },
                                        { varLevel = 45, bossId = 3055, strName = "闪尾蝎"    },
                                        { varLevel = 50, bossId = 3056, strName = "怒角牛"    },
                                        { varLevel = 55, bossId = 3057, strName = "粉羽雉"    },
                                        { varLevel = 60, bossId = 3058, strName = "长牙雪怪"  },
                                        { varLevel = 65, bossId = 3062, strName = "黑影豹"    },
                                        { varLevel = 70, bossId = 3063, strName = "铁鬃熊"    },
                                        { varLevel = 75, bossId = 3064, strName = "金尾狮"    },
}

x300344_var_MonsterLive               = {
                                        { live = 0, varMap = 50,  mapName = "楼兰王城"   }, 
                                        { live = 0, varMap = 51,  mapName = "楼兰边塞"   }, 
                                        { live = 0, varMap = 150, mapName = "天山王城"   }, 
                                        { live = 0, varMap = 151, mapName = "天山边塞"   }, 
                                        { live = 0, varMap = 250, mapName = "昆仑王城"   }, 
                                        { live = 0, varMap = 251, mapName = "昆仑边塞"   }, 
                                        { live = 0, varMap = 350, mapName = "敦煌王城"   }, 
                                        { live = 0, varMap = 351, mapName = "敦煌边塞"   }, 
                                        { live = 0, varMap = 5,   mapName = "领地·凤翔府" }, 
																				{ live = 0, varMap = 8,   mapName = "领地·阿尔金山" },
																				{ live = 0, varMap = 11,  mapName = "领地·撒马尔罕" },
																				{ live = 0, varMap = 17,  mapName = "领地·莫斯科"   },
                                        { live = 0, varMap = 20,  mapName = "领地·匈牙利"   }, 
                                        { live = 0, varMap = 23,  mapName = "领地·大马士革" },
}


x300344_var_CallerId      = 0
x300344_var_CountryID     = 0
x300344_var_CallerName    = ""

x300344_var_DigRange      = 2

x300344_var_MoneyBuff     = 7046

x300344_var_GemBuff       = 7047

x300344_var_MedicineBuff  = 7048

x300344_var_MonsterBuff   = 7049	




function x300344_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    
end




function x300344_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,varExtIdx)	

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300344_var_QuestId);
	if(varHaveQuest > 0) then
		local varDone = x300344_CheckSubmit(varMap, varPlayer, varTalknpc);
		if(varDone > 0) then
			if varExtIdx ~= -1 then
				x300344_DispatchCompletedInfo( varMap, varPlayer, varTalknpc ) 
			end
		else
			if varExtIdx ~= -1 then
				x300344_DispatchContinueInfo( varMap, varPlayer, varTalknpc ) 
			end
		end
	else
		x300344_DeliverTalkInfo( varMap, varPlayer, varTalknpc )	
	end
end




function x300344_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300344_var_QuestId);
	if( varHaveQuest > 0) then
		return 0;
	else
		return 1;
	end
end




function x300344_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
	return 0
end




function x300344_ProcQuestAbandon(varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300344_var_QuestId);
	if(varHaveQuest > 0) then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId); 
		DelQuest(varMap, varPlayer, x300344_var_QuestId)

		StartTalkTask( varMap)
		TalkAppendString( varMap, x300344_var_strQuestAbandon)
		StopTalkTask( varMap)
		DeliverTalkTips( varMap, varPlayer)
		Msg2Player( varMap, varPlayer, x300344_var_strQuestAbandon, 8, 2)
	end
end




function x300344_CheckSubmit(varMap, varPlayer, varTalknpc)

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId);
	return GetQuestParam(varMap, varPlayer, varQuestIdx, x300344_MP_ISCOMPLETE);

end




function x300344_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick )

	
	if x300344_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300344_var_BonusMoney1 )
	    Msg2Player(varMap,varPlayer,format("获得银卡#{_MONEY%d}的奖励。", x300344_var_BonusMoney1),4,2)
	end

	
	if x300344_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300344_var_BonusMoney2 )
	    Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x300344_var_BonusMoney2),4,2)
	end

	
	if x300344_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300344_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x300344_var_BonusMoney3),4,2)
	end

	
	if x300344_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x300344_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x300344_var_BonusMoney4),4,2)
	end

	
	if x300344_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x300344_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x300344_var_BonusMoney5),4,2)
	end

	
	if x300344_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x300344_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x300344_var_BonusMoney6),4,2)
	end

 	
	for varI, item in x300344_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppendBind( varMap, item.item, item.n )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300344_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppendBind( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
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




function x300344_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x300344_var_QuestId);
	if varHaveQuest > 0 then

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId)
		local completed = GetQuestParam(varMap, varPlayer, varQuestIdx, x300344_MP_ISCOMPLETE)

		if completed == 1 then
			local result = x300344_CheckPlayerBagFull(varMap,varPlayer)
			if result == 1 then
		    	x300344_GetBonus( varMap,varPlayer,varTalknpc,varRadioSelected )
		    	DelQuest(varMap, varPlayer, x300344_var_QuestId)
		    	
					local varScript = -1;
					local varQuest = -1;
					local randnum = random(1, 5);
					if(randnum == 1) then
						varScript = 300761;
						varQuest = 7553;
					elseif(randnum == 2) then
						varScript = 300762;
						varQuest = 7554;
					elseif(randnum == 3) then
						varScript = 300344;
						varQuest = 8047;
					elseif(randnum == 4) then
						varScript = 300764;
						varQuest = 7582;
					elseif(randnum == 5) then
						varScript = 300765;
						varQuest = 7583;
					end
					LuaCallNoclosure( varScript, "ProcForceAddQuest", varMap, varPlayer, varTalknpc, varQuest );
			   	
		    else
		    	StartTalkTask( varMap )
				TalkAppendString( varMap,"包裹已满！")
				StopTalkTask()
				DeliverTalkTips(varMap, varPlayer);
		    end

		else
			StartTalkTask( varMap )
				TalkAppendString( varMap,"任务没有完成！")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer);
		end
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end

end




function x300344_CheckPlayerBagFull( varMap ,varPlayer )


	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x300344_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
    end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet <= 0 then
		result = 0
		bAdd = 1
	end

    
	if bAdd == 0 then

		for j, item in x300344_var_BonusChoiceItem do
	        StartItemTask(varMap)
			ItemAppendBind( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet <= 0 then
				if result == 1 then
					result = 0
				end
			end
	    end
	end

	return result
end




function x300344_DeliverTalkInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300344_var_QuestName)
		TalkAppendString(varMap,x300344_var_QuestInfo)
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,x300344_var_QuestTarget)
		TalkAppendString( varMap," ")

		
		if x300344_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,x300344_var_QuestHelp )
			TalkAppendString(varMap," ")
		end

		

		
		if x300344_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x300344_var_ExpBonus )
		end

		
		if x300344_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x300344_var_BonusMoney1 )
		end

		
		if x300344_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x300344_var_BonusMoney2 )
		end
		
		if x300344_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x300344_var_BonusMoney3 )
		end

		
		if x300344_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x300344_var_BonusMoney4 )
		end

		
		if x300344_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x300344_var_BonusMoney5 )
		end

		
		if x300344_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300344_var_BonusMoney6 )
		end


		
		for varI, item in x300344_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300344_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end


	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300344_var_FileId, x300344_var_QuestId);
end




function x300344_ProcDigbyShovel( varMap, varPlayer)

	 	if GetBagSpace(varMap, varPlayer) < 2 then
	 		Msg2Player(varMap, varPlayer,"需要至少两格空余背包位置才能挖掘！",8,2)
	 		Msg2Player(varMap, varPlayer,"需要至少两格空余背包位置才能挖掘！",8,3)
	 		return 0
	 	end
    
    if IsHaveQuestNM( varMap, varPlayer, x300344_var_QuestId) == 0 then       
        return 0
    else
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300344_var_QuestId)
        local ts = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET4)
        if ts ~= varMap then
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, "秘钻黄金藏宝图任务挖掘场景不对，您白忙活一场" )
    		StopTalkTask( varMap)
    		DeliverTalkTips( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, "秘钻黄金藏宝图任务挖掘场景不对，您白忙活一场", 8, 2)
            return 0
        end
        local varX = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET2)
        local z = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET3)
        local curX, curZ = GetWorldPos( varMap, varPlayer)
        curX = abs( varX - curX)
        curZ = abs( z - curZ)
        if curX > x300344_var_DigRange or curZ > x300344_var_DigRange then
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, "秘钻黄金藏宝图任务挖掘座标不对，您白忙活一场" )
    		StopTalkTask( varMap)
    		DeliverTalkTips( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, "秘钻黄金藏宝图任务挖掘座标不对，您白忙活一场", 8, 2)
            return 0
        end
 				local level = GetLevel(varMap, varPlayer)
 				local varmin = 1 
 				local varmax = 1
 				local buff 	=	9011
 				local buff1 =	9013
 				local buff2 =	9012
 				local item = nil
 				local varprobability = random (1, 100000)
 					for i, iter in x300344_var_ItemBonus do
        		varmax = varmax + iter.probability
        		if varprobability >= varmin and varprobability < varmax then
        		    item = iter
        		    break
        		end
   		  	end
   		  	if item ~= nil then 
   		    	StartItemTask( varMap)
   		  		if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then	        			
	        		ItemAppendBind( varMap, item.varId, item.varNum)
          	else
          	  ItemAppendBind( varMap, item.varId, item.varNum)
    				end
          	local result = StopItemTask( varMap, varPlayer)
          	if result == 0 then
      				StartTalkTask( varMap)
      				TalkAppendString( varMap, "背包已满，无法放入挖到的物品！" )
      				StopTalkTask( varMap)
      				DeliverTalkTips( varMap, varPlayer)
        		 	DelQuest( varMap, varPlayer, x300344_var_QuestId)
         			return 1
      	  	end
      			StartTalkTask( varMap)
      			local strTemp = format( "在秘钻黄金藏宝图的指引下，您得到了#R%d个#{_ITEM%d}#cffcf00，恭喜恭喜。", item.varNum,item.varId)
      			TalkAppendString( varMap, strTemp )
          	DeliverItemListSendToPlayer( varMap, varPlayer)
      			StopTalkTask( varMap)
      			DeliverTalkTips( varMap, varPlayer)
      			Msg2Player( varMap, varPlayer, strTemp, 8, 3)	
          	Msg2Player( varMap, varPlayer, strTemp, 8, 2)	
          		for i,j in x300344_var_notifytable do
          			if item.varId == j then
          				local varName = GetName( varMap, varPlayer)
          				local msg1 = format("#cffcf00恭喜恭喜！玩家"..varName.."使用秘钻黄金藏宝图寻宝时获得了#R%d个#{_ITEM%d}#cffcf00#cffcf00，真是好运气啊！",item.varNum,item.varId)
          				LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
									LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1) 
								end
							end
--          elseif varprobability >= 91571 and varprobability <= 91900 then   
--          	i = random( 1, getn( x300344_var_Bosstable) )
--          	local item = x300344_var_Bosstable
--          	local varX, z = GetWorldPos( varMap, varPlayer)
--          	local varObj = CreateMonster( varMap, item[i].mon_ID, varX, z, item[i].ai, item[i].aiscript, -1, -1, 21, 60*60*1000, 0, "", item[i].title)
--						local varName = GetName( varMap, varPlayer)
--						local sceneName = GetSceneInfo(varMap,"NAME")
--						local msg1 = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用秘钻黄金藏宝图寻宝的过程惊动了沉睡的十八魔君"..item[i].title.."，现在妖兽在"..sceneName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
--					elseif varprobability >= 91901 and varprobability <= 92000 then
--						local varX, z = GetWorldPos( varMap, varPlayer)
--						local varName = GetName( varMap, varPlayer)
--						local sceneName = GetSceneInfo(varMap,"NAME")
--						local varObj = CreateMonster(  varMap, 18400, varX, z, 1, 961, -1, -1, 21, 60*60*1000, 0, "", "魔君幻像")
--						local msg1 = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用秘钻黄金藏宝图寻宝的过程惊动了恐怖的暗·海都大王，现在恐怖的暗·海都大王在"..sceneName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
--					elseif varprobability >= 92001 and varprobability <= 97000 then
--						local varName = GetName( varMap, varPlayer)
--						local money =200*1000
--						AddMoney( varMap, varPlayer,1, money )    
--						local varStr = format( "获得#R银卡#{_MONEY%d}#o的奖励", money)
--						local msg1 = "#cffcf00恭喜恭喜！玩家"..varName.."使用秘钻黄金藏宝图寻宝时获得了#R200两银卡#cffcf00，真是好运气啊！"
--						Msg2Player( varMap, varPlayer, varStr, 8, 2)	
--						Msg2Player( varMap, varPlayer, varStr, 8, 3)	
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
--					elseif varprobability >= 97001 and varprobability <= 99000 then
--						local varName = GetName( varMap, varPlayer)
--						local money =500*1000
--						AddMoney( varMap, varPlayer,1, money )    
--						local varStr = format( "获得#R银卡#{_MONEY%d}#o的奖励", money)
--						local msg1	 = "#cffcf00恭喜恭喜！玩家"..varName.."使用秘钻黄金藏宝图寻宝时获得了#R500两银卡#cffcf00，真是好运气啊！"
--						Msg2Player( varMap, varPlayer, varStr, 8, 2)	
--						Msg2Player( varMap, varPlayer, varStr, 8, 3)  
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
--					elseif varprobability >= 99001 and varprobability <= 100000 then 
--						local varName = GetName( varMap, varPlayer)
--						local money =1000*1000
--						AddMoney( varMap, varPlayer,1, money )  
--						local varStr = format( "获得#R银卡#{_MONEY%d}#o的奖励", money)
--						local msg1	 = "#cffcf00恭喜恭喜！玩家"..varName.."使用秘钻黄金藏宝图寻宝时获得了#R1锭银卡#cffcf00，真是好运气啊！"
--						Msg2Player( varMap, varPlayer, varStr, 8, 2)	
--						Msg2Player( varMap, varPlayer, varStr, 8, 3)
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
--						LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
					end					
 					-- 删除任务
 					DelQuest( varMap, varPlayer, x300344_var_QuestId)
 				 -- 提示任务完成
 				 Msg2Player( varMap, varPlayer, "您完成了："..x300344_var_QuestName, 8, 2)
 				 Msg2Player( varMap, varPlayer, "您完成了："..x300344_var_QuestName, 8, 3)
 				 -- 写日志
 				 GamePlayScriptLog( varMap, varPlayer, 2564)
 				 -- 消耗铁铲可用次数
 				 LuaCallNoclosure( 300331, "LogicDeplete", varMap, varPlayer)
 					      
 					  end

    return 1
end






function x300344_CallBoss( varMap, varPlayer)
    local monsters = {}
    local varCount = 1

    
    local maxLevel = 100
    if varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then
        
        maxLevel = 40
    elseif varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 then
        
        maxLevel = 60
    elseif sceneId == 5 or sceneId == 8 or sceneId == 11 or sceneId == 17 or sceneId == 20 or sceneId == 23 then
        maxLevel = 80
    end

    for varI, item in x300344_var_MonsterTable do
        if item.varLevel <= maxLevel then
            monsters[ varCount] = item
            varCount = varCount + 1
        end
    end

    
    local varI = random( 1, getn( monsters) )
    
    for varI, item in x300344_var_MonsterLive do
        if item.varMap == varMap and item.live == 1 then
            return 0
        end
    end

    
    local varX, z = GetWorldPos( varMap, varPlayer)
    local mapName = ""
    CreateMonster( varMap, monsters[ varI].bossId, varX + random( 1, 3), z + random( 1, 3), 1, -1, x300344_var_FileId, -1, 21, 30*60*1000)
    
    for varI, item in x300344_var_MonsterLive do
        if item.varMap == varMap then
            x300344_var_MonsterLive[ varI].live = 1
            mapName = item.mapName
        end
    end

    Msg2Player( varMap, varPlayer, "你一阵挖掘，却看见一道黑光从地下冒出，出现在了你的身边。", 8, 2)
    Msg2Player( varMap, varPlayer, "你一阵挖掘，却看见一道黑光从地下冒出，出现在了你的身边。", 8, 3)
    
    local varName = GetName( varMap, varPlayer)
    local broadcast = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用藏宝图寻宝的过程中不小心把妖兽给放了出来，现在妖兽在#S"..mapName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
    LuaAllScenceM2Country( varMap, broadcast, GetCurCountry( varMap, varPlayer), 0, 1)
    LuaAllScenceM2Country( varMap, broadcast, GetCurCountry( varMap, varPlayer), 4, 1)

    return 1
end




function x300344_ProcDie( varMap, varPlayer, varKiller)

    


    
    
    

    for varI, item in x300344_var_MonsterLive do
        if item.varMap == varMap then
            x300344_var_MonsterLive[ varI].live = 0
        end
    end

    x300344_var_CountryID = 0
    x300344_var_CallerId = 0    
    x300344_var_CallerName = ""

end




function x300344_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
end




function x300344_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
end




function x300344_ProcQuestObjectKilled(varMap, varPlayer, varObjData ,varObj, varQuest )
end




function x300344_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x300344_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end




function x300344_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300344_var_QuestId)
    local mapID = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET1)
    local varTalknpc = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET4)
    local varX = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET2)
    local z = GetQuestParam( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET3)
    local strMapName = ""

    if mapID == 0 then
        strMapName = "王国"
    elseif mapID == 1 then
        strMapName = "边塞"
    elseif mapID == 5 then
        strMapName = "领地·凤翔府"         
    elseif mapID == 8 then
        strMapName = "领地·阿尔金山"
    elseif mapID == 11 then
        strMapName = "领地·撒马尔罕"                      
    elseif mapID == 17 then
        strMapName = "领地·莫斯科"    
    elseif mapID == 20 then
        strMapName = "领地·匈牙利"       
    elseif mapID == 23 then
        strMapName = "领地·大马士革"    
    end

    

	StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x300344_var_QuestName,             
                                format( x300344_var_QuestTarget, varTalknpc, varX, z,strMapName,varX,z),
                                "无",                             
                                x300344_var_QuestHelp,
                                format( x300344_var_QuestInfo, varTalknpc, varX, z,strMapName,varX,z),
                                "" )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end




function x300344_ProcForceAddQuest( varMap, varPlayer, varTalknpc, varQuest)
	if( varQuest ~= x300344_var_QuestId) then
		return 0;
	end

	
	if(x300344_ProcAcceptCheck( varMap, varPlayer, -1 ) ~= 1) then
		return 0;
	end
	local varRet = AddQuest( varMap, varPlayer, x300344_var_QuestId, x300344_var_FileId, 0, 0, 0, 0)
	if(varRet == 0) then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"任务已满，任务接受失败！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
  else
        StartTalkTask( varMap)
        TalkAppendString( varMap, "您获得了任务：【个人】秘钻黄金藏宝图的秘密" )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "您获得了任务：【个人】秘钻黄金藏宝图的秘密", 8, 2)
	end

		local guo = GetCurCountry(varMap,varPlayer)
		if guo ==0 then
	    
	    local size = getn( x300344_var_QuestTargetTable0)
	    local varI = random( 1, size)
	    
	    if GetLevel( varMap, varPlayer) < 40 then
	        varI = random( 1, 100)
	    end
	
	    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET1, x300344_var_QuestTargetTable0[ varI].varMap)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET2, x300344_var_QuestTargetTable0[ varI].posX)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET3, x300344_var_QuestTargetTable0[ varI].posZ)
	    local mapid = GetCurCountry( varMap, varPlayer) * 100 + x300344_var_QuestTargetTable0[ varI].varMap + 50
	    if x300344_var_QuestTargetTable0[ varI].varMap == 2 then
	        mapid = 0
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 3 then
	        mapid = 15
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 5 then
	        mapid = 5	        
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 8 then
	        mapid = 8		      
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 11 then
	        mapid = 11	
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 17 then
	        mapid = 17	     
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 20 then
	        mapid = 20	        
	    elseif x300344_var_QuestTargetTable0[ varI].varMap == 23 then
	        mapid = 23		     
	    end
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET4, mapid)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_ISCOMPLETE, 0)
	    
	    GamePlayScriptLog( varMap, varPlayer, 2563)
	    return 1
	    
	    
	    elseif guo ==1 then
	    
	    local size = getn( x300344_var_QuestTargetTable1)
	    local varI = random( 1, size)
	    
	    if GetLevel( varMap, varPlayer) < 40 then
	        varI = random( 1, 100)
	    end
	
	    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET1, x300344_var_QuestTargetTable1[ varI].varMap)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET2, x300344_var_QuestTargetTable1[ varI].posX)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET3, x300344_var_QuestTargetTable1[ varI].posZ)
	    local mapid= GetCurCountry( varMap, varPlayer) * 100 + x300344_var_QuestTargetTable1[ varI].varMap + 50
	    if x300344_var_QuestTargetTable1[ varI].varMap == 2 then
	        mapid = 0
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 3 then
	        mapid = 15
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 5 then
	        mapid = 5	        
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 8 then
	        mapid = 8		      
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 11 then
	        mapid = 11	
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 17 then
	        mapid = 17	     
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 20 then
	        mapid = 20	        
	    elseif x300344_var_QuestTargetTable1[ varI].varMap == 23 then
	        mapid = 23		        
	    end
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET4, mapid)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_ISCOMPLETE, 0)
	    
	    GamePlayScriptLog( varMap, varPlayer, 2563)
	    return 1
	    
	    
	    elseif guo ==2 then
	    
	    local size = getn( x300344_var_QuestTargetTable2)
	    local varI = random( 1, size)
	    
	    if GetLevel( varMap, varPlayer) < 40 then
	        varI = random( 1, 100)
	    end
	
	    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET1, x300344_var_QuestTargetTable2[ varI].varMap)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET2, x300344_var_QuestTargetTable2[ varI].posX)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET3, x300344_var_QuestTargetTable2[ varI].posZ)
	    local mapid = GetCurCountry( varMap, varPlayer) * 100 + x300344_var_QuestTargetTable2[ varI].varMap + 50
	    if x300344_var_QuestTargetTable2[ varI].varMap == 2 then
	        mapid = 0
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 3 then
	        mapid = 15
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 5 then
	        mapid = 5	        
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 8 then
	        mapid = 8		      
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 11 then
	        mapid = 11	
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 17 then
	        mapid = 17	     
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 20 then
	        mapid = 20	        
	    elseif x300344_var_QuestTargetTable2[ varI].varMap == 23 then
	        mapid = 23		
	    end
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET4, mapid)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_ISCOMPLETE, 0)
	    
	    GamePlayScriptLog( varMap, varPlayer, 2563)
	    return 1
	    
	    
	    elseif guo ==3 then
	    
	    local size = getn( x300344_var_QuestTargetTable3)
	    local varI = random( 1, size)
	    
	    if GetLevel( varMap, varPlayer) < 40 then
	        varI = random( 1, 100)
	    end
	
	    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300344_var_QuestId)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET1, x300344_var_QuestTargetTable3[ varI].varMap)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET2, x300344_var_QuestTargetTable3[ varI].posX)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET3, x300344_var_QuestTargetTable3[ varI].posZ)
	    local mapid = GetCurCountry( varMap, varPlayer) * 100 + x300344_var_QuestTargetTable3[ varI].varMap + 50
	    if x300344_var_QuestTargetTable3[ varI].varMap == 2 then
	        mapid = 0
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 3 then
	        mapid = 15
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 5 then
	        mapid = 5	        
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 8 then
	        mapid = 8		      
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 11 then
	        mapid = 11	
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 17 then
	        mapid = 17	     
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 20 then
	        mapid = 20	        
	    elseif x300344_var_QuestTargetTable3[ varI].varMap == 23 then
	        mapid = 23		        
	    end
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_TARGET4, mapid)
	    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300344_MP_ISCOMPLETE, 0)
	    
	    GamePlayScriptLog( varMap, varPlayer, 2563)
	
	    return 1
	  end
	    
end




function x300344_ProcCreaterGetBonus(varMap,guid,questdata)

    local nCastGuid = NumberCastIntToUInt(guid)
    
    
    local varPlayer = -1
    local varHumanCount = GetScenePlayerCount( varMap )
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local objGUID = GetPlayerGUID(varMap, varObj )
            if objGUID == nCastGuid then
                varPlayer = varObj
                break
            end
        end
    end

    if varPlayer == -1 then
        return
    end

    
    local xp = GetLevel( varMap, varPlayer) * 500
    AddExp( varMap, varPlayer, xp)

    local strMsg = format("您放出的怪已经被消灭，因此您获得%d点经验", xp)

    local varName = GetName(varMap,varPlayer)
    LuaScenceM2Player(varMap,varPlayer,strMsg,varName,2,1)
    LuaScenceM2Player(varMap,varPlayer,strMsg,varName,3,1)

end
