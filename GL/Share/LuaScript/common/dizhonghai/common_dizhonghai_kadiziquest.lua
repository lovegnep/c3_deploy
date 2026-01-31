
x270204_var_FileId = 270204

x270204_var_PrintInfoLog									=	1	--输出基本调用信息日志
x270204_var_PrintDebugLog									=	1	--输出调试日志

x270204_var_Quest_Count			= {0, 20}	--海港任务完成次数

x270204_var_Quest_Point =3

x270204_var_QuestLevel ={5000,7000000000000000}

x270204_var_QuestList ={                                       --海港任务表
	

					[406001] = { 10400,10401,10402,10404,10403 },
 					[406002] = { 10409,10406,10407,10408,10405 },
					[406003] = { 10420,10421,10422,10423,10424 },
  					[406004] = { 10410,10411,10412,10413,10414 },
  					[406005] = { 10415,10416,10417,10418,10419 }
						}



x270204_var_QuestName = {       
[10400]="阿拔斯海盗",
[10401]="大马士革流寇",
[10402]="海盗的财宝",
[10403]="下毒",
[10404]="见财起意",
[10405]="焚烧粮草",
[10406]="削弱军队",
[10407]="补充箭矢",
[10408]="杀死骑士",
[10409]="收集证据",
[10410]="堕落的主教",
[10411]="罪证",
[10412]="港口的流匪",
[10413]="卡迪兹港的货物",
[10414]="狼狈为奸",
[10415]="石材收集",
[10416]="杀死野兽",
[10417]="狩猎",
[10418]="杀狼高手",
[10419]="陷阱",
[10420]="斩首",
[10421]="海都密令",
[10422]="击溃前锋",
[10423]="证据",
[10424]="进攻准备",

}



x270204_var_QuestItem = {																				--海港任务道具表
	 
							{quest=8040,item1=12030051, item2=12030052},    
						  {quest=8041,item1=12030051, item2=12030053},
						  {quest=8042,item1=12030052, item2=12030053},
						  {quest=8043,item1=12030051, item2=12030052},
						  {quest=8044,item1=12030051, item2=12030053},
						  {quest=8045,item1=12030052, item2=12030053},
						  
						  {quest=8034,item1=12030051, item2=12030052},
						  {quest=8035,item1=12030051, item2=12030053},
						  {quest=8036,item1=12030052, item2=12030053},
						  {quest=8037,item1=12030051, item2=12030052},
						  {quest=8038,item1=12030051, item2=12030053},
						  {quest=8039,item1=12030052, item2=12030053}
						  
					
						}
						
x270204_var_QuestNPC =	{406001,406002,406003,406004,406005}      --海港任务NPC表
						


x270204_var_NpcMissionIndexTable = 
{
	[406001] = {MD_HAIGANG_QUEST_INDEX1A, MD_HAIGANG_QUEST_INDEX1B},
	[406002] = {MD_HAIGANG_QUEST_INDEX2A, MD_HAIGANG_QUEST_INDEX2B},
	[406003] = {MD_HAIGANG_QUEST_INDEX3A, MD_HAIGANG_QUEST_INDEX3B},
	[406004] = {MD_HAIGANG_QUEST_INDEX4A, MD_HAIGANG_QUEST_INDEX4B},
	[406005] = {MD_HAIGANG_QUEST_INDEX5A, MD_HAIGANG_QUEST_INDEX5B}
}

x270204_var_MissionStateTable = 
{
	[406001] = {MD_HAIGANG_QUEST_INDEX1A_COMPLETE, MD_HAIGANG_QUEST_INDEX1B_COMPLETE},
	[406002] = {MD_HAIGANG_QUEST_INDEX2A_COMPLETE, MD_HAIGANG_QUEST_INDEX2B_COMPLETE},
	[406003] = {MD_HAIGANG_QUEST_INDEX3A_COMPLETE, MD_HAIGANG_QUEST_INDEX3B_COMPLETE},
	[406004] = {MD_HAIGANG_QUEST_INDEX4A_COMPLETE, MD_HAIGANG_QUEST_INDEX4B_COMPLETE},
	[406005] = {MD_HAIGANG_QUEST_INDEX5A_COMPLETE, MD_HAIGANG_QUEST_INDEX5B_COMPLETE}
}


x270204_var_AcceptMessage		= "您接受了任务：%s"
x270204_var_AbandonMessage	= "您放弃了任务：%s"
x270204_var_CompleteMessage	= "您完成了任务：%s"
x270204_var_CountryMessage	= "恭喜完成卡迪兹港任务，卡迪兹港征服度达到%d"

