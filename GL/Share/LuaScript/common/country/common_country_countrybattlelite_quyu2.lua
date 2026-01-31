


--DECLARE_QUEST_INFO_START--
x310141_var_FileId              = 310141
x310141_var_Time					= { min = 1600,max = 1659 }	
x310141_var_minsterGuid			= 129741					
x310141_var_PreTime				=  0
x310141_var_AreaTipsInterval		=  2						
x310141_var_AreaTips				= "#R警报！敌国正在攻击我国边境玉门关#aB{goto_%d,%d,%d}(%d,%d)#aE的玉门关守备，请火速救援！"
--DECLARE_QUEST_INFO_STOP--

function x310141_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	local hour,minute,sec =GetHourMinSec(); 
	local now = hour *100 + minute
	if now < x310141_var_Time.min or now > x310141_var_Time.max then
		return
	end
	
	local nCurMin = GetMinOfYear()  
	local nInterval = nCurMin - x310141_var_PreTime
	if nInterval < x310141_var_AreaTipsInterval then
		return	
	end
	
	local varCountry = -1
	local varX =0
	local z= 0
	if varMap == 51 then
		varCountry = 0
		varX = 313
		z = 205
	elseif varMap == 151 then
		varCountry = 1
		varX = 313
		z = 205
	elseif varMap == 251 then
		varCountry = 2
		varX = 313
		z = 205
	elseif varMap == 351 then
		varCountry = 3
		varX = 313
		z = 205
	else
		return
	end
	if varCountry == GetCurCountry(varMap,varPlayer) then  
		return
	end
		--如果是镖车.退出
	if GetObjType(varMap, varPlayer) == 9 then
		return
	end	
	
	if LuaCallNoclosure(310150,"IsMonsterValid_x51",varMap,2 ) == 1 then
		x310141_var_PreTime = nCurMin
		local varMsg = format( x310141_var_AreaTips,varMap,varX,z,varX,z)
		local msg3 ="#R边境玉门关附近国家军力受到敌国袭击！"
		LuaAllScenceM2Country( varMap,varMsg,varCountry, 2,1)
		LuaAllScenceM2Country( varMap,msg3,varCountry, 5,1)
	end
end

function x310141_ProcMapTimerTick( varMap, now )

end


function x310141_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )

end
