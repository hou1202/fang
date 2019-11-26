<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi" />
    <title>一只迷途的羔羊</title>


    <script>
        /*IOS  禁用屏幕放大*/
        window.onload = function() {
            // 阻止双击放大
            var lastTouchEnd = 0;
            document.addEventListener('touchstart', function(event) {
                if (event.touches.length > 1) {
                    event.preventDefault();
                }
            });
            document.addEventListener('touchend', function(event) {
                var now = (new Date()).getTime();
                if (now - lastTouchEnd <= 300) {
                    event.preventDefault();
                }
                lastTouchEnd = now;
            }, false);

            // 阻止双指放大
            document.addEventListener('gesturestart', function(event) {
                event.preventDefault();
            });
        }
    </script>
    <style>
        /* Base */
        body {
            color: #333;
            font: 16px Verdana, "Helvetica Neue", helvetica, Arial, 'Microsoft YaHei', sans-serif;
            margin: 0;
            padding: 0 20px 20px;
        }
        h1{
            margin: 10px 0 0;
            font-size: 28px;
            font-weight: 500;
            line-height: 32px;
        }
        h2{
            color: #4288ce;
            font-weight: 400;
            padding: 6px 0;
            margin: 6px 0 0;
            font-size: 18px;
            border-bottom: 1px solid #eee;
        }
        h3{
            margin: 12px;
            font-size: 16px;
            font-weight: bold;
        }
        abbr{
            cursor: help;
            text-decoration: underline;
            text-decoration-style: dotted;
        }
        a{
            color: #868686;
            cursor: pointer;
        }
        a:hover{
            text-decoration: underline;
        }
        .header{
            margin-top:100px;
            width:100%;
            height:100px;
            text-align:center;
        }
        .header p{
            line-height:100px;
            font-size:26px;
            color:rgba(75,177,166,0.8)
        }
        .content{
            border-top:1px #4bb1a6 solid;
        }
        .content p{
            color: #858585;
            text-align:center;
            margin-top:20px;
        }
        .back{
            text-align:center;
            margin-top:50px;
        }
        .back a{
            display:inline-block;
            background: rgba(75,177,166,0.5);
            text-align:center;
            width:130px;
            height:35px;
            line-height:35px;
            color:#fff;
            font-size:14px;
            border-radius:5px;
            text-decoration: none;

        }
        a:hover{
            background: #4bb1a6;
            font-weight:800;
        }
    </style>

</head>
<body>
    <div class="header">
        <p>迷途的羔羊</p>
    </div>
    <div class="content">
        <p>一只走在迷途中的羔羊，忘却了回家的路~~~</p>
    </div>
    <div class="back">
        <a href="javascript:history.go(-1);">指引回家路-></a>
    </div>
</body>
</html>