x270204_var_QuestCommentMessage	=	"11111111111不在接任务时间，请关注活动公告"
x270204_var_QuestAcceptFailedMessage_Accepted	=	"你在本日已经做过本任务了，请明日再来"
x270204_var_QuestSubmitFailedMessage_OverTime	=	"你已经错过了交任务的时间，请放弃任务"





x270204_var_QuestName2 = {          --任务名称（点击任务按钮以后）
[10400]="【个人】阿拔斯海盗",
[10401]="【个人】大马士革流寇",
[10402]="【个人】海盗的财宝",
[10403]="【个人】下毒",
[10404]="【个人】见财起意",
[10405]="【个人】焚烧粮草",
[10406]="【个人】削弱军队",
[10407]="【个人】补充箭矢",
[10408]="【个人】杀死骑士",
[10409]="【个人】收集证据",
[10410]="【个人】堕落的主教",
[10411]="【个人】罪证",
[10412]="【个人】港口的流匪",
[10413]="【个人】卡迪兹港的货物",
[10414]="【个人】狼狈为奸",
[10415]="【个人】石材收集",
[10416]="【个人】杀死野兽",
[10417]="【个人】狩猎",
[10418]="【个人】杀狼高手",
[10419]="【个人】陷阱",
[10420]="【个人】斩首",
[10421]="【个人】海都密令",
[10422]="【个人】击溃前锋",
[10423]="【个人】证据",
[10424]="【个人】进攻准备",

}




