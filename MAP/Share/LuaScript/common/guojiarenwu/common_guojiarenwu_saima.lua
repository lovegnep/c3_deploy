

--DECLARE_QUEST_INFO_START--
x430601_var_FileId = 430601
x430601_var_QuestIdPre =-1
x430601_var_QuestId = 10284
x430601_var_LevelLess	= 	40 
x430601_var_QuestIdNext = -1
x430601_var_Name	={}
x430601_var_ExtTarget={{type=20,n=1,target="    达到每个那达慕明珠后最终抵达卡迪兹港的终点"}}
x430601_var_QuestName="【个人】那达慕赛马大会"
x430601_var_QuestInfo="\t陛下重启那达慕大会，是你大显身手的时候了，这可是千载难逢的机会！\n\t沈家的人从贵族名媛和百姓中选出了五名马赛明珠，都是水灵灵的大姑娘，届时她们会站在沿途，你要做的就是#G按顺序从她们那里取得勇士之花#W。哈哈，姑娘怀春，就喜欢英雄，鲜花献上，是不是很带感呢？"  
x430601_var_QuestTarget=""		
x430601_var_QuestCompleted="\t勇士，经过重重阻碍你可终于抵达终点了，不愧是大汗看中的人啊！"					
x430601_var_ContinueInfo="\t一定不能中途放弃呀！"
x430601_var_QuestHelp =	"    在适当时机选择适当道具会有奇效，赛马时间结束后任务道具会自动删除"
x430601_var_DemandItem ={}
x430601_var_ExpBonus = 31500
x430601_var_BonusMoney1 =20000
x430601_var_BonusMoney2 =0
x430601_var_BonusMoney3 =0
x430601_var_BonusMoney4 =0
x430601_var_BonusMoney5 =0
x430601_var_BonusMoney6 =0
x430601_var_BonusMoney18 = 50
x430601_var_BonusItem	=	{}
x430601_var_BonusChoiceItem ={}
x430601_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x430601_var_StartNPC = 405900
x430601_var_FinishNPC = 405924
x430601_var_setFinishNPC = 405905
x430601_var_Npchelpinfo = {
	"勇士，冲吧！",
	"地上的箭头会告诉你前方的路在何方！",
	"永远不要以为最近是最快的路线！",
	"组合使用某些技能会有奇效！",
	"箱子里可不都是好东西",
}

x430601_var_NpcGUID ={
{ guid = 405901, varName = "那达慕明珠[一号]",varIndex =10,first=0},
{ guid = 405902, varName = "那达慕明珠[二号]",varIndex =11,first=0},
{ guid = 405903, varName = "那达慕明珠[三号]",varIndex =12,first=0},
{ guid = 405904, varName = "那达慕明珠[四号]",varIndex =13,first=0},
{ guid = 405905, varName = "那达慕明珠[五号]",varIndex =14,first=0},
--{ guid = 405906, varName = "那达慕明珠[六号]",varIndex =15,first=0}, 
--{ guid = 405907, varName = "那达慕明珠[七号]",varIndex =16,first=0}, 
--{ guid = 405908, varName = "那达慕明珠[八号]",varIndex =17,first=0}, 
--{ guid = 405909, varName = "那达慕明珠[九号]",varIndex =18,first=0}, 
--{ guid = 405910, varName = "那达慕明珠[十号]",varIndex =19,first=0}, 
--{ guid = 405911, varName = "那达慕明珠[十一号]",varIndex =20,first=0}, 
--{ guid = 405912, varName = "那达慕明珠[十二号]",varIndex =21,first=0}, 
--{ guid = 405913, varName = "那达慕明珠[十三号]",varIndex =22,first=0}, 
--{ guid = 405914, varName = "那达慕明珠[十四号]",varIndex =23,first=0}, 
--{ guid = 405915, varName = "那达慕明珠[十五号]",varIndex =24,first=0}, 
--{ guid = 405916, varName = "那达慕明珠[十六号]",varIndex =25,first=0}, 
--{ guid = 405917, varName = "那达慕明珠[十七号]",varIndex =26,first=0}, 
--{ guid = 405918, varName = "那达慕明珠[十八号]",varIndex =27,first=0}, 
--{ guid = 405919, varName = "那达慕明珠[十九号]",varIndex =28,first=0}, 
--{ guid = 405920, varName = "那达慕明珠[二十号]",varIndex =29,first=0}, 
--{ guid = 405921, varName = "那达慕明珠[二十一号]",varIndex =30,first=0}, 
--{ guid = 405922, varName = "那达慕明珠[二十二号]",varIndex =31,first=0}, 
--{ guid = 405923, varName = "那达慕明珠[二十三号]",varIndex =32,first=0}, 
{ guid = 405924, varName = "赛马终点",varIndex =-1}, 
                            
}

--关卡技能
x430601_guanjiaskill = {
	16351,16352,16353,16354,16355,16356,16357,16358,16359,16360,16361,16362,16363,
}


--创建箱子1特效
x430601_xianjing_MonsterInfo = {
	{ id = 58115, baseAI = 3, highAI =-1, campId = 20, liveTime = 30 *60* 1000, name = "   ", title = "", dir = 0 }, 											
}
x430601_xianjing_MonsterPos = {
	[37]={
		{x=119.289734,y=134.814636,buff=32610,},
		{x=119.48307 ,y=140.311493,buff=32610,},
		{x=119.514519,y=137.640915,buff=32610,},
		{x=75.786819 ,y=139.623398,buff=32610,},
		{x=75.656403 ,y=134.59079 ,buff=32610,},
		{x=75.902054 ,y=137.067795,buff=32610,},
		{x=179.685486,y=155.304474,buff=32610,},
		{x=184.827087,y=150.044388,buff=32610,},
		{x=182.423157,y=152.998703,buff=32610,},
		{x=213.298996,y=191.505005,buff=32610,},
		{x=209.302689,y=194.325775,buff=32610,},
		{x=211.526535,y=193.090805,buff=32610,},
	},
	[44]={
		{x=52.232498 ,y=99.040428 ,buff=32610,},
		{x=59.164764 ,y=99.088402 ,buff=32610,},
		{x=55.80785  ,y=99.054276 ,buff=32610,},
		{x=76.471931 ,y=168.508942,buff=32610,},
		{x=81.019768 ,y=165.11026 ,buff=32610,},
		{x=78.78994  ,y=166.908997,buff=32610,},
		{x=155.662994,y=220.621704,buff=32610,},
		{x=155.922775,y=223.496201,buff=32610,},
		{x=156.322098,y=226.370255,buff=32610,},
		{x=244.447937,y=203.721329,buff=32610,}, 
		{x=242.775208,y=198.204147,buff=32610,}, 
		{x=243.644928,y=200.920837,buff=32610,}, 
		{x=311.225464,y=207.896393,buff=32610,}, 
		{x=315.326508,y=203.584488,buff=32610,}, 
		{x=313.362305,y=205.946533,buff=32610,}, 
		{x=367.153229,y=254.27211 ,buff=32610,}, 
		{x=362.576904,y=258.851624,buff=32610,}, 
		{x=364.897552,y=256.694977,buff=32610,}, 
		{x=408.919739,y=351.146332,buff=32610,}, 
		{x=412.274628,y=351.044678,buff=32610,}, 
		{x=410.701538,y=400.184753,buff=32610,}, 
		{x=413.292023,y=400.116852,buff=32610,}, 
		{x=425.501862,y=431.102142,buff=32610,}, 
		{x=431.863586,y=427.853851,buff=32610,}, 
		{x=428.420624,y=429.691803,buff=32610,}, 
		},          
	[569] ={      
		{x=157.489014,y=232.083176,buff=32610,},
		{x=152.441635,y=234.507446,buff=32610,},
		{x=154.935287,y=233.173325,buff=32610,},
		{x=114.179718,y=181.756683,buff=32610,},
		{x=109.208076,y=180.583679,buff=32610,},
		{x=111.703201,y=180.841049,buff=32610,},
		{x=151.297531,y=103.615257,buff=32610,},
		{x=150.305923,y=101.541039,buff=32610,},
		{x=225.965256,y=72.56707  ,buff=32610,},
		{x=225.621002,y=69.835762 ,buff=32610,},
		{x=303.519043,y=85.93969  ,buff=32610,},
		{x=304.262726,y=81.170921 ,buff=32610,},
		{x=303.959869,y=83.517715 ,buff=32610,},
		{x=356.429901,y=152.055954,buff=32610,},
		{x=358.969055,y=152.068909,buff=32610,},
		{x=338.735504,y=214.34433 ,buff=32610,},
		{x=333.500092,y=215.613495,buff=32610,},
		{x=336.262726,y=215.312943,buff=32610,},
		{x=347.890839,y=280.280609,buff=32610,},
		{x=351.551514,y=278.992126,buff=32610,},
		},
}


