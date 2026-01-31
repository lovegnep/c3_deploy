--春节活动之新春好礼

x310805_g_ScriptId = 310805;
x310805_g_GameOpenId = 0;
x310805_g_HongbaoId = 11000352; --新年红包id


--新年礼盒创建信息
x310805_g_NPCInfo = { monsterId = 81, objQuestId = 400825,  liveTime = 30 * 60 * 1000, campId = 0, baseAI = 0, highAI = 0 };

--NPC生成配置表，就是配置新年礼盒的生成位置
x310802_g_CreateNPCConfigTb = {

			--大都南
			{sceneId=36, pos={ {posX= 82,posZ=206}, {posX=156,posZ=233}, 
												 {posX=156,posZ=233}, {posX=199,posZ=226},
												 {posX=145,posZ=179}, {posX=42 ,posZ=186}, 
												 {posX= 26,posZ=221}, {posX=120,posZ=226},
												 {posX=166,posZ=150}, {posX=27 ,posZ=108}, 
												 {posX= 67,posZ=146}, {posX=34 ,posZ=157},
												 {posX= 57,posZ=232}, {posX=159,posZ=203}, 
												 {posX=120,posZ=156}, {posX=235,posZ=95 },
												 {posX=228,posZ=158}, {posX=88 ,posZ=169},
												 {posX=119,posZ=192}, {posX=190,posZ=208},
											 }	
			},

}

---------------------------------------------------------------------------------------------
--活动定时器刷新年礼盒
function x310805_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	
	--检查活动是否开启
	if x310805_g_GameOpenId > 0 and GetGameOpenById( x310805_g_GameOpenId ) <= 0 then
      return
  end

	--创建新年礼盒
	for i, item in x310802_g_CreateNPCConfigTb do
			if item.sceneId == SceneId then
				for j, itemPos in item.pos do
					CreateMonster( SceneId, 
											 	x310805_g_NPCInfo.monsterId,
												itemPos.posX,  
											 	itemPos.posZ,  
											 	x310805_g_NPCInfo.baseAI,
											 	x310805_g_NPCInfo.highAI,
												x310805_g_ScriptId, 
											 	x310805_g_NPCInfo.objQuestId,  
											  x310805_g_NPCInfo.campId,  
											  x310805_g_NPCInfo.liveTime,
											 	0,"","");	
																			 						
				end
			end
	end
end

---------------------------------------------------------------------------------------------
--点击新年礼盒后显示界面
function x310805_ProcEnumEvent( sceneId, selfId, NPCId, MissionId )

	  
end


function x310805_ProcEventEntry( sceneId, selfId, targetId, missionId, nExtIdx )
	
	StartTalkTask( sceneId )
		TalkAppendString( sceneId, "孩子，新年好啊，送你个红包, 你要不要？" ) 
	StopTalkTask( sceneId )
	
  DeliverTalkInfo( sceneId, selfId,  targetId, x310805_g_ScriptId, -1  )
	
end

---------------------------------------------------------------------------------------------
--点击确定
function x310805_ProcAccept( sceneId, selfId )
	
end

function x310805_ProcAcceptCheck( sceneId, selfId, NPCId )
	
	StartItemTask( sceneId )   
	ItemAppendBind( sceneId, x310805_g_HongbaoId, 1 )
	local ret = StopItemTask(sceneId,selfId)
	if ret > 0 then
		StartTalkTask(sceneId);
		TalkAppendString(sceneId,"您得到了一个红包！");
		StopTalkTask(sceneId);
		DeliverTalkTips(sceneId,selfId);
		DeliverItemListSendToPlayer(sceneId,selfId);
		DeleteMonster( sceneId, NPCId );
	else
		StartTalkTask(sceneId)
		TalkAppendString(sceneId,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
	end
	
	return 0
end



