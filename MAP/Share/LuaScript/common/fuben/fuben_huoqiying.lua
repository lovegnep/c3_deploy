











x700007_CSP_FUBENTYPE				= 	0
x700007_CSP_SCRIPTID				=	1
x700007_CSP_TICKCOUNT				= 	2
x700007_CSP_FROMSCENEID				= 	3
x700007_CSP_ISCLOSING				= 	4
x700007_CSP_LEAVECOUNTDOWN			= 	5
x700007_CSP_TEAMID					=	6
x700007_CSP_BACKSCENEX       		=   7
x700007_CSP_BACKSCENEZ      		=   8
x700007_CSP_FUBENLEVEL			=	9

x700007_CSP_KILLCOUNT				=	20
x700007_CSP_HP_BOSS1				= 	21
x700007_CSP_OBJID_BOSS1				=   22
x700007_CSP_FIND_NPC				=	23    
x700007_CSP_CREATEFLAG              =   24
x700007_CSP_AREA_TIMER				=	25
x700007_CSP_MONSTERCREATE			= 	26
x700007_CSP_BOSS2_ID				=	27
x700007_CSP_BOSS3_ID				=	28
x700007_CSP_BOSS4_ID				=	29
x700007_CSP_FUBEN_SCENE_ID			=	30

x700007_CSP_RANDBOSS_ID				=	31

x700007_CSP_OBJID_AREA				=	40


x700007_CSP_B_GETBUFF_START			=	234
x700007_CSP_HUMAN_COUNT				=	240
x700007_CSP_OBJID_START				=	241
x700007_CSP_GUID_START              =   248


x700007_CSP_FUBEN_MODE				=   255 






x700007_var_FileId 					= 700007

x700007_var_Buff1						=	13500 					
x700007_var_Buff2						=	13501                   

x700007_var_BuffImpact1				=	450                     
x700007_var_AreaTimer                 =   3*1000                    

x700007_var_RandomBossRate			=	0



x700007_var_SubmitNPC                 =   { type =25029,guid= 150529,varX = 44, z=55, facedir =0, title="" }






x700007_var_NpcType					=   25050					

x700007_var_NpcCreate					=	{
											{	hash=1, type=x700007_var_NpcType,	 	varX=69,	z=97,	ai=3, aiscript=-1,varObj = 150004,campid = -1,facedir =0, title="" },
										}









function x700007_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
	
end


function x700007_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700007_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700007_ProcFubenSceneCreated( varMap )
	

	local varIndex = x700007_CSP_OBJID_AREA
	for varI=varIndex,varIndex+11 do

		SetFubenData_Param(varMap, varI, -1 )
	end
	SetFubenData_Param(varMap, x700007_CSP_RANDBOSS_ID, -1 )
	
	local nCreateFlag = GetFubenData_Param(varMap, x700007_CSP_CREATEFLAG )
    
	if nCreateFlag == 0 then

		x700007_CreateBoss( varMap )
		x700007_CreateMonster( varMap )
		x700007_CreateNpc( varMap )

		SetFubenData_Param(varMap, x700007_CSP_CREATEFLAG,1 )

	end

	
	
		
end

function x700007_EnterTick(varMap, nowTickCount)

	x700007_ProcAreaTimer( varMap )
	local humancount = GetFuben_PlayerCount(varMap);

	
	
	local MonsterCreated = GetFubenData_Param(varMap,x700007_CSP_MONSTERCREATE)
	if MonsterCreated == 0 then
		local nHalfHP = GetFubenData_Param(varMap, x700007_CSP_HP_BOSS1 )
		local nObjId = GetFubenData_Param(varMap, x700007_CSP_OBJID_BOSS1 )
		nHalfHP = nHalfHP / 2
		local nMonsterCount = GetMonsterCount( varMap )

		
		for varI=0,nMonsterCount -1 do
			local varObj = GetMonsterObjID( varMap, varI )
			if varObj == nObjId then
				local hp = GetHp( varMap, varObj )

				
				if hp < nHalfHP then
					local varX,z = GetMonsterPosition(varMap,varObj)
					x700007_CreateMonster2(varMap,varX,z)
					SetFubenData_Param(varMap,x700007_CSP_MONSTERCREATE,1)
				end

			end
		end
	else
		local nHalfHP = GetFubenData_Param(varMap, x700007_CSP_HP_BOSS1 )
		local nObjId = GetFubenData_Param(varMap, x700007_CSP_OBJID_BOSS1 )
		nHalfHP = nHalfHP / 2
		local nMonsterCount = GetMonsterCount( varMap )
		for varI=0,nMonsterCount -1 do
			local varObj = GetMonsterObjID( varMap, varI )
			if varObj == nObjId then
				local hp = GetHp( varMap, varObj )
				if hp > nHalfHP then
					SetFubenData_Param(varMap,x700007_CSP_MONSTERCREATE,0)
				end

			end
		end
	end


		
