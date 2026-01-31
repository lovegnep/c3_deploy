




--DECLARE_QUEST_INFO_START--


x300581_var_QuestId 				= 	9501                     
x300581_var_FileId 					= 	300581                  
x300581_var_QuestKind 				= 	1                       
x300581_var_LevelLess					= 	40                      


x300581_var_QuestName				= 	"【个人】赵王府选美"
x300581_var_QuestTarget				= 	"找到@npc_139406"
x300581_var_QuestTarget1				= 	"询问四位赵王客卿"
x300581_var_QuestInfo				= 	""
x300581_var_ContinueInfo				= 	""
x300581_var_QuestCompleted			= 	""
x300581_var_QuestHelp				=	""          


x300581_var_ExtTarget					=	{ {type=20,n=1,target="赵王府选美"}}



x300581_var_ExpBonus					= 	0;


x300581_var_BonusMoney1               = 	0
x300581_var_BonusMoney2               =   0
x300581_var_BonusMoney3               =   0
x300581_var_BonusMoney5				=	0

x300581_var_BonusChoiceItem           =   {}
x300581_var_BonusItem					=   {{item=11050004,n=8}}	


--DECLARE_QUEST_INFO_STOP--

x300581_var_NpcList = {139405,141533,141534,141535}
x300581_var_ReplyNpcId = 139406




x300581_var_GameId			= 1024

x300581_var_QuestionCount		= 8
x300581_var_QuestionTextList	= {
								{	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位客卿见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服会有#G黄色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G红色#W和#G蓝色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人今日所穿衣服有#G白色#W。",
									text4="\t我敢断定：衣服上有#G黑色#W的人，必不是回鹘第一美人。",
									answer="\t你现在知道谁是回鹘第一美人吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看四位赵王客卿说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
								  gonglue1="#G衣服上有黄色#W",
									gonglue2="#G衣服上有红色和蓝色#W",
									gonglue3="#G衣服上有白色#W",
									gonglue4="#G衣服上没有黑色#W",
									
									result = 1  

								},
							  {	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服会有#G蓝色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G黄色#W没有#G粉色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人所穿衣服有#G红色#W和#G蓝色#W。",
									text4="\t我敢断定：回鹘第一美人的衣服上有#G白色#W。",
									answer="\t你现在知道谁是回鹘第一美人了吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
									gonglue1="#G衣服上有蓝色#W",
									gonglue2="#G衣服上有黄色没有粉色#W",
									gonglue3="#G衣服上有红色和蓝色#W",
									gonglue4="#G衣服上有白色#W",
									
									result = 1  

								},
								{	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服不会出现#G粉色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣有#G红色#W和#G黄色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人所穿衣有#G紫色#W和#G绿色#W。",
									text4="\t我敢断定：回鹘第一美人的衣服上有#G蓝色#W。",
								  answer="\t你现在知道谁是回鹘第一美人了吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
								  gonglue1="#G衣服上没有粉色#W",
									gonglue2="#G衣服上有红色和黄色#W",
									gonglue3="#G衣服上有紫色和绿色#W",
									gonglue4="#G衣服上有蓝色#W",
									
									result = 2  

								},
								{	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服会有#G紫色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G红色#W和#G黄色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人今日所穿衣服有#G蓝色#W。",
									text4="\t我敢断定：衣服上有#G白色#W的人，必不是回鹘第一美人。",
									 answer="\t你现在知道谁是回鹘第一美人了吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
									gonglue1="#G衣服上有紫色#W",
									gonglue2="#G衣服上有红色和黄色#W",
									gonglue3="#G衣服上有蓝色#W",
									gonglue4="#G衣服上没有白色#W",
									
									result = 2  

								},
								{	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服会有#G紫色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G红色#W和#G黄色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人今日所穿衣服有#G白色#W。",
									text4="\t我敢断定：衣服上有#G绿色#W的人，必不是回鹘第一美人。",
									 answer="\t你现在知道谁是回鹘第一美人了吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
									gonglue1="#G衣服上有紫色#W",
									gonglue2="#G衣服上有红色和黄色#W",
									gonglue3="#G衣服上有白色#W",
									gonglue4="#G衣服上没有绿色#W",
									
									result = 3  

								},
								{	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服会有#G白色#W和#G黄色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G红色#W和#G紫色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人今日所穿衣服有#G红色#W。",
									text4="\t我敢断定：回鹘第一美人衣服上没有#G绿色#W。",
									 answer="\t你现在知道谁是回鹘第一美人了吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
								  gonglue1="#G衣服上有白色和黄色#W",
									gonglue2="#G衣服上有红色和紫色#W",
									gonglue3="#G衣服上有红色#W",
									gonglue4="#G衣服上没有绿色#W",
									
									result = 3  

								},
								{	title="【个人】赵王府选美",  
									info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
									task1="询问@npc_"..x300581_var_NpcList[1].."",
								  task2="询问@npc_"..x300581_var_NpcList[2].."",
									task3="询问@npc_"..x300581_var_NpcList[3].."",
									task4="询问@npc_"..x300581_var_NpcList[4].."",
									text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服没有#G橙色#W。",
									text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G红色#W。",
									text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人今日所穿衣服有#G蓝色#W和#G白色#W。",
									text4="\t我敢断定：回鹘第一美人的衣服上有#G紫色#W。",
								 answer="\t你现在知道谁是回鹘第一美人吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
									
									gonglue1="#G衣服上没有橙色#W",
									gonglue2="#G衣服上有红色#W",
									gonglue3="#G衣服上有蓝色和白色#W",
									gonglue4="#G衣服上有紫色#W",
									
									result = 4  

								},
						    {	title="【个人】赵王府选美",  
								  info="\t赵王府之中的四位先生见多识广，前去请教一番便能知晓谁是最出色的回鹘美人。", 
							    task1="询问@npc_"..x300581_var_NpcList[1].."",
						      task2="询问@npc_"..x300581_var_NpcList[2].."",
								  task3="询问@npc_"..x300581_var_NpcList[3].."",
								  task4="询问@npc_"..x300581_var_NpcList[4].."",
							    text1="\t你是来打听回鹘美人之事？我可以告诉你：回鹘第一美人所穿衣服有#G紫色#W没有#G绿色#W。",
							    text2="\t今早四位回鹘美人我见到了：回鹘第一美人所穿衣服有#G红色#W和#G蓝色#W。",
								  text3="\t回鹘第一美人？我可以很肯定的说：回鹘第一美人今日所穿衣服有#G白色#W。",
								  text4="\t我敢断定：衣服上有#G黄色#W的人，必不是回鹘第一美人。",
								 answer="\t你现在知道谁是回鹘第一美人了吗？\n\t是#G药罗葛丽#W？#G古力裴娜#W？#G黠多丽罗#W？还是#G顿英贺宁#W？\n\t#Y(您可以在任务攻略中查看知情人说过的话，以便分析。)",
									answer1="是药罗葛丽",
									answer2="是古力裴娜",
									answer3="是黠多丽罗",
									answer4="是顿英贺宁",
								
								  gonglue1="#G衣服上有紫色没有绿色#W",
								  gonglue2="#G衣服上有红色和蓝色#W",
								  gonglue3="#G衣服上有白色#W",
								  gonglue4="#G衣服上没有黄色#W",
							
							  	result = 4  
          
							  }
							   }	
				

