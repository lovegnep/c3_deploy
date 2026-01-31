
--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--3001.lua
------------------------------------------------------------------------------------------
--糖果的默认脚本

--脚本号
x430602_var_FileId = 430602 

--需要的等级

--效果的ID
x430602_var_Buf1 = {
	[12271000]={buff = 32598,itemtype=1,tip = "#Y你获得了快马扬鞭效果，你的移动速度会有显着提升",}, 	--单体加速40%
	[12271001]={buff = 32599,itemtype=2,tip = "#Y你获得全军突击效果，周围玩家移动速度都有共同提升",}, 	--群体加速30%
	[12271002]={buff = 32600,itemtype=4,tip = "#R你遭到绊马绳套，被定身在原地",},         	--群体定身   
	[12271003]={buff = 32601,itemtype=4,tip = "#R你陷入了泥潭，周围玩家行动均受到阻碍",}, 	--群体减速30%
	[12271004]={buff = 32602,itemtype=5,tip = "#R你的膝盖中了一箭，移动速度受到很大限制",}, 	--单体减速50%
	[12271005]={buff = 32603,itemtype=10,tip = "#Y你消失在了敌人的视野中",},                 	--单体隐身  
	[12271006]={buff = 32579,itemtype=10,tip = "#Y你获得了强效加速效果，移动速度得到极大提升"},		--单体加速加强版   
	[12271007]={buff = 32580,itemtype=40,tip = "#R你遭到强效减速效果，移动速度受到严重阻碍"},		--单体减速加强版   
	[12271008]={buff = 32581,itemtype=10,tip = "#Y你拨开了迷雾，能看到隐身的单位"},		--范围反隐      
	[12271009]={buff = 32582,itemtype=10,tip = "#Y你无人能敌了"},		--无敌              
	[12271010]={buff = 32583,itemtype=10,tip = "#Y你获得了回血效果，生命正在迅速恢复"},		--百分比回血，5%
	[12271011]={buff = -1 ,  itemtype=3,tip = "#R坐骑受到惊吓，弃你而逃，你落马了"}, 	--落马	 
} 
  

  
  