x270204_var_QuestAttachMessage	=	{    						--任务对话（点击任务按钮以后）

[10400]="\t困扰卡迪兹港口最大的问题就是海盗。这些海盗大多是阿拔斯王朝遗族，你们蒙古铁蹄踏碎他们的国家后，他们就流亡海上，凭藉精湛的航海技术开始了海盗生涯，我们拿他们无可奈何。\n\t我组织多次围剿收获甚微，而最近这些海盗得到资助，居然一举攻下了卡迪兹港西北的高地，居高临下，威胁比以往更大。\n\t帮我击溃这些海盗！",
[10401]="\t大马士革也被你们元朝灭掉，之后那些残余的武士加入了阿拔斯的海盗队伍。所以我一直觉得这应该赖你们！这些流寇帮助海盗出售洗劫来的财富，还多次帮助海盗击退卫队的围剿，我早就对他们恨得牙根痒痒了！\n\t击败那些流寇将他们的大马士革锻钢刃带来给我！",
[10402]="\t阿拔斯海盗非常猖獗，很多国家的舰队都不是他们的对手，他们将很多劫来的财产都聚集在了卡迪兹港口附近，其中有一部分属于西班牙，也有很多是属于其他国家的。\n\t夺取海盗的财宝，并交给我。这样不但可以弥补我们的损失，还能给港口带来点收入，总督大人会很高兴的。",
[10403]="\t为了瓦解那些强盗，再狠毒的计策都不算过分，将毒药放入海盗与流寇的饮食中。这些是“十香软骨散”，还是我从你们汉人手里买到的呢！",
[10404]="\t阿拔斯贵族首领是阿拔斯海盗的头目，这些有着原阿拔斯帝国贵族血统的人已经沦为无恶不作的凶徒，丧失祖国让他们疯狂得失去理智。当然他们身上携带的财宝也是最多的。\n\t要知道，卡迪兹港口卫官的薪水是非常可怜的，如果能有点灰色收入的话，对我帮助非常大。把阿拔斯贵族的财宝交给我，我会在总督面前给你美言几句的。",
[10405]="\t西班牙的军队在卡迪兹港附近集结，然而他们的目标并非是海盗和流寇。我听到风声，一些掌握军权的西班牙贵族已经和海都取得了联系，希望在海都的帮助下夺取政权。\n\t不管这些西班牙军队来此是何目的，限制他们的行动总错不了，去烧掉他们的粮草！他们的粮草存放在一个大仓库中。",
[10406]="\t这支西班牙军队的来路非常可疑，若是海督的盟友，杀死他们有利于我大元；若不是，杀死他们则西班牙军力变弱，削弱西班牙在外交谈判上的筹码也有利于我们。\n\t有益无害的事情，何乐不为呢？去击溃那些西班牙军人吧，别留活口！",
[10407]="\t我来到卡迪兹港口时候非常仓促，手下斥候的武装配备不足，一些弓箭手在与海督势力交战后，箭矢得不到补充。而西班牙军队配备了一批精锐的弓箭手，他们身上都带有箭矢。\n\t杀掉他们后，把他们的箭矢夺来给我。",
[10408]="\t骑士一直是西方的恐怖的力量，他们披挂厚重的铠甲，骑着高头大马，当骑士组成庞大的军队后将是不容小觑的军事力量。西班牙已经开始抽调骑士来到卡迪兹港口的周边，这些骑士对海盗和流寇视而不见，只是驻扎。\n\t我怀疑这些骑士是西班牙叛逆贵族许诺给海都的支持，宁可错杀一千不放过一个，先下手为强，除掉西班牙骑士。",
[10409]="\t知己知彼百战不殆，我来此不光是调查使团的死因，打探西班牙军队的部署还有各种情报也是目的之一。谁知与海都的几次交战，手下有不少折损，因此需要你来帮忙。\n\t在西班牙人常用羊皮卷来记录资讯，去西班牙驻地收集一些羊皮卷，并将它们交给我，这其中说不定就隐藏着西班牙军队的秘密。",
[10410]="\t愿上帝原谅我的罪行。主教帕拉多·波旁是个非常恶毒的人，在海盗、流寇对港口轮番滋扰的情况下，他却加紧搜刮当地的百姓。\n\t由于害怕被报复，他躲藏在卡迪兹港口外的一处小宅中。是时候除掉他了，如果动手的是一名外人的话，那就没人会受到惩罚，你明白我的意思吧？",
[10411]="\t有罪的不仅是主教帕拉多，他还有一群帮凶和走狗。一些高阶教徒掌握有红衣主教罪行的证据，他们往往将搜刮来的财物记录于随身携带的帐本上。\n\t如果你能将这些帐本夺来交给我，就能掌握主教的罪证，多抓些别人的把柄总是错不了的。",
[10412]="\t主教帕拉多掌握权力后雇佣了很多居住在港口区的地痞无赖，让港口的流匪为他充当打手，给当地居民带来了不少的麻烦。\n\t正义必须得到伸张，去教训一下港口流匪，如果必要的话，使用些非常的手段。",
[10413]="\t前一阵，一艘货船满载来到卡迪兹港，但是被一群海盗洗劫了。总督经过调查，那些海盗是流匪假扮的。货物被劫令很多海商开始怀疑卡迪兹港的治安，一些人甚至考虑在其他的港口停靠，这样一来对卡迪兹港的发展非常不好。\n\t如果能为总督大人将这些货物夺回来，不但可以挽回损失，还能挽回名声，总督会很高兴的。",
[10414]="\t一直都有流言，说主教和一些外来人往来密切，你最好能帮我调查一下，与主教狼狈为奸的人到底是谁。",
[10415]="\t建立卡迪兹港口的时候，使用的都是附近山谷中的石材，如今经历几次与海盗的战斗后，很多房屋还有工事需要修葺，但一些野兽在山谷中横行，石匠们不敢前往，而港口卫队也无法抽调出人手陪同石匠。\n\t如果你能帮忙收集些石材的话，我将不胜感激。",
[10416]="\t很多猎人外出狩猎都被杀死了，伤口非常可怕，据推断是一种极为凶暴的野兽，解决它，我不想再看到有人受伤了。",
[10417]="\t野猪肉一直是卡迪兹港口居民喜爱的食物，可是由于恶狼氾滥，人们很少能获得野猪肉的补给，去帮我弄来一些吧。也该丰富下居民的食谱了！",
[10418]="\t卡迪兹港口野外恶狼横行，民众抱怨总督没能力保护他们的安全。如今总督实在调配不出人手，只能拜托你去除掉那些凶残的野兽了。",
[10419]="\t陷阱是猎人最常用的工具之一，用它来捕猎，省事放心。你需要做的只有将陷阱放在野兽出没的地方，就可以了，很简单吧！\n\t只不过由于附近恶狼横行的关系，很多猎人都不敢贸然离开港口去山里，只能拜托你了。",
[10420]="\t告诉你，统领海都前哨阵地的是他的一名亲信，阿古达木。此人有勇无谋，马屁的功夫倒是不差。你对付他应该不成问题。阿古达木一死，前哨阵地必乱无疑！",
[10421]="\t海都行踪不定，非常隐秘狡猾，他依靠一些密使携带命令来指挥前哨阵地的事情，这些密使时常出没在前哨阵地中，除掉他们，如果运气好的话，就会得到海都密令。\n\t我自从弃暗投明以来还没有什么作为，若能通过这些命令发现海都的阴谋，“小哲别”定会对我刮目相看的。",
[10422]="\t什么才是最有效的进攻？一击而挫其锐气！前哨阵地的前锋都是海都精挑细选的武士，这些窝阔台武士武艺高强，深得海都信赖。\n\t杀死这些窝阔台武士，挫一挫他们的锐气。",
[10423]="\t想要向卡迪兹港口总督证明海都与海盗流寇还有堕落的教会勾结，就必须找到证据。据我所知，海盗与流寇得到海都的资助后，抢劫到的货物要与海都分成，而归海都所有的货物，都盖有窝阔台汗国的印章。\n\t进入海都的前哨，将尚未转移走的货物取回来。这样一来，总督就会支持我们。",
[10424]="\t为了向“小哲别”证明我的忠诚，我准备召集曾经的手下对海都的前哨阵地发动一次攻击，部队我已经部署完毕，现在就差你来发号施令了！\n\t拿着这只“哲别军号”，在前哨阵地前吹响！",
}

