


x800019_var_BusMaxFollowDist = 10		




function	x800019_TransferFunc(varMap, varPlayer, newSceneId, PosX, PosZ)
	 
	
	local life=IsCharacterLiving( varMap,varPlayer)
	if	life==0	then
		return
	else
		if	GetTeamId( varMap, varPlayer)<0	then
			local InBus = IsBusMember(varMap, varPlayer)
			if InBus == 1 then
				
				local BusId = GetBusId(varMap, varPlayer)
				local IsLeader = IsTheBusLeader(varMap, varPlayer,BusId)   	
				local InDist =IsInDist(varMap, varPlayer,BusId,x800019_var_BusMaxFollowDist)     
				if InDist == 1 and IsLeader == 1 then
					x800019_BusTransfer(varMap,BusId,newSceneId, PosX, PosZ)
				else	
					if varMap == newSceneId then
						SetPos(varMap, varPlayer,PosX,PosZ)
					else
						if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
							return
						end
						NewWorld(varMap, varPlayer, newSceneId, PosX, PosZ, 800019)
					end							
				end

			else 
				if varMap == newSceneId then
					SetPos(varMap, varPlayer,PosX,PosZ)
				else
					if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
						return
					end
					NewWorld(varMap, varPlayer, newSceneId, PosX, PosZ, 800019)
				end
			end
		
		elseif	IsTeamFollow(varMap, varPlayer)~=1	then
			local InBus = IsBusMember(varMap, varPlayer)
			if InBus == 1 then
				local BusId = GetBusId(varMap, varPlayer)
				local IsLeader = IsTheBusLeader(varMap, varPlayer,BusId)   	
				local InDist = IsInDist(varMap, varPlayer,BusId,x800019_var_BusMaxFollowDist)
				if InDist == 1 and IsLeader == 1 then
					x800019_BusTransfer(varMap,BusId,newSceneId, PosX, PosZ)
				else	
					if varMap == newSceneId then
						SetPos(varMap, varPlayer,PosX,PosZ)
					else
					if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
						return
					end
						NewWorld(varMap, varPlayer, newSceneId, PosX, PosZ, 800019)
					end							
				end			

			else 
				if varMap == newSceneId then
					SetPos(varMap, varPlayer,PosX,PosZ)
				else
						if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
							return
						end
					NewWorld(varMap, varPlayer, newSceneId, PosX, PosZ, 800019)
				end
			end
		
		elseif	IsTeamLeader(varMap,varPlayer)==1	 then
			local varNum=GetFollowedMembersCount( varMap, varPlayer)
			local varMems = {}
			for	varI=0,varNum-1 do
				varMems[varI] = GetFollowedMember(varMap, varPlayer, varI)
				if varMems[varI] == -1 then
					return
				end
			end
			
			if varMap == newSceneId then
				for	varI=0,varNum-1 do
					SetPos(varMap, varMems[varI],PosX,PosZ)
				end
			else

				for	varI=0,varNum-1 do
					if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varMems[varI],newSceneId) ~= 0 then
						NewWorld(varMap, varMems[varI], newSceneId, PosX, PosZ, 800019)
					end		
					
				end
			end
		
		end
	end
end


function	x800019_BusTransfer(varMap,BusId,newSceneId, posX, posY)

	local varNum = GetBusMemberCount(varMap, BusId)
	
	
	
	if varMap == newSceneId then
		
		SetPos(varMap, BusId,posX,posY)
	else
		
		ReadyBusChangeScene(varMap, newSceneId,BusId)
		
		for	varI=0,varNum-1 do
			local varObj = GetBusMemberObjId(varMap,BusId,varI)
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varObj,newSceneId) == 0 then
						return
			end
			NewWorld(varMap, varObj, newSceneId, posX, posY, 800019)
		end
		
		
		DeleteBus(varMap, BusId,0)		
	end