end



function x700007_CreateBoss(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700007_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700007_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700007_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700007_var_FileId,nIndexFrom,varI)
		if idScript == x700007_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local varObj = 0
			if title~="" then
				varObj = CreateMonster(varMap, type, varX, z, ai, aiscript, x700007_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varObj = CreateMonster(varMap, type, varX, z, ai, aiscript, x700007_var_FileId, -1, 21,-1,facedir)
			
			end
			if patrolid>=0 then
				SetPatrolId(varMap, varObj, patrolid)
				
			end

            if varFlag == 0  then
			    local nFullHp = GetHp( varMap, varObj )
			    SetFubenData_Param(varMap, x700007_CSP_HP_BOSS1, nFullHp)
			    SetFubenData_Param(varMap, x700007_CSP_OBJID_BOSS1, varObj)
		    elseif varFlag == 1  then
				 SetFubenData_Param(varMap, x700007_CSP_BOSS2_ID, varObj)
		    elseif varFlag == 2  then
				 SetFubenData_Param(varMap, x700007_CSP_BOSS3_ID, varObj)
		    elseif varFlag == 3  then
				 SetFubenData_Param(varMap, x700007_CSP_BOSS4_ID, varObj)
			end

        end
	end

end




function x700007_CreateMonster(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700007_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700007_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700007_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700007_var_FileId,nIndexFrom,varI)
		if idScript == x700007_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local x1 = varX + rx
                local rz = random(-r,r)
                local z1 = z + rz

				if title~="" then
					CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end

end





function x700007_CreateMonster2(varMap,varX,z)  

	

    local fubenlevel = GetFubenData_Param(varMap, x700007_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700007_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700007_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700007_var_FileId,nIndexFrom,varI)
		if idScript == x700007_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end

end

function x700007_CreateNpc( varMap )
	for varI, item in x700007_var_NpcCreate do
		if item.title~="" then
			CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.varObj,-1,-1,item.facedir,  "",item.title);
		else
			CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.varObj,-1,-1,item.facedir);
		
		end
	end
end


function x700007_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700007_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700007_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	


	local objId2 = GetFubenData_Param(varMap, x700007_CSP_BOSS2_ID)
	local objId4 = GetFubenData_Param(varMap, x700007_CSP_BOSS4_ID)

	if objId2 == varPlayer then
		SetFubenData_Param(varMap, x700007_CSP_BOSS2_ID, -1)
		local humancount = GetFuben_PlayerCount(varMap);

		for varI = 0, humancount - 1 do


			local humanId = GetFuben_PlayerObjId(varMap, varI);	
			SendSpecificImpactToUnit(varMap, humanId,humanId,humanId, x700007_var_Buff1,0 )
			
		end
	end

	if objId4 == varPlayer then
		
		SetFubenData_Param(varMap, x700007_CSP_BOSS4_ID, -1)
		local bCreateRandom = x700007_CreateRandomBoss(varMap)
		if bCreateRandom==0 then
			x700007_ProcGameCompleted(varMap)
		end






























	end

	local objRandomBossId = GetFubenData_Param(varMap, x700007_CSP_RANDBOSS_ID ) ; 

	if objRandomBossId>=0 then
		if objRandomBossId== varPlayer then
			SetFubenData_Param(varMap, x700007_CSP_RANDBOSS_ID, -1 )
			x700007_ProcGameCompleted(varMap)
		end
	end



	
end

function x700007_ProcGameCompleted(varMap)
	
	local humancount = GetFuben_PlayerCount(varMap);
	for	j = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, j);
		local varStr = "勇士们，你们获得了最终的胜利！回到王城接受大家赞许的目光吧！";
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end

	x700007_CreateSubmitNpc( varMap)
end