x270204_var_QuestTarget	={        	--任务目标（点击任务按钮以后）
[10400]="#Y任务目标：\n\t#W击败10名@npc_406007后，与@npc_406001交谈",
[10401]="#Y任务目标：\n\t#W击败@npc_406008，并带回5把大马士革锻钢刃交给@npc_406001",
[10402]="#Y任务目标：\n\t#W前往@npc_41731收集物品5枚海盗的金币，并交给@npc_406001",
[10403]="#Y任务目标：\n\t#W前往阿拔斯海盗和大马士革流寇的@npc_41701，并下毒",
[10404]="#Y任务目标：\n\t#W击败@npc_406009，将阿拔斯贵族的财宝交给@npc_406001",
[10405]="#Y任务目标：\n\t#W前往西班牙军队营地，烧掉@npc_41723后与@npc_406002交谈",
[10406]="#Y任务目标：\n\t#W击败10名@npc_406010后回报@npc_406002",
[10407]="#Y任务目标：\n\t#W击败@npc_406012，夺得5捆箭矢交给@npc_406002",
[10408]="#Y任务目标：\n\t#W除掉@npc_406011后回报@npc_406002",
[10409]="#Y任务目标：\n\t#W在@npc_41724收集5张羊皮卷，将他们交给@npc_406002",
[10410]="#Y任务目标：\n\t#W刺杀堕落的@npc_406013",
[10411]="#Y任务目标：\n\t#W击败@npc_406015，搜集5本教徒的帐本，并交给@npc_406004",
[10412]="#Y任务目标：\n\t#W除掉10名@npc_406014后向@npc_406004汇报",
[10413]="#Y任务目标：\n\t#W从@npc_41725夺回5份被劫走的货物",
[10414]="#Y任务目标：\n\t#W前往@npc_41726，查探线索",
[10415]="#Y任务目标：\n\t#W从@npc_41727收集5份石材后交给@npc_406005",
[10416]="#Y任务目标：\n\t#W击毙@npc_406016后向@npc_406005汇报",
[10417]="#Y任务目标：\n\t#W杀死@npc_406018，从它们身上得到5条完好的野猪肉后交给@npc_406005",
[10418]="#Y任务目标：\n\t#W杀死10只@npc_406017后向@npc_406005汇报",
[10419]="#Y任务目标：\n\t#W将陷阱安放在@npc_41728",
[10420]="#Y任务目标：\n\t#W击毙@npc_406019后向@npc_406003汇报",
[10421]="#Y任务目标：\n\t#W击杀@npc_406021，并从他们身上搜集5份海都密令",
[10422]="#Y任务目标：\n\t#W击毙10名@npc_406020",
[10423]="#Y任务目标：\n\t#W前往@npc_41729取回5份盖有窝阔台汗国印章的赃物",
[10424]="#Y任务目标：\n\t#W在海都的@npc_41730吹响哲别军号",


}					

x270204_var_QuestAcceptTime1 = { 450, 480 }	
x270204_var_QuestAcceptTime2 = { 750, 780 }	
x270204_var_QuestAcceptTime3 = { 1170, 1200 }	
x270204_var_BonusChoiceItem ={{item = 12250010,n= 1},{item = 12250011,n= 1},{item = 12250012,n= 1},{item = 12250013,n= 1},{item = 12250014,n= 1}}
x270204_var_VirtualQuestId = 1368

x270204_var_RandItem = {11010100, 11010101, 11010102}
x270204_var_AwardItem =11000947
function x270204_GetQuest(varMap,npcGUID,varRate)    --第一次获取任务
	
	local tempTable = x270204_var_QuestList[npcGUID]
	if (nil == tempTable) then	
		return 
	end
	
	local varIndex
	if varRate < x270204_var_QuestLevel[1] then
		varIndex = random(1, 4);
	else
		varIndex = random(1, 5);
	end
		
	
	local varQuest = x270204_var_QuestList[npcGUID][varIndex]
	
	if (x270204_var_PrintInfoLog == 1) then
		WriteLog(1, format("Info --- GetQuestAResult = %d ", varQuest))
	end
	return varQuest,varIndex			 			

end

