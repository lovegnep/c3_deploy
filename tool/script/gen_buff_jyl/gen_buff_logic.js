const fs = require('fs');
const iconv = require('iconv-lite');


let arr = [
    {
        name:"英雄之源",
        template:1,//全属性
        maxLevel:11,
        perValue:20,
        initValue:200,
        need:[
            {id:12400531,name:"也速该"},
            {id:12400532,name:"月伦夫人"},
        ]
    },
    {
        name:"倚天双娇",
        template:2,//全攻击
        maxLevel:11,
        perValue:20,
        initValue:200,
        need:[
            {id:12400533,name:"赵敏"},
            {id:12400534,name:"周芷若"},
        ]
    },
    {
        name:"光明之主",
        template:3,//全防御
        maxLevel:11,
        perValue:20,
        initValue:100,
        need:[
            {id:12400535,name:"张无忌"},
        ]
    },
    {
        name:"只闻其声",
        template:4,//命闪暴韧
        maxLevel:11,
        perValue:1,
        initValue:2,
        need:[
            {id:12400536,name:"山中老人"},
            {id:12400537,name:"王重阳"},
            {id:12400538,name:"空见神僧"},
        ]
    },
    {
        name:"草原儿女",
        template:4,//命闪暴韧
        maxLevel:11,
        perValue:1,
        initValue:4,
        need:[
            {id:12400539,name:"少年拖雷"},
            {id:12400540,name:"少年华筝"},
        ]
    },
    {
        name:"浪子探花",
        template:1,//全属性
        maxLevel:11,
        perValue:20,
        initValue:300,
        need:[
            {id:12400541,name:"沈浪"},
            {id:12400542,name:"李寻欢"},
        ]
    },
    {
        name:"草原神箭",
        template:2,//全攻击
        maxLevel:11,
        perValue:20,
        initValue:300,
        need:[
            {id:12400543,name:"哲别"},
        ]
    },
    {
        name:"牛家村殇",
        template:3,//全防御
        maxLevel:11,
        perValue:20,
        initValue:150,
        need:[
            {id:12400544,name:"杨铁心"},
            {id:12400545,name:"包惜弱"},
        ]
    },
    {
        name:"两大射手",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:3,
        need:[
            {id:12400546,name:"李广"},
            {id:12400547,name:"黄忠"},
        ]
    },
    {
        name:"蒙古四俊",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:5,
        need:[
            {id:12400548,name:"博尔术"},
            {id:12400549,name:"木华黎"},
            {id:12400550,name:"博尔忽"},
            {id:12400551,name:"赤老温"},
        ]
    },
    {
        name:"黑风双煞",
        template:1,//全属性
        maxLevel:11,
        perValue:20,
        initValue:400,
        need:[
            {id:12400552,name:"梅超风"},
            {id:12400553,name:"陈玄风"},
        ]
    },
    {
        name:"金轮师徒",
        template:2,//全属性
        maxLevel:11,
        perValue:20,
        initValue:400,
        need:[
            {id:12400554,name:"金轮法王"},
            {id:12400555,name:"霍都王子"},
            {id:12400556,name:"达尔巴"},
        ]
    },
    {
        name:"爱恨情仇",
        template:3,//
        maxLevel:11,
        perValue:20,
        initValue:200,
        need:[
            {id:12400557,name:"完颜洪烈"},
            {id:12400558,name:"杨康"},
        ]
    },
    {
        name:"阴差阳错",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:4,
        need:[
            {id:12400559,name:"宁采臣"},
            {id:12400560,name:"聂小倩"},
        ]
    },
    {
        name:"千古奇缘",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:6,
        need:[
            {id:12400561,name:"梁山伯"},
            {id:12400562,name:"祝英台"},
        ]
    },
    {
        name:"四大鬼差",
        template:1,//
        maxLevel:11,
        perValue:20,
        initValue:500,
        need:[
            {id:12400563,name:"黑无常"},
            {id:12400564,name:"白无常"},
            {id:12400565,name:"牛头"},
            {id:12400566,name:"马面"},
        ]
    },
    {
        name:"五子良将",
        template:2,//
        maxLevel:11,
        perValue:20,
        initValue:500,
        need:[
            {id:12400567,name:"张辽"},
            {id:12400568,name:"乐进"},
            {id:12400569,name:"于禁"},
            {id:12400570,name:"张?"},
            {id:12400571,name:"徐晃"},
        ]
    },
    {
        name:"奸邪当道",
        template:3,//全属性
        maxLevel:11,
        perValue:20,
        initValue:250,
        need:[
            {id:12400572,name:"魏忠贤"},
            {id:12400573,name:"李莲英"},
            {id:12400574,name:"秦桧"},
            {id:12400575,name:"和坤"},
            {id:12400576,name:"高力士"},
            {id:12400577,name:"杨国忠"},
        ]
    },
    {
        name:"筝蓉岁月",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:5,
        need:[
            {id:12400430,name:"郭靖"},
            {id:12400431,name:"黄蓉"},
            {id:12400432,name:"华筝"},
        ]
    },
    {
        name:"神雕侠侣",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:7,
        need:[
            {id:12400433,name:"小龙女"},
            {id:12400434,name:"杨过"},
            {id:12400435,name:"黄衫女子"},
        ]
    },
    {
        name:"明察秋毫",
        template:1,//全属性
        maxLevel:11,
        perValue:20,
        initValue:600,
        need:[
            {id:12400578,name:"狄仁杰"},
            {id:12400579,name:"包拯"},
        ]
    },
    {
        name:"四大美女",
        template:2,//
        maxLevel:11,
        perValue:20,
        initValue:600,
        need:[
            {id:12400436,name:"西施"},
            {id:12400437,name:"貂蝉"},
            {id:12400438,name:"王昭君"},
            {id:12400439,name:"杨玉环"},
        ]
    },
    {
        name:"四大金刚",
        template:3,//
        maxLevel:11,
        perValue:20,
        initValue:300,
        need:[
            {id:12400440,name:"持国天王"},
            {id:12400441,name:"增长天王"},
            {id:12400442,name:"广目天王"},
            {id:12400443,name:"多闻天王"},
        ]
    },
    {
        name:"运筹帷幄",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:6,
        need:[
            {id:12400444,name:"萧何"},
            {id:12400445,name:"张良"},
            {id:12400446,name:"长孙无忌"},
            {id:12400447,name:"房玄龄"},
        ]
    },
    {
        name:"盖世无双",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:8,
        need:[
            {id:12400448,name:"黄药师"},
            {id:12400449,name:"欧阳锋"},
            {id:12400450,name:"段智兴"},
            {id:12400451,name:"洪七公"},
            {id:12400452,name:"周伯通"},
        ]
    },
    {
        name:"帝王之家",
        template:1,//全属性
        maxLevel:11,
        perValue:20,
        initValue:700,
        need:[
            {id:12400557,name:"完颜洪烈"},
            {id:12400546,name:"李广"},
        ]
    },
    {
        name:"八仙过海",
        template:2,//
        maxLevel:11,
        perValue:20,
        initValue:700,
        need:[
            {id:12400459,name:"吕洞宾"},
            {id:12400460,name:"铁拐李"},
            {id:12400461,name:"蓝采和"},
            {id:12400462,name:"何仙姑"},
            {id:12400463,name:"张果老"},
            {id:12400464,name:"曹国舅"},
            {id:12400465,name:"韩湘子"},
            {id:12400466,name:"汉钟离"},
        ]
    },
    {
        name:"四大恶人",
        template:3,//
        maxLevel:11,
        perValue:20,
        initValue:350,
        need:[
            {id:12400467,name:"段延庆"},
            {id:12400468,name:"叶二娘"},
            {id:12400469,name:"岳老三"},
            {id:12400470,name:"云中鹤"},
        ]
    },
    {
        name:"六案功曹",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:9,
        need:[
            {id:12400471,name:"天曹"},
            {id:12400472,name:"神曹"},
            {id:12400473,name:"冥曹"},
            {id:12400474,name:"地曹"},
            {id:12400475,name:"人曹"},
            {id:12400476,name:"鬼曹"},
        ]
    },
    {
        name:"酆都六部",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:10,
        need:[
            {id:12400477,name:"修罗"},
            {id:12400478,name:"夜叉"},
            {id:12400479,name:"迦楼罗"},
            {id:12400480,name:"乾闼婆"},
            {id:12400481,name:"紧那罗"},
            {id:12400482,name:"摩?罗伽"},
        ]
    },
    {
        name:"万寿无僵",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:11,
        need:[
            {id:12400483,name:"旱魃"},
            {id:12400484,name:"飞僵游尸"},
            {id:12400485,name:"毛僵伏尸"},
            {id:12400486,name:"红僵血尸"},
            {id:12400487,name:"黑僵汗尸"},
            {id:12400488,name:"绿僵斗尸"},
            {id:12400489,name:"白僵皮尸"},
            {id:12400490,name:"紫僵醒尸"},
        ]
    },
    {
        name:"降魔伏鬼",
        template:4,//
        maxLevel:11,
        perValue:1,
        initValue:12,
        need:[
            {id:12400491,name:"判官"},
            {id:12400492,name:"日游"},
            {id:12400493,name:"夜游"},
            {id:12400494,name:"九尾狐"},
            {id:12400495,name:"白起"},
            {id:12400496,name:"项羽"},
            {id:12400497,name:"杨七郎"},
            {id:12400498,name:"嘲风"},
        ]
    },
]


