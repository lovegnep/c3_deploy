const fs = require('fs');
const iconv = require('iconv-lite');


let txt =`30420\t增加经验获得2%\t领取经验的倍数\t2\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t78\tSTD_IMPACT_0078\t1\t30420\t30420\t30420\t1\t1\t0\t0\t0\t0\t0\t0\t0\t1\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t`



let reslogic = ``;
let resdesc = ""
let reslua = ""
let index = 1;
let buffID = 2240;
let needid = 12400422
let needname = "橙色鬼帅"
let neednum = 100
let num = 100

let initID = 12400499
let minlevel = 100
let jy = 0
for (let i = 0; i < num; i++) {
    let v = i+1
    let needjy = Math.floor(v*30.5)
    reslogic += `${buffID}\t增加经验获得${v}%\t领取经验的倍数\t${v}\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t78\tSTD_IMPACT_0078\t1\t${buffID}\t${buffID}\t${buffID}\t1\t1\t0\t0\t0\t0\t0\t0\t0\t1\t-1\t0\t0\t0\t-1\t0\t0\t\t\t\t-1\t\n`
    resdesc += `${buffID}\t${buffID}\t9\t1\tCJSH_item_mys_4_1\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t经验获得增加${v}%\t1\t经验获得增加${v}%\n`
    reslua += `{index=${v},level=${needjy},buffID=${buffID},buffDesc="经验获得增加${v}%"},\n`

    buffID++
}
// console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_buff_logic.txt', reslogic, 'utf8');
fs.writeFileSync('gen_buff_desc.txt', resdesc, 'utf8');
fs.writeFileSync('gen_buff_lua.txt', reslua, 'utf8');
