











x700027_CSP_FUBENTYPE				= 	0
x700027_CSP_SCRIPTID				=	1
x700027_CSP_TICKCOUNT				= 	2
x700027_CSP_FROMSCENEID				= 	3
x700027_CSP_ISCLOSING				= 	4
x700027_CSP_LEAVECOUNTDOWN			= 	5
x700027_CSP_TEAMID					=	6
x700027_CSP_BACKSCENEX       		=   7
x700027_CSP_BACKSCENEZ      		=   8
x700027_CSP_FUBENLEVEL			=	9

x700027_CSP_KILLCOUNT				=	20
x700027_CSP_FUBEN_SCENE_ID			=	21
x700027_CSP_BOSS1_ID				=	22

x700027_B_CREATE_RANDOMBOSS			=	230
x700027_CSP_RANDOM_BOSS_ID			=	231
x700027_RANDOMBOSS_FLAG				=	232

x700027_CSP_XIANJINBOSS				=	239

x700027_CSP_HUMAN_COUNT				=	240
x700027_CSP_OBJID_START				=	241
x700027_CSP_GUID_START              =   248  
x700027_CSP_FUBEN_TYPE				=	254	

x700027_CSP_FUBEN_MODE				=   255 



x700027_var_FileId 					= 700027

x700027_var_RandomBossRate			=   1

x700027_var_RandomMonsterRate			=	0.04

x700027_var_SubmitNPC                 =   { type =25041,guid= 150541,varX = 23, z=68, facedir =0, title ="" }



x700027_var_Boss_Random_Pos			={
										{varX=75,z=110 },
										{varX=106,z=106},
										{varX=71,z=70  },
										{varX=96,z=35  },
										{varX=66,z=31  },
										{varX=80,z=92  }
									 }














function x700027_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	
end



function x700027_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700027_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700027_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700027_CSP_XIANJINBOSS, -1 )
	x700027_CreateBoss( varMap )
	x700027_CreateRandomBoss( varMap )
    x700027_CreateMonster( varMap )

	
		
end

function x700027_EnterTick(varMap,nowTickCount)
end


function x700027_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700027_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700027_CSP_FUBEN_TYPE)
		
	local nIndexFrom = GetFubenDataPosByScriptID(x700027_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700027_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700027_var_FileId,nIndexFrom,varI)
		if idScript == x700027_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title ~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700027_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700027_var_FileId, -1, 21,-1, facedir)
			
			end
			
			SetFubenData_Param(varMap, x700027_CSP_BOSS1_ID, varRet )
			break;
				
        end
	end

end

function x700027_CreateRandomBoss(varMap)


	local rate = random(0,100)/100;
	if rate>= x700027_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,0)

	

	local fubenlevel = GetFubenData_Param(varMap, x700027_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700027_CSP_FUBEN_TYPE)

	local nLen =0;
	for varI, item in x700027_var_Boss_Random_Pos do
		nLen = nLen+1
	end

	local n = random(1,nLen)
	
	local varX=x700027_var_Boss_Random_Pos[n].varX;
	local z=x700027_var_Boss_Random_Pos[n].z;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700027_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700027_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700027_var_FileId,nIndexFrom,varI)
		if idScript == x700027_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			if varFlag == nFlag then
				if title ~="" then
					CreateMonster(varMap, type, varX,z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX,z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
		end
	end

	

end








function x700027_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700027_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700027_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700027_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700027_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700027_var_FileId,nIndexFrom,varI)
		if idScript == x700027_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title ~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end


	

end

function x700027_CreateRandomMonster(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700027_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	local rate = random(0,100)/100;
	local nStdRate = x700027_var_RandomMonsterRate
	local nFubenMode = GetFubenData_Param(varMap, x700027_CSP_FUBEN_MODE)
	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	if rate>= nStdRate then
		return 0;
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700027_CSP_FUBENLEVEL ) ;


	
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700027_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700027_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700027_var_FileId,nIndexFrom,varI)
		if idScript == x700027_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700027_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700027_var_FileId, -1, 21,-1,facedir)
				
				end

				SetFubenData_Param(varMap, x700027_B_CREATE_RANDOMBOSS, 1)
				SetFubenData_Param(varMap, x700027_RANDOMBOSS_FLAG, nFlag)

				SetFubenData_Param(varMap, x700027_CSP_RANDOM_BOSS_ID, nBossID)


			end
		end
	end

	x700027_ShowTipsToAll(varMap, "Õ½ÉñÔÙÏÖ£¡")

end