x300581_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}



function x300581_GetQuestId( varMap, varPlayer )
	return x300581_var_QuestId
end

function x300581_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300581_var_LevelLess then
       return
    end

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300581_var_QuestName,8,1);
	else
		

		
		

	end


	
end





function x300581_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest )>0 then
		if varExt==30 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x300581_var_QuestName)
				TalkAppendString(varMap,"\t连你也慕名而来了？可是究竟谁是回鹘第一美人呢？")
				TalkAppendButton(varMap, varMyQuest, "交给我吧",2,31);
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300581_var_FileId, varMyQuest);
			return
		elseif varExt ==31 then
			x300581_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest,1)
			return
		end
	end
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest )>0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

		

		local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
		local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

		if varCompleted>0 then
			local bAnswerQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

			if bAnswerQuestion>1 then
				x300581_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
			else
				if varExt==7 then
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
						TalkAppendString(varMap,x300581_var_QuestionTextList[varQuestion].info)
						TalkAppendButton(varMap, varMyQuest, "我知道谁是回鹘第一美人！",2,20);
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300581_var_FileId, varMyQuest);
				elseif varExt==20 then
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
						
						
						TalkAppendString(varMap,x300581_var_QuestionTextList[varQuestion].answer)
						
						TalkAppendButton(varMap, varMyQuest, x300581_var_QuestionTextList[varQuestion].answer1,2,21);
						TalkAppendButton(varMap, varMyQuest, x300581_var_QuestionTextList[varQuestion].answer2,2,22);
						TalkAppendButton(varMap, varMyQuest, x300581_var_QuestionTextList[varQuestion].answer3,2,23);
						TalkAppendButton(varMap, varMyQuest, x300581_var_QuestionTextList[varQuestion].answer4,2,24);
						
						
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300581_var_FileId, varMyQuest);
				elseif varExt>=21 then
					local varAnswer = varExt-20
					local nResult = x300581_var_QuestionTextList[varQuestion].result;

					if nResult == varAnswer then
						x300581_ShowTips(varMap, varPlayer, "你果然聪慧，所料不错！")
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 2 )
						x300581_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
						
					
					else
						x300581_ShowTips(varMap, varPlayer, "你果然猜错了，再去找先生们问问吧！")
						x300581_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest,2)
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

		x300581_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varMyQuest,iIndex )

	
	else
		
		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			x300581_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		else
			if varExt==7 then 
				
				
				
			else
				
				x300581_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			end
		end
	end