--创建小箭头
x430601_g_smalljiantou = {
	{ id = 58118, baseAI = 3, highAI = -1, campId = 20, liveTime = 30 *60* 1000, name = " ", title = " ", dir = 0 }, 											
}
x430601_g_smalljiantouPos = {
	[37] = {
		{x =53.301991 ,y =134.147873,dir =90 },
		{x =56.718884 ,y =134.003571,dir =90 },
		{x =59.831512 ,y =133.982239,dir =90 },
		{x =53.265759 ,y =139.724319,dir =90 },
		{x =56.607174 ,y =139.80835 ,dir =90 },
		{x =59.948223 ,y =139.75354 ,dir =90 },
		{x =197.953613,y =167.704788,dir =390},
		{x =200.286865,y =170.966125,dir =390},
		{x =202.475189,y =174.127441,dir =390},
		{x =192.562225,y =171.408951,dir =390},
		{x =194.966125,y =174.910172,dir =390},
		{x =197.137344,y =177.986526,dir =390},
	},                                     
	[44] = {
		{x =39.87748  ,y =63.061523 ,dir =400},
		{x =61.394161 ,y =134.83168 ,dir =380},
		{x =62.730412 ,y =137.582047,dir =380},
		{x =63.995819 ,y =140.784485,dir =380},
		{x =118.654388,y =204.268677,dir =410},
		{x =121.350136,y =206.674164,dir =410},
		{x =56.409298 ,y =144.149536,dir =390},
		{x =54.975761 ,y =141.296814,dir =390},
		{x =53.616581 ,y =138.62851 ,dir =390},
		{x =116.449196,y =213.132675,dir =420},
		{x =113.496231,y =210.975571,dir =420},
		{x =286.925995,y =183.159195,dir =420},
		{x =289.44696 ,y =185.112381,dir =410},
		{x =284.032227,y =181.940826,dir =430},		
		{x =335.004456,y =223.075104,dir =410},
		{x =337.160431,y =225.027588,dir =410},
		{x =332.125336,y =230.405136,dir =410},
		{x =330.032867,y =228.490494,dir =410},
		{x =327.826599,y =226.39389 ,dir =410},
		{x =332.95932 ,y =221.24173 ,dir =410},
		{x =410.801636,y =316.226135,dir =360},
		{x =411.042999,y =327.892487,dir =360},
		{x =410.965454,y =321.707062,dir =360},		
	},
	[569] = {
		{x =126       ,y =211       ,dir =230},
		{x =183.167053,y =88.684669 ,dir =110},
		{x =133.614105,y =111.742996,dir =120},
		{x =130.026093,y =115.040421,dir =130},
		{x =127.402275,y =118.574265,dir =150},
		{x =257.640015,y =70.075203 ,dir =450},
		{x =325.358002,y =89.634727 ,dir =430},
		{x =368.804047,y =103.988113,dir =400},
		{x =371.237457,y =107.769226,dir =370},
		{x =370.911682,y =112.264893,dir =350},
		{x =351.821655,y =182.112213,dir =330},
		{x =343.970154,y =253.085266,dir =370},
		{x =349.578125,y =307.155365,dir =350},
		{x =347.875641,y =312.507446,dir =340},
		{x =344.727142,y =316.790558,dir =320},
		{x =156.154739,y =262.269592,dir =190},
	},                                    
}

--创建大箭头
x430601_g_bigjiantou = {
	{ id = 58114, baseAI = 3, highAI = -1, campId = 20, liveTime = 30 *60* 1000, name = " ", title = " ", dir = 0 }, 											
}
x430601_g_bigjiantouPos = {
	[37] = {
		{x =227.136871,y =220.913864,dir =410},
		{x =139.789581,y =142.124298,dir =440},

	},    
	[44] = {
		{x =411.416901,y =388.680725,dir =360},
		{x =434.448456,y =449.534302,dir =360},
	},
	[569] = {

	},                                    
}
----区域触发buff
--x430601_var_singleBuff = {
--	{id=32598,tip = "#Y一个陷阱！你意外的获得了快马扬鞭的效果",},
--	{id=32602,tip = "#R一个陷阱！你的膝盖中了一箭，移动速度受到很大限制",},
--	{id=32603,tip = "#Y一个陷阱！你消失在了敌人的视野中",},
--}
--x430601_var_groupBuff = {
--	{id=32599,tip = "#Y一个陷阱！你获得了全军突击的效果，周围所有玩家移动速度提升",},
--	{id=32600,tip = "#R一个陷阱！遭到绊马绳套，被定身在原地",},
--	{id=32601,tip = "#R一个陷阱！泥潭出现了，周围所有玩家行动均受到阻碍",},
--}
----npc触发buff
--x430601_var_npcdeBuff = {
--	{id=32605,tip = "#R绊马绳套！周围所有玩家被定身在原地",},
--	{id=32604,tip = "#R泥潭！周围所有玩家行动均受到阻碍",},
--}
--x430601_var_npcBuff = {
--	{id=32599,tip = "#Y你获得了全军突击的效果，周围所有玩家移动速度提升",},
--}
--赛马状态记录
x430601_MP_SAIMASTAE = 2
--赛马拉人提示记录
x430601_MP_SAIMALAREN = 3  
--陷阱触发time计数
x430601_var_time = -1
x430601_var_npctime = {}
x430601_var_xianhuatime = -1
--赛马旗帜obj
x430601_var_qizhiOBJ = 405990
--赛马名次
x430601_var_mingci = {}
--DECLARE_QUEST_INFO_STOP--


