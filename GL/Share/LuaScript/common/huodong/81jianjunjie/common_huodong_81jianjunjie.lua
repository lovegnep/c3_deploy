--怪物突袭

x302538_g_ScriptId = 302538;
x302538_g_GameOpenId = 1105;
x302538_g_ValidScene = {3,544};	
		--有效场景
x302538_var_FeastId = 13
x302538_radius = 30
x302538_CountryName = {"楼兰","天山","昆仑","敦煌"}
x302538_var_PROTECTINFO = {ScneneTimerIndex = -1,  StartTime = 0}
x302538_liveTime =3600000
x302538_var_serverId ={539,540,541,542,543,544}
x302538_Name = ""
x302538_Title =""
x302538_Buff = {32583 ,32072}
x302538_var_doing = -1
x302538_king_objId ={400261,400262,400263,400264,-1}
------=======================================================================------
x302538_mark_a = 1
if x302538_var_BossObj == nil then
x302538_var_TimeMark = 0
x302538_var_GetGift = {1,1,1,1}
--区域阵营id
x302538_var_CompID = {}
--区域杀怪计数
x302538_var_Comp = {0,0,0,0,0}
--守边大将obj存储
x302538_var_BossObj = {}
x302538_var_monsterObj = {}
x302538_var_monsterObj1 ={}

end
----==========================================================================-----
x302538_BuffId = 7767
--boss
x302538_g_MonsterInfo = {
										 { id = 61823, baseAI = 5, highAI = 1011, campId = 16, liveTime = 60 * 60 * 1000, name = "楼兰指挥官", title = " ", dir = 0 },
										 { id = 61824, baseAI = 5, highAI = 1011, campId = 17, liveTime = 60 * 60 * 1000, name = "天山指挥官", title = " ", dir = 0 },
										 { id = 61825, baseAI = 5, highAI = 1011, campId = 18, liveTime = 60 * 60 * 1000, name = "昆仑指挥官", title = " ", dir = 0 },
										 { id = 61826, baseAI = 5, highAI = 1011, campId = 19, liveTime = 60 * 60 * 1000, name = "敦煌指挥官", title = " ", dir = 0 },
										 { id = 61823, baseAI = 5, highAI = 1011, campId = 21, liveTime = 60 * 60 * 1000, name = "联军总指挥官", title = " ", dir = 0 },
												}
					
