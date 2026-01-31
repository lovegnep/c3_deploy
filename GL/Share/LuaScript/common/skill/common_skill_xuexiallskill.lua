
--DECLARE_QUEST_INFO_START--


x800123_var_FileId 			= 800123

x800123_var_QuestStr		="\t每次进入战场，你都可以从以下五种可以增强技能的多彩Buff中任意挑选两种在本场使用，点击下列按钮后可查看该Buff详细说明。"

x800123_var_PlayerGuid   		={}

x800123_var_SaveSkillName 	={}

x800123_var_SelBuffNum        = 10

x800123_var_BuffMix           =
{
{career 	= "武士", 
buffcount 	= 8, 
needbuff    = {{buffid =10024, 	varName = "冲锋斩", 		buffinfo = "冲锋斩冷却时间减少5秒", 									bufftime = 210, buffico = 12266670}, 
			   			{buffid = 10001,  varName = "杀无赦", 		buffinfo = "杀无赦爆击率提高15%，怒气消耗增加2", 			bufftime = 210, buffico = 12266671}, 
			   			{buffid = 10018,  varName = "扬威破阵", 	buffinfo = "扬威破阵目标移动减少50%，持续5秒", 				bufftime = 210, buffico = 12266672}, 
			   			{buffid = 10005,  varName = "战八方", 		buffinfo = "战八方伤害增加5%", 											bufftime = 210, buffico = 12266673},
			  			{buffid = 10025,  varName = "怒发冲冠", 	buffinfo = "怒发冲冠冷却时间减少60秒", 											bufftime = 210, buffico = 12266674},
			   			{buffid = 10026,  varName = "热血沸腾", 	buffinfo = "热血沸腾冷却时间减少60秒", 									bufftime = 210, buffico = 12266675},
			  			{buffid = 10008,  varName = "锐不可挡", 	buffinfo = "锐不可挡附加生命恢复30%的效果", 					bufftime = 210, buffico = 12266676},
			   			{buffid = 10010,  varName = "虽远必诛", 	buffinfo = "虽远必诛冷却时间降低60秒", 					bufftime = 210, buffico = 12266677}},
},
{career 	= "剑侠", 
buffcount 	= 10, 
needbuff    = {{buffid =10134, 	varName = "凌波微步", 	buffinfo = "淩波微步冷却减少15秒，能量消耗增加15", 						bufftime = 210, buffico = 12266678}, 
			   			{buffid = 10116,  varName = "穴打风池", 	buffinfo = "穴打风池附加闪避降低20%效果", 						bufftime = 210, buffico = 12266679}, 
			   			{buffid = 10100,  varName = "起剑诀", 		buffinfo = "起剑诀爆击率提高15%，冷却增加2秒", 				bufftime = 210, buffico = 12266680}, 
			   			{buffid = 10103,  varName = "御剑诀", 		buffinfo = "御剑诀虚弱效果增效50%", 									bufftime = 210, buffico = 12266681},
			  			{buffid = 10105,  varName = "一剑干坤", 	buffinfo = "一剑干坤命中率100%，能量消耗增加10%", 		bufftime = 210, buffico = 12266682},
			   			{buffid = 10120,  varName = "剑走偏锋", 	buffinfo = "剑走偏锋每五秒恢复生命10%效果", 					bufftime = 210, buffico = 12266683},
			  			{buffid = 10107,  varName = "七伤剑阵", 	buffinfo = "七伤剑阵持续时间延长4秒", 								bufftime = 210, buffico = 12266684},
			   			{buffid = 10113,  varName = "金蝉脱壳", 	buffinfo = "金蝉脱壳移动速度20%", 										bufftime = 210, buffico = 12266685},
			  			{buffid = 10135,  varName = "逍遥游", 		buffinfo = "逍遥游冷却时间减少60秒", 												bufftime = 210, buffico = 12266686},
			   			{buffid = 10123,  varName = "梯云纵", 		buffinfo = "梯云纵冷却时间减少45秒", 									bufftime = 210, buffico = 12266687}},
},





{career 	= "骑射",
buffcount 	= 10, 
needbuff    = {{buffid =10234, 	varName = "锋芒之歌", 	buffinfo = "锋芒之歌冷却时间减少45秒", 												bufftime = 210, buffico = 12266688}, 
			   			{buffid = 10235,  varName = "天鹰之歌", 	buffinfo = "天鹰之歌冷却时间减少100秒", 											bufftime = 210, buffico = 12266689}, 
			   			{buffid = 10236,  varName = "血羽箭", 		buffinfo = "血羽箭增加命中率30%，冷却时间增加5秒", 					bufftime = 210, buffico = 12266690}, 
			   			{buffid = 10237,  varName = "淬毒箭", 		buffinfo = "淬毒箭不消耗箭矢", 												bufftime = 210, buffico = 12266691},
			  			{buffid = 10223,  varName = "百步穿杨", 	buffinfo = "百步穿杨目标闪避减少20点，持续5秒", 			bufftime = 210, buffico = 12266692},
			   			{buffid = 10218,  varName = "万箭齐发", 	buffinfo = "万箭齐发爆击率增加25,CD增加5秒", 					bufftime = 210, buffico = 12266693},
			  			{buffid = 10238,  varName = "战神之歌", 	buffinfo = "战神之歌冷却时间减少60秒", 												bufftime = 210, buffico = 12266694},
			   			{buffid = 10209,  varName = "迷魂索", 	buffinfo = "迷魂索使用后自身增加提速50%效果，持续6秒", 	bufftime = 210, buffico = 12266695},
			  			{buffid = 10240,  varName = "夺命索", 		buffinfo = "夺命索冷却时间减少25秒", 												bufftime = 210, buffico = 12266696},
			   			{buffid = 10239,  varName = "绊马索", 		buffinfo = "绊马索冷却时间减少15秒", 												bufftime = 210, buffico = 12266697}},
},




{career 	= "火枪", 
buffcount 	= 10, 
needbuff    = {{buffid = 10336, 	varName = "狙击", 			buffinfo = "狙击暴击率增加30%，聚气时间增加1秒", 				bufftime = 210, buffico = 12266698}, 
		       		 {buffid = 10306, 	varName = "毁灭", 			buffinfo = "毁灭有10%的几率下一个技能瞬发，持续50秒，该效果10秒钟之内只能激活一次", 				bufftime = 210, buffico = 12266699}, 
		      		 {buffid = 10335, 	varName = "快速填弹", 	buffinfo = "快速填弹聚气时间减少1秒", 											bufftime = 210, buffico = 12266700}, 
		      		 {buffid = 10337, 	varName = "火线救护", 	buffinfo = "火线救护冷却时间减少30秒", 											bufftime = 210, buffico = 12266701},
		      		 {buffid = 10338, 	varName = "震荡雷", 		buffinfo = "震荡雷冷却时间减少10秒，消耗子弹增加1", 			bufftime = 210, buffico = 12266702},
			  		   {buffid = 10318, 	varName = "霰光雷", 		buffinfo = "霰光雷持续时间增加10秒", 								bufftime = 210, buffico = 12266703},
							 {buffid = 10339, 	varName = "排子炮", 		buffinfo = "排子炮爆炸伤害效果增加10倍", 									bufftime = 210, buffico = 12266704},
			   		 	 {buffid = 10319, 	varName = "地网雷", 		buffinfo = "地网雷使用时有50%的几率使自己无敌3秒", 	bufftime = 210, buffico = 12266705},
			   			 {buffid = 10340, 	varName = "连珠炮", 		buffinfo = "连珠炮持续时间增加3秒", 											bufftime = 210, buffico = 12266706},
			  			 {buffid = 10341, 	varName = "一闪", 			buffinfo = "一闪冷却时间减少45秒", 											bufftime = 210, buffico = 12266707}},
},


{career 	= "先知", 
buffcount 	= 10, 
needbuff    = {{buffid = 10434, 	varName = "天之惩戒", 		buffinfo = "天之惩戒命中率增加30%", 											bufftime = 210, buffico = 12266708}, 
			   			 {buffid = 10437,  varName = "风之惩戒", 		buffinfo = "风之惩戒增加伤害5%", 													bufftime = 210, buffico = 12266709}, 
			   			 {buffid = 10435,  varName = "火之惩戒", 		buffinfo = "火之惩戒增加暴击率25%，CD时间增加5秒", 				bufftime = 210, buffico = 12266710}, 
			   			 {buffid = 10410,  varName = "末日审判", 		buffinfo = "末日审判引导时间增加5秒", 						bufftime = 210, buffico = 12266711},
			  			 {buffid = 10414,  varName = "沉默箴言", 		buffinfo = "沉默箴言冷却时间减少1秒", 						bufftime = 210, buffico = 12266712},
			  			 {buffid = 10438,  varName = "禁锢箴言", 		buffinfo = "禁锢箴言禁锢状态持续时间增加1秒", 						bufftime = 210, buffico = 12266713},
			  			 {buffid = 10418,  varName = "玄石之盾", 		buffinfo = "玄石之盾在受到攻击时有10%的几率让攻击者受到迟缓效果，持续3秒", 				bufftime = 210, buffico = 12266714},
			  			 {buffid = 10439,  varName = "气定神闲", 		buffinfo = "气定神闲持续时间增加30秒", 										bufftime = 210, buffico = 12266715},
			  			 {buffid = 10423,  varName = "祷告之歌", 		buffinfo = "祷告之歌冷却时间减少240秒", 					bufftime = 210, buffico = 12266716},
			  			 {buffid = 10436,  varName = "幻影箴言", 		buffinfo = "幻影箴言冷却时间减少2秒", 						bufftime = 210, buffico = 12266717}},
},					 



{career 	= "萨满", 
buffcount 	= 8, 
needbuff    = {{buffid = 10501,  varName = "烈犬之舞", 		buffinfo = "烈犬之舞聚气时间减少5秒", 						bufftime = 210, buffico = 12266718}, 
			   			 {buffid = 10535,  varName = "黑鸦蛊惑", 		buffinfo = "黑鸦蛊惑冷却时间减少2秒", 										bufftime = 210, buffico = 12266719}, 
			   			 {buffid = 10526,  varName = "小巫医术", 		buffinfo = "小巫医术25%几率使目标防御增加350点，持续10秒", 				bufftime = 210, buffico = 12266720}, 
			   			 {buffid = 10534,  varName = "火凤之舞", 		buffinfo = "火凤之舞冷却时间减少4秒", 						bufftime = 210, buffico = 12266721},
			  			 {buffid = 10514,  varName = "白蟒蛊惑", 		buffinfo = "白蟒蛊惑冷却时间减少2秒", 						bufftime = 210, buffico = 12266722},
			  			 {buffid = 10528,  varName = "大巫医术", 		buffinfo = "大巫医术冷却时间减少15秒", 					bufftime = 210, buffico = 12266723},
			  			 {buffid = 10521,  varName = "巫神之舞", 		buffinfo = "巫神之舞冷却时间减少30秒", 						bufftime = 210, buffico = 12266724},
			  			 {buffid = 10536,  varName = "石神附体", 		buffinfo = "石神附体冷却时间减少30秒", 						bufftime = 210, buffico = 12266725}},
},


{career 	= "十字军", 
buffcount 	= 9, 
needbuff    = {{buffid = 10059,  varName = "光明圣盾", 		buffinfo = "光明圣盾持续时间增加10秒", 						bufftime = 210, buffico = 12266726}, 
			   			 {buffid = 10060,  varName = "光明祝福", 		buffinfo = "光明祝福冷却时间减少60秒", 						bufftime = 210, buffico = 12266727}, 
			   			 {buffid = 10061,  varName = "狂热", 				buffinfo = "狂热冷却时间减少60秒", 								bufftime = 210, buffico = 12266728}, 
			   			 {buffid = 10062,  varName = "审判", 				buffinfo = "审判命中率增加30%，怒气消耗增加2", 		bufftime = 210, buffico = 12266729},
			  			 {buffid = 10063,  varName = "裁决", 				buffinfo = "裁决伤害增加5%", 											bufftime = 210, buffico = 12266730},
			  			 {buffid = 10064,  varName = "十字军威慑", 	buffinfo = "十字军威慑冷却时间减少15秒", 					bufftime = 210, buffico = 12266731},
			  			 {buffid = 10065,  varName = "十字军冲杀", 	buffinfo = "十字军冲杀冷却时间减少5秒", 					bufftime = 210, buffico = 12266732},
			  			 {buffid = 10066,  varName = "十字军穿刺", 	buffinfo = "十字军穿刺伤害增加5%", 								bufftime = 210, buffico = 12266733},
			  			 {buffid = 10067,  varName = "十字军之怒", 	buffinfo = "十字军之怒冷却时间减少20秒", 					bufftime = 210, buffico = 12266734}},
},


{career 	= "圣火使", 
buffcount 	= 10, 
needbuff    = {{buffid = 10159,  varName = "圣火盾", 			buffinfo = "圣火盾冷却时间减少45秒", 							bufftime = 210, buffico = 12266735}, 
			   			 {buffid = 10160,  varName = "嗜血如命", 		buffinfo = "嗜血如命冷却时间减少45秒", 						bufftime = 210, buffico = 12266736}, 
			   			 {buffid = 10161,  varName = "干坤大挪移", 	buffinfo = "干坤大挪移冷却时间减少2秒", 					bufftime = 210, buffico = 12266737}, 
			   			 {buffid = 10162,  varName = "烟雾缭绕", 		buffinfo = "烟雾缭绕增加命中率50%", 							bufftime = 210, buffico = 12266738},
			  			 {buffid = 10163,  varName = "如火如荼", 		buffinfo = "如火如荼冷却时间减少45秒", 						bufftime = 210, buffico = 12266739},
			  			 {buffid = 10164,  varName = "圣火熊熊", 		buffinfo = "圣火熊熊冷却时间减少60秒", 						bufftime = 210, buffico = 12266740},
			  			 {buffid = 10165,  varName = "烈焰冲天", 		buffinfo = "烈焰冲天暴击率增加15%，能量消耗增加2", 				bufftime = 210, buffico = 12266741},
			  			 {buffid = 10166,  varName = "烽火连城", 		buffinfo = "烽火连城伤害增加5%", 									bufftime = 210, buffico = 12266742},
			  			 {buffid = 10167,  varName = "怒火燎原", 		buffinfo = "怒火燎原增加火焰伤害10倍", 										bufftime = 210, buffico = 12266743},
			  			 {buffid = 10168,  varName = "火光遍野", 		buffinfo = "火光遍野减少移动速度效果加深20%", 		bufftime = 210, buffico = 12266744}},
},


{career 	= "刺客", 
buffcount 	= 10, 
needbuff    = {{buffid = 10259,  varName = "无技可施", 		buffinfo = "无技可施冷却时间减10秒，箭支消耗增加1", 				bufftime = 210, buffico = 12266745}, 
			   			 {buffid = 10260,  varName = "销声匿迹", 		buffinfo = "销声匿迹冷却时间减30秒", 						bufftime = 210, buffico = 12266746}, 
			   			 {buffid = 10261,  varName = "寸步难行", 		buffinfo = "寸步难行冷却时间减少10秒，箭支消耗增加1", 			bufftime = 210, buffico = 12266747}, 
			   			 {buffid = 10262,  varName = "孤注一掷", 		buffinfo = "孤注一掷持续时间增加5秒", 									bufftime = 210, buffico = 12266748},
			  			 {buffid = 10263,  varName = "趁虚而入", 		buffinfo = "趁虚而入冷却时间减少10秒，箭支消耗增加1", 			bufftime = 210, buffico = 12266749},
			  			 {buffid = 10264,  varName = "身形如魅", 		buffinfo = "身形如魅持续时间增加5秒", 									bufftime = 210, buffico = 12266750},
			  			 {buffid = 10265,  varName = "瞬杀箭", 			buffinfo = "瞬杀箭增加命中率50%", 										bufftime = 210, buffico = 12266751},
			  			 {buffid = 10266,  varName = "八方箭雨", 		buffinfo = "八方箭雨爆击率增加25%，CD时间增加5秒", 			bufftime = 210, buffico = 12266752},
			  			 {buffid = 10267,  varName = "烈火夺命箭", 	buffinfo = "烈火夺命箭增加命中率30%，箭支消耗+1", 				bufftime = 210, buffico = 12266753},
			  			 {buffid = 10268,  varName = "破魔箭", 			buffinfo = "破魔箭冷却时间减60秒", 							bufftime = 210, buffico = 12266754}},

},

{career 	= "近卫军", 
buffcount 	= 10, 
needbuff    = {{buffid = 10359,  varName = "破甲", 				buffinfo = "破甲冷却时间减10秒", 								bufftime = 210, buffico = 12266755}, 
			   			 {buffid = 10360,  varName = "迷魂火", 			buffinfo = "迷魂火冷却时间减少10秒，炮弹消耗增加1", 			bufftime = 210, buffico = 12266756}, 
			   			 {buffid = 10361,  varName = "架射", 				buffinfo = "架射增加一次伤害", 									bufftime = 210, buffico = 12266757}, 
			   			 {buffid = 10362,  varName = "极速装填", 		buffinfo = "极速装填冷却时间减5秒", 						bufftime = 210, buffico = 12266758},
			  			 {buffid = 10363,  varName = "镇定自若", 		buffinfo = "镇定自若冷却时间减60秒", 						bufftime = 210, buffico = 12266759},
			  			 {buffid = 10364,  varName = "瞄准", 				buffinfo = "瞄准冷却时间减45秒", 								bufftime = 210, buffico = 12266760},
			  			 {buffid = 10365,  varName = "惊雷火", 			buffinfo = "惊雷火命中率增加50%，炮弹消耗增加1", 		  bufftime = 210, buffico = 12266761},
			  			 {buffid = 10366,  varName = "霹雳火", 			buffinfo = "霹雳火持续时间增加2秒", 									bufftime = 210, buffico = 12266762},
			  			 {buffid = 10367,  varName = "暗渡陈仓", 		buffinfo = "暗渡陈仓冷却时间减少2秒", 					bufftime = 210, buffico = 12266763},
			  			 {buffid = 10368,  varName = "轰天火", 			buffinfo = "轰天火爆击率增加25%,", 							bufftime = 210, buffico = 12266764}},
},


{career 	= "隐修士", 
buffcount 	= 10, 
needbuff    = {{buffid = 10460,  varName = "神恩祷言", 		buffinfo = "神恩祷言持续时间增加30秒", 									bufftime = 210, buffico = 12266765}, 
			   			 {buffid = 10459,  varName = "冰封诅咒", 		buffinfo = "冰封诅咒冰封状态持续时间增加1秒", 	bufftime = 210, buffico = 12266766}, 
			   			 {buffid = 10461,  varName = "青蛙诅咒", 		buffinfo = "青蛙诅咒冷却时间减少30秒", 					bufftime = 210, buffico = 12266767}, 
			   			 {buffid = 10462,  varName = "神佑", 				buffinfo = "神佑持续时间增加5秒", 							bufftime = 210, buffico = 12266768},
			  			 {buffid = 10463,  varName = "圣音祷言", 		buffinfo = "圣音祷言冷却时间减少240秒", 				bufftime = 210, buffico = 12266769},
			  			 {buffid = 10464,  varName = "惩击箴言", 		buffinfo = "惩击箴言冷却时间减少3秒", 					bufftime = 210, buffico = 12266770},
			  			 {buffid = 10465,  varName = "除魔诀", 			buffinfo = "除魔诀暴击率增加15%", 										bufftime = 210, buffico = 12266771},
			  			 {buffid = 10466,  varName = "驱魔箴言", 		buffinfo = "驱魔箴言命中率增加75%，聚气增加1秒", 				bufftime = 210, buffico = 12266772},
			  			 {buffid = 10467,  varName = "灭魔诀", 			buffinfo = "灭魔诀暴击率增加30%，CD时间增加15秒", 		bufftime = 210, buffico = 12266773},
			  			 {buffid = 10468,  varName = "天罚箴言", 		buffinfo = "天罚箴言命中率增加50%，CD时间增加15秒", 		bufftime = 210, buffico = 12266774}},

},

{career 	= "僧侣", 
buffcount 	= 10, 
needbuff    = {{buffid = 10559,  varName = "巨熊护法", 		buffinfo = "巨熊护法聚气时间减少5秒", 					bufftime = 210, buffico = 12266775}, 
			   			 {buffid = 10560,  varName = "神獒护法", 		buffinfo = "神獒护法聚气时间减少5秒", 					bufftime = 210, buffico = 12266776}, 
			   			 {buffid = 10561,  varName = "断灭咒", 			buffinfo = "断灭咒冷却时间减少2秒", 									bufftime = 210, buffico = 12266777}, 
			   			 {buffid = 10562,  varName = "梵音咒", 			buffinfo = "梵音咒冷却时间减少15秒", 									bufftime = 210, buffico = 12266778},
			  			 {buffid = 10563,  varName = "大悲咒", 			buffinfo = "大悲咒冷却时间减少15秒", 									bufftime = 210, buffico = 12266779},
			  			 {buffid = 10564,  varName = "移魂咒", 			buffinfo = "移魂咒移魂咒冷却时间减少2秒", 						bufftime = 210, buffico = 12266780},
			  			 {buffid = 10565,  varName = "金刚咒", 			buffinfo = "金刚咒冷却时间减少60秒", 									bufftime = 210, buffico = 12266781},
			  			 {buffid = 10566,  varName = "还生咒", 			buffinfo = "还生咒持续时间增加3秒", 									bufftime = 210, buffico = 12266782},
			  			 {buffid = 10567,  varName = "伏魔咒", 			buffinfo = "伏魔咒持续时间增加3秒", 									bufftime = 210, buffico = 12266783},
			  			 {buffid = 10568,  varName = "急兵咒", 			buffinfo = "急兵咒冷却时间减少30秒", 									bufftime = 210, buffico = 12266784}},
},
}