let txt = `6401\t英雄之源\t力量修正修值\t200\t耐力修正值\t200\t智力修正值\t200\t敏捷修正值\t200\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t6401\t6401\t6401\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6402\t倚天双娇\t物理攻击修正值\t200\t物理防御修正值\t\t魔法攻击修正值\t200\t魔法防御修正值\t\t冰系攻击修正值\t200\t冰系抗性修正值\t\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6402\t6402\t6402\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6403\t光明之主\t物理攻击修正值\t\t物理防御修正值\t100\t魔法攻击修正值\t\t魔法防御修正值\t100\t冰系攻击修正值\t\t冰系抗性修正值\t100\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6403\t6403\t6403\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6404\t只闻其声\t命中修正值\t2\t闪避修正值\t2\t会心修正值\t2\t韧性修正值\t1\t暴击伤害修正值\t4\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6404\t6404\t6404\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6405\t草原儿女\t命中修正值\t4\t闪避修正值\t4\t会心修正值\t4\t韧性修正值\t2\t暴击伤害修正值\t6\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6405\t6405\t6405\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6406\t浪子探花\t力量修正修值\t300\t耐力修正值\t300\t智力修正值\t300\t敏捷修正值\t300\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t6406\t6406\t6406\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6407\t草原神箭\t物理攻击修正值\t300\t物理防御修正值\t\t魔法攻击修正值\t300\t魔法防御修正值\t\t冰系攻击修正值\t300\t冰系抗性修正值\t\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6407\t6407\t6407\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6408\t牛家村殇\t物理攻击修正值\t\t物理防御修正值\t150\t魔法攻击修正值\t\t魔法防御修正值\t150\t冰系攻击修正值\t\t冰系抗性修正值\t150\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6408\t6408\t6408\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6409\t两大射手\t命中修正值\t3\t闪避修正值\t3\t会心修正值\t3\t韧性修正值\t2\t暴击伤害修正值\t6\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6409\t6409\t6409\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6410\t蒙古四俊\t命中修正值\t5\t闪避修正值\t5\t会心修正值\t5\t韧性修正值\t3\t暴击伤害修正值\t8\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6410\t6410\t6410\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6411\t黑风双煞\t力量修正修值\t400\t耐力修正值\t400\t智力修正值\t400\t敏捷修正值\t400\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t6411\t6411\t6411\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6412\t金轮师徒\t物理攻击修正值\t400\t物理防御修正值\t\t魔法攻击修正值\t400\t魔法防御修正值\t\t冰系攻击修正值\t400\t冰系抗性修正值\t\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6412\t6412\t6412\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6413\t爱恨情仇\t物理攻击修正值\t\t物理防御修正值\t200\t魔法攻击修正值\t\t魔法防御修正值\t200\t冰系攻击修正值\t\t冰系抗性修正值\t200\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6413\t6413\t6413\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6414\t阴差阳错\t命中修正值\t4\t闪避修正值\t4\t会心修正值\t4\t韧性修正值\t3\t暴击伤害修正值\t8\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6414\t6414\t6414\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6415\t千古奇缘\t命中修正值\t6\t闪避修正值\t6\t会心修正值\t6\t韧性修正值\t4\t暴击伤害修正值\t10\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6415\t6415\t6415\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6416\t四大鬼差\t力量修正修值\t500\t耐力修正值\t500\t智力修正值\t500\t敏捷修正值\t500\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t6416\t6416\t6416\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6417\t五子良将\t物理攻击修正值\t500\t物理防御修正值\t\t魔法攻击修正值\t500\t魔法防御修正值\t\t冰系攻击修正值\t500\t冰系抗性修正值\t\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6417\t6417\t6417\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6418\t奸邪当道\t物理攻击修正值\t\t物理防御修正值\t250\t魔法攻击修正值\t\t魔法防御修正值\t250\t冰系攻击修正值\t\t冰系抗性修正值\t250\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6418\t6418\t6418\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6419\t筝蓉岁月\t命中修正值\t5\t闪避修正值\t5\t会心修正值\t5\t韧性修正值\t4\t暴击伤害修正值\t10\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6419\t6419\t6419\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6420\t神雕侠侣\t命中修正值\t7\t闪避修正值\t7\t会心修正值\t7\t韧性修正值\t5\t暴击伤害修正值\t12\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6420\t6420\t6420\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6421\t明察秋毫\t力量修正修值\t600\t耐力修正值\t600\t智力修正值\t600\t敏捷修正值\t600\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t6421\t6421\t6421\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6422\t四大美女\t物理攻击修正值\t600\t物理防御修正值\t\t魔法攻击修正值\t600\t魔法防御修正值\t\t冰系攻击修正值\t600\t冰系抗性修正值\t\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6422\t6422\t6422\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6423\t四大金刚\t物理攻击修正值\t\t物理防御修正值\t300\t魔法攻击修正值\t\t魔法防御修正值\t300\t冰系攻击修正值\t\t冰系抗性修正值\t300\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6423\t6423\t6423\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6424\t运筹帷幄\t命中修正值\t6\t闪避修正值\t6\t会心修正值\t6\t韧性修正值\t5\t暴击伤害修正值\t12\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6424\t6424\t6424\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6425\t盖世无双\t命中修正值\t8\t闪避修正值\t8\t会心修正值\t8\t韧性修正值\t6\t暴击伤害修正值\t14\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6425\t6425\t6425\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6426\t帝王之家\t力量修正修值\t700\t耐力修正值\t700\t智力修正值\t700\t敏捷修正值\t700\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t6426\t6426\t6426\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6427\t八仙过海\t物理攻击修正值\t700\t物理防御修正值\t\t魔法攻击修正值\t700\t魔法防御修正值\t\t冰系攻击修正值\t700\t冰系抗性修正值\t\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6427\t6427\t6427\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6428\t四大恶人\t物理攻击修正值\t\t物理防御修正值\t350\t魔法攻击修正值\t\t魔法防御修正值\t350\t冰系攻击修正值\t\t冰系抗性修正值\t350\t火系攻击修正值\t\t火系抗性修正值\t\t电系攻击修正值\t\t电系抗性修正值\t\t毒系攻击修正值\t\t毒系抗性修正值\t\tMAX_HP修正值\t\tMAX_MP修正值\t\tMAX_RAGE修正值\t\tMAX_STRIKE_POINT修正值\t\t\t11\tSTD_IMPACT_003\t1\t6428\t6428\t6428\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6429\t六案功曹\t命中修正值\t9\t闪避修正值\t9\t会心修正值\t9\t韧性修正值\t6\t暴击伤害修正值\t14\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6429\t6429\t6429\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6430\t酆都六部\t命中修正值\t10\t闪避修正值\t10\t会心修正值\t10\t韧性修正值\t7\t暴击伤害修正值\t16\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6430\t6430\t6430\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6431\t万寿无僵\t命中修正值\t11\t闪避修正值\t11\t会心修正值\t11\t韧性修正值\t8\t暴击伤害修正值\t18\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6431\t6431\t6431\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
6432\t降魔伏鬼\t命中修正值\t12\t闪避修正值\t12\t会心修正值\t12\t韧性修正值\t9\t暴击伤害修正值\t20\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t13\tSTD_IMPACT_042\t1\t6432\t6432\t6432\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t
`





