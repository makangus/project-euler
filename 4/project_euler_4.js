/*
* Usage: http://127.0.0.1:3000/palindrome/[number of digits]/[number of digits] 
*/

var util = require('util'),
    http = require('http');

// include node-validator https://github.com/chriso/node-validator
var check = require('validator').check,
    sanitize = require('validator').sanitize;

// reverse a string
String.prototype.reverse = function() {
    return this.split("").reverse().join("");
}

var op = {
    palindrome: function(x, y) {
        var result = 0;
        var x_min = Math.pow(10, x - 1),
        x_max = Math.pow(10, x),
        y_min = Math.pow(10, y - 1),
        y_max = Math.pow(10, y);

        for (i = x_min; i < x_max; i++) {
            for (j = y_min; j < y_max; j++) {
                number = i * j;
                number_string = "" + number;
                number_reversed = number_string.reverse();
                if (number_string == number_reversed && number > result) {
                    result = number;
                }
            }
        }

        return (result > 0) ? result: "No Palindrome";
    }
}

http.createServer(function(req, res) {
    var args = req.url.split("/");
    var action = args[1];
    x = sanitize(args[2]).toInt(),
    y = sanitize(args[3]).toInt();

    try {
        check(x).isInt();
        check(y).isInt();
        if (x < 1 || y < 1) {
            throw new Error("[number of digits] cannot be 0");
        }
        result = "" + op[action](x, y);
    } catch(e) {
        // catch favicon.ico request and invalid request parameters
        result = e.message;
    }

    res.writeHead(200, {
        'Content-Type': 'text/plain'
    });
    res.end(result);
}).listen(3000, "127.0.0.1");
