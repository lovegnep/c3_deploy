//生成物种对应的所有id
const fs = require('fs');
const iconv = require('iconv-lite');

const filePath = '../../../MAP/Share/Config/horse_jichu.tab';

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

    if (!typeMap[type]) {
        typeMap[type] = []
    }
    typeMap[type].push(id)
}

// 输出结果
let res = ``;
let types = Object.keys(typeMap)
for (let i = 0; i < types.length;i++) {
    let t = types[i]
    let ids = typeMap[t]
    res += `[${t}]={${ids.join(",")}},\n`
}
console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_up_tujian_type.txt', res, 'utf8');