function x430601_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

--	local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) 
--	if MinLevel <75 then
--		return
--	end
	if GetGameOpenById(1099) < 1 then
		Msg2Player(varMap, varPlayer, "那达慕赛马大会暂时关闭", 0, 3)
		return
	end

	if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x430601_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x430601_var_QuestId, varState, -1 )
	end
end

function x430601_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		local level =GetLevel(varMap, varPlayer)
		x430601_var_ExpBonus = 31500*level
		if x430601_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x430601_var_ExpBonus )
		end
		if x430601_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x430601_var_BonusMoney1 )
		end
		if x430601_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x430601_var_BonusMoney2 )
		end
		if x430601_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x430601_var_BonusMoney3 )
		end
		if x430601_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x430601_var_BonusMoney4 )
		end
		if x430601_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x430601_var_BonusMoney5 )
		end
		if x430601_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x430601_var_BonusMoney6 )
		end
		if x430601_var_BonusMoney18 > 0 and GetLevel(varMap,varPlayer) >= 75 then
			AddQuestMoneyBonusHorseMoney(varMap, x430601_var_BonusMoney18 )
		end
		for varI, item in x430601_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x430601_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x430601_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varEx)	

	local minute = GetMinOfDay()
	
	if minute <19*60+30  then
		x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "那达慕赛马大会还在准备阶段，将在19：30正式开始", 0, 3)
		return
	end
	if minute >20*60  then
		x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "那达慕赛马大会已经结束，请明天19：30再来", 0, 3)
		return
	end
				
	if IsQuestHaveDone(varMap, varPlayer, x430601_var_QuestId) > 0 then
		Msg2Player(varMap, varPlayer, "你经过不懈努力，破除重重障碍，完成赛马全程！", 0, 3)
		return 
	end
	
	local talkobj =GetMonsterGUID(varMap, varTalknpc)

	if talkobj == x430601_var_qizhiOBJ then

		if x430601_var_npctime[varTalknpc] == nil then
		x430601_var_npctime[varTalknpc] = -1
		end
		if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) < 0 then
			return
		end
	
		if GetLevel(varMap, varPlayer) < x430601_var_LevelLess then
			return
		end
	
		if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) <= 0 then return end
		 --5秒内陷阱不会重复触发
		if GetCurrentTime() - x430601_var_npctime[varTalknpc] <5 then
			Msg2Player(varMap, varPlayer, "冷却中，暂时无法触发效果", 0, 3)
			return 
		else
			x430601_var_npctime[varTalknpc] = -1
		end
		--触发概率
		local probability = random(1,100)
		local buffcount = 0
		--随机buff
		local buffindex = 0
		local buffid = -1
		
		if probability <20 then		
			
		elseif probability >20 and probability<60 then --个人增益

			buffcount = getn(x430601_var_npcdeBuff)
			buffindex = random(1,buffcount)
			buffid = x430601_var_npcdeBuff[buffindex].id
			local varX,z = GetWorldPos(varMap,varPlayer)
			local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,15)  
			Msg2Player(varMap, varPlayer, "一个陷阱！周围玩家都受到了陷阱的影响！", 0, 3)
			for varI = 0, Num-1 do
				local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
				if humanObjId ~= -1 and humanObjId~=varPlayer then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffid, 0)
						StartTalkTask(varMap);
						TalkAppendString(varMap,x430601_var_npcdeBuff[buffindex].tip );
						StopTalkTask();
						DeliverTalkTips(varMap, humanObjId);
					end
				end
			end
		elseif probability >60 and probability<100 then --群体debuff

			buffcount = getn(x430601_var_npcBuff)
			buffindex = random(1,buffcount)
			buffid = x430601_var_npcBuff[buffindex].id
			local varX,z = GetWorldPos(varMap,varPlayer)
			local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,20)  
			for varI = 0, Num-1 do
				local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
				if humanObjId ~= -1 then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffid, 0)
						StartTalkTask(varMap);
						TalkAppendString(varMap,x430601_var_npcBuff[buffindex].tip );
						StopTalkTask();
						DeliverTalkTips(varMap, humanObjId);
					end
				end
			end
		end
		--记录陷阱触发时间
		if x430601_var_npctime[varTalknpc] == -1 then
			x430601_var_npctime[varTalknpc] = GetCurrentTime()
		end
		
	end

	if GetLevel(varMap, varPlayer) < x430601_var_LevelLess then
		Msg2Player(varMap, varPlayer, "您的等级不足"..x430601_var_LevelLess.."，无法接受此任务", 0, 3)
		return
	end
	
	if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) > 0 then
		 if x430601_var_qizhiOBJ~=varTalknpc then
			 local temp = random(1,100)
			 local tempinfo = random(1,getn(x430601_var_Npchelpinfo))
		 	 if temp > 50 then
		 	 	NpcTalk(varMap,varTalknpc , x430601_var_Npchelpinfo[tempinfo], -1)
		 	 end
	 	 end
		if varEx == -1 then
			if x430601_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x430601_var_QuestName)
				TalkAppendString(varMap,x430601_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x430601_var_FileId, x430601_var_QuestId);

			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x430601_var_QuestName)
				TalkAppendString(varMap,x430601_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x430601_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x430601_var_FileId, x430601_var_QuestId);
			end
		end

		for varI ,item in x430601_var_NpcGUID do

		 	if item.varIndex == varEx and varEx ~= -1 then
		 		 local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x430601_var_QuestId)
		 		 local saimaState = GetQuestParam( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMASTAE)
				
		 		 if saimaState < varI-1 then
			 		 StartTalkTask(varMap)
					 TalkAppendString(varMap,"#Y"..x430601_var_QuestName)
					 TalkAppendString(varMap,"\t你还未在#R"..x430601_var_NpcGUID[saimaState+1].varName.."#W领取鲜花，请先前往#R"..x430601_var_NpcGUID[saimaState+1].varName.."#W领取鲜花后再前往下一个记录点！")
					 TalkAppendString(varMap," ")
					 x430601_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
					 StopTalkTask()
				 	 DeliverTalkMenu(varMap, varPlayer, varTalknpc, x430601_var_FileId, x430601_var_QuestId);
				 	 npcchuansong(varMap, varPlayer)
				 elseif saimaState >= varI then

				 	 StartTalkTask(varMap)
					 TalkAppendString(varMap,"#Y"..x430601_var_QuestName)
					 TalkAppendString(varMap,"\t你已经在"..item.varName.."领取鲜花了，去下一个那达慕明珠那吧！")
					 TalkAppendString(varMap," ")
					 x430601_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
					 StopTalkTask()
				 	 DeliverTalkMenu(varMap, varPlayer, varTalknpc, x430601_var_FileId, x430601_var_QuestId);
				 	 if IsHaveSpecificImpact( varMap, varPlayer, 32584) ~= 1 then
				 	 SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32584, 0)
				 	 RestoreHp(varMap, varPlayer,0)
				 	 end
				 	 
				 elseif saimaState == varI-1  then
				 	 StartTalkTask(varMap)
					 TalkAppendString(varMap,"#Y"..x430601_var_QuestName)
					 TalkAppendString(varMap,"\t拿上一朵鲜花，继续出发吧，马赛第一勇士的桂冠在等着你！")
					 TalkAppendString(varMap," ")
					 x430601_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
					 StopTalkTask()
				 	 DeliverTalkMenu(varMap, varPlayer, varTalknpc, x430601_var_FileId, x430601_var_QuestId);
				 	 SetQuestByIndex( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMASTAE, varI)	
				 	 if IsHaveSpecificImpact( varMap, varPlayer, 32584) ~= 1 then
				 	 SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32584, 0)
				 	 RestoreHp(varMap, varPlayer,0)
				 	 end
				 	 if GetCurrentTime() - x430601_var_xianhuatime >= 3 then
				 	 	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8331, 0)
						x430601_var_xianhuatime = GetCurrentTime()
					 end
