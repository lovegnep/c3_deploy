const fs = require('fs');
const iconv = require('iconv-lite');

const filePath = './horse_jichu.tab';

// 读取文件（以 buffer 形式再转码为 GB2312）
const buffer = fs.readFileSync(filePath);
const content = iconv.decode(buffer, 'gb2312');

// 按行拆分
const lines = content.split(/\r?\n/);

// 存放符合条件的马
const result = [];
let nameMap = {}
let typeMap = {}
for (const line of lines) {
    if (!line.trim()) continue; // 跳过空行

    const cols = line.split('\t');
    if (cols.length < 5) continue; // 跳过无效行

    const id = parseInt(cols[0], 10);
    const name = cols[4].trim();
    const type = cols[5].trim();
    //携带等级
    let level = parseInt(cols[7].trim());

    if (isNaN(id) || !name) continue;

    if(id > 1008 && id <= 1588) {
        // continue;
    }

    // 筛选逻辑
    if (id <= 1060 && name.startsWith('五代')) {//10~100级普通马
        if (!nameMap[name]) {
            result.push({ id, name:name+"・黑",sort:0,level });
            nameMap[name] = true
            typeMap[type] = true
        }

    } else if (((id >= 1213 && id <= 1260) ||(id >= 1321 && id <= 1332)  ||(id >= 1345 && id <= 1368)  ||(id >= 1391 && id <= 1474)||(id >= 1487 && id <= 1558)||(id >= 1571 && id <= 1594)) && name.startsWith('二代')) {//迷你
        result.push({ id, name ,sort:1,level:120});
        typeMap[type] = true
    }else if (id >= 2301 && id <= 2750 && name.startsWith('三代')) {//30~70 3f马
        if (!typeMap[type]) {
            result.push({ id, name ,sort:1,level});
            typeMap[type] = true
        }

    } else if (id >= 3701 && id <= 3750 && name.startsWith('三代')) {//80 3f马
        if (!typeMap[type]) {
            result.push({ id, name ,sort:1,level});
            typeMap[type] = true
        }
    } else if (id >= 4001 && id <= 4050 && name.startsWith('三代')) {//95 3f马
        if (!typeMap[type]) {
            result.push({ id, name ,sort:1,level});
            typeMap[type] = true
        }
    }   else if (((id >= 3600&&id<=3639) || (id >= 3751&&id<=3770) || (id >= 3801&&id<=4000) || (id >= 4051&&id<=4182) || (id >= 5001&&id<=5100)|| (id >= 5161&&id<=5210)|| (id >= 5221&&id<=5430)|| (id >= 5461&&id<=5999)) && name.startsWith('二代')){//其它异马
        if (!typeMap[type]) {
            result.push({ id, name ,sort:1,level:100});
            typeMap[type] = true
        }
    }
}

// 按 id 升序排列
result.sort((a, b) => a.level - b.level);

// 输出结果
console.log(`筛选结果（共 ${result.length} 匹马）:\n`);
let res = ``;
let index = 1;
let buffID = 22710;
for (const { id, name } of result) {
    let v = (index-1)*100 + 100
    res += `${buffID}	${buffID}	9	1	CJSH_Monster_touxiang_11_8			人物身体前置点			人物头部绑定点	1	0	0	0						图鉴${index}激活：全攻击+${v}全防御+${v}	1	图鉴${index}激活：全攻击+${v}全防御+${v}	\n`
    index++;
    buffID++
}
console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_up_tujian_buff_desc.txt', res, 'utf8');