function x270204_GetQuest2(varMap,npcGUID,varQuestA,varRate)   --再次获取任务
		
		local tempTable = x270204_var_QuestList[npcGUID]
		if (nil == tempTable) then	
			return 
		end
	
		local varIndex
		while( varIndex < 0 or x270204_var_QuestList[npcGUID][varIndex] == varQuestA ) do
			if varRate < x270204_var_QuestLevel[1] then
				local varIndex = random(1, 4);
			else
				local varIndex = random(1, 5);
			end
		end
	  local varQuest = x270204_var_QuestList[npcGUID][varIndex]
		if (x270204_var_PrintInfoLog == 1) then
			WriteLog(1, format("Info --- GetQuestBResult = %d ", varQuest))
		end
		return varQuest,varIndex			 			

	

end

function x270204_GetRate(varMap, varPlayer)    --获取国家任务完成次数
		
		local rate = GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT)
		if (x270204_var_PrintDebugLog == 1) then
			WriteLog(1, format("Info --- ЧΘ = %d ", rate))
		end
		
		return rate
		

end

function x270204_AddRate(varMap, varPlayer)    --增加国家任务完成次数
		local rate=GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT)
		local str
		if(rate == -1) then
			SetCountryQuestData(varMap, 0, CD_COUNTRY_DIZHONGHAI_POINT,2,1)
			str =format(x270204_var_CountryMessage,rate+2)
		else
			SetCountryQuestData(varMap, 0, CD_COUNTRY_DIZHONGHAI_POINT,1,1)
		  str =format(x270204_var_CountryMessage,rate+1)	
		end
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, str);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,str,8,2)		
		
end


function x270204_GetMDAccepted(varMap, varPlayer, npcGUID)


	
end

function x270204_SetMDAccepted(varMap, varPlayer, varIndex, value)
	
end


function x270204_GetMDComplete(varMap, varPlayer, varNpcGUID, varIndex)      --从MD获取任务完成情况
	
	
	local tempTable = x270204_var_MissionStateTable[varNpcGUID]
	if (nil == tempTable) then	
		return 
	end

	local isComplete = 0
	isComplete = GetPlayerGameData(varMap, varPlayer, x270204_var_MissionStateTable[varNpcGUID][varIndex][1],x270204_var_MissionStateTable[varNpcGUID][varIndex][2], x270204_var_MissionStateTable[varNpcGUID][varIndex][3])
	return isComplete
end

function x270204_SetMDComplete(varMap, varPlayer, varNpcGUID, varIndex,value)   --从MD设定任务完成情况

	local tempTable = x270204_var_MissionStateTable[varNpcGUID]
	if (nil == tempTable) then	
		return 
	end

	SetPlayerGameData(varMap, varPlayer, x270204_var_MissionStateTable[varNpcGUID][varIndex][1], x270204_var_MissionStateTable[varNpcGUID][varIndex][2], x270204_var_MissionStateTable[varNpcGUID][varIndex][3], value)
	
end

function x270204_GetMDQuest(varMap, varPlayer, varNpcGUID, varIndex)       --从MD获取任务ID

	local tempTable = x270204_var_NpcMissionIndexTable[varNpcGUID]
	if (nil == tempTable) then	
		return 
	end
	local varQuestIndex = GetPlayerGameData(varMap, varPlayer, x270204_var_NpcMissionIndexTable[varNpcGUID][varIndex][1], x270204_var_NpcMissionIndexTable[varNpcGUID][varIndex][2], x270204_var_NpcMissionIndexTable[varNpcGUID][varIndex][3])
	varQuest = x270204_var_QuestList[varNpcGUID][varQuestIndex]
	return varQuest
end

function x270204_SetMDQuest(varMap, varPlayer, varNpcGUID, varIndex, varQuestIndex)    --从MD设置任务Index

	local tempTable = x270204_var_NpcMissionIndexTable[varNpcGUID]
	if (nil == tempTable) then	
		return 
	end
	SetPlayerGameData(varMap, varPlayer, x270204_var_NpcMissionIndexTable[varNpcGUID][varIndex][1], x270204_var_NpcMissionIndexTable[varNpcGUID][varIndex][2], x270204_var_NpcMissionIndexTable[varNpcGUID][varIndex][3], varQuestIndex)
end

function x270204_GetMDDate(varMap, varPlayer)      --从MD获取日期
	local day = GetPlayerGameData(varMap, varPlayer, MD_HAIGANG_DATE[1], MD_HAIGANG_DATE[2], MD_HAIGANG_DATE[3])
	return day
end