--					 if item.first ==0 then
--					 	local name =GetName(varMap, varPlayer)
--					 	local country = GetCurCountry(varMap,varPlayer)
--					 	local countrytext = ""
--					 	if country == 0 then
--					 	countrytext = "楼兰"
--					 	elseif country == 1 then
--					 	countrytext = "天山"
--					 	elseif country == 2 then
--					 	countrytext = "昆仑"
--					 	elseif country == 3 then
--					 	countrytext = "敦煌"
--					 	end
--					 	LuaAllScenceM2Wrold( varMap, "#R"..countrytext.."#cffcf00"..name.."已经率先抵达"..item.varName, 5, 1 )
--					 end
				 	 x430601_zhongzhuanexp(varMap, varPlayer)	 	 
				 end
		 	end
		 	
		end
  elseif x430601_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x430601_var_QuestName)
			TalkAppendString(varMap,x430601_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x430601_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x430601_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x430601_var_QuestHelp )
			end
			x430601_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x430601_var_FileId, x430601_var_QuestId);
    else
			--Msg2Player(varMap, varPlayer, "您现在的状态无法接受此任务！", 0, 3)
    end
	x430601_ProcQuestLogRefresh( varMap,varPlayer,x430601_var_QuestId)
end


function x430601_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		local count = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT)
		local saimadate = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE)
		if saimadate == GetDayOfYear() then
			if count == 1 then
				Msg2Player(varMap, varPlayer, "你今天已经进行过赛马了，请明天再来", 0, 3)
				return 0
			end
		end
		
		return 1

end

function x430601_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x430601_var_QuestId)
	return GetQuestParam(varMap,varPlayer,varQuestIdx,0)

end

function x430601_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


		if IsQuestHaveDone(varMap, varPlayer, x430601_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		if IsHaveSpecificImpact( varMap, varPlayer, 7606) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7612) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7618) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7624) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7609) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7615) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7621) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7627) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1  then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法参加赛马！",8,2)
			return
		end
--		local today = GetDayOfYear()
--  		local count = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT)
--  		if today == x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE) then
--  			
--  		end
	

		if x430601_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				local a = AddQuest( varMap, varPlayer, x430601_var_QuestId, x430601_var_FileId, 0, 1, 0,1)-- 给玩家添加任务	
				if a > 0 then
					if IsPlayerStateNormal(varMap, varPlayer) > 0 then
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32584, 0)
						RestoreHp(varMap, varPlayer,0)
						StartTalkTask(varMap);
						TalkAppendString(varMap,"获得赛马英雄效果，血量极大提升");
						StopTalkTask();
						DeliverTalkTips(varMap, varPlayer);
					end
					local today = GetDayOfYear()
					x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE,today)
					x430601_ProcQuestLogRefresh( varMap,varPlayer,x430601_var_QuestId)
					
					GamePlayScriptLog(varMap, varPlayer, 993)
					
				else
					Msg2Player(varMap, varPlayer, "任务暂时无法接受！", 0, 3)
				end
		else
				--Msg2Player(varMap, varPlayer, "您现在的状态无法接受此任务！", 0, 3)
	 	end                                                                    
		x430601_ProcQuestLogRefresh( varMap,varPlayer,x430601_var_QuestId)    
		x430601_OpenGuanqiaUI(varMap,varPlayer)
end


function x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) <= 0 then
				return 
		end
		local a=DelQuest(varMap, varPlayer, x430601_var_QuestId)

		if a>0 then
			if IsHaveSpecificImpact( varMap, varPlayer, 32584 ) > 0 then
				CancelSpecificImpact(varMap, varPlayer,32584)
			end
			local today = GetDayOfYear()
    		local count = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT)
    		if today == x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE) then
    			if count ~= 1 then
    				x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT,1)
    			end
    		else
    			x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE,today)
    			x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT,1)
    		end
    		
    		
    		local itemtable = {
	    		12271000,									
	    		12271001,									
	    		12271002,									
	    		12271003,									
	    		12271004,															
	    	}							
	    	
	    	for v,k in itemtable do
				local ItemCnt = GetItemCountInBag( varMap, varPlayer, k )
				if ( ItemCnt > 0 ) then
					DelItem( varMap, varPlayer, k, ItemCnt )
				end
			end
			x430601_CloseGuanqiaUI( varMap, varPlayer )
		end
	  	x430601_Msg2toplayer( varMap, varPlayer,1)
			
end

function x430601_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x430601_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x430601_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppend( varMap, item.item, item.n )
            break
        end
  end
  local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        if result == 1 then
            result = 0
        end
    end
	return result
end

