x300649_var_FileId = 300649
x300649_var_QuestName = "【国家】领取国王坐骑"

x300649_var_LevelupTable  = {
                            4, 
                            15, 
                            47, 
                            109, 
                            210, 
                            362, 
                            574, 
                            855, 
                            1217, 
                            1669, 
                            2220, 
                            2882, 
                            3664, 
                            4575, 
                            5627, 
                            6829, 
                            8190, 
                            9722, 
                            11434, 
                            22986, 
                            31937, 
                            40000, 
                            50193, 
                            62608, 
                            67064, 
                            74281, 
                            86642, 
                            100864, 
                            103664, 
                            208524, 
                            220109, 
                            231694, 
                            244933, 
                            256518, 
                            269758, 
                            282997, 
                            296237, 
                            309476, 
                            635502, 
                            809312, 
                            847563, 
                            883801, 
                            924065, 
                            964330, 
                            1006607, 
                            1048885, 
                            1093175, 
                            1137466, 
                            2323249, 
                            1907721, 
                            1984677, 
                            2063660, 
                            2146692, 
                            3278768, 
                            2671214, 
                            2774498, 
                            2879807, 
                            2989167, 
                            4560707, 
                            4670725, 
                            5698285, 
                            6950039, 
                            8474564, 
                            10330897, 
                            15738475, 
                            17578666, 
                            19629511, 
                            21914737, 
                            33355519, 
                            33879680, 
                            41236410, 
                            50180645, 
                            61053118, 
                            74267355, 
                            150541935, 
                            167804077, 
                            187013227, 
                            208386168, 
                            232163564, 
                            235975844, 
                            241528216, 
                            247080589, 
                            252632962, 
                            258185335, 
                            263737708, 
                            269290080, 
                            274842453, 
                            280394826, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            288666096, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531, 
                            743026531
}

function x300649_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	
	TalkAppendButton(varMap,x300649_var_FileId, x300649_var_QuestName, 8)
	
end

function x300649_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )

	StartTalkTask(varMap)
	local Readme_1 ="#Y【国家】领取国王坐骑#W#r"
	local Readme_2 ="\t我只为本国#g国王#w和#g王后#w服务，他们可以在我这里领取#g国王专有坐骑#w。#r" 
	local Readme_3 ="\t国王坐骑，会根据国王（王后）本人的等级以及天赋等级，#G自动成为相应的级别#W。#r"
	local Readme_4 ="\t如果#G误将国王坐骑放生#W，没有必要担心，国王（王后）可以随时在我这里#G重新领取#W。#r"
	local Readme_5="\t基于可能发生的并服管理或当您在游戏中失去统领资格时，国王坐骑将消失，并且无法提供补偿津贴，敬请理解与见谅。"
		  local varReadme = Readme_1..Readme_2.. Readme_3..Readme_4..Readme_5
			TalkAppendString(varMap,varReadme)
			StopTalkTask(varMap)	
		DeliverTalkInfo(varMap,varPlayer,varTalknpc,x300649_var_FileId,-1)

	return 
		
end




function x300649_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300649_ProcAccept( varMap, varPlayer )
	
	local pos = CountryGetOfficial(varMap, varPlayer)

	if pos ~= 8 and pos ~= 7 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您不是国王也不是王后不能领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您不是国王也不是王后不能领取。",8,2)
		return
	end 

	if IsHaveHorse(varMap, varPlayer, 3001) > 0 or
		IsHaveHorse(varMap, varPlayer, 3002) > 0 or
		IsHaveHorse(varMap, varPlayer, 3003) > 0 or
		IsHaveHorse(varMap, varPlayer, 3004) > 0 or
		IsHaveHorse(varMap, varPlayer, 3005) > 0 or
		IsHaveHorse(varMap, varPlayer, 3006) > 0 or
		IsHaveHorse(varMap, varPlayer, 3007) > 0 or
		IsHaveHorse(varMap, varPlayer, 3008) > 0 or
		IsHaveHorse(varMap, varPlayer, 3021) > 0 or
		IsHaveHorse(varMap, varPlayer, 3022) > 0 or
		IsHaveHorse(varMap, varPlayer, 3023) > 0 or
		IsHaveHorse(varMap, varPlayer, 3024) > 0 or
		IsHaveHorse(varMap, varPlayer, 3025) > 0 or
		IsHaveHorse(varMap, varPlayer, 3026) > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您有骑乘不能领取。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您有骑乘不能领取。",8,2)
			return
	end

	local varLevel = GetLevel(varMap, varPlayer)
	local InherenceLevel = GetInherenceLevel(varMap, varPlayer)
	local horseId = -1;
	if varLevel>=30 and varLevel <40 then
		horseId = 3001
	elseif varLevel>=40 and varLevel <50 then
		horseId = 3002
	elseif varLevel >=50 and varLevel <60 then
		horseId = 3003
	elseif varLevel >=60 and varLevel <70 then
		horseId = 3004
	elseif varLevel >=70 and varLevel <80 then
		horseId = 3005
	elseif varLevel >=80 and varLevel <90 then
		horseId = 3006
	elseif varLevel >=90 and varLevel <100 then
		if InherenceLevel >= 50 then
			horseId = 3008
		else	
			horseId = 3007
		end
	elseif varLevel >=100 and varLevel <110 then
		if InherenceLevel >= 65 then
			horseId = 3021
		else
			horseId = 3008
		end
	elseif varLevel >=110 and varLevel <120 then
		horseId = 3021
	elseif varLevel >=120 and varLevel <130 then
		horseId = 3022
	elseif varLevel >=130 and varLevel <140 then
		horseId = 3023
	elseif varLevel >=140 and varLevel <150 then
		horseId = 3024
	elseif varLevel >=150 and varLevel <160 then
		horseId = 3025
	elseif varLevel >=160 then
		horseId = 3026
	end

	if horseId == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的等级不够。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您的等级不够。",8,2)
		return
	end

	if CreateHorseToPlayer(varMap, varPlayer, horseId, -1) < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的坐骑栏已满，不能领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您的坐骑栏已满，不能领取。",8,2)
		return
	end

    local varCount = GetPetCount( varMap, varPlayer)
    local idx = 0
    for varI = 0, varCount - 1 do
        if GetHorseDataID( varMap, varPlayer, varI) == horseId then
            idx = varI
            break
        end
    end

    for varI = 1, varLevel - 1 do
        if varI == varLevel - 1 then
            AddHorseExp( varMap, varPlayer, idx, x300649_var_LevelupTable[ varI], 1)
        else
            AddHorseExp( varMap, varPlayer, idx, x300649_var_LevelupTable[ varI], 0)
        end
    end

end

