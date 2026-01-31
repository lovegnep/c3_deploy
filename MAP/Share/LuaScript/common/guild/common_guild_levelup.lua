
function x300715_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		if  GetGuildOfficial(varMap, varPlayer) ~= 5 then
					return
		end
			
			TalkAppendButton(varMap,300715,"【帮会】帮会升级",3,1)

end


function x300715_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

	local x300715xinwu = 0
	
	local x300715jinka = 0
	
	local x300715banghuijingyan = 0
	
	local x300715Readme_5 = ""
	
	local x300715Readme_6 = ""
	
	local x300715Readme_7 = ""	

	if varIndex == 1 then
	
			local GuildId = GetGuildID(varMap, varPlayer)
			
			local GuildLevel,GuildMemcount,GuildExp = GetGuildSimpleData(GuildId)
							
					if GuildLevel == 1 then					
								x300715xinwu = 1
								x300715jinka = 5
								x300715banghuijingyan = 800								
								if HaveItem( varMap,varPlayer,11990001) < 1 then
									x300715Readme_5 = "  #R帮会信物："..x300715xinwu.."个帮会令。#r#W"
								else
									x300715Readme_5 = "  #G帮会信物："..x300715xinwu.."个帮会令。#r"
								end								
								if GetMoney(varMap, varPlayer, 0) < 5000 then
									x300715Readme_6 = "  #R现银    ："..x300715jinka.."两。#r#W"
								else
									x300715Readme_6 = "  #G现银    ："..x300715jinka.."两。#r"
								end								
								if GuildExp < 800 then
									x300715Readme_7 = "  #R帮会经验："..x300715banghuijingyan.."点。#r#W"
								else
									x300715Readme_7 = "  #G帮会经验："..x300715banghuijingyan.."点。#r"
								end						
					elseif GuildLevel == 2 then					
								x300715xinwu = 2
								x300715jinka = 10
								x300715banghuijingyan = 4000								
								if HaveItem( varMap,varPlayer,11990001) < 2 then
									x300715Readme_5 = "  #R帮会信物："..x300715xinwu.."个帮会令。#r#W"
								else
									x300715Readme_5 = "  #G帮会信物："..x300715xinwu.."个帮会令。#r"
								end								
								if GetMoney(varMap, varPlayer, 0) < 10000 then
									x300715Readme_6 = "  #R现银    ："..x300715jinka.."两。#r#W"
								else
									x300715Readme_6 = "  #G现银    ："..x300715jinka.."两。#r"
								end								
								if GuildExp < 4000 then
									x300715Readme_7 = "  #R帮会经验："..x300715banghuijingyan.."点。#r#W"
								else
									x300715Readme_7 = "  #G帮会经验："..x300715banghuijingyan.."点。#r"
								end								
					elseif GuildLevel == 3 then					
								x300715xinwu = 3
								x300715jinka = 25
								x300715banghuijingyan = 12000								
								if HaveItem( varMap,varPlayer,11990001) < 3 then
									x300715Readme_5 = "  #R帮会信物："..x300715xinwu.."个帮会令。#r#W"
								else
									x300715Readme_5 = "  #G帮会信物："..x300715xinwu.."个帮会令。#r"
								end								
								if GetMoney(varMap, varPlayer, 0) < 25000 then
									x300715Readme_6 = "  #R现银    ："..x300715jinka.."两。#r#W"
								else
									x300715Readme_6 = "  #G现银    ："..x300715jinka.."两。#r"
								end								
								if GuildExp < 12000 then
									x300715Readme_7 = "  #R帮会经验："..x300715banghuijingyan.."点。#r#W"
								else
									x300715Readme_7 = "  #G帮会经验："..x300715banghuijingyan.."点。#r"
								end								
					elseif GuildLevel == 4 then					
								x300715xinwu = 4
								x300715jinka = 50
								x300715banghuijingyan = 40000							
								if HaveItem( varMap,varPlayer,11990001) < 4 then
									x300715Readme_5 = "  #R帮会信物："..x300715xinwu.."个帮会令。#r#W"
								else
									x300715Readme_5 = "  #G帮会信物："..x300715xinwu.."个帮会令。#r"
								end								
								if GetMoney(varMap, varPlayer, 0) < 50000 then
									x300715Readme_6 = "  #R现银    ："..x300715jinka.."两。#r#W"
								else
									x300715Readme_6 = "  #G现银    ："..x300715jinka.."两。#r"
								end								
								if GuildExp < 40000 then
									x300715Readme_7 = "  #R帮会经验："..x300715banghuijingyan.."点。#r#W"
								else
									x300715Readme_7 = "  #G帮会经验："..x300715banghuijingyan.."点。#r"
								end					
					elseif GuildLevel == 5 then					
								x300715xinwu = 5
								x300715jinka = 500
								x300715banghuijingyan = 96000							
								if HaveItem( varMap,varPlayer,11990001) < 5 then
									x300715Readme_5 = "  #R帮会信物："..x300715xinwu.."个帮会令。#r#W"
								else
									x300715Readme_5 = "  #G帮会信物："..x300715xinwu.."个帮会令。#r"
								end								
								if GetMoney(varMap, varPlayer, 0) < 500000 then
									x300715Readme_6 = "  #R现银    ："..x300715jinka.."两。#r#W"
								else
									x300715Readme_6 = "  #G现银    ："..x300715jinka.."两。#r"
								end								
								if GuildExp < 96000 then
									x300715Readme_7 = "  #R帮会经验："..x300715banghuijingyan.."点。#r#W"
								else
									x300715Readme_7 = "  #G帮会经验："..x300715banghuijingyan.."点。#r"
								end			
					elseif GuildLevel == 6 then					
								x300715xinwu = 6
								x300715jinka = 800
								x300715banghuijingyan = 192000							
								if HaveItem( varMap,varPlayer,11990001) < 6 then
									x300715Readme_5 = "  #R帮会信物："..x300715xinwu.."个帮会令。#r#W"
								else
									x300715Readme_5 = "  #G帮会信物："..x300715xinwu.."个帮会令。#r"
								end								
								if GetMoney(varMap, varPlayer, 0) < 800000 then
									x300715Readme_6 = "  #R现银    ："..x300715jinka.."两。#r#W"
								else
									x300715Readme_6 = "  #G现银    ："..x300715jinka.."两。#r"
								end								
								if GuildExp < 192000 then
									x300715Readme_7 = "  #R帮会经验："..x300715banghuijingyan.."点。#r#W"
								else
									x300715Readme_7 = "  #G帮会经验："..x300715banghuijingyan.."点。#r"
								end											
					elseif GuildLevel == 7 then					
								Msg2Player(varMap,varPlayer,"帮会等级目前只开放到7级！",8,2)
								Msg2Player(varMap,varPlayer,"帮会等级目前只开放到7级！",8,3)
						return						
					end
		
					
			local Readme_1 = "#Y【帮会】帮会升级：#r"
			
			local Readme_2 = "#W您所在帮会的当前等级为：#G"..GuildLevel.."#W 级。#r"
			
			local Readme_3 = "您所在帮会的帮会经验为：#G"..GuildExp.."#W 点。#r".."#r"
			
			local Readme_4 = "升#G"..(GuildLevel+1).."级帮会#W需要以下条件：#r #r"
			
			local Readme_8 = "#W ".."#r您是否要升级帮会？"
			
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..x300715Readme_5..x300715Readme_6..x300715Readme_7..Readme_8
						
			StartTalkTask(varMap);TalkAppendString( varMap,varReadme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 300715, -1)
			
	end
	
