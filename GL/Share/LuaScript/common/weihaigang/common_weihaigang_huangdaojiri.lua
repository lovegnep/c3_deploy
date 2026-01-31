




--DECLARE_QUEST_INFO_START--


x300578_var_QuestId 				= 	9334                     
x300578_var_FileId 					= 	300578                  
x300578_var_QuestKind 				= 	1                       
x300578_var_LevelLess					= 	40                      


x300578_var_QuestName				= 	"【个人】黄道吉日"
x300578_var_QuestName1				= 	"你什么时候可以出海"
x300578_var_QuestTarget				= 	"前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期"
x300578_var_QuestTarget1				= 	"询问水手们，确定出航日期"
x300578_var_QuestInfo				= 	""
x300578_var_ContinueInfo				= 	""
x300578_var_QuestCompleted			= 	""
x300578_var_QuestHelp				=	""          


x300578_var_ExtTarget					=	{ {type=20,n=1,target="黄道吉日"}}



x300578_var_ExpBonus					= 	0;
x300578_var_BonusItem					=	{{item=11050003, n=8}}	

x300578_var_BonusMoney1               = 	0
x300578_var_BonusMoney2               =   0
x300578_var_BonusMoney3               =   0
x300578_var_BonusMoney5				=	0

x300578_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300578_var_NpcList = {143099,143100,143101,143102,143103,143104,143105,143106}
x300578_var_ReplyNpcId = 143145




x300578_var_GameId			= 1015