let reslogic = ``;
let resdesc = ""
let reslua = ""
let index = 1;
let buffID = 5251;
let needid = 12400422
let needname = "橙色鬼帅"
let neednum = 100

let need = [
    {id:12400418,name:"低级鬼兵",num:500},
    {id:12400419,name:"精锐鬼兵",num:400},
    {id:12400420,name:"紫色鬼将",num:300},
    {id:12400421,name:"橙色鬼将",num:200},
    {id:12400422,name:"橙色鬼帅",num:100},
]

let initID = 12400499
let minlevel = 100
for (let i = 0; i < arr.length; i++) {
    let item = arr[i]
    let buffs = ""
    for (let j = 0; j < item.maxLevel; j++) {
        let v = item.initValue+j*item.perValue
        switch (item.template) {
        case 1://全属性
            reslogic += `${buffID}\t${item.name}\t力量修正修值\t${v}\t耐力修正值\t${v}\t智力修正值\t${v}\t敏捷修正值\t${v}\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t15\tSTD_IMPACT_016\t1\t${buffID}\t${buffID}\t${buffID}\t1\t1\t0\t1\t0\t0\t0\t0\t0\t0\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t\n`
            if(j>0){
                let needitem = need[Math.floor((j-1)/2)]
                let needid = needitem.id
                let needname = needitem.name
                let neednum = needitem.num
                buffs += `{id=${buffID},needid = ${needid},needname = "${needname}", neednum = ${neednum},desc="#Y全属性+${v}",bufftype="全属性",buffvalue=${v}},\n`
            }else {
                buffs += `{id=${buffID},desc="#Y全属性+${v}",bufftype="全属性",buffvalue=${v}},\n`
            }

            break
        case 2://全攻击
            reslogic += `${buffID}	${item.name}	物理攻击修正值	${v}	物理防御修正值		魔法攻击修正值	${v}	魔法防御修正值		冰系攻击修正值	${v}	冰系抗性修正值		火系攻击修正值		火系抗性修正值		电系攻击修正值		电系抗性修正值		毒系攻击修正值		毒系抗性修正值		MAX_HP修正值		MAX_MP修正值		MAX_RAGE修正值		MAX_STRIKE_POINT修正值			11	STD_IMPACT_003	1	${buffID}	${buffID}	${buffID}	1	1	0	1	0	0	0	0	0	0	-1	0	0	0	-1	0	0				-1\n`
            if(j>0){
                let needitem = need[Math.floor((j-1)/2)]
                let needid = needitem.id
                let needname = needitem.name
                let neednum = needitem.num
                buffs += `{id=${buffID},needid = ${needid},needname = "${needname}", neednum = ${neednum},desc="#Y全攻击+${v}",bufftype="全攻击",buffvalue=${v}},\n`
            }else {
                buffs += `{id=${buffID},desc="#Y全攻击+${v}",bufftype="全攻击",buffvalue=${v}},\n`
            }
            break
        case 3://全防御
            reslogic += `${buffID}	${item.name}	物理攻击修正值		物理防御修正值	${v}	魔法攻击修正值		魔法防御修正值	${v}	冰系攻击修正值		冰系抗性修正值	${v}	火系攻击修正值		火系抗性修正值		电系攻击修正值		电系抗性修正值		毒系攻击修正值		毒系抗性修正值		MAX_HP修正值		MAX_MP修正值		MAX_RAGE修正值		MAX_STRIKE_POINT修正值			11	STD_IMPACT_003	1	${buffID}	${buffID}	${buffID}	1	1	0	1	0	0	0	0	0	0	-1	0	0	0	-1	0	0				-1	\n`
            if(j>0){
                let needitem = need[Math.floor((j-1)/2)]
                let needid = needitem.id
                let needname = needitem.name
                let neednum = needitem.num
                buffs += `{id=${buffID},needid = ${needid},needname = "${needname}", neednum = ${neednum},desc="#Y全防御+${v}",bufftype="全防御",buffvalue=${v}},\n`
            }else {
                buffs += `{id=${buffID},desc="#Y全防御+${v}",bufftype="全防御",buffvalue=${v}},\n`
            }
            break
        case 4://暴击
            reslogic += `${buffID}	${item.name}	命中修正值	${v}	闪避修正值	${v}	会心修正值	${v}	韧性修正值	${v}	暴击伤害修正值	${v}																								13	STD_IMPACT_042	1	${buffID}	${buffID}	${buffID}	1	1	0	1	0	0	0	0	0	0	-1	0	0	0	-1	0	0				-1\n`
            if(j>0){
                let needitem = need[Math.floor((j-1)/2)]
                let needid = needitem.id
                let needname = needitem.name
                let neednum = needitem.num
                buffs += `{id=${buffID},needid = ${needid},needname = "${needname}", neednum = ${neednum},desc="#Y暴韧闪命伤+${v}",bufftype="暴韧闪命伤",buffvalue=${v}},\n`
            }else {
                buffs += `{id=${buffID},desc="#Y暴韧闪命伤+${v}",bufftype="暴韧闪命伤",buffvalue=${v}},\n`
            }
            break
        }
        buffID++
    }

    let needstr = ""
    for (let k = 0; k < item.need.length;k++){
        needstr += `{id=${item.need[k].id},name="${item.need[k].name}"},\n`
    }

    reslua += `\t{index=${i+1},name="#R${item.name}",level=${minlevel+i}, targetid=${initID+i},need={
        ${needstr}
    },buff={
        ${buffs}
    }},\n`

}
// console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_buff_logic.txt', reslogic, 'utf8');
// fs.writeFileSync('gen_buff_desc.txt', resdesc, 'utf8');
fs.writeFileSync('gen_buff_lua.txt', reslua, 'utf8');
