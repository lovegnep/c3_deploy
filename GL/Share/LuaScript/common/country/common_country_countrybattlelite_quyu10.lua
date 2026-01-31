


--DECLARE_QUEST_INFO_START--
x310149_var_FileId              = 310149
x310149_var_Time					= { min = 1600,max = 1659 }	
x310149_var_minsterGuid			= 129749					
x310149_var_PreTime				=  0
x310149_var_AreaTipsInterval		=  2						
x310149_var_AreaTips				= "#R警报！敌国正在攻击我国王城内#aB{goto_%d,%d,%d}(%d,%d)#aE的镇国上将军，请火速救援！"
--DECLARE_QUEST_INFO_STOP--

function x310149_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local hour,minute,sec =GetHourMinSec(); 
	local now = hour *100 + minute
	if now < x310149_var_Time.min or now > x310149_var_Time.max then
		return
	end
	
	local nCurMin = GetMinOfYear()  
	local nInterval = nCurMin - x310149_var_PreTime
	if nInterval < x310149_var_AreaTipsInterval then
		return	
	end
	
	local varCountry = -1
	local varX =0
	local z= 0
	if varMap == 50 then
		varCountry = 0
		varX = 255
		z = 170
	elseif varMap == 150 then
		varCountry = 1
		varX = 255
		z = 170
	elseif varMap == 250 then
		varCountry = 2
		varX = 255
		z = 170
	elseif varMap == 350 then
		varCountry = 3
		varX = 255
		z = 170
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
	
	if LuaCallNoclosure(310150,"IsMonsterValid_x50",varMap,8 ) == 1 then
		x310149_var_PreTime = nCurMin
		local varMsg = format( x310149_var_AreaTips,varMap,varX,z,varX,z)
		local msg3 ="#R王城内的镇国上将军受到敌国袭击！"
		LuaAllScenceM2Country( varMap,varMsg,varCountry, 2,1)
		LuaAllScenceM2Country( varMap,msg3,varCountry, 5,1)
	end
end

function x310149_ProcMapTimerTick( varMap, now )

end


function x310149_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )

end