x300578_var_QuestionCount		= 9	
x300578_var_QuestionTextList	= {
								{	title="【个人】黄道吉日",  
								  title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周一，周三不登船。",
									text2="\t我的习惯是，除了周五，周六，我都可以登船。",
									text3="\t别问了，每周我只有周一，周四，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周日和周六我不登船。",
									text5="\t恩？我在周三，周六，周日从不登船",
									text6="\t周一，周二我不登船。",
									text7="\t除了周三，周四，周六以外，我都不登船。",
									text8="\t听说周一和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周一，三不登船#W。",
									gonglue2="#G周五，六不登船#W。",
									gonglue3="#G周一，四，日登船#W。",
									gonglue4="#G周六，日不登船#W。",
									gonglue5="#G周三，六，日不登船#W。",
									gonglue6="#G周一，二不登船#W。",
									gonglue7="#G周三，四，六登船#W。",
									gonglue8="#G周一，周五不登船#W。",

									
									result = 4  

								},
								{title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周一，周三不登船。",
									text2="\t我的习惯是，除了周五，周六，我都可以登船。",
									text3="\t别问了，每周我只有周二，周四，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周日和周六我不登船。",
									text5="\t恩？我在周三，周六，周日从不登船",
									text6="\t周一，周四我不登船。",
									text7="\t除了周二，周四，周六以外，我都不登船。",
									text8="\t听说周一和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周一，三不登船#W。",
									gonglue2="#G周五，六不登船#W。",
									gonglue3="#G周二，四，日登船#W。",
									gonglue4="#G周六，日不登船#W。",
									gonglue5="#G周三，六，日不登船#W。",
									gonglue6="#G周一，四不登船#W。",
									gonglue7="#G周二，四，六登船#W。",
									gonglue8="#G周一，周五不登船#W。",

                 	result = 2  
								},
								{
									title="【个人】黄道吉日",  
									 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周二，周三不登船。",
									text2="\t我的习惯是，除了周五，周六，我都可以登船。",
									text3="\t别问了，每周我只有周一，周三，周四，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周日和周六我不登船。",
									text5="\t恩？我在周三，周六，周日从不登船",
									text6="\t周二，周五我不登船。",
									text7="\t除了周一，周四，周六以外，我都不登船。",
									text8="\t听说周四和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周二，三不登船#W。",
									gonglue2="#G周五，六不登船#W。",
									gonglue3="#G周一，三，四，日登船#W。",
									gonglue4="#G周六，日不登船#W。",
									gonglue5="#G周三，六，日不登船#W。",
									gonglue6="#G周二，五不登船#W。",
									gonglue7="#G周一，四，六登船#W。",
									gonglue8="#G周四，周五不登船#W。",

									
									result = 1  
								},
								{title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周一，周二不登船。",
									text2="\t我的习惯是，除了周五，周六，我都可以登船。",
									text3="\t别问了，每周我只有周三，周四，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周日和周六我不登船。",
									text5="\t恩？我在周一，周六，周日从不登船",
									text6="\t周二，周五我不登船。",
									text7="\t除了周三，周四，周六以外，我都不登船。",
									text8="\t听说周四和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周一，二不登船#W。",
									gonglue2="#G周五，六不登船#W。",
									gonglue3="#G周三，四，日登船#W。",
									gonglue4="#G周六，日不登船#W。",
									gonglue5="#G周一，六，日不登船#W。",
									gonglue6="#G周二，五不登船#W。",
									gonglue7="#G周三，四，六登船#W。",
									gonglue8="#G周四，周五不登船#W。",

									
									result = 3 
								},
								
								{
								title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周二，周三不登船。",
									text2="\t我的习惯是，除了周四，周六，我都可以登船。",
									text3="\t别问了，每周我只有周三，周五，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周日和周六我不登船。",
									text5="\t恩？我在周一，周六，周日从不登船",
									text6="\t周二，周三我不登船。",
									text7="\t除了周三，周五，周六以外，我都不登船。",
									text8="\t听说周四和周六容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周二，三不登船#W。",
									gonglue2="#G周四，六不登船#W。",
									gonglue3="#G周三，五，日登船#W。",
									gonglue4="#G周六，日不登船#W。",
									gonglue5="#G周一，六，日不登船#W。",
									gonglue6="#G周二，三不登船#W。",
									gonglue7="#G周三，五，六登船#W。",
									gonglue8="#G周四，周六不登船#W。",

									
									result = 5 
								},
								
								{title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周二，周三不登船。",
									text2="\t我的习惯是，除了周四，我都可以登船。",
									text3="\t别问了，每周我只有周三，周五，周六登船。",
									text4="\t我是个喜欢有规律的水手，每周五和周日我不登船。",
									text5="\t恩？我在周一，周五，周日从不登船",
									text6="\t周二，周三我不登船。",
									text7="\t除了周三，周五，周六以外，我都不登船。",
									text8="\t听说周四和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周二，三不登船#W。",
									gonglue2="#G周四不登船#W。",
									gonglue3="#G周三，五，六登船#W。",
									gonglue4="#G周五，日不登船#W。",
									gonglue5="#G周一，五，日不登船#W。",
									gonglue6="#G周二，三不登船#W。",
									gonglue7="#G周三，五，六登船#W。",
									gonglue8="#G周四，周五不登船#W。",

									
									result = 6 
								
								},
								{title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周二，周三不登船。",
									text2="\t我的习惯是，除了周四，我都可以登船。",
									text3="\t别问了，每周我只有周三，周五，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周五和周六我不登船。",
									text5="\t恩？我在周一，周五，周六从不登船",
									text6="\t周二，周三我不登船。",
									text7="\t除了周三，周五，周日以外，我都不登船。",
									text8="\t听说周四和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周二，三不登船#W。",
									gonglue2="#G周四不登船#W。",
									gonglue3="#G周三，五，日登船#W。",
									gonglue4="#G周五，六不登船#W。",
									gonglue5="#G周一，五，六不登船#W。",
									gonglue6="#G周二，三不登船#W。",
									gonglue7="#G周三，五，日登船#W。",
									gonglue8="#G周四，周五不登船#W。",

									
									result = 7 
								
								},
								{title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周一，周二不登船。",
									text2="\t我的习惯是，除了周二，周五我都可以登船。",
									text3="\t别问了，每周我只有周三，周五登船。",
									text4="\t我是个喜欢有规律的水手，每周五和周六我不登船。",
									text5="\t恩？我在周一，周五，周六从不登船",
									text6="\t周二，周四我不登船。",
									text7="\t除了周三，周五，周日以外，我都不登船。",
									text8="\t听说周四和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周一，二不登船#W。",
									gonglue2="#G周二，五不登船#W。",
									gonglue3="#G周三，五登船#W。",
									gonglue4="#G周五，六不登船#W。",
									gonglue5="#G周一，五，六不登船#W。",
									gonglue6="#G周二，四不登船#W。",
									gonglue7="#G周三，五，日登船#W。",
									gonglue8="#G周四，周五不登船#W。",

									
									result = 3 
								
								},
								{title="【个人】黄道吉日",  
								 title1="你什么时候可以出海", 
									info="\t在一周的七天里，这些水手们各自都有几天不愿上船，#y@myname#w，你可否帮我问问他们，找出究竟何日他们都可以登船出海？", 
									task="前往@npc_85055和@npc_85056，询问扬武号的水手们，确定出航日期",
									text1="\t船主又派人来问我？我周二，周三不登船。",
									text2="\t我的习惯是，除了周二，周五我都可以登船。",
									text3="\t别问了，每周我只有周一，周五，周日登船。",
									text4="\t我是个喜欢有规律的水手，每周五和周六我不登船。",
									text5="\t恩？我在周二，周五，周六从不登船",
									text6="\t周三，周四我不登船。",
									text7="\t除了周一，周五以外，我都不登船。",
									text8="\t听说周四和周五容易起风暴，我在这两天不登船。",
									answer="\t你打听明白了？他们在周几都可以登船？\n\t#Y(您可以在任务攻略中查看水手们说过的话，以便分析。)",
									answer1="周一",
									answer2="周二",
									answer3="周三",
									answer4="周四",
									answer5="周五",
									answer6="周六",
									answer7="周日",
									
									gonglue1="#G周二，三不登船#W。",
									gonglue2="#G周二，五不登船#W。",
									gonglue3="#G周一，五，日登船#W。",
									gonglue4="#G周五，六不登船#W。",
									gonglue5="#G周二，五，六不登船#W。",
									gonglue6="#G周三，四不登船#W。",
									gonglue7="#G周一，五登船#W。",
									gonglue8="#G周四，周五不登船#W。",

									
									result = 1 
								
								},
							   }	
				