--DECLARE_QUEST_INFO_STOP--





function x800123_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local ZhiYe= GetZhiye( varMap, varPlayer)
	local varStep = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)							
	if varStep == 0 then
		x800123_RandomBuff(varMap, varPlayer)
		SetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID, 1)
	elseif varStep == 1 and x800123_var_SaveSkillName[GetGUID(varMap, varPlayer)] ~= nil then
		for varI, item in x800123_var_SaveSkillName[GetGUID(varMap, varPlayer)] do
			if	item.varName ~= nil and item.bufid ~= nil then
				TalkAppendButton(varMap, x800123_var_FileId, item.varName, 3, item.bufid)
			end
		end		
	end
end



function x800123_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest ,idSkill )	
	local ZhiYe = GetZhiye( varMap, varPlayer)	
	for varI, item in x800123_var_BuffMix[ZhiYe + 1].needbuff do							
		if item.buffid == idSkill then 				
			x800123_var_PlayerGuid[GetGUID(varMap, varPlayer)] = idSkill
			local stime	= mod(item.bufftime,60)
			local mtime	= floor(item.bufftime / 60)
			StartTalkTask(varMap)	
			TalkAppendString(varMap,"#Y".."【"..x800123_var_BuffMix[ZhiYe + 1].career.."】"..item.varName)
			TalkAppendString(varMap, "\n Buff效果: "..item.buffinfo)
			TalkAppendString(varMap, "\n Buff时间: "..mtime.."分"..stime.."秒")
			AddQuestItemBonus(varMap, item.buffico, 1)			
			StopTalkTask()	
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800123_var_FileId, -1)
		break			
		end
	end	