function x430602_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x430602_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end
--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x430602_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x430602_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x430602_ProcDeplete( varMap, varPlayer )
	
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x430602_ProcActivateOnce( varMap, varPlayer )
	

	
	local bagIndex = GetBagIndexOfUsedItem( varMap, varPlayer)
	local itemInBag = GetItemIDByIndexInBag(varMap, varPlayer, bagIndex)	
	
	local x430602_var_currentitemID = -1	
	for id, v in x430602_var_Buf1 do
		if id == itemInBag then
			x430602_var_currentitemID =  id
			break    
		end
	end	
		
	local buffstate = -1
	local buffid =x430602_var_Buf1[x430602_var_currentitemID].buff
	local bufftype = x430602_var_Buf1[x430602_var_currentitemID].itemtype
	
	local minute = GetMinOfDay()
	local count = GetItemCountInBag(varMap, varPlayer,itemInBag)

	if minute <19*60+30  then
		if bufftype == 1 or bufftype == 2 or bufftype ==4 or bufftype ==5 then
		DelItemByIDInBag(varMap, varPlayer,itemInBag,count)
		Msg2Player(varMap, varPlayer, "现在不是赛马大会时间，道具删除", 0, 3)
		return
		end
		Msg2Player(varMap, varPlayer, "现在不是赛马大会时间，无法使用道具", 0, 3)
		return
	end
	if minute >20*60  then
		if bufftype == 1 or bufftype == 2 or bufftype ==4 or bufftype ==5 then
		DelItemByIDInBag(varMap, varPlayer,itemInBag,count)
		Msg2Player(varMap, varPlayer, "现在不是赛马大会时间，道具删除", 0, 3)
		return
		end
		Msg2Player(varMap, varPlayer, "现在不是赛马大会时间，无法使用道具", 0, 3)
		return
	end
				
	if IsQuestHaveDone(varMap, varPlayer, 10284) > 0 then
		Msg2Player(varMap, varPlayer, "你已经完成赛马，无法再使用道具", 0, 3)
		return 
	end
	if IsHaveQuest(varMap,varPlayer, 10284) <= 0 then
		Msg2Player(varMap, varPlayer, "你没有在赛马，无法使用道具", 0, 3)
		return
	end
	
	
	--增加地图使用限制
	local mapid = {0,37,44,569}
	local temp = 1
	for k,v in mapid do
		if v == varMap then
			temp = 0
			break
		end
	end
	if temp ==1 then
		Msg2Player(varMap, varPlayer, "不在赛马地图，无法使用该道具", 0, 3)
		return
	end
	
	
	if bufftype == 1 or   bufftype == 10  then	
		if(-1~=buffid) then
			if IsHaveQuest(varMap, varPlayer,10284)==1 then 
				buffstate = SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buffid, 0);
				StartTalkTask(varMap);
				TalkAppendString(varMap,x430602_var_Buf1[x430602_var_currentitemID].tip );
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end			
		end
	elseif bufftype ==5 then

		local tagetid = GetTargetObjID(varMap,varPlayer)
		if(-1~=buffid) then
			if IsHaveQuest(varMap, tagetid,10284)==1 then
				buffstate = SendSpecificImpactToUnit(varMap, tagetid, tagetid, tagetid, buffid, 0);
				StartTalkTask(varMap);
				TalkAppendString(varMap,x430602_var_Buf1[x430602_var_currentitemID].tip );
				StopTalkTask();
				DeliverTalkTips(varMap, tagetid);
				Msg2Player(varMap, varPlayer, "你使用了膝盖中箭，目标移动速度受到很大限制", 0, 3)
			end
		end		
	elseif bufftype ==2 then
	
		local varX,z = GetWorldPos(varMap,varPlayer)
		local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
			if humanObjId ~= -1 then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 and IsHaveQuest(varMap, humanObjId,10284)==1 then
					buffstate = SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffid, 0)
					StartTalkTask(varMap);
					TalkAppendString(varMap,x430602_var_Buf1[x430602_var_currentitemID].tip );
					StopTalkTask();
					DeliverTalkTips(varMap, humanObjId);
				end
			end
		end

	elseif bufftype ==3 then
	
		local tagetid = GetTargetObjID(varMap,varPlayer)
		local varX,z = GetWorldPos(varMap,tagetid)
		local Num =  GetNearPlayerCount(varMap, tagetid,varX,z,15)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, tagetid,varI);
			if humanObjId ~= -1 and humanObjId~=varPlayer and IsHaveQuest(varMap, humanObjId,10284)==1  then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 then
					ReCallHorse(varMap,humanObjId)
					StartTalkTask(varMap);
					TalkAppendString(varMap,x430602_var_Buf1[x430602_var_currentitemID].tip );
					StopTalkTask();
					DeliverTalkTips(varMap, humanObjId);
					buffstate = 1
				end
			end
		end
			
		
	elseif bufftype ==4 or bufftype ==40 then
		
		local tagetid = GetTargetObjID(varMap,varPlayer)
		local varX,z = GetWorldPos(varMap,tagetid)
		local Num =  GetNearPlayerCount(varMap, tagetid,varX,z,15)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, tagetid,varI);
			if humanObjId ~= -1 and humanObjId~=varPlayer and IsHaveQuest(varMap, humanObjId,10284)==1  then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 then
					buffstate = SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffid, 0)
					StartTalkTask(varMap);
					TalkAppendString(varMap,x430602_var_Buf1[x430602_var_currentitemID].tip );
					StopTalkTask();
					DeliverTalkTips(varMap, humanObjId);
				end
			end
		end
		
	end

	if buffstate > 0 then
	 	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			return 1;
		end
	end

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x430602_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