x300578_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}


function x300578_GetQuestId( varMap, varPlayer )
	return x300578_var_QuestId
end

function x300578_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300578_var_LevelLess then
       return
    end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300578_var_QuestName,8,1);
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x300578_var_QuestName,varState,varState);

	end


	
end





function x300578_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )	
	
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest )>0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

		

		local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
		local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

		if varCompleted>0 then
			local bAnswerQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

			if bAnswerQuestion>1 then
				x300578_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			else
				if varExt==7 then
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
						TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].info)
						TalkAppendButton(varMap, varMyQuest, "我知道哪天能出海了",2,20);
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300578_var_FileId, varMyQuest);
				elseif varExt==20 then
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
						
						
						TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].answer)
						
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer1,2,21);
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer2,2,22);
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer3,2,23);
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer4,2,24);
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer5,2,25);
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer6,2,26);
						TalkAppendButton(varMap, varMyQuest, x300578_var_QuestionTextList[varQuestion].answer7,2,27);
						
						
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300578_var_FileId, varMyQuest);
				elseif varExt>=21 then
					local varAnswer = varExt-20
					local nResult = x300578_var_QuestionTextList[varQuestion].result;

					if nResult == varAnswer then
						x300578_ShowTips(varMap, varPlayer, "太好了！我这就吩咐下去让他们开始准备。")
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 2 )
						x300578_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
					else
						x300578_ShowTips(varMap, varPlayer, "真的吗？我看未必吧，你还是再去问问，耽误了开船可是大事。")
						x300578_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest,2)
					end
				end
			end
			return
		end
	end
	
	
	if varExt>10 then 
		if varExt>=20 then
			return
		end

		local iIndex = varExt-10

		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			return
		end

		x300578_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varMyQuest,iIndex )

	
	else
		
		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			x300578_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		else
			if varExt==7 then 
				
				
				
			else
				
				x300578_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			end
		end
	end
end


function x300578_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )

	return 1;

end