function x270204_SetMDDate(varMap, varPlayer, day)      --每日初始化设置
	
	
	for varI,	npc in x270204_var_QuestNPC do
		local isKeepA = 0
		local isKeepB = 0
		local varNpcGUID = npc	 
		for varJ, quest in x270204_var_QuestList[varNpcGUID] do
			if IsHaveQuestNM( varMap, varPlayer, quest ) > 0 then
   				if x270204_GetMDQuest(varMap, varPlayer, varNpcGUID, 1) == quest then
   				  isKeepA = 1
   				elseif x270204_GetMDQuest(varMap, varPlayer, varNpcGUID, 2) == quest then
   				  isKeepB = 1 
   				end

   		end
		end
		

		if isKeepA == 0 then
	 	  x270204_SetMDQuest(varMap, varPlayer, varNpcGUID, 1, 0)
	 	  x270204_SetMDComplete(varMap, varPlayer, varNpcGUID, 1, 0)
		end
		if isKeepB == 0 then
			x270204_SetMDQuest(varMap, varPlayer, varNpcGUID, 2, 0)
			x270204_SetMDComplete(varMap, varPlayer, varNpcGUID, 2, 0)
		end
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_HAIGANG_DATE[1], MD_HAIGANG_DATE[2], MD_HAIGANG_DATE[3], day)
end


function x270204_NextDayReset(varMap, varPlayer)    --每日初始化设置
	local varToday = GetDayOfYear()
	local varLastday = x270204_GetMDDate(varMap, varPlayer)

	if varToday ~= varLastday then
		x270204_SetMDDate(varMap, varPlayer, varToday)
		
		
		
	end
end

function x270204_IsNextDay(varMap, varPlayer)   --判断MD中日期是否是当日
	
	local varToday = GetDayOfYear()
	local varLastday = x270204_GetMDDate(varMap, varPlayer)
	
	if (x310120_var_PrintDebugLog == 1) then
		WriteLog(1, format("-----------today=",varToday))
		WriteLog(1, format("-----------varLastday=",varLastday))
	end	

	if varToday ~= varLastday then
		return 1
	end 
		
	return -1
end


function x270204_HaveAccepted( varMap, varPlayer )
	

--	if x270204_GetMDDate(varMap, varPlayer) > 0 then
--		return 1
--	end

	return -1
end

function x270204_ProcAcceptCheckTime(  )

	local minspan = GetMinOfDay()
	
	
		
	if  minspan >= x270204_var_QuestAcceptTime2[1] and minspan <= x270204_var_QuestAcceptTime2[2] then
		return 2
	elseif  minspan >= x270204_var_QuestAcceptTime3[1] and minspan <= x270204_var_QuestAcceptTime3[2] then
		return 3
	end
	
	return -1
end

function x270204_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )   --点击NPC触发

	local varQuestA,varQuestAIndex
	local varQuestB,varQuestBIndex
	local isAcceptA = 0
	local isAcceptB = 0	
	local varRate = x270204_GetRate(varMap, varPlayer)
	--local varRate = 0

	
	local npcGUID = GetMonsterGUID(varMap,varTalknpc)	
	--varQuestA = x270204_GetMDQuest(varMap, varPlayer, npcGUID, 1)	
		
	if x270204_IsNextDay(varMap, varPlayer) > 0 then
		x270204_NextDayReset(varMap, varPlayer) 
	end



	if varRate < x270204_var_QuestLevel[2] then
		varQuestA = x270204_GetMDQuest(varMap, varPlayer, npcGUID, 1)
		
		if varQuestA == 0 or varQuestA == nil then
			varQuestA,varQuestAIndex = x270204_GetQuest(varMap,npcGUID,varRate);
		  x270204_SetMDQuest(varMap, varPlayer, npcGUID, 1,varQuestAIndex)
		end		
		
	


		
		for varI, item in x270204_var_QuestList[npcGUID] do
			
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
				if(item == varQuestA) then
					isAcceptA  = 1
				end
			end
		end

		
		local CompleteTemp = 0
		CompleteTemp  = x270204_GetMDComplete(varMap, varPlayer, npcGUID, 1)
	
		if	
											      --以三个条件判断是否能显示任务
			x270204_GetMDComplete(varMap, varPlayer, npcGUID, 1) ~= 1 and  
			isAcceptA~=1 																									then 
			--local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestA)
			--TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuestA, questState);
			local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, varQuestA )

			TalkAppendButton( varMap,  x270204_var_FileId, x270204_var_QuestName[varQuestA], varState, 1)
			
		end
	else
		varQuestA = x270204_GetMDQuest(varMap, varPlayer, npcGUID, 1)
		varQuestB = x270204_GetMDQuest(varMap, varPlayer, npcGUID, 2)
	
		if varQuestA == nil and varQuestB == nil then
			varQuestA,varQuestAIndex = x270204_GetQuest(varMap,npcGUID,varRate);
		  varQuestB,varQuestBIndex = x270204_GetQuest2(varMap,npcGUID,varQuestA,varRate);
			x270204_SetMDQuest(varMap, varPlayer, npcGUID, 1,varQuestAIndex)
			x270204_SetMDQuest(varMap, varPlayer, npcGUID, 2,varQuestBIndex)
		elseif 	varQuestA ~= nil and varQuestB == nil then
		 	varQuestB,varQuestBIndex = x270204_GetQuest2(varMap,npcGUID,varQuestA);
		  x270204_SetMDQuest(varMap, varPlayer, npcGUID, 2,varQuestBIndex)
		elseif 	varQuestA == nil and varQuestB ~= nil then
		 	varQuestA,varQuestAIndex = x270204_GetQuest2(varMap,npcGUID,varQuestB);
	 		x270204_SetMDQuest(varMap, varPlayer, npcGUID, 1,varQuestAIndex)
		end		
		
		
		for varI, item in x270204_var_QuestList[npcGUID] do
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
				if(item == varQuestA) then
					isAcceptA  = 1
				elseif(item == varQuestB) then
					isAcceptB = 1		
				end
			end
		end
	
	
		if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuestA ) > 0 and			--以三个条件判断是否能显示任务
			x270204_GetMDComplete(varMap, varPlayer, npcGUID, 1)  ~=  1 and
			isAcceptA~=1 																									then 
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestA)
			--TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuestA, questState);
			TalkAppendButton( varMap,  x270204_var_FileId, x270204_var_QuestName[varQuestA], varState, 1)

		end
		if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuestB ) > 0 and			--以三个条件判断是否能显示任务			
			x270204_GetMDComplete(varMap, varPlayer, npcGUID, 2)  ~= 1  and
			isAcceptB~=1 																									then 
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestB)
			--TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuestB, questState);
			TalkAppendButton( varMap,  x270204_var_FileId, x270204_var_QuestName[varQuestB], varState, 2)
		
		end
  end  
	return 0