function x700027_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700027_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local nDieCount = GetFubenData_Param(varMap, x700027_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700027_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	local objId1 = GetFubenData_Param(varMap, x700027_CSP_BOSS1_ID)

	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700027_B_CREATE_RANDOMBOSS)

	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700027_CSP_RANDOM_BOSS_ID)
		if nRandomBossId==varPlayer then
			
			
			
			
			
			local nKillerType = GetObjType(varMap, varKiller)
			local nOwnerId = varKiller
			if nKillerType== 3 then
				nOwnerId = GetOwnerID(varMap, varKiller)
				
			end
			
			local strPlayerName = GetName(varMap, nOwnerId)
			
			local varCountry = GetCurCountry( varMap, nOwnerId )
			local strCountryName = "";
			if varCountry==0 then
				strCountryName = "Â¥À¼"
			elseif varCountry==1 then
				strCountryName = "ÌìÉ½"
			elseif varCountry==2 then
				strCountryName = "À¥ÂØ"
			elseif varCountry==3 then
				strCountryName = "¶Ø»Í"
			end

			local strHorseName = ""

			local nHorseFlag = GetFubenData_Param(varMap, x700027_RANDOMBOSS_FLAG)
			local fubenlevel = GetFubenData_Param(varMap, x700027_CSP_FUBENLEVEL )
			
			if fubenlevel < 50 then
				if nHorseFlag==0 then
					strHorseName = "Ð×±ª"
				elseif nHorseFlag==1 then
					strHorseName = "±¼Áç"
				elseif nHorseFlag==2 then
					strHorseName = "Ìì¶ì"
				elseif nHorseFlag==3 then
					strHorseName = "ºÓÂí"
				end
			elseif fubenlevel < 70 then
				if nHorseFlag==0 then
					strHorseName = "ÁÒÊ¨"
				elseif nHorseFlag==1 then
					strHorseName = "Ñ±Â¹"
				elseif nHorseFlag==2 then
					strHorseName = "Èðº×"
				elseif nHorseFlag==3 then
					strHorseName = "ÌúÏ¬"
				end
			elseif fubenlevel < 80 then
				if nHorseFlag==0 then
					strHorseName = "½£³Ý»¢"
				elseif nHorseFlag==1 then
					strHorseName = "ÂùÅ£"
				elseif nHorseFlag==2 then
					strHorseName = "·ï»Ë"
				elseif nHorseFlag==3 then
					strHorseName = "¾ÞÏó"
				end
			elseif fubenlevel < 110 then
				if nHorseFlag==0 then
					strHorseName = "ó¤Áú"
				elseif nHorseFlag==1 then
					strHorseName = "Ó¦Áú"
				elseif nHorseFlag==2 then
					strHorseName = "±©Áú"
				elseif nHorseFlag==3 then
				strHorseName = "¿üÁú"
				end
			elseif fubenlevel < 130 then
				if nHorseFlag==0 then
					strHorseName = "ó¤Áú"
				elseif nHorseFlag==1 then
					strHorseName = "Ó¦Áú"
				elseif nHorseFlag==2 then
					strHorseName = "±©Áú"
				elseif nHorseFlag==3 then
					strHorseName = "¿üÁú"
				end
			else
				if nHorseFlag==0 then
					strHorseName = "ó¤Áú"
				elseif nHorseFlag==1 then
					strHorseName = "Ó¦Áú"
				elseif nHorseFlag==2 then
					strHorseName = "±©Áú"
				elseif nHorseFlag==3 then
					strHorseName = "¿üÁú"
				end
			end



			local strMapName = "ÙªÂÞ¼Í"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."µÄ"..strPlayerName.."´ò°ÜÁË"..strMapName.."µÄ¾Åì¸Õ½Éñ£¬¾Åì¸¶ªÏÂ"..strHorseName.."Âä»Ä¶øÌÓ£¡", 5, 1)
			
			
			
		end
	end
	
	
	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700027_CSP_BOSS1_ID, -1)
		
		x700027_CreateSubmitNpc( varMap)

		x700027_CreateRandomMonster(varMap)






























	end
end

function x700027_ProcAllMonsterDead( varMap)
	
end

function x700027_CreateSubmitNpc( varMap)
	 x700027_ShowTipsToAll( varMap, "¸±±¾Íê³É")
	if x700027_var_SubmitNPC.title~= "" then
		CreateMonster(varMap, x700027_var_SubmitNPC.type, x700027_var_SubmitNPC.varX, x700027_var_SubmitNPC.z, 3, 0, -1, x700027_var_SubmitNPC.guid, -1,-1,x700027_var_SubmitNPC.facedir, "", x700027_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700027_var_SubmitNPC.type, x700027_var_SubmitNPC.varX, x700027_var_SubmitNPC.z, 3, 0, -1, x700027_var_SubmitNPC.guid, -1,-1,x700027_var_SubmitNPC.facedir)
		
	end

	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	
	LuaCallNoclosure( 701113, "ProcSceneBossDie", varMap, 2)
	LuaCallNoclosure( 701114, "ProcSceneBossDie", varMap, 2)

	
	 x700027_CreateXianJinBoss(varMap)
	 
end





function x700027_CreateXianJinBoss(varMap)
	
	local nFubenType = GetFubenData_Param(varMap, x700027_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700027_CSP_FUBEN_MODE)

	if nFubenMode == 0  then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700027_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700027_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700027_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700027_var_FileId,nIndexFrom,varI)
		if idScript == x700027_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700027_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700027_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700027_CSP_XIANJINBOSS, varRet )
		end
	end

	x700027_ShowTipsToAll(varMap, "·­·¬±¦Ïä³öÏÖ£¡")
end