function x430601_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x430601_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x430601_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x430601_var_QuestId) > 0 then
				x430601_CloseGuanqiaUI( varMap, varPlayer )
				x430601_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x430601_var_QuestId)
				x430601_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x430601_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x430601_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    			end
    		StopItemTask(varMap,varPlayer)
    		local today = GetDayOfYear()
    		local count = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT)
    		if today == x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE) then
    			if count ~= 1 then
    				x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT,1)
    			end
    		else
    			x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT,1)
    		end
    		
    		if IsHaveSpecificImpact( varMap, varPlayer, 32584 ) > 0 then
				CancelSpecificImpact(varMap, varPlayer,32584)
			end
			local itemtable = {
	    		12271000,									
	    		12271001,									
	    		12271002,									
	    		12271003,									
	    		12271004,									
	    	}							
	    	
	    	for v,k in itemtable do
				local ItemCnt = GetItemCountInBag( varMap, varPlayer, k )
				if ( ItemCnt > 0 ) then
					DelItem( varMap, varPlayer, k, ItemCnt )
				end
			end
			--赛马交任务显示
			x430601_yingjiewushi(varMap, varPlayer)
			
			--赛马排行榜添加
			local hour,minute,second = GetHourMinSec()
			local val = 0;
			val = val + (hour-19)*3600
			val = val + (minute-30)*60
			val = val + second
			if val >0 then
			SendToplistKeyValue2GL(varMap,varPlayer,SAIMA_TOP_LIST,val)
			end
			--赛马log
			GamePlayScriptLog(varMap, varPlayer, 994)
		    	--5/1000添加马装
		    	local ran =random(1000)
		    	local level =GetLevel(varMap, varPlayer)
		    	if ran <= 5 and level >=75 then
		    		StartItemTask(varMap)
		 				ItemAppend( varMap, 30021001,1 )
		    		local varRet = StopItemTask( varMap, varPlayer )
						if varRet > 0 then
							DeliverItemListSendToPlayer(varMap,varPlayer) 
							Msg2Player(varMap, varPlayer, "恭喜您幸运的获得了1件初级马蹬", 0, 2)
							Msg2Player(varMap, varPlayer, "恭喜您幸运的获得了1件初级马蹬", 0, 3)
							LuaAllScenceM2Wrold (varMap, "恭喜"..GetName( varMap, varPlayer).."在那达慕大赛中幸运的获得了1件初级马蹬", 5, 1)
						end
						
					end
	    		--赛马名次通报
			x430601_Mingci(varMap, varPlayer)
   end
   --LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x430601_var_QuestIdNext )	
end

function x430601_GetBonus( varMap, varPlayer,varTalknpc)
	local level = GetLevel(varMap, varPlayer)
	x430601_var_ExpBonus = 31500 * level
	  if x430601_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x430601_var_ExpBonus);
  	end
		if x430601_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x430601_var_BonusMoney1 )
	  end
		if x430601_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x430601_var_BonusMoney2 )
	  end
		if x430601_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x430601_var_BonusMoney3 )
		end
		if x430601_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x430601_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x430601_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x430601_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x430601_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x430601_var_BonusMoney6)
		end
		if x430601_var_BonusMoney18 > 0  then
			AddHorseMoney(varMap, varPlayer, x430601_var_BonusMoney18 )
		end
end

function x430601_Msg2toplayer( varMap, varPlayer,type)
		local level =GetLevel( varMap, varPlayer )
		x430601_var_ExpBonus = 31500*level
		if type == 0 then
			Msg2Player(varMap, varPlayer, "您接受了任务"..x430601_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x430601_var_QuestName.."！", 0, 3)
		elseif type == 1 then
			Msg2Player(varMap, varPlayer, "您放弃了任务"..x430601_var_QuestName.."！", 0, 2)
			Msg2Player(varMap, varPlayer, "您放弃了任务"..x430601_var_QuestName.."！", 0, 3)
		elseif type == 2 then
			Msg2Player(varMap, varPlayer, "你完成了任务"..x430601_var_QuestName.."！", 0, 2)
			Msg2Player(varMap, varPlayer, "您完成了任务"..x430601_var_QuestName.."！", 0, 3)
			if x430601_var_ExpBonus > 0 then
				Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x430601_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x430601_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer,format( "#Y获得#R银卡#{_MONEY%d}#Y的奖励",x430601_var_BonusMoney1), 0, 2)
  		end
				if x430601_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer,format( "#Y获得#R现银#{_MONEY%d}#Y的奖励",x430601_var_BonusMoney2), 0, 2)
  		end
			if x430601_var_BonusMoney3 > 0 then
	  	 Msg2Player(varMap, varPlayer, format( "#Y获得#R金卡#{_MONEY%d}#Y的奖励",x430601_var_BonusMoney3), 0, 2)
		end
			if x430601_var_BonusMoney4 > 0 then
				Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x430601_var_BonusMoney4.."#Y的奖励", 0, 2)
			end
			if x430601_var_BonusMoney5 > 0 then
				Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x430601_var_BonusMoney5.."#Y的奖励", 0, 2)
			end
			if x430601_var_BonusMoney6 > 0 then
				Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x430601_var_BonusMoney6.."#Y的奖励", 0, 2)
			end
			if x430601_var_BonusMoney18 > 0 then
				Msg2Player(varMap, varPlayer, "#Y获得#R马币"..x430601_var_BonusMoney18.."#Y的奖励", 0, 2)
			end
		end
end

function x430601_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x430601_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
		--LuaCallNoclosure(888894,"PlayEffect",varMap,varPlayer,73)
--
--		
--	local minute = GetMinOfDay()
--	
--	if minute <19*60+30  then
--		return
--	end
--	if minute >20*60  then
--		return
--	end
--				
--	if IsQuestHaveDone(varMap, varPlayer, x430601_var_QuestId) > 0 then
--		return 
--	end
--	
--	if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) <= 0 then return end
--	
--	randombuffonplayer(varMap, varPlayer)
	
end

function x430601_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x430601_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)

end

function x430601_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x430601_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x430601_var_QuestId)
	local saimaState = GetQuestParam( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMASTAE)      
    for varI ,item in x430601_var_NpcGUID do
        if item.guid == varTalkNpcGUID  then
		    if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) > 0  then
		    	if varTalkNpcGUID == x430601_var_FinishNPC then				
					local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x430601_var_QuestId)
					TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x430601_var_QuestId, varState, -1 )
				else
				 local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x430601_var_QuestId)
		 		 local saimaState = GetQuestParam( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMASTAE)
					if x430601_var_setFinishNPC == varTalkNpcGUID and saimaState==4  then
						SetQuestByIndex(varMap,varPlayer,varQuestIdx, 7, 1)   
        				SetQuestByIndex(varMap,varPlayer,varQuestIdx, 0, 1) 
					end
					TalkAppendButton( varMap, x430601_var_QuestId, "接受"..item.varName.."的鲜花",3, item.varIndex )
				end
			end
            break
        end
    end
    
end

function x430601_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x430601_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x430601_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x430601_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x430601_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x430601_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end


function x430601_ProcQuestLogRefresh( varMap,varPlayer,varQuest)

	 if IsHaveQuest(varMap,varPlayer, x430601_var_QuestId) <= 0 then return end

	 local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x430601_var_QuestId)
	 local saimaState = GetQuestParam( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMASTAE)
	 
	 StartTalkTask( varMap)
	 if  x430601_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
		local strInfo = format("  前往#G"..x430601_var_NpcGUID[saimaState+1].varName.."#W领取鲜花")
        AddQuestLogCustomText( varMap,
                               "",                             
                              	x430601_var_QuestName,       
                               strInfo,                        
                               "",                             
                               x430601_var_QuestInfo,                        
                               strInfo,                 
                               x430601_var_QuestHelp)                    
    else
        AddQuestLogCustomText( varMap,
                               x430601_var_QuestName,                             
                               x430601_var_QuestName,       
                               "冲向终点#G"..x430601_var_NpcGUID[saimaState+1].varName,                        
                               "冲向终点#G"..x430601_var_NpcGUID[saimaState+1].varName,                             
                               x430601_var_QuestInfo,                          
                               "",                 
                               "")                          
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
		
	local minute = GetMinOfDay()
	
	if minute <19*60+30  then
		x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "那达慕赛马大会还在准备阶段，将在19：30正式开始", 0, 3)
		return
	end
	if minute >20*60  then
		x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "那达慕赛马大会已经结束，请明天19：30再来", 0, 3)
		return
	end
				
	   