end


function x300581_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )

	return 1;

end

function x300581_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300581_var_LevelLess then
		x300581_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300581_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    local day = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_SNZX_DATE[1], MD_SNZX_DATE[2],MD_SNZX_DATE[3] ) == day then
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

function x300581_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	
	if x300581_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300581_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300581_var_FileId, 0, 0, 0,1)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x300581_var_QuestName;
		x300581_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )
		GamePlayScriptLog(varMap, varPlayer, 1541)
		return 1
	else
		
		x300581_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300581_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest, varExt)
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )

	local varQuestion = random(1,x300581_var_QuestionCount)
		
	

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, varQuestion )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )  
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 0 )

	x300581_ShowQuestion( varMap, varPlayer, varTalknpc,varQuest,varQuestion, varExt )

	x300581_QuestLogRefresh( varMap, varPlayer, varMyQuest );
end

function x300581_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300581_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务："..x300581_var_QuestName;
	    x300581_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_SNZX_DATE[1], MD_SNZX_DATE[2], MD_SNZX_DATE[3], varToday)
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
		x300581_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300581_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	


	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	
	if x300581_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		if x300581_GiveReward(varMap,varPlayer,varButtonClick)>0 then
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
            LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300581_var_QuestId)

			local varStr = "您完成了任务："..x300581_var_QuestName;
			x300581_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

            SetPlayerGameData(varMap, varPlayer, MD_SNZX_DATE[1], MD_SNZX_DATE[2], MD_SNZX_DATE[3], GetDayOfYear() )

			GamePlayScriptLog(varMap, varPlayer, 1542)
			
		else
			x300581_ShowTips(varMap, varPlayer, "交任务失败")
		end
		end
		
	end
end

function x300581_GiveReward( varMap, varPlayer, varRadioSelected)
	
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

    -- find item index
    local index = 0
    for i, item in x300581_var_RewardTable do
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
    for varI, item in x300581_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300581_var_QuestId)
        local strLog = format( "DayCommon: Error in 300581! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("您获得了物品：@itemid_%d",varId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)


	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
--得物品	
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
	

	
	return 1;
	
end



function x300581_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
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






function x300581_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300581_var_QuestName)
	TalkAppendString(varMap,"\t前些日子，回鹘王子来我们王府做客，献上了四位绝色的回鹘美人。不过这四位美人，却给我这个管家带来不少麻烦……")
	TalkAppendString( varMap,"#Y任务目标：")
			
	TalkAppendString( varMap,x300581_var_QuestTarget)
			
	TalkAppendString(varMap," ")

	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300581_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
		
		
	

	
		
	
	
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300581_var_FileId, varQuest,0);
end





function x300581_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
		TalkAppendString(varMap,"\t你还没找出谁是回鹘第一美人？")
		TalkAppendString(varMap,"\n#G小提示#W：")
		TalkAppendString(varMap,"\t可以询问一下赵王客卿，兴许能有线索。")

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300581_var_FileId, varQuest,0);
	


end










function x300581_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
		TalkAppendString(varMap,"\n\t年轻人果然不凡啊，这点心意还请你收下。")
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300581_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
		
		
	

	
		
	
	
	
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300581_var_FileId, varMyQuest);

end





function x300581_ShowQuestion( varMap, varPlayer, varTalknpc,varQuest,varQuestion, varExt )


	if varExt==1 then
		StartTalkTask(varMap)
			
			TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
	
			TalkAppendString( varMap,x300581_var_QuestionTextList[varQuestion].info)
		
			
		StopTalkTask()
	elseif varExt==2 then
		StartTalkTask(varMap)
			
			TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
			
			TalkAppendString( varMap,"\t不对不对，和本王的判断完全不一样。\n\t你再去仔细问问吧。\n\t#G（您回答错了，看来只好回去重新询问。）")
		
			
		StopTalkTask()
	
	else
		return	
	end
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300581_var_FileId, varQuest,1);
	


end


function x300581_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varQuest,iIndex )
	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, iIndex-1, 1 )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local value3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	local value4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )

	if value1*value2*value3*value4>0 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		
	end
	
	x300581_QuestLogRefresh( varMap, varPlayer, varMyQuest );

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300581_var_QuestionTextList[varQuestion].title)
		
		if iIndex==1 then
			TalkAppendString(varMap,x300581_var_QuestionTextList[varQuestion].text1)
		elseif iIndex==2 then
			TalkAppendString(varMap,x300581_var_QuestionTextList[varQuestion].text2)
		elseif iIndex==3 then
			TalkAppendString(varMap,x300581_var_QuestionTextList[varQuestion].text3)
		elseif iIndex==4 then
			TalkAppendString(varMap,x300581_var_QuestionTextList[varQuestion].text4)
		end
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300581_var_FileId, varMyQuest,0);

	