end


function x270204_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varIndex)   --点击任务按钮触发
	local  guid,Level50 = GetToplistInfo(varMap,0,49)
--	if Level50 <80 then
--			 Msg2Player(varMap, varPlayer, format("很抱歉，等级排行榜上第50名玩家不足80级"), 0, 3)
--			return
--	end
	local npcGUID = GetMonsterGUID(varMap,varTalknpc)
	varQuest = x270204_GetMDQuest(varMap, varPlayer, npcGUID, varIndex)



	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	

		
		local varRet = 1	
			if varRet > 0 then	
				
				StartTalkTask( varMap);
				TalkAppendString(varMap, "#Y"..x270204_var_QuestName2[varQuest]);
				TalkAppendString(varMap, x270204_var_QuestAttachMessage[varQuest]);
				TalkAppendString(varMap, x270204_var_QuestTarget[varQuest]);
				AddQuestItemBonus(varMap, x270204_var_AwardItem, 1)
				for varI, item in x270204_var_BonusChoiceItem do
			    	AddQuestRadioItemBonus(varMap, item.item, item.n)
			  end


				StopTalkTask(varMap);
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270204_var_FileId, varQuest);
			else
				local varText = "未知错误，无法接新的任务"
				if varRet == -1 then
					varText = "等级不足，无法接新的任务"
				elseif varRet == -2 then
					varText = "等级过高，无法接新的任务"
				elseif varRet == -3 then
					varText = "金钱不足，无法接新的任务"
				elseif varRet == -4 then
					varText = "您不是本国玩家，无法接新的任务"
				elseif varRet == -5 then
					varText = "职业类型不符，无法接新的任务"
				elseif varRet == -6 then
					varText = "阵营不符，无法接新的任务"
				elseif varRet == -7 then
					varText = "此人无此任务"
				end
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			QuestComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		else
			QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		end
	end
end

function x270204_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


	local npcGUID = GetMonsterGUID(varMap,varTalknpc)

	if x270204_HaveAccepted( varMap, varPlayer ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, x270204_var_QuestAcceptFailedMessage_Accepted);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,x270204_var_QuestAcceptFailedMessage_Accepted,8,2)
		return
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
		varRet = AddQuest( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, varQuest, 1)

			GamePlayScriptLog(varMap, varPlayer, 1961)

			local day = GetDayOfYear()


			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			
			local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
			local message = format(x270204_var_AcceptMessage, varQuestName);
			StartTalkTask(varMap)
			TalkAppendString(varMap, message);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer, message, 4, 2)
			

			
		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	
	end
end



function x270204_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		local day = GetDayOfYear()
		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x270204_var_AbandonMessage, varQuestName);
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message, 4, 2)

	end