function x300578_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300578_var_LevelLess then
		x300578_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300578_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    local day = GetDayOfYear()
    if day == GetPlayerGameData( varMap, varPlayer, MD_HDJR_DATE[1], MD_HDJR_DATE[2],MD_HDJR_DATE[3] ) then
        Msg2Player( varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取", 8, 3)
        return 0
    end

    if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == day then
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
            Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
            return 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 0)
    end

	return 1;

end

function x300578_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	
	if x300578_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300578_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,varMyQuest  )
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

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300578_var_FileId, 0, 0, 0,1)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x300578_var_QuestName;
		x300578_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )
		
		x300578_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest,1)

		GamePlayScriptLog(varMap, varPlayer, 851)
		return 1
	else
		
		x300578_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300578_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest, varExt)
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return
	end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )

	local varQuestion = random(1,x300578_var_QuestionCount)
		
	

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, varQuestion )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )  
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 0 )

	x300578_ShowQuestion( varMap, varPlayer, varTalknpc,varQuest,varQuestion, varExt )

	x300578_QuestLogRefresh( varMap, varPlayer, varMyQuest );
end

function x300578_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300578_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务："..x300578_var_QuestName;
	    x300578_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData( varMap, varPlayer, MD_HDJR_DATE[1], MD_HDJR_DATE[2], MD_HDJR_DATE[3], varToday)
		if varToday == GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3] ) then
            local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
            if varCount < 3 then
                SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1 + varCount)
            end
        else
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3], varToday)
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1)
        end
	else
		x300578_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300578_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	
	if x300578_CheckSubmit(varMap, varPlayer )>0 then
		
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		if x300578_GiveReward(varMap,varPlayer,varButtonClick)<=0 then
			return
		end
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
            LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300578_var_QuestId)

			local varStr = "您完成了任务:"..x300578_var_QuestName;
			x300578_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

            SetPlayerGameData( varMap, varPlayer, MD_HDJR_DATE[1], MD_HDJR_DATE[2], MD_HDJR_DATE[3], GetDayOfYear() )

			GamePlayScriptLog(varMap, varPlayer, 852)
			
		else
			x300578_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300578_GiveReward(varMap,varPlayer,varRadioSelected)
	
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

    -- find item index
    local index = 0
    for i, item in x300578_var_RewardTable do
        for j, iter in item.items do
            if varRadioSelected == iter.varId then
                index = j
                break
            end
        end
        if index ~= 0 then
            break
        end
    end
    
	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    if index <= 2 or index  ==5 then
        varCanBind = 1
    end
    for varI, item in x300578_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300578_var_QuestId)
        local strLog = format( "DayCommon: Error in 300578! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
        WriteLog( 1, strLog)
        return 0
    end

	StartItemTask(varMap)
    if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
        if varCanBind == 1 then
            ItemAppend( varMap, varId, varCount)
        else
            ItemAppendBind( varMap, varId, varCount)
        end
    else
		ItemAppendBind( varMap, varId, varCount)
    end
		
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
        Msg2Player( varMap, varPlayer, format("您获得了物品：@itemid_%d",varId), 8, 3)

	else
        Msg2Player( varMap, varPlayer, "背包空间不足，无法获得任务奖励物品，交任务失败", 8, 3)
		return 0;	
	end
	
	if varLevel >=60 then 
	  if random( 1, 100) <= 20 then
		local bai = 12030143
		local bai80 = 12030144
		StartItemTask( varMap)
		if varLevel >=80 then
			bai = bai80
		end	
		ItemAppendBind( varMap, bai, 1)	
		if StopItemTask( varMap, varPlayer) > 0 then
		DeliverItemListSendToPlayer( varMap, varPlayer)
		else
		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理背包", 8, 3)
		end       
	  end	     
	end	
		--送精致的水晶
		if varLevel >= 40 and varLevel < 60 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000206, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的国传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end 
		elseif varLevel > 59 and varLevel <80 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000207, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的神传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end
		elseif varLevel > 79 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000208, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的天传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end
		end

	return 1	
	
	
	
	
	
	
end



function x300578_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		x300578_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local bAnswered = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	if (varCompleted*bAnswered)<=0 then
		return 0
	end

	return 1;
end






function x300578_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300578_var_QuestName)
	TalkAppendString(varMap,"\t扬武号上的这群水手们，要说起本事，个个都有一手绝活，但要说起他们那些怪脾气，可真是一言难尽啊。\n\t这几天扬武号就要出海，可是这些家伙，个个都有十足的理由不愿意上船！")
	TalkAppendString( varMap,"#Y任务目标：")
			
	TalkAppendString( varMap,x300578_var_QuestTarget)
			
	TalkAppendString(varMap," ")

	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300578_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
		
		
	

	
		
	

	
		
		
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300578_var_FileId, varQuest,0);
end





