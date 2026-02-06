

const total = 20
const init = 20
const delta = 20
let str1 = "被动技能#r#cF9BA11永久增加近攻防御%d点"
let str2 = `被动技能#r#cF9BA11永久增加远攻防御%d点`
let str3 = `被动技能#r#cF9BA11永久增加魔攻防御%d点`
let str4 = `被动技能#r#cF9BA11永久增加体质%d点`
let str5 = `被动技能#r#cF9BA11永久增加力量%d点`
let str6 = `被动技能#r#cF9BA11永久增加敏捷%d点`
let str7 = `被动技能#r#cF9BA11永久增加智力%d点`
let str8 = `被动技能#r#cF9BA11永久增加生命值%d点`

let arr = [
    {
        total,
        init:40,
        delta: 40,
        str: str1,
    },
    {
        total,
        init:40,
        delta: 40,
        str: str2,
    },
    {
        total,
        init:40,
        delta: 40,
        str: str3,
    },
    {
        total,
        init:100,
        delta: 100,
        str: str4,
    },
    {
        total,
        init:100,
        delta: 100,
        str: str5,
    },
    {
        total,
        init:100,
        delta: 100,
        str: str6,
    },
    {
        total,
        init:100,
        delta: 100,
        str: str7,
    },
    {
        total,
        init:600,
        delta: 600,
        str: str8,
    },
]


for(let i = 0; i < arr.length; i++) {
    let str = [];
    let item = arr[i]
    for(let j = 0; j < item.total; j++) {
        let val = item.init + item.delta*j
        str.push(item.str.replace(/%d/g, val+""))
    }
    console.log(str.join("|")+"|")
}