end

function x430601_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x430601_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x430601_ProcTimerDoingStart( varMap, actId, Param1, Param2, Param3, Param4, Param5 )
	--PlayEffect( varMap, varPlayer, 73 )
	--清空还原数据
	x430601_var_mingci = {}
	
	for k,v in x430601_var_NpcGUID do
		v.first = 0
	end
	
	local year,month,day = GetYearMonthDay()
	local RecordeMonth = 0;
	for idx = 0, 3 do
		RecordeMonth = GetCountryParamByBit(idx,CD_COUNTYY_SAIMA_COUNT,28,4)
		if (RecordeMonth ~= month) then
			SetCountryParam(varMap,idx,CD_COUNTYY_SAIMA_COUNT,month)
		end
	end
	
	--创建小箭头
	for i=1,getn(x430601_g_smalljiantou) do
		for k,v in x430601_g_smalljiantouPos do
			
			if k==varMap then
				for j=1,getn(x430601_g_smalljiantouPos[k]) do
					local objId= CreateMonster(varMap,
					 x430601_g_smalljiantou[i].id,
					 x430601_g_smalljiantouPos[k][j].x,  
					 x430601_g_smalljiantouPos[k][j].y,  
					 x430601_g_smalljiantou[i].baseAI,
					 x430601_g_smalljiantou[i].highAI,
					 x430601_var_FileId, 
					 x430601_var_qizhiOBJ,  
					 x430601_g_smalljiantou[i].campId,  
					 x430601_g_smalljiantou[i].liveTime, 
					 x430601_g_smalljiantouPos[k][j].dir,
					 x430601_g_smalljiantou[i].name,
					 x430601_g_smalljiantou[i].title)

				 end
			end
		end
	end
	--创建大箭头
	for i=1,getn(x430601_g_bigjiantou) do
		for k,v in x430601_g_bigjiantouPos do
			
			if k==varMap then
				for j=1,getn(x430601_g_bigjiantouPos[k]) do
					local objId= CreateMonster(varMap,
					 x430601_g_bigjiantou[i].id,
					 x430601_g_bigjiantouPos[k][j].x,  
					 x430601_g_bigjiantouPos[k][j].y,  
					 x430601_g_bigjiantou[i].baseAI,
					 x430601_g_bigjiantou[i].highAI,
					 x430601_var_FileId, 
					 x430601_var_qizhiOBJ,  
					 x430601_g_bigjiantou[i].campId,  
					 x430601_g_bigjiantou[i].liveTime, 
					 x430601_g_bigjiantouPos[k][j].dir,
					 x430601_g_bigjiantou[i].name,
					 x430601_g_bigjiantou[i].title)

				 end
			end
		end
	end
	--创建箱子
	for i=1,getn(x430601_xianjing_MonsterInfo) do
		for k,v in x430601_xianjing_MonsterPos do
			if k==varMap then
				for j=1,getn(x430601_xianjing_MonsterPos[k]) do
					local objId2= CreateMonster(varMap,
					 x430601_xianjing_MonsterInfo[i].id,
					 x430601_xianjing_MonsterPos[k][j].x,  
					 x430601_xianjing_MonsterPos[k][j].y,  
					 x430601_xianjing_MonsterInfo[i].baseAI,
					 x430601_xianjing_MonsterInfo[i].highAI,
					 x430601_var_FileId, 
					 -1,  
					 x430601_xianjing_MonsterInfo[i].campId,  
					 x430601_xianjing_MonsterInfo[i].liveTime, 
					 x430601_xianjing_MonsterInfo[i].dir,
					 x430601_xianjing_MonsterInfo[i].name,
					 x430601_xianjing_MonsterInfo[i].title)
					SendSpecificImpactToUnit(varMap, objId2, objId2, objId2, x430601_xianjing_MonsterPos[k][j].buff, 0)
				 end
				 
			end
		end
	end
	
	
	if varMap == 0 then
		local npcobjid = FindMonsterByGUID(varMap,x430601_var_StartNPC)
		NpcTalk(varMap,npcobjid , "那达慕赛马大会现在正式开始！", -1)
   	end
	
	-- 向所有玩家发送邀请
	x430601_BroadCastInvite(varMap, actId)
end


function randombuffonplayer(varMap, varPlayer)
		

		--10秒内陷阱不会重复触发
		if GetCurrentTime() - x430601_var_time <10 then
			return 
		else
			x430601_var_time = -1
		end
		
		--触发概率
		local probability = random(1,100)
		local buffcount = 0
		--随机buff
		local buffindex = 0
		local buffid = -1
		
		if probability <10 then 
			return 
		elseif probability >10 and probability<60 then
			buffcount = getn(x430601_var_singleBuff)
			buffindex = random(1,buffcount)
			buffid = x430601_var_singleBuff[buffindex].id
			if IsPlayerStateNormal(varMap, varPlayer) > 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buffid, 0)
				StartTalkTask(varMap);
				TalkAppendString(varMap,x430601_var_singleBuff[buffindex].tip );
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			--CallScriptFunction( 888894, "StopEffect", varMap, varPlayer,60)
			end
			
		elseif probability>60 and probability<100 then
			buffcount = getn(x430601_var_groupBuff)
			buffindex = random(1,buffcount)
			buffid = x430601_var_groupBuff[buffindex].id
			local varX,z = GetWorldPos(varMap,varPlayer)
			local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,15)  
			for varI = 0, Num-1 do
				local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
				if humanObjId ~= -1 then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffid, 0)
						StartTalkTask(varMap);
						TalkAppendString(varMap,x430601_var_groupBuff[buffindex].tip );
						StopTalkTask();
						DeliverTalkTips(varMap, humanObjId);
						--CallScriptFunction( 888894, "StopEffect", varMap, varPlayer,60)
					end
				end
			end						
		end

			--记录陷阱触发时间
		if x430601_var_time == -1 then
			x430601_var_time = GetCurrentTime()
		end

end

function npcchuansong(varMap, varPlayer)

		--赛马前往捷径点
		local x430601_var_Npcpos ={
		{x=160,y=140,mapid=37 ,},
		{x=265,y=199,mapid=44 ,},
		{x=429,y=417,mapid=44 ,},
		{x=126,y=137,mapid=569,},
		{x=365,y=134,mapid=569,},																																				
		}                                                                  
			                                                                  
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, 10284)
		local saimaState = GetQuestParam( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMASTAE)+1
		if saimaState < 0 then
			saimaState = 1
		elseif saimaState > getn(x430601_var_Npcpos) then
			saimaState = getn(x430601_var_Npcpos)
		end
		if varMap ~= x430601_var_Npcpos[saimaState].mapid then
		NewWorld(varMap, varPlayer,x430601_var_Npcpos[saimaState].mapid,x430601_var_Npcpos[saimaState].x,x430601_var_Npcpos[saimaState].y, 430601)
		else
		SetPos(varMap,varPlayer,x430601_var_Npcpos[saimaState].x,x430601_var_Npcpos[saimaState].y)
		end
		Msg2Player(varMap, varPlayer, "转瞬之间，您回到上一位明珠身畔", 0, 3)