function x300578_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
		TalkAppendString(varMap,"\t你问那些水手们了吗？")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300578_var_FileId, varQuest,0);
	


end










function x300578_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
		TalkAppendString(varMap,"\t太好了！我这就吩咐下去让他们开始准备。这是我的一点小小的心意，你可千万不要推辞。")
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300578_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
		
		
	

	
		
	

	
		
		
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300578_var_FileId, varQuest);

end





function x300578_ShowQuestion( varMap, varPlayer, varTalknpc,varQuest,varQuestion, varExt )


	if varExt==1 then
		StartTalkTask(varMap)
			
			TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
	
			TalkAppendString( varMap,x300578_var_QuestionTextList[varQuestion].info)
		
			
		StopTalkTask()
	elseif varExt==2 then
		StartTalkTask(varMap)
			
			TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
			
			TalkAppendString( varMap,"\t真的吗？我看未必吧，你还是再去问问，耽误了开船可是大事。")
		
			
		StopTalkTask()
	
	else
		return	
	end
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300578_var_FileId, varQuest,1);
	


end


function x300578_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varQuest,iIndex )
	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	
	local bFind =0;
	local iIndex=0
	for varI,item in x300578_var_NpcList do
		iIndex = iIndex+1;
		if varTalkNpcGUID==item then
			bFind=1;
			break;
		end
	end	

	if bFind==0 then
		return
	else
		
		local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
		if varStep~=1 then
			return
		end
	
		local data1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
		local data2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	
		local value4 = floor(data1/1000)
		local value3 = floor(mod(data1,1000)/100)
		local value2 = floor(mod(data1,100)/10)
		local value1 = floor(mod(data1,10)/1)
	
		local value8 = floor(data2/1000)
		local value7 = floor(mod(data2,1000)/100)
		local value6 = floor(mod(data2,100)/10)
		local value5 = floor(mod(data2,10)/1)
	
		local temp_list = {value1,value2,value3,value4,value5,value6,value7,value8}
		local value = temp_list[iIndex]
	
		if value~=0 then
			
			return
		end
	end

	
	
	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )

	if iIndex<=4 then
		
		local nValue = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

		local nAdd = 1
		for varI=1, iIndex-1 do
			nAdd = 10*nAdd
		end

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, nValue+nAdd )
		value1 = nValue+nAdd
	else
		local nValue = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )

		local nAdd = 1
		for varI=1, iIndex-5 do
			nAdd = 10*nAdd
		end

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, nValue+nAdd )

		value2 = nValue+nAdd
	end

	

	
	if value1==1111 and value2==1111 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
		
	end
	
	x300578_QuestLogRefresh( varMap, varPlayer, varMyQuest );

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300578_var_QuestionTextList[varQuestion].title)
		
		if iIndex==1 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text1)
		elseif iIndex==2 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text2)
		elseif iIndex==3 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text3)
		elseif iIndex==4 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text4)
		elseif iIndex==5 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text5)
		elseif iIndex==6 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text6)
		elseif iIndex==7 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text7)
		elseif iIndex==8 then
			TalkAppendString(varMap,x300578_var_QuestionTextList[varQuestion].text8)
		end
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300578_var_FileId, varMyQuest,0);

	

end








function x300578_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300578_GetQuestName(varMap,varPlayer),        
							x300578_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300578_GetReplyNpcId(varMap,varPlayer),			
							x300578_GetQuestMethod(varMap,varPlayer),               
							x300578_GetQuestText(varMap,varPlayer),	
							x300578_GetQuestHelp(varMap,varPlayer)					
							)
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300578_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
		
		
	

	
		
	

	
		
		
		
	
	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x300578_GetQuestName(varMap,varPlayer)
	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local varStr = x300578_var_QuestionTextList[varQuestion].title

	return varStr