end



function x300715_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

			local guildid = GetGuildID(varMap, varPlayer)
	
			local GuildLevel,GuildMemcount,GuildExp = GetGuildSimpleData(guildid)
			
			if  GetGuildOfficial(varMap, varPlayer) == 5 then
						if GuildLevel == 1 then
							if GetMoney(varMap, varPlayer, 0) >= 5000 then
									if HaveItem( varMap,varPlayer,11990001) >= 1 then
											if GuildExp >= 800 then
													CostMoney(varMap, varPlayer, 0,5000,304)
													if DelItem( varMap,varPlayer,11990001,1 ) ~= 1 then return 0 end
													SubGuildExp(varMap,varPlayer, 800)
													GuildLevelup(varMap, varPlayer)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",6)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,2)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,3)
											else
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,2)
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,3)
											end
									else
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,2)
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,3)
									end
							else
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,2)
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,3)
							end
					elseif GuildLevel == 2 then
							if GetMoney(varMap, varPlayer, 0) >= 10000 then
									if HaveItem( varMap,varPlayer,11990001) >= 2 then
											if GuildExp >= 4000 then
													
													CostMoney(varMap, varPlayer, 0,10000,304)
													if DelItem( varMap,varPlayer,11990001,2 ) ~= 1 then return 0 end
													SubGuildExp(varMap,varPlayer, 4000)
													GuildLevelup(varMap, varPlayer)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",6)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,2)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,3)
											else
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,2)
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,3)
											end
									else
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,2)
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,3)
									end
							else
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,2)
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,3)
							end
							
					elseif GuildLevel == 3 then
					
							if GetMoney(varMap, varPlayer, 0) >= 25000 then
									if HaveItem( varMap,varPlayer,11990001) >= 3 then
											if GuildExp >= 12000 then
													
													CostMoney(varMap, varPlayer, 0,25000,304)
													if DelItem( varMap,varPlayer,11990001,3 ) ~= 1 then return 0 end
													SubGuildExp(varMap,varPlayer, 12000)
													GuildLevelup(varMap, varPlayer)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",6)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,2)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,3)
											else
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,2)
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,3)
											end
									else
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,2)
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,3)
									end
							else
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,2)
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,3)
							end
								
					elseif GuildLevel == 4 then
					
							if GetMoney(varMap, varPlayer, 0) >= 50000 then
									if HaveItem( varMap,varPlayer,11990001) >= 4 then
											if GuildExp >= 40000 then
													
													CostMoney(varMap, varPlayer, 0,50000,304)
													if DelItem( varMap,varPlayer,11990001,4 ) ~= 1 then return 0 end
													SubGuildExp(varMap,varPlayer, 40000)
													GuildLevelup(varMap, varPlayer)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",6)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,2)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,3)
											else
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,2)
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,3)
											end
									else
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,2)
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,3)
									end
							else
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,2)
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,3)
							end				

					elseif GuildLevel == 5 then
					
							if GetMoney(varMap, varPlayer, 0) >= 500000 then
									if HaveItem( varMap,varPlayer,11990001) >= 5 then
											if GuildExp >= 96000 then
													
													CostMoney(varMap, varPlayer, 0,500000,304)
													if DelItem( varMap,varPlayer,11990001,5 ) ~= 1 then return 0 end
													SubGuildExp(varMap,varPlayer, 96000)
													GuildLevelup(varMap, varPlayer)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",6)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,2)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,3)
											else
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,2)
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,3)
											end
									else
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,2)
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,3)
									end
							else
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,2)
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,3)
							end				

					elseif GuildLevel == 6 then
					
							if GetMoney(varMap, varPlayer, 0) >= 800000 then
									if HaveItem( varMap,varPlayer,11990001) >= 6 then
											if GuildExp >= 192000 then
													
													CostMoney(varMap, varPlayer, 0,800000,304)
													if DelItem( varMap,varPlayer,11990001,6 ) ~= 1 then return 0 end
													SubGuildExp(varMap,varPlayer, 192000)
													GuildLevelup(varMap, varPlayer)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",6)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,2)
													Msg2Player(varMap,varPlayer,"号外！号外！帮会升级喽~",8,3)
											else
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,2)
												Msg2Player(varMap,varPlayer,"很抱歉，帮会经验不够，无法升级帮会！",8,3)
											end
									else
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,2)
										Msg2Player(varMap,varPlayer,"很抱歉，帮会信物不够，无法升级帮会！",8,3)
									end
							else
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,2)
								Msg2Player(varMap,varPlayer,"很抱歉，您身上的现银不够，无法升级帮会！",8,3)
							end				
					end
			else
				Msg2Player(varMap,varPlayer,"您不是帮主！",8,2)
				Msg2Player(varMap,varPlayer,"您不是帮主！",8,3)
			end
			
end




function x300715_ProcAccept( varMap, varMap )

end




function x300715_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300715_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300715_CheckSubmit( varMap, varPlayer )

end




function x300715_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300715_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300715_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300715_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