end


function x270204_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if guid ~= -1 then 
		if guid == varTalkNpcGUID then	
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end


function x270204_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) == 0 then 
		return
	end

	if GetBagSpace(varMap, varPlayer) < 3 then
		local message = "背包已满，无法完成此任务"
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return
	end

	DelQuest(varMap, varPlayer, varQuest)


	GamePlayScriptLog(varMap, varPlayer, 1962)

	
		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x270204_var_CompleteMessage, varQuestName);
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)

		local varLevel = GetLevel(varMap, varPlayer)


		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)

		StartItemTask( varMap )
		ItemAppend( varMap, x270204_var_AwardItem, 1 )
		
		local rndItemid = -1
		if GetLevel(varMap, varPlayer) >= 80 and random(1, 100) <= 22 then
			local varIndex = random(1,3)
			if varIndex < 1 then varIndex = 1 end
			if varIndex > 3 then varIndex = 3 end
			rndItemid = x270204_var_RandItem[varIndex]
			ItemAppend( varMap, rndItemid, 1)
		end
		
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
	
			DeliverItemListSendToPlayer(varMap,varPlayer)

			message = format("#Y获得物品#R#{_ITEM%d}#Y的奖励", x270204_var_AwardItem )
			StartTalkTask(varMap);
			TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
		else
			local varText = "背包已满,不能获得奖励物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
		AddCountryResource(varMap,varPlayer,2,2000,1)
		
	
		local npcGUID = GetMonsterGUID(varMap,varTalknpc) 

		local varIndex = 1

   	if x270204_GetMDQuest(varMap, varPlayer, npcGUID, 1) == varQuest then
   		 varIndex = 1
   	elseif x270204_GetMDQuest(varMap, varPlayer, npcGUID, 2) == varQuest then
   		 varIndex = 2 	 
   	end
   	x270204_SetMDComplete(varMap, varPlayer, npcGUID, varIndex, 1)
   	x270204_AddRate(varMap, varPlayer)
   		
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + 100
		SetShengWang( varMap, varPlayer, varShengWang )
		message = format("获得声望%d的奖励。", 100)
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,message,4,2)
		
		if rndItemid ~= -1 then
			local varStr = format("#Y随机获得#G1个#Y#{_ITEM%d}", rndItemid)
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			
		end
		if GetLevel(varMap, varPlayer) >= 60 then
			if random( 1, 100) <= 20 then
				
				local bai60 = 12030143
				local bai80 = 12030144
				local bai = bai60
				StartItemTask( varMap)
				if GetLevel(varMap, varPlayer) >=80 then
				bai = bai80
				end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
				Msg2Player( varMap, varPlayer, format( "幸运的获得1个#R#{_ITEM%d}", bai), 8, 3)
				else
				Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理背包", 8, 3)
				end            
			end
		end
end


function x270204_ProcQuestAward( varMap, varPlayer, varTalknpc, varQuest )

				local meili = GetHotValue( varMap, varPlayer)
				SetHotValue(varMap, varPlayer,meili+x270204_var_Quest_Point)
				Msg2Player(varMap,varPlayer,format("#cffcf00获得#G征服点数%d#cffcf00点的奖励。", x270204_var_Quest_Point),4,2)
				
				
				local npcGUID = GetMonsterGUID(varMap,varTalknpc) 

				local varIndex = 1

   			if x270204_GetMDQuest(varMap, varPlayer, npcGUID, 1) == varQuest then
   				 varIndex = 1
  		 	elseif x270204_GetMDQuest(varMap, varPlayer, npcGUID, 2) == varQuest then
   				 varIndex = 2 	 
   			end
  		 	x270204_SetMDComplete(varMap, varPlayer, npcGUID, varIndex, 1)
   			x270204_AddRate(varMap, varPlayer)
end


function x270204_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

    
    if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then	
        return
    end
    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		
		if Num < NeedNum then 
			StartTalkTask(varMap)
			local varText = format("#Y获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		elseif Num == NeedNum then
			
			StartTalkTask(varMap)
			local varText = format( "#Y已完成获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
			if GetQuestParam(varMap, varPlayer, varQuestIdx, 0) == NeedNum and GetQuestParam(varMap, varPlayer, varQuestIdx, 1) == NeedNum then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			end
		end
	end
end


function x270204_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end

function x270204_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
	local varStr;
	varStr = GetQuestNameNM(varMap, varPlayer, varQuest);
    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                varStr,                 
                                "",               
                                "",                         
                                "",                   
                                "",                
                                ""        
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end


function x270204_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


function x270204_OpenCheck( varMap, varPlayer, varTalknpc )
end