end

function x300578_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local strTable = "  ";
	local str1 = strTable..(x300578_var_QuestionTextList[varQuestion].task)..format("(%d/1)",value1)

	if value1>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end

	return str1
end

function x300578_GetReplyNpcId(varMap,varPlayer)
	return x300578_var_ReplyNpcId;
end

function x300578_GetQuestMethod(varMap,varPlayer)
	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local nQuestStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	



	local data1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local data2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )

	
	local value4 = floor(data1/1000)
	local value3 = floor(mod(data1,1000)/100)
	local value2 = floor(mod(data1,100)/10)
	local value1 = floor(mod(data1,10)/1)

	local value8 = floor(data2/1000)
	local value7 = floor(mod(data2,1000)/100)
	local value6 = floor(mod(data2,100)/10)
	local value5 = floor(mod(data2,10)/1)

	local varStr=""

	if nQuestStep>0 then
		
		varStr = x300578_var_QuestTarget1
		
		if value1>=1 then
			varStr=varStr.."\n  大副："..x300578_var_QuestionTextList[varQuestion].gonglue1;
		end
		if value2>=1 then
			varStr=varStr.."\n  二副："..x300578_var_QuestionTextList[varQuestion].gonglue2;
		end
		if value3>=1 then
			varStr=varStr.."\n  船匠："..x300578_var_QuestionTextList[varQuestion].gonglue3;
		end
		if value4>=1 then
			varStr=varStr.."\n  船工："..x300578_var_QuestionTextList[varQuestion].gonglue4;
		end

		if value5>=1 then
			varStr=varStr.."\n  帆手："..x300578_var_QuestionTextList[varQuestion].gonglue5;
		end
		if value6>=1 then
			varStr=varStr.."\n  炮手："..x300578_var_QuestionTextList[varQuestion].gonglue6;
		end
		if value7>=1 then
			varStr=varStr.."\n  舵手："..x300578_var_QuestionTextList[varQuestion].gonglue7;
		end
		if value8>=1 then
			varStr=varStr.."\n  领航："..x300578_var_QuestionTextList[varQuestion].gonglue8;
		end
		
		
	else
		varStr = x300578_var_QuestTarget
	end

	return varStr
end

function x300578_GetQuestText(varMap,varPlayer)
	return "\t扬武号的水手们都有些怪脾气，每周，他们各自都有不愿意出海的几天，你能帮我去询问他们一番，找出哪天他们可以共同登船出海。"
end

function x300578_GetQuestHelp(varMap,varPlayer)
	return "\t每个水手都会告诉你一些他们何时可以登船的信息，根据这些信息，就能找出哪天他们都可以登船。"
end



function x300578_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300578_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300578_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if GetGameOpenById(x300578_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300578_var_QuestId) == 0 then
		
		return
	end
	local varMyQuest = x300578_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	
	local bFind =0;
	local iIndex=0
	for varI,item in x300578_var_NpcList do
		iIndex = iIndex+1;
		if varTalkNpcGUID==item then
			bFind=1;
			break;
		end
	end

	

	if bFind==0 then
		return
	end

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep~=1 then
		return
	end



	local data1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local data2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )

	
	local value4 = floor(data1/1000)
	local value3 = floor(mod(data1,1000)/100)
	local value2 = floor(mod(data1,100)/10)
	local value1 = floor(mod(data1,10)/1)

	local value8 = floor(data2/1000)
	local value7 = floor(mod(data2,1000)/100)
	local value6 = floor(mod(data2,100)/10)
	local value5 = floor(mod(data2,10)/1)

	local temp_list = {value1,value2,value3,value4,value5,value6,value7,value8}

	local value = temp_list[iIndex]

	if value==0 then


		TalkAppendButton(varMap, x300578_var_QuestId, x300578_var_QuestionTextList[varQuestion].title1,2,iIndex+10);
	end
	
	

	
end

function x300578_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end








