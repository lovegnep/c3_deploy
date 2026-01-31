


--DECLARE_QUEST_INFO_START--
x310148_var_FileId              = 310148
x310148_var_Time					= { min = 1600,max = 1659 }	
x310148_var_minsterGuid			= 129748					
x310148_var_PreTime				=  0
x310148_var_AreaTipsInterval		=  2						
x310148_var_AreaTips				= "#R警报！敌国正在攻击我国王城内#aB{goto_%d,%d,%d}(%d,%d)#aE的兵部尚书，请火速救援！"
--DECLARE_QUEST_INFO_STOP--

function x310148_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local hour,minute,sec =GetHourMinSec(); 
	local now = hour *100 + minute
	if now < x310148_var_Time.min or now > x310148_var_Time.max then
		return
	end
	
	local nCurMin = GetMinOfYear()  
	local nInterval = nCurMin - x310148_var_PreTime
	if nInterval < x310148_var_AreaTipsInterval then
		return	
	end
	
	local varCountry = -1
	local varX =0
	local z= 0
	if varMap == 50 then
		varCountry = 0
		varX = 291
		z = 189
	elseif varMap == 150 then
		varCountry = 1
		varX = 291
		z = 189
	elseif varMap == 250 then
		varCountry = 2
		varX = 291
		z = 189
	elseif varMap == 350 then
		varCountry = 3
		varX = 291
		z = 189
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
	
	if LuaCallNoclosure(310150,"IsMonsterValid_x50",varMap,7 ) == 1 then
		x310148_var_PreTime = nCurMin
		local varMsg = format( x310148_var_AreaTips,varMap,varX,z,varX,z)
		local msg3 ="#R王城内的兵部尚书受到敌国袭击！"
		LuaAllScenceM2Country( varMap,varMsg,varCountry, 2,1)
		LuaAllScenceM2Country( varMap,msg3,varCountry, 5,1)
	end
end

function x310148_ProcMapTimerTick( varMap, now )

end


function x310148_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )

end
