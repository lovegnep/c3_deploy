//该 脚本作用，获取所有的纯净的神话级xxx
const _ = require('lodash');
const fs = require("fs");

const iconv = require('iconv-lite');

const filePath = '../../../MAP/Share/Config/gem_info.tab';

// 读取文件（以 buffer 形式再转码为 GB2312）
const buffer = fs.readFileSync(filePath);
const content = iconv.decode(buffer, 'gb2312');

// 按行拆分
const lines = content.split(/\r?\n/);


let arr = [];
lines.forEach(line => {
    let eles = line.split('\t')
    if (eles.length <= 6) {
        return
    }
    let name = eles[7];
    let id = eles[0];
    if (name.startsWith("纯净的神话级")) {
        arr.push({id,name,num:70})
    }
    if (name.startsWith("精致的神话级")) {
        arr.push({id,name,num:80})
    }
})


let res = []
arr.forEach(obj => {
    res.push(`{id=${obj.id},name="${obj.name}",num=${obj.num}}`)
})


fs.writeFileSync('index.txt', res.join(",\n"), 'utf8');