end



function x800123_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local ZhiYe = GetZhiye( varMap, varPlayer)
	local pressnum = 1
	for varI, item in x800123_var_BuffMix[ZhiYe + 1].needbuff do									
		if item.buffid == x800123_var_PlayerGuid[GetGUID(varMap, varPlayer)] then													
 			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x800123_var_PlayerGuid[GetGUID(varMap, varPlayer)], 0)		
 			Msg2Player(varMap, varPlayer, format("您获得了BUFF#R【%s】", item.varName), 8, 3)
 			Msg2Player(varMap, varPlayer, format("您获得了BUFF#R【%s】", item.varName), 8, 2)
 			break
 		end
 	end
	StartTalkTask(varMap)
	TalkAppendString(varMap,x800123_var_QuestStr)							
	for a, b in x800123_var_SaveSkillName[GetGUID(varMap, varPlayer)] do											
		if b.bufid == x800123_var_PlayerGuid[GetGUID(varMap, varPlayer)]  then											
			b.varName = nil
			b.bufid = nil	
		elseif b.varName == nil and b.bufid == nil then																
			pressnum = pressnum + 1				
		elseif b.varName ~= nil and b.bufid ~= nil then
			TalkAppendButton(varMap, x800123_var_FileId, b.varName, 3, b.bufid)						
		end
	end
 	WriteLog(1, format("AddBuffToPlayer varMap=%d PlayerGUID=%u AddBuff=%d pressnum=%d", varMap, GetGUID(varMap, varPlayer), x800123_var_PlayerGuid[GetGUID(varMap, varPlayer)], pressnum))
	if pressnum > 1 then																							
		for c, d in x800123_var_SaveSkillName[GetGUID(varMap, varPlayer)] do
			d.varName = nil
			d.bufid = nil
		end					
		return
	end								
	StopTalkTask()	
	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x800123_var_FileId, -1)