function x700007_CreateRandomBoss(varMap)


	local rate = random(0,100)/100;
	if rate>= x700007_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,0)

	

	local fubenlevel = GetFubenData_Param(varMap, x700007_CSP_FUBENLEVEL ) ;


	
	local bCreated =0;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700007_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700007_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700007_var_FileId,nIndexFrom,varI)
		if idScript == x700007_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				
				local varRet = 0
				
				if title~="" then
					varRet = CreateMonster(varMap, type, varX,z, ai, aiscript, x700007_var_FileId, -1, 21,-1,facedir, "", title)
				else
					varRet = CreateMonster(varMap, type, varX,z, ai, aiscript, x700007_var_FileId, -1, 21,-1,facedir)
				
				end

				SetFubenData_Param(varMap, x700007_CSP_RANDBOSS_ID, varRet ) ; 
				bCreated = 1;
			end
		end
	end

	if bCreated>0 then
		local humancount = GetFuben_PlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			local varStr = "隐藏Boss出现";
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap, humanId);
		end
	end

	return bCreated;

end

function x700007_ProcAllMonsterDead( varMap)
	x700007_CreateSubmitNpc( varMap)
end

function x700007_CreateSubmitNpc( varMap)
	if x700007_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700007_var_SubmitNPC.type, x700007_var_SubmitNPC.varX, x700007_var_SubmitNPC.z, 3, -1, -1, x700007_var_SubmitNPC.guid, -1,-1,x700007_var_SubmitNPC.facedir,  "",x700007_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700007_var_SubmitNPC.type, x700007_var_SubmitNPC.varX, x700007_var_SubmitNPC.z, 3, -1, -1, x700007_var_SubmitNPC.guid, -1,-1,x700007_var_SubmitNPC.facedir)
	
	end

	
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700007_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700007_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
end





function x700007_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700007_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700007_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700007_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700007_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700007_var_FileId,nIndexFrom,varI)
		if idScript == x700007_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700007_ShowTipsToAll(varMap, "翻番宝箱出现！")
end










function x700007_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	
	local varScriptFileId = GetFubenData_Param(varMap, x700007_CSP_SCRIPTID);

	if varScriptFileId~=x700007_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcAreaEntered", varMap, varPlayer, varArea, varQuest)
		return
	end
	

     
    local nFind = 1
    local guid = GetPlayerGUID( varMap,varPlayer )

    
    

   
    
    

     
      
      
     
    


    
    if nFind == 0 then
        return
    end



	local varIndex = x700007_CSP_OBJID_AREA
	for varI=0,5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    if varObj == varPlayer then

	    	SetFubenData_Param(varMap, idx, varPlayer )
			SetFubenData_Param(varMap, idx+1, varArea )

	    	return
	    elseif varObj == -1 then

	        SetFubenData_Param(varMap, idx, varPlayer )
	        SetFubenData_Param(varMap, idx+1, varArea )
	        return
	    end
	end

end




function x700007_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )

	
	local varScriptFileId = GetFubenData_Param(varMap, x700007_CSP_SCRIPTID);

	if varScriptFileId~=x700007_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcAreaLeaved", varMap, varPlayer, varScript, varQuest)
		return
	end
	
    local varIndex = x700007_CSP_OBJID_AREA
	for varI=0,5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )
	    if varObj == varPlayer then
	        SetFubenData_Param(varMap, idx, -1 )
	        SetFubenData_Param(varMap, idx+1, -1 )
	    end
	end
end




function x700007_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	
end



function x700007_ProcAreaTimer( varMap )








	






	

    local varIndex = x700007_CSP_OBJID_AREA
	for varI=0,5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )
		
	    if varObj ~= -1 then

            
            local ErrorCode = LuaCallNoclosure( FUBEN_COMMON_SCRIPT_CALL, "IsPlayerErrorState", varMap, varObj)
            if ErrorCode == 0 then

				local nLevel  = GetLevel( varMap, varObj )
                local hurt = 200
				if nLevel>=60 then
					hurt =400
				end
                if varArea ~= 0 then
					
                    hurt = 500

					if nLevel>=60 then
						hurt =1000
					end
                end

                local haveImpact = IsHaveSpecificImpact( varMap, varObj, x700007_var_Buff1 )
				
                if haveImpact == 1 then
                    
					hurt = floor(hurt*0.1)	
                end

                local havehp = GetHp( varMap, varObj )
                local hp = havehp - hurt
                if hp < 0 then
                    hp = havehp -1
                    hp = -hp
                else
                    hp = -hurt
                end

                SetHp(varMap,varObj, hp )
            end
        end
	end
end





function x700007_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
end





function x700007_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end




function x700007_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end




function x700007_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end




function x700007_OpenCheck( varMap, varPlayer, varTalknpc )
end

function x700007_CloseTimer( varMap, TimerIndex )




end







