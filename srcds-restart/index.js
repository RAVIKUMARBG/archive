var srcds = require("srcds-info");
var exec = require("child_process").exec;

client = srcds("127.0.0.1",27015,{
    timeout: 2000
});

var errCount = 0;
setInterval(function() {
    client.info(function(err,info) {
        if(!err && info) {
            errCount = 0;
        }
        else {
            errCount++;

            if(errCount > 3) {
                exec("./gmodserver stop",function(a,b,c) {
                    exec("./gmodserver restart");
                });
            }
        }
    });
},2500);