end

function x430601_ProcDie(varMap, varPlayer, varKiller)
--	local itemlistcount = {
--		{item=12271006,count=5},
--		{item=12271007,count=5},
--		{item=12271008,count=5},
--		{item=12271009,count=5},
--		{item=12271010,count=5},
--		{item=12271011,count=5},
--	}
--	
--	StartItemTask(varMap)
--	for k,v in itemlistcount do
--		local temp1 = random(1,10)
--		local temp2 = random(1,v.count)
--		if temp1 >5 then
--		ItemAppend( varMap, v.item, temp2 )
--		end		
--	end
--	DropItemListToScene(varMap,varPlayer, 1)
end

function x430601_Mingci(varMap, varPlayer)
	
	--防止刷第一
	local saimadate = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE)
	if saimadate ~= GetDayOfYear() then
		Msg2Player(varMap, varPlayer, "非当天完成赛马无法参与名次争夺", 0, 3)
		return
	end
	--记录x国赛马成绩次数
	local CountryIdx = GetCurCountry(varMap, varPlayer)
	local nMingci = getn(x430601_var_mingci)
	if (CountryIdx >= 0 and CountryIdx <= 3 and nMingci<3) then
		local nCount = GetCountryParamByBit(CountryIdx,CD_COUNTYY_SAIMA_COUNT,nMingci*6,6) + 1
		SetCountryParamByBit(CountryIdx,CD_COUNTYY_SAIMA_COUNT,nMingci*6,6,nCount)
	end

	if x430601_var_mingci[1] == nil  then
    	 local name =GetName(varMap, varPlayer)
    	 LuaAllScenceM2Wrold( varMap, "恭喜玩家"..name.."勇夺那达慕赛马大会冠军", 5, 1 )
    	 LuaAllScenceM2Wrold( varMap, "恭喜玩家"..name.."勇夺那达慕赛马大会冠军", 1, 1 )
    	 x430601_var_mingci[1] = name
    	 AwardTitle(varMap, varPlayer,172)
    	 return
    end
    if x430601_var_mingci[2] == nil and x430601_var_mingci[1] ~= nil then
    	 local name =GetName(varMap, varPlayer)
    	 LuaAllScenceM2Wrold( varMap, "恭喜玩家"..name.."勇夺那达慕赛马大会亚军", 5, 1 )
    	 LuaAllScenceM2Wrold( varMap, "恭喜玩家"..name.."勇夺那达慕赛马大会亚军", 1, 1 )
    	 x430601_var_mingci[2] = name
    	 AwardTitle(varMap, varPlayer,173)
    	 return
    end
    if x430601_var_mingci[3] == nil and x430601_var_mingci[1] ~= nil and x430601_var_mingci[2] ~= nil then
    	 local name =GetName(varMap, varPlayer)
    	 LuaAllScenceM2Wrold( varMap, "恭喜玩家"..name.."勇夺那达慕赛马大会季军", 5, 1 )
    	 LuaAllScenceM2Wrold( varMap, "恭喜玩家"..name.."勇夺那达慕赛马大会季军", 1, 1 )
    	 x430601_var_mingci[3] = name
    	 AwardTitle(varMap, varPlayer,174)
    	 return
    end
    if getn(x430601_var_mingci) >2 and getn(x430601_var_mingci) <= 20 then
    	local name =GetName(varMap, varPlayer)
    	if x430601_var_mingci[getn(x430601_var_mingci)+1] == nil then
    		local mingci = getn(x430601_var_mingci)+1
    		LuaAllScenceM2Wrold(varMap, "恭喜玩家"..name.."获得那达慕赛马大会#R第"..mingci.."名", 1, 1)
    		x430601_var_mingci[mingci] = name
    	end
    	return
    end
    
end

function x430601_zhongzhuanexp(varMap, varPlayer)

	local zhongzhuanexp = 0
	local minute = GetMinOfDay()
	local level = GetLevel(varMap, varPlayer)
	if minute <19*60+45  then
		zhongzhuanexp = 875*level
	elseif minute >19*60+45 and minute < 19*60+50  then
		zhongzhuanexp = 700*level
	elseif minute >19*60+50 and minute < 19*60+55 then
		zhongzhuanexp = 612*level
	elseif minute >19*60+55 and minute < 20*60 then
		zhongzhuanexp = 525*level
	end
	AddExp(varMap, varPlayer, zhongzhuanexp);
end

function x430601_yingjiewushi(varMap, varPlayer)

	local mon = {}
	mon[1] =FindMonsterByGUID(varMap,405927)
	mon[2] =FindMonsterByGUID(varMap,405928)
	mon[3] =FindMonsterByGUID(varMap,405929)	
	local ran = random(1,3)
	for i=1 ,3 do
		if mon[i] ~= -1 then
			if i ~= ran then
			NpcTalk(varMap,mon[i] , "恭喜勇士抵达终点！！", -1)
			if IsHaveSpecificImpact( varMap, mon[i], 7520) ~= 1 then
		  		SendSpecificImpactToUnit(varMap, mon[i], mon[i], mon[i], 7520, 0)
		 	end
		 	end
	 	end
 	end
 	
end

--随机从一个表里挑3个不同的数
function x430601_GetRandomMonType(varMap)

	local Num = getn(x430601_guanjiaskill)
	for j = 1, Num do
		local n = random(1, Num)
		local m =  random(1, Num)
		if n ~= m then
			local t = x430601_guanjiaskill[n]
			x430601_guanjiaskill[n] = x430601_guanjiaskill[m]
			x430601_guanjiaskill[m] = t
		end
	end
	return x430601_guanjiaskill
end


--------------------------------------------------------------------------------------------------------
-- buff 98 激活时处理
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj 
-- 参数：varMap -- 目标玩家ID 
--------------------------------------------------------------------------------------------------------
function x430601_OnImpactActiveOnce( varMap, varPlayer, targetId )
	local ran = random(1,getn(x430601_guanjiaskill))
	-- 添加关卡技能 参数4：3为可以删除 2为不能删除
	local varX,z = GetWorldPos(varMap,targetId)
	local Num =  GetNearPlayerCount(varMap, targetId,varX,z,2)  
	for varI = 0, Num-1 do
		local humanObjId = GetNearPlayerMember(varMap, targetId,varI);
		if humanObjId ~= -1 then
			AddGuanQiaSpellToPlayer(varMap, humanObjId, x430601_guanjiaskill[ran],3)
			SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, 32611, 0)
		end
	end
	--AddGuanQiaSpellToPlayer(varMap, targetId, x430601_guanjiaskill[ran],3)
	--SendSpecificImpactToUnit(varMap, targetId, targetId, targetId, 32611, 0)
