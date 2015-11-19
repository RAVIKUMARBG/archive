var dir = require('node-dir');
var luamin = require('luamin');
var fs = require('fs');

var built = "--LuaBuild v1.1.1";
var buffer = "";
var startDir = __dirname + "/src";
var destination = __dirname + "/build/main.lua";

console.log("Starting LuaBuild...")

fs.writeFileSync(destination, built + "\n");

dir.readFiles(startDir,{
    match: /.lua$/,
    exclude: /^\./
},
function(err, content, filename, next) {
    if (err) throw err;
    var fname = filename.match(/^.*\\(\w+)\.lua$/i)[1];
    console.log("Minifying", filename.replace(__dirname,""));
    try {
        buffer = "cookie.LH_" + fname + "=[[" + luamin.minify(content) + "]]";
    }
    catch(err) {
        buffer = "--" + err.message;
        console.log("Unable to compile " + filename.replace(__dirname,"") + "!")
        console.log(err.message);
    }

    built = built + "\n\n--" + filename.replace(__dirname,"") + "\n" + buffer;

    fs.writeFileSync(destination, built + "\n");

    next();
});