end


	CJSH_WorldPos= {

				
				loulanbianjing2wangcheng={newSceneId=73,PosX=418,PosZ=477},
				laiyinbianjing2wangcheng={newSceneId=150,PosX=418,PosZ=477},
				kunlunbianjing2wangcheng={newSceneId=250,PosX=418,PosZ=477},
				dunhuangbianjing2wangcheng={newSceneId=350,PosX=418,PosZ=477},
				
				loulanwangcheng2bianjing={newSceneId=74,PosX=36,PosZ=60},
				laiyinwangcheng2bianjing={newSceneId=151,PosX=36,PosZ=60},
				kunlunwangcheng2bianjing={newSceneId=251,PosX=36,PosZ=60},
				dunhuangwangcheng2bianjing={newSceneId=351,PosX=36,PosZ=60},
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			  
				
				
				
				
				
				
				loulanbianjingenter2xiaoshuidao={newSceneId=76,PosX=51,PosZ=12},		
				laiyinbianjingenter2xiaoshuidao={newSceneId=176,PosX=51,PosZ=12},		
				kunlunbianjingenter2xiaoshuidao={newSceneId=276,PosX=51,PosZ=12},		
				dunhuangbianjingenter2xiaoshuidao={newSceneId=376,PosX=51,PosZ=12},		

				
				loulanbianjingexit2xiaoshuidao={newSceneId=76,PosX=12,PosZ=51},		
				laiyinbianjingexit2xiaoshuidao={newSceneId=176,PosX=12,PosZ=51},		
				kunlunbianjingexit2xiaoshuidao={newSceneId=276,PosX=12,PosZ=51},				
				dunhuangbianjingexit2xiaoshuidao={newSceneId=376,PosX=12,PosZ=51},				

				
				loulanbianjingexit2xiaoshuidaowest={newSceneId=51,PosX=287,PosZ=254},		
				laiyinbianjingexit2xiaoshuidaowest={newSceneId=151,PosX=287,PosZ=254},	
				kunlunbianjingexit2xiaoshuidaowest={newSceneId=251,PosX=287,PosZ=254},		
				dunhuangbianjingexit2xiaoshuidaowest={newSceneId=351,PosX=287,PosZ=254},		

				
				loulanbianjingexit2xiaoshuidaoeast={newSceneId=51,PosX=403,PosZ=268},		
				laiyinbianjingexit2xiaoshuidaoeast={newSceneId=151,PosX=403,PosZ=268},		
				kunlunbianjingexit2xiaoshuidaoeast={newSceneId=251,PosX=403,PosZ=268},		
				dunhuangbianjingexit2xiaoshuidaoeast={newSceneId=351,PosX=403,PosZ=268},		

				
				loulanwangcheng2xinshoucun={newSceneId=89,PosX=17,PosZ=145},
				laiyinwangcheng2xinshoucun={newSceneId=189,PosX=239,PosZ=124},
				kunlunwangcheng2xinshoucun={newSceneId=289,PosX=19,PosZ=134},
				dunhuangwangcheng2xinshoucun={newSceneId=389,PosX=230,PosZ=124},
				
				loulanxinshoucun2wangcheng={newSceneId=50,PosX=475,PosZ=92},
				laiyinxinshoucun2wangcheng={newSceneId=150,PosX=475,PosZ=92},
				kunlunxinshoucun2wangcheng={newSceneId=250,PosX=475,PosZ=92},
				dunhuangxinshoucun2wangcheng={newSceneId=350,PosX=475,PosZ=92}, 			
				
				loulanwangcheng2wenquancun={newSceneId=37,PosX=25,PosZ=138},
				laiyinwangcheng2wenquancun={newSceneId=37,PosX=25,PosZ=138},
				kunlunwangcheng2wenquancun={newSceneId=37,PosX=25,PosZ=138},
				dunhuangwangcheng2wenquancun={newSceneId=37,PosX=25,PosZ=138},
				
				loulanwenquancun2wangcheng={newSceneId=0,PosX=450,PosZ=108},
				laiyinwenquancun2wangcheng={newSceneId=0,PosX=450,PosZ=108},
				kunlunwenquancun2wangcheng={newSceneId=0,PosX=450,PosZ=108},
				dunhuangwenquancun2wangcheng={newSceneId=0,PosX=450,PosZ=108},
				
				dadu2huangcheng0={newSceneId=41,PosX=64,PosZ=113},
				dadu2huangcheng1={newSceneId=41,PosX=64,PosZ=113},
				dadu2huangcheng2={newSceneId=41,PosX=64,PosZ=113},
				dadu2huangcheng3={newSceneId=41,PosX=64,PosZ=113},
				
				huangcheng2dadu0={newSceneId=0,PosX=255,PosZ=97},
				huangcheng2dadu1={newSceneId=0,PosX=255,PosZ=97},
				huangcheng2dadu2={newSceneId=0,PosX=255,PosZ=97},
				huangcheng2dadu3={newSceneId=0,PosX=255,PosZ=97},
				
				loulanwangcheng2fenglingdu={newSceneId=38,PosX=227,PosZ=148},
				laiyinwangcheng2fenglingdu={newSceneId=38,PosX=227,PosZ=148},
				kunlunwangcheng2fenglingdu={newSceneId=38,PosX=227,PosZ=148},
				dunhuangwangcheng2fenglingdu={newSceneId=38,PosX=227,PosZ=148},
				
				loulanfenglingdu2wangcheng={newSceneId=0,PosX=36,PosZ=362},
				laiyinfenglingdu2wangcheng={newSceneId=0,PosX=36,PosZ=362},
				kunlunfenglingdu2wangcheng={newSceneId=0,PosX=36,PosZ=362},
				dunhuangfenglingdu2wangcheng={newSceneId=0,PosX=36,PosZ=362},
				
				dadu2baodingloulan={newSceneId=36,PosX=127,PosZ=32},
				dadu2baodinglaiyin={newSceneId=36,PosX=127,PosZ=32},
				dadu2baodingkunlun={newSceneId=36,PosX=127,PosZ=32},
				dadu2baodingdunhuang={newSceneId=36,PosX=127,PosZ=32},

				
				baoding2dadu={newSceneId=0,PosX=402,PosZ=475},
				
				
				
				
				
				
				
				loulanwangcheng2machang={newSceneId=5,PosX=129,PosZ=29},
				laiyinwangcheng2machang={newSceneId=5,PosX=129,PosZ=29},
				kunlunwangcheng2machang={newSceneId=5,PosX=129,PosZ=29},
				dunhuangwangcheng2machang={newSceneId=5,PosX=129,PosZ=29},
				
				loulanmachang2wangcheng={newSceneId=36,PosX=181,PosZ=233},
				laiyinmachang2wangcheng={newSceneId=36,PosX=181,PosZ=233},
				kunlunmachang2wangcheng={newSceneId=36,PosX=181,PosZ=233},
				dunhuangmachang2wangcheng={newSceneId=36,PosX=181,PosZ=233},
				
				
				jinge2tieqiloulan={newSceneId=87,PosX=42,PosZ=33},
				jinge2tieqitianshan={newSceneId=187,PosX=100,PosZ=100},
				jinge2tieqikunlun={newSceneId=287,PosX=220,PosZ=139},
				jinge2tieqidunhuang={newSceneId=387,PosX=100,PosZ=100},
				                                                     
				
				tieqi2jingeloulan={newSceneId=19,PosX=100,PosZ=100},  
				tieqi2jingetianshan={newSceneId=19,PosX=100,PosZ=100},
				tieqi2jingekunlun={newSceneId=19,PosX=100,PosZ=100}, 
				tieqi2jingedunhuang={newSceneId=19,PosX=100,PosZ=100},
				
				
				
				
				loulansuluding={newSceneId=50,PosX=127,PosZ=29},
				laiyinsuluding={newSceneId=150,PosX=128,PosZ=29},
				kunlunsuluding={newSceneId=250,PosX=126,PosZ=211},
				dunhuangsuluding={newSceneId=350,PosX=128,PosZ=226},

				
				baoding2datongloulan={newSceneId=6,PosX=65,PosZ=28},
				baoding2datonglaiyin={newSceneId=6,PosX=65,PosZ=28},
				baoding2datongkunlun={newSceneId=6,PosX=65,PosZ=28},
				baoding2datongdunhuang={newSceneId=6,PosX=65,PosZ=28},
				
				
				datong2baodingloulan={newSceneId=5,PosX=138,PosZ=220},
				datong2baodinglaiyin={newSceneId=5,PosX=138,PosZ=220},
				datong2baodingkunlun={newSceneId=5,PosX=138,PosZ=220},
				datong2baodingdunhuang={newSceneId=5,PosX=138,PosZ=220},

				
				baoding2jiningloulan={newSceneId=7,PosX=164,PosZ=26},
				baoding2jininglaiyin={newSceneId=7,PosX=164,PosZ=26},
				baoding2jiningkunlun={newSceneId=7,PosX=164,PosZ=26},
				baoding2jiningdunhuang={newSceneId=7,PosX=164,PosZ=26},

			  
				jining2baodingloulan={newSceneId=6,PosX=128,PosZ=228},
				jining2baodinglaiyin={newSceneId=6,PosX=128,PosZ=228},
				jining2baodingkunlun={newSceneId=6,PosX=128,PosZ=228},
				jining2baodingdunhuang={newSceneId=6,PosX=128,PosZ=228},
				
				
				jining2weihailoulan={newSceneId=15,PosX=34,PosZ=109},
				jining2weihailaiyin={newSceneId=15,PosX=34,PosZ=109},
				jining2weihaikunlun={newSceneId=15,PosX=34,PosZ=109},
				jining2weihaidunhuang={newSceneId=15,PosX=34,PosZ=109},
				
				
				weihai2jiningloulan={newSceneId=2,PosX=226,PosZ=137},
				weihai2jininglaiyin={newSceneId=2,PosX=226,PosZ=137},
				weihai2jiningkunlun={newSceneId=2,PosX=226,PosZ=137},
				weihai2jiningdunhuang={newSceneId=2,PosX=226,PosZ=137},
				
				
			  --赛马专用trap传送
				saimadadudong2houhuayuan =  {newSceneId=44,PosX=56,PosZ=66},
				
				saimahouhuayuan2kadizigan =  {newSceneId=569,PosX=142,PosZ=270},
				

				
				
				liangcangexitone1={newSceneId=51,PosX=100,PosZ=100},
				liangcangexitone2={newSceneId=151,PosX=100,PosZ=100},
				liangcangexitone3={newSceneId=251,PosX=100,PosZ=100},
				liangcangexitone4={newSceneId=351,PosX=100,PosZ=100},
				
				
				
				
	
				
        
        taishan2daduloulan={newSceneId=37,PosX=223,PosZ=75},       
        taishan2dadutianshan={newSceneId=37,PosX=223,PosZ=75},       
        taishan2dadukunlun={newSceneId=37,PosX=223,PosZ=75},       
        taishan2dadudunhuang={newSceneId=37,PosX=223,PosZ=75},     
       
        dadu2taishanloulan={newSceneId=2,PosX=24,PosZ=144},                                                               
        dadu2taishantianshan={newSceneId=2,PosX=24,PosZ=144},                                                             
        dadu2taishankunlun={newSceneId=2,PosX=24,PosZ=144},                                                               
        dadu2taishandunhuang={newSceneId=2,PosX=24,PosZ=144},                                                             
       
        taihangshan2daduloulan={newSceneId=38,PosX=24,PosZ=222},   
        taihangshan2dadutianshan={newSceneId=38,PosX=24,PosZ=222}, 
        taihangshan2dadukunlun={newSceneId=38,PosX=24,PosZ=222},   
        taihangshan2dadudunhuang={newSceneId=38,PosX=24,PosZ=222}, 
       
        dadu2taihangshanloulan={newSceneId=4,PosX=219,PosZ=33},    
        dadu2taihangshantianshan={newSceneId=4,PosX=219,PosZ=33},  
        dadu2taihangshankunlun={newSceneId=4,PosX=219,PosZ=33},    
        dadu2taihangshandunhuang={newSceneId=4,PosX=219,PosZ=33},   
       
        taihangshan2hexiloulan={newSceneId=3,PosX=225,PosZ=131},   
        taihangshan2hexitianshan={newSceneId=3,PosX=225,PosZ=131}, 
        taihangshan2hexikunlun={newSceneId=3,PosX=225,PosZ=131},   
        taihangshan2hexidunhuang={newSceneId=3,PosX=225,PosZ=131}, 
       
        hexi2taihangshanloulan={newSceneId=4,PosX=52,PosZ=187},    
        hexi2taihangshantianshan={newSceneId=4,PosX=52,PosZ=187},  
        hexi2taihangshankunlun={newSceneId=4,PosX=52,PosZ=187},    
        hexi2taihangshandunhuang={newSceneId=4,PosX=52,PosZ=187},      
       
        jinshan2hexiloulan={newSceneId=3,PosX=30,PosZ=126},        
        jinshan2hexitianshan={newSceneId=3,PosX=30,PosZ=126},      
        jinshan2hexikunlun={newSceneId=3,PosX=30,PosZ=126},        
        jinshan2hexidunhuang={newSceneId=3,PosX=30,PosZ=126},      
        
        hexi2jinshanloulan={newSceneId=8,PosX=225,PosZ=164},         
        hexi2jinshantianshan={newSceneId=8,PosX=225,PosZ=164},       
        hexi2jinshankunlun={newSceneId=8,PosX=225,PosZ=164},         
        hexi2jinshandunhuang={newSceneId=8,PosX=225,PosZ=164},    
        
        jinshan2yemililoulan={newSceneId=9,PosX=228,PosZ=69},      
        jinshan2yemilitianshan={newSceneId=9,PosX=228,PosZ=69},    
        jinshan2yemilikunlun={newSceneId=9,PosX=228,PosZ=69},      
        jinshan2yemilidunhuang={newSceneId=9,PosX=228,PosZ=69},    
        
        yemili2jinshanloulan={newSceneId=8,PosX=30,PosZ=113},       
        yemili2jinshantianshan={newSceneId=8,PosX=30,PosZ=113},     
        yemili2jinshankunlun={newSceneId=8,PosX=30,PosZ=113},       
        yemili2jinshandunhuang={newSceneId=8,PosX=30,PosZ=113},  
         
        hexi2bianjingloulan={newSceneId=51,PosX=417,PosZ=463},       
        hexi2bianjingtianshan={newSceneId=151,PosX=417,PosZ=463},     
        hexi2bianjingkunlun={newSceneId=251,PosX=417,PosZ=463},       
        hexi2bianjingdunhuang={newSceneId=351,PosX=417,PosZ=463},  
         
        bianjing2hexiloulan={newSceneId=3,PosX=37,PosZ=38},       
        bianjing2hexitianshan={newSceneId=3,PosX=226,PosZ=34},     
        bianjing2hexikunlun={newSceneId=3,PosX=43,PosZ=216},       
        bianjing2hexidunhuang={newSceneId=3,PosX=220,PosZ=220},  
        
        bianjing2caochangloulan={newSceneId=50,PosX=246,PosZ=469},             
        bianjing2caochangtianshan={newSceneId=150,PosX=246,PosZ=469},     
        bianjing2caochangkunlun={newSceneId=250,PosX=246,PosZ=469},       
        bianjing2caochangdunhuang={newSceneId=350,PosX=246,PosZ=469},  
        
        caochang2bianjingloulan={newSceneId=51,PosX=34,PosZ=33},       
        caochang2bianjingtianshan={newSceneId=151,PosX=220,PosZ=36},     
        caochang2bianjingkunlun={newSceneId=251,PosX=46,PosZ=216},       
        caochang2bianjingdunhuang={newSceneId=351,PosX=202,PosZ=200},  
         
        bianjing2gudaoloulan={newSceneId=86,PosX=96,PosZ=240},       
        bianjing2gudaotianshan={newSceneId=186,PosX=135,PosZ=208},     
        bianjing2gudaokunlun={newSceneId=286,PosX=125,PosZ=38},       
        bianjing2gudaodunhuang={newSceneId=386,PosX=117,PosZ=38},  
         
        
        
        
        
         
        muchang2caochangloulan={newSceneId=50,PosX=128,PosZ=236},       
        muchang2caochangtianshan={newSceneId=150,PosX=126,PosZ=235},     
        muchang2caochangkunlun={newSceneId=250,PosX=128,PosZ=11},       
        muchang2caochangdunhuang={newSceneId=350,PosX=128,PosZ=11},  
       --楼兰到边塞  
        caochang2muchangloulan={newSceneId=51,PosX=54,PosZ=74},     
        caochang2muchangtianshan={newSceneId=151,PosX=54,PosZ=74},     
        caochang2muchangkunlun={newSceneId=251,PosX=54,PosZ=74},       
        caochang2muchangdunhuang={newSceneId=351,PosX=54,PosZ=74},      
       
        wangcheng2gudaoloulan={newSceneId=87,PosX=398,PosZ=83},       
        wangcheng2gudaotianshan={newSceneId=187,PosX=398,PosZ=83},     
        wangcheng2gudaokunlun={newSceneId=287,PosX=398,PosZ=83},       
        wangcheng2gudaodunhuang={newSceneId=387,PosX=398,PosZ=83}, 
        
        gudao2wangchengloulan={newSceneId=58,PosX=131,PosZ=213},       
        gudao2wangchengtianshan={newSceneId=158,PosX=130,PosZ=212},     
        gudao2wangchengkunlun={newSceneId=258,PosX=127,PosZ=40},       
        gudao2wangchengdunhuang={newSceneId=358,PosX=127,PosZ=40},              
       
        wangcheng2muchangloulan={newSceneId=86,PosX=116,PosZ=32},       
        wangcheng2muchangtianshan={newSceneId=186,PosX=110,PosZ=44},     
        wangcheng2muchangkunlun={newSceneId=286,PosX=120,PosZ=224},       
        wangcheng2muchangdunhuang={newSceneId=386,PosX=150,PosZ=219}, 
        
        muchang2wangchengloulan={newSceneId=50,PosX=40,PosZ=106},       
        muchang2wangchengtianshan={newSceneId=150,PosX=40,PosZ=106},     
        muchang2wangchengkunlun={newSceneId=250,PosX=40,PosZ=106},       
        muchang2wangchengdunhuang={newSceneId=350,PosX=40,PosZ=106},   
        
        
        
        
        
         
        wangguogudao2jiangjunone={newSceneId=24,PosX=9,PosZ=115},       
        wangguogudao2jiangjunone={newSceneId=24,PosX=9,PosZ=115},     
        wangguogudao2jiangjunone={newSceneId=24,PosX=9,PosZ=115},       
        wangguogudao2jiangjunone={newSceneId=24,PosX=9,PosZ=115},   
         
        jiangjunone2jiangjuntwo={newSceneId=23,PosX=96,PosZ=13},       
        jiangjunone2jiangjuntwo={newSceneId=23,PosX=96,PosZ=13},    
        jiangjunone2jiangjuntwo={newSceneId=23,PosX=96,PosZ=13},          
        jiangjunone2jiangjuntwo={newSceneId=23,PosX=96,PosZ=13},    
         
         jiangjuntwo2jiangjunone={newSceneId=25,PosX=108,PosZ=22},       
         jiangjuntwo2jiangjunone={newSceneId=25,PosX=108,PosZ=22},  
         jiangjuntwo2jiangjunone={newSceneId=25,PosX=108,PosZ=22},       
         jiangjuntwo2jiangjunone={newSceneId=25,PosX=108,PosZ=22},  
        
         jiangjuntwo2jiangjunshree={newSceneId=24,PosX=94,PosZ=14},       
         jiangjuntwo2jiangjunshree={newSceneId=24,PosX=94,PosZ=14},     
         jiangjuntwo2jiangjunshree={newSceneId=24,PosX=94,PosZ=14},        
         jiangjuntwo2jiangjunshree={newSceneId=24,PosX=94,PosZ=14},      
         
        biansai2futuone={newSceneId=34,PosX=9,PosZ=115},           
        biansai2futuone={newSceneId=34,PosX=9,PosZ=115},           
        biansai2futuone={newSceneId=34,PosX=9,PosZ=115},           
        biansai2futuone={newSceneId=34,PosX=9,PosZ=115},           
         
        futuone2fututwo={newSceneId=33,PosX=96,PosZ=13},           
        futuone2fututwo={newSceneId=33,PosX=96,PosZ=13},           
        futuone2fututwo={newSceneId=33,PosX=96,PosZ=13},           
        futuone2fututwo={newSceneId=33,PosX=96,PosZ=13},           
         
         fututwo2futuone={newSceneId=35,PosX=108,PosZ=22},         
         fututwo2futuone={newSceneId=35,PosX=108,PosZ=22},         
         fututwo2futuone={newSceneId=35,PosX=108,PosZ=22},         
         fututwo2futuone={newSceneId=35,PosX=108,PosZ=22},         
        
         fututwo2futushree={newSceneId=34,PosX=94,PosZ=14},        
         fututwo2futushree={newSceneId=34,PosX=94,PosZ=14},        
         fututwo2futushree={newSceneId=34,PosX=94,PosZ=14},        
         fututwo2futushree={newSceneId=34,PosX=94,PosZ=14},        
        
        
        
        
        
        
        wanfoone2zhongxingfu={newSceneId=30,PosX=64,PosZ=230},             
        wanfoone2zhongxingfu={newSceneId=30,PosX=64,PosZ=230},            
        wanfoone2zhongxingfu={newSceneId=30,PosX=64,PosZ=230},            
        wanfoone2zhongxingfu={newSceneId=30,PosX=64,PosZ=230},            
         
        zhongxingfu2wanfoone={newSceneId=8,PosX=80,PosZ=228},               
        zhongxingfu2wanfoone={newSceneId=8,PosX=80,PosZ=228},               
        zhongxingfu2wanfoone={newSceneId=8,PosX=80,PosZ=228},               
        zhongxingfu2wanfoone={newSceneId=8,PosX=80,PosZ=228},               
         
        wanfoone2wanfotwo={newSceneId=7,PosX=96,PosZ=13},           
        wanfoone2wanfotwo={newSceneId=7,PosX=96,PosZ=13},           
        wanfoone2wanfotwo={newSceneId=7,PosX=96,PosZ=13},           
        wanfoone2wanfotwo={newSceneId=7,PosX=96,PosZ=13},           
         
         wanfotwo2wanfoone={newSceneId=30,PosX=108,PosZ=22},         
         wanfotwo2wanfoone={newSceneId=30,PosX=108,PosZ=22},         
         wanfotwo2wanfoone={newSceneId=30,PosX=108,PosZ=22},         
         wanfotwo2wanfoone={newSceneId=30,PosX=108,PosZ=22},         
        
         wanfotwo2wanfoshree={newSceneId=32,PosX=94,PosZ=14},    
         wanfotwo2wanfoshree={newSceneId=32,PosX=94,PosZ=14},    
         wanfotwo2wanfoshree={newSceneId=32,PosX=94,PosZ=14},    
         wanfotwo2wanfoshree={newSceneId=32,PosX=94,PosZ=14},    
        
        wanfoshree2wanfotwo={newSceneId=31,PosX=10,PosZ=15},     
        wanfoshree2wanfotwo={newSceneId=31,PosX=10,PosZ=15},     
        wanfoshree2wanfotwo={newSceneId=31,PosX=10,PosZ=15},     
        wanfoshree2wanfotwo={newSceneId=31,PosX=10,PosZ=15},        
         
        shaheone2shahetwo={newSceneId=27,PosX=96,PosZ=13},           
        shaheone2shahetwo={newSceneId=27,PosX=96,PosZ=13},           
        shaheone2shahetwo={newSceneId=27,PosX=96,PosZ=13},           
        shaheone2shahetwo={newSceneId=27,PosX=96,PosZ=13},           
         
         shahetwo2shaheone={newSceneId=26,PosX=108,PosZ=22},         
         shahetwo2shaheone={newSceneId=26,PosX=108,PosZ=22},         
         shahetwo2shaheone={newSceneId=26,PosX=108,PosZ=22},         
         shahetwo2shaheone={newSceneId=26,PosX=108,PosZ=22},         
        
         shahetwo2shaheshree={newSceneId=29,PosX=94,PosZ=14},    
         shahetwo2shaheshree={newSceneId=29,PosX=94,PosZ=14},    
         shahetwo2shaheshree={newSceneId=29,PosX=94,PosZ=14},    
         shahetwo2shaheshree={newSceneId=29,PosX=94,PosZ=14},    
        
        shaheshree2shahetwo={newSceneId=27,PosX=10,PosZ=15},     
        shaheshree2shahetwo={newSceneId=27,PosX=10,PosZ=15},     
        shaheshree2shahetwo={newSceneId=27,PosX=10,PosZ=15},     
        shaheshree2shahetwo={newSceneId=27,PosX=10,PosZ=15}, 
		
		
		
        wangcheng2migongone1={newSceneId=104,PosX=182,PosZ=44},             
        wangcheng2migongone2={newSceneId=204,PosX=68,PosZ=194},            
        wangcheng2migongone3={newSceneId=304,PosX=56,PosZ=68},            
        wangcheng2migongone4={newSceneId=404,PosX=65,PosZ=59},            
         
        migongone2wangcheng1={newSceneId=50,PosX=21,PosZ=92},               
        migongone2wangcheng2={newSceneId=150,PosX=236,PosZ=152},               
        migongone2wangcheng3={newSceneId=250,PosX=21,PosZ=110},               
        migongone2wangcheng4={newSceneId=350,PosX=234,PosZ=163}, 
		
        wangcheng2xiaowuone1={newSceneId=62,PosX=30,PosZ=24},             
        wangcheng2xiaowuone2={newSceneId=162,PosX=30,PosZ=24},            
        wangcheng2xiaowuone3={newSceneId=262,PosX=30,PosZ=24},            
        wangcheng2xiaowuone4={newSceneId=362,PosX=30,PosZ=24},            
         
        xiaowuone2wangcheng1={newSceneId=50,PosX=214,PosZ=390},               
        xiaowuone2wangcheng2={newSceneId=150,PosX=214,PosZ=390},               
        xiaowuone2wangcheng3={newSceneId=250,PosX=214,PosZ=390},               
        xiaowuone2wangcheng4={newSceneId=350,PosX=214,PosZ=390}, 
		
        wangcheng2xiaowutwo1={newSceneId=63,PosX=36,PosZ=23},             
        wangcheng2xiaowutwo2={newSceneId=163,PosX=36,PosZ=23},            
        wangcheng2xiaowutwo3={newSceneId=263,PosX=36,PosZ=23},            
        wangcheng2xiaowutwo4={newSceneId=363,PosX=36,PosZ=23},            
        
        xiaowutwo2wangcheng1={newSceneId=50,PosX=248,PosZ=197},               
        xiaowutwo2wangcheng2={newSceneId=150,PosX=248,PosZ=197},               
        xiaowutwo2wangcheng3={newSceneId=250,PosX=248,PosZ=197},               
        xiaowutwo2wangcheng4={newSceneId=350,PosX=248,PosZ=197}, 
		
        biasnai2minju1={newSceneId=61,PosX=30,PosZ=27},             
        biasnai2minju2={newSceneId=161,PosX=30,PosZ=27},            
        biasnai2minju3={newSceneId=261,PosX=30,PosZ=26},            
        biasnai2minju4={newSceneId=361,PosX=30,PosZ=26},            
        
        minju2biasnai1={newSceneId=51,PosX=155,PosZ=126},               
        minju2biasnai2={newSceneId=151,PosX=76,PosZ=117},               
        minju2biasnai3={newSceneId=251,PosX=153,PosZ=129},               
        minju2biasnai4={newSceneId=351,PosX=99,PosZ=129}, 
		
        dadu2dadumingjuone1={newSceneId=42,PosX=30,PosZ=27},             
        dadu2dadumingjuone2={newSceneId=42,PosX=30,PosZ=27},            
        dadu2dadumingjuone3={newSceneId=42,PosX=30,PosZ=27},            
        dadu2dadumingjuone4={newSceneId=42,PosX=30,PosZ=27},            
        
        dadumingjuone2dadu1={newSceneId=0,PosX=377,PosZ=170},               
        dadumingjuone2dadu2={newSceneId=0,PosX=377,PosZ=170},               
        dadumingjuone2dadu3={newSceneId=0,PosX=377,PosZ=170},               
        dadumingjuone2dadu4={newSceneId=0,PosX=377,PosZ=170}, 
		
        dadu2dadumingjutwo1={newSceneId=43,PosX=36,PosZ=25},             
        dadu2dadumingjutwo2={newSceneId=43,PosX=36,PosZ=25},            
        dadu2dadumingjutwo3={newSceneId=43,PosX=36,PosZ=25},            
        dadu2dadumingjutwo4={newSceneId=43,PosX=36,PosZ=25},            
         
        dadumingjutwo2dadu1={newSceneId=0,PosX=456,PosZ=322},               
        dadumingjutwo2dadu2={newSceneId=0,PosX=456,PosZ=322},               
        dadumingjutwo2dadu3={newSceneId=0,PosX=456,PosZ=322},               
        dadumingjutwo2dadu4={newSceneId=0,PosX=456,PosZ=322}, 
        dadutozhanchegongchang={newSceneId=523,PosX=31,PosZ=21},               
        zhanchegongchangtodadu={newSceneId=0,PosX=157,PosZ=265},  
		
		

		
         
        gubaoone2bageda1={newSceneId=104,PosX=182,PosZ=44},             
        gubaoone2bageda2={newSceneId=204,PosX=68,PosZ=194},            
        gubaoone2bageda3={newSceneId=304,PosX=56,PosZ=68},            
        gubaoone2bageda4={newSceneId=404,PosX=65,PosZ=59},            
         
        bageda2gubaoone1={newSceneId=50,PosX=199,PosZ=199},               
        bageda2gubaoone2={newSceneId=150,PosX=199,PosZ=199},               
        bageda2gubaoone3={newSceneId=250,PosX=199,PosZ=199},               
        bageda2gubaoone4={newSceneId=350,PosX=199,PosZ=199},   	
         
        gubaoone2gubaotwo1={newSceneId=105,PosX=55,PosZ=72},           
        gubaoone2gubaotwo2={newSceneId=205,PosX=189,PosZ=199},           
        gubaoone2gubaotwo3={newSceneId=305,PosX=72,PosZ=60},           
        gubaoone2gubaotwo4={newSceneId=405,PosX=62,PosZ=60},           
         
        gubaotwo2gubaoone1={newSceneId=104,PosX=189,PosZ=192},         
        gubaotwo2gubaoone2={newSceneId=204,PosX=69,PosZ=61},         
        gubaotwo2gubaoone3={newSceneId=304,PosX=205,PosZ=193},         
        gubaotwo2gubaoone4={newSceneId=404,PosX=190,PosZ=197},         
         
        gubaotwo2gubaoshree1={newSceneId=106,PosX=46,PosZ=187},    
        gubaotwo2gubaoshree2={newSceneId=206,PosX=46,PosZ=128},    
        gubaotwo2gubaoshree3={newSceneId=306,PosX=210,PosZ=74},    
        gubaotwo2gubaoshree4={newSceneId=406,PosX=195,PosZ=182},    
         
        gubaoshree2gubaotwoloulan={newSceneId=105,PosX=208,PosZ=195},     
        gubaoshree2gubaotwotianshan={newSceneId=205,PosX=192,PosZ=47},     
        gubaoshree2gubaotwokunlun={newSceneId=305,PosX=50,PosZ=188},     
        gubaoshree2gubaotwodunhuang={newSceneId=405,PosX=50,PosZ=128},  
        
        eerduosi2hannanhe1={newSceneId=107,PosX=71,PosZ=195},     
        eerduosi2hannanhe2={newSceneId=207,PosX=62,PosZ=56},     
        eerduosi2hannanhe3={newSceneId=307,PosX=184,PosZ=48},     
        eerduosi2hannanhe4={newSceneId=407,PosX=72,PosZ=215},  
         
        hannanhe2eerduosi1={newSceneId=106,PosX=210,PosZ=62},     
        hannanhe2eerduosi2={newSceneId=206,PosX=195,PosZ=48},     
        hannanhe2eerduosi3={newSceneId=306,PosX=69,PosZ=195},     
        hannanhe2eerduosi4={newSceneId=406,PosX=57,PosZ=68}, 
          
        baizhanting2bosi1={newSceneId=108,PosX=181,PosZ=50},     
        baizhanting2bosi2={newSceneId=208,PosX=215,PosZ=62},     
        baizhanting2bosi3={newSceneId=308,PosX=189,PosZ=49},     
        baizhanting2bosi4={newSceneId=408,PosX=211,PosZ=199},  
        
        damashige2bosi1={newSceneId=107,PosX=70,PosZ=59},     
        damashige2bosi2={newSceneId=207,PosX=58,PosZ=196},     
        damashige2bosi3={newSceneId=307,PosX=50,PosZ=198},     
        damashige2bosi4={newSceneId=407,PosX=70,PosZ=60},  
        
        jiangjunshree2jiangjuntwo1={newSceneId=109,PosX=180,PosZ=54},       
        jiangjunshree2jiangjuntwo2={newSceneId=209,PosX=212,PosZ=195},     
        jiangjunshree2jiangjuntwo3={newSceneId=309,PosX=191,PosZ=54},        
        jiangjunshree2jiangjuntwo4={newSceneId=409,PosX=60,PosZ=203},  
        
        futuone2biansai1={newSceneId=108,PosX=60,PosZ=129},      
        futuone2biansai2={newSceneId=208,PosX=40,PosZ=193},     
        futuone2biansai3={newSceneId=308,PosX=51,PosZ=128},     
        futuone2biansai4={newSceneId=408,PosX=188,PosZ=46},       
        
				loulanwangcheng2huangyelin={newSceneId=110,PosX=77,PosZ=62},
				laiyinwangcheng2huangyelin={newSceneId=210,PosX=189,PosZ=199},
				kunlunwangcheng2huangyelin={newSceneId=310,PosX=95,PosZ=39},
				dunhuangwangcheng2huangyelin={newSceneId=410,PosX=67,PosZ=195},
				
				loulanhuangyelin2wangcheng={newSceneId=109,PosX=184,PosZ=199},
				laiyinhuangyelin2wangcheng={newSceneId=209,PosX=55,PosZ=67},
				kunlunhuangyelin2wangcheng={newSceneId=309,PosX=188,PosZ=195},
				dunhuanghuangyelin2wangcheng={newSceneId=409,PosX=207,PosZ=64},	
				
				migong7ceng2migong8cengloulan={newSceneId=111,PosX=201,PosZ=193},
				migong7ceng2migong8cengtianshan={newSceneId=211,PosX=194,PosZ=197},
				migong7ceng2migong8cengkunlun={newSceneId=311,PosX=76,PosZ=65},
				migong7ceng2migong8cengdunhuang={newSceneId=411,PosX=61,PosZ=61},	
				
			  migong8ceng2migong7cengloulan={newSceneId=110,PosX=64,PosZ=222},
				migong8ceng2migong7cengtianshan={newSceneId=210,PosX=190,PosZ=42},
				migong8ceng2migong7cengkunlun={newSceneId=310,PosX=211,PosZ=60},
				migong8ceng2migong7cengdunhuang={newSceneId=410,PosX=67,PosZ=58},	
         
        wangcheng2hannanheloulan={newSceneId=98,PosX=92,PosZ=219},     
        wangcheng2hannanhetianshan={newSceneId=198,PosX=92,PosZ=219},     
        wangcheng2hannanhekunlun={newSceneId=298,PosX=92,PosZ=219},     
        wangcheng2hannanhedunhuang={newSceneId=398,PosX=92,PosZ=219},  
         
        hannanheloulan2wangcheng={newSceneId=50,PosX=57,PosZ=52},     
        hannanhetianshan2wangcheng={newSceneId=150,PosX=57,PosZ=52},     
        hannanhekunlun2wangcheng={newSceneId=250,PosX=57,PosZ=52},     
        hannanhedunhuang2wangcheng={newSceneId=350,PosX=57,PosZ=52},  
         
        hannanhe2qiyan0={newSceneId=99,PosX=216,PosZ=24},     
        hannanhe2qiyan1={newSceneId=199,PosX=216,PosZ=24},     
        hannanhe2qiyan2={newSceneId=299,PosX=216,PosZ=24},     
        hannanhe2qiyan3={newSceneId=399,PosX=216,PosZ=24},  
         
        qiyan2hannanhe0={newSceneId=98,PosX=221,PosZ=210},     
        qiyan2hannanhe1={newSceneId=198,PosX=221,PosZ=210},     
        qiyan2hannanhe2={newSceneId=298,PosX=221,PosZ=210},     
        qiyan2hannanhe3={newSceneId=398,PosX=221,PosZ=210},  
         
        qiyan2nainan0={newSceneId=102,PosX=227,PosZ=124},     
        qiyan2nainan1={newSceneId=202,PosX=227,PosZ=124},     
        qiyan2nainan2={newSceneId=302,PosX=227,PosZ=124},     
        qiyan2nainan3={newSceneId=402,PosX=227,PosZ=124},               
         
        qiyan2tataer0={newSceneId=100,PosX=29,PosZ=144},
        qiyan2tataer1={newSceneId=200,PosX=29,PosZ=144},     
        qiyan2tataer2={newSceneId=300,PosX=29,PosZ=144},     
        qiyan2tataer3={newSceneId=400,PosX=29,PosZ=144},  
        
        tataer2qiyan0={newSceneId=99,PosX=232,PosZ=216},     
        tataer2qiyan1={newSceneId=199,PosX=232,PosZ=216},     
        tataer2qiyan2={newSceneId=299,PosX=232,PosZ=216},     
        tataer2qiyan3={newSceneId=399,PosX=232,PosZ=216},  
         
        qiyan2kelie0={newSceneId=101,PosX=147,PosZ=48},     
        qiyan2kelie1={newSceneId=201,PosX=147,PosZ=48},     
        qiyan2kelie2={newSceneId=301,PosX=147,PosZ=48},     
        qiyan2kelie3={newSceneId=401,PosX=147,PosZ=48},  
         
        naiman2qiyan0={newSceneId=99,PosX=24,PosZ=123},     
        naiman2qiyan1={newSceneId=199,PosX=24,PosZ=123},     
        naiman2qiyan2={newSceneId=299,PosX=24,PosZ=123},     
        naiman2qiyan3={newSceneId=399,PosX=24,PosZ=123},  
         
        tatare2qiyan0={newSceneId=99,PosX=100,PosZ=100},     
        tatare2qiyan1={newSceneId=199,PosX=100,PosZ=100},     
        tatare2qiyan2={newSceneId=299,PosX=100,PosZ=100},     
        tatare2qiyan3={newSceneId=399,PosX=100,PosZ=100},  
         
        kelie2qiyan0={newSceneId=99,PosX=102,PosZ=230},     
        kelie2qiyan1={newSceneId=199,PosX=102,PosZ=230},     
        kelie2qiyan2={newSceneId=299,PosX=102,PosZ=230},     
        kelie2qiyan3={newSceneId=399,PosX=102,PosZ=230},  
         
        kelie2juyongguan0={newSceneId=103,PosX=90,PosZ=31},     
        kelie2juyongguan1={newSceneId=203,PosX=90,PosZ=31},     
        kelie2juyongguan2={newSceneId=303,PosX=90,PosZ=31},     
        kelie2juyongguan3={newSceneId=403,PosX=90,PosZ=31},  
        
        juyongguan2tataer0={newSceneId=101,PosX=127,PosZ=218},     
        juyongguan2tataer1={newSceneId=201,PosX=127,PosZ=218},     
        juyongguan2tataer2={newSceneId=301,PosX=127,PosZ=218},     
        juyongguan2tataer3={newSceneId=401,PosX=127,PosZ=218},  
         
        juyongguan2dadu0={newSceneId=38,PosX=167,PosZ=26},     
        juyongguan2dadu1={newSceneId=38,PosX=167,PosZ=26},     
        juyongguan2dadu2={newSceneId=38,PosX=167,PosZ=26},     
        juyongguan2dadu3={newSceneId=38,PosX=167,PosZ=26},  
         
        dadu2juyongguan0={newSceneId=103,PosX=205,PosZ=230},     
        dadu2juyongguan1={newSceneId=203,PosX=205,PosZ=230},     
        dadu2juyongguan2={newSceneId=303,PosX=205,PosZ=230},     
        dadu2juyongguan3={newSceneId=403,PosX=205,PosZ=230},  
         
        suiyecheng2samaerhan={newSceneId=11,PosX=233,PosZ=163},     
        suiyecheng2samaerhan={newSceneId=11,PosX=233,PosZ=163},     
        suiyecheng2samaerhan={newSceneId=11,PosX=233,PosZ=163},     
        suiyecheng2samaerhan={newSceneId=11,PosX=233,PosZ=163},  
         
        suiyecheng2hongshamo={newSceneId=10,PosX=229,PosZ=140},     
        suiyecheng2hongshamo={newSceneId=10,PosX=229,PosZ=140},     
        suiyecheng2hongshamo={newSceneId=10,PosX=229,PosZ=140},     
        suiyecheng2hongshamo={newSceneId=10,PosX=229,PosZ=140},  
         
        samaerhan2suiyecheng={newSceneId=10,PosX=36,PosZ=124},     
        samaerhan2suiyecheng={newSceneId=10,PosX=36,PosZ=124},     
        samaerhan2suiyecheng={newSceneId=10,PosX=36,PosZ=124},     
        samaerhan2suiyecheng={newSceneId=10,PosX=36,PosZ=124},  
        
        hongshamo2suiyecheng={newSceneId=9,PosX=24,PosZ=178},     
        hongshamo2suiyecheng={newSceneId=9,PosX=24,PosZ=178},     
        hongshamo2suiyecheng={newSceneId=9,PosX=24,PosZ=178},     
        hongshamo2suiyecheng={newSceneId=9,PosX=24,PosZ=178},  
         
        hongshamo2bageda={newSceneId=13,PosX=222,PosZ=158},     
        hongshamo2bageda={newSceneId=13,PosX=222,PosZ=158},     
        hongshamo2bageda={newSceneId=13,PosX=222,PosZ=158},     
        hongshamo2bageda={newSceneId=13,PosX=222,PosZ=158},  
         
        bageda2mosike1={newSceneId=17,PosX=188,PosZ=230},     
        bageda2mosike2={newSceneId=17,PosX=188,PosZ=230},     
        bageda2mosike3={newSceneId=17,PosX=188,PosZ=230},     
        bageda2mosike4={newSceneId=17,PosX=188,PosZ=230},  
        
        bageda2hongshamo={newSceneId=11,PosX=18,PosZ=126},     
        bageda2hongshamo={newSceneId=11,PosX=18,PosZ=126},     
        bageda2hongshamo={newSceneId=11,PosX=18,PosZ=126},     
        bageda2hongshamo={newSceneId=11,PosX=18,PosZ=126},  
         
        bageda2bosi={newSceneId=16,PosX=65,PosZ=34},     
        bageda2bosi={newSceneId=16,PosX=65,PosZ=34},     
        bageda2bosi={newSceneId=16,PosX=65,PosZ=34},     
        bageda2bosi={newSceneId=16,PosX=65,PosZ=34},  
          
        mosike2bageda1={newSceneId=13,PosX=34,PosZ=30},     
        mosike2bageda2={newSceneId=13,PosX=34,PosZ=30},     
        mosike2bageda3={newSceneId=13,PosX=34,PosZ=30},     
        mosike2bageda4={newSceneId=13,PosX=34,PosZ=30},  
         
        mosike2jifu={newSceneId=18,PosX=222,PosZ=222},     
        mosike2jifu={newSceneId=18,PosX=222,PosZ=222},     
        mosike2jifu={newSceneId=18,PosX=222,PosZ=222},     
        mosike2jifu={newSceneId=18,PosX=222,PosZ=222},  
         
        jifu2bolan0={newSceneId=19,PosX=230,PosZ=148},     
        jifu2bolan1={newSceneId=19,PosX=230,PosZ=148},     
        jifu2bolan2={newSceneId=19,PosX=230,PosZ=148},     
        jifu2bolan3={newSceneId=19,PosX=230,PosZ=148},  
         
        bolan2jifu0={newSceneId=18,PosX=23,PosZ=62},     
        bolan2jifu1={newSceneId=18,PosX=23,PosZ=62},     
        bolan2jifu2={newSceneId=18,PosX=23,PosZ=62},     
        bolan2jifu3={newSceneId=18,PosX=23,PosZ=62},  
        
        bolan2xiongyali0={newSceneId=20,PosX=228,PosZ=22},     
        bolan2xiongyali1={newSceneId=20,PosX=228,PosZ=22},     
        bolan2xiongyali2={newSceneId=20,PosX=228,PosZ=22},     
        bolan2xiongyali3={newSceneId=20,PosX=228,PosZ=22},  
         
        xiongyali2bolan0={newSceneId=19,PosX=23,PosZ=213},     
        xiongyali2bolan1={newSceneId=19,PosX=23,PosZ=213},     
        xiongyali2bolan2={newSceneId=19,PosX=23,PosZ=213},     
        xiongyali2bolan3={newSceneId=19,PosX=23,PosZ=213},  
         
        xiongyali2luoma={newSceneId=21,PosX=227,PosZ=37},     
        xiongyali2luoma={newSceneId=21,PosX=227,PosZ=37},     
        xiongyali2luoma={newSceneId=21,PosX=227,PosZ=37},     
        xiongyali2luoma={newSceneId=21,PosX=227,PosZ=37},  
        
        luoma2xiongyali={newSceneId=20,PosX=26,PosZ=229},     
        luoma2xiongyali={newSceneId=20,PosX=26,PosZ=229},     
        luoma2xiongyali={newSceneId=20,PosX=26,PosZ=229},     
        luoma2xiongyali={newSceneId=20,PosX=26,PosZ=229},  
         
        wangcheng2hougong0={newSceneId=70,PosX=64,PosZ=118},     
        wangcheng2hougong1={newSceneId=170,PosX=64,PosZ=118},     
        wangcheng2hougong2={newSceneId=270,PosX=64,PosZ=118},     
        wangcheng2hougong3={newSceneId=370,PosX=64,PosZ=118},  
        
        hougong2wangcheng0={newSceneId=50,PosX=255,PosZ=37},     
        hougong2wangcheng1={newSceneId=150,PosX=255,PosZ=37},     
        hougong2wangcheng2={newSceneId=250,PosX=255,PosZ=37},     
        hougong2wangcheng3={newSceneId=350,PosX=255,PosZ=37}, 
        
        jifu2mosike={newSceneId=17,PosX=30,PosZ=66},     
        jifu2mosike={newSceneId=17,PosX=30,PosZ=66},     
        jifu2mosike={newSceneId=17,PosX=30,PosZ=66},     
        jifu2mosike={newSceneId=17,PosX=30,PosZ=66},  
           
        bosi2bageda={newSceneId=13,PosX=139,PosZ=227},     
        bosi2bageda={newSceneId=13,PosX=138,PosZ=227},     
        bosi2bageda={newSceneId=13,PosX=138,PosZ=227},     
        bosi2bageda={newSceneId=13,PosX=138,PosZ=227},  
         
        baizhanting2luoma0={newSceneId=21,PosX=231,PosZ=217},     
        baizhanting2luoma1={newSceneId=21,PosX=231,PosZ=217},     
        baizhanting2luoma2={newSceneId=21,PosX=231,PosZ=217},     
        baizhanting2luoma3={newSceneId=21,PosX=231,PosZ=217},  
        
        luoma2baizhanting0={newSceneId=22,PosX=34,PosZ=111},     
        luoma2baizhanting1={newSceneId=22,PosX=34,PosZ=111},     
        luoma2baizhanting2={newSceneId=22,PosX=34,PosZ=111},     
        luoma2baizhanting3={newSceneId=22,PosX=34,PosZ=111},  
         
        baizhanting2damashige0={newSceneId=23,PosX=55,PosZ=68},     
        baizhanting2damashige1={newSceneId=23,PosX=55,PosZ=68},     
        baizhanting2damashige2={newSceneId=23,PosX=55,PosZ=68},     
        baizhanting2damashige3={newSceneId=23,PosX=55,PosZ=68},  
       
        damashige2baizhanting0={newSceneId=22,PosX=178,PosZ=82},     
        damashige2baizhanting1={newSceneId=22,PosX=178,PosZ=82},     
        damashige2baizhanting2={newSceneId=22,PosX=178,PosZ=82},     
        damashige2baizhanting3={newSceneId=22,PosX=178,PosZ=82},  
         
        damashige2yelusaileng0={newSceneId=24,PosX=133,PosZ=21},     
        damashige2yelusaileng1={newSceneId=24,PosX=133,PosZ=21},     
        damashige2yelusaileng2={newSceneId=24,PosX=133,PosZ=21},     
        damashige2yelusaileng3={newSceneId=24,PosX=133,PosZ=21},  
          
        yelusaileng2damashige0={newSceneId=23,PosX=107,PosZ=233},     
        yelusaileng2damashige1={newSceneId=23,PosX=107,PosZ=233},     
        yelusaileng2damashige2={newSceneId=23,PosX=107,PosZ=233},     
        yelusaileng2damashige3={newSceneId=23,PosX=107,PosZ=233},  
       
        yelusaleng2xinaibandao0={newSceneId=25,PosX=121,PosZ=24},     
        yelusaleng2xinaibandao1={newSceneId=25,PosX=121,PosZ=24},     
        yelusaleng2xinaibandao2={newSceneId=25,PosX=121,PosZ=24},     
        yelusaleng2xinaibandao3={newSceneId=25,PosX=121,PosZ=24},  
          
        xinaibandao2yelusaleng0={newSceneId=24,PosX=121,PosZ=224},     
        xinaibandao2yelusaleng1={newSceneId=24,PosX=121,PosZ=224},     
        xinaibandao2yelusaleng2={newSceneId=24,PosX=121,PosZ=224},     
        xinaibandao2yelusaleng3={newSceneId=24,PosX=121,PosZ=224},  
        
        
         
        bianjingshang2andao0={newSceneId=76,PosX=29,PosZ=11},     
        bianjingshang2andao1={newSceneId=176,PosX=29,PosZ=11},     
        bianjingshang2andao2={newSceneId=276,PosX=29,PosZ=11},     
        bianjingshang2andao3={newSceneId=376,PosX=29,PosZ=11},   
        
        bianjingxia2andao0={newSceneId=76,PosX=50,PosZ=52},     
        bianjingxia2andao1={newSceneId=176,PosX=50,PosZ=52},     
        bianjingxia2andao2={newSceneId=276,PosX=50,PosZ=52},     
        bianjingxia2andao3={newSceneId=376,PosX=50,PosZ=52},   
         
        bianjingrenwu2andao0={newSceneId=76,PosX=14,PosZ=52},     
        bianjingrenwu2andao1={newSceneId=176,PosX=14,PosZ=52},     
        bianjingrenwu2andao2={newSceneId=276,PosX=14,PosZ=52},     
        bianjingrenwu2andao3={newSceneId=376,PosX=14,PosZ=52},   
         
        andao2bianjingshang0={newSceneId=51,PosX=340,PosZ=159},     
        andao2bianjingshang1={newSceneId=151,PosX=340,PosZ=159},     
        andao2bianjingshang2={newSceneId=251,PosX=340,PosZ=159},     
        andao2bianjingshang3={newSceneId=351,PosX=340,PosZ=159},   
        
        andao2bianjingxai0={newSceneId=51,PosX=287,PosZ=252},     
        andao2bianjingxai1={newSceneId=151,PosX=287,PosZ=252},     
        andao2bianjingxai2={newSceneId=251,PosX=287,PosZ=252},     
        andao2bianjingxai3={newSceneId=351,PosX=287,PosZ=252},   
         
        andao2bianjingrenwu0={newSceneId=51,PosX=403,PosZ=267},     
        andao2bianjingrenwu1={newSceneId=151,PosX=403,PosZ=267},     
        andao2bianjingrenwu2={newSceneId=251,PosX=403,PosZ=267},     
        andao2bianjingrenwu3={newSceneId=351,PosX=403,PosZ=267},     
                
        
        bianjing2mishione0={newSceneId=524,PosX=260,PosZ=425},     
        bianjing2mishione1={newSceneId=524,PosX=260,PosZ=425},     
        bianjing2mishione2={newSceneId=524,PosX=260,PosZ=425},     
        bianjing2mishione3={newSceneId=524,PosX=260,PosZ=425},   
         
        bianjing2mishitwo0={newSceneId=0,PosX=255,PosZ=51},     
        bianjing2mishitwo1={newSceneId=0,PosX=255,PosZ=51},     
        bianjing2mishitwo2={newSceneId=0,PosX=255,PosZ=51},     
        bianjing2mishitwo3={newSceneId=0,PosX=255,PosZ=51},   
        
        mishione2bianjing0={newSceneId=51,PosX=178,PosZ=32},     
        mishione2bianjing1={newSceneId=151,PosX=118,PosZ=30},     
        mishione2bianjing2={newSceneId=251,PosX=94,PosZ=211},     
        mishione2bianjing3={newSceneId=351,PosX=95,PosZ=218},   
        
        mishitwo2bianjing0={newSceneId=51,PosX=97,PosZ=209},     
        mishitwo2bianjing1={newSceneId=151,PosX=172,PosZ=203},     
        mishitwo2bianjing2={newSceneId=251,PosX=94,PosZ=41},     
        mishitwo2bianjing3={newSceneId=351,PosX=144,PosZ=25},     
         
        dunhuangbiansaidongkou1={newSceneId=351,PosX=144,PosZ=25},
        
        kunlunbiansaidongkou1={newSceneId=251,PosX=94,PosZ=41},
        
        tianshanbiansaidongkou1={newSceneId=151,PosX=172,PosZ=203},
        
        loulanbiansaidongkou1={newSceneId=51,PosX=97,PosZ=209},                                                                              
				
	
	dunhuangwangchengdongkou1={newSceneId=350,PosX=234,PosZ=163},
	dunhuangwangchengdongkou2={newSceneId=364,PosX=24,PosZ=29},
	
	kunlunwangchengdongkou1={newSceneId=250,PosX=21,PosZ=111},
	kunlunwangchengdongkou2={newSceneId=264,PosX=109,PosZ=97},
	
	tianshanwangchengdongkou1={newSceneId=150,PosX=236,PosZ=152},
	tianshanwangchengdongkou2={newSceneId=164,PosX=113,PosZ=25},
	
	loulanwangchengdongkou1={newSceneId=50,PosX=21,PosZ=92},
	loulanwangchengdongkou2={newSceneId=64,PosX=29,PosZ=26},             
	
	dunhuangandaodongkou1={newSceneId=350,PosX=234,PosZ=163},
	dunhuangandaodongkou2={newSceneId=350,PosX=234,PosZ=163},
	
	kunlunandaodongkou1={newSceneId=250,PosX=21,PosZ=111},
	kunlunandaodongkou2={newSceneId=250,PosX=21,PosZ=111},
	
	tianshanandaodongkou1={newSceneId=150,PosX=236,PosZ=152},
	tianshanandaodongkou2={newSceneId=150,PosX=236,PosZ=152},		
	
	loulanandaodongkou1={newSceneId=50,PosX=21,PosZ=92},
	loulanandaodongkou2={newSceneId=50,PosX=21,PosZ=92},				
	
	dadudongkou1={newSceneId=0,PosX=211,PosZ=163}, 
	
	daduhuayuandongkou1={newSceneId=0,PosX=211,PosZ=163},
	
	daduhuayuantohuanggong={newSceneId=41,PosX=112,PosZ=69},
	
	huanggongtodaduhuayuan={newSceneId=44,PosX=64,PosZ=105},




	daduhuayuantodadumigong={newSceneId=45,PosX=32.044044,PosZ=110.898979},

	dadumigong1todadumigong2={newSceneId=46,PosX=95.598656,PosZ=29.751474},

	dadumigong2todadumigong3={newSceneId=47,PosX=104.522667,PosZ=34.328049},

	dadumigong3todadumigong4={newSceneId=48,PosX=114.592857,PosZ=108.612801},

	dadumigong4todadumigong5={newSceneId=49,PosX=104.664734,PosZ=104.025887},
	
	dadumigong1todaduhuayuan={newSceneId=44,PosX=280.449219,PosZ=254.90036},
	
	dadumigong2todadumigong1={newSceneId=45,PosX=100.961998,PosZ=19.212099},
	
	dadumigong3todadumigong2={newSceneId=46,PosX=54.030174,PosZ=27.522741},
	
	dadumigong4todadumigong3={newSceneId=47,PosX=48.44746,PosZ=29.247614},

  dadumigong5todadumigong4={newSceneId=48,PosX=27.374895,PosZ=112.675156},
  
  
  huanggongtohuanggongmidao={newSceneId=477,PosX=14,PosZ=114.5},
  
  huanggongmidaotohuanggong={newSceneId=41,PosX=115,PosZ=24},
  
  huanggongmidaotohougonghuayuan={newSceneId=44,PosX=339,PosZ=392},
  
  hougonghuayuantohuanggongmidao={newSceneId=477,PosX=111.121086,PosZ=101.498306},
  
  houhuayuantohouhuayuanmidao={newSceneId=470,PosX=25.400499,PosZ=23.5518},
  houhuayuantohouhuayuanmidao1={newSceneId=470,PosX=74.706505,PosZ=20.447237},
  
  houhuayuanmidaotohouhuayuan={newSceneId=44,PosX=353,PosZ=155},
  
  houhuayuanmidaotohouhuayuan1={newSceneId=44,PosX=272,PosZ=234},
  
  huanggonghuayuantoxianrengu1loulan={newSceneId=465,PosX=97.667397,PosZ=88.997101},
  huanggonghuayuantoxianrengu1tianshan={newSceneId=465,PosX=29.947901,PosZ=20.8274},
  huanggonghuayuantoxianrengu1kunlun={newSceneId=465,PosX=28.7339,PosZ=105.487},
  huanggonghuayuantoxianrengu1dunhuang={newSceneId=465,PosX=96.150299,PosZ=17.9025},
  
  houhuayuantominju1={newSceneId=520,PosX=30.180626,PosZ=25.461679},
  minju1tohouhuayuan={newSceneId=44,PosX=153.259659,PosZ=336.231384},
  houhuayuantominju2={newSceneId=521,PosX=35.328285,PosZ=23.038401},
  minju2tohouhuayuan={newSceneId=44,PosX=481.625641,PosZ=389.400726},
  houhuayuantominju3={newSceneId=522,PosX=35.180626,PosZ=23.461679},
  minju3tohouhuayuan={newSceneId=44,PosX=269,PosZ=212},
	loulantosichouzhilu={newSceneId=67,PosX=84,PosZ=206},
	sichouzhilutoloulan={newSceneId=51,PosX=61,PosZ=283},	
			
	tianshantosichouzhilu={newSceneId=167,PosX=152,PosZ=207},
	sichouzhilutotianshan={newSceneId=151,PosX=61,PosZ=283},
				
	kunluntosichouzhilu={newSceneId=267,PosX=104,PosZ=48},
	sichouzhilutokunlun={newSceneId=251,PosX=61,PosZ=283},
		
	dunhuangtosichouzhilu={newSceneId=367,PosX=170,PosZ=47},
	sichouzhilutodunhuang={newSceneId=351,PosX=61,PosZ=283},
				
	loulansichouzhilutoshabake={newSceneId=472,PosX=436,PosZ=361},
	shabaketoloulansichouzhilu={newSceneId=67,PosX=104,PosZ=48},
				
	tianshansichouzhilutoshabake={newSceneId=472,PosX=296,PosZ=470},
	shabaketotianshansichouzhilu={newSceneId=167,PosX=171,PosZ=48},
				
	kunlunsichouzhilutoshabake={newSceneId=472,PosX=163,PosZ=452},
	shabaketokunlunsichouzhilu={newSceneId=267,PosX=83,PosZ=205},
				
	dunhuangsichouzhilutoshabake={newSceneId=472,PosX=416,PosZ=475},
	shabaketodunhuangsichouzhilu={newSceneId=367,PosX=150,PosZ=205},
				
  shabaketominju1={newSceneId=550,PosX=30.180626,PosZ=24.461679},
  minju1toshabake={newSceneId=472,PosX=127.180626,PosZ=399.461679},
  
  shabaketominju2={newSceneId=551,PosX=36.180626,PosZ=23.461679},
  minju2toshabake={newSceneId=472,PosX=228.180626,PosZ=409.461679},
  
  shabaketominju3={newSceneId=552,PosX=30.180626,PosZ=24.461679},
  minju3toshabake={newSceneId=472,PosX=342.180626,PosZ=393.461679},
  
  shabaketominju4={newSceneId=553,PosX=36.180626,PosZ=23.461679},
  minju4toshabake={newSceneId=472,PosX=459.180626,PosZ=316.461679},
  
  shabaketominju5={newSceneId=554,PosX=36.180626,PosZ=23.461679},
  minju5toshabake={newSceneId=472,PosX=193.180626,PosZ=184.461679},
  
  shabaketominju6={newSceneId=555,PosX=36.180626,PosZ=23.461679},
  minju6toshabake={newSceneId=472,PosX=316.180626,PosZ=183.461679},
  
  shabaketominju7={newSceneId=556,PosX=30.180626,PosZ=24.461679},
  minju7toshabake={newSceneId=472,PosX=219.180626,PosZ=135.461679},
  
  shabaketominju8={newSceneId=557,PosX=36.180626,PosZ=23.461679},
  minju8toshabake={newSceneId=472,PosX=292.180626,PosZ=137.461679},
  
  shabaketominju9={newSceneId=558,PosX=36.180626,PosZ=23.461679},
  minju9toshabake={newSceneId=472,PosX=210.180626,PosZ=84.461679},
  
  shabaketominju10={newSceneId=559,PosX=36.180626,PosZ=23.461679},
  minju10toshabake={newSceneId=472,PosX=319.180626,PosZ=91.461679},
  
  shabaketominju11={newSceneId=560,PosX=30.180626,PosZ=24.461679},
  minju11toshabake={newSceneId=472,PosX=41.180626,PosZ=127.461679},
  
  shabaketominju12={newSceneId=561,PosX=36.180626,PosZ=23.461679},
  minju12toshabake={newSceneId=472,PosX=105.180626,PosZ=109.461679},
  
  shabaketominju13={newSceneId=562,PosX=30.180626,PosZ=24.461679},
  minju13toshabake={newSceneId=472,PosX=384.180626,PosZ=111.461679},
  
  shabaketominju14={newSceneId=563,PosX=36.180626,PosZ=23.461679},
  minju14toshabake={newSceneId=472,PosX=394.180626,PosZ=90.461679},
  
  shabaketohuanggong={newSceneId=564,PosX=63.180626,PosZ=116.461679},
  huanggongtoshabake={newSceneId=472,PosX=255.180626,PosZ=61.461679},
  
  shabaketoximidao1={newSceneId=565,PosX=25.180626,PosZ=23.461679},
  ximidao1toshabake={newSceneId=472,PosX=77.180626,PosZ=195.461679},
  
  shabaketoximidao2={newSceneId=565,PosX=81.180626,PosZ=99.461679},
  ximidao2toshabake={newSceneId=554,PosX=39.180626,PosZ=39.461679},
  
  shabaketoximidao3={newSceneId=565,PosX=74.180626,PosZ=21.461679},
  ximidao3toshabake={newSceneId=558,PosX=39.180626,PosZ=39.461679},
  
  shabaketodongmidao1={newSceneId=566,PosX=102.180626,PosZ=103.461679},
  dongmidao1toshabake={newSceneId=472,PosX=404.180626,PosZ=156.461679},
  
  shabaketodongmidao2={newSceneId=566,PosX=53.180626,PosZ=107.461679},
  dongmidao2toshabake={newSceneId=555,PosX=39.180626,PosZ=39.461679},
  
  shabaketodongmidao3={newSceneId=566,PosX=46.180626,PosZ=28.461679},
  dongmidao3toshabake={newSceneId=559,PosX=39.180626,PosZ=39.461679},
 
  xianrengu1tohuanggonghuayuan={newSceneId=44,PosX=353.142456,PosZ=490.102783},
  
  xianrengu1toxianrengu2={newSceneId=466,PosX=112.362,PosZ=20.053499},
  
  xianrengu2toxianrengu1={newSceneId=465,PosX=66,PosZ=69},
  
  xianrengu2toxianrengu3={newSceneId=467,PosX=104.580116,PosZ=93.690613},
  
  xianrengu3toxianrengu2={newSceneId=466,PosX=58.275181,PosZ=74.220879},
  
  xianrengu3toxianrengu4={newSceneId=468,PosX=106.611481,PosZ=15.314136},
  
  xianrengu4toxianrengu5={newSceneId=469,PosX=16.768862,PosZ=66.699593},
  
  xianrengu4toxianrengu3={newSceneId=467,PosX=21.7526,PosZ=32.347401},
  
  xianrengu5toxianrengu4={newSceneId=468,PosX=22.559799,PosZ=101.626999},
  
  
  weihaigangtoduimadao={newSceneId=26,PosX=52.310234,PosZ=59.354321},

	duimadaotoweihaigang={newSceneId=15,PosX=187.264008,PosZ=73.332298},
	
	duimadaotofugang={newSceneId=27,PosX=40.029202,PosZ=127.567001},
	
	fugangtoduimadao={newSceneId=26,PosX=224.457397,PosZ=119.998192},
	
	fugangtojiuzhoudao={newSceneId=29,PosX=49.716385,PosZ=127.136482},
	
	jiuzhoudaotofugang={newSceneId=27,PosX=228.763718,PosZ=119.746048},


	dunhuangmidong110todunhuangwangcheng={newSceneId=350,PosX=61,PosZ=390},

	kunlunmidong110tokunlunwangcheng={newSceneId=250,PosX=61,PosZ=390},

	tianshanmidong110totianshanwangcheng={newSceneId=150,PosX=61,PosZ=390},

	loulanmidong110toloulanwangcheng={newSceneId=50,PosX=61,PosZ=390},
																				
	shabaketohuanggongmishi	= {newSceneId=564, PosX=114, PosZ=17},
				
				
	--成三传送        
        minju3biasnai11={newSceneId=58,PosX=30,PosZ=25},               
        minju3biasnai12={newSceneId=158,PosX=30,PosZ=22},               
        minju3biasnai13={newSceneId=258,PosX=30,PosZ=25},               
        minju3biasnai14={newSceneId=358,PosX=30,PosZ=22},         
        
        minju3biasnai21={newSceneId=59,PosX=30,PosZ=25},               
        minju3biasnai22={newSceneId=159,PosX=30,PosZ=22},               
        minju3biasnai23={newSceneId=259,PosX=30,PosZ=25},               
        minju3biasnai24={newSceneId=359,PosX=30,PosZ=22},        
        
        minju3biasnai31={newSceneId=60,PosX=30,PosZ=25},               
        minju3biasnai32={newSceneId=160,PosX=30,PosZ=22},               
        minju3biasnai33={newSceneId=260,PosX=30,PosZ=25},               
        minju3biasnai34={newSceneId=360,PosX=30,PosZ=22},        
        
        minju3biasnai41={newSceneId=61,PosX=30,PosZ=25},               
        minju3biasnai42={newSceneId=161,PosX=30,PosZ=22},               
        minju3biasnai43={newSceneId=261,PosX=30,PosZ=25},               
        minju3biasnai44={newSceneId=361,PosX=30,PosZ=22},
        
        minju3biasnai51={newSceneId=51,PosX=46,PosZ=137},               
        minju3biasnai52={newSceneId=151,PosX=46,PosZ=137},               
        minju3biasnai53={newSceneId=251,PosX=46,PosZ=137},               
        minju3biasnai54={newSceneId=351,PosX=46,PosZ=137},         
        
        minju3biasnai61={newSceneId=51,PosX=283,PosZ=176},               
        minju3biasnai62={newSceneId=151,PosX=283,PosZ=176},               
        minju3biasnai63={newSceneId=251,PosX=283,PosZ=176},               
        minju3biasnai64={newSceneId=351,PosX=283,PosZ=176},        
        
        minju3biasnai71={newSceneId=51,PosX=470,PosZ=222},               
        minju3biasnai72={newSceneId=151,PosX=470,PosZ=222},               
        minju3biasnai73={newSceneId=251,PosX=470,PosZ=222},               
        minju3biasnai74={newSceneId=351,PosX=470,PosZ=222},        
        
        minju3biasnai81={newSceneId=51,PosX=414,PosZ=407},               
        minju3biasnai82={newSceneId=151,PosX=414,PosZ=407},               
        minju3biasnai83={newSceneId=251,PosX=414,PosZ=407},               
        minju3biasnai84={newSceneId=351,PosX=414,PosZ=407},			
        
        minju3biasnai85={newSceneId=351,PosX=414,PosZ=407},			
        minju3biasnai86={newSceneId=351,PosX=414,PosZ=407},			
        minju3biasnai87={newSceneId=351,PosX=414,PosZ=407},			
				
				
				
				
				
				
				} 








function	x800019_TransferToWorld(varMap, varPlayer, Pos)





























		x800019_TransferFunc(varMap, varPlayer, CJSH_WorldPos[Pos].newSceneId, CJSH_WorldPos[Pos].PosX, CJSH_WorldPos[Pos].PosZ)




end
