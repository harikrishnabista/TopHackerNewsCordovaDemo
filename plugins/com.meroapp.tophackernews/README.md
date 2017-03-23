# Cordova TopHackerNews Plugin

iOS cordova plugin which provides top 20 famous hacker news. 

## Using

Create a new Cordova Project

    $ cordova create hello com.meroapp.sampleapp Hello
    
Install the plugin

    $ cd hello
    $ cordova plugin add https://github.com/harikrishnabista/TopHackerNews.git

Install iOS or Android platform

    cordova platform add ios

Javascript to call module
place this code inside onDeviceReady to test

            var successCallback = function  (msg) {
                alert(msg);
            };
            
            var errorCallback = function () {
                alert("fail to call echo funciton");
            };
            
            cordova.exec(successCallback, errorCallback, "TopHackerNews", "showHackerNews", [""]);    
    
Run the code

    cordova run ios 

## More Info

For more information on setting up Cordova see [the documentation](https://github.com/harikrishnabista/TopHackerNews)
For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html)
Contact author through harikrista@gmail.com.