end








function x300581_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300581_GetQuestName(varMap,varPlayer),        
							x300581_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300581_GetReplyNpcId(varMap,varPlayer),			
							x300581_GetQuestMethod(varMap,varPlayer),               
							x300581_GetQuestText(varMap,varPlayer),	
							x300581_GetQuestHelp(varMap,varPlayer)					
							)
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300581_var_RewardTable do
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

function x300581_GetQuestName(varMap,varPlayer)
	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep==0 then
		return ""..x300581_var_QuestName;
	end

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local varStr = x300581_var_QuestionTextList[varQuestion].title

	return varStr
end

function x300581_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep==0 then
		
		return "  #Y任务回复:#G@npc_"..x300581_var_ReplyNpcId;
	end
	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local nQuestStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local value3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	local value4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )

	local strTable = "  ";
	local str1 = strTable..(x300581_var_QuestionTextList[varQuestion].task1)..format("(%d/1)",value1)
	local str2 = "\n"..strTable..(x300581_var_QuestionTextList[varQuestion].task2)..format("(%d/1)",value2)
	local str3 = "\n"..strTable..(x300581_var_QuestionTextList[varQuestion].task3)..format("(%d/1)",value3)
	local str4 = "\n"..strTable..(x300581_var_QuestionTextList[varQuestion].task4)..format("(%d/1)",value4)

	if value1>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end
	if value2>=1 then
		str2 = "#G"..str2
	else
		str2 = "#W"..str2
	end
	if value3>=1 then
		str3 = "#G"..str3
	else
		str3 = "#W"..str3
	end
	if value4>=1 then
		str4 = "#G"..str4
	else
		str4 = "#W"..str4
	end

	return str1..str2..str3..str4
end

function x300581_GetReplyNpcId(varMap,varPlayer)
	return x300581_var_ReplyNpcId;
end

function x300581_GetQuestMethod(varMap,varPlayer)
	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local nQuestStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local value3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	local value4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )

	local varStr=""

	if nQuestStep>0 then
		
		varStr = x300581_var_QuestTarget1
		
		if value1>=1 then
			varStr=varStr.."\n  张申算说："..x300581_var_QuestionTextList[varQuestion].gonglue1;
		end
		if value2>=1 then
			varStr=varStr.."\n  阎必忠说："..x300581_var_QuestionTextList[varQuestion].gonglue2;
		end
		if value3>=1 then
			varStr=varStr.."\n  霍身先说："..x300581_var_QuestionTextList[varQuestion].gonglue3;
		end
		if value4>=1 then
			varStr=varStr.."\n  只天明说："..x300581_var_QuestionTextList[varQuestion].gonglue4;
		end
		
		
	else
		varStr = x300581_var_QuestTarget
	end

	return varStr
end

function x300581_GetQuestText(varMap,varPlayer)
	return "\t这四位美人，真是各有千秋啊，不日就是皇上大寿，我准备选其中最好的一名献给陛下，可是我这府内众说纷纭，始终无法在这四人中选出最出色的女子，甚是愁人啊。\n\t莫不如，你去问问我府内的四位先生们，看看他们是何看法？"
end

function x300581_GetQuestHelp(varMap,varPlayer)
	return "\t如何寻找回鹘第一美人。先要记住赵王客卿们#R话中的提示#G，进行总结，然后依照提示#R观察回鹘美人的衣着#G；那么你就会找到答案。"
end



function x300581_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300581_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300581_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if GetGameOpenById(x300581_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300581_var_QuestId) == 0 then
		x300581_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	local varMyQuest = x300581_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	if varTalkNpcGUID == x300581_var_ReplyNpcId then
		local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
		
		if varStep==0 then
			TalkAppendButton(varMap, x300581_var_QuestId, x300581_var_QuestName,2,30);
		elseif varStep>0 then
			local varState = GetQuestStateNM(varMap, varPlayer, varTalkNpcGUID, varMyQuest);

		
			TalkAppendButton(varMap, varMyQuest, x300581_var_QuestName,varState,varState);
		end
	
	else
		local bFind =0;
		local iIndex=0
		for varI,item in x300581_var_NpcList do
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



		
		local value = GetQuestParam( varMap, varPlayer, varQuestIdx, iIndex-1)

		if value==0 then


			TalkAppendButton(varMap, x300581_var_QuestId, x300581_var_QuestionTextList[varQuestion].title,2,iIndex+10);
		end
	end
	

	
end

function x300581_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end