end



function x800123_RandomBuff(varMap, varPlayer)																
	local varStep = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	local ZhiYe= GetZhiye( varMap, varPlayer)
	local varX = {}
	if varStep == 0 then																
		for varI = 1, x800123_var_SelBuffNum do																	
		local varNum1 = random(1, x800123_var_BuffMix[ZhiYe + 1].buffcount)	
		local varNum2 = random(1, x800123_var_BuffMix[ZhiYe + 1].buffcount)
			if varNum1 ~= varNum2 then
				local t = x800123_var_BuffMix[ZhiYe + 1].needbuff[varNum2]
				x800123_var_BuffMix[ZhiYe + 1].needbuff[varNum2] = x800123_var_BuffMix[ZhiYe + 1].needbuff[varNum1]
				x800123_var_BuffMix[ZhiYe + 1].needbuff[varNum1] = t
			end
		end	
		for j = 1, 5 do		
			varX[j] = {varName = x800123_var_BuffMix[ZhiYe + 1].needbuff[j].varName, bufid = x800123_var_BuffMix[ZhiYe + 1].needbuff[j].buffid}			
		end
		x800123_var_SaveSkillName[GetGUID(varMap, varPlayer)] = varX	
		for varI, item in x800123_var_SaveSkillName[GetGUID(varMap, varPlayer)] do
			TalkAppendButton(varMap, x800123_var_FileId, item.varName, 3, item.bufid)
		end		
	end	
end



function x800123_RecycleAllBuff(varMap, varPlayer)                                          
	local ZhiYe= GetZhiye( varMap, varPlayer)
	for varI, item in x800123_var_BuffMix[ZhiYe + 1].needbuff do
		DispelSpecificImpact(varMap, varPlayer, item.buffid, 1)
	end
end
