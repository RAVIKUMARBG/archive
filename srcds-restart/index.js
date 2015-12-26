var srcds = require("srcds-info");
var exec = require("child_process").exec;

var errCount = 0;
setInterval(function() {
    client = srcds("www.swadical.net",27015,{
        timeout: 9500
    }).info(function(err,info) {
        console.log(err,info);
        if(!err && info) {
            errCount = 0;
        }
        else {
            errCount++;

            if(errCount == 3) {
                console.log("Restarted");
                setTimeout(function() {
                    errCount = 0;
                },45000);

                exec("./gmodserver stop",function(a,b,c) {
                    exec("./gmodserver restart");
                });
            }
        }
    });
},10000);