end

----------------------------------------------------------------------------------------------
-- buff 98 消失时的处理 在98号逻辑下buff生效次数用完后buff消失进入此接口
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj  
-- 参数：targetId -- 目标玩家ID 
----------------------------------------------------------------------------------------------
function x430601_OnImpactFadeOut( varMap, varPlayer ,targetId)	
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32607, 0)
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32610, 0)
end

----------------------------------------------------------------------------------------------
-- buff 98 在x430601_OnImpactActiveOnce之前在脚本中检测 当前的目标玩家是否可以被激活
-- 参数：varMap -- 场景ID 
-- 参数：varPlayer	 -- 源obj 
-- 参数：varMap -- 目标玩家ID 
-- 返回值 0 当前目标玩家不可以被处理，1则可以
----------------------------------------------------------------------------------------------
function x430601_CheckImpackScriptIsCanDoByScript( varMap, varPlayer, targetId )

	 if IsHaveSpecificImpact( varMap, targetId, 32584) ~= 1 or IsHaveSpecificImpact( varMap, varPlayer, 32607) == 1 or IsHaveSpecificImpact( varMap, targetId, 32611) == 1 then 
	 	return 0
	else
		return 1
	end
end

function x430601_OpenGuanqiaUI( varMap, varPlayer )
	-- 打开关卡技能栏函数 参数1 场景id；参数2 玩家id；参数3 1为打开0为关闭，当关闭时会清空玩家的关卡技能
	OpenGuanqiaSpellUI(varMap, varPlayer, 1)
	local skiltemptable =x430601_GetRandomMonType(varMap)
	for i = 1 ,3 do
		AddGuanQiaSpellToPlayer(varMap, varPlayer, skiltemptable[i],3)
	end
end

function x430601_CloseGuanqiaUI( varMap, varPlayer )	
	OpenGuanqiaSpellUI(varMap, varPlayer ,0)
end

function x430601_BroadCastInvite(varMap, actid)

	-- 发送赛马活动邀请广播 参数1 场景id；参数2 actid
	BroadCastHorseGamingInvite(varMap, actid)
end

function x430601_ProcPlayerAcceptInvite(varMap, varPlayer)
	-- 切图到目的地 参数1 场景id；参数2 玩家id，参数3 目的场景id；参数4 目的x，参数5 目的y，参数6 用于记录切图的原因，8为赛马活动邀请导致的切图，
	local temp = random(1,3)
	local tempx = 0
	local tempy = 0
	if temp == 1 then
		tempx = 53  + random(-5,5)
		tempy = 130+ random(-5,5)
	else
		tempx = 57  + random(-5,5)
		tempy = 149+ random(-5,5)
	end
	
	if GetLevel(varMap, varPlayer) < x430601_var_LevelLess then
		Msg2Player(varMap, varPlayer, "等级不足无法参加赛马", 0, 3) 
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x430601_var_QuestId) > 0 then
			return 
	end
	
	if x430601_CheckCanJoin( varMap, varPlayer ) == 1 then
		return
	end
	
	local minute = GetMinOfDay()
	
	if minute <19*60+30  then
		x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "那达慕赛马大会还在准备阶段，将在19：30正式开始", 0, 3)
		return
	end
	if minute >20*60  then
		x430601_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "那达慕赛马大会已经结束，请明天19：30再来", 0, 3)
		return
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7606) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7612) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7618) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7624) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7609) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7615) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7621) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7627) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1  then
		Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
		return
	end
	if IsQuestFullNM(varMap,varPlayer)==1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"可接任务数量已满")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 
	end
	
	local count = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_COUNT)
	local saimadate = x430601_GetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE)
	if saimadate == GetDayOfYear() then
		if count == 1 then
			Msg2Player(varMap, varPlayer, "你今天已经进行过赛马了，请明天再来", 0, 3)
			return 0
		end
	end
	
	local a = AddQuest( varMap, varPlayer, x430601_var_QuestId, x430601_var_FileId, 0, 1, 0,1)
	if a > 0 then
		GotoTarget(varMap, varPlayer, 37, tempx, tempy, 8)
		if IsPlayerStateNormal(varMap, varPlayer) > 0 then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32584, 0)
			RestoreHp(varMap, varPlayer,0)
			StartTalkTask(varMap);
			TalkAppendString(varMap,"获得赛马英雄效果，血量极大提升");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
		end	
		x430601_ProcQuestLogRefresh( varMap,varPlayer,x430601_var_QuestId)
		GamePlayScriptLog(varMap, varPlayer, 993)
		x430601_OpenGuanqiaUI(varMap,varPlayer)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x430601_var_QuestId)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x430601_MP_SAIMALAREN, 1)
		local today =GetDayOfYear()
		x430601_SetMD(varMap, varPlayer,MD_COUNTRY_SAIMA_DATE,today)
	else
		Msg2Player(varMap, varPlayer, "任务暂时无法接受！", 0, 3)
	end
end

----------------------------------------------------------------------------
--检查能否满足参加赛马条件
---------------------------------------------------------------------------
function x430601_CheckCanJoin( mapId, playerId )
	
	--玩家在副本、战场内无法参加赛马
	local sceneType = GetSceneType(mapId)
	if	sceneType == 1 or sceneType == 2 then
		StartTalkTask(mapId)
    TalkAppendString( mapId, "处于副本或战场中,不能参加赛马" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
		return 1
	end
	
	--玩家变身，战场押运等状态无法参加赛马
	local state = IsPlayerStateNormal(mapId,playerId )
  if state == 0 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "玩家状态异常,不能参加赛马" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_MENTALGAME )
  if state == 1 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "处于答题状态,不能参加赛马" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_STALL )
  if state == 1 then
		StartTalkTask(mapId)
    	TalkAppendString( mapId, "处于摆摊状态,不能参加赛马" );
    	StopTalkTask(mapId)
    	DeliverTalkTips(mapId,playerId)	   
      return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_TONGQUBUFF )
  if state == 1 then
		StartTalkTask(mapId)
    	TalkAppendString( mapId, "处于童趣状态,不能参加赛马" );
    	StopTalkTask(mapId)
    	DeliverTalkTips(mapId,playerId)	   
      return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_DIE )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于死亡状态,不能参加赛马" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)
  	 return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_CRASHBOX )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于运镖状态,不能参加赛马" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_AUTOPLAY )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于挂机状态,不能参加赛马" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId) 
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_SUBTRAIN )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于代练状态,不能参加赛马" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_BUS )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于BUS状态,不能参加赛马" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
  
  if mapId == PK_PUNISH_PRISON_SCENE_ID then
    StartTalkTask(mapId)
  	TalkAppendString( mapId, "在监狱里,不能参加赛马" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
  	return 1
  end
  	
	return 0	
end