--小怪
x302538_g_Monster ={
										{ id = 61819, baseAI = 5, highAI = -1, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
										{ id = 61820, baseAI = 5, highAI = -1, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
										{ id = 61821, baseAI = 5, highAI = -1, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
										{ id = 61822, baseAI = 5, highAI = -1, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
									}
x302538_g_Monster1 ={
										{id = 61815, baseAI = 22, highAI = 7, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
										{id = 61816, baseAI = 22, highAI = 7, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
										{id = 61817, baseAI = 22, highAI = 7, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
										{id = 61818, baseAI = 22, highAI = 7, campId = 20, liveTime = 60 * 60 * 1000, name = "", title = "", dir = 0},
									}
--boss刷新位置									
x302538_g_Monstercoord ={
										{posX = 49.634716,posZ = 179.275925,dir = 110},
										{posX = 209.977066,posZ = 179.575745,dir = 260},
										{posX = 55.501801,posZ = 95.778664,dir = 90},
										{posX = 204.670731,posZ = 77.301178,dir = 290},
										{posX = 120.701286,posZ = 128.855042,dir = 90},
																 }
--各国战车
x302538_g_CreateMonsterConfigTb2 ={{{posX = 57.207253,posZ = 164.378738,dir = 130},
																		{posX = 61.032372,posZ = 169.812851,dir = 130},
																		{posX = 64.0905,posZ = 186.065506,dir = 90},
																		{posX = 63.899891,posZ = 179.094803,dir = 90},
																		},
																		{{posX = 203.457031,posZ = 165.972473,dir = 230},
																		{posX = 199.49292,posZ = 172.569641,dir = 240},
																		{posX = 196.485001,posZ = 181.740005,dir = 270},
																		{posX = 196.814896,posZ = 188.962204,dir = 280},
																		},
																		{{posX = 67.10305,posZ = 106.751961,dir = 70},
																		{posX = 69.219093,posZ = 100.777481,dir = 70},
																		{posX = 69.127449,posZ = 90.221161,dir = 100},
																		{posX = 67.275841,posZ = 84.948448,dir = 110},
																		},
																		{{posX = 190.689072,posZ = 68.424454,dir = 270},
																		{posX = 191.022217,posZ = 74.888565,dir = 270},
																		{posX = 196.127869,posZ = 93.003426,dir = 310},
																		{posX = 190.990295,posZ = 87.003113,dir = 310},
																		},
																		{{posX = 120.150871,posZ = 171.428864,dir = 360},
																		{posX = 123.938271,posZ = 171.504135,dir = 360},
																		{posX = 127.711983,posZ = 171.432983,dir = 360},
																		{posX = 131.518646,posZ = 171.414185,dir = 360},
																		{posX = 135.228806,posZ = 171.399658,dir = 360},
																		{posX = 169.969803,posZ = 135.748795,dir = 90},
																		{posX = 169.82341,posZ = 131.987305,dir = 90},
																		{posX = 169.822495,posZ = 128.294678,dir = 90},
																		{posX = 169.953491,posZ = 124.65258,dir = 90},
																		{posX = 169.913132,posZ = 120.989304,dir = 90},
																		{posX = 120.078606,posZ = 85.817184,dir = 180},
																		{posX = 123.474152,posZ = 85.835587,dir = 180},
																		{posX = 126.860809,posZ = 85.806709,dir = 180},
																		{posX = 130.236923,posZ = 85.829445,dir = 180},
																		{posX = 133.538544,posZ = 85.878937,dir = 180},
																		{posX = 79.45488,posZ = 122.315376,dir = 270},
																		{posX = 79.485374,posZ = 125.76722,dir = 270},
																		{posX = 79.53109,posZ = 129.238724,dir = 270},
																		{posX = 79.559753,posZ = 132.550354,dir = 270},
																		{posX = 79.552109,posZ = 135.930695,dir = 270},}
																		}
--营                               
x302538_g_CreateMonsterConfigTb1 ={
{
{posX = 52.78437,posZ = 167.528732,dir = 130},
{posX = 54.011234,posZ = 169.141479,dir = 130},
{posX = 55.4818,posZ = 170.719437,dir = 130},
{posX = 56.828171,posZ = 172.330688,dir = 130},
{posX = 58.136616,posZ = 173.927231,dir = 130},
{posX = 51.302578,posZ = 168.86673,dir = 130},
{posX = 52.668934,posZ = 170.441299,dir = 130},
{posX = 54.03957,posZ = 172.074539,dir = 130},
{posX = 55.319946,posZ = 173.634552,dir = 130},
{posX = 56.588017,posZ = 175.176804,dir = 130},
{posX = 59.426579,posZ = 178.202042,dir = 90},
{posX = 59.410446,posZ = 180.551575,dir = 90},
{posX = 59.468128,posZ = 182.69223,dir = 90},
{posX = 59.601906,posZ = 184.719498,dir = 90},
{posX = 59.555889,posZ = 186.845261,dir = 90},
{posX = 57.685738,posZ = 178.339539,dir = 90},
{posX = 57.81451,posZ = 180.511368,dir = 90},
{posX = 57.75045,posZ = 182.675888,dir = 90},
{posX = 57.645073,posZ = 184.817154,dir = 90},
{posX = 57.705589,posZ = 186.781952,dir = 90},
{posX = 47.33778,posZ = 182.21225,dir = 110},
{posX = 45.886112,posZ = 178.537827,dir = 110},
},
{{posX = 202.070541,posZ = 188.774429,dir = 270},
{posX = 201.830688,posZ = 184.78215,dir = 270},
{posX = 201.869614,posZ = 186.612701,dir = 270},
{posX = 201.563721,posZ = 182.695038,dir = 270},
{posX = 201.658936,posZ = 180.746185,dir = 270},
{posX = 203.8647,posZ = 188.704483,dir = 270},
{posX = 203.748566,posZ = 186.569305,dir = 270},
{posX = 203.600693,posZ = 184.67514,dir = 270},
{posX = 203.436584,posZ = 182.649521,dir = 270},
{posX = 203.48056,posZ = 180.625046,dir = 270},
{posX = 203.181152,posZ = 175.601379,dir = 240},
{posX = 204.174545,posZ = 173.856598,dir = 240},
{posX = 205.025528,posZ = 172.229034,dir = 240},
{posX = 205.973892,posZ = 170.31636,dir = 230},
{posX = 207.10527,posZ = 168.923904,dir = 230},
{posX = 204.75296,posZ = 176.407806,dir = 240},
{posX = 205.746582,posZ = 174.863327,dir = 240},
{posX = 206.572006,posZ = 173.244003,dir = 240},
{posX = 207.531998,posZ = 171.720001,dir = 230},
{posX = 208.601974,posZ = 170.223633,dir = 230},
{posX = 212.154861,posZ = 181.921936,dir = 260},
{posX = 212.566818,posZ = 177.395889,dir = 260},
},
{{posX = 62.957523,posZ = 83.018631,dir = 100},
{posX = 63.348549,posZ = 85.108704,dir = 100},
{posX = 63.921196,posZ = 87.21946,dir = 100},
{posX = 64.398605,posZ = 89.348778,dir = 100},
{posX = 65.028709,posZ = 91.889397,dir = 100},
{posX = 60.658669,posZ = 83.379547,dir = 100},
{posX = 61.090858,posZ = 85.338654,dir = 100},
{posX = 61.810936,posZ = 87.749756,dir = 100},
{posX = 62.425228,posZ = 89.924072,dir = 100},
{posX = 63.034447,posZ = 92.359894,dir = 100},
{posX = 65.540421,posZ = 98.124191,dir = 60},
{posX = 64.477661,posZ = 100.539665,dir = 60},
{posX = 63.608978,posZ = 102.900635,dir = 60},
{posX = 62.881718,posZ = 105.12365,dir = 60},
{posX = 62.139538,posZ = 107.316689,dir = 60},
{posX = 63.439884,posZ = 97.277985,dir = 60},
{posX = 62.591778,posZ = 99.619026,dir = 60},
{posX = 61.771019,posZ = 102.049072,dir = 60},
{posX = 60.95771,posZ = 104.327744,dir = 60},
{posX = 60.134453,posZ = 106.58564,dir = 60},
{posX = 53.034679,posZ = 93.372276,dir = 90},
{posX = 53.29937,posZ = 98.333038,dir = 90},
},
{
{posX = 198.270752,posZ = 66.962799,dir = 270},
{posX = 198.3405,posZ = 69.293304,dir = 270},
{posX = 198.325577,posZ = 71.554993,dir = 270},
{posX = 198.268143,posZ = 74.15274,dir = 270},
{posX = 198.256638,posZ = 76.601334,dir = 270},
{posX = 195.530212,posZ = 67.084274,dir = 270},
{posX = 195.490692,posZ = 69.165344,dir = 270},
{posX = 195.438019,posZ = 71.58699,dir = 270},
{posX = 195.485825,posZ = 74.22113,dir = 270},
{posX = 195.547653,posZ = 76.535721,dir = 270},
{posX = 201.447662,posZ = 92.333496,dir = 310},
{posX = 199.391281,posZ = 90.349426,dir = 310},
{posX = 197.63913,posZ = 88.387833,dir = 310},
{posX = 195.863998,posZ = 86.494972,dir = 310},
{posX = 194.155151,posZ = 84.820061,dir = 310},
{posX = 203.597031,posZ = 89.666649,dir = 310},
{posX = 201.845276,posZ = 87.849342,dir = 310},
{posX = 200.112732,posZ = 85.962616,dir = 310},
{posX = 198.547516,posZ = 84.266495,dir = 310},
{posX = 196.966568,posZ = 82.414139,dir = 310},
{posX = 206.040573,posZ = 73.65802,dir = 290},
{posX = 208.160431,posZ = 79.694817,dir = 290},
},
{{posX = 122.181755,posZ = 164.544098,dir = 360},
{posX = 123.852051,posZ = 164.359268,dir = 360},
{posX = 125.613846,posZ = 164.409088,dir = 360},
{posX = 127.376366,posZ = 164.359268,dir = 360},
{posX = 129.147507,posZ = 164.249588,dir = 360},
{posX = 130.921906,posZ = 164.243118,dir = 360},
{posX = 132.556,posZ = 164.240936,dir = 360},
{posX = 133.957458,posZ = 164.262161,dir = 360},
{posX = 124.116714,posZ = 166.327393,dir = 360},
{posX = 122.340233,posZ = 166.337708,dir = 360},
{posX = 125.81778,posZ = 166.392532,dir = 360},
{posX = 127.494911,posZ = 166.388824,dir = 360},
{posX = 129.32431,posZ = 166.390991,dir = 360},
{posX = 130.926346,posZ = 166.350662,dir = 360},
{posX = 132.531937,posZ = 166.305908,dir = 360},
{posX = 133.879044,posZ = 166.271774,dir = 360},
{posX = 163.582214,posZ = 134.951691,dir = 90},
{posX = 163.529068,posZ = 133.379379,dir = 90},
{posX = 163.522827,posZ = 131.796677,dir = 90},
{posX = 163.528549,posZ = 130.19603,dir = 90},
{posX = 163.364761,posZ = 128.195175,dir = 90},
{posX = 163.463455,posZ = 126.501747,dir = 90},
{posX = 163.422852,posZ = 124.771759,dir = 90},
{posX = 163.355408,posZ = 123.174782,dir = 90},
{posX = 165.843506,posZ = 134.816757,dir = 90},
{posX = 165.768768,posZ = 133.255676,dir = 90},
{posX = 165.727844,posZ = 131.740219,dir = 90},
{posX = 165.69516,posZ = 130.047516,dir = 90},
{posX = 165.624603,posZ = 128.22728,dir = 90},
{posX = 165.631638,posZ = 126.547173,dir = 90},
{posX = 165.64949,posZ = 124.971687,dir = 90},
{posX = 165.548035,posZ = 123.278923,dir = 90},
{posX = 133.040222,posZ = 93.613129,dir = 180},
{posX = 131.519684,posZ = 93.557854,dir = 180},
{posX = 129.88063,posZ = 93.549843,dir = 180},
{posX = 128.31929,posZ = 93.581169,dir = 180},
{posX = 126.202965,posZ = 93.593803,dir = 180},
{posX = 124.708496,posZ = 93.566444,dir = 180},
{posX = 123.154625,posZ = 93.620331,dir = 180},
{posX = 121.651443,posZ = 93.696922,dir = 180},
{posX = 132.861313,posZ = 90.633698,dir = 180},
{posX = 131.244476,posZ = 90.699707,dir = 180},
{posX = 129.617844,posZ = 90.76899,dir = 180},
{posX = 128.058884,posZ = 90.786301,dir = 180},
{posX = 126.175133,posZ = 90.840515,dir = 180},
{posX = 124.459457,posZ = 90.902298,dir = 180},
{posX = 122.887306,posZ = 90.924377,dir = 180},
{posX = 121.363739,posZ = 91.007652,dir = 180},
{posX = 88.853256,posZ = 122.460907,dir = 270},
{posX = 88.848587,posZ = 124.092178,dir = 270},
{posX = 88.881012,posZ = 125.565918,dir = 270},
{posX = 88.9505,posZ = 127.285255,dir = 270},
{posX = 89.096611,posZ = 129.470566,dir = 270},
{posX = 89.012695,posZ = 131.083389,dir = 270},
{posX = 88.976952,posZ = 132.781281,dir = 270},
{posX = 88.939659,posZ = 134.507919,dir = 270},
{posX = 86.067825,posZ = 122.719925,dir = 270},
{posX = 86.172157,posZ = 124.481346,dir = 270},
{posX = 86.223824,posZ = 126.048492,dir = 270},
{posX = 86.309181,posZ = 127.52005,dir = 270},
{posX = 86.361801,posZ = 129.436981,dir = 270},
{posX = 86.431053,posZ = 131.298325,dir = 270},
{posX = 86.427696,posZ = 132.862671,dir = 270},
{posX = 86.37867,posZ = 134.717651,dir = 270},
} 
}		
--建筑
x302538_g_dazhang ={
{posX = 34.862968,posZ = 189.500381,dir = 90,id = 61827},
{posX = 39.890099,posZ = 179.803207,dir = 90,id = 61827},
{posX = 40.359531,posZ = 198.19046,dir = 90,id = 61828},
{posX = 35.858875,posZ = 164.152969,dir = 90,id = 61828},
{posX = 57.781094,posZ = 189.609009,dir = 90,id = 61832},
{posX = 57.33049,posZ = 192.251343,dir = 90,id = 61832},
{posX = 54.405636,posZ = 196.028336,dir = 90,id = 61832},
{posX = 56.696564,posZ = 195.195282,dir = 90,id = 61832},
{posX = 51.993008,posZ = 201.811752,dir = 90,id = 61832},
{posX = 49.131855,posZ = 202.232742,dir = 90,id = 61832},
{posX = 46.781925,posZ = 204.292786,dir = 90,id = 61832},
{posX = 44.289219,posZ = 206.007751,dir = 90,id = 61832},
{posX = 41.555099,posZ = 208.27211,dir = 90,id = 61832},
{posX = 53.790977,posZ = 199.201797,dir = 90,id = 61832},
{posX = 29.262295,posZ = 157.78064,dir = 90,id = 61832},
{posX = 31.590792,posZ = 155.954224,dir = 90,id = 61832},
{posX = 34.112843,posZ = 157.773148,dir = 90,id = 61832},
{posX = 37.043583,posZ = 156.967926,dir = 90,id = 61832},
{posX = 40.696934,posZ = 157.488174,dir = 90,id = 61832},
{posX = 42.425724,posZ = 159.728043,dir = 90,id = 61832},
{posX = 45.803886,posZ = 160.165146,dir = 90,id = 61832},
{posX = 49.148407,posZ = 161.49527,dir = 90,id = 61832},
{posX = 49.924294,posZ = 165.245773,dir = 90,id = 61832},
{posX = 54.291397,posZ = 188.764984,dir = 100,id = 61829},
{posX = 47.907528,posZ = 168.687454,dir = 110,id = 61829},
{posX = 218.222015,posZ = 187.413574,dir = 90,id = 61827},
{posX = 221.214005,posZ = 176.147995,dir = 90,id = 61827},
{posX = 220.056686,posZ = 195.047989,dir = 90,id = 61828},
{posX = 227.253296,posZ = 168.875061,dir = 90,id = 61828},
{posX = 222.928909,posZ = 204.305557,dir = 90,id = 61832},
{posX = 220.633911,posZ = 204.393478,dir = 90,id = 61832},
{posX = 217.219009,posZ = 202.902512,dir = 90,id = 61832},
{posX = 213.962021,posZ = 201.923035,dir = 90,id = 61832},
{posX = 212.056839,posZ = 202.801666,dir = 90,id = 61832},
{posX = 209.606293,posZ = 199.750397,dir = 90,id = 61832},
{posX = 206.07663,posZ = 199.136475,dir = 90,id = 61832},
{posX = 202.361191,posZ = 193.244614,dir = 90,id = 61832},
{posX = 203.491119,posZ = 196.864166,dir = 90,id = 61832},
{posX = 230.465927,posZ = 162.371216,dir = 90,id = 61832},
{posX = 227.327408,posZ = 162.456451,dir = 90,id = 61832},
{posX = 224.549622,posZ = 160.824158,dir = 90,id = 61832},
{posX = 221.340424,posZ = 161.618423,dir = 90,id = 61832},
{posX = 218.428375,posZ = 161.80188,dir = 90,id = 61832},
{posX = 215.882263,posZ = 163.380371,dir = 90,id = 61832},
{posX = 213.377884,posZ = 165.768433,dir = 90,id = 61832},
{posX = 211.156921,posZ = 165.203476,dir = 90,id = 61832},
{posX = 208.723434,posZ = 166.990097,dir = 90,id = 61832},
{posX = 212.64238,posZ = 169.772842,dir = 130,id = 61829},
{posX = 206.774811,posZ = 191.278137,dir = 90,id = 61829},
{posX = 44.371719,posZ = 105.122154,dir = 90,id = 61827},
{posX = 46.515259,posZ = 92.245544,dir = 90,id = 61827},
{posX = 40.832325,posZ = 82.753769,dir = 90,id = 61828},
{posX = 36.740421,posZ = 110.977005,dir = 90,id = 61828},
{posX = 35.954765,posZ = 70.341888,dir = 90,id = 61832},
{posX = 40.246483,posZ = 72.328484,dir = 90,id = 61832},
{posX = 45.256592,posZ = 72.378738,dir = 90,id = 61832},
{posX = 48.256702,posZ = 74.033615,dir = 90,id = 61832},
{posX = 53.076988,posZ = 73.897797,dir = 90,id = 61832},
{posX = 55.238808,posZ = 76.896515,dir = 90,id = 61832},
{posX = 57.994781,posZ = 79.645355,dir = 90,id = 61832},
{posX = 31.130302,posZ = 120.155312,dir = 90,id = 61832},
{posX = 40.326416,posZ = 119.952522,dir = 90,id = 61832},
{posX = 42.825516,posZ = 121.289818,dir = 90,id = 61832},
{posX = 45.934433,posZ = 120.498596,dir = 90,id = 61832},
{posX = 49.641876,posZ = 118.460175,dir = 90,id = 61832},
{posX = 53.910744,posZ = 117.560577,dir = 90,id = 61832},
{posX = 56.078838,posZ = 116.288727,dir = 90,id = 61832},
{posX = 57.517281,posZ = 113.059898,dir = 90,id = 61832},
{posX = 60.011719,posZ = 110.437889,dir = 90,id = 61832},
{posX = 56.043125,posZ = 108.617226,dir = 70,id = 61829},
{posX = 54.364429,posZ = 82.008003,dir = 110,id = 61829},
{posX = 219.251526,posZ = 85.182945,dir = 90,id = 61827},
{posX = 213.046112,posZ = 70.480774,dir = 90,id = 61827},
{posX = 209.43248,posZ = 61.957237,dir = 90,id = 61828},
{posX = 223.483322,posZ = 77.957657,dir = 90,id = 61828},
{posX = 217.970657,posZ = 53.636459,dir = 90,id = 61832},
{posX = 214.228989,posZ = 53.870285,dir = 90,id = 61832},
{posX = 212.195435,posZ = 52.603893,dir = 90,id = 61832},
{posX = 206.430099,posZ = 54.002495,dir = 90,id = 61832},
{posX = 209.413788,posZ = 53.734928,dir = 90,id = 61832},
{posX = 203.220901,posZ = 56.99276,dir = 90,id = 61832},
{posX = 201.93335,posZ = 59.79192,dir = 90,id = 61832},
{posX = 199.683212,posZ = 62.717884,dir = 90,id = 61832},
{posX = 225.722809,posZ = 90.360382,dir = 90,id = 61832},
{posX = 223.531128,posZ = 92.93943,dir = 90,id = 61832},
{posX = 220.293854,posZ = 93.809029,dir = 90,id = 61832},
{posX = 217.564926,posZ = 91.910507,dir = 90,id = 61832},
{posX = 212.738403,posZ = 91.532104,dir = 90,id = 61832},
{posX = 208.338196,posZ = 91.587433,dir = 90,id = 61832},
{posX = 204.273743,posZ = 92.00293,dir = 90,id = 61832},
{posX = 208.196594,posZ = 86.137985,dir = 330,id = 61829},
{posX = 203.033447,posZ = 66.460495,dir = 270,id = 61829},
}





function x302538_ProcTimerDoingStart( SceneId, actId, Param1, Param2, Param3, Param4, Param5 )
	  local an = GetGameOpenById( x302538_g_GameOpenId )
		x302538_mark_a = 0
		local item = -1
	--检查地图是否匹配
		if x302538_g_GameOpenId > 0 and GetGameOpenById( x302538_g_GameOpenId ) <= 0 then
     		 item =x302538_g_ValidScene[2]
    else
    			item =x302538_g_ValidScene[1]
  	end
	if SceneId == item then

	--检查活动是否开启
				if Param3 == 0 then
					x302538_clearit()
				end
				if Param2 == 0 then
					 x302538_AtTimecreateBoss(SceneId)
					 
				end

-----------------------
				--建筑创建
				if Param1 == 0 then	
					for j=1,getn(x302538_g_dazhang) do
					local objId = -1
					if 61829 == x302538_g_dazhang[j].id then
						 objId =CreateMonster(				 SceneId, 
								 x302538_g_dazhang[j].id,
								 x302538_g_dazhang[j].posX,  
								 x302538_g_dazhang[j].posZ,  
								 22,
								 -1,
								 -1, 
								 -1,  
								 20,  
								 x302538_liveTime, 
								 x302538_g_dazhang[j].dir, 
								 x302538_Name,
								 x302538_Title)
					else
						 objId =CreateMonster(				 SceneId, 
													 x302538_g_dazhang[j].id,
													 x302538_g_dazhang[j].posX,  
													 x302538_g_dazhang[j].posZ,  
													 5,
													 -1,
													 -1, 
													 -1,  
													 20,  
													 x302538_liveTime, 
													 x302538_g_dazhang[j].dir, 
													 x302538_Name,
													 x302538_Title)
					end
					--栅栏伤害buff
						if x302538_g_dazhang[j].id == 61832 then
							if IsHaveSpecificImpact( SceneId, objId, 26380) ~= 1 then
								SendSpecificImpactToUnit(SceneId, objId, objId, objId, 26380, 0)
							end
						end	
				end
					
		--------------			
					
					for j=1,getn(x302538_g_Monstercoord) do
										local objId =CreateMonster(				 SceneId, 
																		 x302538_g_MonsterInfo[j].id,
																		 x302538_g_Monstercoord[j].posX,  
																		 x302538_g_Monstercoord[j].posZ,  
																		 x302538_g_MonsterInfo[j].baseAI,
																		 x302538_g_MonsterInfo[j].highAI,
																		 x302538_g_ScriptId, 
																		 x302538_king_objId[j],  
																		 x302538_g_MonsterInfo[j].campId,  
																		 x302538_g_MonsterInfo[j].liveTime, 
																		 x302538_g_Monstercoord[j].dir,
																		 x302538_g_MonsterInfo[j].name,
																		 x302538_g_MonsterInfo[j].title )
									x302538_var_BossObj[j] = objId
								
					end
					local a = 1

					for i=1,5 do
							x302538_var_monsterObj[i] ={}
							x302538_var_monsterObj1[i] ={}
							if a < 5 then
								
								for j = 1,getn(x302538_g_CreateMonsterConfigTb1[i]) do
												local objId1 =CreateMonster(				 SceneId, 
																				 x302538_g_Monster[i].id,
																				 x302538_g_CreateMonsterConfigTb1[i][j].posX,  
																				 x302538_g_CreateMonsterConfigTb1[i][j].posZ,  
																				 x302538_g_Monster[i].baseAI,
																				 x302538_g_Monster[i].highAI,
																				 x302538_g_ScriptId, 
																				 -1,  
																				 i+15,  
																				 x302538_g_Monster[i].liveTime, 
																				 x302538_g_CreateMonsterConfigTb1[i][j].dir,
																				 x302538_g_Monster[i].name,
																				 x302538_g_Monster[i].title )
												x302538_var_monsterObj[i][j] = objId1

								end
		
		
								for j = 1,getn(x302538_g_CreateMonsterConfigTb2[i]) do
											
												local objId2 =CreateMonster(				 SceneId, 
																				 x302538_g_Monster1[i].id,
																				 x302538_g_CreateMonsterConfigTb2[i][j].posX,  
																				 x302538_g_CreateMonsterConfigTb2[i][j].posZ,  
																				 x302538_g_Monster1[i].baseAI,
																				 x302538_g_Monster1[i].highAI,
																				 x302538_g_ScriptId, 
																				 -1,  
																				 i+15,  
																				 x302538_g_Monster1[i].liveTime, 
																				 x302538_g_CreateMonsterConfigTb2[i][j].dir,
																				 x302538_g_Monster1[i].name,
																				 x302538_g_Monster1[i].title )
												x302538_var_monsterObj1[i][j] = objId2
												
								end
							else 
								local b =1
								local d =1
								for j = 1,getn(x302538_g_CreateMonsterConfigTb1[i]) do
												local c = floor((b+4)/5)
												if c > 4 then
													c = 4
												end
												local objId1 =CreateMonster(				 SceneId, 
																				 x302538_g_Monster[c].id,
																				 x302538_g_CreateMonsterConfigTb1[i][j].posX,  
																				 x302538_g_CreateMonsterConfigTb1[i][j].posZ,  
																				 x302538_g_Monster[c].baseAI,
																				 x302538_g_Monster[c].highAI,
																				 x302538_g_ScriptId, 
																				 -1,  
																				 21,  
																				 x302538_g_Monster[c].liveTime, 
																				 x302538_g_CreateMonsterConfigTb1[i][j].dir,
																				 x302538_g_Monster[c].name,
																				 x302538_g_Monster[c].title )
												x302538_var_monsterObj[i][j] = objId1
												
												b = b + 1 
								end
		
		
								for j = 1,getn(x302538_g_CreateMonsterConfigTb2[i]) do
												local e = floor((d+15)/16)
												if e > 4 then 
													e =4
												end
												local objId2 =CreateMonster(				 SceneId, 
																				 x302538_g_Monster1[e].id,
																				 x302538_g_CreateMonsterConfigTb2[i][j].posX,  
																				 x302538_g_CreateMonsterConfigTb2[i][j].posZ,  
																				 x302538_g_Monster1[e].baseAI,
																				 x302538_g_Monster1[e].highAI,
																				 x302538_g_ScriptId, 
																				 -1,  
																				 21,  
																				 x302538_g_Monster1[e].liveTime, 
																				 x302538_g_CreateMonsterConfigTb2[i][j].dir,
																				 x302538_g_Monster1[e].name,
																				 x302538_g_Monster1[e].title )
												x302538_var_monsterObj1[i][j] = objId2
												
												e = e + 1
								end
								
							end
						a = a +1
					end
				end

		end

end

function x302538_clearit()
			x302538_var_num = {}
			x302538_var_GetGift = {1,1,1,1}   
			x302538_var_CompID = {}
			x302538_var_Comp = {0,0,0,0,0}
			x302538_var_BossObj = {}
			x302538_var_monsterObj = {}
			x302538_var_monsterObj1 ={}
end
function x302538_AtTimecreateBoss(sceneId)
	local a = 1
	local monster = 0
	for k,v in x302538_var_BossObj do 
		if x302538_var_BossObj[k] == 0 then

				for j = 1 ,getn(x302538_g_CreateMonsterConfigTb1[k]) do
					if x302538_var_monsterObj[k][j] ~= 0 then
						monster = x302538_var_monsterObj[k][j]			
						break
					end
				end
				if monster == 0 then
					for j = 1 ,getn(x302538_g_CreateMonsterConfigTb2[k]) do
						if x302538_var_monsterObj1[k][j] ~= 0 then
							monster = x302538_var_monsterObj1[k][j]			
							break
						end
					end
				end
				local b = GetMonsterCamp(sceneId, monster)
				if b >15 and b <20 then
						local objId =CreateMonster(				 sceneId, 
																		 x302538_g_MonsterInfo[a].id,
																		 x302538_g_Monstercoord[a].posX,  
																		 x302538_g_Monstercoord[a].posZ,  
																		 x302538_g_MonsterInfo[a].baseAI,
																		 x302538_g_MonsterInfo[a].highAI,
																		 x302538_g_ScriptId, 
																		 x302538_king_objId[a],  
																		 b,  
																		 x302538_g_MonsterInfo[a].liveTime, 
																		 x302538_g_Monstercoord[a].dir,
																		 x302538_g_MonsterInfo[a].name,
																		 x302538_g_MonsterInfo[a].title )
									x302538_var_BossObj[a] = objId

				end
		end
							for c,v in x302538_Buff do
								if IsHaveSpecificImpact( sceneId, x302538_var_BossObj[a], v) ~= 1 then
									SendSpecificImpactToUnit(sceneId, x302538_var_BossObj[a], x302538_var_BossObj[a], x302538_var_BossObj[a], v, 0)
								end
							end
		a = a + 1
		--加无敌buff


	end
	
end
function x302538_deductHp( sceneId, obj,n )
		local varHp = GetHp(sceneId,obj)
		local num = -floor(n*varHp/100)
		SetHp(sceneId,obj,num)

end
--怪物死亡时函数
function x302538_ProcDie( sceneId, selfId, killerId )
			local area = x302538_newMonsterArea(sceneId, selfId,killerId,1)
			local country = GetCurCountry(sceneId,killerId)
			local a = 1
				for i =1 ,getn(x302538_g_Monstercoord) do
		  		if selfId == x302538_var_BossObj[i] then
		  			
						x302538_var_BossObj[i] = 0
						break
					end
					a = a + 1
				end
			if area ~= nil then
				  x302538_var_Comp[ area ] = x302538_var_Comp[ area ] + 1
					if x302538_var_Comp[ area ] > (getn(x302538_var_monsterObj[area])+ getn(x302538_var_monsterObj1[area]) ) then 
							x302538_CreateMon(sceneId,selfId ,area,country)
							x302538_var_Comp[ area ] = 0
					end
			end
			
	
end
--刷新怪的阵营
function x302538_newMonsterArea(varMap, varMonster,varPlayer,n)
	local a = 1
	local b = 1
	local c = 1

	for i=1 , getn(x302538_g_Monstercoord) do
		for j = 1 ,getn(x302538_g_CreateMonsterConfigTb1[i]) do
			if varMonster == x302538_var_monsterObj[i][j] then
				x302538_var_monsterObj[i][j] = 0	
				if x302538_var_BossObj[a] ~= 0 then
						if i < 5 and n == 1 then
							x302538_deductHp( varMap, x302538_var_BossObj[a],2 )
							Msg2Player(varMap, varPlayer, "卫兵被击杀，指挥官战斗力被削弱", 8, 3)	
						elseif i == 5 and n == 1 then
							x302538_deductHp( varMap, x302538_var_BossObj[a],1 )	
							Msg2Player(varMap, varPlayer, "卫兵被击杀，指挥官战斗力被削弱", 8, 3)
						end
				end
				return a
			end
		end
		a = a + 1
	end
	for i =1, getn(x302538_g_Monstercoord) do
		for j = 1 ,getn(x302538_g_CreateMonsterConfigTb2[i]) do
			if varMonster == x302538_var_monsterObj1[i][j] then
				x302538_var_monsterObj1[i][j] = 0
				if x302538_var_BossObj[b] ~= 0 then
						if i < 5 and n == 1 then
							x302538_deductHp( varMap, x302538_var_BossObj[b],6 )
							Msg2Player(varMap, varPlayer, "战车被摧毁，指挥官战斗力被削弱", 8, 3)
						elseif i == 5 and n == 1 then
							x302538_deductHp( varMap, x302538_var_BossObj[b],2 )	
							Msg2Player(varMap, varPlayer, "战车被摧毁，指挥官战斗力被削弱", 8, 3)
						end
				end
				return b
			end
		end		
		b = b + 1
	end
	for j = 1 ,getn(x302538_g_Monstercoord) do
		if varMonster == x302538_var_BossObj[j] then
			return c
		end
		c = c + 1
	end		
	return nil
end
--创建怪
function x302538_CreateMon(sceneId ,selfId ,area,country)
	local compId = country + 16
	x302538_giveGift( sceneId,selfId,country,area)

						local objId =CreateMonster(				 sceneId, 
														 x302538_g_MonsterInfo[country+1].id,
														 x302538_g_Monstercoord[area].posX,  
														 x302538_g_Monstercoord[area].posZ,  
														 x302538_g_MonsterInfo[country+1].baseAI,
														 x302538_g_MonsterInfo[country+1].highAI,
														 x302538_g_ScriptId, 
														 x302538_king_objId[country+1],  
														 compId,  
														 x302538_g_MonsterInfo[country+1].liveTime, 
														 x302538_g_Monstercoord[area].dir,
														 x302538_g_MonsterInfo[country+1].name,
														 x302538_g_MonsterInfo[country+1].title )
							 x302538_var_BossObj[area] = objId
				for j ,item in x302538_g_CreateMonsterConfigTb2[area] do
						local objId =CreateMonster(				 sceneId, 
														 x302538_g_Monster1[country+1].id,
														 x302538_g_CreateMonsterConfigTb2[area][j].posX,  
														 x302538_g_CreateMonsterConfigTb2[area][j].posZ,  
														 x302538_g_Monster1[country+1].baseAI,
														 x302538_g_Monster1[country+1].highAI,
														 x302538_g_ScriptId, 
														 -1,  
														 compId,  
														 x302538_g_Monster1[country+1].liveTime, 
														 x302538_g_CreateMonsterConfigTb2[area][j].dir,
														 x302538_g_Monster1[country+1].name,
														 x302538_g_Monster1[country+1].title )
							 x302538_var_monsterObj1[area][j] = objId
				end
				for j ,item in x302538_g_CreateMonsterConfigTb1[area] do
						local objId =CreateMonster(				 sceneId, 
														 x302538_g_Monster[country+1].id,
														 x302538_g_CreateMonsterConfigTb1[area][j].posX,  
														 x302538_g_CreateMonsterConfigTb1[area][j].posZ,  
														 x302538_g_Monster[country+1].baseAI,
														 x302538_g_Monster[country+1].highAI,
														 x302538_g_ScriptId, 
														 -1,  
														 compId,  
														 x302538_g_Monster[country+1].liveTime, 
														 x302538_g_CreateMonsterConfigTb1[area][j].dir,
														 x302538_g_Monster[country+1].name,
														 x302538_g_Monster[country+1].title )
							 x302538_var_monsterObj[area][j] = objId
				end
				x302538_var_CompID[area] = compId

end
function x302538_DropItem( varMap,selfId)

end
function x302538_giveGift( varMap,selfId,country,area)
			x302538_var_GetGift[country+1] = x302538_var_GetGift[country+1] + 1
			local compId = GetMonsterCamp(varMap, selfId)
			local varMsg1 = x302538_countryName(country)
			local varMsg2 = x302538_countryName(compId - 16)
			if compId > 15 and compId < 20 then
				x302538_var_GetGift[compId - 15] = x302538_var_GetGift[compId - 15] - 1
				local varMsg1 = x302538_countryName(country)
				local varMsg2 = x302538_countryName(compId - 16)
				LuaAllScenceM2Wrold (varMap , format("恭喜#R%s阵营#cffcc00攻下#R%s阵营#cffcc00!",varMsg1,varMsg2) , 5, 1)
			else
				LuaAllScenceM2Wrold (varMap , format("恭喜#R%s阵营#cffcc00攻下#R中立阵营#cffcc00!", varMsg1), 5, 1)
			end
end

function x302538_countryName(num)
	return x302538_CountryName[num+1]
end

function x302538_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
	
	local a = 1 
	for k,v in x302538_var_BossObj do
		if varTalknpc == v then
			a= 0
		end
	end
	if a == 1 then return end
			local a =GetMonsterCamp(varMap, varTalknpc)
			local b =GetCurCountry( varMap, varPlayer)
			
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y八一军事演习")
			TalkAppendString(varMap,"\n\n\t#W在7月31日至8月6日，每晚#R10:20#W到#R11:00#W,攻占任何一块营地将会获得一份奖励")   
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)   
			local mintime = GetMinOfDay()
			if mintime >= 23*60 and mintime < 24*60 then	
				if a == b + 16 then
					x302538_Accept( varMap, varPlayer, varTalknpc ,seleteId )
				else
					Msg2Player(varMap, varPlayer,"请到您国家的阵营处领取！",8,3)
				end
			else
				Msg2Player(varMap, varPlayer,"现在无法领奖",8,3)
			end
end



function x302538_ProcAccept( varMap, varPlayer )
end

function x302538_Accept( varMap, varPlayer, varTalknpc ,seleteId )

	local day = GetDayOfYear()
	local level = GetLevel(varMap, varPlayer)
	local country = GetCurCountry(varMap, varPlayer) + 1
	local num = x302538_var_GetGift[country]
	local area = x302538_newMonsterArea(varMap, varTalknpc,varPlayer,0)
	if day ~= x302538_GetDayMD(varMap, varPlayer) then
		for i =1 ,5 do 
				x302538_SetMARK(varMap, varPlayer, 0,i)
		end
	end
	if num > 0 then	
		
			if x302538_GetMARK(varMap, varPlayer,area) > 0 then
					Msg2Player(varMap, varPlayer,"您已于该阵营领取过奖励。",8,2)
					return
			end
			if GetBagSpace(varMap, varPlayer) < 1 then
				Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
				Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
				return 0
			end
			AddExp(varMap, varPlayer,level*5000 )
			StartItemTask(varMap)
				ItemAppendBind( varMap, 12032030, 5)  --灵力符
				ItemAppendBind( varMap, 11000715, 1)  --天外焚石
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					Msg2Player(varMap, varPlayer,"您获得5个灵力符1个天外焚石",8,3)
					x302538_SetDayMD(varMap, varPlayer, day)
					GamePlayScriptLog( varMap, varPlayer, 3871)
					x302538_GetMARK(varMap, varPlayer,area)
					x302538_var_GetGift[country] =x302538_var_GetGift[country] - 1
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end
	else
				Msg2Player(varMap, varPlayer,"已无奖励可领取",8,3)
	end

end

function x302538_GetDayMD(varMap, varPlayer)
		GetPlayerGameData( varMap, varPlayer, MD_JIANJUNDAY[ 1], MD_JIANJUNDAY[ 2], MD_JIANJUNDAY[ 3] )		
end
function x302538_SetDayMD(varMap, varPlayer, num)
		SetPlayerGameData( varMap, varPlayer, MD_JIANJUNDAY[ 1], MD_JIANJUNDAY[ 2], MD_JIANJUNDAY[ 3] ,num)	
end
function x302538_GetMARK(varMap, varPlayer,mark)
	local a = 0
	if mark == 1 then
		a = GetPlayerGameData( varMap, varPlayer, MD_JJ_1[ 1], MD_JJ_1[ 2], MD_JJ_1[ 3] )	
	elseif mark == 2 then
		a = GetPlayerGameData( varMap, varPlayer, MD_JJ_2[ 1], MD_JJ_2[ 2], MD_JJ_2[ 3] )	
	elseif mark == 3 then
		a = GetPlayerGameData( varMap, varPlayer, MD_JJ_3[ 1], MD_JJ_3[ 2], MD_JJ_3[ 3] )	
	elseif mark ==4 then
		a = GetPlayerGameData( varMap, varPlayer, MD_JJ_4[ 1], MD_JJ_4[ 2], MD_JJ_4[ 3] )
	else
		a = GetPlayerGameData( varMap, varPlayer, MD_JJ_5[ 1], MD_JJ_5[ 2], MD_JJ_5[ 3] )	
	end
	return a 	
end

function x302538_SetMARK(varMap, varPlayer, num,mark)
	if mark == 1 then
		SetPlayerGameData( varMap, varPlayer, MD_JJ_1[ 1], MD_JJ_1[ 2], MD_JJ_1[ 3] ,num)	
	elseif mark == 2 then
		SetPlayerGameData( varMap, varPlayer, MD_JJ_2[ 1], MD_JJ_2[ 2], MD_JJ_2[ 3] ,num)	
	elseif mark == 3 then
		SetPlayerGameData( varMap, varPlayer, MD_JJ_3[ 1], MD_JJ_3[ 2], MD_JJ_3[ 3] ,num)
	elseif mark ==4 then
		SetPlayerGameData( varMap, varPlayer, MD_JJ_4[ 1], MD_JJ_4[ 2], MD_JJ_4[ 3] ,num)	
	else
		SetPlayerGameData( varMap, varPlayer, MD_JJ_5[ 1], MD_JJ_5[ 2], MD_JJ_5[ 3] ,num)	
	end	
			
end

function x302538_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x302538_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302538_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302538_CheckSubmit( varMap, varPlayer )

end




function x302538_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302538_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302538_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302538_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

function x302538_GetGiftnum(varMap, varPlayer)
	
	local country = GetCurCountry(varMap, varPlayer)
	if x302538_var_GetGift[country+1] ~= nil then
		return x302538_var_GetGift[country+1]
	else
		return 0
	end
	
end
