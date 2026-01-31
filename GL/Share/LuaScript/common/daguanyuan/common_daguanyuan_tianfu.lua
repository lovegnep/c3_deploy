x310373_var_FileId = 310373

x310373_var_Title = "【个人】上香请愿"

x310373_var_Single_Day_Cnt = 
{ 
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
}

x310373_var_Single_Day_Cnt_Money = 
{ 
    200,
    400,
    600,
    800,
    1000,
    1200,
    1400,
    1600,
    1800,
    2000
}

x310373_var_Sigle_Day_Cnt_Tianfu_Range = 
{ 
    {10,15},
    {15,20},
    {20,25},
    {25,30},
    {30,35},
    {35,40},
    {40,45},
    {45,50},
    {50,55},
    {60,65}   
}

x310373_Min_Idx = 1
x310373_Max_Idx = 2
x310373_var_MaxCount = 10
x310373_var_Lv = 85


function x310373_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < x310373_var_Lv then
		return
	end
	TalkAppendButton(varMap,x310373_var_FileId,x310373_var_Title, 8, 1)
end

function x310373_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
    if nFlag == 1 then 
            local nCnt = x310373_GetDayCount(varMap, varPlayer) + 1

            local weekDay = GetWeek()
        	if weekDay ~= 0 and weekDay ~= 6 then
        		StartTalkTask(varMap)
        		TalkAppendString(varMap,"请周末再来参与上香请愿")
        		StopTalkTask(varMap)
        		DeliverTalkTips(varMap,varPlayer)
        		return -1  
            end  
        
        
        
        
            if nCnt > x310373_var_MaxCount then
        		StartTalkTask(varMap)
        		TalkAppendString(varMap,"今天已参与10次上香请愿，请改天再来")
        		StopTalkTask(varMap)
        		DeliverTalkTips(varMap,varPlayer)
        		return -1
            end

                
            local nUseMoney = x310373_var_Single_Day_Cnt_Money[nCnt]
            local nRange    = {}
            local varLevel     = GetLevel( varMap, varPlayer)
            nRange          = x310373_var_Sigle_Day_Cnt_Tianfu_Range[nCnt]
            local tf0 = varLevel*nRange[1]                                           
            local tf1 = varLevel*nRange[2]    
        	StartTalkTask(varMap)
        	TalkAppendString(varMap,"#Y"..x310373_var_Title)
        	TalkAppendString(varMap,format("\t这位施主，老衲有礼了。老衲钻研佛法五十余载，终悟出能激发出人潜力的神通。不过此等逆天之事，还需向我佛上香请示一番，不知施主可愿一试？\n\t老衲可以通过上香请愿增加你的天赋经验，您是否要花费#G#{_MONEY%d}现金/金卡#W进行上香请愿，获得最低#G%d点#W最高#G%d点天赋经验#W？\n \n#G小提示：\n\t周末每天可以进行10次本任务。",nUseMoney,tf0,tf1))
        	TalkAppendButton(varMap,x310373_var_FileId,"我要上香",13,2)
        	StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc) 
     elseif nFlag ==  2 then

            if x310373_Change_Money(varMap, varPlayer)  < 0 then
            return
            end
            
            
            local nCnt = x310373_GetDayCount(varMap, varPlayer) + 1              
            local nRange           = {}                                        
            nRange                 = x310373_var_Sigle_Day_Cnt_Tianfu_Range[nCnt]
            local nMin = nRange[1]                                             
            local nMax = nRange[2]                                             
            local nMinTianfu       = GetLevel(varMap,varPlayer) * nMin           
            local nMaxTianfu       = GetLevel(varMap,varPlayer) * nMax           
            local nAddTianfu       = random(nMinTianfu, nMaxTianfu)    

            
            local refixtf = AddInherenceExp( varMap, varPlayer, nAddTianfu) 
            Msg2Player( varMap, varPlayer, format( "上香请愿完成，获得#R%d#cffcf00点天赋值", refixtf), 8, 2)                                                               
            
            x310373_SetDayCount(varMap, varPlayer)    
        
            local leave =10-x310373_GetDayCount(varMap, varPlayer)
            local varStr=format("\t施主果然天赋异禀,通过这次上香请愿，你获得了#G%d点#W天赋值。你今天还能上香#G%d次#W，下次需要的现金/金卡更多，当然获得的天赋值也会更多。",refixtf,leave)
            if x310373_GetDayCount(varMap, varPlayer) + 1   > x310373_var_MaxCount then  
               varStr=format("\t施主果然天赋异禀,通过这次上香请愿，你获得了#G%d点#W天赋值。你今天已经进行10次上香请愿，请改天再来。",refixtf)
            end    
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x310373_var_Title)
        	TalkAppendString(varMap,varStr)
        	StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc) 
    end  

end




function x310373_Change_Money(varMap, varPlayer)  
    local nCnt = x310373_GetDayCount(varMap, varPlayer) + 1
   
    local nUseMoney = x310373_var_Single_Day_Cnt_Money[nCnt]
    local nRange           = {}
    nRange                 = x310373_var_Sigle_Day_Cnt_Tianfu_Range[nCnt]
    local nMin = nRange[1]
    local nMax = nRange[2]
    local nMinTianfu       = GetLevel(varMap,varPlayer) * nMin
    local nMaxTianfu       = GetLevel(varMap,varPlayer) * nMax         
    local nAddTianfu       = random(nMinTianfu, nMaxTianfu)


	if GetGoldMode( varMap, varPlayer) == 1 then
        if CostMoney( varMap, varPlayer, 2, nUseMoney,317) ~= 1 then
            if CostMoney(varMap, varPlayer, 3, nUseMoney) ~= 1 then
                StartTalkTask(varMap)                                                     
                TalkAppendString(varMap,format("本次上香请愿需要%d文现金/金卡",nUseMoney),8,3) 
                StopTalkTask(varMap)                                                       
                DeliverTalkTips(varMap,varPlayer)                                            
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", nUseMoney), 8, 3)
                return -1 
            else 
                Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}金卡", nUseMoney), 8, 2) 
                Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}金卡", nUseMoney), 8, 3)     
            end
        else
           Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}现金", nUseMoney), 8, 2) 
           Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}现金", nUseMoney), 8, 3)   
        end
    else
        if CostMoney( varMap, varPlayer, 3, nUseMoney) ~= 1 then
            if CostMoney(varMap, varPlayer, 2, nUseMoney,317) ~= 1 then
                StartTalkTask(varMap)                                                     
                TalkAppendString(varMap,format("本次上香请愿需要%d文现金/金卡",nUseMoney)) 
                StopTalkTask(varMap)                                                       
                DeliverTalkTips(varMap,varPlayer)                                            
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", nUseMoney), 8, 3)
                return -1
            else
                Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}现金", nUseMoney), 8, 2) 
                Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}现金", nUseMoney), 8, 3)                 
            end
        else 
            Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}金卡", nUseMoney), 8, 2) 
            Msg2Player( varMap, varPlayer, format( "扣除上香钱#{_MONEY%d}金卡", nUseMoney), 8, 3)     
        end
    end

    return 1
end






function x310373_GetDayCount(varMap, varPlayer)
	if x310373_var_MaxCount > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[3])
		return varDaycount

	end
	return 0
end






function x310373_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[1], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[2], MD_FUBEN_DAGUANYUAN_SHANGXIANG_DAYCOUNT[3], varDaycount+1)
	end
end


